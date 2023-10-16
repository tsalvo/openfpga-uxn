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
-- Submodules: 65
entity jsi_0CLK_06911bbe is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jsi_0CLK_06911bbe;
architecture arch of jsi_0CLK_06911bbe is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l144_c6_d168]
signal BIN_OP_EQ_uxn_opcodes_h_l144_c6_d168_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l144_c6_d168_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l144_c6_d168_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l144_c1_5dbb]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l144_c1_5dbb_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l144_c1_5dbb_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l144_c1_5dbb_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l144_c1_5dbb_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l144_c2_4dc1]
signal tmp16_MUX_uxn_opcodes_h_l144_c2_4dc1_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l144_c2_4dc1_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l144_c2_4dc1_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l144_c2_4dc1_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l144_c2_4dc1]
signal result_u16_value_MUX_uxn_opcodes_h_l144_c2_4dc1_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l144_c2_4dc1_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l144_c2_4dc1_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l144_c2_4dc1_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l144_c2_4dc1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_4dc1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_4dc1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_4dc1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_4dc1_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l144_c2_4dc1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_4dc1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_4dc1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_4dc1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_4dc1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l144_c2_4dc1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_4dc1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_4dc1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_4dc1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_4dc1_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l144_c2_4dc1]
signal result_u8_value_MUX_uxn_opcodes_h_l144_c2_4dc1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l144_c2_4dc1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l144_c2_4dc1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l144_c2_4dc1_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l144_c2_4dc1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_4dc1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_4dc1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_4dc1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_4dc1_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l144_c2_4dc1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_4dc1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_4dc1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_4dc1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_4dc1_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l144_c2_4dc1]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_4dc1_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_4dc1_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_4dc1_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_4dc1_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l145_c3_a319[uxn_opcodes_h_l145_c3_a319]
signal printf_uxn_opcodes_h_l145_c3_a319_uxn_opcodes_h_l145_c3_a319_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l148_c11_fc96]
signal BIN_OP_PLUS_uxn_opcodes_h_l148_c11_fc96_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l148_c11_fc96_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l148_c11_fc96_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l151_c11_39a0]
signal BIN_OP_EQ_uxn_opcodes_h_l151_c11_39a0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l151_c11_39a0_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l151_c11_39a0_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l151_c7_69a5]
signal tmp16_MUX_uxn_opcodes_h_l151_c7_69a5_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l151_c7_69a5_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l151_c7_69a5_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l151_c7_69a5_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l151_c7_69a5]
signal result_u16_value_MUX_uxn_opcodes_h_l151_c7_69a5_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l151_c7_69a5_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l151_c7_69a5_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l151_c7_69a5_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l151_c7_69a5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_69a5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_69a5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_69a5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_69a5_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l151_c7_69a5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_69a5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_69a5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_69a5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_69a5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l151_c7_69a5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_69a5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_69a5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_69a5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_69a5_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l151_c7_69a5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_69a5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_69a5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_69a5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_69a5_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l151_c7_69a5]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_69a5_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_69a5_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_69a5_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_69a5_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l151_c7_69a5]
signal result_u8_value_MUX_uxn_opcodes_h_l151_c7_69a5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l151_c7_69a5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l151_c7_69a5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l151_c7_69a5_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l157_c11_796d]
signal BIN_OP_EQ_uxn_opcodes_h_l157_c11_796d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l157_c11_796d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l157_c11_796d_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l157_c7_dd54]
signal tmp16_MUX_uxn_opcodes_h_l157_c7_dd54_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l157_c7_dd54_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l157_c7_dd54_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l157_c7_dd54_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l157_c7_dd54]
signal result_u16_value_MUX_uxn_opcodes_h_l157_c7_dd54_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l157_c7_dd54_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l157_c7_dd54_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l157_c7_dd54_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l157_c7_dd54]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_dd54_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_dd54_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_dd54_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_dd54_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l157_c7_dd54]
signal result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_dd54_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_dd54_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_dd54_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_dd54_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l157_c7_dd54]
signal result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_dd54_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_dd54_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_dd54_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_dd54_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l157_c7_dd54]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_dd54_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_dd54_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_dd54_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_dd54_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l157_c7_dd54]
signal result_u8_value_MUX_uxn_opcodes_h_l157_c7_dd54_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l157_c7_dd54_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l157_c7_dd54_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l157_c7_dd54_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l159_c31_6d6d]
signal CONST_SR_8_uxn_opcodes_h_l159_c31_6d6d_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l159_c31_6d6d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l162_c11_dc52]
signal BIN_OP_EQ_uxn_opcodes_h_l162_c11_dc52_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l162_c11_dc52_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l162_c11_dc52_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l162_c7_1ce9]
signal tmp16_MUX_uxn_opcodes_h_l162_c7_1ce9_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l162_c7_1ce9_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l162_c7_1ce9_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l162_c7_1ce9_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l162_c7_1ce9]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_1ce9_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_1ce9_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_1ce9_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_1ce9_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l162_c7_1ce9]
signal result_u16_value_MUX_uxn_opcodes_h_l162_c7_1ce9_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l162_c7_1ce9_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l162_c7_1ce9_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l162_c7_1ce9_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l162_c7_1ce9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_1ce9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_1ce9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_1ce9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_1ce9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l162_c7_1ce9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_1ce9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_1ce9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_1ce9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_1ce9_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l166_c11_d467]
signal BIN_OP_EQ_uxn_opcodes_h_l166_c11_d467_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l166_c11_d467_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l166_c11_d467_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l166_c7_a6d0]
signal tmp16_MUX_uxn_opcodes_h_l166_c7_a6d0_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l166_c7_a6d0_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l166_c7_a6d0_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l166_c7_a6d0_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l166_c7_a6d0]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_a6d0_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_a6d0_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_a6d0_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_a6d0_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l166_c7_a6d0]
signal result_u16_value_MUX_uxn_opcodes_h_l166_c7_a6d0_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l166_c7_a6d0_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l166_c7_a6d0_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l166_c7_a6d0_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l166_c7_a6d0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_a6d0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_a6d0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_a6d0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_a6d0_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l168_c3_9f3e]
signal CONST_SL_8_uxn_opcodes_h_l168_c3_9f3e_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l168_c3_9f3e_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l169_c22_965c]
signal BIN_OP_PLUS_uxn_opcodes_h_l169_c22_965c_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l169_c22_965c_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l169_c22_965c_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l171_c11_3917]
signal BIN_OP_EQ_uxn_opcodes_h_l171_c11_3917_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l171_c11_3917_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l171_c11_3917_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l171_c7_d5a5]
signal tmp16_MUX_uxn_opcodes_h_l171_c7_d5a5_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l171_c7_d5a5_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l171_c7_d5a5_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l171_c7_d5a5_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l171_c7_d5a5]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_d5a5_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_d5a5_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_d5a5_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_d5a5_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l171_c7_d5a5]
signal result_u16_value_MUX_uxn_opcodes_h_l171_c7_d5a5_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l171_c7_d5a5_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l171_c7_d5a5_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l171_c7_d5a5_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l171_c7_d5a5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_d5a5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_d5a5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_d5a5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_d5a5_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l172_c22_c5e7]
signal BIN_OP_PLUS_uxn_opcodes_h_l172_c22_c5e7_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l172_c22_c5e7_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l172_c22_c5e7_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l174_c11_8e3d]
signal BIN_OP_EQ_uxn_opcodes_h_l174_c11_8e3d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l174_c11_8e3d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l174_c11_8e3d_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l174_c7_a328]
signal tmp16_MUX_uxn_opcodes_h_l174_c7_a328_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l174_c7_a328_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l174_c7_a328_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l174_c7_a328_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l174_c7_a328]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_a328_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_a328_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_a328_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_a328_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l174_c7_a328]
signal result_u16_value_MUX_uxn_opcodes_h_l174_c7_a328_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l174_c7_a328_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l174_c7_a328_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l174_c7_a328_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l174_c7_a328]
signal result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_a328_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_a328_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_a328_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_a328_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l175_c3_7228]
signal BIN_OP_OR_uxn_opcodes_h_l175_c3_7228_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l175_c3_7228_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l175_c3_7228_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l177_c22_0d41]
signal BIN_OP_PLUS_uxn_opcodes_h_l177_c22_0d41_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l177_c22_0d41_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l177_c22_0d41_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l177_c22_99f7]
signal BIN_OP_PLUS_uxn_opcodes_h_l177_c22_99f7_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l177_c22_99f7_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l177_c22_99f7_return_output : unsigned(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l179_c11_4aa7]
signal BIN_OP_EQ_uxn_opcodes_h_l179_c11_4aa7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l179_c11_4aa7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l179_c11_4aa7_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l179_c7_943e]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_943e_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_943e_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_943e_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_943e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l179_c7_943e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_943e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_943e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_943e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_943e_return_output : unsigned(0 downto 0);

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_3985( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u16_value := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.u8_value := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_stack_write := ref_toks_7;
      base.is_pc_updated := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l144_c6_d168
BIN_OP_EQ_uxn_opcodes_h_l144_c6_d168 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l144_c6_d168_left,
BIN_OP_EQ_uxn_opcodes_h_l144_c6_d168_right,
BIN_OP_EQ_uxn_opcodes_h_l144_c6_d168_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l144_c1_5dbb
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l144_c1_5dbb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l144_c1_5dbb_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l144_c1_5dbb_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l144_c1_5dbb_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l144_c1_5dbb_return_output);

