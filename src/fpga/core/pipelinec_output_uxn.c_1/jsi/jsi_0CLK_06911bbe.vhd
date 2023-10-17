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
-- BIN_OP_EQ[uxn_opcodes_h_l144_c6_ae51]
signal BIN_OP_EQ_uxn_opcodes_h_l144_c6_ae51_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l144_c6_ae51_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l144_c6_ae51_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l144_c1_1f52]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l144_c1_1f52_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l144_c1_1f52_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l144_c1_1f52_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l144_c1_1f52_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l144_c2_af39]
signal tmp16_MUX_uxn_opcodes_h_l144_c2_af39_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l144_c2_af39_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l144_c2_af39_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l144_c2_af39_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l144_c2_af39]
signal result_u8_value_MUX_uxn_opcodes_h_l144_c2_af39_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l144_c2_af39_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l144_c2_af39_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l144_c2_af39_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l144_c2_af39]
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_af39_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_af39_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_af39_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_af39_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l144_c2_af39]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_af39_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_af39_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_af39_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_af39_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l144_c2_af39]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_af39_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_af39_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_af39_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_af39_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l144_c2_af39]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_af39_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_af39_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_af39_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_af39_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l144_c2_af39]
signal result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_af39_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_af39_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_af39_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_af39_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l144_c2_af39]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_af39_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_af39_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_af39_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_af39_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l144_c2_af39]
signal result_u16_value_MUX_uxn_opcodes_h_l144_c2_af39_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l144_c2_af39_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l144_c2_af39_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l144_c2_af39_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l145_c3_8f76[uxn_opcodes_h_l145_c3_8f76]
signal printf_uxn_opcodes_h_l145_c3_8f76_uxn_opcodes_h_l145_c3_8f76_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l148_c11_79ae]
signal BIN_OP_PLUS_uxn_opcodes_h_l148_c11_79ae_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l148_c11_79ae_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l148_c11_79ae_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l151_c11_1a7e]
signal BIN_OP_EQ_uxn_opcodes_h_l151_c11_1a7e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l151_c11_1a7e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l151_c11_1a7e_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l151_c7_192b]
signal tmp16_MUX_uxn_opcodes_h_l151_c7_192b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l151_c7_192b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l151_c7_192b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l151_c7_192b_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l151_c7_192b]
signal result_u8_value_MUX_uxn_opcodes_h_l151_c7_192b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l151_c7_192b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l151_c7_192b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l151_c7_192b_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l151_c7_192b]
signal result_u16_value_MUX_uxn_opcodes_h_l151_c7_192b_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l151_c7_192b_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l151_c7_192b_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l151_c7_192b_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l151_c7_192b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_192b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_192b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_192b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_192b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l151_c7_192b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_192b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_192b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_192b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_192b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l151_c7_192b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_192b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_192b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_192b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_192b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l151_c7_192b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_192b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_192b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_192b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_192b_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l151_c7_192b]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_192b_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_192b_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_192b_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_192b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l157_c11_0512]
signal BIN_OP_EQ_uxn_opcodes_h_l157_c11_0512_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l157_c11_0512_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l157_c11_0512_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l157_c7_305f]
signal tmp16_MUX_uxn_opcodes_h_l157_c7_305f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l157_c7_305f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l157_c7_305f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l157_c7_305f_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l157_c7_305f]
signal result_u8_value_MUX_uxn_opcodes_h_l157_c7_305f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l157_c7_305f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l157_c7_305f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l157_c7_305f_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l157_c7_305f]
signal result_u16_value_MUX_uxn_opcodes_h_l157_c7_305f_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l157_c7_305f_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l157_c7_305f_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l157_c7_305f_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l157_c7_305f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_305f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_305f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_305f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_305f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l157_c7_305f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_305f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_305f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_305f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_305f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l157_c7_305f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_305f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_305f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_305f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_305f_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l157_c7_305f]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_305f_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_305f_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_305f_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_305f_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l159_c31_8046]
signal CONST_SR_8_uxn_opcodes_h_l159_c31_8046_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l159_c31_8046_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l162_c11_321f]
signal BIN_OP_EQ_uxn_opcodes_h_l162_c11_321f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l162_c11_321f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l162_c11_321f_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l162_c7_e19d]
signal tmp16_MUX_uxn_opcodes_h_l162_c7_e19d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l162_c7_e19d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l162_c7_e19d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l162_c7_e19d_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l162_c7_e19d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_e19d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_e19d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_e19d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_e19d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l162_c7_e19d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_e19d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_e19d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_e19d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_e19d_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l162_c7_e19d]
signal result_u16_value_MUX_uxn_opcodes_h_l162_c7_e19d_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l162_c7_e19d_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l162_c7_e19d_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l162_c7_e19d_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l162_c7_e19d]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_e19d_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_e19d_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_e19d_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_e19d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l166_c11_d461]
signal BIN_OP_EQ_uxn_opcodes_h_l166_c11_d461_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l166_c11_d461_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l166_c11_d461_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l166_c7_113b]
signal tmp16_MUX_uxn_opcodes_h_l166_c7_113b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l166_c7_113b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l166_c7_113b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l166_c7_113b_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l166_c7_113b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_113b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_113b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_113b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_113b_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l166_c7_113b]
signal result_u16_value_MUX_uxn_opcodes_h_l166_c7_113b_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l166_c7_113b_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l166_c7_113b_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l166_c7_113b_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l166_c7_113b]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_113b_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_113b_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_113b_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_113b_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l168_c3_efa7]
signal CONST_SL_8_uxn_opcodes_h_l168_c3_efa7_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l168_c3_efa7_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l169_c22_2a14]
signal BIN_OP_PLUS_uxn_opcodes_h_l169_c22_2a14_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l169_c22_2a14_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l169_c22_2a14_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l171_c11_1bbb]
signal BIN_OP_EQ_uxn_opcodes_h_l171_c11_1bbb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l171_c11_1bbb_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l171_c11_1bbb_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l171_c7_7885]
signal tmp16_MUX_uxn_opcodes_h_l171_c7_7885_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l171_c7_7885_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l171_c7_7885_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l171_c7_7885_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l171_c7_7885]
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_7885_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_7885_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_7885_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_7885_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l171_c7_7885]
signal result_u16_value_MUX_uxn_opcodes_h_l171_c7_7885_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l171_c7_7885_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l171_c7_7885_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l171_c7_7885_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l171_c7_7885]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_7885_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_7885_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_7885_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_7885_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l172_c22_1c9f]
signal BIN_OP_PLUS_uxn_opcodes_h_l172_c22_1c9f_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l172_c22_1c9f_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l172_c22_1c9f_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l174_c11_8287]
signal BIN_OP_EQ_uxn_opcodes_h_l174_c11_8287_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l174_c11_8287_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l174_c11_8287_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l174_c7_7207]
signal tmp16_MUX_uxn_opcodes_h_l174_c7_7207_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l174_c7_7207_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l174_c7_7207_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l174_c7_7207_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l174_c7_7207]
signal result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_7207_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_7207_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_7207_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_7207_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l174_c7_7207]
signal result_u16_value_MUX_uxn_opcodes_h_l174_c7_7207_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l174_c7_7207_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l174_c7_7207_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l174_c7_7207_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l174_c7_7207]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_7207_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_7207_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_7207_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_7207_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l175_c3_b4a3]
signal BIN_OP_OR_uxn_opcodes_h_l175_c3_b4a3_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l175_c3_b4a3_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l175_c3_b4a3_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l177_c22_4c65]
signal BIN_OP_PLUS_uxn_opcodes_h_l177_c22_4c65_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l177_c22_4c65_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l177_c22_4c65_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l177_c22_c54d]
signal BIN_OP_PLUS_uxn_opcodes_h_l177_c22_c54d_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l177_c22_c54d_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l177_c22_c54d_return_output : unsigned(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l179_c11_71ac]
signal BIN_OP_EQ_uxn_opcodes_h_l179_c11_71ac_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l179_c11_71ac_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l179_c11_71ac_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l179_c7_fc4f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_fc4f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_fc4f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_fc4f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_fc4f_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l179_c7_fc4f]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_fc4f_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_fc4f_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_fc4f_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_fc4f_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_5fa8( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.is_opc_done := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_pc_updated := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.is_sp_shift := ref_toks_7;
      base.u16_value := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l144_c6_ae51
BIN_OP_EQ_uxn_opcodes_h_l144_c6_ae51 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l144_c6_ae51_left,
BIN_OP_EQ_uxn_opcodes_h_l144_c6_ae51_right,
BIN_OP_EQ_uxn_opcodes_h_l144_c6_ae51_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l144_c1_1f52
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l144_c1_1f52 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l144_c1_1f52_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l144_c1_1f52_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l144_c1_1f52_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l144_c1_1f52_return_output);

