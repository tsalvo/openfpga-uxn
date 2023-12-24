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
-- BIN_OP_EQ[uxn_opcodes_h_l1394_c6_0c03]
signal BIN_OP_EQ_uxn_opcodes_h_l1394_c6_0c03_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1394_c6_0c03_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1394_c6_0c03_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1394_c2_dff3]
signal result_u8_value_MUX_uxn_opcodes_h_l1394_c2_dff3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1394_c2_dff3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1394_c2_dff3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1394_c2_dff3_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1394_c2_dff3]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_dff3_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_dff3_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_dff3_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_dff3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1394_c2_dff3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_dff3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_dff3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_dff3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_dff3_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1394_c2_dff3]
signal result_u16_value_MUX_uxn_opcodes_h_l1394_c2_dff3_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1394_c2_dff3_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1394_c2_dff3_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1394_c2_dff3_return_output : unsigned(15 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1394_c2_dff3]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_dff3_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_dff3_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_dff3_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_dff3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1394_c2_dff3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_dff3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_dff3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_dff3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_dff3_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1394_c2_dff3]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_dff3_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_dff3_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_dff3_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_dff3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1394_c2_dff3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_dff3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_dff3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_dff3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_dff3_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1394_c2_dff3]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_dff3_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_dff3_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_dff3_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_dff3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1394_c2_dff3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_dff3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_dff3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_dff3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_dff3_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1394_c2_dff3]
signal tmp8_MUX_uxn_opcodes_h_l1394_c2_dff3_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1394_c2_dff3_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1394_c2_dff3_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1394_c2_dff3_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1394_c2_dff3]
signal t16_MUX_uxn_opcodes_h_l1394_c2_dff3_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1394_c2_dff3_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1394_c2_dff3_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1394_c2_dff3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1407_c11_1163]
signal BIN_OP_EQ_uxn_opcodes_h_l1407_c11_1163_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1407_c11_1163_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1407_c11_1163_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1407_c7_d7f5]
signal result_u8_value_MUX_uxn_opcodes_h_l1407_c7_d7f5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1407_c7_d7f5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1407_c7_d7f5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1407_c7_d7f5_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1407_c7_d7f5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_d7f5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_d7f5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_d7f5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_d7f5_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1407_c7_d7f5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_d7f5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_d7f5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_d7f5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_d7f5_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1407_c7_d7f5]
signal result_u16_value_MUX_uxn_opcodes_h_l1407_c7_d7f5_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1407_c7_d7f5_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1407_c7_d7f5_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1407_c7_d7f5_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1407_c7_d7f5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_d7f5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_d7f5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_d7f5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_d7f5_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1407_c7_d7f5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_d7f5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_d7f5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_d7f5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_d7f5_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1407_c7_d7f5]
signal tmp8_MUX_uxn_opcodes_h_l1407_c7_d7f5_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1407_c7_d7f5_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1407_c7_d7f5_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1407_c7_d7f5_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1407_c7_d7f5]
signal t16_MUX_uxn_opcodes_h_l1407_c7_d7f5_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1407_c7_d7f5_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1407_c7_d7f5_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1407_c7_d7f5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1410_c11_854a]
signal BIN_OP_EQ_uxn_opcodes_h_l1410_c11_854a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1410_c11_854a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1410_c11_854a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1410_c7_700b]
signal result_u8_value_MUX_uxn_opcodes_h_l1410_c7_700b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1410_c7_700b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1410_c7_700b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1410_c7_700b_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1410_c7_700b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_700b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_700b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_700b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_700b_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1410_c7_700b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_700b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_700b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_700b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_700b_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1410_c7_700b]
signal result_u16_value_MUX_uxn_opcodes_h_l1410_c7_700b_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1410_c7_700b_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1410_c7_700b_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1410_c7_700b_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1410_c7_700b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_700b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_700b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_700b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_700b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1410_c7_700b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_700b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_700b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_700b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_700b_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1410_c7_700b]
signal tmp8_MUX_uxn_opcodes_h_l1410_c7_700b_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1410_c7_700b_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1410_c7_700b_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1410_c7_700b_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1410_c7_700b]
signal t16_MUX_uxn_opcodes_h_l1410_c7_700b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1410_c7_700b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1410_c7_700b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1410_c7_700b_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1412_c3_4002]
signal CONST_SL_8_uxn_opcodes_h_l1412_c3_4002_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1412_c3_4002_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1414_c11_75c5]
signal BIN_OP_EQ_uxn_opcodes_h_l1414_c11_75c5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1414_c11_75c5_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1414_c11_75c5_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1414_c7_b2ed]
signal result_u8_value_MUX_uxn_opcodes_h_l1414_c7_b2ed_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1414_c7_b2ed_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1414_c7_b2ed_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1414_c7_b2ed_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1414_c7_b2ed]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_b2ed_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_b2ed_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_b2ed_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_b2ed_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1414_c7_b2ed]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_b2ed_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_b2ed_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_b2ed_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_b2ed_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1414_c7_b2ed]
signal result_u16_value_MUX_uxn_opcodes_h_l1414_c7_b2ed_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1414_c7_b2ed_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1414_c7_b2ed_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1414_c7_b2ed_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1414_c7_b2ed]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_b2ed_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_b2ed_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_b2ed_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_b2ed_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1414_c7_b2ed]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_b2ed_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_b2ed_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_b2ed_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_b2ed_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1414_c7_b2ed]
signal tmp8_MUX_uxn_opcodes_h_l1414_c7_b2ed_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1414_c7_b2ed_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1414_c7_b2ed_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1414_c7_b2ed_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1414_c7_b2ed]
signal t16_MUX_uxn_opcodes_h_l1414_c7_b2ed_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1414_c7_b2ed_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1414_c7_b2ed_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1414_c7_b2ed_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1415_c3_1234]
signal BIN_OP_OR_uxn_opcodes_h_l1415_c3_1234_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1415_c3_1234_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1415_c3_1234_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1416_c30_8bbf]
signal sp_relative_shift_uxn_opcodes_h_l1416_c30_8bbf_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1416_c30_8bbf_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1416_c30_8bbf_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1416_c30_8bbf_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1419_c11_d95b]
signal BIN_OP_EQ_uxn_opcodes_h_l1419_c11_d95b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1419_c11_d95b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1419_c11_d95b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1419_c7_c69f]
signal result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c69f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c69f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c69f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c69f_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1419_c7_c69f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c69f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c69f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c69f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c69f_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1419_c7_c69f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c69f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c69f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c69f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c69f_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1419_c7_c69f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c69f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c69f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c69f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c69f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1419_c7_c69f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c69f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c69f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c69f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c69f_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1419_c7_c69f]
signal tmp8_MUX_uxn_opcodes_h_l1419_c7_c69f_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1419_c7_c69f_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1419_c7_c69f_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1419_c7_c69f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1422_c11_4fed]
signal BIN_OP_EQ_uxn_opcodes_h_l1422_c11_4fed_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1422_c11_4fed_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1422_c11_4fed_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1422_c7_151a]
signal result_u8_value_MUX_uxn_opcodes_h_l1422_c7_151a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1422_c7_151a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1422_c7_151a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1422_c7_151a_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1422_c7_151a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_151a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_151a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_151a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_151a_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1422_c7_151a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_151a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_151a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_151a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_151a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1422_c7_151a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_151a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_151a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_151a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_151a_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1422_c7_151a]
signal tmp8_MUX_uxn_opcodes_h_l1422_c7_151a_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1422_c7_151a_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1422_c7_151a_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1422_c7_151a_return_output : unsigned(7 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_e482( ref_toks_0 : opcode_result_t;
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
      base.u8_value := ref_toks_1;
      base.is_stack_index_flipped := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.u16_value := ref_toks_4;
      base.is_vram_write := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_pc_updated := ref_toks_7;
      base.is_opc_done := ref_toks_8;
      base.is_ram_write := ref_toks_9;
      base.is_stack_write := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1394_c6_0c03
BIN_OP_EQ_uxn_opcodes_h_l1394_c6_0c03 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1394_c6_0c03_left,
BIN_OP_EQ_uxn_opcodes_h_l1394_c6_0c03_right,
BIN_OP_EQ_uxn_opcodes_h_l1394_c6_0c03_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1394_c2_dff3
result_u8_value_MUX_uxn_opcodes_h_l1394_c2_dff3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1394_c2_dff3_cond,
result_u8_value_MUX_uxn_opcodes_h_l1394_c2_dff3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1394_c2_dff3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1394_c2_dff3_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_dff3
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_dff3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_dff3_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_dff3_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_dff3_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_dff3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_dff3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_dff3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_dff3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_dff3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_dff3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_dff3_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1394_c2_dff3
result_u16_value_MUX_uxn_opcodes_h_l1394_c2_dff3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1394_c2_dff3_cond,
result_u16_value_MUX_uxn_opcodes_h_l1394_c2_dff3_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1394_c2_dff3_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1394_c2_dff3_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_dff3
result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_dff3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_dff3_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_dff3_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_dff3_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_dff3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_dff3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_dff3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_dff3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_dff3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_dff3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_dff3_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_dff3
result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_dff3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_dff3_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_dff3_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_dff3_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_dff3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_dff3
result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_dff3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_dff3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_dff3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_dff3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_dff3_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_dff3
result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_dff3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_dff3_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_dff3_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_dff3_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_dff3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_dff3
result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_dff3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_dff3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_dff3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_dff3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_dff3_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1394_c2_dff3
tmp8_MUX_uxn_opcodes_h_l1394_c2_dff3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1394_c2_dff3_cond,
tmp8_MUX_uxn_opcodes_h_l1394_c2_dff3_iftrue,
tmp8_MUX_uxn_opcodes_h_l1394_c2_dff3_iffalse,
tmp8_MUX_uxn_opcodes_h_l1394_c2_dff3_return_output);

-- t16_MUX_uxn_opcodes_h_l1394_c2_dff3
t16_MUX_uxn_opcodes_h_l1394_c2_dff3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1394_c2_dff3_cond,
t16_MUX_uxn_opcodes_h_l1394_c2_dff3_iftrue,
t16_MUX_uxn_opcodes_h_l1394_c2_dff3_iffalse,
t16_MUX_uxn_opcodes_h_l1394_c2_dff3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1407_c11_1163
BIN_OP_EQ_uxn_opcodes_h_l1407_c11_1163 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1407_c11_1163_left,
BIN_OP_EQ_uxn_opcodes_h_l1407_c11_1163_right,
BIN_OP_EQ_uxn_opcodes_h_l1407_c11_1163_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1407_c7_d7f5
result_u8_value_MUX_uxn_opcodes_h_l1407_c7_d7f5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1407_c7_d7f5_cond,
result_u8_value_MUX_uxn_opcodes_h_l1407_c7_d7f5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1407_c7_d7f5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1407_c7_d7f5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_d7f5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_d7f5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_d7f5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_d7f5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_d7f5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_d7f5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_d7f5
result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_d7f5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_d7f5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_d7f5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_d7f5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_d7f5_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1407_c7_d7f5
result_u16_value_MUX_uxn_opcodes_h_l1407_c7_d7f5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1407_c7_d7f5_cond,
result_u16_value_MUX_uxn_opcodes_h_l1407_c7_d7f5_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1407_c7_d7f5_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1407_c7_d7f5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_d7f5
result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_d7f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_d7f5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_d7f5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_d7f5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_d7f5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_d7f5
result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_d7f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_d7f5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_d7f5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_d7f5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_d7f5_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1407_c7_d7f5
tmp8_MUX_uxn_opcodes_h_l1407_c7_d7f5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1407_c7_d7f5_cond,
tmp8_MUX_uxn_opcodes_h_l1407_c7_d7f5_iftrue,
tmp8_MUX_uxn_opcodes_h_l1407_c7_d7f5_iffalse,
tmp8_MUX_uxn_opcodes_h_l1407_c7_d7f5_return_output);