-- tmp16_MUX_uxn_opcodes_h_l144_c2_4dc1
tmp16_MUX_uxn_opcodes_h_l144_c2_4dc1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l144_c2_4dc1_cond,
tmp16_MUX_uxn_opcodes_h_l144_c2_4dc1_iftrue,
tmp16_MUX_uxn_opcodes_h_l144_c2_4dc1_iffalse,
tmp16_MUX_uxn_opcodes_h_l144_c2_4dc1_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l144_c2_4dc1
result_u16_value_MUX_uxn_opcodes_h_l144_c2_4dc1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l144_c2_4dc1_cond,
result_u16_value_MUX_uxn_opcodes_h_l144_c2_4dc1_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l144_c2_4dc1_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l144_c2_4dc1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_4dc1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_4dc1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_4dc1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_4dc1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_4dc1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_4dc1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_4dc1
result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_4dc1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_4dc1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_4dc1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_4dc1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_4dc1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_4dc1
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_4dc1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_4dc1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_4dc1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_4dc1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_4dc1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l144_c2_4dc1
result_u8_value_MUX_uxn_opcodes_h_l144_c2_4dc1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l144_c2_4dc1_cond,
result_u8_value_MUX_uxn_opcodes_h_l144_c2_4dc1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l144_c2_4dc1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l144_c2_4dc1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_4dc1
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_4dc1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_4dc1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_4dc1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_4dc1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_4dc1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_4dc1
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_4dc1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_4dc1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_4dc1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_4dc1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_4dc1_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_4dc1
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_4dc1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_4dc1_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_4dc1_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_4dc1_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_4dc1_return_output);

-- printf_uxn_opcodes_h_l145_c3_a319_uxn_opcodes_h_l145_c3_a319
printf_uxn_opcodes_h_l145_c3_a319_uxn_opcodes_h_l145_c3_a319 : entity work.printf_uxn_opcodes_h_l145_c3_a319_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l145_c3_a319_uxn_opcodes_h_l145_c3_a319_CLOCK_ENABLE);

-- BIN_OP_PLUS_uxn_opcodes_h_l148_c11_fc96
BIN_OP_PLUS_uxn_opcodes_h_l148_c11_fc96 : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l148_c11_fc96_left,
BIN_OP_PLUS_uxn_opcodes_h_l148_c11_fc96_right,
BIN_OP_PLUS_uxn_opcodes_h_l148_c11_fc96_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l151_c11_39a0
BIN_OP_EQ_uxn_opcodes_h_l151_c11_39a0 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l151_c11_39a0_left,
BIN_OP_EQ_uxn_opcodes_h_l151_c11_39a0_right,
BIN_OP_EQ_uxn_opcodes_h_l151_c11_39a0_return_output);