-- tmp16_MUX_uxn_opcodes_h_l144_c2_af39
tmp16_MUX_uxn_opcodes_h_l144_c2_af39 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l144_c2_af39_cond,
tmp16_MUX_uxn_opcodes_h_l144_c2_af39_iftrue,
tmp16_MUX_uxn_opcodes_h_l144_c2_af39_iffalse,
tmp16_MUX_uxn_opcodes_h_l144_c2_af39_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l144_c2_af39
result_u8_value_MUX_uxn_opcodes_h_l144_c2_af39 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l144_c2_af39_cond,
result_u8_value_MUX_uxn_opcodes_h_l144_c2_af39_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l144_c2_af39_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l144_c2_af39_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_af39
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_af39 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_af39_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_af39_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_af39_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_af39_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_af39
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_af39 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_af39_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_af39_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_af39_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_af39_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_af39
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_af39 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_af39_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_af39_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_af39_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_af39_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_af39
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_af39 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_af39_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_af39_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_af39_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_af39_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_af39
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_af39 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_af39_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_af39_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_af39_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_af39_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_af39
result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_af39 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_af39_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_af39_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_af39_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_af39_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l144_c2_af39
result_u16_value_MUX_uxn_opcodes_h_l144_c2_af39 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l144_c2_af39_cond,
result_u16_value_MUX_uxn_opcodes_h_l144_c2_af39_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l144_c2_af39_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l144_c2_af39_return_output);

-- printf_uxn_opcodes_h_l145_c3_8f76_uxn_opcodes_h_l145_c3_8f76
printf_uxn_opcodes_h_l145_c3_8f76_uxn_opcodes_h_l145_c3_8f76 : entity work.printf_uxn_opcodes_h_l145_c3_8f76_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l145_c3_8f76_uxn_opcodes_h_l145_c3_8f76_CLOCK_ENABLE);

-- BIN_OP_PLUS_uxn_opcodes_h_l148_c11_79ae
BIN_OP_PLUS_uxn_opcodes_h_l148_c11_79ae : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l148_c11_79ae_left,
BIN_OP_PLUS_uxn_opcodes_h_l148_c11_79ae_right,
BIN_OP_PLUS_uxn_opcodes_h_l148_c11_79ae_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l151_c11_1a7e
BIN_OP_EQ_uxn_opcodes_h_l151_c11_1a7e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l151_c11_1a7e_left,
BIN_OP_EQ_uxn_opcodes_h_l151_c11_1a7e_right,
BIN_OP_EQ_uxn_opcodes_h_l151_c11_1a7e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l151_c7_192b
tmp16_MUX_uxn_opcodes_h_l151_c7_192b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l151_c7_192b_cond,
tmp16_MUX_uxn_opcodes_h_l151_c7_192b_iftrue,
tmp16_MUX_uxn_opcodes_h_l151_c7_192b_iffalse,
tmp16_MUX_uxn_opcodes_h_l151_c7_192b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l151_c7_192b
result_u8_value_MUX_uxn_opcodes_h_l151_c7_192b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l151_c7_192b_cond,
result_u8_value_MUX_uxn_opcodes_h_l151_c7_192b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l151_c7_192b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l151_c7_192b_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l151_c7_192b
result_u16_value_MUX_uxn_opcodes_h_l151_c7_192b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l151_c7_192b_cond,
result_u16_value_MUX_uxn_opcodes_h_l151_c7_192b_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l151_c7_192b_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l151_c7_192b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_192b
result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_192b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_192b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_192b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_192b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_192b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_192b
result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_192b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_192b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_192b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_192b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_192b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_192b
result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_192b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_192b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_192b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_192b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_192b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_192b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_192b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_192b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_192b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_192b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_192b_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_192b
result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_192b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_192b_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_192b_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_192b_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_192b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l157_c11_0512
BIN_OP_EQ_uxn_opcodes_h_l157_c11_0512 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l157_c11_0512_left,
BIN_OP_EQ_uxn_opcodes_h_l157_c11_0512_right,
BIN_OP_EQ_uxn_opcodes_h_l157_c11_0512_return_output);