-- t16_MUX_uxn_opcodes_h_l1407_c7_d7f5
t16_MUX_uxn_opcodes_h_l1407_c7_d7f5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1407_c7_d7f5_cond,
t16_MUX_uxn_opcodes_h_l1407_c7_d7f5_iftrue,
t16_MUX_uxn_opcodes_h_l1407_c7_d7f5_iffalse,
t16_MUX_uxn_opcodes_h_l1407_c7_d7f5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1410_c11_854a
BIN_OP_EQ_uxn_opcodes_h_l1410_c11_854a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1410_c11_854a_left,
BIN_OP_EQ_uxn_opcodes_h_l1410_c11_854a_right,
BIN_OP_EQ_uxn_opcodes_h_l1410_c11_854a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1410_c7_700b
result_u8_value_MUX_uxn_opcodes_h_l1410_c7_700b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1410_c7_700b_cond,
result_u8_value_MUX_uxn_opcodes_h_l1410_c7_700b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1410_c7_700b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1410_c7_700b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_700b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_700b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_700b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_700b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_700b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_700b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_700b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_700b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_700b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_700b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_700b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_700b_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1410_c7_700b
result_u16_value_MUX_uxn_opcodes_h_l1410_c7_700b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1410_c7_700b_cond,
result_u16_value_MUX_uxn_opcodes_h_l1410_c7_700b_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1410_c7_700b_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1410_c7_700b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_700b
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_700b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_700b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_700b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_700b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_700b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_700b
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_700b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_700b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_700b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_700b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_700b_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1410_c7_700b
tmp8_MUX_uxn_opcodes_h_l1410_c7_700b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1410_c7_700b_cond,
tmp8_MUX_uxn_opcodes_h_l1410_c7_700b_iftrue,
tmp8_MUX_uxn_opcodes_h_l1410_c7_700b_iffalse,
tmp8_MUX_uxn_opcodes_h_l1410_c7_700b_return_output);

