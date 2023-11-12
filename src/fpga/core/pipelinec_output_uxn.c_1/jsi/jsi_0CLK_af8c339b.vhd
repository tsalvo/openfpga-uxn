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
-- Submodules: 59
entity jsi_0CLK_af8c339b is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jsi_0CLK_af8c339b;
architecture arch of jsi_0CLK_af8c339b is
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
-- BIN_OP_EQ[uxn_opcodes_h_l140_c6_bda4]
signal BIN_OP_EQ_uxn_opcodes_h_l140_c6_bda4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l140_c6_bda4_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l140_c6_bda4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l140_c1_653f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_653f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_653f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_653f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_653f_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l140_c2_0fea]
signal result_u16_value_MUX_uxn_opcodes_h_l140_c2_0fea_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l140_c2_0fea_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l140_c2_0fea_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l140_c2_0fea_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l140_c2_0fea]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_0fea_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_0fea_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_0fea_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_0fea_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l140_c2_0fea]
signal result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_0fea_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_0fea_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_0fea_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_0fea_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l140_c2_0fea]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_0fea_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_0fea_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_0fea_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_0fea_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l140_c2_0fea]
signal result_u8_value_MUX_uxn_opcodes_h_l140_c2_0fea_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l140_c2_0fea_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l140_c2_0fea_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l140_c2_0fea_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l140_c2_0fea]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_0fea_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_0fea_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_0fea_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_0fea_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l140_c2_0fea]
signal result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_0fea_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_0fea_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_0fea_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_0fea_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l140_c2_0fea]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_0fea_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_0fea_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_0fea_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_0fea_return_output : signed(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l140_c2_0fea]
signal tmp16_MUX_uxn_opcodes_h_l140_c2_0fea_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l140_c2_0fea_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l140_c2_0fea_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l140_c2_0fea_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l141_c3_d47f[uxn_opcodes_h_l141_c3_d47f]
signal printf_uxn_opcodes_h_l141_c3_d47f_uxn_opcodes_h_l141_c3_d47f_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l144_c11_3801]
signal BIN_OP_PLUS_uxn_opcodes_h_l144_c11_3801_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l144_c11_3801_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l144_c11_3801_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l147_c11_af41]
signal BIN_OP_EQ_uxn_opcodes_h_l147_c11_af41_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l147_c11_af41_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l147_c11_af41_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l147_c7_f30f]
signal result_u16_value_MUX_uxn_opcodes_h_l147_c7_f30f_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l147_c7_f30f_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l147_c7_f30f_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l147_c7_f30f_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l147_c7_f30f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_f30f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_f30f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_f30f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_f30f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l147_c7_f30f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_f30f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_f30f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_f30f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_f30f_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l147_c7_f30f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_f30f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_f30f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_f30f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_f30f_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l147_c7_f30f]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_f30f_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_f30f_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_f30f_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_f30f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l147_c7_f30f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_f30f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_f30f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_f30f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_f30f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l147_c7_f30f]
signal result_u8_value_MUX_uxn_opcodes_h_l147_c7_f30f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l147_c7_f30f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l147_c7_f30f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l147_c7_f30f_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l147_c7_f30f]
signal tmp16_MUX_uxn_opcodes_h_l147_c7_f30f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l147_c7_f30f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l147_c7_f30f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l147_c7_f30f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l153_c11_c3da]
signal BIN_OP_EQ_uxn_opcodes_h_l153_c11_c3da_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l153_c11_c3da_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l153_c11_c3da_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l153_c7_599f]
signal result_u16_value_MUX_uxn_opcodes_h_l153_c7_599f_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l153_c7_599f_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l153_c7_599f_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l153_c7_599f_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l153_c7_599f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_599f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_599f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_599f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_599f_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l153_c7_599f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_599f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_599f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_599f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_599f_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l153_c7_599f]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_599f_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_599f_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_599f_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_599f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l153_c7_599f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_599f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_599f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_599f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_599f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l153_c7_599f]
signal result_u8_value_MUX_uxn_opcodes_h_l153_c7_599f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l153_c7_599f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l153_c7_599f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l153_c7_599f_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l153_c7_599f]
signal tmp16_MUX_uxn_opcodes_h_l153_c7_599f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l153_c7_599f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l153_c7_599f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l153_c7_599f_return_output : unsigned(15 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l155_c31_b8ed]
signal CONST_SR_8_uxn_opcodes_h_l155_c31_b8ed_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l155_c31_b8ed_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l158_c11_bb52]
signal BIN_OP_EQ_uxn_opcodes_h_l158_c11_bb52_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l158_c11_bb52_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l158_c11_bb52_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l158_c7_19ff]
signal result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_19ff_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_19ff_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_19ff_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_19ff_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l158_c7_19ff]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_19ff_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_19ff_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_19ff_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_19ff_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l158_c7_19ff]
signal result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_19ff_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_19ff_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_19ff_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_19ff_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l158_c7_19ff]
signal result_u16_value_MUX_uxn_opcodes_h_l158_c7_19ff_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l158_c7_19ff_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l158_c7_19ff_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l158_c7_19ff_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l158_c7_19ff]
signal tmp16_MUX_uxn_opcodes_h_l158_c7_19ff_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l158_c7_19ff_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l158_c7_19ff_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l158_c7_19ff_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l160_c22_f229]
signal BIN_OP_PLUS_uxn_opcodes_h_l160_c22_f229_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l160_c22_f229_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l160_c22_f229_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l162_c11_fd34]
signal BIN_OP_EQ_uxn_opcodes_h_l162_c11_fd34_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l162_c11_fd34_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l162_c11_fd34_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l162_c7_bdde]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_bdde_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_bdde_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_bdde_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_bdde_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l162_c7_bdde]
signal result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_bdde_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_bdde_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_bdde_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_bdde_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l162_c7_bdde]
signal result_u16_value_MUX_uxn_opcodes_h_l162_c7_bdde_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l162_c7_bdde_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l162_c7_bdde_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l162_c7_bdde_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l162_c7_bdde]
signal tmp16_MUX_uxn_opcodes_h_l162_c7_bdde_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l162_c7_bdde_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l162_c7_bdde_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l162_c7_bdde_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l164_c3_36c6]
signal CONST_SL_8_uxn_opcodes_h_l164_c3_36c6_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l164_c3_36c6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l166_c11_2239]
signal BIN_OP_EQ_uxn_opcodes_h_l166_c11_2239_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l166_c11_2239_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l166_c11_2239_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l166_c7_7f29]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_7f29_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_7f29_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_7f29_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_7f29_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l166_c7_7f29]
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_7f29_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_7f29_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_7f29_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_7f29_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l166_c7_7f29]
signal result_u16_value_MUX_uxn_opcodes_h_l166_c7_7f29_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l166_c7_7f29_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l166_c7_7f29_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l166_c7_7f29_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l166_c7_7f29]
signal tmp16_MUX_uxn_opcodes_h_l166_c7_7f29_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l166_c7_7f29_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l166_c7_7f29_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l166_c7_7f29_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l167_c3_d83e]
signal BIN_OP_OR_uxn_opcodes_h_l167_c3_d83e_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l167_c3_d83e_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l167_c3_d83e_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l169_c22_2548]
signal BIN_OP_PLUS_uxn_opcodes_h_l169_c22_2548_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l169_c22_2548_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l169_c22_2548_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l169_c22_8bc0]
signal BIN_OP_PLUS_uxn_opcodes_h_l169_c22_8bc0_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l169_c22_8bc0_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l169_c22_8bc0_return_output : unsigned(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l171_c11_222f]
signal BIN_OP_EQ_uxn_opcodes_h_l171_c11_222f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l171_c11_222f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l171_c11_222f_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l171_c7_4b0c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_4b0c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_4b0c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_4b0c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_4b0c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l171_c7_4b0c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_4b0c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_4b0c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_4b0c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_4b0c_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_bc18( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u16_value := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.u8_value := ref_toks_5;
      base.is_pc_updated := ref_toks_6;
      base.is_opc_done := ref_toks_7;
      base.sp_relative_shift := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l140_c6_bda4
BIN_OP_EQ_uxn_opcodes_h_l140_c6_bda4 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l140_c6_bda4_left,
BIN_OP_EQ_uxn_opcodes_h_l140_c6_bda4_right,
BIN_OP_EQ_uxn_opcodes_h_l140_c6_bda4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_653f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_653f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_653f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_653f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_653f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_653f_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l140_c2_0fea
result_u16_value_MUX_uxn_opcodes_h_l140_c2_0fea : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l140_c2_0fea_cond,
result_u16_value_MUX_uxn_opcodes_h_l140_c2_0fea_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l140_c2_0fea_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l140_c2_0fea_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_0fea
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_0fea : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_0fea_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_0fea_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_0fea_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_0fea_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_0fea
result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_0fea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_0fea_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_0fea_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_0fea_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_0fea_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_0fea
result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_0fea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_0fea_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_0fea_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_0fea_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_0fea_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l140_c2_0fea
result_u8_value_MUX_uxn_opcodes_h_l140_c2_0fea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l140_c2_0fea_cond,
result_u8_value_MUX_uxn_opcodes_h_l140_c2_0fea_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l140_c2_0fea_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l140_c2_0fea_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_0fea
result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_0fea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_0fea_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_0fea_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_0fea_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_0fea_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_0fea
result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_0fea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_0fea_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_0fea_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_0fea_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_0fea_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_0fea
result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_0fea : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_0fea_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_0fea_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_0fea_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_0fea_return_output);