-- tmp16_MUX_uxn_opcodes_h_l157_c7_305f
tmp16_MUX_uxn_opcodes_h_l157_c7_305f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l157_c7_305f_cond,
tmp16_MUX_uxn_opcodes_h_l157_c7_305f_iftrue,
tmp16_MUX_uxn_opcodes_h_l157_c7_305f_iffalse,
tmp16_MUX_uxn_opcodes_h_l157_c7_305f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l157_c7_305f
result_u8_value_MUX_uxn_opcodes_h_l157_c7_305f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l157_c7_305f_cond,
result_u8_value_MUX_uxn_opcodes_h_l157_c7_305f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l157_c7_305f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l157_c7_305f_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l157_c7_305f
result_u16_value_MUX_uxn_opcodes_h_l157_c7_305f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l157_c7_305f_cond,
result_u16_value_MUX_uxn_opcodes_h_l157_c7_305f_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l157_c7_305f_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l157_c7_305f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_305f
result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_305f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_305f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_305f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_305f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_305f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_305f
result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_305f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_305f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_305f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_305f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_305f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_305f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_305f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_305f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_305f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_305f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_305f_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_305f
result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_305f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_305f_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_305f_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_305f_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_305f_return_output);

-- CONST_SR_8_uxn_opcodes_h_l159_c31_8046
CONST_SR_8_uxn_opcodes_h_l159_c31_8046 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l159_c31_8046_x,
CONST_SR_8_uxn_opcodes_h_l159_c31_8046_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l162_c11_321f
BIN_OP_EQ_uxn_opcodes_h_l162_c11_321f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l162_c11_321f_left,
BIN_OP_EQ_uxn_opcodes_h_l162_c11_321f_right,
BIN_OP_EQ_uxn_opcodes_h_l162_c11_321f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l162_c7_e19d
tmp16_MUX_uxn_opcodes_h_l162_c7_e19d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l162_c7_e19d_cond,
tmp16_MUX_uxn_opcodes_h_l162_c7_e19d_iftrue,
tmp16_MUX_uxn_opcodes_h_l162_c7_e19d_iffalse,
tmp16_MUX_uxn_opcodes_h_l162_c7_e19d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_e19d
result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_e19d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_e19d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_e19d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_e19d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_e19d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_e19d
result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_e19d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_e19d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_e19d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_e19d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_e19d_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l162_c7_e19d
result_u16_value_MUX_uxn_opcodes_h_l162_c7_e19d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l162_c7_e19d_cond,
result_u16_value_MUX_uxn_opcodes_h_l162_c7_e19d_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l162_c7_e19d_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l162_c7_e19d_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_e19d
result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_e19d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_e19d_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_e19d_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_e19d_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_e19d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l166_c11_d461
BIN_OP_EQ_uxn_opcodes_h_l166_c11_d461 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l166_c11_d461_left,
BIN_OP_EQ_uxn_opcodes_h_l166_c11_d461_right,
BIN_OP_EQ_uxn_opcodes_h_l166_c11_d461_return_output);

-- tmp16_MUX_uxn_opcodes_h_l166_c7_113b
tmp16_MUX_uxn_opcodes_h_l166_c7_113b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l166_c7_113b_cond,
tmp16_MUX_uxn_opcodes_h_l166_c7_113b_iftrue,
tmp16_MUX_uxn_opcodes_h_l166_c7_113b_iffalse,
tmp16_MUX_uxn_opcodes_h_l166_c7_113b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_113b
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_113b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_113b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_113b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_113b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_113b_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l166_c7_113b
result_u16_value_MUX_uxn_opcodes_h_l166_c7_113b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l166_c7_113b_cond,
result_u16_value_MUX_uxn_opcodes_h_l166_c7_113b_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l166_c7_113b_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l166_c7_113b_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_113b
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_113b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_113b_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_113b_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_113b_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_113b_return_output);

-- CONST_SL_8_uxn_opcodes_h_l168_c3_efa7
CONST_SL_8_uxn_opcodes_h_l168_c3_efa7 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l168_c3_efa7_x,
CONST_SL_8_uxn_opcodes_h_l168_c3_efa7_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l169_c22_2a14
BIN_OP_PLUS_uxn_opcodes_h_l169_c22_2a14 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l169_c22_2a14_left,
BIN_OP_PLUS_uxn_opcodes_h_l169_c22_2a14_right,
BIN_OP_PLUS_uxn_opcodes_h_l169_c22_2a14_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l171_c11_1bbb
BIN_OP_EQ_uxn_opcodes_h_l171_c11_1bbb : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l171_c11_1bbb_left,
BIN_OP_EQ_uxn_opcodes_h_l171_c11_1bbb_right,
BIN_OP_EQ_uxn_opcodes_h_l171_c11_1bbb_return_output);

-- tmp16_MUX_uxn_opcodes_h_l171_c7_7885
tmp16_MUX_uxn_opcodes_h_l171_c7_7885 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l171_c7_7885_cond,
tmp16_MUX_uxn_opcodes_h_l171_c7_7885_iftrue,
tmp16_MUX_uxn_opcodes_h_l171_c7_7885_iffalse,
tmp16_MUX_uxn_opcodes_h_l171_c7_7885_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_7885
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_7885 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_7885_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_7885_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_7885_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_7885_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l171_c7_7885
result_u16_value_MUX_uxn_opcodes_h_l171_c7_7885 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l171_c7_7885_cond,
result_u16_value_MUX_uxn_opcodes_h_l171_c7_7885_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l171_c7_7885_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l171_c7_7885_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_7885
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_7885 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_7885_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_7885_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_7885_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_7885_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l172_c22_1c9f
BIN_OP_PLUS_uxn_opcodes_h_l172_c22_1c9f : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l172_c22_1c9f_left,
BIN_OP_PLUS_uxn_opcodes_h_l172_c22_1c9f_right,
BIN_OP_PLUS_uxn_opcodes_h_l172_c22_1c9f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l174_c11_8287
BIN_OP_EQ_uxn_opcodes_h_l174_c11_8287 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l174_c11_8287_left,
BIN_OP_EQ_uxn_opcodes_h_l174_c11_8287_right,
BIN_OP_EQ_uxn_opcodes_h_l174_c11_8287_return_output);