-- t16_MUX_uxn_opcodes_h_l1410_c7_700b
t16_MUX_uxn_opcodes_h_l1410_c7_700b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1410_c7_700b_cond,
t16_MUX_uxn_opcodes_h_l1410_c7_700b_iftrue,
t16_MUX_uxn_opcodes_h_l1410_c7_700b_iffalse,
t16_MUX_uxn_opcodes_h_l1410_c7_700b_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1412_c3_4002
CONST_SL_8_uxn_opcodes_h_l1412_c3_4002 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1412_c3_4002_x,
CONST_SL_8_uxn_opcodes_h_l1412_c3_4002_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1414_c11_75c5
BIN_OP_EQ_uxn_opcodes_h_l1414_c11_75c5 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1414_c11_75c5_left,
BIN_OP_EQ_uxn_opcodes_h_l1414_c11_75c5_right,
BIN_OP_EQ_uxn_opcodes_h_l1414_c11_75c5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1414_c7_b2ed
result_u8_value_MUX_uxn_opcodes_h_l1414_c7_b2ed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1414_c7_b2ed_cond,
result_u8_value_MUX_uxn_opcodes_h_l1414_c7_b2ed_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1414_c7_b2ed_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1414_c7_b2ed_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_b2ed
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_b2ed : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_b2ed_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_b2ed_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_b2ed_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_b2ed_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_b2ed
result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_b2ed : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_b2ed_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_b2ed_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_b2ed_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_b2ed_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1414_c7_b2ed
result_u16_value_MUX_uxn_opcodes_h_l1414_c7_b2ed : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1414_c7_b2ed_cond,
result_u16_value_MUX_uxn_opcodes_h_l1414_c7_b2ed_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1414_c7_b2ed_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1414_c7_b2ed_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_b2ed
result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_b2ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_b2ed_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_b2ed_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_b2ed_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_b2ed_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_b2ed
result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_b2ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_b2ed_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_b2ed_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_b2ed_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_b2ed_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1414_c7_b2ed
tmp8_MUX_uxn_opcodes_h_l1414_c7_b2ed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1414_c7_b2ed_cond,
tmp8_MUX_uxn_opcodes_h_l1414_c7_b2ed_iftrue,
tmp8_MUX_uxn_opcodes_h_l1414_c7_b2ed_iffalse,
tmp8_MUX_uxn_opcodes_h_l1414_c7_b2ed_return_output);

