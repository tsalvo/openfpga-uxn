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
-- BIN_OP_EQ[uxn_opcodes_h_l1394_c6_a760]
signal BIN_OP_EQ_uxn_opcodes_h_l1394_c6_a760_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1394_c6_a760_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1394_c6_a760_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1394_c2_0417]
signal t16_MUX_uxn_opcodes_h_l1394_c2_0417_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1394_c2_0417_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1394_c2_0417_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1394_c2_0417_return_output : unsigned(15 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1394_c2_0417]
signal tmp8_MUX_uxn_opcodes_h_l1394_c2_0417_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1394_c2_0417_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1394_c2_0417_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1394_c2_0417_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1394_c2_0417]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_0417_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_0417_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_0417_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_0417_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1394_c2_0417]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_0417_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_0417_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_0417_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_0417_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1394_c2_0417]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_0417_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_0417_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_0417_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_0417_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1394_c2_0417]
signal result_u8_value_MUX_uxn_opcodes_h_l1394_c2_0417_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1394_c2_0417_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1394_c2_0417_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1394_c2_0417_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1394_c2_0417]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_0417_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_0417_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_0417_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_0417_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1394_c2_0417]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_0417_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_0417_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_0417_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_0417_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1394_c2_0417]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_0417_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_0417_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_0417_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_0417_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1394_c2_0417]
signal result_u16_value_MUX_uxn_opcodes_h_l1394_c2_0417_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1394_c2_0417_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1394_c2_0417_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1394_c2_0417_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1394_c2_0417]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_0417_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_0417_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_0417_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_0417_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1394_c2_0417]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_0417_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_0417_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_0417_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_0417_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1407_c11_14e4]
signal BIN_OP_EQ_uxn_opcodes_h_l1407_c11_14e4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1407_c11_14e4_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1407_c11_14e4_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1407_c7_874a]
signal t16_MUX_uxn_opcodes_h_l1407_c7_874a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1407_c7_874a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1407_c7_874a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1407_c7_874a_return_output : unsigned(15 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1407_c7_874a]
signal tmp8_MUX_uxn_opcodes_h_l1407_c7_874a_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1407_c7_874a_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1407_c7_874a_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1407_c7_874a_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1407_c7_874a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_874a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_874a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_874a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_874a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1407_c7_874a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_874a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_874a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_874a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_874a_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1407_c7_874a]
signal result_u8_value_MUX_uxn_opcodes_h_l1407_c7_874a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1407_c7_874a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1407_c7_874a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1407_c7_874a_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1407_c7_874a]
signal result_u16_value_MUX_uxn_opcodes_h_l1407_c7_874a_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1407_c7_874a_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1407_c7_874a_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1407_c7_874a_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1407_c7_874a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_874a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_874a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_874a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_874a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1407_c7_874a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_874a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_874a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_874a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_874a_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1410_c11_0789]
signal BIN_OP_EQ_uxn_opcodes_h_l1410_c11_0789_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1410_c11_0789_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1410_c11_0789_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1410_c7_0ffe]
signal t16_MUX_uxn_opcodes_h_l1410_c7_0ffe_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1410_c7_0ffe_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1410_c7_0ffe_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1410_c7_0ffe_return_output : unsigned(15 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1410_c7_0ffe]
signal tmp8_MUX_uxn_opcodes_h_l1410_c7_0ffe_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1410_c7_0ffe_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1410_c7_0ffe_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1410_c7_0ffe_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1410_c7_0ffe]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_0ffe_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_0ffe_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_0ffe_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_0ffe_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1410_c7_0ffe]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_0ffe_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_0ffe_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_0ffe_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_0ffe_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1410_c7_0ffe]
signal result_u8_value_MUX_uxn_opcodes_h_l1410_c7_0ffe_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1410_c7_0ffe_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1410_c7_0ffe_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1410_c7_0ffe_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1410_c7_0ffe]
signal result_u16_value_MUX_uxn_opcodes_h_l1410_c7_0ffe_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1410_c7_0ffe_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1410_c7_0ffe_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1410_c7_0ffe_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1410_c7_0ffe]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_0ffe_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_0ffe_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_0ffe_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_0ffe_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1410_c7_0ffe]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_0ffe_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_0ffe_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_0ffe_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_0ffe_return_output : unsigned(3 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1412_c3_d3fe]
signal CONST_SL_8_uxn_opcodes_h_l1412_c3_d3fe_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1412_c3_d3fe_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1414_c11_f330]
signal BIN_OP_EQ_uxn_opcodes_h_l1414_c11_f330_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1414_c11_f330_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1414_c11_f330_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1414_c7_2464]
signal t16_MUX_uxn_opcodes_h_l1414_c7_2464_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1414_c7_2464_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1414_c7_2464_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1414_c7_2464_return_output : unsigned(15 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1414_c7_2464]
signal tmp8_MUX_uxn_opcodes_h_l1414_c7_2464_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1414_c7_2464_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1414_c7_2464_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1414_c7_2464_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1414_c7_2464]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_2464_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_2464_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_2464_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_2464_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1414_c7_2464]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_2464_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_2464_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_2464_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_2464_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1414_c7_2464]
signal result_u8_value_MUX_uxn_opcodes_h_l1414_c7_2464_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1414_c7_2464_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1414_c7_2464_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1414_c7_2464_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1414_c7_2464]
signal result_u16_value_MUX_uxn_opcodes_h_l1414_c7_2464_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1414_c7_2464_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1414_c7_2464_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1414_c7_2464_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1414_c7_2464]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_2464_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_2464_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_2464_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_2464_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1414_c7_2464]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_2464_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_2464_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_2464_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_2464_return_output : unsigned(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1415_c3_2737]
signal BIN_OP_OR_uxn_opcodes_h_l1415_c3_2737_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1415_c3_2737_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1415_c3_2737_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1416_c30_55c1]
signal sp_relative_shift_uxn_opcodes_h_l1416_c30_55c1_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1416_c30_55c1_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1416_c30_55c1_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1416_c30_55c1_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1419_c11_1682]
signal BIN_OP_EQ_uxn_opcodes_h_l1419_c11_1682_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1419_c11_1682_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1419_c11_1682_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1419_c7_bb42]
signal tmp8_MUX_uxn_opcodes_h_l1419_c7_bb42_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1419_c7_bb42_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1419_c7_bb42_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1419_c7_bb42_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1419_c7_bb42]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_bb42_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_bb42_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_bb42_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_bb42_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1419_c7_bb42]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_bb42_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_bb42_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_bb42_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_bb42_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1419_c7_bb42]
signal result_u8_value_MUX_uxn_opcodes_h_l1419_c7_bb42_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1419_c7_bb42_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1419_c7_bb42_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1419_c7_bb42_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1419_c7_bb42]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_bb42_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_bb42_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_bb42_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_bb42_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1419_c7_bb42]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_bb42_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_bb42_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_bb42_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_bb42_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1422_c11_cf0e]
signal BIN_OP_EQ_uxn_opcodes_h_l1422_c11_cf0e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1422_c11_cf0e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1422_c11_cf0e_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1422_c7_6dca]
signal tmp8_MUX_uxn_opcodes_h_l1422_c7_6dca_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1422_c7_6dca_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1422_c7_6dca_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1422_c7_6dca_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1422_c7_6dca]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_6dca_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_6dca_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_6dca_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_6dca_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1422_c7_6dca]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_6dca_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_6dca_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_6dca_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_6dca_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1422_c7_6dca]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_6dca_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_6dca_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_6dca_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_6dca_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1422_c7_6dca]
signal result_u8_value_MUX_uxn_opcodes_h_l1422_c7_6dca_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1422_c7_6dca_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1422_c7_6dca_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1422_c7_6dca_return_output : unsigned(7 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_1899( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_index_flipped := ref_toks_1;
      base.is_pc_updated := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_vram_write := ref_toks_7;
      base.u16_value := ref_toks_8;
      base.is_ram_write := ref_toks_9;
      base.stack_address_sp_offset := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1394_c6_a760
BIN_OP_EQ_uxn_opcodes_h_l1394_c6_a760 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1394_c6_a760_left,
BIN_OP_EQ_uxn_opcodes_h_l1394_c6_a760_right,
BIN_OP_EQ_uxn_opcodes_h_l1394_c6_a760_return_output);

-- t16_MUX_uxn_opcodes_h_l1394_c2_0417
t16_MUX_uxn_opcodes_h_l1394_c2_0417 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1394_c2_0417_cond,
t16_MUX_uxn_opcodes_h_l1394_c2_0417_iftrue,
t16_MUX_uxn_opcodes_h_l1394_c2_0417_iffalse,
t16_MUX_uxn_opcodes_h_l1394_c2_0417_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1394_c2_0417
tmp8_MUX_uxn_opcodes_h_l1394_c2_0417 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1394_c2_0417_cond,
tmp8_MUX_uxn_opcodes_h_l1394_c2_0417_iftrue,
tmp8_MUX_uxn_opcodes_h_l1394_c2_0417_iffalse,
tmp8_MUX_uxn_opcodes_h_l1394_c2_0417_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_0417
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_0417 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_0417_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_0417_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_0417_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_0417_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_0417
result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_0417 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_0417_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_0417_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_0417_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_0417_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_0417
result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_0417 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_0417_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_0417_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_0417_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_0417_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1394_c2_0417
result_u8_value_MUX_uxn_opcodes_h_l1394_c2_0417 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1394_c2_0417_cond,
result_u8_value_MUX_uxn_opcodes_h_l1394_c2_0417_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1394_c2_0417_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1394_c2_0417_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_0417
result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_0417 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_0417_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_0417_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_0417_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_0417_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_0417
result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_0417 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_0417_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_0417_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_0417_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_0417_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_0417
result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_0417 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_0417_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_0417_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_0417_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_0417_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1394_c2_0417
result_u16_value_MUX_uxn_opcodes_h_l1394_c2_0417 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1394_c2_0417_cond,
result_u16_value_MUX_uxn_opcodes_h_l1394_c2_0417_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1394_c2_0417_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1394_c2_0417_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_0417
result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_0417 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_0417_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_0417_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_0417_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_0417_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_0417
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_0417 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_0417_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_0417_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_0417_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_0417_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1407_c11_14e4
BIN_OP_EQ_uxn_opcodes_h_l1407_c11_14e4 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1407_c11_14e4_left,
BIN_OP_EQ_uxn_opcodes_h_l1407_c11_14e4_right,
BIN_OP_EQ_uxn_opcodes_h_l1407_c11_14e4_return_output);

