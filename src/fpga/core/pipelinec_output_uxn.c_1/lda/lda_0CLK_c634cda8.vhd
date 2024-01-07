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
-- BIN_OP_EQ[uxn_opcodes_h_l1394_c6_3954]
signal BIN_OP_EQ_uxn_opcodes_h_l1394_c6_3954_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1394_c6_3954_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1394_c6_3954_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1394_c2_30ad]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_30ad_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_30ad_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_30ad_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_30ad_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1394_c2_30ad]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_30ad_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_30ad_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_30ad_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_30ad_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1394_c2_30ad]
signal result_u8_value_MUX_uxn_opcodes_h_l1394_c2_30ad_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1394_c2_30ad_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1394_c2_30ad_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1394_c2_30ad_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1394_c2_30ad]
signal result_u16_value_MUX_uxn_opcodes_h_l1394_c2_30ad_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1394_c2_30ad_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1394_c2_30ad_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1394_c2_30ad_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1394_c2_30ad]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_30ad_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_30ad_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_30ad_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_30ad_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1394_c2_30ad]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_30ad_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_30ad_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_30ad_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_30ad_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1394_c2_30ad]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_30ad_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_30ad_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_30ad_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_30ad_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1394_c2_30ad]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_30ad_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_30ad_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_30ad_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_30ad_return_output : unsigned(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1394_c2_30ad]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_30ad_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_30ad_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_30ad_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_30ad_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1394_c2_30ad]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_30ad_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_30ad_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_30ad_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_30ad_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1394_c2_30ad]
signal t16_MUX_uxn_opcodes_h_l1394_c2_30ad_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1394_c2_30ad_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1394_c2_30ad_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1394_c2_30ad_return_output : unsigned(15 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1394_c2_30ad]
signal tmp8_MUX_uxn_opcodes_h_l1394_c2_30ad_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1394_c2_30ad_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1394_c2_30ad_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1394_c2_30ad_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1407_c11_f033]
signal BIN_OP_EQ_uxn_opcodes_h_l1407_c11_f033_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1407_c11_f033_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1407_c11_f033_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1407_c7_1d97]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_1d97_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_1d97_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_1d97_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_1d97_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1407_c7_1d97]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_1d97_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_1d97_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_1d97_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_1d97_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1407_c7_1d97]
signal result_u8_value_MUX_uxn_opcodes_h_l1407_c7_1d97_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1407_c7_1d97_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1407_c7_1d97_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1407_c7_1d97_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1407_c7_1d97]
signal result_u16_value_MUX_uxn_opcodes_h_l1407_c7_1d97_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1407_c7_1d97_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1407_c7_1d97_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1407_c7_1d97_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1407_c7_1d97]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_1d97_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_1d97_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_1d97_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_1d97_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1407_c7_1d97]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_1d97_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_1d97_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_1d97_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_1d97_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1407_c7_1d97]
signal t16_MUX_uxn_opcodes_h_l1407_c7_1d97_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1407_c7_1d97_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1407_c7_1d97_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1407_c7_1d97_return_output : unsigned(15 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1407_c7_1d97]
signal tmp8_MUX_uxn_opcodes_h_l1407_c7_1d97_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1407_c7_1d97_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1407_c7_1d97_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1407_c7_1d97_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1410_c11_591c]
signal BIN_OP_EQ_uxn_opcodes_h_l1410_c11_591c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1410_c11_591c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1410_c11_591c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1410_c7_809d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_809d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_809d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_809d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_809d_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1410_c7_809d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_809d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_809d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_809d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_809d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1410_c7_809d]
signal result_u8_value_MUX_uxn_opcodes_h_l1410_c7_809d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1410_c7_809d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1410_c7_809d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1410_c7_809d_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1410_c7_809d]
signal result_u16_value_MUX_uxn_opcodes_h_l1410_c7_809d_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1410_c7_809d_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1410_c7_809d_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1410_c7_809d_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1410_c7_809d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_809d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_809d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_809d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_809d_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1410_c7_809d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_809d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_809d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_809d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_809d_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1410_c7_809d]
signal t16_MUX_uxn_opcodes_h_l1410_c7_809d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1410_c7_809d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1410_c7_809d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1410_c7_809d_return_output : unsigned(15 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1410_c7_809d]
signal tmp8_MUX_uxn_opcodes_h_l1410_c7_809d_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1410_c7_809d_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1410_c7_809d_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1410_c7_809d_return_output : unsigned(7 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1412_c3_5869]
signal CONST_SL_8_uxn_opcodes_h_l1412_c3_5869_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1412_c3_5869_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1414_c11_4841]
signal BIN_OP_EQ_uxn_opcodes_h_l1414_c11_4841_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1414_c11_4841_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1414_c11_4841_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1414_c7_b9e4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_b9e4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_b9e4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_b9e4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_b9e4_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1414_c7_b9e4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_b9e4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_b9e4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_b9e4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_b9e4_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1414_c7_b9e4]
signal result_u8_value_MUX_uxn_opcodes_h_l1414_c7_b9e4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1414_c7_b9e4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1414_c7_b9e4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1414_c7_b9e4_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1414_c7_b9e4]
signal result_u16_value_MUX_uxn_opcodes_h_l1414_c7_b9e4_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1414_c7_b9e4_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1414_c7_b9e4_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1414_c7_b9e4_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1414_c7_b9e4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_b9e4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_b9e4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_b9e4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_b9e4_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1414_c7_b9e4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_b9e4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_b9e4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_b9e4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_b9e4_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1414_c7_b9e4]
signal t16_MUX_uxn_opcodes_h_l1414_c7_b9e4_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1414_c7_b9e4_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1414_c7_b9e4_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1414_c7_b9e4_return_output : unsigned(15 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1414_c7_b9e4]
signal tmp8_MUX_uxn_opcodes_h_l1414_c7_b9e4_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1414_c7_b9e4_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1414_c7_b9e4_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1414_c7_b9e4_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1415_c3_77dc]
signal BIN_OP_OR_uxn_opcodes_h_l1415_c3_77dc_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1415_c3_77dc_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1415_c3_77dc_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1416_c30_328d]
signal sp_relative_shift_uxn_opcodes_h_l1416_c30_328d_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1416_c30_328d_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1416_c30_328d_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1416_c30_328d_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1419_c11_8aa4]
signal BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8aa4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8aa4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8aa4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1419_c7_a0c2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_a0c2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_a0c2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_a0c2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_a0c2_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1419_c7_a0c2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_a0c2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_a0c2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_a0c2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_a0c2_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1419_c7_a0c2]
signal result_u8_value_MUX_uxn_opcodes_h_l1419_c7_a0c2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1419_c7_a0c2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1419_c7_a0c2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1419_c7_a0c2_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1419_c7_a0c2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_a0c2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_a0c2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_a0c2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_a0c2_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1419_c7_a0c2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_a0c2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_a0c2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_a0c2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_a0c2_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1419_c7_a0c2]
signal tmp8_MUX_uxn_opcodes_h_l1419_c7_a0c2_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1419_c7_a0c2_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1419_c7_a0c2_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1419_c7_a0c2_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1422_c11_ecd2]
signal BIN_OP_EQ_uxn_opcodes_h_l1422_c11_ecd2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1422_c11_ecd2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1422_c11_ecd2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1422_c7_08e5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_08e5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_08e5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_08e5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_08e5_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1422_c7_08e5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_08e5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_08e5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_08e5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_08e5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1422_c7_08e5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_08e5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_08e5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_08e5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_08e5_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1422_c7_08e5]
signal result_u8_value_MUX_uxn_opcodes_h_l1422_c7_08e5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1422_c7_08e5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1422_c7_08e5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1422_c7_08e5_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1422_c7_08e5]
signal tmp8_MUX_uxn_opcodes_h_l1422_c7_08e5_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1422_c7_08e5_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1422_c7_08e5_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1422_c7_08e5_return_output : unsigned(7 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_500b( ref_toks_0 : opcode_result_t;
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
      base.is_pc_updated := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.u8_value := ref_toks_3;
      base.u16_value := ref_toks_4;
      base.is_ram_write := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_stack_write := ref_toks_7;
      base.stack_address_sp_offset := ref_toks_8;
      base.is_stack_index_flipped := ref_toks_9;
      base.is_opc_done := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1394_c6_3954
BIN_OP_EQ_uxn_opcodes_h_l1394_c6_3954 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1394_c6_3954_left,
BIN_OP_EQ_uxn_opcodes_h_l1394_c6_3954_right,
BIN_OP_EQ_uxn_opcodes_h_l1394_c6_3954_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_30ad
result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_30ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_30ad_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_30ad_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_30ad_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_30ad_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_30ad
result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_30ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_30ad_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_30ad_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_30ad_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_30ad_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1394_c2_30ad
result_u8_value_MUX_uxn_opcodes_h_l1394_c2_30ad : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1394_c2_30ad_cond,
result_u8_value_MUX_uxn_opcodes_h_l1394_c2_30ad_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1394_c2_30ad_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1394_c2_30ad_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1394_c2_30ad
result_u16_value_MUX_uxn_opcodes_h_l1394_c2_30ad : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1394_c2_30ad_cond,
result_u16_value_MUX_uxn_opcodes_h_l1394_c2_30ad_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1394_c2_30ad_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1394_c2_30ad_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_30ad
result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_30ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_30ad_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_30ad_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_30ad_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_30ad_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_30ad
result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_30ad : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_30ad_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_30ad_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_30ad_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_30ad_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_30ad
result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_30ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_30ad_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_30ad_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_30ad_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_30ad_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_30ad
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_30ad : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_30ad_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_30ad_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_30ad_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_30ad_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_30ad
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_30ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_30ad_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_30ad_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_30ad_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_30ad_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_30ad
result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_30ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_30ad_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_30ad_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_30ad_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_30ad_return_output);

-- t16_MUX_uxn_opcodes_h_l1394_c2_30ad
t16_MUX_uxn_opcodes_h_l1394_c2_30ad : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1394_c2_30ad_cond,
t16_MUX_uxn_opcodes_h_l1394_c2_30ad_iftrue,
t16_MUX_uxn_opcodes_h_l1394_c2_30ad_iffalse,
t16_MUX_uxn_opcodes_h_l1394_c2_30ad_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1394_c2_30ad
tmp8_MUX_uxn_opcodes_h_l1394_c2_30ad : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1394_c2_30ad_cond,
tmp8_MUX_uxn_opcodes_h_l1394_c2_30ad_iftrue,
tmp8_MUX_uxn_opcodes_h_l1394_c2_30ad_iffalse,
tmp8_MUX_uxn_opcodes_h_l1394_c2_30ad_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1407_c11_f033
BIN_OP_EQ_uxn_opcodes_h_l1407_c11_f033 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1407_c11_f033_left,
BIN_OP_EQ_uxn_opcodes_h_l1407_c11_f033_right,
BIN_OP_EQ_uxn_opcodes_h_l1407_c11_f033_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_1d97
result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_1d97 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_1d97_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_1d97_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_1d97_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_1d97_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_1d97
result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_1d97 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_1d97_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_1d97_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_1d97_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_1d97_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1407_c7_1d97
result_u8_value_MUX_uxn_opcodes_h_l1407_c7_1d97 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1407_c7_1d97_cond,
result_u8_value_MUX_uxn_opcodes_h_l1407_c7_1d97_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1407_c7_1d97_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1407_c7_1d97_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1407_c7_1d97
result_u16_value_MUX_uxn_opcodes_h_l1407_c7_1d97 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1407_c7_1d97_cond,
result_u16_value_MUX_uxn_opcodes_h_l1407_c7_1d97_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1407_c7_1d97_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1407_c7_1d97_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_1d97
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_1d97 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_1d97_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_1d97_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_1d97_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_1d97_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_1d97
result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_1d97 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_1d97_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_1d97_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_1d97_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_1d97_return_output);