-- tmp16_MUX_uxn_opcodes_h_l174_c7_7207
tmp16_MUX_uxn_opcodes_h_l174_c7_7207 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l174_c7_7207_cond,
tmp16_MUX_uxn_opcodes_h_l174_c7_7207_iftrue,
tmp16_MUX_uxn_opcodes_h_l174_c7_7207_iffalse,
tmp16_MUX_uxn_opcodes_h_l174_c7_7207_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_7207
result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_7207 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_7207_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_7207_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_7207_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_7207_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l174_c7_7207
result_u16_value_MUX_uxn_opcodes_h_l174_c7_7207 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l174_c7_7207_cond,
result_u16_value_MUX_uxn_opcodes_h_l174_c7_7207_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l174_c7_7207_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l174_c7_7207_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_7207
result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_7207 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_7207_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_7207_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_7207_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_7207_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l175_c3_b4a3
BIN_OP_OR_uxn_opcodes_h_l175_c3_b4a3 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l175_c3_b4a3_left,
BIN_OP_OR_uxn_opcodes_h_l175_c3_b4a3_right,
BIN_OP_OR_uxn_opcodes_h_l175_c3_b4a3_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l177_c22_4c65
BIN_OP_PLUS_uxn_opcodes_h_l177_c22_4c65 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l177_c22_4c65_left,
BIN_OP_PLUS_uxn_opcodes_h_l177_c22_4c65_right,
BIN_OP_PLUS_uxn_opcodes_h_l177_c22_4c65_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l177_c22_c54d
BIN_OP_PLUS_uxn_opcodes_h_l177_c22_c54d : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l177_c22_c54d_left,
BIN_OP_PLUS_uxn_opcodes_h_l177_c22_c54d_right,
BIN_OP_PLUS_uxn_opcodes_h_l177_c22_c54d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l179_c11_71ac
BIN_OP_EQ_uxn_opcodes_h_l179_c11_71ac : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l179_c11_71ac_left,
BIN_OP_EQ_uxn_opcodes_h_l179_c11_71ac_right,
BIN_OP_EQ_uxn_opcodes_h_l179_c11_71ac_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_fc4f
result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_fc4f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_fc4f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_fc4f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_fc4f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_fc4f_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_fc4f
result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_fc4f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_fc4f_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_fc4f_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_fc4f_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_fc4f_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l144_c6_ae51_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l144_c1_1f52_return_output,
 tmp16_MUX_uxn_opcodes_h_l144_c2_af39_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l144_c2_af39_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_af39_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_af39_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_af39_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_af39_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_af39_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_af39_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l144_c2_af39_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l148_c11_79ae_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l151_c11_1a7e_return_output,
 tmp16_MUX_uxn_opcodes_h_l151_c7_192b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l151_c7_192b_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l151_c7_192b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_192b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_192b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_192b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_192b_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_192b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l157_c11_0512_return_output,
 tmp16_MUX_uxn_opcodes_h_l157_c7_305f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l157_c7_305f_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l157_c7_305f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_305f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_305f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_305f_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_305f_return_output,
 CONST_SR_8_uxn_opcodes_h_l159_c31_8046_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l162_c11_321f_return_output,
 tmp16_MUX_uxn_opcodes_h_l162_c7_e19d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_e19d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_e19d_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l162_c7_e19d_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_e19d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l166_c11_d461_return_output,
 tmp16_MUX_uxn_opcodes_h_l166_c7_113b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_113b_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l166_c7_113b_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_113b_return_output,
 CONST_SL_8_uxn_opcodes_h_l168_c3_efa7_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l169_c22_2a14_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l171_c11_1bbb_return_output,
 tmp16_MUX_uxn_opcodes_h_l171_c7_7885_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_7885_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l171_c7_7885_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_7885_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l172_c22_1c9f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l174_c11_8287_return_output,
 tmp16_MUX_uxn_opcodes_h_l174_c7_7207_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_7207_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l174_c7_7207_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_7207_return_output,
 BIN_OP_OR_uxn_opcodes_h_l175_c3_b4a3_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l177_c22_4c65_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l177_c22_c54d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l179_c11_71ac_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_fc4f_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_fc4f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_ae51_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_ae51_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_ae51_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l144_c1_1f52_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l144_c1_1f52_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l144_c1_1f52_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l144_c1_1f52_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_af39_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l148_c3_cc0a : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_af39_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l151_c7_192b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_af39_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_af39_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_af39_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_af39_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l151_c7_192b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_af39_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_af39_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_af39_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_af39_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_192b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_af39_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_af39_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_af39_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_af39_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_192b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_af39_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_af39_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_af39_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_af39_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_192b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_af39_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_af39_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_af39_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l147_c3_3960 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_af39_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l144_c2_af39_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_af39_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_af39_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_af39_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_af39_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_192b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_af39_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_af39_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_af39_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_af39_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_192b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_af39_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_af39_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_af39_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_af39_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l151_c7_192b_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_af39_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_af39_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l145_c3_8f76_uxn_opcodes_h_l145_c3_8f76_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_79ae_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_79ae_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_79ae_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l151_c11_1a7e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l151_c11_1a7e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l151_c11_1a7e_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l151_c7_192b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l151_c7_192b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l157_c7_305f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l151_c7_192b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l151_c7_192b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l151_c7_192b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l157_c7_305f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l151_c7_192b_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l151_c7_192b_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l151_c7_192b_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l157_c7_305f_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l151_c7_192b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_192b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_192b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_305f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_192b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_192b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_192b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_305f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_192b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_192b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_192b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l151_c7_192b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_192b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_192b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l154_c3_d76d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_192b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_305f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_192b_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_192b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_192b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_305f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_192b_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l155_c21_c2c2_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_0512_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_0512_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_0512_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l157_c7_305f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l157_c7_305f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_e19d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l157_c7_305f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l157_c7_305f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l157_c7_305f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l157_c7_305f_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l157_c7_305f_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l157_c7_305f_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l162_c7_e19d_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l157_c7_305f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_305f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_305f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_e19d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_305f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_305f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_305f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_e19d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_305f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_305f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l158_c3_d99a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_305f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_305f_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_305f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_305f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_e19d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_305f_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l159_c31_8046_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l159_c31_8046_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l159_c21_d635_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_321f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_321f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_321f_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_e19d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_e19d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_113b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_e19d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_e19d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_e19d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_e19d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_e19d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_e19d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_113b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_e19d_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l162_c7_e19d_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l162_c7_e19d_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_113b_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l162_c7_e19d_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_e19d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_e19d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_113b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_e19d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_d461_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_d461_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_d461_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_113b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_113b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_7885_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_113b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_113b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_113b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_7885_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_113b_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_113b_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l169_c3_cecf : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_113b_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_7885_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_113b_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_113b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_113b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_7885_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_113b_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_efa7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_efa7_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_2a14_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_2a14_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_2a14_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_1bbb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_1bbb_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_1bbb_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_7885_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_7885_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l174_c7_7207_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_7885_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_7885_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_7885_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_7207_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_7885_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_7885_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l172_c3_076a : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_7885_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l174_c7_7207_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_7885_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_7885_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_7885_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_7207_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_7885_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l172_c22_1c9f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l172_c22_1c9f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l172_c22_1c9f_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l174_c11_8287_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l174_c11_8287_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l174_c11_8287_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l174_c7_7207_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l174_c7_7207_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l174_c7_7207_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_7207_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_7207_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_fc4f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_7207_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l174_c7_7207_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l177_c3_a6fa : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l174_c7_7207_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l174_c7_7207_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_7207_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_7207_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_fc4f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_7207_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l175_c3_b4a3_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l175_c3_b4a3_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l175_c3_b4a3_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c22_4c65_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c22_4c65_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c22_4c65_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c22_c54d_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c22_c54d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c22_c54d_return_output : unsigned(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_71ac_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_71ac_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_71ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_fc4f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_fc4f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_fc4f_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_fc4f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_fc4f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_fc4f_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l157_l144_DUPLICATE_db76_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l157_l144_DUPLICATE_23b0_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l171_l166_l162_l157_l151_l179_l144_DUPLICATE_c8d0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l157_l144_l162_DUPLICATE_a938_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l144_l174_l151_DUPLICATE_12fb_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l171_l166_l162_l157_l151_l179_l174_DUPLICATE_63da_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l167_l175_DUPLICATE_c5a6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5fa8_uxn_opcodes_h_l184_l140_DUPLICATE_5032_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l174_c11_8287_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_321f_right := to_unsigned(3, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_fc4f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_0512_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l151_c11_1a7e_right := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_7207_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_ae51_right := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c22_c54d_right := to_unsigned(2, 2);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_2a14_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_af39_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l144_c1_1f52_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l158_c3_d99a := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_305f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l158_c3_d99a;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_fc4f_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_192b_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l154_c3_d76d := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_192b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l154_c3_d76d;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l172_c22_1c9f_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_79ae_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_d461_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_1bbb_right := to_unsigned(5, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_af39_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_192b_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l147_c3_3960 := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_af39_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l147_c3_3960;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_e19d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_71ac_right := to_unsigned(7, 3);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l144_c1_1f52_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_79ae_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_2a14_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l172_c22_1c9f_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c22_4c65_left := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l157_c7_305f_iftrue := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l162_c7_e19d_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_ae51_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l151_c11_1a7e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_0512_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_321f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_d461_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_1bbb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l174_c11_8287_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_71ac_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l175_c3_b4a3_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l159_c31_8046_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l151_c7_192b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l157_c7_305f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_e19d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_7885_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l174_c7_7207_iffalse := tmp16;
     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l167_l175_DUPLICATE_c5a6 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l167_l175_DUPLICATE_c5a6_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- CONST_SR_8[uxn_opcodes_h_l159_c31_8046] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l159_c31_8046_x <= VAR_CONST_SR_8_uxn_opcodes_h_l159_c31_8046_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l159_c31_8046_return_output := CONST_SR_8_uxn_opcodes_h_l159_c31_8046_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l169_c22_2a14] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l169_c22_2a14_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_2a14_left;
     BIN_OP_PLUS_uxn_opcodes_h_l169_c22_2a14_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_2a14_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_2a14_return_output := BIN_OP_PLUS_uxn_opcodes_h_l169_c22_2a14_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l171_l166_l162_l157_l151_l179_l174_DUPLICATE_63da LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l171_l166_l162_l157_l151_l179_l174_DUPLICATE_63da_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l171_c11_1bbb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l171_c11_1bbb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_1bbb_left;
     BIN_OP_EQ_uxn_opcodes_h_l171_c11_1bbb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_1bbb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_1bbb_return_output := BIN_OP_EQ_uxn_opcodes_h_l171_c11_1bbb_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l144_l174_l151_DUPLICATE_12fb LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l144_l174_l151_DUPLICATE_12fb_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l144_c6_ae51] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l144_c6_ae51_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_ae51_left;
     BIN_OP_EQ_uxn_opcodes_h_l144_c6_ae51_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_ae51_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_ae51_return_output := BIN_OP_EQ_uxn_opcodes_h_l144_c6_ae51_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l148_c11_79ae] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l148_c11_79ae_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_79ae_left;
     BIN_OP_PLUS_uxn_opcodes_h_l148_c11_79ae_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_79ae_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_79ae_return_output := BIN_OP_PLUS_uxn_opcodes_h_l148_c11_79ae_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l166_c11_d461] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l166_c11_d461_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_d461_left;
     BIN_OP_EQ_uxn_opcodes_h_l166_c11_d461_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_d461_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_d461_return_output := BIN_OP_EQ_uxn_opcodes_h_l166_c11_d461_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l157_c11_0512] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l157_c11_0512_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_0512_left;
     BIN_OP_EQ_uxn_opcodes_h_l157_c11_0512_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_0512_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_0512_return_output := BIN_OP_EQ_uxn_opcodes_h_l157_c11_0512_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l157_l144_l162_DUPLICATE_a938 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l157_l144_l162_DUPLICATE_a938_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l157_l144_DUPLICATE_23b0 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l157_l144_DUPLICATE_23b0_return_output := result.stack_address_sp_offset;

     -- result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d[uxn_opcodes_h_l151_c7_192b] LATENCY=0
     VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l151_c7_192b_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l174_c11_8287] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l174_c11_8287_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l174_c11_8287_left;
     BIN_OP_EQ_uxn_opcodes_h_l174_c11_8287_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l174_c11_8287_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l174_c11_8287_return_output := BIN_OP_EQ_uxn_opcodes_h_l174_c11_8287_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l155_c21_c2c2] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l155_c21_c2c2_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l144_c2_af39] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l144_c2_af39_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l171_l166_l162_l157_l151_l179_l144_DUPLICATE_c8d0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l171_l166_l162_l157_l151_l179_l144_DUPLICATE_c8d0_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l157_l144_DUPLICATE_db76 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l157_l144_DUPLICATE_db76_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l151_c11_1a7e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l151_c11_1a7e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l151_c11_1a7e_left;
     BIN_OP_EQ_uxn_opcodes_h_l151_c11_1a7e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l151_c11_1a7e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l151_c11_1a7e_return_output := BIN_OP_EQ_uxn_opcodes_h_l151_c11_1a7e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l179_c11_71ac] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l179_c11_71ac_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_71ac_left;
     BIN_OP_EQ_uxn_opcodes_h_l179_c11_71ac_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_71ac_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_71ac_return_output := BIN_OP_EQ_uxn_opcodes_h_l179_c11_71ac_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l162_c11_321f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l162_c11_321f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_321f_left;
     BIN_OP_EQ_uxn_opcodes_h_l162_c11_321f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_321f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_321f_return_output := BIN_OP_EQ_uxn_opcodes_h_l162_c11_321f_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l172_c22_1c9f] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l172_c22_1c9f_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l172_c22_1c9f_left;
     BIN_OP_PLUS_uxn_opcodes_h_l172_c22_1c9f_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l172_c22_1c9f_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l172_c22_1c9f_return_output := BIN_OP_PLUS_uxn_opcodes_h_l172_c22_1c9f_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l144_c1_1f52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_ae51_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_af39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_ae51_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_af39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_ae51_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_af39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_ae51_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_af39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_ae51_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_af39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_ae51_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_af39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_ae51_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_af39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_ae51_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_af39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_ae51_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_af39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_ae51_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_192b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l151_c11_1a7e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_192b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l151_c11_1a7e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_192b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l151_c11_1a7e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_192b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l151_c11_1a7e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_192b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l151_c11_1a7e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l151_c7_192b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l151_c11_1a7e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l151_c7_192b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l151_c11_1a7e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l151_c7_192b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l151_c11_1a7e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_305f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_0512_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_305f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_0512_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_305f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_0512_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_305f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_0512_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l157_c7_305f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_0512_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l157_c7_305f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_0512_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l157_c7_305f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_0512_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_e19d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_321f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_e19d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_321f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_e19d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_321f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l162_c7_e19d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_321f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_e19d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_321f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_113b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_d461_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_113b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_d461_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_113b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_d461_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_113b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_d461_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_7885_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_1bbb_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_7885_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_1bbb_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_7885_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_1bbb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_7885_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_1bbb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_7207_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l174_c11_8287_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_7207_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l174_c11_8287_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l174_c7_7207_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l174_c11_8287_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l174_c7_7207_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l174_c11_8287_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_fc4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_71ac_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_fc4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_71ac_return_output;
     VAR_tmp16_uxn_opcodes_h_l148_c3_cc0a := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_79ae_return_output, 16);
     VAR_result_u16_value_uxn_opcodes_h_l169_c3_cecf := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_2a14_return_output, 16);
     VAR_result_u16_value_uxn_opcodes_h_l172_c3_076a := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l172_c22_1c9f_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l175_c3_b4a3_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l167_l175_DUPLICATE_c5a6_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_efa7_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l167_l175_DUPLICATE_c5a6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l151_c7_192b_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l155_c21_c2c2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_af39_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l144_l174_l151_DUPLICATE_12fb_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l151_c7_192b_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l144_l174_l151_DUPLICATE_12fb_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l174_c7_7207_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l144_l174_l151_DUPLICATE_12fb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_192b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l171_l166_l162_l157_l151_l179_l174_DUPLICATE_63da_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_305f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l171_l166_l162_l157_l151_l179_l174_DUPLICATE_63da_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_e19d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l171_l166_l162_l157_l151_l179_l174_DUPLICATE_63da_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_113b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l171_l166_l162_l157_l151_l179_l174_DUPLICATE_63da_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_7885_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l171_l166_l162_l157_l151_l179_l174_DUPLICATE_63da_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_7207_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l171_l166_l162_l157_l151_l179_l174_DUPLICATE_63da_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_fc4f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l171_l166_l162_l157_l151_l179_l174_DUPLICATE_63da_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_af39_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l171_l166_l162_l157_l151_l179_l144_DUPLICATE_c8d0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_192b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l171_l166_l162_l157_l151_l179_l144_DUPLICATE_c8d0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_305f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l171_l166_l162_l157_l151_l179_l144_DUPLICATE_c8d0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_e19d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l171_l166_l162_l157_l151_l179_l144_DUPLICATE_c8d0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_113b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l171_l166_l162_l157_l151_l179_l144_DUPLICATE_c8d0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_7885_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l171_l166_l162_l157_l151_l179_l144_DUPLICATE_c8d0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_fc4f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l171_l166_l162_l157_l151_l179_l144_DUPLICATE_c8d0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_af39_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l157_l144_l162_DUPLICATE_a938_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_305f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l157_l144_l162_DUPLICATE_a938_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_e19d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l157_l144_l162_DUPLICATE_a938_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_af39_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l157_l144_DUPLICATE_23b0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_305f_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l157_l144_DUPLICATE_23b0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_af39_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l157_l144_DUPLICATE_db76_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l157_c7_305f_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l157_l144_DUPLICATE_db76_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_192b_iffalse := VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l151_c7_192b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_af39_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l144_c2_af39_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_113b_iftrue := VAR_result_u16_value_uxn_opcodes_h_l169_c3_cecf;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_7885_iftrue := VAR_result_u16_value_uxn_opcodes_h_l172_c3_076a;
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_af39_iftrue := VAR_tmp16_uxn_opcodes_h_l148_c3_cc0a;
     -- BIN_OP_OR[uxn_opcodes_h_l175_c3_b4a3] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l175_c3_b4a3_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l175_c3_b4a3_left;
     BIN_OP_OR_uxn_opcodes_h_l175_c3_b4a3_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l175_c3_b4a3_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l175_c3_b4a3_return_output := BIN_OP_OR_uxn_opcodes_h_l175_c3_b4a3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l151_c7_192b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_192b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_192b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_192b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_192b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_192b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_192b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_192b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_192b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l179_c7_fc4f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_fc4f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_fc4f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_fc4f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_fc4f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_fc4f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_fc4f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_fc4f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_fc4f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l144_c2_af39] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_af39_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_af39_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_af39_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_af39_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_af39_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_af39_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_af39_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_af39_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l162_c7_e19d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_e19d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_e19d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_e19d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_e19d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_e19d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_e19d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_e19d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_e19d_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l168_c3_efa7] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l168_c3_efa7_x <= VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_efa7_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_efa7_return_output := CONST_SL_8_uxn_opcodes_h_l168_c3_efa7_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l159_c21_d635] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l159_c21_d635_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l159_c31_8046_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l157_c7_305f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_305f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_305f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_305f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_305f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_305f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_305f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_305f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_305f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l144_c1_1f52] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l144_c1_1f52_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l144_c1_1f52_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l144_c1_1f52_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l144_c1_1f52_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l144_c1_1f52_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l144_c1_1f52_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l144_c1_1f52_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l144_c1_1f52_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l179_c7_fc4f] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_fc4f_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_fc4f_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_fc4f_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_fc4f_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_fc4f_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_fc4f_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_fc4f_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_fc4f_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c22_4c65_right := VAR_BIN_OP_OR_uxn_opcodes_h_l175_c3_b4a3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l174_c7_7207_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l175_c3_b4a3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l157_c7_305f_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l159_c21_d635_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_113b_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_efa7_return_output;
     VAR_printf_uxn_opcodes_h_l145_c3_8f76_uxn_opcodes_h_l145_c3_8f76_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l144_c1_1f52_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_7207_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_fc4f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_7207_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_fc4f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_af39_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l151_c7_192b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_305f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l162_c7_e19d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_192b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_305f_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l174_c7_7207] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_7207_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_7207_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_7207_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_7207_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_7207_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_7207_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_7207_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_7207_return_output;

     -- printf_uxn_opcodes_h_l145_c3_8f76[uxn_opcodes_h_l145_c3_8f76] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l145_c3_8f76_uxn_opcodes_h_l145_c3_8f76_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l145_c3_8f76_uxn_opcodes_h_l145_c3_8f76_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- tmp16_MUX[uxn_opcodes_h_l174_c7_7207] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l174_c7_7207_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l174_c7_7207_cond;
     tmp16_MUX_uxn_opcodes_h_l174_c7_7207_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l174_c7_7207_iftrue;
     tmp16_MUX_uxn_opcodes_h_l174_c7_7207_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l174_c7_7207_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l174_c7_7207_return_output := tmp16_MUX_uxn_opcodes_h_l174_c7_7207_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l174_c7_7207] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_7207_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_7207_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_7207_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_7207_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_7207_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_7207_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_7207_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_7207_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l157_c7_305f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_305f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_305f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_305f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_305f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_305f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_305f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_305f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_305f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l144_c2_af39] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_af39_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_af39_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_af39_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_af39_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_af39_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_af39_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_af39_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_af39_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l177_c22_4c65] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l177_c22_4c65_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c22_4c65_left;
     BIN_OP_PLUS_uxn_opcodes_h_l177_c22_4c65_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c22_4c65_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c22_4c65_return_output := BIN_OP_PLUS_uxn_opcodes_h_l177_c22_4c65_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l157_c7_305f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l157_c7_305f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l157_c7_305f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l157_c7_305f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l157_c7_305f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l157_c7_305f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l157_c7_305f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l157_c7_305f_return_output := result_u8_value_MUX_uxn_opcodes_h_l157_c7_305f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l151_c7_192b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_192b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_192b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_192b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_192b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_192b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_192b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_192b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_192b_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c22_c54d_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c22_4c65_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_7885_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_7207_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_7885_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_7207_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_192b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_305f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_af39_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l151_c7_192b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l151_c7_192b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l157_c7_305f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_7885_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l174_c7_7207_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l151_c7_192b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l151_c7_192b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l151_c7_192b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l151_c7_192b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l151_c7_192b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l151_c7_192b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l151_c7_192b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l151_c7_192b_return_output := result_u8_value_MUX_uxn_opcodes_h_l151_c7_192b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l171_c7_7885] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_7885_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_7885_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_7885_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_7885_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_7885_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_7885_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_7885_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_7885_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l144_c2_af39] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_af39_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_af39_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_af39_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_af39_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_af39_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_af39_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_af39_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_af39_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l171_c7_7885] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l171_c7_7885_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_7885_cond;
     tmp16_MUX_uxn_opcodes_h_l171_c7_7885_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_7885_iftrue;
     tmp16_MUX_uxn_opcodes_h_l171_c7_7885_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_7885_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_7885_return_output := tmp16_MUX_uxn_opcodes_h_l171_c7_7885_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l151_c7_192b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_192b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_192b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_192b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_192b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_192b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_192b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_192b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_192b_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l177_c22_c54d] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l177_c22_c54d_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c22_c54d_left;
     BIN_OP_PLUS_uxn_opcodes_h_l177_c22_c54d_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c22_c54d_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c22_c54d_return_output := BIN_OP_PLUS_uxn_opcodes_h_l177_c22_c54d_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l171_c7_7885] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_7885_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_7885_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_7885_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_7885_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_7885_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_7885_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_7885_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_7885_return_output;

     -- Submodule level 4
     VAR_result_u16_value_uxn_opcodes_h_l177_c3_a6fa := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l177_c22_c54d_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_113b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_7885_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_113b_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_7885_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_af39_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l151_c7_192b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_af39_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l151_c7_192b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_113b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_7885_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l174_c7_7207_iftrue := VAR_result_u16_value_uxn_opcodes_h_l177_c3_a6fa;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l166_c7_113b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_113b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_113b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_113b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_113b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_113b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_113b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_113b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_113b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l144_c2_af39] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_af39_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_af39_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_af39_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_af39_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_af39_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_af39_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_af39_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_af39_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l166_c7_113b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l166_c7_113b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_113b_cond;
     tmp16_MUX_uxn_opcodes_h_l166_c7_113b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_113b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l166_c7_113b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_113b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_113b_return_output := tmp16_MUX_uxn_opcodes_h_l166_c7_113b_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l174_c7_7207] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l174_c7_7207_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l174_c7_7207_cond;
     result_u16_value_MUX_uxn_opcodes_h_l174_c7_7207_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l174_c7_7207_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l174_c7_7207_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l174_c7_7207_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l174_c7_7207_return_output := result_u16_value_MUX_uxn_opcodes_h_l174_c7_7207_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l166_c7_113b] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_113b_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_113b_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_113b_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_113b_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_113b_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_113b_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_113b_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_113b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l144_c2_af39] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l144_c2_af39_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_af39_cond;
     result_u8_value_MUX_uxn_opcodes_h_l144_c2_af39_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_af39_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l144_c2_af39_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_af39_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_af39_return_output := result_u8_value_MUX_uxn_opcodes_h_l144_c2_af39_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_e19d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_113b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_e19d_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_113b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_7885_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l174_c7_7207_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_e19d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_113b_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l162_c7_e19d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l162_c7_e19d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_e19d_cond;
     tmp16_MUX_uxn_opcodes_h_l162_c7_e19d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_e19d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l162_c7_e19d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_e19d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_e19d_return_output := tmp16_MUX_uxn_opcodes_h_l162_c7_e19d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l162_c7_e19d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_e19d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_e19d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_e19d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_e19d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_e19d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_e19d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_e19d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_e19d_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l162_c7_e19d] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_e19d_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_e19d_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_e19d_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_e19d_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_e19d_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_e19d_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_e19d_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_e19d_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l171_c7_7885] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l171_c7_7885_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_7885_cond;
     result_u16_value_MUX_uxn_opcodes_h_l171_c7_7885_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_7885_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l171_c7_7885_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_7885_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_7885_return_output := result_u16_value_MUX_uxn_opcodes_h_l171_c7_7885_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_305f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_e19d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_305f_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_e19d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_113b_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_7885_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l157_c7_305f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_e19d_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l157_c7_305f] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_305f_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_305f_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_305f_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_305f_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_305f_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_305f_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_305f_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_305f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l157_c7_305f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_305f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_305f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_305f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_305f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_305f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_305f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_305f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_305f_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l166_c7_113b] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l166_c7_113b_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_113b_cond;
     result_u16_value_MUX_uxn_opcodes_h_l166_c7_113b_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_113b_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l166_c7_113b_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_113b_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_113b_return_output := result_u16_value_MUX_uxn_opcodes_h_l166_c7_113b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l157_c7_305f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l157_c7_305f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l157_c7_305f_cond;
     tmp16_MUX_uxn_opcodes_h_l157_c7_305f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l157_c7_305f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l157_c7_305f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l157_c7_305f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l157_c7_305f_return_output := tmp16_MUX_uxn_opcodes_h_l157_c7_305f_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_192b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_305f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_192b_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_305f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l162_c7_e19d_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_113b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l151_c7_192b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l157_c7_305f_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l151_c7_192b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l151_c7_192b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l151_c7_192b_cond;
     tmp16_MUX_uxn_opcodes_h_l151_c7_192b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l151_c7_192b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l151_c7_192b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l151_c7_192b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l151_c7_192b_return_output := tmp16_MUX_uxn_opcodes_h_l151_c7_192b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l151_c7_192b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_192b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_192b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_192b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_192b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_192b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_192b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_192b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_192b_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l162_c7_e19d] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l162_c7_e19d_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l162_c7_e19d_cond;
     result_u16_value_MUX_uxn_opcodes_h_l162_c7_e19d_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l162_c7_e19d_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l162_c7_e19d_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l162_c7_e19d_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l162_c7_e19d_return_output := result_u16_value_MUX_uxn_opcodes_h_l162_c7_e19d_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l151_c7_192b] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_192b_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_192b_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_192b_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_192b_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_192b_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_192b_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_192b_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_192b_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_af39_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l151_c7_192b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_af39_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l151_c7_192b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l157_c7_305f_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l162_c7_e19d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_af39_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l151_c7_192b_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l144_c2_af39] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_af39_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_af39_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_af39_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_af39_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_af39_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_af39_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_af39_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_af39_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l144_c2_af39] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l144_c2_af39_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_af39_cond;
     tmp16_MUX_uxn_opcodes_h_l144_c2_af39_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_af39_iftrue;
     tmp16_MUX_uxn_opcodes_h_l144_c2_af39_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_af39_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_af39_return_output := tmp16_MUX_uxn_opcodes_h_l144_c2_af39_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l157_c7_305f] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l157_c7_305f_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l157_c7_305f_cond;
     result_u16_value_MUX_uxn_opcodes_h_l157_c7_305f_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l157_c7_305f_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l157_c7_305f_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l157_c7_305f_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l157_c7_305f_return_output := result_u16_value_MUX_uxn_opcodes_h_l157_c7_305f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l144_c2_af39] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_af39_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_af39_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_af39_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_af39_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_af39_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_af39_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_af39_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_af39_return_output;

     -- Submodule level 9
     VAR_result_u16_value_MUX_uxn_opcodes_h_l151_c7_192b_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l157_c7_305f_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_af39_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l151_c7_192b] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l151_c7_192b_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l151_c7_192b_cond;
     result_u16_value_MUX_uxn_opcodes_h_l151_c7_192b_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l151_c7_192b_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l151_c7_192b_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l151_c7_192b_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l151_c7_192b_return_output := result_u16_value_MUX_uxn_opcodes_h_l151_c7_192b_return_output;

     -- Submodule level 10
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_af39_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l151_c7_192b_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l144_c2_af39] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l144_c2_af39_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_af39_cond;
     result_u16_value_MUX_uxn_opcodes_h_l144_c2_af39_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_af39_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l144_c2_af39_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_af39_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_af39_return_output := result_u16_value_MUX_uxn_opcodes_h_l144_c2_af39_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_5fa8_uxn_opcodes_h_l184_l140_DUPLICATE_5032 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5fa8_uxn_opcodes_h_l184_l140_DUPLICATE_5032_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_5fa8(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_af39_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_af39_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_af39_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_af39_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_af39_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_af39_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l144_c2_af39_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_af39_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5fa8_uxn_opcodes_h_l184_l140_DUPLICATE_5032_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5fa8_uxn_opcodes_h_l184_l140_DUPLICATE_5032_return_output;
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