-- t16_MUX_uxn_opcodes_h_l1414_c7_b2ed
t16_MUX_uxn_opcodes_h_l1414_c7_b2ed : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1414_c7_b2ed_cond,
t16_MUX_uxn_opcodes_h_l1414_c7_b2ed_iftrue,
t16_MUX_uxn_opcodes_h_l1414_c7_b2ed_iffalse,
t16_MUX_uxn_opcodes_h_l1414_c7_b2ed_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1415_c3_1234
BIN_OP_OR_uxn_opcodes_h_l1415_c3_1234 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1415_c3_1234_left,
BIN_OP_OR_uxn_opcodes_h_l1415_c3_1234_right,
BIN_OP_OR_uxn_opcodes_h_l1415_c3_1234_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1416_c30_8bbf
sp_relative_shift_uxn_opcodes_h_l1416_c30_8bbf : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1416_c30_8bbf_ins,
sp_relative_shift_uxn_opcodes_h_l1416_c30_8bbf_x,
sp_relative_shift_uxn_opcodes_h_l1416_c30_8bbf_y,
sp_relative_shift_uxn_opcodes_h_l1416_c30_8bbf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1419_c11_d95b
BIN_OP_EQ_uxn_opcodes_h_l1419_c11_d95b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1419_c11_d95b_left,
BIN_OP_EQ_uxn_opcodes_h_l1419_c11_d95b_right,
BIN_OP_EQ_uxn_opcodes_h_l1419_c11_d95b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c69f
result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c69f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c69f_cond,
result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c69f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c69f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c69f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c69f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c69f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c69f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c69f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c69f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c69f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c69f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c69f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c69f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c69f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c69f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c69f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c69f
result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c69f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c69f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c69f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c69f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c69f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c69f
result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c69f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c69f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c69f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c69f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c69f_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1419_c7_c69f
tmp8_MUX_uxn_opcodes_h_l1419_c7_c69f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1419_c7_c69f_cond,
tmp8_MUX_uxn_opcodes_h_l1419_c7_c69f_iftrue,
tmp8_MUX_uxn_opcodes_h_l1419_c7_c69f_iffalse,
tmp8_MUX_uxn_opcodes_h_l1419_c7_c69f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1422_c11_4fed
BIN_OP_EQ_uxn_opcodes_h_l1422_c11_4fed : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1422_c11_4fed_left,
BIN_OP_EQ_uxn_opcodes_h_l1422_c11_4fed_right,
BIN_OP_EQ_uxn_opcodes_h_l1422_c11_4fed_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1422_c7_151a
result_u8_value_MUX_uxn_opcodes_h_l1422_c7_151a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1422_c7_151a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1422_c7_151a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1422_c7_151a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1422_c7_151a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_151a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_151a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_151a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_151a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_151a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_151a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_151a
result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_151a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_151a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_151a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_151a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_151a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_151a
result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_151a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_151a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_151a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_151a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_151a_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1422_c7_151a
tmp8_MUX_uxn_opcodes_h_l1422_c7_151a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1422_c7_151a_cond,
tmp8_MUX_uxn_opcodes_h_l1422_c7_151a_iftrue,
tmp8_MUX_uxn_opcodes_h_l1422_c7_151a_iffalse,
tmp8_MUX_uxn_opcodes_h_l1422_c7_151a_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1394_c6_0c03_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1394_c2_dff3_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_dff3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_dff3_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1394_c2_dff3_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_dff3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_dff3_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_dff3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_dff3_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_dff3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_dff3_return_output,
 tmp8_MUX_uxn_opcodes_h_l1394_c2_dff3_return_output,
 t16_MUX_uxn_opcodes_h_l1394_c2_dff3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1407_c11_1163_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1407_c7_d7f5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_d7f5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_d7f5_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1407_c7_d7f5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_d7f5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_d7f5_return_output,
 tmp8_MUX_uxn_opcodes_h_l1407_c7_d7f5_return_output,
 t16_MUX_uxn_opcodes_h_l1407_c7_d7f5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1410_c11_854a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1410_c7_700b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_700b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_700b_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1410_c7_700b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_700b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_700b_return_output,
 tmp8_MUX_uxn_opcodes_h_l1410_c7_700b_return_output,
 t16_MUX_uxn_opcodes_h_l1410_c7_700b_return_output,
 CONST_SL_8_uxn_opcodes_h_l1412_c3_4002_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1414_c11_75c5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1414_c7_b2ed_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_b2ed_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_b2ed_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1414_c7_b2ed_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_b2ed_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_b2ed_return_output,
 tmp8_MUX_uxn_opcodes_h_l1414_c7_b2ed_return_output,
 t16_MUX_uxn_opcodes_h_l1414_c7_b2ed_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1415_c3_1234_return_output,
 sp_relative_shift_uxn_opcodes_h_l1416_c30_8bbf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1419_c11_d95b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c69f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c69f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c69f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c69f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c69f_return_output,
 tmp8_MUX_uxn_opcodes_h_l1419_c7_c69f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1422_c11_4fed_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1422_c7_151a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_151a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_151a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_151a_return_output,
 tmp8_MUX_uxn_opcodes_h_l1422_c7_151a_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_0c03_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_0c03_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_0c03_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1394_c2_dff3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1394_c2_dff3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_d7f5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1394_c2_dff3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1394_c2_dff3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_dff3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_dff3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1394_c2_dff3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_dff3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_dff3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_dff3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1404_c3_179c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_dff3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_d7f5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_dff3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_dff3_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1394_c2_dff3_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1394_c2_dff3_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1407_c7_d7f5_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1394_c2_dff3_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1394_c2_dff3_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_dff3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_dff3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1394_c2_dff3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_dff3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_dff3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_dff3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1399_c3_5c86 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_dff3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_d7f5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_dff3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_dff3_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_dff3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_dff3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1394_c2_dff3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_dff3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_dff3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_dff3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_dff3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_d7f5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_dff3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_dff3_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_dff3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_dff3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1394_c2_dff3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_dff3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_dff3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_dff3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_dff3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_d7f5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_dff3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_dff3_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1394_c2_dff3_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1394_c2_dff3_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1407_c7_d7f5_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1394_c2_dff3_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1394_c2_dff3_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1394_c2_dff3_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1394_c2_dff3_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1407_c7_d7f5_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1394_c2_dff3_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1394_c2_dff3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_1163_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_1163_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_1163_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_d7f5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_d7f5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_700b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_d7f5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_d7f5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1408_c3_626f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_d7f5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_700b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_d7f5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_d7f5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_d7f5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_700b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_d7f5_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1407_c7_d7f5_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1407_c7_d7f5_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_700b_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1407_c7_d7f5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_d7f5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_d7f5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_700b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_d7f5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_d7f5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_d7f5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_700b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_d7f5_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1407_c7_d7f5_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1407_c7_d7f5_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1410_c7_700b_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1407_c7_d7f5_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1407_c7_d7f5_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1407_c7_d7f5_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1410_c7_700b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1407_c7_d7f5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_854a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_854a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_854a_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_700b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_700b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1414_c7_b2ed_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_700b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_700b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_700b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_b2ed_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_700b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_700b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_700b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_b2ed_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_700b_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_700b_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_700b_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1414_c7_b2ed_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_700b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_700b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_700b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_b2ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_700b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_700b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_700b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_b2ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_700b_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1410_c7_700b_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1410_c7_700b_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1414_c7_b2ed_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1410_c7_700b_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1410_c7_700b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1410_c7_700b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1414_c7_b2ed_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1410_c7_700b_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1412_c3_4002_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1412_c3_4002_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_75c5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_75c5_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_75c5_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1414_c7_b2ed_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1414_c7_b2ed_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c69f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1414_c7_b2ed_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_b2ed_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_b2ed_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c69f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_b2ed_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_b2ed_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_b2ed_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c69f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_b2ed_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1414_c7_b2ed_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1414_c7_b2ed_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1414_c7_b2ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_b2ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_b2ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c69f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_b2ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_b2ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_b2ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c69f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_b2ed_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1414_c7_b2ed_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1414_c7_b2ed_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1419_c7_c69f_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1414_c7_b2ed_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1414_c7_b2ed_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1414_c7_b2ed_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1414_c7_b2ed_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1415_c3_1234_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1415_c3_1234_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1415_c3_1234_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_8bbf_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_8bbf_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_8bbf_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_8bbf_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_d95b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_d95b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_d95b_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c69f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c69f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1422_c7_151a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c69f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c69f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c69f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_151a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c69f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c69f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1420_c3_9610 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c69f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c69f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c69f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c69f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_151a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c69f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c69f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c69f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_151a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c69f_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1419_c7_c69f_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1419_c7_c69f_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1422_c7_151a_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1419_c7_c69f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_4fed_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_4fed_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_4fed_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1422_c7_151a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1422_c7_151a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1422_c7_151a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_151a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1425_c3_57c8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_151a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_151a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_151a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_151a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_151a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_151a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_151a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_151a_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1422_c7_151a_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1422_c7_151a_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1422_c7_151a_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1414_l1410_l1407_l1394_l1422_l1419_DUPLICATE_2dc3_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1410_l1394_l1414_l1407_DUPLICATE_a5ab_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1410_l1407_l1419_DUPLICATE_ffc3_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1414_l1410_l1407_l1422_l1419_DUPLICATE_b36c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1414_l1410_l1407_l1422_l1419_DUPLICATE_5553_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1415_l1411_DUPLICATE_3f87_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1410_l1422_l1414_l1419_DUPLICATE_bc31_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e482_uxn_opcodes_h_l1430_l1389_DUPLICATE_a80c_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1425_c3_57c8 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_151a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1425_c3_57c8;
     VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_8bbf_y := resize(to_signed(-1, 2), 4);
     VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_8bbf_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_1163_right := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_dff3_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_dff3_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_854a_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1408_c3_626f := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_d7f5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1408_c3_626f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_75c5_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_4fed_right := to_unsigned(5, 3);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_dff3_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_151a_iftrue := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_dff3_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_0c03_right := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1399_c3_5c86 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_dff3_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1399_c3_5c86;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1420_c3_9610 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c69f_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1420_c3_9610;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1404_c3_179c := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_dff3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1404_c3_179c;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_151a_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_dff3_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_dff3_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_d95b_right := to_unsigned(4, 3);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_8bbf_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_0c03_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_1163_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_854a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_75c5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_d95b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_4fed_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1422_c7_151a_iftrue := VAR_previous_ram_read;
     VAR_tmp8_MUX_uxn_opcodes_h_l1422_c7_151a_iftrue := VAR_previous_ram_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1415_c3_1234_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1394_c2_dff3_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1407_c7_d7f5_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1414_c7_b2ed_iffalse := t16;
     VAR_tmp8_MUX_uxn_opcodes_h_l1394_c2_dff3_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1407_c7_d7f5_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1410_c7_700b_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1414_c7_b2ed_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1419_c7_c69f_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1422_c7_151a_iffalse := tmp8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1410_c11_854a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1410_c11_854a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_854a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1410_c11_854a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_854a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_854a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1410_c11_854a_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1414_l1410_l1407_l1394_l1422_l1419_DUPLICATE_2dc3 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1414_l1410_l1407_l1394_l1422_l1419_DUPLICATE_2dc3_return_output := result.u8_value;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1410_l1394_l1414_l1407_DUPLICATE_a5ab LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1410_l1394_l1414_l1407_DUPLICATE_a5ab_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1419_c11_d95b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1419_c11_d95b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_d95b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1419_c11_d95b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_d95b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_d95b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1419_c11_d95b_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1416_c30_8bbf] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1416_c30_8bbf_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_8bbf_ins;
     sp_relative_shift_uxn_opcodes_h_l1416_c30_8bbf_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_8bbf_x;
     sp_relative_shift_uxn_opcodes_h_l1416_c30_8bbf_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_8bbf_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_8bbf_return_output := sp_relative_shift_uxn_opcodes_h_l1416_c30_8bbf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1407_c11_1163] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1407_c11_1163_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_1163_left;
     BIN_OP_EQ_uxn_opcodes_h_l1407_c11_1163_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_1163_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_1163_return_output := BIN_OP_EQ_uxn_opcodes_h_l1407_c11_1163_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1414_l1410_l1407_l1422_l1419_DUPLICATE_b36c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1414_l1410_l1407_l1422_l1419_DUPLICATE_b36c_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1422_c11_4fed] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1422_c11_4fed_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_4fed_left;
     BIN_OP_EQ_uxn_opcodes_h_l1422_c11_4fed_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_4fed_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_4fed_return_output := BIN_OP_EQ_uxn_opcodes_h_l1422_c11_4fed_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1414_l1410_l1407_l1422_l1419_DUPLICATE_5553 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1414_l1410_l1407_l1422_l1419_DUPLICATE_5553_return_output := result.is_stack_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1410_l1407_l1419_DUPLICATE_ffc3 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1410_l1407_l1419_DUPLICATE_ffc3_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1414_c11_75c5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1414_c11_75c5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_75c5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1414_c11_75c5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_75c5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_75c5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1414_c11_75c5_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1394_c2_dff3] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1394_c2_dff3_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1410_l1422_l1414_l1419_DUPLICATE_bc31 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1410_l1422_l1414_l1419_DUPLICATE_bc31_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1394_c6_0c03] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1394_c6_0c03_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_0c03_left;
     BIN_OP_EQ_uxn_opcodes_h_l1394_c6_0c03_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_0c03_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_0c03_return_output := BIN_OP_EQ_uxn_opcodes_h_l1394_c6_0c03_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1394_c2_dff3] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1394_c2_dff3_return_output := result.is_vram_write;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1394_c2_dff3] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1394_c2_dff3_return_output := result.is_pc_updated;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1394_c2_dff3] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1394_c2_dff3_return_output := result.is_ram_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1415_l1411_DUPLICATE_3f87 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1415_l1411_DUPLICATE_3f87_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_dff3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_0c03_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_dff3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_0c03_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_dff3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_0c03_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_dff3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_0c03_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_dff3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_0c03_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_dff3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_0c03_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_dff3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_0c03_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_dff3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_0c03_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1394_c2_dff3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_0c03_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1394_c2_dff3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_0c03_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1394_c2_dff3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_0c03_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1394_c2_dff3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_0c03_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_d7f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_1163_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_d7f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_1163_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_d7f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_1163_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_d7f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_1163_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1407_c7_d7f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_1163_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_d7f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_1163_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1407_c7_d7f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_1163_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1407_c7_d7f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_1163_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_700b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_854a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_700b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_854a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_700b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_854a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_700b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_854a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_700b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_854a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_700b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_854a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1410_c7_700b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_854a_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1410_c7_700b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_854a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_b2ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_75c5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_b2ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_75c5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_b2ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_75c5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_b2ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_75c5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1414_c7_b2ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_75c5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1414_c7_b2ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_75c5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1414_c7_b2ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_75c5_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1414_c7_b2ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_75c5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c69f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_d95b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c69f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_d95b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c69f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_d95b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c69f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_d95b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c69f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_d95b_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1419_c7_c69f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_d95b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_151a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_4fed_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_151a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_4fed_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_151a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_4fed_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1422_c7_151a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_4fed_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1422_c7_151a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_4fed_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1415_c3_1234_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1415_l1411_DUPLICATE_3f87_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1412_c3_4002_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1415_l1411_DUPLICATE_3f87_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_d7f5_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1410_l1407_l1419_DUPLICATE_ffc3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_700b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1410_l1407_l1419_DUPLICATE_ffc3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c69f_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1410_l1407_l1419_DUPLICATE_ffc3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1394_c2_dff3_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1410_l1394_l1414_l1407_DUPLICATE_a5ab_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1407_c7_d7f5_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1410_l1394_l1414_l1407_DUPLICATE_a5ab_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_700b_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1410_l1394_l1414_l1407_DUPLICATE_a5ab_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1414_c7_b2ed_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1410_l1394_l1414_l1407_DUPLICATE_a5ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_d7f5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1414_l1410_l1407_l1422_l1419_DUPLICATE_b36c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_700b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1414_l1410_l1407_l1422_l1419_DUPLICATE_b36c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_b2ed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1414_l1410_l1407_l1422_l1419_DUPLICATE_b36c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c69f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1414_l1410_l1407_l1422_l1419_DUPLICATE_b36c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_151a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1414_l1410_l1407_l1422_l1419_DUPLICATE_b36c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_d7f5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1414_l1410_l1407_l1422_l1419_DUPLICATE_5553_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_700b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1414_l1410_l1407_l1422_l1419_DUPLICATE_5553_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_b2ed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1414_l1410_l1407_l1422_l1419_DUPLICATE_5553_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c69f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1414_l1410_l1407_l1422_l1419_DUPLICATE_5553_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_151a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1414_l1410_l1407_l1422_l1419_DUPLICATE_5553_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_700b_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1410_l1422_l1414_l1419_DUPLICATE_bc31_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_b2ed_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1410_l1422_l1414_l1419_DUPLICATE_bc31_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c69f_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1410_l1422_l1414_l1419_DUPLICATE_bc31_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_151a_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1410_l1422_l1414_l1419_DUPLICATE_bc31_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1394_c2_dff3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1414_l1410_l1407_l1394_l1422_l1419_DUPLICATE_2dc3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_d7f5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1414_l1410_l1407_l1394_l1422_l1419_DUPLICATE_2dc3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_700b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1414_l1410_l1407_l1394_l1422_l1419_DUPLICATE_2dc3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1414_c7_b2ed_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1414_l1410_l1407_l1394_l1422_l1419_DUPLICATE_2dc3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c69f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1414_l1410_l1407_l1394_l1422_l1419_DUPLICATE_2dc3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1422_c7_151a_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1414_l1410_l1407_l1394_l1422_l1419_DUPLICATE_2dc3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_dff3_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1394_c2_dff3_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_dff3_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1394_c2_dff3_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_dff3_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1394_c2_dff3_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_dff3_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1394_c2_dff3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_b2ed_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_8bbf_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1422_c7_151a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1422_c7_151a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1422_c7_151a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1422_c7_151a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1422_c7_151a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1422_c7_151a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1422_c7_151a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1422_c7_151a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1422_c7_151a_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1415_c3_1234] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1415_c3_1234_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1415_c3_1234_left;
     BIN_OP_OR_uxn_opcodes_h_l1415_c3_1234_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1415_c3_1234_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1415_c3_1234_return_output := BIN_OP_OR_uxn_opcodes_h_l1415_c3_1234_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1422_c7_151a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_151a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_151a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_151a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_151a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_151a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_151a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_151a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_151a_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1394_c2_dff3] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_dff3_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_dff3_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_dff3_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_dff3_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_dff3_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_dff3_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_dff3_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_dff3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1422_c7_151a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_151a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_151a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_151a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_151a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_151a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_151a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_151a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_151a_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1394_c2_dff3] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_dff3_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_dff3_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_dff3_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_dff3_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_dff3_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_dff3_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_dff3_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_dff3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1422_c7_151a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_151a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_151a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_151a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_151a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_151a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_151a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_151a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_151a_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1412_c3_4002] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1412_c3_4002_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1412_c3_4002_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1412_c3_4002_return_output := CONST_SL_8_uxn_opcodes_h_l1412_c3_4002_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1422_c7_151a] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1422_c7_151a_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1422_c7_151a_cond;
     tmp8_MUX_uxn_opcodes_h_l1422_c7_151a_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1422_c7_151a_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1422_c7_151a_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1422_c7_151a_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1422_c7_151a_return_output := tmp8_MUX_uxn_opcodes_h_l1422_c7_151a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1419_c7_c69f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c69f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c69f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c69f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c69f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c69f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c69f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c69f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c69f_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1394_c2_dff3] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_dff3_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_dff3_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_dff3_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_dff3_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_dff3_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_dff3_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_dff3_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_dff3_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1394_c2_dff3] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_dff3_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_dff3_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_dff3_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_dff3_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_dff3_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_dff3_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_dff3_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_dff3_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1414_c7_b2ed_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1415_c3_1234_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1414_c7_b2ed_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1415_c3_1234_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1410_c7_700b_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1412_c3_4002_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c69f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_151a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c69f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_151a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_b2ed_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_c69f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c69f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_151a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c69f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1422_c7_151a_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1419_c7_c69f_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1422_c7_151a_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1419_c7_c69f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c69f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c69f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c69f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c69f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c69f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c69f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c69f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c69f_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1419_c7_c69f] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1419_c7_c69f_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1419_c7_c69f_cond;
     tmp8_MUX_uxn_opcodes_h_l1419_c7_c69f_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1419_c7_c69f_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1419_c7_c69f_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1419_c7_c69f_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1419_c7_c69f_return_output := tmp8_MUX_uxn_opcodes_h_l1419_c7_c69f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1419_c7_c69f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c69f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c69f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c69f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c69f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c69f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c69f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c69f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c69f_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1414_c7_b2ed] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1414_c7_b2ed_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1414_c7_b2ed_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1414_c7_b2ed_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1414_c7_b2ed_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1414_c7_b2ed_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1414_c7_b2ed_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1414_c7_b2ed_return_output := result_u16_value_MUX_uxn_opcodes_h_l1414_c7_b2ed_return_output;

     -- t16_MUX[uxn_opcodes_h_l1414_c7_b2ed] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1414_c7_b2ed_cond <= VAR_t16_MUX_uxn_opcodes_h_l1414_c7_b2ed_cond;
     t16_MUX_uxn_opcodes_h_l1414_c7_b2ed_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1414_c7_b2ed_iftrue;
     t16_MUX_uxn_opcodes_h_l1414_c7_b2ed_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1414_c7_b2ed_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1414_c7_b2ed_return_output := t16_MUX_uxn_opcodes_h_l1414_c7_b2ed_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1419_c7_c69f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c69f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c69f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c69f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c69f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c69f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c69f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c69f_return_output := result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c69f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1414_c7_b2ed] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_b2ed_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_b2ed_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_b2ed_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_b2ed_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_b2ed_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_b2ed_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_b2ed_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_b2ed_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1419_c7_c69f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c69f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c69f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c69f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c69f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c69f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c69f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c69f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c69f_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_b2ed_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_c69f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_b2ed_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_c69f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_700b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_b2ed_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_b2ed_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_c69f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_700b_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1414_c7_b2ed_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1414_c7_b2ed_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_c69f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1410_c7_700b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1414_c7_b2ed_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1414_c7_b2ed_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1419_c7_c69f_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1410_c7_700b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_700b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_700b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_700b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_700b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_700b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_700b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_700b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_700b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1414_c7_b2ed] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1414_c7_b2ed_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1414_c7_b2ed_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1414_c7_b2ed_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1414_c7_b2ed_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1414_c7_b2ed_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1414_c7_b2ed_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1414_c7_b2ed_return_output := result_u8_value_MUX_uxn_opcodes_h_l1414_c7_b2ed_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1414_c7_b2ed] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_b2ed_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_b2ed_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_b2ed_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_b2ed_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_b2ed_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_b2ed_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_b2ed_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_b2ed_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1414_c7_b2ed] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_b2ed_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_b2ed_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_b2ed_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_b2ed_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_b2ed_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_b2ed_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_b2ed_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_b2ed_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1414_c7_b2ed] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1414_c7_b2ed_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1414_c7_b2ed_cond;
     tmp8_MUX_uxn_opcodes_h_l1414_c7_b2ed_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1414_c7_b2ed_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1414_c7_b2ed_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1414_c7_b2ed_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1414_c7_b2ed_return_output := tmp8_MUX_uxn_opcodes_h_l1414_c7_b2ed_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1414_c7_b2ed] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_b2ed_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_b2ed_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_b2ed_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_b2ed_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_b2ed_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_b2ed_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_b2ed_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_b2ed_return_output;

     -- t16_MUX[uxn_opcodes_h_l1410_c7_700b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1410_c7_700b_cond <= VAR_t16_MUX_uxn_opcodes_h_l1410_c7_700b_cond;
     t16_MUX_uxn_opcodes_h_l1410_c7_700b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1410_c7_700b_iftrue;
     t16_MUX_uxn_opcodes_h_l1410_c7_700b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1410_c7_700b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1410_c7_700b_return_output := t16_MUX_uxn_opcodes_h_l1410_c7_700b_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1410_c7_700b] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1410_c7_700b_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_700b_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1410_c7_700b_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_700b_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1410_c7_700b_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_700b_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_700b_return_output := result_u16_value_MUX_uxn_opcodes_h_l1410_c7_700b_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_700b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_b2ed_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_700b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_b2ed_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_d7f5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_700b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_700b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_b2ed_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1407_c7_d7f5_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_700b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_700b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1414_c7_b2ed_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1407_c7_d7f5_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1410_c7_700b_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1410_c7_700b_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1414_c7_b2ed_return_output;
     -- tmp8_MUX[uxn_opcodes_h_l1410_c7_700b] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1410_c7_700b_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1410_c7_700b_cond;
     tmp8_MUX_uxn_opcodes_h_l1410_c7_700b_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1410_c7_700b_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1410_c7_700b_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1410_c7_700b_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1410_c7_700b_return_output := tmp8_MUX_uxn_opcodes_h_l1410_c7_700b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1410_c7_700b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_700b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_700b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_700b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_700b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_700b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_700b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_700b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_700b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1410_c7_700b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1410_c7_700b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_700b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1410_c7_700b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_700b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1410_c7_700b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_700b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_700b_return_output := result_u8_value_MUX_uxn_opcodes_h_l1410_c7_700b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1407_c7_d7f5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_d7f5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_d7f5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_d7f5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_d7f5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_d7f5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_d7f5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_d7f5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_d7f5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1410_c7_700b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_700b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_700b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_700b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_700b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_700b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_700b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_700b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_700b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1410_c7_700b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_700b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_700b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_700b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_700b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_700b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_700b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_700b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_700b_return_output;

     -- t16_MUX[uxn_opcodes_h_l1407_c7_d7f5] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1407_c7_d7f5_cond <= VAR_t16_MUX_uxn_opcodes_h_l1407_c7_d7f5_cond;
     t16_MUX_uxn_opcodes_h_l1407_c7_d7f5_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1407_c7_d7f5_iftrue;
     t16_MUX_uxn_opcodes_h_l1407_c7_d7f5_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1407_c7_d7f5_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1407_c7_d7f5_return_output := t16_MUX_uxn_opcodes_h_l1407_c7_d7f5_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1407_c7_d7f5] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1407_c7_d7f5_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1407_c7_d7f5_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1407_c7_d7f5_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1407_c7_d7f5_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1407_c7_d7f5_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1407_c7_d7f5_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1407_c7_d7f5_return_output := result_u16_value_MUX_uxn_opcodes_h_l1407_c7_d7f5_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_d7f5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_700b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_d7f5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_700b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_dff3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_d7f5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_d7f5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_700b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1394_c2_dff3_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1407_c7_d7f5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_d7f5_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_700b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1394_c2_dff3_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1407_c7_d7f5_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1407_c7_d7f5_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1410_c7_700b_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1394_c2_dff3] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1394_c2_dff3_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1394_c2_dff3_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1394_c2_dff3_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1394_c2_dff3_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1394_c2_dff3_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1394_c2_dff3_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1394_c2_dff3_return_output := result_u16_value_MUX_uxn_opcodes_h_l1394_c2_dff3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1394_c2_dff3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_dff3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_dff3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_dff3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_dff3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_dff3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_dff3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_dff3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_dff3_return_output;

     -- t16_MUX[uxn_opcodes_h_l1394_c2_dff3] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1394_c2_dff3_cond <= VAR_t16_MUX_uxn_opcodes_h_l1394_c2_dff3_cond;
     t16_MUX_uxn_opcodes_h_l1394_c2_dff3_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1394_c2_dff3_iftrue;
     t16_MUX_uxn_opcodes_h_l1394_c2_dff3_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1394_c2_dff3_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1394_c2_dff3_return_output := t16_MUX_uxn_opcodes_h_l1394_c2_dff3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1407_c7_d7f5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_d7f5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_d7f5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_d7f5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_d7f5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_d7f5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_d7f5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_d7f5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_d7f5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1407_c7_d7f5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_d7f5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_d7f5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_d7f5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_d7f5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_d7f5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_d7f5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_d7f5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_d7f5_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1407_c7_d7f5] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1407_c7_d7f5_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1407_c7_d7f5_cond;
     tmp8_MUX_uxn_opcodes_h_l1407_c7_d7f5_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1407_c7_d7f5_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1407_c7_d7f5_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1407_c7_d7f5_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1407_c7_d7f5_return_output := tmp8_MUX_uxn_opcodes_h_l1407_c7_d7f5_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1407_c7_d7f5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1407_c7_d7f5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_d7f5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1407_c7_d7f5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_d7f5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1407_c7_d7f5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_d7f5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_d7f5_return_output := result_u8_value_MUX_uxn_opcodes_h_l1407_c7_d7f5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1407_c7_d7f5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_d7f5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_d7f5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_d7f5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_d7f5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_d7f5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_d7f5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_d7f5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_d7f5_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_dff3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_d7f5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_dff3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_d7f5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_dff3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_d7f5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1394_c2_dff3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_d7f5_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1394_c2_dff3_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1394_c2_dff3_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1407_c7_d7f5_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1394_c2_dff3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_dff3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_dff3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_dff3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_dff3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_dff3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_dff3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_dff3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_dff3_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1394_c2_dff3] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1394_c2_dff3_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1394_c2_dff3_cond;
     tmp8_MUX_uxn_opcodes_h_l1394_c2_dff3_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1394_c2_dff3_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1394_c2_dff3_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1394_c2_dff3_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1394_c2_dff3_return_output := tmp8_MUX_uxn_opcodes_h_l1394_c2_dff3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1394_c2_dff3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_dff3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_dff3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_dff3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_dff3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_dff3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_dff3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_dff3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_dff3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1394_c2_dff3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1394_c2_dff3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1394_c2_dff3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1394_c2_dff3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1394_c2_dff3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1394_c2_dff3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1394_c2_dff3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1394_c2_dff3_return_output := result_u8_value_MUX_uxn_opcodes_h_l1394_c2_dff3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1394_c2_dff3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_dff3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_dff3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_dff3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_dff3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_dff3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_dff3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_dff3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_dff3_return_output;

     -- Submodule level 7
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_opcodes_h_l1394_c2_dff3_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e482_uxn_opcodes_h_l1430_l1389_DUPLICATE_a80c LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e482_uxn_opcodes_h_l1430_l1389_DUPLICATE_a80c_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e482(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1394_c2_dff3_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_dff3_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_dff3_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1394_c2_dff3_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_dff3_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_dff3_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_dff3_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_dff3_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_dff3_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_dff3_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e482_uxn_opcodes_h_l1430_l1389_DUPLICATE_a80c_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e482_uxn_opcodes_h_l1430_l1389_DUPLICATE_a80c_return_output;
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