-- t16_MUX_uxn_opcodes_h_l1407_c7_1d97
t16_MUX_uxn_opcodes_h_l1407_c7_1d97 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1407_c7_1d97_cond,
t16_MUX_uxn_opcodes_h_l1407_c7_1d97_iftrue,
t16_MUX_uxn_opcodes_h_l1407_c7_1d97_iffalse,
t16_MUX_uxn_opcodes_h_l1407_c7_1d97_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1407_c7_1d97
tmp8_MUX_uxn_opcodes_h_l1407_c7_1d97 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1407_c7_1d97_cond,
tmp8_MUX_uxn_opcodes_h_l1407_c7_1d97_iftrue,
tmp8_MUX_uxn_opcodes_h_l1407_c7_1d97_iffalse,
tmp8_MUX_uxn_opcodes_h_l1407_c7_1d97_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1410_c11_591c
BIN_OP_EQ_uxn_opcodes_h_l1410_c11_591c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1410_c11_591c_left,
BIN_OP_EQ_uxn_opcodes_h_l1410_c11_591c_right,
BIN_OP_EQ_uxn_opcodes_h_l1410_c11_591c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_809d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_809d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_809d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_809d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_809d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_809d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_809d
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_809d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_809d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_809d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_809d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_809d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1410_c7_809d
result_u8_value_MUX_uxn_opcodes_h_l1410_c7_809d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1410_c7_809d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1410_c7_809d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1410_c7_809d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1410_c7_809d_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1410_c7_809d
result_u16_value_MUX_uxn_opcodes_h_l1410_c7_809d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1410_c7_809d_cond,
result_u16_value_MUX_uxn_opcodes_h_l1410_c7_809d_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1410_c7_809d_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1410_c7_809d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_809d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_809d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_809d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_809d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_809d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_809d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_809d
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_809d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_809d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_809d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_809d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_809d_return_output);