-- tmp16_MUX_uxn_opcodes_h_l140_c2_0fea
tmp16_MUX_uxn_opcodes_h_l140_c2_0fea : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l140_c2_0fea_cond,
tmp16_MUX_uxn_opcodes_h_l140_c2_0fea_iftrue,
tmp16_MUX_uxn_opcodes_h_l140_c2_0fea_iffalse,
tmp16_MUX_uxn_opcodes_h_l140_c2_0fea_return_output);

-- printf_uxn_opcodes_h_l141_c3_d47f_uxn_opcodes_h_l141_c3_d47f
printf_uxn_opcodes_h_l141_c3_d47f_uxn_opcodes_h_l141_c3_d47f : entity work.printf_uxn_opcodes_h_l141_c3_d47f_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l141_c3_d47f_uxn_opcodes_h_l141_c3_d47f_CLOCK_ENABLE);

-- BIN_OP_PLUS_uxn_opcodes_h_l144_c11_3801
BIN_OP_PLUS_uxn_opcodes_h_l144_c11_3801 : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l144_c11_3801_left,
BIN_OP_PLUS_uxn_opcodes_h_l144_c11_3801_right,
BIN_OP_PLUS_uxn_opcodes_h_l144_c11_3801_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l147_c11_af41
BIN_OP_EQ_uxn_opcodes_h_l147_c11_af41 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l147_c11_af41_left,
BIN_OP_EQ_uxn_opcodes_h_l147_c11_af41_right,
BIN_OP_EQ_uxn_opcodes_h_l147_c11_af41_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l147_c7_f30f
result_u16_value_MUX_uxn_opcodes_h_l147_c7_f30f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l147_c7_f30f_cond,
result_u16_value_MUX_uxn_opcodes_h_l147_c7_f30f_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l147_c7_f30f_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l147_c7_f30f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_f30f
result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_f30f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_f30f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_f30f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_f30f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_f30f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_f30f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_f30f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_f30f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_f30f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_f30f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_f30f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_f30f
result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_f30f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_f30f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_f30f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_f30f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_f30f_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_f30f
result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_f30f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_f30f_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_f30f_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_f30f_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_f30f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_f30f
result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_f30f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_f30f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_f30f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_f30f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_f30f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l147_c7_f30f
result_u8_value_MUX_uxn_opcodes_h_l147_c7_f30f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l147_c7_f30f_cond,
result_u8_value_MUX_uxn_opcodes_h_l147_c7_f30f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l147_c7_f30f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l147_c7_f30f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l147_c7_f30f
tmp16_MUX_uxn_opcodes_h_l147_c7_f30f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l147_c7_f30f_cond,
tmp16_MUX_uxn_opcodes_h_l147_c7_f30f_iftrue,
tmp16_MUX_uxn_opcodes_h_l147_c7_f30f_iffalse,
tmp16_MUX_uxn_opcodes_h_l147_c7_f30f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l153_c11_c3da
BIN_OP_EQ_uxn_opcodes_h_l153_c11_c3da : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l153_c11_c3da_left,
BIN_OP_EQ_uxn_opcodes_h_l153_c11_c3da_right,
BIN_OP_EQ_uxn_opcodes_h_l153_c11_c3da_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l153_c7_599f
result_u16_value_MUX_uxn_opcodes_h_l153_c7_599f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l153_c7_599f_cond,
result_u16_value_MUX_uxn_opcodes_h_l153_c7_599f_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l153_c7_599f_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l153_c7_599f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_599f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_599f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_599f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_599f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_599f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_599f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_599f
result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_599f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_599f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_599f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_599f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_599f_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_599f
result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_599f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_599f_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_599f_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_599f_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_599f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_599f
result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_599f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_599f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_599f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_599f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_599f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l153_c7_599f
result_u8_value_MUX_uxn_opcodes_h_l153_c7_599f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l153_c7_599f_cond,
result_u8_value_MUX_uxn_opcodes_h_l153_c7_599f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l153_c7_599f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l153_c7_599f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l153_c7_599f
tmp16_MUX_uxn_opcodes_h_l153_c7_599f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l153_c7_599f_cond,
tmp16_MUX_uxn_opcodes_h_l153_c7_599f_iftrue,
tmp16_MUX_uxn_opcodes_h_l153_c7_599f_iffalse,
tmp16_MUX_uxn_opcodes_h_l153_c7_599f_return_output);

