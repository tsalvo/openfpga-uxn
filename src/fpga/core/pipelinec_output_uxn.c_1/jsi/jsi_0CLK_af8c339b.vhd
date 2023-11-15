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
-- BIN_OP_EQ[uxn_opcodes_h_l138_c6_13da]
signal BIN_OP_EQ_uxn_opcodes_h_l138_c6_13da_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l138_c6_13da_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l138_c6_13da_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l138_c1_b7ad]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l138_c1_b7ad_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l138_c1_b7ad_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l138_c1_b7ad_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l138_c1_b7ad_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l138_c2_ad56]
signal tmp16_MUX_uxn_opcodes_h_l138_c2_ad56_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l138_c2_ad56_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l138_c2_ad56_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l138_c2_ad56_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l138_c2_ad56]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l138_c2_ad56_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l138_c2_ad56_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l138_c2_ad56_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l138_c2_ad56_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l138_c2_ad56]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l138_c2_ad56_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l138_c2_ad56_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l138_c2_ad56_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l138_c2_ad56_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l138_c2_ad56]
signal result_is_opc_done_MUX_uxn_opcodes_h_l138_c2_ad56_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l138_c2_ad56_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l138_c2_ad56_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l138_c2_ad56_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l138_c2_ad56]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l138_c2_ad56_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l138_c2_ad56_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l138_c2_ad56_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l138_c2_ad56_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l138_c2_ad56]
signal result_is_stack_write_MUX_uxn_opcodes_h_l138_c2_ad56_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l138_c2_ad56_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l138_c2_ad56_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l138_c2_ad56_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l138_c2_ad56]
signal result_u8_value_MUX_uxn_opcodes_h_l138_c2_ad56_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l138_c2_ad56_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l138_c2_ad56_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l138_c2_ad56_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l138_c2_ad56]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l138_c2_ad56_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l138_c2_ad56_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l138_c2_ad56_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l138_c2_ad56_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l138_c2_ad56]
signal result_u16_value_MUX_uxn_opcodes_h_l138_c2_ad56_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l138_c2_ad56_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l138_c2_ad56_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l138_c2_ad56_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l139_c3_9fb9[uxn_opcodes_h_l139_c3_9fb9]
signal printf_uxn_opcodes_h_l139_c3_9fb9_uxn_opcodes_h_l139_c3_9fb9_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l142_c11_028a]
signal BIN_OP_PLUS_uxn_opcodes_h_l142_c11_028a_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l142_c11_028a_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l142_c11_028a_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l145_c11_d70d]
signal BIN_OP_EQ_uxn_opcodes_h_l145_c11_d70d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l145_c11_d70d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l145_c11_d70d_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l145_c7_f7ef]
signal tmp16_MUX_uxn_opcodes_h_l145_c7_f7ef_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l145_c7_f7ef_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l145_c7_f7ef_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l145_c7_f7ef_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l145_c7_f7ef]
signal result_is_stack_write_MUX_uxn_opcodes_h_l145_c7_f7ef_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l145_c7_f7ef_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l145_c7_f7ef_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l145_c7_f7ef_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l145_c7_f7ef]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l145_c7_f7ef_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l145_c7_f7ef_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l145_c7_f7ef_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l145_c7_f7ef_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l145_c7_f7ef]
signal result_u8_value_MUX_uxn_opcodes_h_l145_c7_f7ef_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l145_c7_f7ef_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l145_c7_f7ef_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l145_c7_f7ef_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l145_c7_f7ef]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l145_c7_f7ef_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l145_c7_f7ef_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l145_c7_f7ef_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l145_c7_f7ef_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l145_c7_f7ef]
signal result_is_opc_done_MUX_uxn_opcodes_h_l145_c7_f7ef_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l145_c7_f7ef_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l145_c7_f7ef_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l145_c7_f7ef_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l145_c7_f7ef]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l145_c7_f7ef_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l145_c7_f7ef_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l145_c7_f7ef_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l145_c7_f7ef_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l145_c7_f7ef]
signal result_u16_value_MUX_uxn_opcodes_h_l145_c7_f7ef_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l145_c7_f7ef_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l145_c7_f7ef_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l145_c7_f7ef_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l151_c11_d76f]
signal BIN_OP_EQ_uxn_opcodes_h_l151_c11_d76f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l151_c11_d76f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l151_c11_d76f_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l151_c7_b14f]
signal tmp16_MUX_uxn_opcodes_h_l151_c7_b14f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l151_c7_b14f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l151_c7_b14f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l151_c7_b14f_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l151_c7_b14f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_b14f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_b14f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_b14f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_b14f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l151_c7_b14f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_b14f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_b14f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_b14f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_b14f_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l151_c7_b14f]
signal result_u8_value_MUX_uxn_opcodes_h_l151_c7_b14f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l151_c7_b14f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l151_c7_b14f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l151_c7_b14f_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l151_c7_b14f]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_b14f_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_b14f_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_b14f_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_b14f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l151_c7_b14f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_b14f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_b14f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_b14f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_b14f_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l151_c7_b14f]
signal result_u16_value_MUX_uxn_opcodes_h_l151_c7_b14f_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l151_c7_b14f_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l151_c7_b14f_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l151_c7_b14f_return_output : unsigned(15 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l153_c31_37b7]
signal CONST_SR_8_uxn_opcodes_h_l153_c31_37b7_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l153_c31_37b7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l156_c11_4eb6]
signal BIN_OP_EQ_uxn_opcodes_h_l156_c11_4eb6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l156_c11_4eb6_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l156_c11_4eb6_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l156_c7_da68]
signal tmp16_MUX_uxn_opcodes_h_l156_c7_da68_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l156_c7_da68_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l156_c7_da68_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l156_c7_da68_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l156_c7_da68]
signal result_is_stack_write_MUX_uxn_opcodes_h_l156_c7_da68_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l156_c7_da68_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l156_c7_da68_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l156_c7_da68_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l156_c7_da68]
signal result_is_opc_done_MUX_uxn_opcodes_h_l156_c7_da68_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l156_c7_da68_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l156_c7_da68_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l156_c7_da68_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l156_c7_da68]
signal result_u16_value_MUX_uxn_opcodes_h_l156_c7_da68_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l156_c7_da68_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l156_c7_da68_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l156_c7_da68_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l156_c7_da68]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l156_c7_da68_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l156_c7_da68_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l156_c7_da68_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l156_c7_da68_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l158_c22_60e6]
signal BIN_OP_PLUS_uxn_opcodes_h_l158_c22_60e6_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l158_c22_60e6_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l158_c22_60e6_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l160_c11_92b6]
signal BIN_OP_EQ_uxn_opcodes_h_l160_c11_92b6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l160_c11_92b6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l160_c11_92b6_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l160_c7_e8ea]
signal tmp16_MUX_uxn_opcodes_h_l160_c7_e8ea_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l160_c7_e8ea_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l160_c7_e8ea_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l160_c7_e8ea_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l160_c7_e8ea]
signal result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_e8ea_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_e8ea_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_e8ea_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_e8ea_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l160_c7_e8ea]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_e8ea_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_e8ea_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_e8ea_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_e8ea_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l160_c7_e8ea]
signal result_u16_value_MUX_uxn_opcodes_h_l160_c7_e8ea_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l160_c7_e8ea_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l160_c7_e8ea_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l160_c7_e8ea_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l162_c3_fd4b]
signal CONST_SL_8_uxn_opcodes_h_l162_c3_fd4b_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l162_c3_fd4b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l164_c11_54d4]
signal BIN_OP_EQ_uxn_opcodes_h_l164_c11_54d4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l164_c11_54d4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l164_c11_54d4_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l164_c7_e429]
signal tmp16_MUX_uxn_opcodes_h_l164_c7_e429_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l164_c7_e429_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l164_c7_e429_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l164_c7_e429_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l164_c7_e429]
signal result_is_opc_done_MUX_uxn_opcodes_h_l164_c7_e429_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l164_c7_e429_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l164_c7_e429_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l164_c7_e429_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l164_c7_e429]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l164_c7_e429_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l164_c7_e429_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l164_c7_e429_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l164_c7_e429_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l164_c7_e429]
signal result_u16_value_MUX_uxn_opcodes_h_l164_c7_e429_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l164_c7_e429_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l164_c7_e429_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l164_c7_e429_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l165_c3_30e6]
signal BIN_OP_OR_uxn_opcodes_h_l165_c3_30e6_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l165_c3_30e6_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l165_c3_30e6_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l167_c22_6c7d]
signal BIN_OP_PLUS_uxn_opcodes_h_l167_c22_6c7d_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l167_c22_6c7d_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l167_c22_6c7d_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l167_c22_0c85]
signal BIN_OP_PLUS_uxn_opcodes_h_l167_c22_0c85_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l167_c22_0c85_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l167_c22_0c85_return_output : unsigned(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l169_c11_da6f]
signal BIN_OP_EQ_uxn_opcodes_h_l169_c11_da6f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l169_c11_da6f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l169_c11_da6f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l169_c7_f5ad]
signal result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_f5ad_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_f5ad_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_f5ad_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_f5ad_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l169_c7_f5ad]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_f5ad_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_f5ad_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_f5ad_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_f5ad_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_219b( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : signed;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.sp_relative_shift := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.u8_value := ref_toks_6;
      base.is_pc_updated := ref_toks_7;
      base.u16_value := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l138_c6_13da
BIN_OP_EQ_uxn_opcodes_h_l138_c6_13da : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l138_c6_13da_left,
BIN_OP_EQ_uxn_opcodes_h_l138_c6_13da_right,
BIN_OP_EQ_uxn_opcodes_h_l138_c6_13da_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l138_c1_b7ad
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l138_c1_b7ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l138_c1_b7ad_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l138_c1_b7ad_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l138_c1_b7ad_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l138_c1_b7ad_return_output);