-- t16_MUX_uxn_opcodes_h_l1410_c7_809d
t16_MUX_uxn_opcodes_h_l1410_c7_809d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1410_c7_809d_cond,
t16_MUX_uxn_opcodes_h_l1410_c7_809d_iftrue,
t16_MUX_uxn_opcodes_h_l1410_c7_809d_iffalse,
t16_MUX_uxn_opcodes_h_l1410_c7_809d_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1410_c7_809d
tmp8_MUX_uxn_opcodes_h_l1410_c7_809d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1410_c7_809d_cond,
tmp8_MUX_uxn_opcodes_h_l1410_c7_809d_iftrue,
tmp8_MUX_uxn_opcodes_h_l1410_c7_809d_iffalse,
tmp8_MUX_uxn_opcodes_h_l1410_c7_809d_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1412_c3_5869
CONST_SL_8_uxn_opcodes_h_l1412_c3_5869 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1412_c3_5869_x,
CONST_SL_8_uxn_opcodes_h_l1412_c3_5869_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1414_c11_4841
BIN_OP_EQ_uxn_opcodes_h_l1414_c11_4841 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1414_c11_4841_left,
BIN_OP_EQ_uxn_opcodes_h_l1414_c11_4841_right,
BIN_OP_EQ_uxn_opcodes_h_l1414_c11_4841_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_b9e4
result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_b9e4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_b9e4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_b9e4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_b9e4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_b9e4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_b9e4
result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_b9e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_b9e4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_b9e4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_b9e4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_b9e4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1414_c7_b9e4
result_u8_value_MUX_uxn_opcodes_h_l1414_c7_b9e4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1414_c7_b9e4_cond,
result_u8_value_MUX_uxn_opcodes_h_l1414_c7_b9e4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1414_c7_b9e4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1414_c7_b9e4_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1414_c7_b9e4
result_u16_value_MUX_uxn_opcodes_h_l1414_c7_b9e4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1414_c7_b9e4_cond,
result_u16_value_MUX_uxn_opcodes_h_l1414_c7_b9e4_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1414_c7_b9e4_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1414_c7_b9e4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_b9e4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_b9e4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_b9e4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_b9e4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_b9e4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_b9e4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_b9e4
result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_b9e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_b9e4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_b9e4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_b9e4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_b9e4_return_output);