-- tmp16_MUX_uxn_opcodes_h_l151_c7_69a5
tmp16_MUX_uxn_opcodes_h_l151_c7_69a5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l151_c7_69a5_cond,
tmp16_MUX_uxn_opcodes_h_l151_c7_69a5_iftrue,
tmp16_MUX_uxn_opcodes_h_l151_c7_69a5_iffalse,
tmp16_MUX_uxn_opcodes_h_l151_c7_69a5_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l151_c7_69a5
result_u16_value_MUX_uxn_opcodes_h_l151_c7_69a5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l151_c7_69a5_cond,
result_u16_value_MUX_uxn_opcodes_h_l151_c7_69a5_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l151_c7_69a5_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l151_c7_69a5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_69a5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_69a5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_69a5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_69a5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_69a5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_69a5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_69a5
result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_69a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_69a5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_69a5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_69a5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_69a5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_69a5
result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_69a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_69a5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_69a5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_69a5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_69a5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_69a5
result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_69a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_69a5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_69a5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_69a5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_69a5_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_69a5
result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_69a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_69a5_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_69a5_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_69a5_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_69a5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l151_c7_69a5
result_u8_value_MUX_uxn_opcodes_h_l151_c7_69a5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l151_c7_69a5_cond,
result_u8_value_MUX_uxn_opcodes_h_l151_c7_69a5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l151_c7_69a5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l151_c7_69a5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l157_c11_796d
BIN_OP_EQ_uxn_opcodes_h_l157_c11_796d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l157_c11_796d_left,
BIN_OP_EQ_uxn_opcodes_h_l157_c11_796d_right,
BIN_OP_EQ_uxn_opcodes_h_l157_c11_796d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l157_c7_dd54
tmp16_MUX_uxn_opcodes_h_l157_c7_dd54 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l157_c7_dd54_cond,
tmp16_MUX_uxn_opcodes_h_l157_c7_dd54_iftrue,
tmp16_MUX_uxn_opcodes_h_l157_c7_dd54_iffalse,
tmp16_MUX_uxn_opcodes_h_l157_c7_dd54_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l157_c7_dd54
result_u16_value_MUX_uxn_opcodes_h_l157_c7_dd54 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l157_c7_dd54_cond,
result_u16_value_MUX_uxn_opcodes_h_l157_c7_dd54_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l157_c7_dd54_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l157_c7_dd54_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_dd54
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_dd54 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_dd54_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_dd54_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_dd54_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_dd54_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_dd54
result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_dd54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_dd54_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_dd54_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_dd54_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_dd54_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_dd54
result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_dd54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_dd54_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_dd54_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_dd54_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_dd54_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_dd54
result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_dd54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_dd54_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_dd54_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_dd54_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_dd54_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l157_c7_dd54
result_u8_value_MUX_uxn_opcodes_h_l157_c7_dd54 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l157_c7_dd54_cond,
result_u8_value_MUX_uxn_opcodes_h_l157_c7_dd54_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l157_c7_dd54_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l157_c7_dd54_return_output);

-- CONST_SR_8_uxn_opcodes_h_l159_c31_6d6d
CONST_SR_8_uxn_opcodes_h_l159_c31_6d6d : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l159_c31_6d6d_x,
CONST_SR_8_uxn_opcodes_h_l159_c31_6d6d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l162_c11_dc52
BIN_OP_EQ_uxn_opcodes_h_l162_c11_dc52 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l162_c11_dc52_left,
BIN_OP_EQ_uxn_opcodes_h_l162_c11_dc52_right,
BIN_OP_EQ_uxn_opcodes_h_l162_c11_dc52_return_output);

-- tmp16_MUX_uxn_opcodes_h_l162_c7_1ce9
tmp16_MUX_uxn_opcodes_h_l162_c7_1ce9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l162_c7_1ce9_cond,
tmp16_MUX_uxn_opcodes_h_l162_c7_1ce9_iftrue,
tmp16_MUX_uxn_opcodes_h_l162_c7_1ce9_iffalse,
tmp16_MUX_uxn_opcodes_h_l162_c7_1ce9_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_1ce9
result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_1ce9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_1ce9_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_1ce9_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_1ce9_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_1ce9_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l162_c7_1ce9
result_u16_value_MUX_uxn_opcodes_h_l162_c7_1ce9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l162_c7_1ce9_cond,
result_u16_value_MUX_uxn_opcodes_h_l162_c7_1ce9_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l162_c7_1ce9_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l162_c7_1ce9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_1ce9
result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_1ce9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_1ce9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_1ce9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_1ce9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_1ce9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_1ce9
result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_1ce9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_1ce9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_1ce9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_1ce9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_1ce9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l166_c11_d467
BIN_OP_EQ_uxn_opcodes_h_l166_c11_d467 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l166_c11_d467_left,
BIN_OP_EQ_uxn_opcodes_h_l166_c11_d467_right,
BIN_OP_EQ_uxn_opcodes_h_l166_c11_d467_return_output);

-- tmp16_MUX_uxn_opcodes_h_l166_c7_a6d0
tmp16_MUX_uxn_opcodes_h_l166_c7_a6d0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l166_c7_a6d0_cond,
tmp16_MUX_uxn_opcodes_h_l166_c7_a6d0_iftrue,
tmp16_MUX_uxn_opcodes_h_l166_c7_a6d0_iffalse,
tmp16_MUX_uxn_opcodes_h_l166_c7_a6d0_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_a6d0
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_a6d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_a6d0_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_a6d0_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_a6d0_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_a6d0_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l166_c7_a6d0
result_u16_value_MUX_uxn_opcodes_h_l166_c7_a6d0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l166_c7_a6d0_cond,
result_u16_value_MUX_uxn_opcodes_h_l166_c7_a6d0_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l166_c7_a6d0_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l166_c7_a6d0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_a6d0
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_a6d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_a6d0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_a6d0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_a6d0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_a6d0_return_output);

-- CONST_SL_8_uxn_opcodes_h_l168_c3_9f3e
CONST_SL_8_uxn_opcodes_h_l168_c3_9f3e : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l168_c3_9f3e_x,
CONST_SL_8_uxn_opcodes_h_l168_c3_9f3e_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l169_c22_965c
BIN_OP_PLUS_uxn_opcodes_h_l169_c22_965c : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l169_c22_965c_left,
BIN_OP_PLUS_uxn_opcodes_h_l169_c22_965c_right,
BIN_OP_PLUS_uxn_opcodes_h_l169_c22_965c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l171_c11_3917
BIN_OP_EQ_uxn_opcodes_h_l171_c11_3917 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l171_c11_3917_left,
BIN_OP_EQ_uxn_opcodes_h_l171_c11_3917_right,
BIN_OP_EQ_uxn_opcodes_h_l171_c11_3917_return_output);