-- tmp16_MUX_uxn_opcodes_h_l138_c2_ad56
tmp16_MUX_uxn_opcodes_h_l138_c2_ad56 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l138_c2_ad56_cond,
tmp16_MUX_uxn_opcodes_h_l138_c2_ad56_iftrue,
tmp16_MUX_uxn_opcodes_h_l138_c2_ad56_iffalse,
tmp16_MUX_uxn_opcodes_h_l138_c2_ad56_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l138_c2_ad56
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l138_c2_ad56 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l138_c2_ad56_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l138_c2_ad56_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l138_c2_ad56_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l138_c2_ad56_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l138_c2_ad56
result_sp_relative_shift_MUX_uxn_opcodes_h_l138_c2_ad56 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l138_c2_ad56_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l138_c2_ad56_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l138_c2_ad56_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l138_c2_ad56_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l138_c2_ad56
result_is_opc_done_MUX_uxn_opcodes_h_l138_c2_ad56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l138_c2_ad56_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l138_c2_ad56_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l138_c2_ad56_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l138_c2_ad56_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l138_c2_ad56
result_is_sp_shift_MUX_uxn_opcodes_h_l138_c2_ad56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l138_c2_ad56_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l138_c2_ad56_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l138_c2_ad56_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l138_c2_ad56_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l138_c2_ad56
result_is_stack_write_MUX_uxn_opcodes_h_l138_c2_ad56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l138_c2_ad56_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l138_c2_ad56_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l138_c2_ad56_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l138_c2_ad56_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l138_c2_ad56
result_u8_value_MUX_uxn_opcodes_h_l138_c2_ad56 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l138_c2_ad56_cond,
result_u8_value_MUX_uxn_opcodes_h_l138_c2_ad56_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l138_c2_ad56_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l138_c2_ad56_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l138_c2_ad56
result_is_pc_updated_MUX_uxn_opcodes_h_l138_c2_ad56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l138_c2_ad56_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l138_c2_ad56_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l138_c2_ad56_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l138_c2_ad56_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l138_c2_ad56
result_u16_value_MUX_uxn_opcodes_h_l138_c2_ad56 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l138_c2_ad56_cond,
result_u16_value_MUX_uxn_opcodes_h_l138_c2_ad56_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l138_c2_ad56_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l138_c2_ad56_return_output);

-- printf_uxn_opcodes_h_l139_c3_9fb9_uxn_opcodes_h_l139_c3_9fb9
printf_uxn_opcodes_h_l139_c3_9fb9_uxn_opcodes_h_l139_c3_9fb9 : entity work.printf_uxn_opcodes_h_l139_c3_9fb9_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l139_c3_9fb9_uxn_opcodes_h_l139_c3_9fb9_CLOCK_ENABLE);