-- t16_MUX_uxn_opcodes_h_l1407_c7_874a
t16_MUX_uxn_opcodes_h_l1407_c7_874a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1407_c7_874a_cond,
t16_MUX_uxn_opcodes_h_l1407_c7_874a_iftrue,
t16_MUX_uxn_opcodes_h_l1407_c7_874a_iffalse,
t16_MUX_uxn_opcodes_h_l1407_c7_874a_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1407_c7_874a
tmp8_MUX_uxn_opcodes_h_l1407_c7_874a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1407_c7_874a_cond,
tmp8_MUX_uxn_opcodes_h_l1407_c7_874a_iftrue,
tmp8_MUX_uxn_opcodes_h_l1407_c7_874a_iffalse,
tmp8_MUX_uxn_opcodes_h_l1407_c7_874a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_874a
result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_874a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_874a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_874a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_874a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_874a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_874a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_874a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_874a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_874a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_874a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_874a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1407_c7_874a
result_u8_value_MUX_uxn_opcodes_h_l1407_c7_874a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1407_c7_874a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1407_c7_874a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1407_c7_874a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1407_c7_874a_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1407_c7_874a
result_u16_value_MUX_uxn_opcodes_h_l1407_c7_874a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1407_c7_874a_cond,
result_u16_value_MUX_uxn_opcodes_h_l1407_c7_874a_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1407_c7_874a_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1407_c7_874a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_874a
result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_874a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_874a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_874a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_874a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_874a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_874a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_874a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_874a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_874a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_874a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_874a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1410_c11_0789
BIN_OP_EQ_uxn_opcodes_h_l1410_c11_0789 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1410_c11_0789_left,
BIN_OP_EQ_uxn_opcodes_h_l1410_c11_0789_right,
BIN_OP_EQ_uxn_opcodes_h_l1410_c11_0789_return_output);