-- tmp16_MUX_uxn_opcodes_h_l171_c7_d5a5
tmp16_MUX_uxn_opcodes_h_l171_c7_d5a5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l171_c7_d5a5_cond,
tmp16_MUX_uxn_opcodes_h_l171_c7_d5a5_iftrue,
tmp16_MUX_uxn_opcodes_h_l171_c7_d5a5_iffalse,
tmp16_MUX_uxn_opcodes_h_l171_c7_d5a5_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_d5a5
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_d5a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_d5a5_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_d5a5_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_d5a5_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_d5a5_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l171_c7_d5a5
result_u16_value_MUX_uxn_opcodes_h_l171_c7_d5a5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l171_c7_d5a5_cond,
result_u16_value_MUX_uxn_opcodes_h_l171_c7_d5a5_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l171_c7_d5a5_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l171_c7_d5a5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_d5a5
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_d5a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_d5a5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_d5a5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_d5a5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_d5a5_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l172_c22_c5e7
BIN_OP_PLUS_uxn_opcodes_h_l172_c22_c5e7 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l172_c22_c5e7_left,
BIN_OP_PLUS_uxn_opcodes_h_l172_c22_c5e7_right,
BIN_OP_PLUS_uxn_opcodes_h_l172_c22_c5e7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l174_c11_8e3d
BIN_OP_EQ_uxn_opcodes_h_l174_c11_8e3d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l174_c11_8e3d_left,
BIN_OP_EQ_uxn_opcodes_h_l174_c11_8e3d_right,
BIN_OP_EQ_uxn_opcodes_h_l174_c11_8e3d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l174_c7_a328
tmp16_MUX_uxn_opcodes_h_l174_c7_a328 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l174_c7_a328_cond,
tmp16_MUX_uxn_opcodes_h_l174_c7_a328_iftrue,
tmp16_MUX_uxn_opcodes_h_l174_c7_a328_iffalse,
tmp16_MUX_uxn_opcodes_h_l174_c7_a328_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_a328
result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_a328 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_a328_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_a328_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_a328_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_a328_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l174_c7_a328
result_u16_value_MUX_uxn_opcodes_h_l174_c7_a328 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l174_c7_a328_cond,
result_u16_value_MUX_uxn_opcodes_h_l174_c7_a328_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l174_c7_a328_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l174_c7_a328_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_a328
result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_a328 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_a328_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_a328_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_a328_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_a328_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l175_c3_7228
BIN_OP_OR_uxn_opcodes_h_l175_c3_7228 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l175_c3_7228_left,
BIN_OP_OR_uxn_opcodes_h_l175_c3_7228_right,
BIN_OP_OR_uxn_opcodes_h_l175_c3_7228_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l177_c22_0d41
BIN_OP_PLUS_uxn_opcodes_h_l177_c22_0d41 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l177_c22_0d41_left,
BIN_OP_PLUS_uxn_opcodes_h_l177_c22_0d41_right,
BIN_OP_PLUS_uxn_opcodes_h_l177_c22_0d41_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l177_c22_99f7
BIN_OP_PLUS_uxn_opcodes_h_l177_c22_99f7 : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l177_c22_99f7_left,
BIN_OP_PLUS_uxn_opcodes_h_l177_c22_99f7_right,
BIN_OP_PLUS_uxn_opcodes_h_l177_c22_99f7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l179_c11_4aa7
BIN_OP_EQ_uxn_opcodes_h_l179_c11_4aa7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l179_c11_4aa7_left,
BIN_OP_EQ_uxn_opcodes_h_l179_c11_4aa7_right,
BIN_OP_EQ_uxn_opcodes_h_l179_c11_4aa7_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_943e
result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_943e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_943e_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_943e_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_943e_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_943e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_943e
result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_943e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_943e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_943e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_943e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_943e_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 pc,
 previous_ram_read,
 -- Registers
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l144_c6_d168_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l144_c1_5dbb_return_output,
 tmp16_MUX_uxn_opcodes_h_l144_c2_4dc1_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l144_c2_4dc1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_4dc1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_4dc1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_4dc1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l144_c2_4dc1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_4dc1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_4dc1_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_4dc1_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l148_c11_fc96_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l151_c11_39a0_return_output,
 tmp16_MUX_uxn_opcodes_h_l151_c7_69a5_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l151_c7_69a5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_69a5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_69a5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_69a5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_69a5_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_69a5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l151_c7_69a5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l157_c11_796d_return_output,
 tmp16_MUX_uxn_opcodes_h_l157_c7_dd54_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l157_c7_dd54_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_dd54_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_dd54_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_dd54_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_dd54_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l157_c7_dd54_return_output,
 CONST_SR_8_uxn_opcodes_h_l159_c31_6d6d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l162_c11_dc52_return_output,
 tmp16_MUX_uxn_opcodes_h_l162_c7_1ce9_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_1ce9_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l162_c7_1ce9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_1ce9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_1ce9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l166_c11_d467_return_output,
 tmp16_MUX_uxn_opcodes_h_l166_c7_a6d0_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_a6d0_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l166_c7_a6d0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_a6d0_return_output,
 CONST_SL_8_uxn_opcodes_h_l168_c3_9f3e_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l169_c22_965c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l171_c11_3917_return_output,
 tmp16_MUX_uxn_opcodes_h_l171_c7_d5a5_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_d5a5_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l171_c7_d5a5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_d5a5_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l172_c22_c5e7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l174_c11_8e3d_return_output,
 tmp16_MUX_uxn_opcodes_h_l174_c7_a328_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_a328_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l174_c7_a328_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_a328_return_output,
 BIN_OP_OR_uxn_opcodes_h_l175_c3_7228_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l177_c22_0d41_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l177_c22_99f7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l179_c11_4aa7_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_943e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_943e_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_d168_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_d168_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_d168_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l144_c1_5dbb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l144_c1_5dbb_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l144_c1_5dbb_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l144_c1_5dbb_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_4dc1_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l148_c3_6981 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_4dc1_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l151_c7_69a5_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_4dc1_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_4dc1_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_4dc1_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_4dc1_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l151_c7_69a5_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_4dc1_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_4dc1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_4dc1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_4dc1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_69a5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_4dc1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_4dc1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_4dc1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_4dc1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_69a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_4dc1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_4dc1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_4dc1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_4dc1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_69a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_4dc1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_4dc1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_4dc1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_4dc1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l151_c7_69a5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_4dc1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_4dc1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_4dc1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l147_c3_4e71 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_4dc1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l144_c2_4dc1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_4dc1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_4dc1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_4dc1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_4dc1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_69a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_4dc1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_4dc1_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_4dc1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_4dc1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_69a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_4dc1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_4dc1_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l145_c3_a319_uxn_opcodes_h_l145_c3_a319_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_fc96_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_fc96_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_fc96_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l151_c11_39a0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l151_c11_39a0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l151_c11_39a0_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l151_c7_69a5_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l151_c7_69a5_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l157_c7_dd54_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l151_c7_69a5_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l151_c7_69a5_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l151_c7_69a5_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l157_c7_dd54_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l151_c7_69a5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_69a5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l154_c3_2eeb : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_69a5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_dd54_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_69a5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_69a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_69a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l151_c7_69a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_69a5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_69a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_69a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_dd54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_69a5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_69a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_69a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_dd54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_69a5_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_69a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_69a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_dd54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_69a5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l151_c7_69a5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l151_c7_69a5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l157_c7_dd54_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l151_c7_69a5_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l155_c21_c893_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_796d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_796d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_796d_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l157_c7_dd54_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l157_c7_dd54_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_1ce9_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l157_c7_dd54_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l157_c7_dd54_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l157_c7_dd54_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l162_c7_1ce9_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l157_c7_dd54_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_dd54_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l158_c3_a386 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_dd54_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_dd54_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_dd54_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_dd54_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_1ce9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_dd54_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_dd54_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_dd54_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_1ce9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_dd54_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_dd54_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_dd54_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_1ce9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_dd54_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l157_c7_dd54_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l157_c7_dd54_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l157_c7_dd54_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l159_c31_6d6d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l159_c31_6d6d_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l159_c21_2116_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_dc52_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_dc52_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_dc52_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_1ce9_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_1ce9_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_a6d0_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_1ce9_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_1ce9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_1ce9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_a6d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_1ce9_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l162_c7_1ce9_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l162_c7_1ce9_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_a6d0_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l162_c7_1ce9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_1ce9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_1ce9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_1ce9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_1ce9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_1ce9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_a6d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_1ce9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_d467_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_d467_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_d467_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_a6d0_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_a6d0_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_d5a5_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_a6d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_a6d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_a6d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_d5a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_a6d0_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_a6d0_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l169_c3_920c : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_a6d0_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_d5a5_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_a6d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_a6d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_a6d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_d5a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_a6d0_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_9f3e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_9f3e_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_965c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_965c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_965c_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_3917_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_3917_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_3917_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_d5a5_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_d5a5_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l174_c7_a328_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_d5a5_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_d5a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_d5a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_a328_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_d5a5_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_d5a5_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l172_c3_6954 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_d5a5_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l174_c7_a328_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_d5a5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_d5a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_d5a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_a328_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_d5a5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l172_c22_c5e7_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l172_c22_c5e7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l172_c22_c5e7_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l174_c11_8e3d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l174_c11_8e3d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l174_c11_8e3d_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l174_c7_a328_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l174_c7_a328_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l174_c7_a328_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_a328_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_a328_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_943e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_a328_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l174_c7_a328_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l177_c3_5117 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l174_c7_a328_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l174_c7_a328_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_a328_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_a328_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_943e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_a328_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l175_c3_7228_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l175_c3_7228_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l175_c3_7228_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c22_0d41_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c22_0d41_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c22_0d41_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c22_99f7_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c22_99f7_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c22_99f7_return_output : unsigned(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_4aa7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_4aa7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_4aa7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_943e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_943e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_943e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_943e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_943e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_943e_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l144_l174_l151_DUPLICATE_bf7a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l157_l144_DUPLICATE_a808_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l157_l144_DUPLICATE_8c2b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l157_l144_l162_DUPLICATE_b1ba_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l166_l162_l157_l151_l179_l144_l171_DUPLICATE_f633_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l166_l162_l157_l151_l179_l174_l171_DUPLICATE_774d_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l175_l167_DUPLICATE_5959_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3985_uxn_opcodes_h_l184_l140_DUPLICATE_68bc_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_fc96_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l151_c11_39a0_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c22_99f7_right := to_unsigned(2, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l147_c3_4e71 := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_4dc1_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l147_c3_4e71;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_a328_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_965c_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l154_c3_2eeb := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_69a5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l154_c3_2eeb;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_dc52_right := to_unsigned(3, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_4dc1_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_943e_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l174_c11_8e3d_right := to_unsigned(6, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l144_c1_5dbb_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_d467_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_d168_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_4aa7_right := to_unsigned(7, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_69a5_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l158_c3_a386 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_dd54_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l158_c3_a386;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l172_c22_c5e7_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_796d_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_3917_right := to_unsigned(5, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_1ce9_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_943e_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_69a5_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_4dc1_iftrue := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_pc := pc;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l144_c1_5dbb_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_fc96_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_965c_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l172_c22_c5e7_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c22_0d41_left := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l157_c7_dd54_iftrue := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l162_c7_1ce9_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_d168_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l151_c11_39a0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_796d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_dc52_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_d467_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_3917_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l174_c11_8e3d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_4aa7_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l175_c3_7228_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l159_c31_6d6d_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l151_c7_69a5_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l157_c7_dd54_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_1ce9_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_d5a5_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l174_c7_a328_iffalse := tmp16;
     -- result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d[uxn_opcodes_h_l151_c7_69a5] LATENCY=0
     VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l151_c7_69a5_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l157_c11_796d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l157_c11_796d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_796d_left;
     BIN_OP_EQ_uxn_opcodes_h_l157_c11_796d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_796d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_796d_return_output := BIN_OP_EQ_uxn_opcodes_h_l157_c11_796d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l174_c11_8e3d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l174_c11_8e3d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l174_c11_8e3d_left;
     BIN_OP_EQ_uxn_opcodes_h_l174_c11_8e3d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l174_c11_8e3d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l174_c11_8e3d_return_output := BIN_OP_EQ_uxn_opcodes_h_l174_c11_8e3d_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l157_l144_DUPLICATE_a808 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l157_l144_DUPLICATE_a808_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l166_c11_d467] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l166_c11_d467_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_d467_left;
     BIN_OP_EQ_uxn_opcodes_h_l166_c11_d467_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_d467_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_d467_return_output := BIN_OP_EQ_uxn_opcodes_h_l166_c11_d467_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l157_l144_DUPLICATE_8c2b LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l157_l144_DUPLICATE_8c2b_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l179_c11_4aa7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l179_c11_4aa7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_4aa7_left;
     BIN_OP_EQ_uxn_opcodes_h_l179_c11_4aa7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_4aa7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_4aa7_return_output := BIN_OP_EQ_uxn_opcodes_h_l179_c11_4aa7_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l175_l167_DUPLICATE_5959 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l175_l167_DUPLICATE_5959_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l157_l144_l162_DUPLICATE_b1ba LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l157_l144_l162_DUPLICATE_b1ba_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l162_c11_dc52] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l162_c11_dc52_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_dc52_left;
     BIN_OP_EQ_uxn_opcodes_h_l162_c11_dc52_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_dc52_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_dc52_return_output := BIN_OP_EQ_uxn_opcodes_h_l162_c11_dc52_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l169_c22_965c] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l169_c22_965c_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_965c_left;
     BIN_OP_PLUS_uxn_opcodes_h_l169_c22_965c_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_965c_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_965c_return_output := BIN_OP_PLUS_uxn_opcodes_h_l169_c22_965c_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l144_l174_l151_DUPLICATE_bf7a LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l144_l174_l151_DUPLICATE_bf7a_return_output := result.u16_value;

     -- BIN_OP_PLUS[uxn_opcodes_h_l172_c22_c5e7] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l172_c22_c5e7_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l172_c22_c5e7_left;
     BIN_OP_PLUS_uxn_opcodes_h_l172_c22_c5e7_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l172_c22_c5e7_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l172_c22_c5e7_return_output := BIN_OP_PLUS_uxn_opcodes_h_l172_c22_c5e7_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l166_l162_l157_l151_l179_l174_l171_DUPLICATE_774d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l166_l162_l157_l151_l179_l174_l171_DUPLICATE_774d_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l166_l162_l157_l151_l179_l144_l171_DUPLICATE_f633 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l166_l162_l157_l151_l179_l144_l171_DUPLICATE_f633_return_output := result.is_pc_updated;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l155_c21_c893] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l155_c21_c893_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- BIN_OP_EQ[uxn_opcodes_h_l171_c11_3917] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l171_c11_3917_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_3917_left;
     BIN_OP_EQ_uxn_opcodes_h_l171_c11_3917_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_3917_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_3917_return_output := BIN_OP_EQ_uxn_opcodes_h_l171_c11_3917_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l144_c6_d168] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l144_c6_d168_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_d168_left;
     BIN_OP_EQ_uxn_opcodes_h_l144_c6_d168_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_d168_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_d168_return_output := BIN_OP_EQ_uxn_opcodes_h_l144_c6_d168_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l148_c11_fc96] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l148_c11_fc96_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_fc96_left;
     BIN_OP_PLUS_uxn_opcodes_h_l148_c11_fc96_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_fc96_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_fc96_return_output := BIN_OP_PLUS_uxn_opcodes_h_l148_c11_fc96_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l159_c31_6d6d] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l159_c31_6d6d_x <= VAR_CONST_SR_8_uxn_opcodes_h_l159_c31_6d6d_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l159_c31_6d6d_return_output := CONST_SR_8_uxn_opcodes_h_l159_c31_6d6d_return_output;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l144_c2_4dc1] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l144_c2_4dc1_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l151_c11_39a0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l151_c11_39a0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l151_c11_39a0_left;
     BIN_OP_EQ_uxn_opcodes_h_l151_c11_39a0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l151_c11_39a0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l151_c11_39a0_return_output := BIN_OP_EQ_uxn_opcodes_h_l151_c11_39a0_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l144_c1_5dbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_d168_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_4dc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_d168_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_4dc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_d168_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_4dc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_d168_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_4dc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_d168_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_4dc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_d168_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_4dc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_d168_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_4dc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_d168_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_4dc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_d168_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_4dc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_d168_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_69a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l151_c11_39a0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_69a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l151_c11_39a0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_69a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l151_c11_39a0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_69a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l151_c11_39a0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_69a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l151_c11_39a0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l151_c7_69a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l151_c11_39a0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l151_c7_69a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l151_c11_39a0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l151_c7_69a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l151_c11_39a0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_dd54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_796d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_dd54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_796d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_dd54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_796d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_dd54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_796d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l157_c7_dd54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_796d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l157_c7_dd54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_796d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l157_c7_dd54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_796d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_1ce9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_dc52_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_1ce9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_dc52_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_1ce9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_dc52_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l162_c7_1ce9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_dc52_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_1ce9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_dc52_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_a6d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_d467_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_a6d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_d467_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_a6d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_d467_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_a6d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_d467_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_d5a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_3917_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_d5a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_3917_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_d5a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_3917_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_d5a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_3917_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_a328_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l174_c11_8e3d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_a328_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l174_c11_8e3d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l174_c7_a328_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l174_c11_8e3d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l174_c7_a328_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l174_c11_8e3d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_943e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_4aa7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_943e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_4aa7_return_output;
     VAR_tmp16_uxn_opcodes_h_l148_c3_6981 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_fc96_return_output, 16);
     VAR_result_u16_value_uxn_opcodes_h_l169_c3_920c := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_965c_return_output, 16);
     VAR_result_u16_value_uxn_opcodes_h_l172_c3_6954 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l172_c22_c5e7_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l175_c3_7228_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l175_l167_DUPLICATE_5959_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_9f3e_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l175_l167_DUPLICATE_5959_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l151_c7_69a5_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l155_c21_c893_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_4dc1_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l144_l174_l151_DUPLICATE_bf7a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l151_c7_69a5_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l144_l174_l151_DUPLICATE_bf7a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l174_c7_a328_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l144_l174_l151_DUPLICATE_bf7a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_69a5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l166_l162_l157_l151_l179_l174_l171_DUPLICATE_774d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_dd54_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l166_l162_l157_l151_l179_l174_l171_DUPLICATE_774d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_1ce9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l166_l162_l157_l151_l179_l174_l171_DUPLICATE_774d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_a6d0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l166_l162_l157_l151_l179_l174_l171_DUPLICATE_774d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_d5a5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l166_l162_l157_l151_l179_l174_l171_DUPLICATE_774d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_a328_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l166_l162_l157_l151_l179_l174_l171_DUPLICATE_774d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_943e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l166_l162_l157_l151_l179_l174_l171_DUPLICATE_774d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_4dc1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l166_l162_l157_l151_l179_l144_l171_DUPLICATE_f633_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_69a5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l166_l162_l157_l151_l179_l144_l171_DUPLICATE_f633_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_dd54_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l166_l162_l157_l151_l179_l144_l171_DUPLICATE_f633_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_1ce9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l166_l162_l157_l151_l179_l144_l171_DUPLICATE_f633_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_a6d0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l166_l162_l157_l151_l179_l144_l171_DUPLICATE_f633_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_d5a5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l166_l162_l157_l151_l179_l144_l171_DUPLICATE_f633_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_943e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l166_l162_l157_l151_l179_l144_l171_DUPLICATE_f633_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_4dc1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l157_l144_l162_DUPLICATE_b1ba_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_dd54_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l157_l144_l162_DUPLICATE_b1ba_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_1ce9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l157_l144_l162_DUPLICATE_b1ba_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_4dc1_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l157_l144_DUPLICATE_a808_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_dd54_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l157_l144_DUPLICATE_a808_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_4dc1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l157_l144_DUPLICATE_8c2b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l157_c7_dd54_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l157_l144_DUPLICATE_8c2b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_69a5_iffalse := VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l151_c7_69a5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_4dc1_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l144_c2_4dc1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_a6d0_iftrue := VAR_result_u16_value_uxn_opcodes_h_l169_c3_920c;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_d5a5_iftrue := VAR_result_u16_value_uxn_opcodes_h_l172_c3_6954;
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_4dc1_iftrue := VAR_tmp16_uxn_opcodes_h_l148_c3_6981;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l179_c7_943e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_943e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_943e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_943e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_943e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_943e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_943e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_943e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_943e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l157_c7_dd54] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_dd54_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_dd54_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_dd54_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_dd54_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_dd54_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_dd54_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_dd54_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_dd54_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l151_c7_69a5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_69a5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_69a5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_69a5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_69a5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_69a5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_69a5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_69a5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_69a5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l144_c1_5dbb] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l144_c1_5dbb_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l144_c1_5dbb_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l144_c1_5dbb_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l144_c1_5dbb_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l144_c1_5dbb_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l144_c1_5dbb_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l144_c1_5dbb_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l144_c1_5dbb_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l159_c21_2116] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l159_c21_2116_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l159_c31_6d6d_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l162_c7_1ce9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_1ce9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_1ce9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_1ce9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_1ce9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_1ce9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_1ce9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_1ce9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_1ce9_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l179_c7_943e] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_943e_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_943e_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_943e_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_943e_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_943e_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_943e_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_943e_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_943e_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l175_c3_7228] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l175_c3_7228_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l175_c3_7228_left;
     BIN_OP_OR_uxn_opcodes_h_l175_c3_7228_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l175_c3_7228_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l175_c3_7228_return_output := BIN_OP_OR_uxn_opcodes_h_l175_c3_7228_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l144_c2_4dc1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_4dc1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_4dc1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_4dc1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_4dc1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_4dc1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_4dc1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_4dc1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_4dc1_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l168_c3_9f3e] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l168_c3_9f3e_x <= VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_9f3e_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_9f3e_return_output := CONST_SL_8_uxn_opcodes_h_l168_c3_9f3e_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c22_0d41_right := VAR_BIN_OP_OR_uxn_opcodes_h_l175_c3_7228_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l174_c7_a328_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l175_c3_7228_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l157_c7_dd54_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l159_c21_2116_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_a6d0_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_9f3e_return_output;
     VAR_printf_uxn_opcodes_h_l145_c3_a319_uxn_opcodes_h_l145_c3_a319_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l144_c1_5dbb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_a328_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_943e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_a328_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_943e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_4dc1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_69a5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_dd54_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_1ce9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_69a5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_dd54_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l157_c7_dd54] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_dd54_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_dd54_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_dd54_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_dd54_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_dd54_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_dd54_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_dd54_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_dd54_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l144_c2_4dc1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_4dc1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_4dc1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_4dc1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_4dc1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_4dc1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_4dc1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_4dc1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_4dc1_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l177_c22_0d41] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l177_c22_0d41_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c22_0d41_left;
     BIN_OP_PLUS_uxn_opcodes_h_l177_c22_0d41_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c22_0d41_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c22_0d41_return_output := BIN_OP_PLUS_uxn_opcodes_h_l177_c22_0d41_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l174_c7_a328] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_a328_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_a328_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_a328_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_a328_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_a328_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_a328_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_a328_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_a328_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l151_c7_69a5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_69a5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_69a5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_69a5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_69a5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_69a5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_69a5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_69a5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_69a5_return_output;

     -- printf_uxn_opcodes_h_l145_c3_a319[uxn_opcodes_h_l145_c3_a319] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l145_c3_a319_uxn_opcodes_h_l145_c3_a319_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l145_c3_a319_uxn_opcodes_h_l145_c3_a319_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l174_c7_a328] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_a328_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_a328_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_a328_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_a328_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_a328_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_a328_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_a328_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_a328_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l157_c7_dd54] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l157_c7_dd54_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l157_c7_dd54_cond;
     result_u8_value_MUX_uxn_opcodes_h_l157_c7_dd54_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l157_c7_dd54_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l157_c7_dd54_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l157_c7_dd54_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l157_c7_dd54_return_output := result_u8_value_MUX_uxn_opcodes_h_l157_c7_dd54_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l174_c7_a328] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l174_c7_a328_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l174_c7_a328_cond;
     tmp16_MUX_uxn_opcodes_h_l174_c7_a328_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l174_c7_a328_iftrue;
     tmp16_MUX_uxn_opcodes_h_l174_c7_a328_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l174_c7_a328_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l174_c7_a328_return_output := tmp16_MUX_uxn_opcodes_h_l174_c7_a328_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c22_99f7_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c22_0d41_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_d5a5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_a328_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_d5a5_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_a328_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_69a5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_dd54_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_4dc1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_69a5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l151_c7_69a5_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l157_c7_dd54_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_d5a5_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l174_c7_a328_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l171_c7_d5a5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_d5a5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_d5a5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_d5a5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_d5a5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_d5a5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_d5a5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_d5a5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_d5a5_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l177_c22_99f7] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l177_c22_99f7_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c22_99f7_left;
     BIN_OP_PLUS_uxn_opcodes_h_l177_c22_99f7_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c22_99f7_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c22_99f7_return_output := BIN_OP_PLUS_uxn_opcodes_h_l177_c22_99f7_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l171_c7_d5a5] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l171_c7_d5a5_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_d5a5_cond;
     tmp16_MUX_uxn_opcodes_h_l171_c7_d5a5_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_d5a5_iftrue;
     tmp16_MUX_uxn_opcodes_h_l171_c7_d5a5_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_d5a5_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_d5a5_return_output := tmp16_MUX_uxn_opcodes_h_l171_c7_d5a5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l151_c7_69a5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_69a5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_69a5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_69a5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_69a5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_69a5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_69a5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_69a5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_69a5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l144_c2_4dc1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_4dc1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_4dc1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_4dc1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_4dc1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_4dc1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_4dc1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_4dc1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_4dc1_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l171_c7_d5a5] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_d5a5_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_d5a5_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_d5a5_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_d5a5_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_d5a5_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_d5a5_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_d5a5_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_d5a5_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l151_c7_69a5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l151_c7_69a5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l151_c7_69a5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l151_c7_69a5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l151_c7_69a5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l151_c7_69a5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l151_c7_69a5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l151_c7_69a5_return_output := result_u8_value_MUX_uxn_opcodes_h_l151_c7_69a5_return_output;

     -- Submodule level 4
     VAR_result_u16_value_uxn_opcodes_h_l177_c3_5117 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c22_99f7_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_a6d0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_d5a5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_a6d0_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_d5a5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_4dc1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_69a5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_4dc1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l151_c7_69a5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_a6d0_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_d5a5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l174_c7_a328_iftrue := VAR_result_u16_value_uxn_opcodes_h_l177_c3_5117;
     -- result_u8_value_MUX[uxn_opcodes_h_l144_c2_4dc1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l144_c2_4dc1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_4dc1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l144_c2_4dc1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_4dc1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l144_c2_4dc1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_4dc1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_4dc1_return_output := result_u8_value_MUX_uxn_opcodes_h_l144_c2_4dc1_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l166_c7_a6d0] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_a6d0_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_a6d0_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_a6d0_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_a6d0_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_a6d0_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_a6d0_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_a6d0_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_a6d0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l166_c7_a6d0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_a6d0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_a6d0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_a6d0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_a6d0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_a6d0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_a6d0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_a6d0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_a6d0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l144_c2_4dc1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_4dc1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_4dc1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_4dc1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_4dc1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_4dc1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_4dc1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_4dc1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_4dc1_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l166_c7_a6d0] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l166_c7_a6d0_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_a6d0_cond;
     tmp16_MUX_uxn_opcodes_h_l166_c7_a6d0_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_a6d0_iftrue;
     tmp16_MUX_uxn_opcodes_h_l166_c7_a6d0_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_a6d0_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_a6d0_return_output := tmp16_MUX_uxn_opcodes_h_l166_c7_a6d0_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l174_c7_a328] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l174_c7_a328_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l174_c7_a328_cond;
     result_u16_value_MUX_uxn_opcodes_h_l174_c7_a328_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l174_c7_a328_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l174_c7_a328_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l174_c7_a328_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l174_c7_a328_return_output := result_u16_value_MUX_uxn_opcodes_h_l174_c7_a328_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_1ce9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_a6d0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_1ce9_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_a6d0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_d5a5_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l174_c7_a328_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_1ce9_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_a6d0_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l162_c7_1ce9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_1ce9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_1ce9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_1ce9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_1ce9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_1ce9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_1ce9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_1ce9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_1ce9_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l162_c7_1ce9] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_1ce9_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_1ce9_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_1ce9_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_1ce9_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_1ce9_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_1ce9_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_1ce9_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_1ce9_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l162_c7_1ce9] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l162_c7_1ce9_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_1ce9_cond;
     tmp16_MUX_uxn_opcodes_h_l162_c7_1ce9_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_1ce9_iftrue;
     tmp16_MUX_uxn_opcodes_h_l162_c7_1ce9_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_1ce9_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_1ce9_return_output := tmp16_MUX_uxn_opcodes_h_l162_c7_1ce9_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l171_c7_d5a5] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l171_c7_d5a5_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_d5a5_cond;
     result_u16_value_MUX_uxn_opcodes_h_l171_c7_d5a5_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_d5a5_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l171_c7_d5a5_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_d5a5_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_d5a5_return_output := result_u16_value_MUX_uxn_opcodes_h_l171_c7_d5a5_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_dd54_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_1ce9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_dd54_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_1ce9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_a6d0_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_d5a5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l157_c7_dd54_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_1ce9_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l157_c7_dd54] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_dd54_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_dd54_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_dd54_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_dd54_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_dd54_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_dd54_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_dd54_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_dd54_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l166_c7_a6d0] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l166_c7_a6d0_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_a6d0_cond;
     result_u16_value_MUX_uxn_opcodes_h_l166_c7_a6d0_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_a6d0_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l166_c7_a6d0_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_a6d0_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_a6d0_return_output := result_u16_value_MUX_uxn_opcodes_h_l166_c7_a6d0_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l157_c7_dd54] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_dd54_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_dd54_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_dd54_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_dd54_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_dd54_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_dd54_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_dd54_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_dd54_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l157_c7_dd54] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l157_c7_dd54_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l157_c7_dd54_cond;
     tmp16_MUX_uxn_opcodes_h_l157_c7_dd54_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l157_c7_dd54_iftrue;
     tmp16_MUX_uxn_opcodes_h_l157_c7_dd54_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l157_c7_dd54_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l157_c7_dd54_return_output := tmp16_MUX_uxn_opcodes_h_l157_c7_dd54_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_69a5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_dd54_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_69a5_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_dd54_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l162_c7_1ce9_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_a6d0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l151_c7_69a5_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l157_c7_dd54_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l151_c7_69a5] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_69a5_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_69a5_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_69a5_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_69a5_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_69a5_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_69a5_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_69a5_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_69a5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l151_c7_69a5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_69a5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_69a5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_69a5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_69a5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_69a5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_69a5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_69a5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_69a5_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l162_c7_1ce9] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l162_c7_1ce9_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l162_c7_1ce9_cond;
     result_u16_value_MUX_uxn_opcodes_h_l162_c7_1ce9_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l162_c7_1ce9_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l162_c7_1ce9_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l162_c7_1ce9_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l162_c7_1ce9_return_output := result_u16_value_MUX_uxn_opcodes_h_l162_c7_1ce9_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l151_c7_69a5] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l151_c7_69a5_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l151_c7_69a5_cond;
     tmp16_MUX_uxn_opcodes_h_l151_c7_69a5_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l151_c7_69a5_iftrue;
     tmp16_MUX_uxn_opcodes_h_l151_c7_69a5_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l151_c7_69a5_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l151_c7_69a5_return_output := tmp16_MUX_uxn_opcodes_h_l151_c7_69a5_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_4dc1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_69a5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_4dc1_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_69a5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l157_c7_dd54_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l162_c7_1ce9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_4dc1_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l151_c7_69a5_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l157_c7_dd54] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l157_c7_dd54_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l157_c7_dd54_cond;
     result_u16_value_MUX_uxn_opcodes_h_l157_c7_dd54_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l157_c7_dd54_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l157_c7_dd54_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l157_c7_dd54_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l157_c7_dd54_return_output := result_u16_value_MUX_uxn_opcodes_h_l157_c7_dd54_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l144_c2_4dc1] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l144_c2_4dc1_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_4dc1_cond;
     tmp16_MUX_uxn_opcodes_h_l144_c2_4dc1_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_4dc1_iftrue;
     tmp16_MUX_uxn_opcodes_h_l144_c2_4dc1_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_4dc1_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_4dc1_return_output := tmp16_MUX_uxn_opcodes_h_l144_c2_4dc1_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l144_c2_4dc1] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_4dc1_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_4dc1_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_4dc1_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_4dc1_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_4dc1_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_4dc1_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_4dc1_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_4dc1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l144_c2_4dc1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_4dc1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_4dc1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_4dc1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_4dc1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_4dc1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_4dc1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_4dc1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_4dc1_return_output;

     -- Submodule level 9
     VAR_result_u16_value_MUX_uxn_opcodes_h_l151_c7_69a5_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l157_c7_dd54_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_4dc1_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l151_c7_69a5] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l151_c7_69a5_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l151_c7_69a5_cond;
     result_u16_value_MUX_uxn_opcodes_h_l151_c7_69a5_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l151_c7_69a5_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l151_c7_69a5_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l151_c7_69a5_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l151_c7_69a5_return_output := result_u16_value_MUX_uxn_opcodes_h_l151_c7_69a5_return_output;

     -- Submodule level 10
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_4dc1_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l151_c7_69a5_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l144_c2_4dc1] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l144_c2_4dc1_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_4dc1_cond;
     result_u16_value_MUX_uxn_opcodes_h_l144_c2_4dc1_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_4dc1_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l144_c2_4dc1_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_4dc1_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_4dc1_return_output := result_u16_value_MUX_uxn_opcodes_h_l144_c2_4dc1_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_3985_uxn_opcodes_h_l184_l140_DUPLICATE_68bc LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3985_uxn_opcodes_h_l184_l140_DUPLICATE_68bc_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3985(
     result,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_4dc1_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_4dc1_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_4dc1_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_4dc1_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_4dc1_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_4dc1_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_4dc1_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_4dc1_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3985_uxn_opcodes_h_l184_l140_DUPLICATE_68bc_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3985_uxn_opcodes_h_l184_l140_DUPLICATE_68bc_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