-- t16_MUX_uxn_opcodes_h_l1414_c7_b9e4
t16_MUX_uxn_opcodes_h_l1414_c7_b9e4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1414_c7_b9e4_cond,
t16_MUX_uxn_opcodes_h_l1414_c7_b9e4_iftrue,
t16_MUX_uxn_opcodes_h_l1414_c7_b9e4_iffalse,
t16_MUX_uxn_opcodes_h_l1414_c7_b9e4_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1414_c7_b9e4
tmp8_MUX_uxn_opcodes_h_l1414_c7_b9e4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1414_c7_b9e4_cond,
tmp8_MUX_uxn_opcodes_h_l1414_c7_b9e4_iftrue,
tmp8_MUX_uxn_opcodes_h_l1414_c7_b9e4_iffalse,
tmp8_MUX_uxn_opcodes_h_l1414_c7_b9e4_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1415_c3_77dc
BIN_OP_OR_uxn_opcodes_h_l1415_c3_77dc : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1415_c3_77dc_left,
BIN_OP_OR_uxn_opcodes_h_l1415_c3_77dc_right,
BIN_OP_OR_uxn_opcodes_h_l1415_c3_77dc_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1416_c30_328d
sp_relative_shift_uxn_opcodes_h_l1416_c30_328d : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1416_c30_328d_ins,
sp_relative_shift_uxn_opcodes_h_l1416_c30_328d_x,
sp_relative_shift_uxn_opcodes_h_l1416_c30_328d_y,
sp_relative_shift_uxn_opcodes_h_l1416_c30_328d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8aa4
BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8aa4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8aa4_left,
BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8aa4_right,
BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8aa4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_a0c2
result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_a0c2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_a0c2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_a0c2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_a0c2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_a0c2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_a0c2
result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_a0c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_a0c2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_a0c2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_a0c2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_a0c2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1419_c7_a0c2
result_u8_value_MUX_uxn_opcodes_h_l1419_c7_a0c2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1419_c7_a0c2_cond,
result_u8_value_MUX_uxn_opcodes_h_l1419_c7_a0c2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1419_c7_a0c2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1419_c7_a0c2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_a0c2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_a0c2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_a0c2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_a0c2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_a0c2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_a0c2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_a0c2
result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_a0c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_a0c2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_a0c2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_a0c2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_a0c2_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1419_c7_a0c2
tmp8_MUX_uxn_opcodes_h_l1419_c7_a0c2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1419_c7_a0c2_cond,
tmp8_MUX_uxn_opcodes_h_l1419_c7_a0c2_iftrue,
tmp8_MUX_uxn_opcodes_h_l1419_c7_a0c2_iffalse,
tmp8_MUX_uxn_opcodes_h_l1419_c7_a0c2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1422_c11_ecd2
BIN_OP_EQ_uxn_opcodes_h_l1422_c11_ecd2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1422_c11_ecd2_left,
BIN_OP_EQ_uxn_opcodes_h_l1422_c11_ecd2_right,
BIN_OP_EQ_uxn_opcodes_h_l1422_c11_ecd2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_08e5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_08e5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_08e5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_08e5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_08e5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_08e5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_08e5
result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_08e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_08e5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_08e5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_08e5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_08e5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_08e5
result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_08e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_08e5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_08e5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_08e5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_08e5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1422_c7_08e5
result_u8_value_MUX_uxn_opcodes_h_l1422_c7_08e5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1422_c7_08e5_cond,
result_u8_value_MUX_uxn_opcodes_h_l1422_c7_08e5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1422_c7_08e5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1422_c7_08e5_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1422_c7_08e5
tmp8_MUX_uxn_opcodes_h_l1422_c7_08e5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1422_c7_08e5_cond,
tmp8_MUX_uxn_opcodes_h_l1422_c7_08e5_iftrue,
tmp8_MUX_uxn_opcodes_h_l1422_c7_08e5_iffalse,
tmp8_MUX_uxn_opcodes_h_l1422_c7_08e5_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1394_c6_3954_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_30ad_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_30ad_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1394_c2_30ad_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1394_c2_30ad_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_30ad_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_30ad_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_30ad_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_30ad_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_30ad_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_30ad_return_output,
 t16_MUX_uxn_opcodes_h_l1394_c2_30ad_return_output,
 tmp8_MUX_uxn_opcodes_h_l1394_c2_30ad_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1407_c11_f033_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_1d97_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_1d97_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1407_c7_1d97_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1407_c7_1d97_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_1d97_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_1d97_return_output,
 t16_MUX_uxn_opcodes_h_l1407_c7_1d97_return_output,
 tmp8_MUX_uxn_opcodes_h_l1407_c7_1d97_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1410_c11_591c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_809d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_809d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1410_c7_809d_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1410_c7_809d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_809d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_809d_return_output,
 t16_MUX_uxn_opcodes_h_l1410_c7_809d_return_output,
 tmp8_MUX_uxn_opcodes_h_l1410_c7_809d_return_output,
 CONST_SL_8_uxn_opcodes_h_l1412_c3_5869_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1414_c11_4841_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_b9e4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_b9e4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1414_c7_b9e4_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1414_c7_b9e4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_b9e4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_b9e4_return_output,
 t16_MUX_uxn_opcodes_h_l1414_c7_b9e4_return_output,
 tmp8_MUX_uxn_opcodes_h_l1414_c7_b9e4_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1415_c3_77dc_return_output,
 sp_relative_shift_uxn_opcodes_h_l1416_c30_328d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8aa4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_a0c2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_a0c2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1419_c7_a0c2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_a0c2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_a0c2_return_output,
 tmp8_MUX_uxn_opcodes_h_l1419_c7_a0c2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1422_c11_ecd2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_08e5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_08e5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_08e5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1422_c7_08e5_return_output,
 tmp8_MUX_uxn_opcodes_h_l1422_c7_08e5_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_3954_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_3954_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_3954_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_30ad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_30ad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1394_c2_30ad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_30ad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_30ad_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_30ad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_30ad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1394_c2_30ad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_30ad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_30ad_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1394_c2_30ad_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1394_c2_30ad_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_1d97_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1394_c2_30ad_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1394_c2_30ad_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1394_c2_30ad_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1394_c2_30ad_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1407_c7_1d97_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1394_c2_30ad_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1394_c2_30ad_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_30ad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_30ad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1394_c2_30ad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_30ad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_30ad_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_30ad_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1399_c3_2277 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_30ad_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_1d97_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_30ad_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_30ad_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_30ad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_30ad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_1d97_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_30ad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_30ad_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_30ad_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1404_c3_3ff2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_30ad_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_1d97_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_30ad_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_30ad_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_30ad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_30ad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1394_c2_30ad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_30ad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_30ad_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_30ad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_30ad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_1d97_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_30ad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_30ad_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1394_c2_30ad_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1394_c2_30ad_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1407_c7_1d97_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1394_c2_30ad_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1394_c2_30ad_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1394_c2_30ad_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1394_c2_30ad_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1407_c7_1d97_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1394_c2_30ad_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1394_c2_30ad_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_f033_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_f033_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_f033_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_1d97_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_1d97_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_809d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_1d97_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_1d97_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_1d97_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_809d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_1d97_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_1d97_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_1d97_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_809d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_1d97_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1407_c7_1d97_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1407_c7_1d97_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_809d_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1407_c7_1d97_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_1d97_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1408_c3_2245 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_1d97_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_809d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_1d97_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_1d97_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_1d97_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_809d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_1d97_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1407_c7_1d97_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1407_c7_1d97_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1410_c7_809d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1407_c7_1d97_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1407_c7_1d97_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1407_c7_1d97_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1410_c7_809d_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1407_c7_1d97_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_591c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_591c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_591c_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_809d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_809d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_b9e4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_809d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_809d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_809d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_b9e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_809d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_809d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_809d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1414_c7_b9e4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_809d_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_809d_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_809d_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1414_c7_b9e4_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_809d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_809d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_809d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_b9e4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_809d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_809d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_809d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_b9e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_809d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1410_c7_809d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1410_c7_809d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1414_c7_b9e4_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1410_c7_809d_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1410_c7_809d_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1410_c7_809d_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1414_c7_b9e4_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1410_c7_809d_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1412_c3_5869_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1412_c3_5869_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_4841_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_4841_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_4841_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_b9e4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_b9e4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_a0c2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_b9e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_b9e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_b9e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_a0c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_b9e4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1414_c7_b9e4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1414_c7_b9e4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_a0c2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1414_c7_b9e4_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1414_c7_b9e4_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1414_c7_b9e4_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1414_c7_b9e4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_b9e4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_b9e4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_a0c2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_b9e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_b9e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_b9e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_a0c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_b9e4_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1414_c7_b9e4_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1414_c7_b9e4_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1414_c7_b9e4_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1414_c7_b9e4_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1414_c7_b9e4_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1419_c7_a0c2_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1414_c7_b9e4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1415_c3_77dc_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1415_c3_77dc_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1415_c3_77dc_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_328d_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_328d_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_328d_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_328d_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8aa4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8aa4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8aa4_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_a0c2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1420_c3_d8ae : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_a0c2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_a0c2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_a0c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_a0c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_08e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_a0c2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_a0c2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_a0c2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1422_c7_08e5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_a0c2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_a0c2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_a0c2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_08e5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_a0c2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_a0c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_a0c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_08e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_a0c2_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1419_c7_a0c2_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1419_c7_a0c2_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1422_c7_08e5_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1419_c7_a0c2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_ecd2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_ecd2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_ecd2_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_08e5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1425_c3_f5ac : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_08e5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_08e5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_08e5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_08e5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_08e5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_08e5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_08e5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_08e5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1422_c7_08e5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1422_c7_08e5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1422_c7_08e5_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1422_c7_08e5_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1422_c7_08e5_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1422_c7_08e5_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1407_l1394_l1422_l1419_l1414_l1410_DUPLICATE_d933_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1394_l1414_l1407_l1410_DUPLICATE_a551_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1407_l1419_l1410_DUPLICATE_defb_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1407_l1422_l1419_l1414_l1410_DUPLICATE_9a48_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1407_l1422_l1419_l1414_l1410_DUPLICATE_be1c_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1411_l1415_DUPLICATE_5c12_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1422_l1414_l1419_l1410_DUPLICATE_b6e7_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_500b_uxn_opcodes_h_l1430_l1389_DUPLICATE_bb01_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_3954_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_4841_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_ecd2_right := to_unsigned(5, 3);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1420_c3_d8ae := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_a0c2_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1420_c3_d8ae;
     VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_328d_y := resize(to_signed(-1, 2), 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_08e5_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1399_c3_2277 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_30ad_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1399_c3_2277;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_30ad_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_30ad_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8aa4_right := to_unsigned(4, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_328d_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_30ad_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_30ad_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_591c_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1408_c3_2245 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_1d97_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1408_c3_2245;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1425_c3_f5ac := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_08e5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1425_c3_f5ac;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1404_c3_3ff2 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_30ad_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1404_c3_3ff2;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_f033_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_30ad_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_30ad_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_08e5_iftrue := to_unsigned(1, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_328d_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_3954_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_f033_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_591c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_4841_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8aa4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_ecd2_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1422_c7_08e5_iftrue := VAR_previous_ram_read;
     VAR_tmp8_MUX_uxn_opcodes_h_l1422_c7_08e5_iftrue := VAR_previous_ram_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1415_c3_77dc_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1394_c2_30ad_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1407_c7_1d97_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1414_c7_b9e4_iffalse := t16;
     VAR_tmp8_MUX_uxn_opcodes_h_l1394_c2_30ad_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1407_c7_1d97_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1410_c7_809d_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1414_c7_b9e4_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1419_c7_a0c2_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1422_c7_08e5_iffalse := tmp8;
     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1407_l1419_l1410_DUPLICATE_defb LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1407_l1419_l1410_DUPLICATE_defb_return_output := result.sp_relative_shift;

     -- sp_relative_shift[uxn_opcodes_h_l1416_c30_328d] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1416_c30_328d_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_328d_ins;
     sp_relative_shift_uxn_opcodes_h_l1416_c30_328d_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_328d_x;
     sp_relative_shift_uxn_opcodes_h_l1416_c30_328d_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_328d_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_328d_return_output := sp_relative_shift_uxn_opcodes_h_l1416_c30_328d_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1394_l1414_l1407_l1410_DUPLICATE_a551 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1394_l1414_l1407_l1410_DUPLICATE_a551_return_output := result.u16_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1407_l1422_l1419_l1414_l1410_DUPLICATE_9a48 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1407_l1422_l1419_l1414_l1410_DUPLICATE_9a48_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1407_c11_f033] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1407_c11_f033_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_f033_left;
     BIN_OP_EQ_uxn_opcodes_h_l1407_c11_f033_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_f033_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_f033_return_output := BIN_OP_EQ_uxn_opcodes_h_l1407_c11_f033_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1407_l1394_l1422_l1419_l1414_l1410_DUPLICATE_d933 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1407_l1394_l1422_l1419_l1414_l1410_DUPLICATE_d933_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1414_c11_4841] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1414_c11_4841_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_4841_left;
     BIN_OP_EQ_uxn_opcodes_h_l1414_c11_4841_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_4841_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_4841_return_output := BIN_OP_EQ_uxn_opcodes_h_l1414_c11_4841_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1394_c2_30ad] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1394_c2_30ad_return_output := result.is_pc_updated;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1394_c2_30ad] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1394_c2_30ad_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1407_l1422_l1419_l1414_l1410_DUPLICATE_be1c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1407_l1422_l1419_l1414_l1410_DUPLICATE_be1c_return_output := result.is_opc_done;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1394_c2_30ad] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1394_c2_30ad_return_output := result.is_stack_index_flipped;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1394_c2_30ad] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1394_c2_30ad_return_output := result.is_vram_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1411_l1415_DUPLICATE_5c12 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1411_l1415_DUPLICATE_5c12_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1422_c11_ecd2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1422_c11_ecd2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_ecd2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1422_c11_ecd2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_ecd2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_ecd2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1422_c11_ecd2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1410_c11_591c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1410_c11_591c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_591c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1410_c11_591c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_591c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_591c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1410_c11_591c_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1422_l1414_l1419_l1410_DUPLICATE_b6e7 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1422_l1414_l1419_l1410_DUPLICATE_b6e7_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1419_c11_8aa4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8aa4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8aa4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8aa4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8aa4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8aa4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8aa4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1394_c6_3954] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1394_c6_3954_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_3954_left;
     BIN_OP_EQ_uxn_opcodes_h_l1394_c6_3954_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_3954_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_3954_return_output := BIN_OP_EQ_uxn_opcodes_h_l1394_c6_3954_return_output;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_30ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_3954_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_30ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_3954_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_30ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_3954_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_30ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_3954_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_30ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_3954_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_30ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_3954_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_30ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_3954_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_30ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_3954_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1394_c2_30ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_3954_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1394_c2_30ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_3954_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1394_c2_30ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_3954_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1394_c2_30ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1394_c6_3954_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_1d97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_f033_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_1d97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_f033_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_1d97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_f033_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_1d97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_f033_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1407_c7_1d97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_f033_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_1d97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_f033_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1407_c7_1d97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_f033_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1407_c7_1d97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_f033_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_809d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_591c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_809d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_591c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_809d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_591c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_809d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_591c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_809d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_591c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_809d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_591c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1410_c7_809d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_591c_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1410_c7_809d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_591c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_b9e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_4841_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_b9e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_4841_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_b9e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_4841_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_b9e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_4841_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1414_c7_b9e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_4841_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1414_c7_b9e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_4841_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1414_c7_b9e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_4841_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1414_c7_b9e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c11_4841_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_a0c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8aa4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_a0c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8aa4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_a0c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8aa4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_a0c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8aa4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_a0c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8aa4_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1419_c7_a0c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8aa4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_08e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_ecd2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_08e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_ecd2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_08e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_ecd2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1422_c7_08e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_ecd2_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1422_c7_08e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1422_c11_ecd2_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1415_c3_77dc_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1411_l1415_DUPLICATE_5c12_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1412_c3_5869_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1411_l1415_DUPLICATE_5c12_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_1d97_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1407_l1419_l1410_DUPLICATE_defb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_809d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1407_l1419_l1410_DUPLICATE_defb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_a0c2_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1407_l1419_l1410_DUPLICATE_defb_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1394_c2_30ad_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1394_l1414_l1407_l1410_DUPLICATE_a551_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1407_c7_1d97_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1394_l1414_l1407_l1410_DUPLICATE_a551_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_809d_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1394_l1414_l1407_l1410_DUPLICATE_a551_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1414_c7_b9e4_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1394_l1414_l1407_l1410_DUPLICATE_a551_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_1d97_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1407_l1422_l1419_l1414_l1410_DUPLICATE_be1c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_809d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1407_l1422_l1419_l1414_l1410_DUPLICATE_be1c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_b9e4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1407_l1422_l1419_l1414_l1410_DUPLICATE_be1c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_a0c2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1407_l1422_l1419_l1414_l1410_DUPLICATE_be1c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_08e5_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1407_l1422_l1419_l1414_l1410_DUPLICATE_be1c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_1d97_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1407_l1422_l1419_l1414_l1410_DUPLICATE_9a48_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_809d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1407_l1422_l1419_l1414_l1410_DUPLICATE_9a48_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_b9e4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1407_l1422_l1419_l1414_l1410_DUPLICATE_9a48_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_a0c2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1407_l1422_l1419_l1414_l1410_DUPLICATE_9a48_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_08e5_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1407_l1422_l1419_l1414_l1410_DUPLICATE_9a48_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_809d_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1422_l1414_l1419_l1410_DUPLICATE_b6e7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_b9e4_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1422_l1414_l1419_l1410_DUPLICATE_b6e7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_a0c2_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1422_l1414_l1419_l1410_DUPLICATE_b6e7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_08e5_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1422_l1414_l1419_l1410_DUPLICATE_b6e7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1394_c2_30ad_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1407_l1394_l1422_l1419_l1414_l1410_DUPLICATE_d933_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_1d97_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1407_l1394_l1422_l1419_l1414_l1410_DUPLICATE_d933_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_809d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1407_l1394_l1422_l1419_l1414_l1410_DUPLICATE_d933_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1414_c7_b9e4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1407_l1394_l1422_l1419_l1414_l1410_DUPLICATE_d933_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_a0c2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1407_l1394_l1422_l1419_l1414_l1410_DUPLICATE_d933_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1422_c7_08e5_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1407_l1394_l1422_l1419_l1414_l1410_DUPLICATE_d933_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_30ad_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1394_c2_30ad_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_30ad_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1394_c2_30ad_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_30ad_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1394_c2_30ad_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_30ad_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1394_c2_30ad_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_b9e4_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_328d_return_output;
     -- CONST_SL_8[uxn_opcodes_h_l1412_c3_5869] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1412_c3_5869_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1412_c3_5869_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1412_c3_5869_return_output := CONST_SL_8_uxn_opcodes_h_l1412_c3_5869_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1422_c7_08e5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_08e5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_08e5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_08e5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_08e5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_08e5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_08e5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_08e5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_08e5_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1394_c2_30ad] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_30ad_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_30ad_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_30ad_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_30ad_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_30ad_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_30ad_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_30ad_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_30ad_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1415_c3_77dc] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1415_c3_77dc_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1415_c3_77dc_left;
     BIN_OP_OR_uxn_opcodes_h_l1415_c3_77dc_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1415_c3_77dc_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1415_c3_77dc_return_output := BIN_OP_OR_uxn_opcodes_h_l1415_c3_77dc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1422_c7_08e5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_08e5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_08e5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_08e5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_08e5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_08e5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_08e5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_08e5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_08e5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1422_c7_08e5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_08e5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_08e5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_08e5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_08e5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_08e5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_08e5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_08e5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_08e5_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1394_c2_30ad] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_30ad_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_30ad_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_30ad_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_30ad_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_30ad_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_30ad_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_30ad_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_30ad_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1419_c7_a0c2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_a0c2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_a0c2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_a0c2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_a0c2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_a0c2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_a0c2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_a0c2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_a0c2_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1422_c7_08e5] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1422_c7_08e5_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1422_c7_08e5_cond;
     tmp8_MUX_uxn_opcodes_h_l1422_c7_08e5_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1422_c7_08e5_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1422_c7_08e5_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1422_c7_08e5_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1422_c7_08e5_return_output := tmp8_MUX_uxn_opcodes_h_l1422_c7_08e5_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1422_c7_08e5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1422_c7_08e5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1422_c7_08e5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1422_c7_08e5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1422_c7_08e5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1422_c7_08e5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1422_c7_08e5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1422_c7_08e5_return_output := result_u8_value_MUX_uxn_opcodes_h_l1422_c7_08e5_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1394_c2_30ad] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_30ad_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_30ad_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_30ad_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_30ad_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_30ad_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_30ad_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_30ad_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_30ad_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1394_c2_30ad] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_30ad_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_30ad_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_30ad_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_30ad_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_30ad_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_30ad_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_30ad_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_30ad_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1414_c7_b9e4_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1415_c3_77dc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1414_c7_b9e4_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1415_c3_77dc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1410_c7_809d_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1412_c3_5869_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_a0c2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1422_c7_08e5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_a0c2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1422_c7_08e5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_b9e4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1419_c7_a0c2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_a0c2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1422_c7_08e5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_a0c2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1422_c7_08e5_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1419_c7_a0c2_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1422_c7_08e5_return_output;
     -- t16_MUX[uxn_opcodes_h_l1414_c7_b9e4] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1414_c7_b9e4_cond <= VAR_t16_MUX_uxn_opcodes_h_l1414_c7_b9e4_cond;
     t16_MUX_uxn_opcodes_h_l1414_c7_b9e4_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1414_c7_b9e4_iftrue;
     t16_MUX_uxn_opcodes_h_l1414_c7_b9e4_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1414_c7_b9e4_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1414_c7_b9e4_return_output := t16_MUX_uxn_opcodes_h_l1414_c7_b9e4_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1419_c7_a0c2] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1419_c7_a0c2_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1419_c7_a0c2_cond;
     tmp8_MUX_uxn_opcodes_h_l1419_c7_a0c2_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1419_c7_a0c2_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1419_c7_a0c2_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1419_c7_a0c2_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1419_c7_a0c2_return_output := tmp8_MUX_uxn_opcodes_h_l1419_c7_a0c2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1419_c7_a0c2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1419_c7_a0c2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_a0c2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1419_c7_a0c2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_a0c2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1419_c7_a0c2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_a0c2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_a0c2_return_output := result_u8_value_MUX_uxn_opcodes_h_l1419_c7_a0c2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1419_c7_a0c2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_a0c2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_a0c2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_a0c2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_a0c2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_a0c2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_a0c2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_a0c2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_a0c2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1419_c7_a0c2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_a0c2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_a0c2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_a0c2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_a0c2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_a0c2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_a0c2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_a0c2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_a0c2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1419_c7_a0c2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_a0c2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_a0c2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_a0c2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_a0c2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_a0c2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_a0c2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_a0c2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_a0c2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1414_c7_b9e4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_b9e4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_b9e4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_b9e4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_b9e4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_b9e4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_b9e4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_b9e4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_b9e4_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1414_c7_b9e4] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1414_c7_b9e4_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1414_c7_b9e4_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1414_c7_b9e4_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1414_c7_b9e4_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1414_c7_b9e4_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1414_c7_b9e4_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1414_c7_b9e4_return_output := result_u16_value_MUX_uxn_opcodes_h_l1414_c7_b9e4_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_b9e4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_a0c2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_b9e4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_a0c2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_809d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c7_b9e4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_b9e4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_a0c2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_809d_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1414_c7_b9e4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1414_c7_b9e4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_a0c2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1410_c7_809d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1414_c7_b9e4_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1414_c7_b9e4_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1419_c7_a0c2_return_output;
     -- t16_MUX[uxn_opcodes_h_l1410_c7_809d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1410_c7_809d_cond <= VAR_t16_MUX_uxn_opcodes_h_l1410_c7_809d_cond;
     t16_MUX_uxn_opcodes_h_l1410_c7_809d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1410_c7_809d_iftrue;
     t16_MUX_uxn_opcodes_h_l1410_c7_809d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1410_c7_809d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1410_c7_809d_return_output := t16_MUX_uxn_opcodes_h_l1410_c7_809d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1414_c7_b9e4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_b9e4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_b9e4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_b9e4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_b9e4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_b9e4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_b9e4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_b9e4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_b9e4_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1414_c7_b9e4] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1414_c7_b9e4_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1414_c7_b9e4_cond;
     tmp8_MUX_uxn_opcodes_h_l1414_c7_b9e4_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1414_c7_b9e4_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1414_c7_b9e4_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1414_c7_b9e4_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1414_c7_b9e4_return_output := tmp8_MUX_uxn_opcodes_h_l1414_c7_b9e4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1414_c7_b9e4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_b9e4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_b9e4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_b9e4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_b9e4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_b9e4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_b9e4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_b9e4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_b9e4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1410_c7_809d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_809d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_809d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_809d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_809d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_809d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_809d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_809d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_809d_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1410_c7_809d] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1410_c7_809d_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_809d_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1410_c7_809d_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_809d_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1410_c7_809d_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_809d_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_809d_return_output := result_u16_value_MUX_uxn_opcodes_h_l1410_c7_809d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1414_c7_b9e4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_b9e4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_b9e4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_b9e4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_b9e4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_b9e4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_b9e4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_b9e4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_b9e4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1414_c7_b9e4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1414_c7_b9e4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1414_c7_b9e4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1414_c7_b9e4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1414_c7_b9e4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1414_c7_b9e4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1414_c7_b9e4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1414_c7_b9e4_return_output := result_u8_value_MUX_uxn_opcodes_h_l1414_c7_b9e4_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_809d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c7_b9e4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_809d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c7_b9e4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_1d97_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_809d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_809d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c7_b9e4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1407_c7_1d97_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_809d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_809d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1414_c7_b9e4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1407_c7_1d97_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1410_c7_809d_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1410_c7_809d_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1414_c7_b9e4_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1410_c7_809d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_809d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_809d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_809d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_809d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_809d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_809d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_809d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_809d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1407_c7_1d97] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_1d97_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_1d97_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_1d97_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_1d97_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_1d97_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_1d97_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_1d97_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_1d97_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1410_c7_809d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1410_c7_809d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_809d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1410_c7_809d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_809d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1410_c7_809d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_809d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_809d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1410_c7_809d_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1410_c7_809d] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1410_c7_809d_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1410_c7_809d_cond;
     tmp8_MUX_uxn_opcodes_h_l1410_c7_809d_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1410_c7_809d_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1410_c7_809d_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1410_c7_809d_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1410_c7_809d_return_output := tmp8_MUX_uxn_opcodes_h_l1410_c7_809d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1410_c7_809d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_809d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_809d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_809d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_809d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_809d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_809d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_809d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_809d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1410_c7_809d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_809d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_809d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_809d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_809d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_809d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_809d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_809d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_809d_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1407_c7_1d97] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1407_c7_1d97_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1407_c7_1d97_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1407_c7_1d97_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1407_c7_1d97_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1407_c7_1d97_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1407_c7_1d97_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1407_c7_1d97_return_output := result_u16_value_MUX_uxn_opcodes_h_l1407_c7_1d97_return_output;

     -- t16_MUX[uxn_opcodes_h_l1407_c7_1d97] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1407_c7_1d97_cond <= VAR_t16_MUX_uxn_opcodes_h_l1407_c7_1d97_cond;
     t16_MUX_uxn_opcodes_h_l1407_c7_1d97_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1407_c7_1d97_iftrue;
     t16_MUX_uxn_opcodes_h_l1407_c7_1d97_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1407_c7_1d97_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1407_c7_1d97_return_output := t16_MUX_uxn_opcodes_h_l1407_c7_1d97_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_1d97_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_809d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_1d97_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_809d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_30ad_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_1d97_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_1d97_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_809d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1394_c2_30ad_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1407_c7_1d97_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_1d97_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_809d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1394_c2_30ad_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1407_c7_1d97_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1407_c7_1d97_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1410_c7_809d_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1407_c7_1d97] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1407_c7_1d97_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_1d97_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1407_c7_1d97_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_1d97_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1407_c7_1d97_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_1d97_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_1d97_return_output := result_u8_value_MUX_uxn_opcodes_h_l1407_c7_1d97_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1394_c2_30ad] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_30ad_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_30ad_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_30ad_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_30ad_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_30ad_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_30ad_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_30ad_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_30ad_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1407_c7_1d97] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_1d97_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_1d97_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_1d97_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_1d97_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_1d97_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_1d97_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_1d97_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_1d97_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1407_c7_1d97] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_1d97_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_1d97_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_1d97_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_1d97_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_1d97_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_1d97_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_1d97_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_1d97_return_output;

     -- t16_MUX[uxn_opcodes_h_l1394_c2_30ad] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1394_c2_30ad_cond <= VAR_t16_MUX_uxn_opcodes_h_l1394_c2_30ad_cond;
     t16_MUX_uxn_opcodes_h_l1394_c2_30ad_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1394_c2_30ad_iftrue;
     t16_MUX_uxn_opcodes_h_l1394_c2_30ad_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1394_c2_30ad_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1394_c2_30ad_return_output := t16_MUX_uxn_opcodes_h_l1394_c2_30ad_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1407_c7_1d97] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_1d97_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_1d97_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_1d97_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_1d97_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_1d97_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_1d97_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_1d97_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_1d97_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1407_c7_1d97] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1407_c7_1d97_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1407_c7_1d97_cond;
     tmp8_MUX_uxn_opcodes_h_l1407_c7_1d97_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1407_c7_1d97_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1407_c7_1d97_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1407_c7_1d97_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1407_c7_1d97_return_output := tmp8_MUX_uxn_opcodes_h_l1407_c7_1d97_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1394_c2_30ad] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1394_c2_30ad_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1394_c2_30ad_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1394_c2_30ad_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1394_c2_30ad_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1394_c2_30ad_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1394_c2_30ad_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1394_c2_30ad_return_output := result_u16_value_MUX_uxn_opcodes_h_l1394_c2_30ad_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_30ad_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_1d97_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_30ad_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_1d97_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_30ad_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_1d97_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1394_c2_30ad_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c7_1d97_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1394_c2_30ad_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1394_c2_30ad_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1407_c7_1d97_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1394_c2_30ad] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1394_c2_30ad_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1394_c2_30ad_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1394_c2_30ad_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1394_c2_30ad_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1394_c2_30ad_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1394_c2_30ad_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1394_c2_30ad_return_output := result_u8_value_MUX_uxn_opcodes_h_l1394_c2_30ad_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1394_c2_30ad] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_30ad_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_30ad_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_30ad_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_30ad_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_30ad_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_30ad_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_30ad_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_30ad_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1394_c2_30ad] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_30ad_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_30ad_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_30ad_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_30ad_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_30ad_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_30ad_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_30ad_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_30ad_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1394_c2_30ad] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_30ad_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_30ad_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_30ad_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_30ad_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_30ad_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_30ad_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_30ad_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_30ad_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1394_c2_30ad] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1394_c2_30ad_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1394_c2_30ad_cond;
     tmp8_MUX_uxn_opcodes_h_l1394_c2_30ad_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1394_c2_30ad_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1394_c2_30ad_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1394_c2_30ad_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1394_c2_30ad_return_output := tmp8_MUX_uxn_opcodes_h_l1394_c2_30ad_return_output;

     -- Submodule level 7
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_opcodes_h_l1394_c2_30ad_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_500b_uxn_opcodes_h_l1430_l1389_DUPLICATE_bb01 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_500b_uxn_opcodes_h_l1430_l1389_DUPLICATE_bb01_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_500b(
     result,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1394_c2_30ad_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1394_c2_30ad_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1394_c2_30ad_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1394_c2_30ad_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1394_c2_30ad_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1394_c2_30ad_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1394_c2_30ad_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1394_c2_30ad_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1394_c2_30ad_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1394_c2_30ad_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_500b_uxn_opcodes_h_l1430_l1389_DUPLICATE_bb01_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_500b_uxn_opcodes_h_l1430_l1389_DUPLICATE_bb01_return_output;
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