-- t16_MUX_uxn_opcodes_h_l1410_c7_0ffe
t16_MUX_uxn_opcodes_h_l1410_c7_0ffe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1410_c7_0ffe_cond,
t16_MUX_uxn_opcodes_h_l1410_c7_0ffe_iftrue,
t16_MUX_uxn_opcodes_h_l1410_c7_0ffe_iffalse,
t16_MUX_uxn_opcodes_h_l1410_c7_0ffe_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1410_c7_0ffe
tmp8_MUX_uxn_opcodes_h_l1410_c7_0ffe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1410_c7_0ffe_cond,
tmp8_MUX_uxn_opcodes_h_l1410_c7_0ffe_iftrue,
tmp8_MUX_uxn_opcodes_h_l1410_c7_0ffe_iffalse,
tmp8_MUX_uxn_opcodes_h_l1410_c7_0ffe_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_0ffe
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_0ffe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_0ffe_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_0ffe_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_0ffe_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_0ffe_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_0ffe
result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_0ffe : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_0ffe_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_0ffe_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_0ffe_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_0ffe_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1410_c7_0ffe
result_u8_value_MUX_uxn_opcodes_h_l1410_c7_0ffe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1410_c7_0ffe_cond,
result_u8_value_MUX_uxn_opcodes_h_l1410_c7_0ffe_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1410_c7_0ffe_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1410_c7_0ffe_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1410_c7_0ffe
result_u16_value_MUX_uxn_opcodes_h_l1410_c7_0ffe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1410_c7_0ffe_cond,
result_u16_value_MUX_uxn_opcodes_h_l1410_c7_0ffe_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1410_c7_0ffe_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1410_c7_0ffe_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_0ffe
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_0ffe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_0ffe_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_0ffe_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_0ffe_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_0ffe_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_0ffe
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_0ffe : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_0ffe_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_0ffe_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_0ffe_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_0ffe_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1412_c3_d3fe
CONST_SL_8_uxn_opcodes_h_l1412_c3_d3fe : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1412_c3_d3fe_x,
CONST_SL_8_uxn_opcodes_h_l1412_c3_d3fe_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1414_c11_f330
BIN_OP_EQ_uxn_opcodes_h_l1414_c11_f330 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1414_c11_f330_left,
BIN_OP_EQ_uxn_opcodes_h_l1414_c11_f330_right,
BIN_OP_EQ_uxn_opcodes_h_l1414_c11_f330_return_output);