-- CONST_SR_8_uxn_opcodes_h_l155_c31_b8ed
CONST_SR_8_uxn_opcodes_h_l155_c31_b8ed : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l155_c31_b8ed_x,
CONST_SR_8_uxn_opcodes_h_l155_c31_b8ed_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l158_c11_bb52
BIN_OP_EQ_uxn_opcodes_h_l158_c11_bb52 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l158_c11_bb52_left,
BIN_OP_EQ_uxn_opcodes_h_l158_c11_bb52_right,
BIN_OP_EQ_uxn_opcodes_h_l158_c11_bb52_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_19ff
result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_19ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_19ff_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_19ff_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_19ff_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_19ff_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_19ff
result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_19ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_19ff_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_19ff_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_19ff_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_19ff_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_19ff
result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_19ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_19ff_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_19ff_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_19ff_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_19ff_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l158_c7_19ff
result_u16_value_MUX_uxn_opcodes_h_l158_c7_19ff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l158_c7_19ff_cond,
result_u16_value_MUX_uxn_opcodes_h_l158_c7_19ff_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l158_c7_19ff_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l158_c7_19ff_return_output);

-- tmp16_MUX_uxn_opcodes_h_l158_c7_19ff
tmp16_MUX_uxn_opcodes_h_l158_c7_19ff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l158_c7_19ff_cond,
tmp16_MUX_uxn_opcodes_h_l158_c7_19ff_iftrue,
tmp16_MUX_uxn_opcodes_h_l158_c7_19ff_iffalse,
tmp16_MUX_uxn_opcodes_h_l158_c7_19ff_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l160_c22_f229
BIN_OP_PLUS_uxn_opcodes_h_l160_c22_f229 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l160_c22_f229_left,
BIN_OP_PLUS_uxn_opcodes_h_l160_c22_f229_right,
BIN_OP_PLUS_uxn_opcodes_h_l160_c22_f229_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l162_c11_fd34
BIN_OP_EQ_uxn_opcodes_h_l162_c11_fd34 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l162_c11_fd34_left,
BIN_OP_EQ_uxn_opcodes_h_l162_c11_fd34_right,
BIN_OP_EQ_uxn_opcodes_h_l162_c11_fd34_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_bdde
result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_bdde : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_bdde_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_bdde_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_bdde_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_bdde_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_bdde
result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_bdde : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_bdde_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_bdde_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_bdde_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_bdde_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l162_c7_bdde
result_u16_value_MUX_uxn_opcodes_h_l162_c7_bdde : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l162_c7_bdde_cond,
result_u16_value_MUX_uxn_opcodes_h_l162_c7_bdde_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l162_c7_bdde_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l162_c7_bdde_return_output);

-- tmp16_MUX_uxn_opcodes_h_l162_c7_bdde
tmp16_MUX_uxn_opcodes_h_l162_c7_bdde : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l162_c7_bdde_cond,
tmp16_MUX_uxn_opcodes_h_l162_c7_bdde_iftrue,
tmp16_MUX_uxn_opcodes_h_l162_c7_bdde_iffalse,
tmp16_MUX_uxn_opcodes_h_l162_c7_bdde_return_output);

-- CONST_SL_8_uxn_opcodes_h_l164_c3_36c6
CONST_SL_8_uxn_opcodes_h_l164_c3_36c6 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l164_c3_36c6_x,
CONST_SL_8_uxn_opcodes_h_l164_c3_36c6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l166_c11_2239
BIN_OP_EQ_uxn_opcodes_h_l166_c11_2239 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l166_c11_2239_left,
BIN_OP_EQ_uxn_opcodes_h_l166_c11_2239_right,
BIN_OP_EQ_uxn_opcodes_h_l166_c11_2239_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_7f29
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_7f29 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_7f29_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_7f29_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_7f29_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_7f29_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_7f29
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_7f29 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_7f29_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_7f29_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_7f29_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_7f29_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l166_c7_7f29
result_u16_value_MUX_uxn_opcodes_h_l166_c7_7f29 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l166_c7_7f29_cond,
result_u16_value_MUX_uxn_opcodes_h_l166_c7_7f29_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l166_c7_7f29_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l166_c7_7f29_return_output);