-- BIN_OP_PLUS_uxn_opcodes_h_l142_c11_028a
BIN_OP_PLUS_uxn_opcodes_h_l142_c11_028a : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l142_c11_028a_left,
BIN_OP_PLUS_uxn_opcodes_h_l142_c11_028a_right,
BIN_OP_PLUS_uxn_opcodes_h_l142_c11_028a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l145_c11_d70d
BIN_OP_EQ_uxn_opcodes_h_l145_c11_d70d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l145_c11_d70d_left,
BIN_OP_EQ_uxn_opcodes_h_l145_c11_d70d_right,
BIN_OP_EQ_uxn_opcodes_h_l145_c11_d70d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l145_c7_f7ef
tmp16_MUX_uxn_opcodes_h_l145_c7_f7ef : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l145_c7_f7ef_cond,
tmp16_MUX_uxn_opcodes_h_l145_c7_f7ef_iftrue,
tmp16_MUX_uxn_opcodes_h_l145_c7_f7ef_iffalse,
tmp16_MUX_uxn_opcodes_h_l145_c7_f7ef_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l145_c7_f7ef
result_is_stack_write_MUX_uxn_opcodes_h_l145_c7_f7ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l145_c7_f7ef_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l145_c7_f7ef_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l145_c7_f7ef_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l145_c7_f7ef_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l145_c7_f7ef
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l145_c7_f7ef : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l145_c7_f7ef_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l145_c7_f7ef_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l145_c7_f7ef_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l145_c7_f7ef_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l145_c7_f7ef
result_u8_value_MUX_uxn_opcodes_h_l145_c7_f7ef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l145_c7_f7ef_cond,
result_u8_value_MUX_uxn_opcodes_h_l145_c7_f7ef_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l145_c7_f7ef_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l145_c7_f7ef_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l145_c7_f7ef
result_is_pc_updated_MUX_uxn_opcodes_h_l145_c7_f7ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l145_c7_f7ef_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l145_c7_f7ef_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l145_c7_f7ef_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l145_c7_f7ef_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l145_c7_f7ef
result_is_opc_done_MUX_uxn_opcodes_h_l145_c7_f7ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l145_c7_f7ef_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l145_c7_f7ef_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l145_c7_f7ef_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l145_c7_f7ef_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l145_c7_f7ef
result_is_sp_shift_MUX_uxn_opcodes_h_l145_c7_f7ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l145_c7_f7ef_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l145_c7_f7ef_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l145_c7_f7ef_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l145_c7_f7ef_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l145_c7_f7ef
result_u16_value_MUX_uxn_opcodes_h_l145_c7_f7ef : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l145_c7_f7ef_cond,
result_u16_value_MUX_uxn_opcodes_h_l145_c7_f7ef_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l145_c7_f7ef_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l145_c7_f7ef_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l151_c11_d76f
BIN_OP_EQ_uxn_opcodes_h_l151_c11_d76f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l151_c11_d76f_left,
BIN_OP_EQ_uxn_opcodes_h_l151_c11_d76f_right,
BIN_OP_EQ_uxn_opcodes_h_l151_c11_d76f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l151_c7_b14f
tmp16_MUX_uxn_opcodes_h_l151_c7_b14f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l151_c7_b14f_cond,
tmp16_MUX_uxn_opcodes_h_l151_c7_b14f_iftrue,
tmp16_MUX_uxn_opcodes_h_l151_c7_b14f_iffalse,
tmp16_MUX_uxn_opcodes_h_l151_c7_b14f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_b14f
result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_b14f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_b14f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_b14f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_b14f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_b14f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_b14f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_b14f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_b14f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_b14f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_b14f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_b14f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l151_c7_b14f
result_u8_value_MUX_uxn_opcodes_h_l151_c7_b14f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l151_c7_b14f_cond,
result_u8_value_MUX_uxn_opcodes_h_l151_c7_b14f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l151_c7_b14f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l151_c7_b14f_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_b14f
result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_b14f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_b14f_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_b14f_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_b14f_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_b14f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_b14f
result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_b14f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_b14f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_b14f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_b14f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_b14f_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l151_c7_b14f
result_u16_value_MUX_uxn_opcodes_h_l151_c7_b14f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l151_c7_b14f_cond,
result_u16_value_MUX_uxn_opcodes_h_l151_c7_b14f_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l151_c7_b14f_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l151_c7_b14f_return_output);

-- CONST_SR_8_uxn_opcodes_h_l153_c31_37b7
CONST_SR_8_uxn_opcodes_h_l153_c31_37b7 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l153_c31_37b7_x,
CONST_SR_8_uxn_opcodes_h_l153_c31_37b7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l156_c11_4eb6
BIN_OP_EQ_uxn_opcodes_h_l156_c11_4eb6 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l156_c11_4eb6_left,
BIN_OP_EQ_uxn_opcodes_h_l156_c11_4eb6_right,
BIN_OP_EQ_uxn_opcodes_h_l156_c11_4eb6_return_output);

-- tmp16_MUX_uxn_opcodes_h_l156_c7_da68
tmp16_MUX_uxn_opcodes_h_l156_c7_da68 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l156_c7_da68_cond,
tmp16_MUX_uxn_opcodes_h_l156_c7_da68_iftrue,
tmp16_MUX_uxn_opcodes_h_l156_c7_da68_iffalse,
tmp16_MUX_uxn_opcodes_h_l156_c7_da68_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l156_c7_da68
result_is_stack_write_MUX_uxn_opcodes_h_l156_c7_da68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l156_c7_da68_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l156_c7_da68_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l156_c7_da68_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l156_c7_da68_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l156_c7_da68
result_is_opc_done_MUX_uxn_opcodes_h_l156_c7_da68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l156_c7_da68_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l156_c7_da68_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l156_c7_da68_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l156_c7_da68_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l156_c7_da68
result_u16_value_MUX_uxn_opcodes_h_l156_c7_da68 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l156_c7_da68_cond,
result_u16_value_MUX_uxn_opcodes_h_l156_c7_da68_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l156_c7_da68_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l156_c7_da68_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l156_c7_da68
result_is_pc_updated_MUX_uxn_opcodes_h_l156_c7_da68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l156_c7_da68_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l156_c7_da68_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l156_c7_da68_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l156_c7_da68_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l158_c22_60e6
BIN_OP_PLUS_uxn_opcodes_h_l158_c22_60e6 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l158_c22_60e6_left,
BIN_OP_PLUS_uxn_opcodes_h_l158_c22_60e6_right,
BIN_OP_PLUS_uxn_opcodes_h_l158_c22_60e6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l160_c11_92b6
BIN_OP_EQ_uxn_opcodes_h_l160_c11_92b6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l160_c11_92b6_left,
BIN_OP_EQ_uxn_opcodes_h_l160_c11_92b6_right,
BIN_OP_EQ_uxn_opcodes_h_l160_c11_92b6_return_output);

-- tmp16_MUX_uxn_opcodes_h_l160_c7_e8ea
tmp16_MUX_uxn_opcodes_h_l160_c7_e8ea : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l160_c7_e8ea_cond,
tmp16_MUX_uxn_opcodes_h_l160_c7_e8ea_iftrue,
tmp16_MUX_uxn_opcodes_h_l160_c7_e8ea_iffalse,
tmp16_MUX_uxn_opcodes_h_l160_c7_e8ea_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_e8ea
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_e8ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_e8ea_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_e8ea_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_e8ea_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_e8ea_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_e8ea
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_e8ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_e8ea_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_e8ea_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_e8ea_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_e8ea_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l160_c7_e8ea
result_u16_value_MUX_uxn_opcodes_h_l160_c7_e8ea : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l160_c7_e8ea_cond,
result_u16_value_MUX_uxn_opcodes_h_l160_c7_e8ea_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l160_c7_e8ea_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l160_c7_e8ea_return_output);

-- CONST_SL_8_uxn_opcodes_h_l162_c3_fd4b
CONST_SL_8_uxn_opcodes_h_l162_c3_fd4b : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l162_c3_fd4b_x,
CONST_SL_8_uxn_opcodes_h_l162_c3_fd4b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l164_c11_54d4
BIN_OP_EQ_uxn_opcodes_h_l164_c11_54d4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l164_c11_54d4_left,
BIN_OP_EQ_uxn_opcodes_h_l164_c11_54d4_right,
BIN_OP_EQ_uxn_opcodes_h_l164_c11_54d4_return_output);