-- t16_MUX_uxn_opcodes_h_l1414_c7_2464
t16_MUX_uxn_opcodes_h_l1414_c7_2464 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1414_c7_2464_cond,
t16_MUX_uxn_opcodes_h_l1414_c7_2464_iftrue,
t16_MUX_uxn_opcodes_h_l1414_c7_2464_iffalse,
t16_MUX_uxn_opcodes_h_l1414_c7_2464_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1414_c7_2464
tmp8_MUX_uxn_opcodes_h_l1414_c7_2464 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1414_c7_2464_cond,
tmp8_MUX_uxn_opcodes_h_l1414_c7_2464_iftrue,
tmp8_MUX_uxn_opcodes_h_l1414_c7_2464_iffalse,
tmp8_MUX_uxn_opcodes_h_l1414_c7_2464_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_2464
result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_2464 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_2464_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_2464_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_2464_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_2464_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_2464
result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_2464 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_2464_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_2464_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_2464_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_2464_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1414_c7_2464
result_u8_value_MUX_uxn_opcodes_h_l1414_c7_2464 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1414_c7_2464_cond,
result_u8_value_MUX_uxn_opcodes_h_l1414_c7_2464_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1414_c7_2464_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1414_c7_2464_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1414_c7_2464
result_u16_value_MUX_uxn_opcodes_h_l1414_c7_2464 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1414_c7_2464_cond,
result_u16_value_MUX_uxn_opcodes_h_l1414_c7_2464_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1414_c7_2464_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1414_c7_2464_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_2464
result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_2464 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_2464_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_2464_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_2464_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_2464_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_2464
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_2464 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_2464_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_2464_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_2464_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_2464_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1415_c3_2737
BIN_OP_OR_uxn_opcodes_h_l1415_c3_2737 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1415_c3_2737_left,
BIN_OP_OR_uxn_opcodes_h_l1415_c3_2737_right,
BIN_OP_OR_uxn_opcodes_h_l1415_c3_2737_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1416_c30_55c1
sp_relative_shift_uxn_opcodes_h_l1416_c30_55c1 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1416_c30_55c1_ins,
sp_relative_shift_uxn_opcodes_h_l1416_c30_55c1_x,
sp_relative_shift_uxn_opcodes_h_l1416_c30_55c1_y,
sp_relative_shift_uxn_opcodes_h_l1416_c30_55c1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1419_c11_1682
BIN_OP_EQ_uxn_opcodes_h_l1419_c11_1682 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1419_c11_1682_left,
BIN_OP_EQ_uxn_opcodes_h_l1419_c11_1682_right,
BIN_OP_EQ_uxn_opcodes_h_l1419_c11_1682_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1419_c7_bb42
tmp8_MUX_uxn_opcodes_h_l1419_c7_bb42 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1419_c7_bb42_cond,
tmp8_MUX_uxn_opcodes_h_l1419_c7_bb42_iftrue,
tmp8_MUX_uxn_opcodes_h_l1419_c7_bb42_iffalse,
tmp8_MUX_uxn_opcodes_h_l1419_c7_bb42_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_bb42
result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_bb42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_bb42_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_bb42_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_bb42_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_bb42_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_bb42
result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_bb42 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_bb42_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_bb42_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_bb42_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_bb42_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1419_c7_bb42
result_u8_value_MUX_uxn_opcodes_h_l1419_c7_bb42 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1419_c7_bb42_cond,
result_u8_value_MUX_uxn_opcodes_h_l1419_c7_bb42_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1419_c7_bb42_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1419_c7_bb42_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_bb42
result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_bb42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_bb42_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_bb42_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_bb42_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_bb42_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_bb42
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_bb42 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_bb42_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_bb42_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_bb42_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_bb42_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1422_c11_cf0e
BIN_OP_EQ_uxn_opcodes_h_l1422_c11_cf0e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1422_c11_cf0e_left,
BIN_OP_EQ_uxn_opcodes_h_l1422_c11_cf0e_right,
BIN_OP_EQ_uxn_opcodes_h_l1422_c11_cf0e_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1422_c7_6dca
tmp8_MUX_uxn_opcodes_h_l1422_c7_6dca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1422_c7_6dca_cond,
tmp8_MUX_uxn_opcodes_h_l1422_c7_6dca_iftrue,
tmp8_MUX_uxn_opcodes_h_l1422_c7_6dca_iffalse,
tmp8_MUX_uxn_opcodes_h_l1422_c7_6dca_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_6dca
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_6dca : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_6dca_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_6dca_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_6dca_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_6dca_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_6dca
result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_6dca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_6dca_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_6dca_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_6dca_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_6dca_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_6dca
result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_6dca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_6dca_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_6dca_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_6dca_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_6dca_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1422_c7_6dca
result_u8_value_MUX_uxn_opcodes_h_l1422_c7_6dca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1422_c7_6dca_cond,
result_u8_value_MUX_uxn_opcodes_h_l1422_c7_6dca_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1422_c7_6dca_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1422_c7_6dca_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1394_c6_a760_return_output,
 t16_MUX_uxn_opcodes_h_l1394_c2_0417_return_output,
 tmp8_MUX_uxn_opcodes_h_l1394_c2_0417_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_0417_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_0417_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_0417_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1394_c2_0417_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_0417_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_0417_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_0417_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1394_c2_0417_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_0417_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_0417_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1407_c11_14e4_return_output,
 t16_MUX_uxn_opcodes_h_l1407_c7_874a_return_output,
 tmp8_MUX_uxn_opcodes_h_l1407_c7_874a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_874a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_874a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1407_c7_874a_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1407_c7_874a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_874a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_874a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1410_c11_0789_return_output,
 t16_MUX_uxn_opcodes_h_l1410_c7_0ffe_return_output,
 tmp8_MUX_uxn_opcodes_h_l1410_c7_0ffe_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_0ffe_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_0ffe_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1410_c7_0ffe_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1410_c7_0ffe_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_0ffe_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_0ffe_return_output,
 CONST_SL_8_uxn_opcodes_h_l1412_c3_d3fe_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1414_c11_f330_return_output,
 t16_MUX_uxn_opcodes_h_l1414_c7_2464_return_output,
 tmp8_MUX_uxn_opcodes_h_l1414_c7_2464_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_2464_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_2464_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1414_c7_2464_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1414_c7_2464_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_2464_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_2464_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1415_c3_2737_return_output,
 sp_relative_shift_uxn_opcodes_h_l1416_c30_55c1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1419_c11_1682_return_output,
 tmp8_MUX_uxn_opcodes_h_l1419_c7_bb42_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_bb42_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_bb42_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1419_c7_bb42_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_bb42_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_bb42_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1422_c11_cf0e_return_output,
 tmp8_MUX_uxn_opcodes_h_l1422_c7_6dca_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_6dca_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_6dca_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_6dca_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1422_c7_6dca_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_a760_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_a760_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_a760_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1394_c2_0417_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1394_c2_0417_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1407_c7_874a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1394_c2_0417_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1394_c2_0417_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1394_c2_0417_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1394_c2_0417_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1407_c7_874a_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1394_c2_0417_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1394_c2_0417_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_0417_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_0417_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1394_c2_0417_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_0417_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_0417_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_0417_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_0417_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1394_c2_0417_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_0417_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_0417_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_0417_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_0417_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_874a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_0417_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_0417_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1394_c2_0417_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1394_c2_0417_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_874a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1394_c2_0417_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1394_c2_0417_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_0417_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_0417_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_874a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_0417_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_0417_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_0417_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1399_c3_df35 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_0417_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_874a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_0417_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_0417_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_0417_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_0417_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1394_c2_0417_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_0417_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_0417_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1394_c2_0417_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1394_c2_0417_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1407_c7_874a_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1394_c2_0417_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1394_c2_0417_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_0417_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_0417_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1394_c2_0417_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_0417_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_0417_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_0417_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1404_c3_8e65 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_0417_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_874a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_0417_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_0417_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_14e4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_14e4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_14e4_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1407_c7_874a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1407_c7_874a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1410_c7_0ffe_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1407_c7_874a_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1407_c7_874a_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1407_c7_874a_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1410_c7_0ffe_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1407_c7_874a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_874a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_874a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_0ffe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_874a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_874a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_874a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_0ffe_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_874a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_874a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_874a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_0ffe_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_874a_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1407_c7_874a_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1407_c7_874a_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_0ffe_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1407_c7_874a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_874a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_874a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_0ffe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_874a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_874a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1408_c3_c0a6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_874a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_0ffe_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_874a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_0789_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_0789_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_0789_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1410_c7_0ffe_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1410_c7_0ffe_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1414_c7_2464_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1410_c7_0ffe_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1410_c7_0ffe_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1410_c7_0ffe_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1414_c7_2464_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1410_c7_0ffe_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_0ffe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_0ffe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_2464_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_0ffe_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_0ffe_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_0ffe_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_2464_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_0ffe_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_0ffe_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_0ffe_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1414_c7_2464_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_0ffe_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_0ffe_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_0ffe_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1414_c7_2464_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_0ffe_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_0ffe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_0ffe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_2464_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_0ffe_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_0ffe_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_0ffe_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_2464_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_0ffe_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1412_c3_d3fe_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1412_c3_d3fe_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_f330_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_f330_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_f330_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1414_c7_2464_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1414_c7_2464_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1414_c7_2464_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1414_c7_2464_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1414_c7_2464_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1419_c7_bb42_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1414_c7_2464_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_2464_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_2464_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_bb42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_2464_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_2464_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_2464_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_bb42_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_2464_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1414_c7_2464_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1414_c7_2464_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_bb42_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1414_c7_2464_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1414_c7_2464_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1414_c7_2464_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1414_c7_2464_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_2464_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_2464_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_bb42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_2464_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_2464_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_2464_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_bb42_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_2464_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1415_c3_2737_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1415_c3_2737_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1415_c3_2737_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_55c1_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_55c1_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_55c1_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_55c1_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_1682_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_1682_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_1682_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1419_c7_bb42_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1419_c7_bb42_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1422_c7_6dca_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1419_c7_bb42_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_bb42_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_bb42_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_6dca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_bb42_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_bb42_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1420_c3_d56e : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_bb42_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_bb42_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_bb42_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_bb42_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1422_c7_6dca_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_bb42_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_bb42_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_bb42_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_6dca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_bb42_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_bb42_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_bb42_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_6dca_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_bb42_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_cf0e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_cf0e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_cf0e_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1422_c7_6dca_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1422_c7_6dca_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1422_c7_6dca_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_6dca_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1425_c3_63ad : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_6dca_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_6dca_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_6dca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_6dca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_6dca_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_6dca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_6dca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_6dca_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1422_c7_6dca_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1422_c7_6dca_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1422_c7_6dca_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1407_l1394_l1422_l1419_l1414_l1410_DUPLICATE_d024_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1394_l1414_l1407_l1410_DUPLICATE_c4c9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1407_l1422_l1419_l1414_l1410_DUPLICATE_ddbf_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1407_l1419_l1410_DUPLICATE_eecf_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1407_l1422_l1419_l1414_l1410_DUPLICATE_7867_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1415_l1411_DUPLICATE_65ea_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1422_l1414_l1419_l1410_DUPLICATE_deb9_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1899_uxn_opcodes_h_l1430_l1389_DUPLICATE_728f_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_0417_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_a760_right := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_0417_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_55c1_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_55c1_y := resize(to_signed(-1, 2), 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_0417_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_0417_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_6dca_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_0417_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_0417_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_6dca_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1420_c3_d56e := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_bb42_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1420_c3_d56e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_cf0e_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_f330_right := to_unsigned(3, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1399_c3_df35 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_0417_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1399_c3_df35;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1404_c3_8e65 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_0417_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1404_c3_8e65;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_1682_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_0789_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1425_c3_63ad := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_6dca_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1425_c3_63ad;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_14e4_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1408_c3_c0a6 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_874a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1408_c3_c0a6;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_55c1_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_a760_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_14e4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_0789_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_f330_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_1682_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_cf0e_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1422_c7_6dca_iftrue := VAR_previous_ram_read;
     VAR_tmp8_MUX_uxn_opcodes_h_l1422_c7_6dca_iftrue := VAR_previous_ram_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1415_c3_2737_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1394_c2_0417_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1407_c7_874a_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1414_c7_2464_iffalse := t16;
     VAR_tmp8_MUX_uxn_opcodes_h_l1394_c2_0417_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1407_c7_874a_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1410_c7_0ffe_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1414_c7_2464_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1419_c7_bb42_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1422_c7_6dca_iffalse := tmp8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1407_l1422_l1419_l1414_l1410_DUPLICATE_7867 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1407_l1422_l1419_l1414_l1410_DUPLICATE_7867_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1407_l1422_l1419_l1414_l1410_DUPLICATE_ddbf LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1407_l1422_l1419_l1414_l1410_DUPLICATE_ddbf_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1422_c11_cf0e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1422_c11_cf0e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_cf0e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1422_c11_cf0e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_cf0e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_cf0e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1422_c11_cf0e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1414_c11_f330] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1414_c11_f330_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_f330_left;
     BIN_OP_EQ_uxn_opcodes_h_l1414_c11_f330_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_f330_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_f330_return_output := BIN_OP_EQ_uxn_opcodes_h_l1414_c11_f330_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1394_c2_0417] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1394_c2_0417_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1394_c6_a760] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1394_c6_a760_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_a760_left;
     BIN_OP_EQ_uxn_opcodes_h_l1394_c6_a760_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_a760_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_a760_return_output := BIN_OP_EQ_uxn_opcodes_h_l1394_c6_a760_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1394_c2_0417] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1394_c2_0417_return_output := result.is_pc_updated;

     -- sp_relative_shift[uxn_opcodes_h_l1416_c30_55c1] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1416_c30_55c1_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_55c1_ins;
     sp_relative_shift_uxn_opcodes_h_l1416_c30_55c1_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_55c1_x;
     sp_relative_shift_uxn_opcodes_h_l1416_c30_55c1_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_55c1_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_55c1_return_output := sp_relative_shift_uxn_opcodes_h_l1416_c30_55c1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1410_c11_0789] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1410_c11_0789_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_0789_left;
     BIN_OP_EQ_uxn_opcodes_h_l1410_c11_0789_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_0789_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_0789_return_output := BIN_OP_EQ_uxn_opcodes_h_l1410_c11_0789_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1394_c2_0417] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1394_c2_0417_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1407_l1394_l1422_l1419_l1414_l1410_DUPLICATE_d024 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1407_l1394_l1422_l1419_l1414_l1410_DUPLICATE_d024_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1407_c11_14e4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1407_c11_14e4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_14e4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1407_c11_14e4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_14e4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_14e4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1407_c11_14e4_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1422_l1414_l1419_l1410_DUPLICATE_deb9 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1422_l1414_l1419_l1410_DUPLICATE_deb9_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1407_l1419_l1410_DUPLICATE_eecf LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1407_l1419_l1410_DUPLICATE_eecf_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1394_l1414_l1407_l1410_DUPLICATE_c4c9 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1394_l1414_l1407_l1410_DUPLICATE_c4c9_return_output := result.u16_value;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1415_l1411_DUPLICATE_65ea LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1415_l1411_DUPLICATE_65ea_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1394_c2_0417] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1394_c2_0417_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l1419_c11_1682] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1419_c11_1682_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_1682_left;
     BIN_OP_EQ_uxn_opcodes_h_l1419_c11_1682_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_1682_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_1682_return_output := BIN_OP_EQ_uxn_opcodes_h_l1419_c11_1682_return_output;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_0417_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_a760_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_0417_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_a760_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_0417_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_a760_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_0417_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_a760_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_0417_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_a760_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_0417_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_a760_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_0417_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_a760_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_0417_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_a760_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1394_c2_0417_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_a760_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1394_c2_0417_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_a760_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1394_c2_0417_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_a760_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1394_c2_0417_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_a760_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_874a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_14e4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_874a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_14e4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_874a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_14e4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_874a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_14e4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1407_c7_874a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_14e4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_874a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_14e4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1407_c7_874a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_14e4_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1407_c7_874a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_14e4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_0ffe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_0789_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_0ffe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_0789_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_0ffe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_0789_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_0ffe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_0789_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_0ffe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_0789_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_0ffe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_0789_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1410_c7_0ffe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_0789_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1410_c7_0ffe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_0789_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_2464_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_f330_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_2464_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_f330_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_2464_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_f330_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_2464_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_f330_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1414_c7_2464_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_f330_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1414_c7_2464_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_f330_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1414_c7_2464_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_f330_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1414_c7_2464_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_f330_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_bb42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_1682_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_bb42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_1682_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_bb42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_1682_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_bb42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_1682_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_bb42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_1682_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1419_c7_bb42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_1682_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_6dca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_cf0e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_6dca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_cf0e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_6dca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_cf0e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1422_c7_6dca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_cf0e_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1422_c7_6dca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_cf0e_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1415_c3_2737_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1415_l1411_DUPLICATE_65ea_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1412_c3_d3fe_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1415_l1411_DUPLICATE_65ea_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_874a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1407_l1419_l1410_DUPLICATE_eecf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_0ffe_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1407_l1419_l1410_DUPLICATE_eecf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_bb42_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1407_l1419_l1410_DUPLICATE_eecf_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1394_c2_0417_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1394_l1414_l1407_l1410_DUPLICATE_c4c9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1407_c7_874a_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1394_l1414_l1407_l1410_DUPLICATE_c4c9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_0ffe_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1394_l1414_l1407_l1410_DUPLICATE_c4c9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1414_c7_2464_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1394_l1414_l1407_l1410_DUPLICATE_c4c9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_874a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1407_l1422_l1419_l1414_l1410_DUPLICATE_7867_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_0ffe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1407_l1422_l1419_l1414_l1410_DUPLICATE_7867_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_2464_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1407_l1422_l1419_l1414_l1410_DUPLICATE_7867_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_bb42_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1407_l1422_l1419_l1414_l1410_DUPLICATE_7867_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_6dca_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1407_l1422_l1419_l1414_l1410_DUPLICATE_7867_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_874a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1407_l1422_l1419_l1414_l1410_DUPLICATE_ddbf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_0ffe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1407_l1422_l1419_l1414_l1410_DUPLICATE_ddbf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_2464_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1407_l1422_l1419_l1414_l1410_DUPLICATE_ddbf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_bb42_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1407_l1422_l1419_l1414_l1410_DUPLICATE_ddbf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_6dca_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1407_l1422_l1419_l1414_l1410_DUPLICATE_ddbf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_0ffe_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1422_l1414_l1419_l1410_DUPLICATE_deb9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_2464_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1422_l1414_l1419_l1410_DUPLICATE_deb9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_bb42_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1422_l1414_l1419_l1410_DUPLICATE_deb9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_6dca_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1422_l1414_l1419_l1410_DUPLICATE_deb9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1394_c2_0417_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1407_l1394_l1422_l1419_l1414_l1410_DUPLICATE_d024_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_874a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1407_l1394_l1422_l1419_l1414_l1410_DUPLICATE_d024_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_0ffe_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1407_l1394_l1422_l1419_l1414_l1410_DUPLICATE_d024_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1414_c7_2464_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1407_l1394_l1422_l1419_l1414_l1410_DUPLICATE_d024_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_bb42_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1407_l1394_l1422_l1419_l1414_l1410_DUPLICATE_d024_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1422_c7_6dca_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1407_l1394_l1422_l1419_l1414_l1410_DUPLICATE_d024_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_0417_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1394_c2_0417_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_0417_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1394_c2_0417_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_0417_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1394_c2_0417_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_0417_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1394_c2_0417_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_2464_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_55c1_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l1415_c3_2737] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1415_c3_2737_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1415_c3_2737_left;
     BIN_OP_OR_uxn_opcodes_h_l1415_c3_2737_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1415_c3_2737_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1415_c3_2737_return_output := BIN_OP_OR_uxn_opcodes_h_l1415_c3_2737_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1419_c7_bb42] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_bb42_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_bb42_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_bb42_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_bb42_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_bb42_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_bb42_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_bb42_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_bb42_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1394_c2_0417] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_0417_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_0417_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_0417_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_0417_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_0417_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_0417_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_0417_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_0417_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1422_c7_6dca] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_6dca_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_6dca_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_6dca_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_6dca_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_6dca_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_6dca_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_6dca_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_6dca_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1412_c3_d3fe] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1412_c3_d3fe_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1412_c3_d3fe_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1412_c3_d3fe_return_output := CONST_SL_8_uxn_opcodes_h_l1412_c3_d3fe_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1422_c7_6dca] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1422_c7_6dca_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1422_c7_6dca_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1422_c7_6dca_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1422_c7_6dca_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1422_c7_6dca_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1422_c7_6dca_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1422_c7_6dca_return_output := result_u8_value_MUX_uxn_opcodes_h_l1422_c7_6dca_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1394_c2_0417] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_0417_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_0417_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_0417_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_0417_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_0417_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_0417_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_0417_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_0417_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1394_c2_0417] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_0417_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_0417_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_0417_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_0417_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_0417_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_0417_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_0417_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_0417_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1394_c2_0417] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_0417_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_0417_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_0417_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_0417_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_0417_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_0417_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_0417_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_0417_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1422_c7_6dca] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_6dca_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_6dca_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_6dca_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_6dca_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_6dca_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_6dca_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_6dca_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_6dca_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1422_c7_6dca] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_6dca_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_6dca_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_6dca_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_6dca_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_6dca_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_6dca_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_6dca_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_6dca_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1422_c7_6dca] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1422_c7_6dca_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1422_c7_6dca_cond;
     tmp8_MUX_uxn_opcodes_h_l1422_c7_6dca_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1422_c7_6dca_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1422_c7_6dca_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1422_c7_6dca_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1422_c7_6dca_return_output := tmp8_MUX_uxn_opcodes_h_l1422_c7_6dca_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1414_c7_2464_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1415_c3_2737_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1414_c7_2464_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1415_c3_2737_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1410_c7_0ffe_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1412_c3_d3fe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_bb42_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_6dca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_bb42_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_6dca_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_2464_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_bb42_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_bb42_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_6dca_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_bb42_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1422_c7_6dca_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1419_c7_bb42_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1422_c7_6dca_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1419_c7_bb42] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1419_c7_bb42_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_bb42_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1419_c7_bb42_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_bb42_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1419_c7_bb42_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_bb42_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_bb42_return_output := result_u8_value_MUX_uxn_opcodes_h_l1419_c7_bb42_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1419_c7_bb42] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_bb42_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_bb42_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_bb42_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_bb42_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_bb42_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_bb42_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_bb42_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_bb42_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1419_c7_bb42] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_bb42_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_bb42_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_bb42_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_bb42_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_bb42_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_bb42_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_bb42_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_bb42_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1419_c7_bb42] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1419_c7_bb42_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1419_c7_bb42_cond;
     tmp8_MUX_uxn_opcodes_h_l1419_c7_bb42_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1419_c7_bb42_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1419_c7_bb42_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1419_c7_bb42_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1419_c7_bb42_return_output := tmp8_MUX_uxn_opcodes_h_l1419_c7_bb42_return_output;

     -- t16_MUX[uxn_opcodes_h_l1414_c7_2464] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1414_c7_2464_cond <= VAR_t16_MUX_uxn_opcodes_h_l1414_c7_2464_cond;
     t16_MUX_uxn_opcodes_h_l1414_c7_2464_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1414_c7_2464_iftrue;
     t16_MUX_uxn_opcodes_h_l1414_c7_2464_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1414_c7_2464_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1414_c7_2464_return_output := t16_MUX_uxn_opcodes_h_l1414_c7_2464_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1414_c7_2464] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1414_c7_2464_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1414_c7_2464_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1414_c7_2464_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1414_c7_2464_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1414_c7_2464_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1414_c7_2464_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1414_c7_2464_return_output := result_u16_value_MUX_uxn_opcodes_h_l1414_c7_2464_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1419_c7_bb42] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_bb42_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_bb42_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_bb42_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_bb42_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_bb42_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_bb42_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_bb42_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_bb42_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1414_c7_2464] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_2464_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_2464_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_2464_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_2464_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_2464_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_2464_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_2464_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_2464_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_2464_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_bb42_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_2464_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_bb42_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_0ffe_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_2464_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_2464_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_bb42_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_0ffe_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1414_c7_2464_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1414_c7_2464_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_bb42_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1410_c7_0ffe_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1414_c7_2464_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1414_c7_2464_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1419_c7_bb42_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1414_c7_2464] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_2464_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_2464_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_2464_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_2464_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_2464_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_2464_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_2464_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_2464_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1414_c7_2464] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_2464_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_2464_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_2464_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_2464_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_2464_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_2464_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_2464_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_2464_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1414_c7_2464] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_2464_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_2464_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_2464_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_2464_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_2464_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_2464_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_2464_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_2464_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1410_c7_0ffe] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_0ffe_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_0ffe_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_0ffe_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_0ffe_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_0ffe_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_0ffe_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_0ffe_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_0ffe_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1414_c7_2464] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1414_c7_2464_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1414_c7_2464_cond;
     tmp8_MUX_uxn_opcodes_h_l1414_c7_2464_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1414_c7_2464_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1414_c7_2464_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1414_c7_2464_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1414_c7_2464_return_output := tmp8_MUX_uxn_opcodes_h_l1414_c7_2464_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1414_c7_2464] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1414_c7_2464_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1414_c7_2464_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1414_c7_2464_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1414_c7_2464_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1414_c7_2464_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1414_c7_2464_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1414_c7_2464_return_output := result_u8_value_MUX_uxn_opcodes_h_l1414_c7_2464_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1410_c7_0ffe] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1410_c7_0ffe_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_0ffe_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1410_c7_0ffe_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_0ffe_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1410_c7_0ffe_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_0ffe_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_0ffe_return_output := result_u16_value_MUX_uxn_opcodes_h_l1410_c7_0ffe_return_output;

     -- t16_MUX[uxn_opcodes_h_l1410_c7_0ffe] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1410_c7_0ffe_cond <= VAR_t16_MUX_uxn_opcodes_h_l1410_c7_0ffe_cond;
     t16_MUX_uxn_opcodes_h_l1410_c7_0ffe_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1410_c7_0ffe_iftrue;
     t16_MUX_uxn_opcodes_h_l1410_c7_0ffe_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1410_c7_0ffe_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1410_c7_0ffe_return_output := t16_MUX_uxn_opcodes_h_l1410_c7_0ffe_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_0ffe_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_2464_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_0ffe_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_2464_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_874a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_0ffe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_0ffe_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_2464_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1407_c7_874a_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_0ffe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_0ffe_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1414_c7_2464_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1407_c7_874a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1410_c7_0ffe_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1410_c7_0ffe_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1414_c7_2464_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1410_c7_0ffe] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1410_c7_0ffe_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_0ffe_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1410_c7_0ffe_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_0ffe_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1410_c7_0ffe_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_0ffe_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_0ffe_return_output := result_u8_value_MUX_uxn_opcodes_h_l1410_c7_0ffe_return_output;

     -- t16_MUX[uxn_opcodes_h_l1407_c7_874a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1407_c7_874a_cond <= VAR_t16_MUX_uxn_opcodes_h_l1407_c7_874a_cond;
     t16_MUX_uxn_opcodes_h_l1407_c7_874a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1407_c7_874a_iftrue;
     t16_MUX_uxn_opcodes_h_l1407_c7_874a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1407_c7_874a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1407_c7_874a_return_output := t16_MUX_uxn_opcodes_h_l1407_c7_874a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1410_c7_0ffe] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_0ffe_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_0ffe_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_0ffe_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_0ffe_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_0ffe_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_0ffe_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_0ffe_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_0ffe_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1410_c7_0ffe] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_0ffe_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_0ffe_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_0ffe_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_0ffe_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_0ffe_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_0ffe_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_0ffe_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_0ffe_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1407_c7_874a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_874a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_874a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_874a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_874a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_874a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_874a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_874a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_874a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1410_c7_0ffe] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_0ffe_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_0ffe_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_0ffe_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_0ffe_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_0ffe_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_0ffe_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_0ffe_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_0ffe_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1407_c7_874a] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1407_c7_874a_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1407_c7_874a_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1407_c7_874a_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1407_c7_874a_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1407_c7_874a_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1407_c7_874a_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1407_c7_874a_return_output := result_u16_value_MUX_uxn_opcodes_h_l1407_c7_874a_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1410_c7_0ffe] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1410_c7_0ffe_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1410_c7_0ffe_cond;
     tmp8_MUX_uxn_opcodes_h_l1410_c7_0ffe_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1410_c7_0ffe_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1410_c7_0ffe_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1410_c7_0ffe_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1410_c7_0ffe_return_output := tmp8_MUX_uxn_opcodes_h_l1410_c7_0ffe_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_874a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_0ffe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_874a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_0ffe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_0417_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_874a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_874a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_0ffe_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1394_c2_0417_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1407_c7_874a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_874a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_0ffe_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1394_c2_0417_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1407_c7_874a_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1407_c7_874a_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1410_c7_0ffe_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1407_c7_874a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_874a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_874a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_874a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_874a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_874a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_874a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_874a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_874a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1407_c7_874a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_874a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_874a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_874a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_874a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_874a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_874a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_874a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_874a_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1407_c7_874a] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1407_c7_874a_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1407_c7_874a_cond;
     tmp8_MUX_uxn_opcodes_h_l1407_c7_874a_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1407_c7_874a_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1407_c7_874a_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1407_c7_874a_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1407_c7_874a_return_output := tmp8_MUX_uxn_opcodes_h_l1407_c7_874a_return_output;

     -- t16_MUX[uxn_opcodes_h_l1394_c2_0417] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1394_c2_0417_cond <= VAR_t16_MUX_uxn_opcodes_h_l1394_c2_0417_cond;
     t16_MUX_uxn_opcodes_h_l1394_c2_0417_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1394_c2_0417_iftrue;
     t16_MUX_uxn_opcodes_h_l1394_c2_0417_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1394_c2_0417_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1394_c2_0417_return_output := t16_MUX_uxn_opcodes_h_l1394_c2_0417_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1394_c2_0417] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_0417_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_0417_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_0417_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_0417_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_0417_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_0417_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_0417_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_0417_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1407_c7_874a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1407_c7_874a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_874a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1407_c7_874a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_874a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1407_c7_874a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_874a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_874a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1407_c7_874a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1407_c7_874a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_874a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_874a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_874a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_874a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_874a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_874a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_874a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_874a_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1394_c2_0417] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1394_c2_0417_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1394_c2_0417_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1394_c2_0417_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1394_c2_0417_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1394_c2_0417_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1394_c2_0417_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1394_c2_0417_return_output := result_u16_value_MUX_uxn_opcodes_h_l1394_c2_0417_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_0417_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_874a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_0417_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_874a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_0417_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_874a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1394_c2_0417_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_874a_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1394_c2_0417_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1394_c2_0417_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1407_c7_874a_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1394_c2_0417] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_0417_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_0417_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_0417_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_0417_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_0417_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_0417_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_0417_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_0417_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1394_c2_0417] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1394_c2_0417_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1394_c2_0417_cond;
     tmp8_MUX_uxn_opcodes_h_l1394_c2_0417_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1394_c2_0417_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1394_c2_0417_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1394_c2_0417_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1394_c2_0417_return_output := tmp8_MUX_uxn_opcodes_h_l1394_c2_0417_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1394_c2_0417] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1394_c2_0417_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1394_c2_0417_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1394_c2_0417_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1394_c2_0417_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1394_c2_0417_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1394_c2_0417_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1394_c2_0417_return_output := result_u8_value_MUX_uxn_opcodes_h_l1394_c2_0417_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1394_c2_0417] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_0417_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_0417_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_0417_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_0417_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_0417_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_0417_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_0417_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_0417_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1394_c2_0417] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_0417_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_0417_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_0417_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_0417_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_0417_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_0417_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_0417_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_0417_return_output;

     -- Submodule level 7
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_opcodes_h_l1394_c2_0417_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_1899_uxn_opcodes_h_l1430_l1389_DUPLICATE_728f LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1899_uxn_opcodes_h_l1430_l1389_DUPLICATE_728f_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_1899(
     result,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_0417_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_0417_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_0417_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1394_c2_0417_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_0417_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_0417_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_0417_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1394_c2_0417_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_0417_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_0417_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1899_uxn_opcodes_h_l1430_l1389_DUPLICATE_728f_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1899_uxn_opcodes_h_l1430_l1389_DUPLICATE_728f_return_output;
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