-- tmp16_MUX_uxn_opcodes_h_l166_c7_7f29
tmp16_MUX_uxn_opcodes_h_l166_c7_7f29 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l166_c7_7f29_cond,
tmp16_MUX_uxn_opcodes_h_l166_c7_7f29_iftrue,
tmp16_MUX_uxn_opcodes_h_l166_c7_7f29_iffalse,
tmp16_MUX_uxn_opcodes_h_l166_c7_7f29_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l167_c3_d83e
BIN_OP_OR_uxn_opcodes_h_l167_c3_d83e : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l167_c3_d83e_left,
BIN_OP_OR_uxn_opcodes_h_l167_c3_d83e_right,
BIN_OP_OR_uxn_opcodes_h_l167_c3_d83e_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l169_c22_2548
BIN_OP_PLUS_uxn_opcodes_h_l169_c22_2548 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l169_c22_2548_left,
BIN_OP_PLUS_uxn_opcodes_h_l169_c22_2548_right,
BIN_OP_PLUS_uxn_opcodes_h_l169_c22_2548_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l169_c22_8bc0
BIN_OP_PLUS_uxn_opcodes_h_l169_c22_8bc0 : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l169_c22_8bc0_left,
BIN_OP_PLUS_uxn_opcodes_h_l169_c22_8bc0_right,
BIN_OP_PLUS_uxn_opcodes_h_l169_c22_8bc0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l171_c11_222f
BIN_OP_EQ_uxn_opcodes_h_l171_c11_222f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l171_c11_222f_left,
BIN_OP_EQ_uxn_opcodes_h_l171_c11_222f_right,
BIN_OP_EQ_uxn_opcodes_h_l171_c11_222f_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_4b0c
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_4b0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_4b0c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_4b0c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_4b0c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_4b0c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_4b0c
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_4b0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_4b0c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_4b0c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_4b0c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_4b0c_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l140_c6_bda4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_653f_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l140_c2_0fea_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_0fea_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_0fea_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_0fea_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l140_c2_0fea_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_0fea_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_0fea_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_0fea_return_output,
 tmp16_MUX_uxn_opcodes_h_l140_c2_0fea_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l144_c11_3801_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l147_c11_af41_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l147_c7_f30f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_f30f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_f30f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_f30f_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_f30f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_f30f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l147_c7_f30f_return_output,
 tmp16_MUX_uxn_opcodes_h_l147_c7_f30f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l153_c11_c3da_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l153_c7_599f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_599f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_599f_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_599f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_599f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l153_c7_599f_return_output,
 tmp16_MUX_uxn_opcodes_h_l153_c7_599f_return_output,
 CONST_SR_8_uxn_opcodes_h_l155_c31_b8ed_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l158_c11_bb52_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_19ff_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_19ff_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_19ff_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l158_c7_19ff_return_output,
 tmp16_MUX_uxn_opcodes_h_l158_c7_19ff_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l160_c22_f229_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l162_c11_fd34_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_bdde_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_bdde_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l162_c7_bdde_return_output,
 tmp16_MUX_uxn_opcodes_h_l162_c7_bdde_return_output,
 CONST_SL_8_uxn_opcodes_h_l164_c3_36c6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l166_c11_2239_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_7f29_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_7f29_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l166_c7_7f29_return_output,
 tmp16_MUX_uxn_opcodes_h_l166_c7_7f29_return_output,
 BIN_OP_OR_uxn_opcodes_h_l167_c3_d83e_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l169_c22_2548_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l169_c22_8bc0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l171_c11_222f_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_4b0c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_4b0c_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c6_bda4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c6_bda4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c6_bda4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_653f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_653f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_653f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_653f_iffalse : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l140_c2_0fea_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l140_c2_0fea_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l147_c7_f30f_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l140_c2_0fea_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l140_c2_0fea_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_0fea_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_0fea_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_f30f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_0fea_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_0fea_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_0fea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_0fea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_f30f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_0fea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_0fea_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_0fea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_0fea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_f30f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_0fea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_0fea_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l140_c2_0fea_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l140_c2_0fea_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l147_c7_f30f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l140_c2_0fea_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l140_c2_0fea_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_0fea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_0fea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_f30f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_0fea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_0fea_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_0fea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_0fea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_f30f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_0fea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_0fea_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_0fea_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l143_c3_4bfc : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_0fea_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l140_c2_0fea_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_0fea_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_0fea_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l140_c2_0fea_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l144_c3_c3a3 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l140_c2_0fea_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l147_c7_f30f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l140_c2_0fea_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l140_c2_0fea_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l141_c3_d47f_uxn_opcodes_h_l141_c3_d47f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l144_c11_3801_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l144_c11_3801_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l144_c11_3801_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c11_af41_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c11_af41_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c11_af41_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l147_c7_f30f_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l147_c7_f30f_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l153_c7_599f_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l147_c7_f30f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_f30f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_f30f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_599f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_f30f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_f30f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l150_c3_773b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_f30f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_599f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_f30f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_f30f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_f30f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l147_c7_f30f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_f30f_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_f30f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_f30f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_599f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_f30f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_f30f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_f30f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_599f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_f30f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l147_c7_f30f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l147_c7_f30f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l153_c7_599f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l147_c7_f30f_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l147_c7_f30f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l147_c7_f30f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l153_c7_599f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l147_c7_f30f_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l151_c21_14f7_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l153_c11_c3da_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l153_c11_c3da_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l153_c11_c3da_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l153_c7_599f_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l153_c7_599f_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l158_c7_19ff_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l153_c7_599f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_599f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l154_c3_9957 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_599f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_599f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_599f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_599f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_19ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_599f_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_599f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_599f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_19ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_599f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_599f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_599f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_19ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_599f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l153_c7_599f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l153_c7_599f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l153_c7_599f_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l153_c7_599f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l153_c7_599f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l158_c7_19ff_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l153_c7_599f_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l155_c31_b8ed_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l155_c31_b8ed_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l155_c21_8226_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l158_c11_bb52_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l158_c11_bb52_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l158_c11_bb52_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_19ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_19ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_19ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_19ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_19ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_bdde_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_19ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_19ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_19ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_bdde_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_19ff_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l158_c7_19ff_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l160_c3_a3b3 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l158_c7_19ff_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l162_c7_bdde_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l158_c7_19ff_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l158_c7_19ff_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l158_c7_19ff_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_bdde_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l158_c7_19ff_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l160_c22_f229_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l160_c22_f229_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l160_c22_f229_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_fd34_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_fd34_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_fd34_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_bdde_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_bdde_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_7f29_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_bdde_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_bdde_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_bdde_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_7f29_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_bdde_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l162_c7_bdde_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l162_c7_bdde_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_7f29_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l162_c7_bdde_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_bdde_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_bdde_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_7f29_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_bdde_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l164_c3_36c6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l164_c3_36c6_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_2239_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_2239_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_2239_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_7f29_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_7f29_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_4b0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_7f29_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_7f29_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_7f29_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_4b0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_7f29_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_7f29_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l169_c3_a36c : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_7f29_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_7f29_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_7f29_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_7f29_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_7f29_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l167_c3_d83e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l167_c3_d83e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l167_c3_d83e_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_2548_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_2548_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_2548_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_8bc0_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_8bc0_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_8bc0_return_output : unsigned(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_222f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_222f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_222f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_4b0c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_4b0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_4b0c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_4b0c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_4b0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_4b0c_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l140_l147_l162_l166_DUPLICATE_36a7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l140_l153_DUPLICATE_583a_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l140_l158_l153_DUPLICATE_98dc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l140_l153_DUPLICATE_1aad_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l162_l158_l153_l147_l140_l171_DUPLICATE_bb91_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l162_l158_l153_l147_l171_l166_DUPLICATE_5b09_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l163_l167_DUPLICATE_97d2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_bc18_uxn_opcodes_h_l176_l136_DUPLICATE_1f27_return_output : opcode_result_t;
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
     VAR_result_sp_relative_shift_uxn_opcodes_h_l143_c3_4bfc := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_0fea_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l143_c3_4bfc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l160_c22_f229_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c11_af41_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c6_bda4_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_222f_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l153_c11_c3da_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l158_c11_bb52_right := to_unsigned(3, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_653f_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_19ff_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l150_c3_773b := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_f30f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l150_c3_773b;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l144_c11_3801_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_0fea_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_8bc0_right := to_unsigned(2, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_4b0c_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_f30f_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_7f29_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_2239_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_4b0c_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_0fea_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l154_c3_9957 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_599f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l154_c3_9957;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_f30f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_fd34_right := to_unsigned(4, 3);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_653f_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l144_c11_3801_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l160_c22_f229_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_2548_left := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l153_c7_599f_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c6_bda4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c11_af41_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l153_c11_c3da_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l158_c11_bb52_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_fd34_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_2239_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_222f_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l167_c3_d83e_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l155_c31_b8ed_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l147_c7_f30f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l153_c7_599f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l158_c7_19ff_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_7f29_iffalse := tmp16;
     -- result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d[uxn_opcodes_h_l147_c7_f30f] LATENCY=0
     VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l147_c7_f30f_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l162_l158_l153_l147_l140_l171_DUPLICATE_bb91 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l162_l158_l153_l147_l140_l171_DUPLICATE_bb91_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l171_c11_222f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l171_c11_222f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_222f_left;
     BIN_OP_EQ_uxn_opcodes_h_l171_c11_222f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_222f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_222f_return_output := BIN_OP_EQ_uxn_opcodes_h_l171_c11_222f_return_output;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l140_c2_0fea] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l140_c2_0fea_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l140_l147_l162_l166_DUPLICATE_36a7 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l140_l147_l162_l166_DUPLICATE_36a7_return_output := result.u16_value;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l140_l153_DUPLICATE_1aad LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l140_l153_DUPLICATE_1aad_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l162_c11_fd34] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l162_c11_fd34_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_fd34_left;
     BIN_OP_EQ_uxn_opcodes_h_l162_c11_fd34_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_fd34_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_fd34_return_output := BIN_OP_EQ_uxn_opcodes_h_l162_c11_fd34_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l140_l153_DUPLICATE_583a LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l140_l153_DUPLICATE_583a_return_output := result.stack_address_sp_offset;

     -- BIN_OP_PLUS[uxn_opcodes_h_l160_c22_f229] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l160_c22_f229_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l160_c22_f229_left;
     BIN_OP_PLUS_uxn_opcodes_h_l160_c22_f229_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l160_c22_f229_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l160_c22_f229_return_output := BIN_OP_PLUS_uxn_opcodes_h_l160_c22_f229_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l163_l167_DUPLICATE_97d2 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l163_l167_DUPLICATE_97d2_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l162_l158_l153_l147_l171_l166_DUPLICATE_5b09 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l162_l158_l153_l147_l171_l166_DUPLICATE_5b09_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l140_l158_l153_DUPLICATE_98dc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l140_l158_l153_DUPLICATE_98dc_return_output := result.is_stack_write;

     -- CONST_SR_8[uxn_opcodes_h_l155_c31_b8ed] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l155_c31_b8ed_x <= VAR_CONST_SR_8_uxn_opcodes_h_l155_c31_b8ed_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l155_c31_b8ed_return_output := CONST_SR_8_uxn_opcodes_h_l155_c31_b8ed_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l158_c11_bb52] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l158_c11_bb52_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l158_c11_bb52_left;
     BIN_OP_EQ_uxn_opcodes_h_l158_c11_bb52_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l158_c11_bb52_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l158_c11_bb52_return_output := BIN_OP_EQ_uxn_opcodes_h_l158_c11_bb52_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l147_c11_af41] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l147_c11_af41_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c11_af41_left;
     BIN_OP_EQ_uxn_opcodes_h_l147_c11_af41_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c11_af41_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c11_af41_return_output := BIN_OP_EQ_uxn_opcodes_h_l147_c11_af41_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l144_c11_3801] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l144_c11_3801_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l144_c11_3801_left;
     BIN_OP_PLUS_uxn_opcodes_h_l144_c11_3801_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l144_c11_3801_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l144_c11_3801_return_output := BIN_OP_PLUS_uxn_opcodes_h_l144_c11_3801_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l166_c11_2239] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l166_c11_2239_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_2239_left;
     BIN_OP_EQ_uxn_opcodes_h_l166_c11_2239_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_2239_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_2239_return_output := BIN_OP_EQ_uxn_opcodes_h_l166_c11_2239_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l140_c6_bda4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l140_c6_bda4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c6_bda4_left;
     BIN_OP_EQ_uxn_opcodes_h_l140_c6_bda4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c6_bda4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c6_bda4_return_output := BIN_OP_EQ_uxn_opcodes_h_l140_c6_bda4_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l151_c21_14f7] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l151_c21_14f7_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- BIN_OP_EQ[uxn_opcodes_h_l153_c11_c3da] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l153_c11_c3da_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l153_c11_c3da_left;
     BIN_OP_EQ_uxn_opcodes_h_l153_c11_c3da_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l153_c11_c3da_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l153_c11_c3da_return_output := BIN_OP_EQ_uxn_opcodes_h_l153_c11_c3da_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_653f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c6_bda4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_0fea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c6_bda4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_0fea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c6_bda4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_0fea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c6_bda4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_0fea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c6_bda4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_0fea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c6_bda4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_0fea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c6_bda4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l140_c2_0fea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c6_bda4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l140_c2_0fea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c6_bda4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l140_c2_0fea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c6_bda4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_f30f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c11_af41_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_f30f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c11_af41_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_f30f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c11_af41_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_f30f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c11_af41_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_f30f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c11_af41_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l147_c7_f30f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c11_af41_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l147_c7_f30f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c11_af41_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l147_c7_f30f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c11_af41_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_599f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l153_c11_c3da_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_599f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l153_c11_c3da_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_599f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l153_c11_c3da_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_599f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l153_c11_c3da_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l153_c7_599f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l153_c11_c3da_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l153_c7_599f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l153_c11_c3da_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l153_c7_599f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l153_c11_c3da_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_19ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l158_c11_bb52_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_19ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l158_c11_bb52_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_19ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l158_c11_bb52_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l158_c7_19ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l158_c11_bb52_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l158_c7_19ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l158_c11_bb52_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_bdde_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_fd34_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_bdde_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_fd34_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l162_c7_bdde_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_fd34_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_bdde_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_fd34_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_7f29_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_2239_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_7f29_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_2239_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_7f29_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_2239_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_7f29_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_2239_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_4b0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_222f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_4b0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_222f_return_output;
     VAR_tmp16_uxn_opcodes_h_l144_c3_c3a3 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l144_c11_3801_return_output, 16);
     VAR_result_u16_value_uxn_opcodes_h_l160_c3_a3b3 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l160_c22_f229_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l167_c3_d83e_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l163_l167_DUPLICATE_97d2_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l164_c3_36c6_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l163_l167_DUPLICATE_97d2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l147_c7_f30f_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l151_c21_14f7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l140_c2_0fea_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l140_l147_l162_l166_DUPLICATE_36a7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l147_c7_f30f_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l140_l147_l162_l166_DUPLICATE_36a7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l162_c7_bdde_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l140_l147_l162_l166_DUPLICATE_36a7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_7f29_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l140_l147_l162_l166_DUPLICATE_36a7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_f30f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l162_l158_l153_l147_l171_l166_DUPLICATE_5b09_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_599f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l162_l158_l153_l147_l171_l166_DUPLICATE_5b09_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_19ff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l162_l158_l153_l147_l171_l166_DUPLICATE_5b09_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_bdde_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l162_l158_l153_l147_l171_l166_DUPLICATE_5b09_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_7f29_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l162_l158_l153_l147_l171_l166_DUPLICATE_5b09_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_4b0c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l162_l158_l153_l147_l171_l166_DUPLICATE_5b09_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_0fea_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l162_l158_l153_l147_l140_l171_DUPLICATE_bb91_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_f30f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l162_l158_l153_l147_l140_l171_DUPLICATE_bb91_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_599f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l162_l158_l153_l147_l140_l171_DUPLICATE_bb91_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_19ff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l162_l158_l153_l147_l140_l171_DUPLICATE_bb91_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_bdde_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l162_l158_l153_l147_l140_l171_DUPLICATE_bb91_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_4b0c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l162_l158_l153_l147_l140_l171_DUPLICATE_bb91_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_0fea_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l140_l158_l153_DUPLICATE_98dc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_599f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l140_l158_l153_DUPLICATE_98dc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_19ff_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l140_l158_l153_DUPLICATE_98dc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_0fea_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l140_l153_DUPLICATE_583a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_599f_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l140_l153_DUPLICATE_583a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l140_c2_0fea_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l140_l153_DUPLICATE_1aad_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l153_c7_599f_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l140_l153_DUPLICATE_1aad_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_f30f_iffalse := VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l147_c7_f30f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_0fea_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l140_c2_0fea_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l158_c7_19ff_iftrue := VAR_result_u16_value_uxn_opcodes_h_l160_c3_a3b3;
     VAR_tmp16_MUX_uxn_opcodes_h_l140_c2_0fea_iftrue := VAR_tmp16_uxn_opcodes_h_l144_c3_c3a3;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l140_c2_0fea] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_0fea_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_0fea_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_0fea_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_0fea_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_0fea_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_0fea_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_0fea_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_0fea_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l155_c21_8226] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l155_c21_8226_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l155_c31_b8ed_return_output);

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l140_c1_653f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_653f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_653f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_653f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_653f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_653f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_653f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_653f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_653f_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l171_c7_4b0c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_4b0c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_4b0c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_4b0c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_4b0c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_4b0c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_4b0c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_4b0c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_4b0c_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l164_c3_36c6] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l164_c3_36c6_x <= VAR_CONST_SL_8_uxn_opcodes_h_l164_c3_36c6_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l164_c3_36c6_return_output := CONST_SL_8_uxn_opcodes_h_l164_c3_36c6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l158_c7_19ff] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_19ff_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_19ff_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_19ff_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_19ff_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_19ff_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_19ff_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_19ff_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_19ff_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l153_c7_599f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_599f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_599f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_599f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_599f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_599f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_599f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_599f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_599f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l147_c7_f30f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_f30f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_f30f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_f30f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_f30f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_f30f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_f30f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_f30f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_f30f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l171_c7_4b0c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_4b0c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_4b0c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_4b0c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_4b0c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_4b0c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_4b0c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_4b0c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_4b0c_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l167_c3_d83e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l167_c3_d83e_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l167_c3_d83e_left;
     BIN_OP_OR_uxn_opcodes_h_l167_c3_d83e_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l167_c3_d83e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l167_c3_d83e_return_output := BIN_OP_OR_uxn_opcodes_h_l167_c3_d83e_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_2548_right := VAR_BIN_OP_OR_uxn_opcodes_h_l167_c3_d83e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_7f29_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l167_c3_d83e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l153_c7_599f_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l155_c21_8226_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_bdde_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l164_c3_36c6_return_output;
     VAR_printf_uxn_opcodes_h_l141_c3_d47f_uxn_opcodes_h_l141_c3_d47f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_653f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_7f29_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_4b0c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_7f29_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_4b0c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_0fea_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_f30f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_599f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_19ff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_f30f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_599f_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l140_c2_0fea] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_0fea_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_0fea_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_0fea_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_0fea_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_0fea_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_0fea_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_0fea_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_0fea_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l153_c7_599f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_599f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_599f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_599f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_599f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_599f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_599f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_599f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_599f_return_output;

     -- printf_uxn_opcodes_h_l141_c3_d47f[uxn_opcodes_h_l141_c3_d47f] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l141_c3_d47f_uxn_opcodes_h_l141_c3_d47f_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l141_c3_d47f_uxn_opcodes_h_l141_c3_d47f_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- tmp16_MUX[uxn_opcodes_h_l166_c7_7f29] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l166_c7_7f29_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_7f29_cond;
     tmp16_MUX_uxn_opcodes_h_l166_c7_7f29_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_7f29_iftrue;
     tmp16_MUX_uxn_opcodes_h_l166_c7_7f29_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_7f29_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_7f29_return_output := tmp16_MUX_uxn_opcodes_h_l166_c7_7f29_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l169_c22_2548] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l169_c22_2548_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_2548_left;
     BIN_OP_PLUS_uxn_opcodes_h_l169_c22_2548_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_2548_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_2548_return_output := BIN_OP_PLUS_uxn_opcodes_h_l169_c22_2548_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l153_c7_599f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l153_c7_599f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l153_c7_599f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l153_c7_599f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l153_c7_599f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l153_c7_599f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l153_c7_599f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l153_c7_599f_return_output := result_u8_value_MUX_uxn_opcodes_h_l153_c7_599f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l166_c7_7f29] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_7f29_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_7f29_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_7f29_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_7f29_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_7f29_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_7f29_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_7f29_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_7f29_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l166_c7_7f29] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_7f29_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_7f29_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_7f29_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_7f29_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_7f29_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_7f29_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_7f29_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_7f29_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l147_c7_f30f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_f30f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_f30f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_f30f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_f30f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_f30f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_f30f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_f30f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_f30f_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_8bc0_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_2548_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_bdde_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_7f29_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_bdde_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_7f29_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_f30f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_599f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_0fea_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_f30f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l147_c7_f30f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l153_c7_599f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_bdde_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_7f29_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l162_c7_bdde] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_bdde_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_bdde_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_bdde_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_bdde_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_bdde_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_bdde_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_bdde_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_bdde_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l147_c7_f30f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l147_c7_f30f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l147_c7_f30f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l147_c7_f30f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l147_c7_f30f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l147_c7_f30f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l147_c7_f30f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l147_c7_f30f_return_output := result_u8_value_MUX_uxn_opcodes_h_l147_c7_f30f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l147_c7_f30f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_f30f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_f30f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_f30f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_f30f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_f30f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_f30f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_f30f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_f30f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l162_c7_bdde] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l162_c7_bdde_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_bdde_cond;
     tmp16_MUX_uxn_opcodes_h_l162_c7_bdde_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_bdde_iftrue;
     tmp16_MUX_uxn_opcodes_h_l162_c7_bdde_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_bdde_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_bdde_return_output := tmp16_MUX_uxn_opcodes_h_l162_c7_bdde_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l162_c7_bdde] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_bdde_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_bdde_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_bdde_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_bdde_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_bdde_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_bdde_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_bdde_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_bdde_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l169_c22_8bc0] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l169_c22_8bc0_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_8bc0_left;
     BIN_OP_PLUS_uxn_opcodes_h_l169_c22_8bc0_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_8bc0_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_8bc0_return_output := BIN_OP_PLUS_uxn_opcodes_h_l169_c22_8bc0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l140_c2_0fea] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_0fea_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_0fea_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_0fea_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_0fea_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_0fea_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_0fea_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_0fea_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_0fea_return_output;

     -- Submodule level 4
     VAR_result_u16_value_uxn_opcodes_h_l169_c3_a36c := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_8bc0_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_19ff_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_bdde_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_19ff_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_bdde_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_0fea_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_f30f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l140_c2_0fea_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l147_c7_f30f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l158_c7_19ff_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_bdde_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_7f29_iftrue := VAR_result_u16_value_uxn_opcodes_h_l169_c3_a36c;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l140_c2_0fea] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_0fea_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_0fea_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_0fea_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_0fea_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_0fea_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_0fea_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_0fea_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_0fea_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l166_c7_7f29] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l166_c7_7f29_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_7f29_cond;
     result_u16_value_MUX_uxn_opcodes_h_l166_c7_7f29_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_7f29_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l166_c7_7f29_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_7f29_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_7f29_return_output := result_u16_value_MUX_uxn_opcodes_h_l166_c7_7f29_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l158_c7_19ff] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l158_c7_19ff_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l158_c7_19ff_cond;
     tmp16_MUX_uxn_opcodes_h_l158_c7_19ff_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l158_c7_19ff_iftrue;
     tmp16_MUX_uxn_opcodes_h_l158_c7_19ff_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l158_c7_19ff_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l158_c7_19ff_return_output := tmp16_MUX_uxn_opcodes_h_l158_c7_19ff_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l158_c7_19ff] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_19ff_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_19ff_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_19ff_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_19ff_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_19ff_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_19ff_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_19ff_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_19ff_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l140_c2_0fea] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l140_c2_0fea_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l140_c2_0fea_cond;
     result_u8_value_MUX_uxn_opcodes_h_l140_c2_0fea_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l140_c2_0fea_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l140_c2_0fea_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l140_c2_0fea_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l140_c2_0fea_return_output := result_u8_value_MUX_uxn_opcodes_h_l140_c2_0fea_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l158_c7_19ff] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_19ff_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_19ff_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_19ff_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_19ff_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_19ff_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_19ff_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_19ff_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_19ff_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_599f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_19ff_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_599f_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_19ff_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l162_c7_bdde_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_7f29_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l153_c7_599f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l158_c7_19ff_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l153_c7_599f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_599f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_599f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_599f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_599f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_599f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_599f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_599f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_599f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l153_c7_599f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l153_c7_599f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l153_c7_599f_cond;
     tmp16_MUX_uxn_opcodes_h_l153_c7_599f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l153_c7_599f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l153_c7_599f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l153_c7_599f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l153_c7_599f_return_output := tmp16_MUX_uxn_opcodes_h_l153_c7_599f_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l162_c7_bdde] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l162_c7_bdde_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l162_c7_bdde_cond;
     result_u16_value_MUX_uxn_opcodes_h_l162_c7_bdde_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l162_c7_bdde_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l162_c7_bdde_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l162_c7_bdde_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l162_c7_bdde_return_output := result_u16_value_MUX_uxn_opcodes_h_l162_c7_bdde_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l153_c7_599f] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_599f_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_599f_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_599f_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_599f_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_599f_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_599f_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_599f_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_599f_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_f30f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_599f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_f30f_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_599f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l158_c7_19ff_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l162_c7_bdde_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l147_c7_f30f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l153_c7_599f_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l147_c7_f30f] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_f30f_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_f30f_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_f30f_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_f30f_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_f30f_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_f30f_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_f30f_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_f30f_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l158_c7_19ff] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l158_c7_19ff_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l158_c7_19ff_cond;
     result_u16_value_MUX_uxn_opcodes_h_l158_c7_19ff_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l158_c7_19ff_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l158_c7_19ff_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l158_c7_19ff_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l158_c7_19ff_return_output := result_u16_value_MUX_uxn_opcodes_h_l158_c7_19ff_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l147_c7_f30f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_f30f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_f30f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_f30f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_f30f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_f30f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_f30f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_f30f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_f30f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l147_c7_f30f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l147_c7_f30f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l147_c7_f30f_cond;
     tmp16_MUX_uxn_opcodes_h_l147_c7_f30f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l147_c7_f30f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l147_c7_f30f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l147_c7_f30f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l147_c7_f30f_return_output := tmp16_MUX_uxn_opcodes_h_l147_c7_f30f_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_0fea_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_f30f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_0fea_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_f30f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l153_c7_599f_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l158_c7_19ff_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l140_c2_0fea_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l147_c7_f30f_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l153_c7_599f] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l153_c7_599f_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l153_c7_599f_cond;
     result_u16_value_MUX_uxn_opcodes_h_l153_c7_599f_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l153_c7_599f_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l153_c7_599f_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l153_c7_599f_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l153_c7_599f_return_output := result_u16_value_MUX_uxn_opcodes_h_l153_c7_599f_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l140_c2_0fea] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_0fea_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_0fea_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_0fea_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_0fea_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_0fea_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_0fea_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_0fea_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_0fea_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l140_c2_0fea] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l140_c2_0fea_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l140_c2_0fea_cond;
     tmp16_MUX_uxn_opcodes_h_l140_c2_0fea_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l140_c2_0fea_iftrue;
     tmp16_MUX_uxn_opcodes_h_l140_c2_0fea_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l140_c2_0fea_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l140_c2_0fea_return_output := tmp16_MUX_uxn_opcodes_h_l140_c2_0fea_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l140_c2_0fea] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_0fea_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_0fea_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_0fea_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_0fea_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_0fea_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_0fea_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_0fea_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_0fea_return_output;

     -- Submodule level 8
     VAR_result_u16_value_MUX_uxn_opcodes_h_l147_c7_f30f_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l153_c7_599f_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l140_c2_0fea_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l147_c7_f30f] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l147_c7_f30f_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l147_c7_f30f_cond;
     result_u16_value_MUX_uxn_opcodes_h_l147_c7_f30f_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l147_c7_f30f_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l147_c7_f30f_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l147_c7_f30f_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l147_c7_f30f_return_output := result_u16_value_MUX_uxn_opcodes_h_l147_c7_f30f_return_output;

     -- Submodule level 9
     VAR_result_u16_value_MUX_uxn_opcodes_h_l140_c2_0fea_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l147_c7_f30f_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l140_c2_0fea] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l140_c2_0fea_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l140_c2_0fea_cond;
     result_u16_value_MUX_uxn_opcodes_h_l140_c2_0fea_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l140_c2_0fea_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l140_c2_0fea_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l140_c2_0fea_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l140_c2_0fea_return_output := result_u16_value_MUX_uxn_opcodes_h_l140_c2_0fea_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_bc18_uxn_opcodes_h_l176_l136_DUPLICATE_1f27 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_bc18_uxn_opcodes_h_l176_l136_DUPLICATE_1f27_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_bc18(
     result,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l140_c2_0fea_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_0fea_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_0fea_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_0fea_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l140_c2_0fea_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_0fea_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_0fea_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_0fea_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_bc18_uxn_opcodes_h_l176_l136_DUPLICATE_1f27_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_bc18_uxn_opcodes_h_l176_l136_DUPLICATE_1f27_return_output;
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