-- tmp16_MUX_uxn_opcodes_h_l164_c7_e429
tmp16_MUX_uxn_opcodes_h_l164_c7_e429 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l164_c7_e429_cond,
tmp16_MUX_uxn_opcodes_h_l164_c7_e429_iftrue,
tmp16_MUX_uxn_opcodes_h_l164_c7_e429_iffalse,
tmp16_MUX_uxn_opcodes_h_l164_c7_e429_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l164_c7_e429
result_is_opc_done_MUX_uxn_opcodes_h_l164_c7_e429 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l164_c7_e429_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l164_c7_e429_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l164_c7_e429_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l164_c7_e429_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l164_c7_e429
result_is_pc_updated_MUX_uxn_opcodes_h_l164_c7_e429 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l164_c7_e429_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l164_c7_e429_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l164_c7_e429_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l164_c7_e429_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l164_c7_e429
result_u16_value_MUX_uxn_opcodes_h_l164_c7_e429 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l164_c7_e429_cond,
result_u16_value_MUX_uxn_opcodes_h_l164_c7_e429_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l164_c7_e429_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l164_c7_e429_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l165_c3_30e6
BIN_OP_OR_uxn_opcodes_h_l165_c3_30e6 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l165_c3_30e6_left,
BIN_OP_OR_uxn_opcodes_h_l165_c3_30e6_right,
BIN_OP_OR_uxn_opcodes_h_l165_c3_30e6_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l167_c22_6c7d
BIN_OP_PLUS_uxn_opcodes_h_l167_c22_6c7d : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l167_c22_6c7d_left,
BIN_OP_PLUS_uxn_opcodes_h_l167_c22_6c7d_right,
BIN_OP_PLUS_uxn_opcodes_h_l167_c22_6c7d_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l167_c22_0c85
BIN_OP_PLUS_uxn_opcodes_h_l167_c22_0c85 : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l167_c22_0c85_left,
BIN_OP_PLUS_uxn_opcodes_h_l167_c22_0c85_right,
BIN_OP_PLUS_uxn_opcodes_h_l167_c22_0c85_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l169_c11_da6f
BIN_OP_EQ_uxn_opcodes_h_l169_c11_da6f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l169_c11_da6f_left,
BIN_OP_EQ_uxn_opcodes_h_l169_c11_da6f_right,
BIN_OP_EQ_uxn_opcodes_h_l169_c11_da6f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_f5ad
result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_f5ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_f5ad_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_f5ad_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_f5ad_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_f5ad_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_f5ad
result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_f5ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_f5ad_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_f5ad_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_f5ad_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_f5ad_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l138_c6_13da_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l138_c1_b7ad_return_output,
 tmp16_MUX_uxn_opcodes_h_l138_c2_ad56_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l138_c2_ad56_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l138_c2_ad56_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l138_c2_ad56_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l138_c2_ad56_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l138_c2_ad56_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l138_c2_ad56_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l138_c2_ad56_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l138_c2_ad56_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l142_c11_028a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l145_c11_d70d_return_output,
 tmp16_MUX_uxn_opcodes_h_l145_c7_f7ef_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l145_c7_f7ef_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l145_c7_f7ef_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l145_c7_f7ef_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l145_c7_f7ef_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l145_c7_f7ef_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l145_c7_f7ef_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l145_c7_f7ef_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l151_c11_d76f_return_output,
 tmp16_MUX_uxn_opcodes_h_l151_c7_b14f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_b14f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_b14f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l151_c7_b14f_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_b14f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_b14f_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l151_c7_b14f_return_output,
 CONST_SR_8_uxn_opcodes_h_l153_c31_37b7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l156_c11_4eb6_return_output,
 tmp16_MUX_uxn_opcodes_h_l156_c7_da68_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l156_c7_da68_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l156_c7_da68_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l156_c7_da68_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l156_c7_da68_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l158_c22_60e6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l160_c11_92b6_return_output,
 tmp16_MUX_uxn_opcodes_h_l160_c7_e8ea_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_e8ea_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_e8ea_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l160_c7_e8ea_return_output,
 CONST_SL_8_uxn_opcodes_h_l162_c3_fd4b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l164_c11_54d4_return_output,
 tmp16_MUX_uxn_opcodes_h_l164_c7_e429_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l164_c7_e429_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l164_c7_e429_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l164_c7_e429_return_output,
 BIN_OP_OR_uxn_opcodes_h_l165_c3_30e6_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l167_c22_6c7d_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l167_c22_0c85_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l169_c11_da6f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_f5ad_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_f5ad_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l138_c6_13da_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l138_c6_13da_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l138_c6_13da_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l138_c1_b7ad_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l138_c1_b7ad_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l138_c1_b7ad_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l138_c1_b7ad_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l138_c2_ad56_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l142_c3_7280 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l138_c2_ad56_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l145_c7_f7ef_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l138_c2_ad56_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l138_c2_ad56_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l138_c2_ad56_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l138_c2_ad56_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l145_c7_f7ef_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l138_c2_ad56_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l138_c2_ad56_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l138_c2_ad56_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l141_c3_07b8 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l138_c2_ad56_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l138_c2_ad56_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l138_c2_ad56_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l138_c2_ad56_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l138_c2_ad56_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l138_c2_ad56_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l145_c7_f7ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l138_c2_ad56_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l138_c2_ad56_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l138_c2_ad56_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l138_c2_ad56_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l145_c7_f7ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l138_c2_ad56_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l138_c2_ad56_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l138_c2_ad56_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l138_c2_ad56_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l145_c7_f7ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l138_c2_ad56_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l138_c2_ad56_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l138_c2_ad56_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l138_c2_ad56_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l145_c7_f7ef_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l138_c2_ad56_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l138_c2_ad56_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l138_c2_ad56_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l138_c2_ad56_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l145_c7_f7ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l138_c2_ad56_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l138_c2_ad56_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l138_c2_ad56_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l138_c2_ad56_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l145_c7_f7ef_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l138_c2_ad56_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l138_c2_ad56_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l139_c3_9fb9_uxn_opcodes_h_l139_c3_9fb9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l142_c11_028a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l142_c11_028a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l142_c11_028a_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l145_c11_d70d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l145_c11_d70d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l145_c11_d70d_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l145_c7_f7ef_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l145_c7_f7ef_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l151_c7_b14f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l145_c7_f7ef_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l145_c7_f7ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l145_c7_f7ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_b14f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l145_c7_f7ef_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l145_c7_f7ef_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l148_c3_2053 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l145_c7_f7ef_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_b14f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l145_c7_f7ef_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l145_c7_f7ef_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l145_c7_f7ef_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l151_c7_b14f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l145_c7_f7ef_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l145_c7_f7ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l145_c7_f7ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_b14f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l145_c7_f7ef_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l145_c7_f7ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l145_c7_f7ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_b14f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l145_c7_f7ef_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l145_c7_f7ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l145_c7_f7ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l145_c7_f7ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l145_c7_f7ef_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l145_c7_f7ef_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l145_c7_f7ef_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l151_c7_b14f_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l145_c7_f7ef_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l149_c21_9e19_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l151_c11_d76f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l151_c11_d76f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l151_c11_d76f_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l151_c7_b14f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l151_c7_b14f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l156_c7_da68_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l151_c7_b14f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_b14f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_b14f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l156_c7_da68_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_b14f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_b14f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l152_c3_b6e2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_b14f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_b14f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l151_c7_b14f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l151_c7_b14f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l151_c7_b14f_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_b14f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_b14f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l156_c7_da68_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_b14f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_b14f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_b14f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l156_c7_da68_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_b14f_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l151_c7_b14f_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l151_c7_b14f_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l156_c7_da68_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l151_c7_b14f_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l153_c31_37b7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l153_c31_37b7_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l153_c21_6a6d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l156_c11_4eb6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l156_c11_4eb6_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l156_c11_4eb6_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l156_c7_da68_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l156_c7_da68_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_e8ea_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l156_c7_da68_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l156_c7_da68_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l156_c7_da68_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l156_c7_da68_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l156_c7_da68_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l156_c7_da68_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_e8ea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l156_c7_da68_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l156_c7_da68_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l158_c3_2537 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l156_c7_da68_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_e8ea_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l156_c7_da68_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l156_c7_da68_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l156_c7_da68_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_e8ea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l156_c7_da68_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l158_c22_60e6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l158_c22_60e6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l158_c22_60e6_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_92b6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_92b6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_92b6_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_e8ea_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_e8ea_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l164_c7_e429_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_e8ea_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_e8ea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_e8ea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l164_c7_e429_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_e8ea_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_e8ea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_e8ea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l164_c7_e429_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_e8ea_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_e8ea_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_e8ea_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l164_c7_e429_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_e8ea_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l162_c3_fd4b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l162_c3_fd4b_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l164_c11_54d4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l164_c11_54d4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l164_c11_54d4_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l164_c7_e429_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l164_c7_e429_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l164_c7_e429_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l164_c7_e429_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l164_c7_e429_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_f5ad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l164_c7_e429_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l164_c7_e429_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l164_c7_e429_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_f5ad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l164_c7_e429_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l164_c7_e429_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l167_c3_3740 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l164_c7_e429_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l164_c7_e429_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l165_c3_30e6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l165_c3_30e6_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l165_c3_30e6_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l167_c22_6c7d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l167_c22_6c7d_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l167_c22_6c7d_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l167_c22_0c85_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l167_c22_0c85_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l167_c22_0c85_return_output : unsigned(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l169_c11_da6f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l169_c11_da6f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l169_c11_da6f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_f5ad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_f5ad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_f5ad_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_f5ad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_f5ad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_f5ad_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l151_l138_DUPLICATE_1569_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l151_l138_l156_DUPLICATE_5ff7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l151_l138_DUPLICATE_c00f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l138_l169_l160_l156_l151_l145_DUPLICATE_59fc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l164_l138_l145_l160_DUPLICATE_4be3_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l169_l164_l160_l156_l151_l145_DUPLICATE_a9b9_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l161_l165_DUPLICATE_8fe8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_219b_uxn_opcodes_h_l174_l134_DUPLICATE_f129_return_output : opcode_result_t;
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
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l138_c2_ad56_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l152_c3_b6e2 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_b14f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l152_c3_b6e2;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l142_c11_028a_right := to_unsigned(2, 2);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l167_c22_0c85_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l138_c2_ad56_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l164_c11_54d4_right := to_unsigned(5, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l145_c7_f7ef_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l164_c7_e429_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l145_c7_f7ef_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l158_c22_60e6_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l138_c6_13da_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l156_c11_4eb6_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l169_c11_da6f_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l145_c11_d70d_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_92b6_right := to_unsigned(4, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_f5ad_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l148_c3_2053 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l145_c7_f7ef_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l148_c3_2053;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_f5ad_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l138_c1_b7ad_iffalse := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l141_c3_07b8 := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l138_c2_ad56_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l141_c3_07b8;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l156_c7_da68_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l151_c11_d76f_right := to_unsigned(2, 2);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l138_c1_b7ad_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l142_c11_028a_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l158_c22_60e6_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l167_c22_6c7d_left := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l151_c7_b14f_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l138_c6_13da_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l145_c11_d70d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l151_c11_d76f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l156_c11_4eb6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_92b6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l164_c11_54d4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l169_c11_da6f_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l165_c3_30e6_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l153_c31_37b7_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l145_c7_f7ef_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l151_c7_b14f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l156_c7_da68_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l164_c7_e429_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l169_c11_da6f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l169_c11_da6f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l169_c11_da6f_left;
     BIN_OP_EQ_uxn_opcodes_h_l169_c11_da6f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l169_c11_da6f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l169_c11_da6f_return_output := BIN_OP_EQ_uxn_opcodes_h_l169_c11_da6f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l169_l164_l160_l156_l151_l145_DUPLICATE_a9b9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l169_l164_l160_l156_l151_l145_DUPLICATE_a9b9_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l164_l138_l145_l160_DUPLICATE_4be3 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l164_l138_l145_l160_DUPLICATE_4be3_return_output := result.u16_value;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l151_l138_DUPLICATE_c00f LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l151_l138_DUPLICATE_c00f_return_output := result.u8_value;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l138_c2_ad56] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l138_c2_ad56_return_output := result.sp_relative_shift;

     -- CONST_SR_8[uxn_opcodes_h_l153_c31_37b7] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l153_c31_37b7_x <= VAR_CONST_SR_8_uxn_opcodes_h_l153_c31_37b7_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l153_c31_37b7_return_output := CONST_SR_8_uxn_opcodes_h_l153_c31_37b7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l160_c11_92b6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l160_c11_92b6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_92b6_left;
     BIN_OP_EQ_uxn_opcodes_h_l160_c11_92b6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_92b6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_92b6_return_output := BIN_OP_EQ_uxn_opcodes_h_l160_c11_92b6_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l151_l138_l156_DUPLICATE_5ff7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l151_l138_l156_DUPLICATE_5ff7_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l145_c11_d70d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l145_c11_d70d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l145_c11_d70d_left;
     BIN_OP_EQ_uxn_opcodes_h_l145_c11_d70d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l145_c11_d70d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l145_c11_d70d_return_output := BIN_OP_EQ_uxn_opcodes_h_l145_c11_d70d_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l158_c22_60e6] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l158_c22_60e6_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l158_c22_60e6_left;
     BIN_OP_PLUS_uxn_opcodes_h_l158_c22_60e6_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l158_c22_60e6_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l158_c22_60e6_return_output := BIN_OP_PLUS_uxn_opcodes_h_l158_c22_60e6_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l138_l169_l160_l156_l151_l145_DUPLICATE_59fc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l138_l169_l160_l156_l151_l145_DUPLICATE_59fc_return_output := result.is_pc_updated;

     -- BIN_OP_PLUS[uxn_opcodes_h_l142_c11_028a] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l142_c11_028a_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l142_c11_028a_left;
     BIN_OP_PLUS_uxn_opcodes_h_l142_c11_028a_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l142_c11_028a_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l142_c11_028a_return_output := BIN_OP_PLUS_uxn_opcodes_h_l142_c11_028a_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l149_c21_9e19] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l149_c21_9e19_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d[uxn_opcodes_h_l145_c7_f7ef] LATENCY=0
     VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l145_c7_f7ef_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l151_c11_d76f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l151_c11_d76f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l151_c11_d76f_left;
     BIN_OP_EQ_uxn_opcodes_h_l151_c11_d76f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l151_c11_d76f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l151_c11_d76f_return_output := BIN_OP_EQ_uxn_opcodes_h_l151_c11_d76f_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l151_l138_DUPLICATE_1569 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l151_l138_DUPLICATE_1569_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l156_c11_4eb6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l156_c11_4eb6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l156_c11_4eb6_left;
     BIN_OP_EQ_uxn_opcodes_h_l156_c11_4eb6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l156_c11_4eb6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l156_c11_4eb6_return_output := BIN_OP_EQ_uxn_opcodes_h_l156_c11_4eb6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l164_c11_54d4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l164_c11_54d4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l164_c11_54d4_left;
     BIN_OP_EQ_uxn_opcodes_h_l164_c11_54d4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l164_c11_54d4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l164_c11_54d4_return_output := BIN_OP_EQ_uxn_opcodes_h_l164_c11_54d4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l138_c6_13da] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l138_c6_13da_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l138_c6_13da_left;
     BIN_OP_EQ_uxn_opcodes_h_l138_c6_13da_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l138_c6_13da_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l138_c6_13da_return_output := BIN_OP_EQ_uxn_opcodes_h_l138_c6_13da_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l161_l165_DUPLICATE_8fe8 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l161_l165_DUPLICATE_8fe8_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l138_c1_b7ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l138_c6_13da_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l138_c2_ad56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l138_c6_13da_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l138_c2_ad56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l138_c6_13da_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l138_c2_ad56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l138_c6_13da_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l138_c2_ad56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l138_c6_13da_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l138_c2_ad56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l138_c6_13da_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l138_c2_ad56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l138_c6_13da_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l138_c2_ad56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l138_c6_13da_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l138_c2_ad56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l138_c6_13da_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l138_c2_ad56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l138_c6_13da_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l145_c7_f7ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l145_c11_d70d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l145_c7_f7ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l145_c11_d70d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l145_c7_f7ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l145_c11_d70d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l145_c7_f7ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l145_c11_d70d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l145_c7_f7ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l145_c11_d70d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l145_c7_f7ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l145_c11_d70d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l145_c7_f7ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l145_c11_d70d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l145_c7_f7ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l145_c11_d70d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_b14f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l151_c11_d76f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_b14f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l151_c11_d76f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_b14f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l151_c11_d76f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_b14f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l151_c11_d76f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l151_c7_b14f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l151_c11_d76f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l151_c7_b14f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l151_c11_d76f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l151_c7_b14f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l151_c11_d76f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l156_c7_da68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l156_c11_4eb6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l156_c7_da68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l156_c11_4eb6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l156_c7_da68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l156_c11_4eb6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l156_c7_da68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l156_c11_4eb6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l156_c7_da68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l156_c11_4eb6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_e8ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_92b6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_e8ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_92b6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_e8ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_92b6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_e8ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_92b6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l164_c7_e429_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l164_c11_54d4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l164_c7_e429_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l164_c11_54d4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l164_c7_e429_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l164_c11_54d4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l164_c7_e429_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l164_c11_54d4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_f5ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l169_c11_da6f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_f5ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l169_c11_da6f_return_output;
     VAR_tmp16_uxn_opcodes_h_l142_c3_7280 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l142_c11_028a_return_output, 16);
     VAR_result_u16_value_uxn_opcodes_h_l158_c3_2537 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l158_c22_60e6_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l165_c3_30e6_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l161_l165_DUPLICATE_8fe8_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l162_c3_fd4b_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l161_l165_DUPLICATE_8fe8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l145_c7_f7ef_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l149_c21_9e19_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l138_c2_ad56_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l164_l138_l145_l160_DUPLICATE_4be3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l145_c7_f7ef_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l164_l138_l145_l160_DUPLICATE_4be3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_e8ea_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l164_l138_l145_l160_DUPLICATE_4be3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l164_c7_e429_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l164_l138_l145_l160_DUPLICATE_4be3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l145_c7_f7ef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l169_l164_l160_l156_l151_l145_DUPLICATE_a9b9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_b14f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l169_l164_l160_l156_l151_l145_DUPLICATE_a9b9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l156_c7_da68_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l169_l164_l160_l156_l151_l145_DUPLICATE_a9b9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_e8ea_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l169_l164_l160_l156_l151_l145_DUPLICATE_a9b9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l164_c7_e429_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l169_l164_l160_l156_l151_l145_DUPLICATE_a9b9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_f5ad_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l169_l164_l160_l156_l151_l145_DUPLICATE_a9b9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l138_c2_ad56_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l138_l169_l160_l156_l151_l145_DUPLICATE_59fc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l145_c7_f7ef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l138_l169_l160_l156_l151_l145_DUPLICATE_59fc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_b14f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l138_l169_l160_l156_l151_l145_DUPLICATE_59fc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l156_c7_da68_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l138_l169_l160_l156_l151_l145_DUPLICATE_59fc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_e8ea_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l138_l169_l160_l156_l151_l145_DUPLICATE_59fc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_f5ad_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l138_l169_l160_l156_l151_l145_DUPLICATE_59fc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l138_c2_ad56_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l151_l138_l156_DUPLICATE_5ff7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_b14f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l151_l138_l156_DUPLICATE_5ff7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l156_c7_da68_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l151_l138_l156_DUPLICATE_5ff7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l138_c2_ad56_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l151_l138_DUPLICATE_1569_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_b14f_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l151_l138_DUPLICATE_1569_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l138_c2_ad56_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l151_l138_DUPLICATE_c00f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l151_c7_b14f_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l151_l138_DUPLICATE_c00f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l145_c7_f7ef_iffalse := VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l145_c7_f7ef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l138_c2_ad56_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l138_c2_ad56_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l156_c7_da68_iftrue := VAR_result_u16_value_uxn_opcodes_h_l158_c3_2537;
     VAR_tmp16_MUX_uxn_opcodes_h_l138_c2_ad56_iftrue := VAR_tmp16_uxn_opcodes_h_l142_c3_7280;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l138_c2_ad56] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l138_c2_ad56_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l138_c2_ad56_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l138_c2_ad56_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l138_c2_ad56_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l138_c2_ad56_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l138_c2_ad56_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l138_c2_ad56_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l138_c2_ad56_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l169_c7_f5ad] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_f5ad_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_f5ad_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_f5ad_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_f5ad_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_f5ad_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_f5ad_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_f5ad_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_f5ad_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l151_c7_b14f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_b14f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_b14f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_b14f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_b14f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_b14f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_b14f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_b14f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_b14f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l169_c7_f5ad] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_f5ad_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_f5ad_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_f5ad_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_f5ad_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_f5ad_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_f5ad_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_f5ad_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_f5ad_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l138_c1_b7ad] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l138_c1_b7ad_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l138_c1_b7ad_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l138_c1_b7ad_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l138_c1_b7ad_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l138_c1_b7ad_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l138_c1_b7ad_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l138_c1_b7ad_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l138_c1_b7ad_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l156_c7_da68] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l156_c7_da68_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l156_c7_da68_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l156_c7_da68_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l156_c7_da68_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l156_c7_da68_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l156_c7_da68_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l156_c7_da68_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l156_c7_da68_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l145_c7_f7ef] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l145_c7_f7ef_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l145_c7_f7ef_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l145_c7_f7ef_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l145_c7_f7ef_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l145_c7_f7ef_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l145_c7_f7ef_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l145_c7_f7ef_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l145_c7_f7ef_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l153_c21_6a6d] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l153_c21_6a6d_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l153_c31_37b7_return_output);

     -- CONST_SL_8[uxn_opcodes_h_l162_c3_fd4b] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l162_c3_fd4b_x <= VAR_CONST_SL_8_uxn_opcodes_h_l162_c3_fd4b_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l162_c3_fd4b_return_output := CONST_SL_8_uxn_opcodes_h_l162_c3_fd4b_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l165_c3_30e6] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l165_c3_30e6_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l165_c3_30e6_left;
     BIN_OP_OR_uxn_opcodes_h_l165_c3_30e6_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l165_c3_30e6_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l165_c3_30e6_return_output := BIN_OP_OR_uxn_opcodes_h_l165_c3_30e6_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l167_c22_6c7d_right := VAR_BIN_OP_OR_uxn_opcodes_h_l165_c3_30e6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l164_c7_e429_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l165_c3_30e6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l151_c7_b14f_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l153_c21_6a6d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_e8ea_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l162_c3_fd4b_return_output;
     VAR_printf_uxn_opcodes_h_l139_c3_9fb9_uxn_opcodes_h_l139_c3_9fb9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l138_c1_b7ad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l164_c7_e429_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_f5ad_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l164_c7_e429_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_f5ad_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l138_c2_ad56_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l145_c7_f7ef_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_b14f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l156_c7_da68_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l145_c7_f7ef_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_b14f_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l164_c7_e429] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l164_c7_e429_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l164_c7_e429_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l164_c7_e429_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l164_c7_e429_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l164_c7_e429_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l164_c7_e429_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l164_c7_e429_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l164_c7_e429_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l164_c7_e429] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l164_c7_e429_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l164_c7_e429_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l164_c7_e429_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l164_c7_e429_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l164_c7_e429_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l164_c7_e429_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l164_c7_e429_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l164_c7_e429_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l151_c7_b14f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l151_c7_b14f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l151_c7_b14f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l151_c7_b14f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l151_c7_b14f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l151_c7_b14f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l151_c7_b14f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l151_c7_b14f_return_output := result_u8_value_MUX_uxn_opcodes_h_l151_c7_b14f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l151_c7_b14f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_b14f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_b14f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_b14f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_b14f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_b14f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_b14f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_b14f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_b14f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l138_c2_ad56] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l138_c2_ad56_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l138_c2_ad56_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l138_c2_ad56_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l138_c2_ad56_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l138_c2_ad56_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l138_c2_ad56_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l138_c2_ad56_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l138_c2_ad56_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l167_c22_6c7d] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l167_c22_6c7d_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l167_c22_6c7d_left;
     BIN_OP_PLUS_uxn_opcodes_h_l167_c22_6c7d_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l167_c22_6c7d_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l167_c22_6c7d_return_output := BIN_OP_PLUS_uxn_opcodes_h_l167_c22_6c7d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l164_c7_e429] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l164_c7_e429_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l164_c7_e429_cond;
     tmp16_MUX_uxn_opcodes_h_l164_c7_e429_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l164_c7_e429_iftrue;
     tmp16_MUX_uxn_opcodes_h_l164_c7_e429_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l164_c7_e429_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l164_c7_e429_return_output := tmp16_MUX_uxn_opcodes_h_l164_c7_e429_return_output;

     -- printf_uxn_opcodes_h_l139_c3_9fb9[uxn_opcodes_h_l139_c3_9fb9] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l139_c3_9fb9_uxn_opcodes_h_l139_c3_9fb9_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l139_c3_9fb9_uxn_opcodes_h_l139_c3_9fb9_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l145_c7_f7ef] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l145_c7_f7ef_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l145_c7_f7ef_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l145_c7_f7ef_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l145_c7_f7ef_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l145_c7_f7ef_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l145_c7_f7ef_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l145_c7_f7ef_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l145_c7_f7ef_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l167_c22_0c85_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l167_c22_6c7d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_e8ea_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l164_c7_e429_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_e8ea_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l164_c7_e429_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l145_c7_f7ef_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_b14f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l138_c2_ad56_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l145_c7_f7ef_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l145_c7_f7ef_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l151_c7_b14f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_e8ea_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l164_c7_e429_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l167_c22_0c85] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l167_c22_0c85_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l167_c22_0c85_left;
     BIN_OP_PLUS_uxn_opcodes_h_l167_c22_0c85_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l167_c22_0c85_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l167_c22_0c85_return_output := BIN_OP_PLUS_uxn_opcodes_h_l167_c22_0c85_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l138_c2_ad56] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l138_c2_ad56_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l138_c2_ad56_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l138_c2_ad56_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l138_c2_ad56_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l138_c2_ad56_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l138_c2_ad56_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l138_c2_ad56_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l138_c2_ad56_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l160_c7_e8ea] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l160_c7_e8ea_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_e8ea_cond;
     tmp16_MUX_uxn_opcodes_h_l160_c7_e8ea_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_e8ea_iftrue;
     tmp16_MUX_uxn_opcodes_h_l160_c7_e8ea_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_e8ea_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_e8ea_return_output := tmp16_MUX_uxn_opcodes_h_l160_c7_e8ea_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l145_c7_f7ef] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l145_c7_f7ef_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l145_c7_f7ef_cond;
     result_u8_value_MUX_uxn_opcodes_h_l145_c7_f7ef_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l145_c7_f7ef_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l145_c7_f7ef_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l145_c7_f7ef_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l145_c7_f7ef_return_output := result_u8_value_MUX_uxn_opcodes_h_l145_c7_f7ef_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l160_c7_e8ea] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_e8ea_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_e8ea_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_e8ea_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_e8ea_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_e8ea_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_e8ea_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_e8ea_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_e8ea_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l160_c7_e8ea] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_e8ea_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_e8ea_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_e8ea_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_e8ea_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_e8ea_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_e8ea_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_e8ea_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_e8ea_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l145_c7_f7ef] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l145_c7_f7ef_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l145_c7_f7ef_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l145_c7_f7ef_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l145_c7_f7ef_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l145_c7_f7ef_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l145_c7_f7ef_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l145_c7_f7ef_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l145_c7_f7ef_return_output;

     -- Submodule level 4
     VAR_result_u16_value_uxn_opcodes_h_l167_c3_3740 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l167_c22_0c85_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l156_c7_da68_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_e8ea_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l156_c7_da68_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_e8ea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l138_c2_ad56_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l145_c7_f7ef_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l138_c2_ad56_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l145_c7_f7ef_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l156_c7_da68_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_e8ea_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l164_c7_e429_iftrue := VAR_result_u16_value_uxn_opcodes_h_l167_c3_3740;
     -- result_u16_value_MUX[uxn_opcodes_h_l164_c7_e429] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l164_c7_e429_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l164_c7_e429_cond;
     result_u16_value_MUX_uxn_opcodes_h_l164_c7_e429_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l164_c7_e429_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l164_c7_e429_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l164_c7_e429_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l164_c7_e429_return_output := result_u16_value_MUX_uxn_opcodes_h_l164_c7_e429_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l156_c7_da68] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l156_c7_da68_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l156_c7_da68_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l156_c7_da68_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l156_c7_da68_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l156_c7_da68_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l156_c7_da68_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l156_c7_da68_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l156_c7_da68_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l156_c7_da68] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l156_c7_da68_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l156_c7_da68_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l156_c7_da68_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l156_c7_da68_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l156_c7_da68_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l156_c7_da68_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l156_c7_da68_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l156_c7_da68_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l156_c7_da68] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l156_c7_da68_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l156_c7_da68_cond;
     tmp16_MUX_uxn_opcodes_h_l156_c7_da68_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l156_c7_da68_iftrue;
     tmp16_MUX_uxn_opcodes_h_l156_c7_da68_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l156_c7_da68_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l156_c7_da68_return_output := tmp16_MUX_uxn_opcodes_h_l156_c7_da68_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l138_c2_ad56] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l138_c2_ad56_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l138_c2_ad56_cond;
     result_u8_value_MUX_uxn_opcodes_h_l138_c2_ad56_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l138_c2_ad56_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l138_c2_ad56_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l138_c2_ad56_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l138_c2_ad56_return_output := result_u8_value_MUX_uxn_opcodes_h_l138_c2_ad56_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l138_c2_ad56] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l138_c2_ad56_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l138_c2_ad56_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l138_c2_ad56_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l138_c2_ad56_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l138_c2_ad56_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l138_c2_ad56_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l138_c2_ad56_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l138_c2_ad56_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_b14f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l156_c7_da68_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_b14f_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l156_c7_da68_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_e8ea_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l164_c7_e429_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l151_c7_b14f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l156_c7_da68_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l160_c7_e8ea] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l160_c7_e8ea_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_e8ea_cond;
     result_u16_value_MUX_uxn_opcodes_h_l160_c7_e8ea_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_e8ea_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l160_c7_e8ea_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_e8ea_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_e8ea_return_output := result_u16_value_MUX_uxn_opcodes_h_l160_c7_e8ea_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l151_c7_b14f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l151_c7_b14f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l151_c7_b14f_cond;
     tmp16_MUX_uxn_opcodes_h_l151_c7_b14f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l151_c7_b14f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l151_c7_b14f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l151_c7_b14f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l151_c7_b14f_return_output := tmp16_MUX_uxn_opcodes_h_l151_c7_b14f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l151_c7_b14f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_b14f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_b14f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_b14f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_b14f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_b14f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_b14f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_b14f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_b14f_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l151_c7_b14f] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_b14f_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_b14f_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_b14f_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_b14f_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_b14f_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_b14f_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_b14f_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_b14f_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l145_c7_f7ef_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_b14f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l145_c7_f7ef_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_b14f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l156_c7_da68_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_e8ea_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l145_c7_f7ef_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l151_c7_b14f_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l156_c7_da68] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l156_c7_da68_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l156_c7_da68_cond;
     result_u16_value_MUX_uxn_opcodes_h_l156_c7_da68_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l156_c7_da68_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l156_c7_da68_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l156_c7_da68_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l156_c7_da68_return_output := result_u16_value_MUX_uxn_opcodes_h_l156_c7_da68_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l145_c7_f7ef] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l145_c7_f7ef_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l145_c7_f7ef_cond;
     tmp16_MUX_uxn_opcodes_h_l145_c7_f7ef_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l145_c7_f7ef_iftrue;
     tmp16_MUX_uxn_opcodes_h_l145_c7_f7ef_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l145_c7_f7ef_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l145_c7_f7ef_return_output := tmp16_MUX_uxn_opcodes_h_l145_c7_f7ef_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l145_c7_f7ef] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l145_c7_f7ef_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l145_c7_f7ef_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l145_c7_f7ef_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l145_c7_f7ef_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l145_c7_f7ef_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l145_c7_f7ef_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l145_c7_f7ef_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l145_c7_f7ef_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l145_c7_f7ef] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l145_c7_f7ef_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l145_c7_f7ef_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l145_c7_f7ef_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l145_c7_f7ef_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l145_c7_f7ef_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l145_c7_f7ef_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l145_c7_f7ef_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l145_c7_f7ef_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l138_c2_ad56_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l145_c7_f7ef_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l138_c2_ad56_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l145_c7_f7ef_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l151_c7_b14f_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l156_c7_da68_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l138_c2_ad56_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l145_c7_f7ef_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l138_c2_ad56] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l138_c2_ad56_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l138_c2_ad56_cond;
     tmp16_MUX_uxn_opcodes_h_l138_c2_ad56_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l138_c2_ad56_iftrue;
     tmp16_MUX_uxn_opcodes_h_l138_c2_ad56_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l138_c2_ad56_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l138_c2_ad56_return_output := tmp16_MUX_uxn_opcodes_h_l138_c2_ad56_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l138_c2_ad56] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l138_c2_ad56_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l138_c2_ad56_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l138_c2_ad56_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l138_c2_ad56_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l138_c2_ad56_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l138_c2_ad56_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l138_c2_ad56_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l138_c2_ad56_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l151_c7_b14f] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l151_c7_b14f_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l151_c7_b14f_cond;
     result_u16_value_MUX_uxn_opcodes_h_l151_c7_b14f_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l151_c7_b14f_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l151_c7_b14f_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l151_c7_b14f_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l151_c7_b14f_return_output := result_u16_value_MUX_uxn_opcodes_h_l151_c7_b14f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l138_c2_ad56] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l138_c2_ad56_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l138_c2_ad56_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l138_c2_ad56_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l138_c2_ad56_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l138_c2_ad56_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l138_c2_ad56_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l138_c2_ad56_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l138_c2_ad56_return_output;

     -- Submodule level 8
     VAR_result_u16_value_MUX_uxn_opcodes_h_l145_c7_f7ef_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l151_c7_b14f_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l138_c2_ad56_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l145_c7_f7ef] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l145_c7_f7ef_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l145_c7_f7ef_cond;
     result_u16_value_MUX_uxn_opcodes_h_l145_c7_f7ef_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l145_c7_f7ef_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l145_c7_f7ef_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l145_c7_f7ef_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l145_c7_f7ef_return_output := result_u16_value_MUX_uxn_opcodes_h_l145_c7_f7ef_return_output;

     -- Submodule level 9
     VAR_result_u16_value_MUX_uxn_opcodes_h_l138_c2_ad56_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l145_c7_f7ef_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l138_c2_ad56] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l138_c2_ad56_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l138_c2_ad56_cond;
     result_u16_value_MUX_uxn_opcodes_h_l138_c2_ad56_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l138_c2_ad56_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l138_c2_ad56_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l138_c2_ad56_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l138_c2_ad56_return_output := result_u16_value_MUX_uxn_opcodes_h_l138_c2_ad56_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_219b_uxn_opcodes_h_l174_l134_DUPLICATE_f129 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_219b_uxn_opcodes_h_l174_l134_DUPLICATE_f129_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_219b(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l138_c2_ad56_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l138_c2_ad56_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l138_c2_ad56_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l138_c2_ad56_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l138_c2_ad56_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l138_c2_ad56_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l138_c2_ad56_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l138_c2_ad56_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_219b_uxn_opcodes_h_l174_l134_DUPLICATE_f129_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_219b_uxn_opcodes_h_l174_l134_DUPLICATE_f129_return_output;
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
