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
-- Submodules: 107
entity ora2_0CLK_a7b4806f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ora2_0CLK_a7b4806f;
architecture arch of ora2_0CLK_a7b4806f is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1076_c6_eec0]
signal BIN_OP_EQ_uxn_opcodes_h_l1076_c6_eec0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1076_c6_eec0_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1076_c6_eec0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1076_c1_af8d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1076_c1_af8d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1076_c1_af8d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1076_c1_af8d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1076_c1_af8d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1076_c2_fe42]
signal n16_MUX_uxn_opcodes_h_l1076_c2_fe42_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1076_c2_fe42_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1076_c2_fe42_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1076_c2_fe42_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1076_c2_fe42]
signal tmp16_MUX_uxn_opcodes_h_l1076_c2_fe42_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1076_c2_fe42_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1076_c2_fe42_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1076_c2_fe42_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1076_c2_fe42]
signal result_u8_value_MUX_uxn_opcodes_h_l1076_c2_fe42_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1076_c2_fe42_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1076_c2_fe42_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1076_c2_fe42_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1076_c2_fe42]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1076_c2_fe42_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1076_c2_fe42_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1076_c2_fe42_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1076_c2_fe42_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1076_c2_fe42]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1076_c2_fe42_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1076_c2_fe42_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1076_c2_fe42_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1076_c2_fe42_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1076_c2_fe42]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1076_c2_fe42_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1076_c2_fe42_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1076_c2_fe42_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1076_c2_fe42_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1076_c2_fe42]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1076_c2_fe42_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1076_c2_fe42_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1076_c2_fe42_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1076_c2_fe42_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1076_c2_fe42]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c2_fe42_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c2_fe42_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c2_fe42_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c2_fe42_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1076_c2_fe42]
signal t16_MUX_uxn_opcodes_h_l1076_c2_fe42_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1076_c2_fe42_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1076_c2_fe42_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1076_c2_fe42_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1077_c3_a629[uxn_opcodes_h_l1077_c3_a629]
signal printf_uxn_opcodes_h_l1077_c3_a629_uxn_opcodes_h_l1077_c3_a629_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1081_c11_fd67]
signal BIN_OP_EQ_uxn_opcodes_h_l1081_c11_fd67_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1081_c11_fd67_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1081_c11_fd67_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1081_c7_172b]
signal n16_MUX_uxn_opcodes_h_l1081_c7_172b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1081_c7_172b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1081_c7_172b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1081_c7_172b_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1081_c7_172b]
signal tmp16_MUX_uxn_opcodes_h_l1081_c7_172b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1081_c7_172b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1081_c7_172b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1081_c7_172b_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1081_c7_172b]
signal result_u8_value_MUX_uxn_opcodes_h_l1081_c7_172b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1081_c7_172b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1081_c7_172b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1081_c7_172b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1081_c7_172b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_172b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_172b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_172b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_172b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1081_c7_172b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c7_172b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c7_172b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c7_172b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c7_172b_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1081_c7_172b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_172b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_172b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_172b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_172b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1081_c7_172b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c7_172b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c7_172b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c7_172b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c7_172b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1081_c7_172b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c7_172b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c7_172b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c7_172b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c7_172b_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1081_c7_172b]
signal t16_MUX_uxn_opcodes_h_l1081_c7_172b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1081_c7_172b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1081_c7_172b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1081_c7_172b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1084_c11_9224]
signal BIN_OP_EQ_uxn_opcodes_h_l1084_c11_9224_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1084_c11_9224_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1084_c11_9224_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1084_c7_745f]
signal n16_MUX_uxn_opcodes_h_l1084_c7_745f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1084_c7_745f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1084_c7_745f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1084_c7_745f_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1084_c7_745f]
signal tmp16_MUX_uxn_opcodes_h_l1084_c7_745f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1084_c7_745f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1084_c7_745f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1084_c7_745f_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1084_c7_745f]
signal result_u8_value_MUX_uxn_opcodes_h_l1084_c7_745f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1084_c7_745f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1084_c7_745f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1084_c7_745f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1084_c7_745f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_745f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_745f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_745f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_745f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1084_c7_745f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_745f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_745f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_745f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_745f_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1084_c7_745f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_745f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_745f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_745f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_745f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1084_c7_745f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_745f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_745f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_745f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_745f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1084_c7_745f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_745f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_745f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_745f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_745f_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1084_c7_745f]
signal t16_MUX_uxn_opcodes_h_l1084_c7_745f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1084_c7_745f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1084_c7_745f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1084_c7_745f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1089_c11_4daa]
signal BIN_OP_EQ_uxn_opcodes_h_l1089_c11_4daa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1089_c11_4daa_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1089_c11_4daa_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1089_c7_3efb]
signal n16_MUX_uxn_opcodes_h_l1089_c7_3efb_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1089_c7_3efb_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1089_c7_3efb_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1089_c7_3efb_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1089_c7_3efb]
signal tmp16_MUX_uxn_opcodes_h_l1089_c7_3efb_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1089_c7_3efb_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1089_c7_3efb_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1089_c7_3efb_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1089_c7_3efb]
signal result_u8_value_MUX_uxn_opcodes_h_l1089_c7_3efb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1089_c7_3efb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1089_c7_3efb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1089_c7_3efb_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1089_c7_3efb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_3efb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_3efb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_3efb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_3efb_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1089_c7_3efb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_3efb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_3efb_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_3efb_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_3efb_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1089_c7_3efb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_3efb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_3efb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_3efb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_3efb_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1089_c7_3efb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_3efb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_3efb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_3efb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_3efb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1089_c7_3efb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_3efb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_3efb_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_3efb_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_3efb_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1089_c7_3efb]
signal t16_MUX_uxn_opcodes_h_l1089_c7_3efb_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1089_c7_3efb_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1089_c7_3efb_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1089_c7_3efb_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1092_c11_1db5]
signal BIN_OP_EQ_uxn_opcodes_h_l1092_c11_1db5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1092_c11_1db5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1092_c11_1db5_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1092_c7_f344]
signal n16_MUX_uxn_opcodes_h_l1092_c7_f344_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1092_c7_f344_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1092_c7_f344_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1092_c7_f344_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1092_c7_f344]
signal tmp16_MUX_uxn_opcodes_h_l1092_c7_f344_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1092_c7_f344_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1092_c7_f344_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1092_c7_f344_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1092_c7_f344]
signal result_u8_value_MUX_uxn_opcodes_h_l1092_c7_f344_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1092_c7_f344_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1092_c7_f344_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1092_c7_f344_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1092_c7_f344]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1092_c7_f344_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1092_c7_f344_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1092_c7_f344_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1092_c7_f344_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1092_c7_f344]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c7_f344_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c7_f344_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c7_f344_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c7_f344_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1092_c7_f344]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1092_c7_f344_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1092_c7_f344_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1092_c7_f344_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1092_c7_f344_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1092_c7_f344]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c7_f344_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c7_f344_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c7_f344_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c7_f344_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1092_c7_f344]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c7_f344_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c7_f344_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c7_f344_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c7_f344_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1092_c7_f344]
signal t16_MUX_uxn_opcodes_h_l1092_c7_f344_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1092_c7_f344_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1092_c7_f344_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1092_c7_f344_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1093_c3_2484]
signal BIN_OP_OR_uxn_opcodes_h_l1093_c3_2484_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1093_c3_2484_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1093_c3_2484_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1096_c11_edad]
signal BIN_OP_EQ_uxn_opcodes_h_l1096_c11_edad_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1096_c11_edad_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1096_c11_edad_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1096_c7_136e]
signal n16_MUX_uxn_opcodes_h_l1096_c7_136e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1096_c7_136e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1096_c7_136e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1096_c7_136e_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1096_c7_136e]
signal tmp16_MUX_uxn_opcodes_h_l1096_c7_136e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1096_c7_136e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1096_c7_136e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1096_c7_136e_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1096_c7_136e]
signal result_u8_value_MUX_uxn_opcodes_h_l1096_c7_136e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1096_c7_136e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1096_c7_136e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1096_c7_136e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1096_c7_136e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_136e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_136e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_136e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_136e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1096_c7_136e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_136e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_136e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_136e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_136e_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1096_c7_136e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_136e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_136e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_136e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_136e_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1096_c7_136e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_136e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_136e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_136e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_136e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1096_c7_136e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_136e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_136e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_136e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_136e_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1099_c11_b2cc]
signal BIN_OP_EQ_uxn_opcodes_h_l1099_c11_b2cc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1099_c11_b2cc_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1099_c11_b2cc_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1099_c7_077f]
signal n16_MUX_uxn_opcodes_h_l1099_c7_077f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1099_c7_077f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1099_c7_077f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1099_c7_077f_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1099_c7_077f]
signal tmp16_MUX_uxn_opcodes_h_l1099_c7_077f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1099_c7_077f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1099_c7_077f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1099_c7_077f_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1099_c7_077f]
signal result_u8_value_MUX_uxn_opcodes_h_l1099_c7_077f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1099_c7_077f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1099_c7_077f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1099_c7_077f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1099_c7_077f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1099_c7_077f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1099_c7_077f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1099_c7_077f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1099_c7_077f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1099_c7_077f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1099_c7_077f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1099_c7_077f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1099_c7_077f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1099_c7_077f_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1099_c7_077f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1099_c7_077f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1099_c7_077f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1099_c7_077f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1099_c7_077f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1099_c7_077f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1099_c7_077f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1099_c7_077f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1099_c7_077f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1099_c7_077f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1099_c7_077f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1099_c7_077f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1099_c7_077f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1099_c7_077f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1099_c7_077f_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1104_c11_acd4]
signal BIN_OP_EQ_uxn_opcodes_h_l1104_c11_acd4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1104_c11_acd4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1104_c11_acd4_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1104_c7_36b7]
signal n16_MUX_uxn_opcodes_h_l1104_c7_36b7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1104_c7_36b7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1104_c7_36b7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1104_c7_36b7_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1104_c7_36b7]
signal tmp16_MUX_uxn_opcodes_h_l1104_c7_36b7_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1104_c7_36b7_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1104_c7_36b7_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1104_c7_36b7_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1104_c7_36b7]
signal result_u8_value_MUX_uxn_opcodes_h_l1104_c7_36b7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1104_c7_36b7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1104_c7_36b7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1104_c7_36b7_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1104_c7_36b7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_36b7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_36b7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_36b7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_36b7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1104_c7_36b7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_36b7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_36b7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_36b7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_36b7_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1104_c7_36b7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_36b7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_36b7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_36b7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_36b7_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1104_c7_36b7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_36b7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_36b7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_36b7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_36b7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1104_c7_36b7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_36b7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_36b7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_36b7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_36b7_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1107_c11_f648]
signal BIN_OP_EQ_uxn_opcodes_h_l1107_c11_f648_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1107_c11_f648_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1107_c11_f648_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1107_c7_6582]
signal n16_MUX_uxn_opcodes_h_l1107_c7_6582_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1107_c7_6582_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1107_c7_6582_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1107_c7_6582_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1107_c7_6582]
signal tmp16_MUX_uxn_opcodes_h_l1107_c7_6582_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1107_c7_6582_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1107_c7_6582_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1107_c7_6582_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1107_c7_6582]
signal result_u8_value_MUX_uxn_opcodes_h_l1107_c7_6582_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1107_c7_6582_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1107_c7_6582_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1107_c7_6582_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1107_c7_6582]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1107_c7_6582_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1107_c7_6582_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1107_c7_6582_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1107_c7_6582_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1107_c7_6582]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c7_6582_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c7_6582_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c7_6582_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c7_6582_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1107_c7_6582]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1107_c7_6582_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1107_c7_6582_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1107_c7_6582_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1107_c7_6582_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1107_c7_6582]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c7_6582_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c7_6582_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c7_6582_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c7_6582_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1107_c7_6582]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c7_6582_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c7_6582_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c7_6582_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c7_6582_return_output : unsigned(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1108_c3_a5c6]
signal BIN_OP_OR_uxn_opcodes_h_l1108_c3_a5c6_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1108_c3_a5c6_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1108_c3_a5c6_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1109_c11_e6e4]
signal BIN_OP_OR_uxn_opcodes_h_l1109_c11_e6e4_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1109_c11_e6e4_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1109_c11_e6e4_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1111_c30_d622]
signal sp_relative_shift_uxn_opcodes_h_l1111_c30_d622_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1111_c30_d622_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1111_c30_d622_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1111_c30_d622_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1116_c11_6882]
signal BIN_OP_EQ_uxn_opcodes_h_l1116_c11_6882_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1116_c11_6882_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1116_c11_6882_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1116_c7_310d]
signal result_u8_value_MUX_uxn_opcodes_h_l1116_c7_310d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1116_c7_310d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1116_c7_310d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1116_c7_310d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1116_c7_310d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_310d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_310d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_310d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_310d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1116_c7_310d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_310d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_310d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_310d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_310d_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1116_c7_310d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_310d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_310d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_310d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_310d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1116_c7_310d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_310d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_310d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_310d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_310d_return_output : unsigned(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1119_c31_fd46]
signal CONST_SR_8_uxn_opcodes_h_l1119_c31_fd46_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1119_c31_fd46_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1121_c11_eab8]
signal BIN_OP_EQ_uxn_opcodes_h_l1121_c11_eab8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1121_c11_eab8_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1121_c11_eab8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1121_c7_1c79]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_1c79_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_1c79_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_1c79_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_1c79_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1121_c7_1c79]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_1c79_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_1c79_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_1c79_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_1c79_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1101_l1086_DUPLICATE_608e
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1101_l1086_DUPLICATE_608e_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1101_l1086_DUPLICATE_608e_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_25e8( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.is_opc_done := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1076_c6_eec0
BIN_OP_EQ_uxn_opcodes_h_l1076_c6_eec0 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1076_c6_eec0_left,
BIN_OP_EQ_uxn_opcodes_h_l1076_c6_eec0_right,
BIN_OP_EQ_uxn_opcodes_h_l1076_c6_eec0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1076_c1_af8d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1076_c1_af8d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1076_c1_af8d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1076_c1_af8d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1076_c1_af8d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1076_c1_af8d_return_output);

-- n16_MUX_uxn_opcodes_h_l1076_c2_fe42
n16_MUX_uxn_opcodes_h_l1076_c2_fe42 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1076_c2_fe42_cond,
n16_MUX_uxn_opcodes_h_l1076_c2_fe42_iftrue,
n16_MUX_uxn_opcodes_h_l1076_c2_fe42_iffalse,
n16_MUX_uxn_opcodes_h_l1076_c2_fe42_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1076_c2_fe42
tmp16_MUX_uxn_opcodes_h_l1076_c2_fe42 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1076_c2_fe42_cond,
tmp16_MUX_uxn_opcodes_h_l1076_c2_fe42_iftrue,
tmp16_MUX_uxn_opcodes_h_l1076_c2_fe42_iffalse,
tmp16_MUX_uxn_opcodes_h_l1076_c2_fe42_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1076_c2_fe42
result_u8_value_MUX_uxn_opcodes_h_l1076_c2_fe42 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1076_c2_fe42_cond,
result_u8_value_MUX_uxn_opcodes_h_l1076_c2_fe42_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1076_c2_fe42_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1076_c2_fe42_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1076_c2_fe42
result_is_opc_done_MUX_uxn_opcodes_h_l1076_c2_fe42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1076_c2_fe42_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1076_c2_fe42_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1076_c2_fe42_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1076_c2_fe42_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1076_c2_fe42
result_sp_relative_shift_MUX_uxn_opcodes_h_l1076_c2_fe42 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1076_c2_fe42_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1076_c2_fe42_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1076_c2_fe42_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1076_c2_fe42_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1076_c2_fe42
result_is_stack_write_MUX_uxn_opcodes_h_l1076_c2_fe42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1076_c2_fe42_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1076_c2_fe42_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1076_c2_fe42_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1076_c2_fe42_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1076_c2_fe42
result_is_sp_shift_MUX_uxn_opcodes_h_l1076_c2_fe42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1076_c2_fe42_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1076_c2_fe42_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1076_c2_fe42_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1076_c2_fe42_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c2_fe42
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c2_fe42 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c2_fe42_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c2_fe42_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c2_fe42_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c2_fe42_return_output);

-- t16_MUX_uxn_opcodes_h_l1076_c2_fe42
t16_MUX_uxn_opcodes_h_l1076_c2_fe42 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1076_c2_fe42_cond,
t16_MUX_uxn_opcodes_h_l1076_c2_fe42_iftrue,
t16_MUX_uxn_opcodes_h_l1076_c2_fe42_iffalse,
t16_MUX_uxn_opcodes_h_l1076_c2_fe42_return_output);

-- printf_uxn_opcodes_h_l1077_c3_a629_uxn_opcodes_h_l1077_c3_a629
printf_uxn_opcodes_h_l1077_c3_a629_uxn_opcodes_h_l1077_c3_a629 : entity work.printf_uxn_opcodes_h_l1077_c3_a629_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1077_c3_a629_uxn_opcodes_h_l1077_c3_a629_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1081_c11_fd67
BIN_OP_EQ_uxn_opcodes_h_l1081_c11_fd67 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1081_c11_fd67_left,
BIN_OP_EQ_uxn_opcodes_h_l1081_c11_fd67_right,
BIN_OP_EQ_uxn_opcodes_h_l1081_c11_fd67_return_output);

-- n16_MUX_uxn_opcodes_h_l1081_c7_172b
n16_MUX_uxn_opcodes_h_l1081_c7_172b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1081_c7_172b_cond,
n16_MUX_uxn_opcodes_h_l1081_c7_172b_iftrue,
n16_MUX_uxn_opcodes_h_l1081_c7_172b_iffalse,
n16_MUX_uxn_opcodes_h_l1081_c7_172b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1081_c7_172b
tmp16_MUX_uxn_opcodes_h_l1081_c7_172b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1081_c7_172b_cond,
tmp16_MUX_uxn_opcodes_h_l1081_c7_172b_iftrue,
tmp16_MUX_uxn_opcodes_h_l1081_c7_172b_iffalse,
tmp16_MUX_uxn_opcodes_h_l1081_c7_172b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1081_c7_172b
result_u8_value_MUX_uxn_opcodes_h_l1081_c7_172b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1081_c7_172b_cond,
result_u8_value_MUX_uxn_opcodes_h_l1081_c7_172b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1081_c7_172b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1081_c7_172b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_172b
result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_172b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_172b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_172b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_172b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_172b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c7_172b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c7_172b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c7_172b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c7_172b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c7_172b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c7_172b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_172b
result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_172b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_172b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_172b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_172b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_172b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c7_172b
result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c7_172b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c7_172b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c7_172b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c7_172b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c7_172b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c7_172b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c7_172b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c7_172b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c7_172b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c7_172b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c7_172b_return_output);

-- t16_MUX_uxn_opcodes_h_l1081_c7_172b
t16_MUX_uxn_opcodes_h_l1081_c7_172b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1081_c7_172b_cond,
t16_MUX_uxn_opcodes_h_l1081_c7_172b_iftrue,
t16_MUX_uxn_opcodes_h_l1081_c7_172b_iffalse,
t16_MUX_uxn_opcodes_h_l1081_c7_172b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1084_c11_9224
BIN_OP_EQ_uxn_opcodes_h_l1084_c11_9224 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1084_c11_9224_left,
BIN_OP_EQ_uxn_opcodes_h_l1084_c11_9224_right,
BIN_OP_EQ_uxn_opcodes_h_l1084_c11_9224_return_output);

-- n16_MUX_uxn_opcodes_h_l1084_c7_745f
n16_MUX_uxn_opcodes_h_l1084_c7_745f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1084_c7_745f_cond,
n16_MUX_uxn_opcodes_h_l1084_c7_745f_iftrue,
n16_MUX_uxn_opcodes_h_l1084_c7_745f_iffalse,
n16_MUX_uxn_opcodes_h_l1084_c7_745f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1084_c7_745f
tmp16_MUX_uxn_opcodes_h_l1084_c7_745f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1084_c7_745f_cond,
tmp16_MUX_uxn_opcodes_h_l1084_c7_745f_iftrue,
tmp16_MUX_uxn_opcodes_h_l1084_c7_745f_iffalse,
tmp16_MUX_uxn_opcodes_h_l1084_c7_745f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1084_c7_745f
result_u8_value_MUX_uxn_opcodes_h_l1084_c7_745f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1084_c7_745f_cond,
result_u8_value_MUX_uxn_opcodes_h_l1084_c7_745f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1084_c7_745f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1084_c7_745f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_745f
result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_745f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_745f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_745f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_745f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_745f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_745f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_745f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_745f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_745f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_745f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_745f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_745f
result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_745f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_745f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_745f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_745f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_745f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_745f
result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_745f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_745f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_745f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_745f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_745f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_745f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_745f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_745f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_745f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_745f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_745f_return_output);

-- t16_MUX_uxn_opcodes_h_l1084_c7_745f
t16_MUX_uxn_opcodes_h_l1084_c7_745f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1084_c7_745f_cond,
t16_MUX_uxn_opcodes_h_l1084_c7_745f_iftrue,
t16_MUX_uxn_opcodes_h_l1084_c7_745f_iffalse,
t16_MUX_uxn_opcodes_h_l1084_c7_745f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1089_c11_4daa
BIN_OP_EQ_uxn_opcodes_h_l1089_c11_4daa : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1089_c11_4daa_left,
BIN_OP_EQ_uxn_opcodes_h_l1089_c11_4daa_right,
BIN_OP_EQ_uxn_opcodes_h_l1089_c11_4daa_return_output);

-- n16_MUX_uxn_opcodes_h_l1089_c7_3efb
n16_MUX_uxn_opcodes_h_l1089_c7_3efb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1089_c7_3efb_cond,
n16_MUX_uxn_opcodes_h_l1089_c7_3efb_iftrue,
n16_MUX_uxn_opcodes_h_l1089_c7_3efb_iffalse,
n16_MUX_uxn_opcodes_h_l1089_c7_3efb_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1089_c7_3efb
tmp16_MUX_uxn_opcodes_h_l1089_c7_3efb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1089_c7_3efb_cond,
tmp16_MUX_uxn_opcodes_h_l1089_c7_3efb_iftrue,
tmp16_MUX_uxn_opcodes_h_l1089_c7_3efb_iffalse,
tmp16_MUX_uxn_opcodes_h_l1089_c7_3efb_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1089_c7_3efb
result_u8_value_MUX_uxn_opcodes_h_l1089_c7_3efb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1089_c7_3efb_cond,
result_u8_value_MUX_uxn_opcodes_h_l1089_c7_3efb_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1089_c7_3efb_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1089_c7_3efb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_3efb
result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_3efb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_3efb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_3efb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_3efb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_3efb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_3efb
result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_3efb : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_3efb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_3efb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_3efb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_3efb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_3efb
result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_3efb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_3efb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_3efb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_3efb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_3efb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_3efb
result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_3efb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_3efb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_3efb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_3efb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_3efb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_3efb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_3efb : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_3efb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_3efb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_3efb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_3efb_return_output);

-- t16_MUX_uxn_opcodes_h_l1089_c7_3efb
t16_MUX_uxn_opcodes_h_l1089_c7_3efb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1089_c7_3efb_cond,
t16_MUX_uxn_opcodes_h_l1089_c7_3efb_iftrue,
t16_MUX_uxn_opcodes_h_l1089_c7_3efb_iffalse,
t16_MUX_uxn_opcodes_h_l1089_c7_3efb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1092_c11_1db5
BIN_OP_EQ_uxn_opcodes_h_l1092_c11_1db5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1092_c11_1db5_left,
BIN_OP_EQ_uxn_opcodes_h_l1092_c11_1db5_right,
BIN_OP_EQ_uxn_opcodes_h_l1092_c11_1db5_return_output);

-- n16_MUX_uxn_opcodes_h_l1092_c7_f344
n16_MUX_uxn_opcodes_h_l1092_c7_f344 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1092_c7_f344_cond,
n16_MUX_uxn_opcodes_h_l1092_c7_f344_iftrue,
n16_MUX_uxn_opcodes_h_l1092_c7_f344_iffalse,
n16_MUX_uxn_opcodes_h_l1092_c7_f344_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1092_c7_f344
tmp16_MUX_uxn_opcodes_h_l1092_c7_f344 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1092_c7_f344_cond,
tmp16_MUX_uxn_opcodes_h_l1092_c7_f344_iftrue,
tmp16_MUX_uxn_opcodes_h_l1092_c7_f344_iffalse,
tmp16_MUX_uxn_opcodes_h_l1092_c7_f344_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1092_c7_f344
result_u8_value_MUX_uxn_opcodes_h_l1092_c7_f344 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1092_c7_f344_cond,
result_u8_value_MUX_uxn_opcodes_h_l1092_c7_f344_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1092_c7_f344_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1092_c7_f344_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1092_c7_f344
result_is_opc_done_MUX_uxn_opcodes_h_l1092_c7_f344 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1092_c7_f344_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1092_c7_f344_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1092_c7_f344_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1092_c7_f344_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c7_f344
result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c7_f344 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c7_f344_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c7_f344_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c7_f344_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c7_f344_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1092_c7_f344
result_is_stack_write_MUX_uxn_opcodes_h_l1092_c7_f344 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1092_c7_f344_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1092_c7_f344_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1092_c7_f344_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1092_c7_f344_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c7_f344
result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c7_f344 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c7_f344_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c7_f344_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c7_f344_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c7_f344_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c7_f344
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c7_f344 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c7_f344_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c7_f344_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c7_f344_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c7_f344_return_output);

-- t16_MUX_uxn_opcodes_h_l1092_c7_f344
t16_MUX_uxn_opcodes_h_l1092_c7_f344 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1092_c7_f344_cond,
t16_MUX_uxn_opcodes_h_l1092_c7_f344_iftrue,
t16_MUX_uxn_opcodes_h_l1092_c7_f344_iffalse,
t16_MUX_uxn_opcodes_h_l1092_c7_f344_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1093_c3_2484
BIN_OP_OR_uxn_opcodes_h_l1093_c3_2484 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1093_c3_2484_left,
BIN_OP_OR_uxn_opcodes_h_l1093_c3_2484_right,
BIN_OP_OR_uxn_opcodes_h_l1093_c3_2484_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1096_c11_edad
BIN_OP_EQ_uxn_opcodes_h_l1096_c11_edad : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1096_c11_edad_left,
BIN_OP_EQ_uxn_opcodes_h_l1096_c11_edad_right,
BIN_OP_EQ_uxn_opcodes_h_l1096_c11_edad_return_output);

-- n16_MUX_uxn_opcodes_h_l1096_c7_136e
n16_MUX_uxn_opcodes_h_l1096_c7_136e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1096_c7_136e_cond,
n16_MUX_uxn_opcodes_h_l1096_c7_136e_iftrue,
n16_MUX_uxn_opcodes_h_l1096_c7_136e_iffalse,
n16_MUX_uxn_opcodes_h_l1096_c7_136e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1096_c7_136e
tmp16_MUX_uxn_opcodes_h_l1096_c7_136e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1096_c7_136e_cond,
tmp16_MUX_uxn_opcodes_h_l1096_c7_136e_iftrue,
tmp16_MUX_uxn_opcodes_h_l1096_c7_136e_iffalse,
tmp16_MUX_uxn_opcodes_h_l1096_c7_136e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1096_c7_136e
result_u8_value_MUX_uxn_opcodes_h_l1096_c7_136e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1096_c7_136e_cond,
result_u8_value_MUX_uxn_opcodes_h_l1096_c7_136e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1096_c7_136e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1096_c7_136e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_136e
result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_136e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_136e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_136e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_136e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_136e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_136e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_136e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_136e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_136e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_136e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_136e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_136e
result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_136e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_136e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_136e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_136e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_136e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_136e
result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_136e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_136e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_136e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_136e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_136e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_136e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_136e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_136e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_136e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_136e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_136e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1099_c11_b2cc
BIN_OP_EQ_uxn_opcodes_h_l1099_c11_b2cc : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1099_c11_b2cc_left,
BIN_OP_EQ_uxn_opcodes_h_l1099_c11_b2cc_right,
BIN_OP_EQ_uxn_opcodes_h_l1099_c11_b2cc_return_output);

-- n16_MUX_uxn_opcodes_h_l1099_c7_077f
n16_MUX_uxn_opcodes_h_l1099_c7_077f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1099_c7_077f_cond,
n16_MUX_uxn_opcodes_h_l1099_c7_077f_iftrue,
n16_MUX_uxn_opcodes_h_l1099_c7_077f_iffalse,
n16_MUX_uxn_opcodes_h_l1099_c7_077f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1099_c7_077f
tmp16_MUX_uxn_opcodes_h_l1099_c7_077f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1099_c7_077f_cond,
tmp16_MUX_uxn_opcodes_h_l1099_c7_077f_iftrue,
tmp16_MUX_uxn_opcodes_h_l1099_c7_077f_iffalse,
tmp16_MUX_uxn_opcodes_h_l1099_c7_077f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1099_c7_077f
result_u8_value_MUX_uxn_opcodes_h_l1099_c7_077f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1099_c7_077f_cond,
result_u8_value_MUX_uxn_opcodes_h_l1099_c7_077f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1099_c7_077f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1099_c7_077f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1099_c7_077f
result_is_opc_done_MUX_uxn_opcodes_h_l1099_c7_077f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1099_c7_077f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1099_c7_077f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1099_c7_077f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1099_c7_077f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1099_c7_077f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1099_c7_077f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1099_c7_077f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1099_c7_077f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1099_c7_077f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1099_c7_077f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1099_c7_077f
result_is_stack_write_MUX_uxn_opcodes_h_l1099_c7_077f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1099_c7_077f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1099_c7_077f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1099_c7_077f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1099_c7_077f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1099_c7_077f
result_is_sp_shift_MUX_uxn_opcodes_h_l1099_c7_077f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1099_c7_077f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1099_c7_077f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1099_c7_077f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1099_c7_077f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1099_c7_077f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1099_c7_077f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1099_c7_077f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1099_c7_077f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1099_c7_077f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1099_c7_077f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1104_c11_acd4
BIN_OP_EQ_uxn_opcodes_h_l1104_c11_acd4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1104_c11_acd4_left,
BIN_OP_EQ_uxn_opcodes_h_l1104_c11_acd4_right,
BIN_OP_EQ_uxn_opcodes_h_l1104_c11_acd4_return_output);

-- n16_MUX_uxn_opcodes_h_l1104_c7_36b7
n16_MUX_uxn_opcodes_h_l1104_c7_36b7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1104_c7_36b7_cond,
n16_MUX_uxn_opcodes_h_l1104_c7_36b7_iftrue,
n16_MUX_uxn_opcodes_h_l1104_c7_36b7_iffalse,
n16_MUX_uxn_opcodes_h_l1104_c7_36b7_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1104_c7_36b7
tmp16_MUX_uxn_opcodes_h_l1104_c7_36b7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1104_c7_36b7_cond,
tmp16_MUX_uxn_opcodes_h_l1104_c7_36b7_iftrue,
tmp16_MUX_uxn_opcodes_h_l1104_c7_36b7_iffalse,
tmp16_MUX_uxn_opcodes_h_l1104_c7_36b7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1104_c7_36b7
result_u8_value_MUX_uxn_opcodes_h_l1104_c7_36b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1104_c7_36b7_cond,
result_u8_value_MUX_uxn_opcodes_h_l1104_c7_36b7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1104_c7_36b7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1104_c7_36b7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_36b7
result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_36b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_36b7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_36b7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_36b7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_36b7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_36b7
result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_36b7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_36b7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_36b7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_36b7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_36b7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_36b7
result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_36b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_36b7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_36b7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_36b7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_36b7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_36b7
result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_36b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_36b7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_36b7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_36b7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_36b7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_36b7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_36b7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_36b7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_36b7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_36b7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_36b7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1107_c11_f648
BIN_OP_EQ_uxn_opcodes_h_l1107_c11_f648 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1107_c11_f648_left,
BIN_OP_EQ_uxn_opcodes_h_l1107_c11_f648_right,
BIN_OP_EQ_uxn_opcodes_h_l1107_c11_f648_return_output);

-- n16_MUX_uxn_opcodes_h_l1107_c7_6582
n16_MUX_uxn_opcodes_h_l1107_c7_6582 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1107_c7_6582_cond,
n16_MUX_uxn_opcodes_h_l1107_c7_6582_iftrue,
n16_MUX_uxn_opcodes_h_l1107_c7_6582_iffalse,
n16_MUX_uxn_opcodes_h_l1107_c7_6582_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1107_c7_6582
tmp16_MUX_uxn_opcodes_h_l1107_c7_6582 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1107_c7_6582_cond,
tmp16_MUX_uxn_opcodes_h_l1107_c7_6582_iftrue,
tmp16_MUX_uxn_opcodes_h_l1107_c7_6582_iffalse,
tmp16_MUX_uxn_opcodes_h_l1107_c7_6582_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1107_c7_6582
result_u8_value_MUX_uxn_opcodes_h_l1107_c7_6582 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1107_c7_6582_cond,
result_u8_value_MUX_uxn_opcodes_h_l1107_c7_6582_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1107_c7_6582_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1107_c7_6582_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1107_c7_6582
result_is_opc_done_MUX_uxn_opcodes_h_l1107_c7_6582 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1107_c7_6582_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1107_c7_6582_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1107_c7_6582_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1107_c7_6582_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c7_6582
result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c7_6582 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c7_6582_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c7_6582_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c7_6582_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c7_6582_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1107_c7_6582
result_is_stack_write_MUX_uxn_opcodes_h_l1107_c7_6582 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1107_c7_6582_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1107_c7_6582_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1107_c7_6582_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1107_c7_6582_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c7_6582
result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c7_6582 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c7_6582_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c7_6582_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c7_6582_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c7_6582_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c7_6582
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c7_6582 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c7_6582_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c7_6582_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c7_6582_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c7_6582_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1108_c3_a5c6
BIN_OP_OR_uxn_opcodes_h_l1108_c3_a5c6 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1108_c3_a5c6_left,
BIN_OP_OR_uxn_opcodes_h_l1108_c3_a5c6_right,
BIN_OP_OR_uxn_opcodes_h_l1108_c3_a5c6_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1109_c11_e6e4
BIN_OP_OR_uxn_opcodes_h_l1109_c11_e6e4 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1109_c11_e6e4_left,
BIN_OP_OR_uxn_opcodes_h_l1109_c11_e6e4_right,
BIN_OP_OR_uxn_opcodes_h_l1109_c11_e6e4_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1111_c30_d622
sp_relative_shift_uxn_opcodes_h_l1111_c30_d622 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1111_c30_d622_ins,
sp_relative_shift_uxn_opcodes_h_l1111_c30_d622_x,
sp_relative_shift_uxn_opcodes_h_l1111_c30_d622_y,
sp_relative_shift_uxn_opcodes_h_l1111_c30_d622_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1116_c11_6882
BIN_OP_EQ_uxn_opcodes_h_l1116_c11_6882 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1116_c11_6882_left,
BIN_OP_EQ_uxn_opcodes_h_l1116_c11_6882_right,
BIN_OP_EQ_uxn_opcodes_h_l1116_c11_6882_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1116_c7_310d
result_u8_value_MUX_uxn_opcodes_h_l1116_c7_310d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1116_c7_310d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1116_c7_310d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1116_c7_310d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1116_c7_310d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_310d
result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_310d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_310d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_310d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_310d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_310d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_310d
result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_310d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_310d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_310d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_310d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_310d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_310d
result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_310d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_310d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_310d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_310d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_310d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_310d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_310d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_310d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_310d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_310d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_310d_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1119_c31_fd46
CONST_SR_8_uxn_opcodes_h_l1119_c31_fd46 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1119_c31_fd46_x,
CONST_SR_8_uxn_opcodes_h_l1119_c31_fd46_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1121_c11_eab8
BIN_OP_EQ_uxn_opcodes_h_l1121_c11_eab8 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1121_c11_eab8_left,
BIN_OP_EQ_uxn_opcodes_h_l1121_c11_eab8_right,
BIN_OP_EQ_uxn_opcodes_h_l1121_c11_eab8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_1c79
result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_1c79 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_1c79_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_1c79_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_1c79_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_1c79_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_1c79
result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_1c79 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_1c79_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_1c79_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_1c79_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_1c79_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1101_l1086_DUPLICATE_608e
CONST_SL_8_uint16_t_uxn_opcodes_h_l1101_l1086_DUPLICATE_608e : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1101_l1086_DUPLICATE_608e_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1101_l1086_DUPLICATE_608e_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 n16,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1076_c6_eec0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1076_c1_af8d_return_output,
 n16_MUX_uxn_opcodes_h_l1076_c2_fe42_return_output,
 tmp16_MUX_uxn_opcodes_h_l1076_c2_fe42_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1076_c2_fe42_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1076_c2_fe42_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1076_c2_fe42_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1076_c2_fe42_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1076_c2_fe42_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c2_fe42_return_output,
 t16_MUX_uxn_opcodes_h_l1076_c2_fe42_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1081_c11_fd67_return_output,
 n16_MUX_uxn_opcodes_h_l1081_c7_172b_return_output,
 tmp16_MUX_uxn_opcodes_h_l1081_c7_172b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1081_c7_172b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_172b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c7_172b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_172b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c7_172b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c7_172b_return_output,
 t16_MUX_uxn_opcodes_h_l1081_c7_172b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1084_c11_9224_return_output,
 n16_MUX_uxn_opcodes_h_l1084_c7_745f_return_output,
 tmp16_MUX_uxn_opcodes_h_l1084_c7_745f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1084_c7_745f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_745f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_745f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_745f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_745f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_745f_return_output,
 t16_MUX_uxn_opcodes_h_l1084_c7_745f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1089_c11_4daa_return_output,
 n16_MUX_uxn_opcodes_h_l1089_c7_3efb_return_output,
 tmp16_MUX_uxn_opcodes_h_l1089_c7_3efb_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1089_c7_3efb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_3efb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_3efb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_3efb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_3efb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_3efb_return_output,
 t16_MUX_uxn_opcodes_h_l1089_c7_3efb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1092_c11_1db5_return_output,
 n16_MUX_uxn_opcodes_h_l1092_c7_f344_return_output,
 tmp16_MUX_uxn_opcodes_h_l1092_c7_f344_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1092_c7_f344_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1092_c7_f344_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c7_f344_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1092_c7_f344_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c7_f344_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c7_f344_return_output,
 t16_MUX_uxn_opcodes_h_l1092_c7_f344_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1093_c3_2484_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1096_c11_edad_return_output,
 n16_MUX_uxn_opcodes_h_l1096_c7_136e_return_output,
 tmp16_MUX_uxn_opcodes_h_l1096_c7_136e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1096_c7_136e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_136e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_136e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_136e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_136e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_136e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1099_c11_b2cc_return_output,
 n16_MUX_uxn_opcodes_h_l1099_c7_077f_return_output,
 tmp16_MUX_uxn_opcodes_h_l1099_c7_077f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1099_c7_077f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1099_c7_077f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1099_c7_077f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1099_c7_077f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1099_c7_077f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1099_c7_077f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1104_c11_acd4_return_output,
 n16_MUX_uxn_opcodes_h_l1104_c7_36b7_return_output,
 tmp16_MUX_uxn_opcodes_h_l1104_c7_36b7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1104_c7_36b7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_36b7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_36b7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_36b7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_36b7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_36b7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1107_c11_f648_return_output,
 n16_MUX_uxn_opcodes_h_l1107_c7_6582_return_output,
 tmp16_MUX_uxn_opcodes_h_l1107_c7_6582_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1107_c7_6582_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1107_c7_6582_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c7_6582_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1107_c7_6582_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c7_6582_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c7_6582_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1108_c3_a5c6_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1109_c11_e6e4_return_output,
 sp_relative_shift_uxn_opcodes_h_l1111_c30_d622_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1116_c11_6882_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1116_c7_310d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_310d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_310d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_310d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_310d_return_output,
 CONST_SR_8_uxn_opcodes_h_l1119_c31_fd46_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1121_c11_eab8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_1c79_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_1c79_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1101_l1086_DUPLICATE_608e_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1076_c6_eec0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1076_c6_eec0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1076_c6_eec0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1076_c1_af8d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1076_c1_af8d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1076_c1_af8d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1076_c1_af8d_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1076_c2_fe42_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1076_c2_fe42_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1081_c7_172b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1076_c2_fe42_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1076_c2_fe42_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1076_c2_fe42_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1076_c2_fe42_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1081_c7_172b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1076_c2_fe42_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1076_c2_fe42_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1076_c2_fe42_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1076_c2_fe42_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1081_c7_172b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1076_c2_fe42_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1076_c2_fe42_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1076_c2_fe42_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1076_c2_fe42_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_172b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1076_c2_fe42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1076_c2_fe42_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1076_c2_fe42_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1076_c2_fe42_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c7_172b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1076_c2_fe42_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1076_c2_fe42_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1076_c2_fe42_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1076_c2_fe42_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_172b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1076_c2_fe42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1076_c2_fe42_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1076_c2_fe42_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1076_c2_fe42_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c7_172b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1076_c2_fe42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1076_c2_fe42_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c2_fe42_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1078_c3_e94b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c2_fe42_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c7_172b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c2_fe42_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c2_fe42_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1076_c2_fe42_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1076_c2_fe42_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1081_c7_172b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1076_c2_fe42_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1076_c2_fe42_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1077_c3_a629_uxn_opcodes_h_l1077_c3_a629_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c11_fd67_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c11_fd67_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c11_fd67_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1081_c7_172b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1081_c7_172b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1084_c7_745f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1081_c7_172b_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1081_c7_172b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1081_c7_172b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1084_c7_745f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1081_c7_172b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1081_c7_172b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1081_c7_172b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1084_c7_745f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1081_c7_172b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_172b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_172b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_745f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_172b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c7_172b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c7_172b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_745f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c7_172b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_172b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_172b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_745f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_172b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c7_172b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c7_172b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_745f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c7_172b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c7_172b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1082_c3_1a40 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c7_172b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_745f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c7_172b_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1081_c7_172b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1081_c7_172b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1084_c7_745f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1081_c7_172b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_9224_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_9224_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_9224_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1084_c7_745f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1084_c7_745f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1089_c7_3efb_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1084_c7_745f_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1084_c7_745f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1084_c7_745f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1089_c7_3efb_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1084_c7_745f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1084_c7_745f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1084_c7_745f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1089_c7_3efb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1084_c7_745f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_745f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_745f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_3efb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_745f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_745f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_745f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_3efb_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_745f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_745f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_745f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_3efb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_745f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_745f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_745f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_3efb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_745f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_745f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1087_c3_8c2f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_745f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_3efb_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_745f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1084_c7_745f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1084_c7_745f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1089_c7_3efb_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1084_c7_745f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_4daa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_4daa_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_4daa_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1089_c7_3efb_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1089_c7_3efb_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1092_c7_f344_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1089_c7_3efb_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1089_c7_3efb_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1089_c7_3efb_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1092_c7_f344_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1089_c7_3efb_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1089_c7_3efb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1089_c7_3efb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1092_c7_f344_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1089_c7_3efb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_3efb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_3efb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1092_c7_f344_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_3efb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_3efb_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_3efb_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c7_f344_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_3efb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_3efb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_3efb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1092_c7_f344_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_3efb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_3efb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_3efb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c7_f344_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_3efb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_3efb_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1090_c3_f10a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_3efb_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c7_f344_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_3efb_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1089_c7_3efb_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1089_c7_3efb_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1092_c7_f344_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1089_c7_3efb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1092_c11_1db5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1092_c11_1db5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1092_c11_1db5_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1092_c7_f344_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1092_c7_f344_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1096_c7_136e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1092_c7_f344_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1092_c7_f344_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1092_c7_f344_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1096_c7_136e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1092_c7_f344_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1092_c7_f344_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1092_c7_f344_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1096_c7_136e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1092_c7_f344_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1092_c7_f344_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1092_c7_f344_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_136e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1092_c7_f344_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c7_f344_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c7_f344_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_136e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c7_f344_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1092_c7_f344_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1092_c7_f344_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_136e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1092_c7_f344_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c7_f344_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c7_f344_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_136e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c7_f344_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c7_f344_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1094_c3_4316 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c7_f344_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_136e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c7_f344_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1092_c7_f344_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1092_c7_f344_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1092_c7_f344_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1093_c3_2484_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1093_c3_2484_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1093_c3_2484_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1096_c11_edad_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1096_c11_edad_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1096_c11_edad_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1096_c7_136e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1096_c7_136e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1099_c7_077f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1096_c7_136e_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1096_c7_136e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1096_c7_136e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1099_c7_077f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1096_c7_136e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1096_c7_136e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1096_c7_136e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1099_c7_077f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1096_c7_136e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_136e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_136e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1099_c7_077f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_136e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_136e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_136e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1099_c7_077f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_136e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_136e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_136e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1099_c7_077f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_136e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_136e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_136e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1099_c7_077f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_136e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_136e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1097_c3_6a1e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_136e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1099_c7_077f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_136e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1099_c11_b2cc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1099_c11_b2cc_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1099_c11_b2cc_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1099_c7_077f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1099_c7_077f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1104_c7_36b7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1099_c7_077f_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1099_c7_077f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1099_c7_077f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1104_c7_36b7_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1099_c7_077f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1099_c7_077f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1099_c7_077f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1104_c7_36b7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1099_c7_077f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1099_c7_077f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1099_c7_077f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_36b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1099_c7_077f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1099_c7_077f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1099_c7_077f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_36b7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1099_c7_077f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1099_c7_077f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1099_c7_077f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_36b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1099_c7_077f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1099_c7_077f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1099_c7_077f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_36b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1099_c7_077f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1099_c7_077f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1102_c3_1cc6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1099_c7_077f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_36b7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1099_c7_077f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1104_c11_acd4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1104_c11_acd4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1104_c11_acd4_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1104_c7_36b7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1104_c7_36b7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1107_c7_6582_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1104_c7_36b7_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1104_c7_36b7_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1104_c7_36b7_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1107_c7_6582_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1104_c7_36b7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1104_c7_36b7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1104_c7_36b7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1107_c7_6582_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1104_c7_36b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_36b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_36b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1107_c7_6582_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_36b7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_36b7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_36b7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c7_6582_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_36b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_36b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_36b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1107_c7_6582_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_36b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_36b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_36b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c7_6582_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_36b7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_36b7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1105_c3_a847 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_36b7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c7_6582_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_36b7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1107_c11_f648_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1107_c11_f648_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1107_c11_f648_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1107_c7_6582_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1107_c7_6582_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1107_c7_6582_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1107_c7_6582_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1107_c7_6582_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1107_c7_6582_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1107_c7_6582_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1107_c7_6582_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1116_c7_310d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1107_c7_6582_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1107_c7_6582_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1107_c7_6582_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_310d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1107_c7_6582_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c7_6582_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c7_6582_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c7_6582_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1107_c7_6582_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1107_c7_6582_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_310d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1107_c7_6582_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c7_6582_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c7_6582_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_310d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c7_6582_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c7_6582_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1113_c3_9877 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c7_6582_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_310d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c7_6582_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1108_c3_a5c6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1108_c3_a5c6_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1108_c3_a5c6_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1109_c11_e6e4_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1109_c11_e6e4_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1109_c11_e6e4_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1111_c30_d622_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1111_c30_d622_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1111_c30_d622_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1111_c30_d622_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1114_c21_b8df_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1116_c11_6882_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1116_c11_6882_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1116_c11_6882_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1116_c7_310d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1116_c7_310d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1116_c7_310d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_310d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_310d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_1c79_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_310d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_310d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_310d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_1c79_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_310d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_310d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_310d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_310d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_310d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1118_c3_4138 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_310d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1116_c7_310d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_310d_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1119_c31_fd46_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1119_c31_fd46_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1119_c21_bf40_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1121_c11_eab8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1121_c11_eab8_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1121_c11_eab8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_1c79_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_1c79_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_1c79_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_1c79_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_1c79_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_1c79_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1084_l1081_l1104_l1076_l1099_l1096_l1092_l1089_l1116_DUPLICATE_9b7c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1084_l1107_l1081_l1104_l1076_l1099_l1096_l1092_l1089_DUPLICATE_0061_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1084_l1081_l1104_l1076_l1099_l1096_l1092_l1121_l1089_l1116_DUPLICATE_6354_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1084_l1081_l1104_l1076_l1099_l1096_l1092_l1089_l1116_DUPLICATE_7098_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1084_l1107_l1081_l1104_l1099_l1096_l1092_l1121_l1089_l1116_DUPLICATE_3290_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1093_l1100_l1085_l1108_DUPLICATE_7275_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1101_l1086_DUPLICATE_608e_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1101_l1086_DUPLICATE_608e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l1072_l1126_DUPLICATE_a199_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1076_c1_af8d_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_9224_right := to_unsigned(2, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l1111_c30_d622_y := resize(to_signed(-2, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1078_c3_e94b := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c2_fe42_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1078_c3_e94b;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1113_c3_9877 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c7_6582_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1113_c3_9877;
     VAR_sp_relative_shift_uxn_opcodes_h_l1111_c30_d622_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1076_c6_eec0_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1090_c3_f10a := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_3efb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1090_c3_f10a;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1107_c7_6582_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1097_c3_6a1e := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_136e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1097_c3_6a1e;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1105_c3_a847 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_36b7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1105_c3_a847;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1082_c3_1a40 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c7_172b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1082_c3_1a40;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1121_c11_eab8_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1092_c11_1db5_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1099_c11_b2cc_right := to_unsigned(6, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1076_c2_fe42_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1118_c3_4138 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_310d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1118_c3_4138;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_1c79_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_4daa_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1102_c3_1cc6 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1099_c7_077f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1102_c3_1cc6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1107_c11_f648_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c11_fd67_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1096_c11_edad_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1087_c3_8c2f := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_745f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1087_c3_8c2f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1116_c11_6882_right := to_unsigned(9, 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_1c79_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_310d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1104_c11_acd4_right := to_unsigned(7, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c7_6582_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1094_c3_4316 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c7_f344_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1094_c3_4316;

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

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1076_c1_af8d_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1111_c30_d622_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1108_c3_a5c6_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1076_c2_fe42_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1081_c7_172b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1084_c7_745f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1089_c7_3efb_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1092_c7_f344_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1096_c7_136e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1104_c7_36b7_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1107_c7_6582_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1076_c6_eec0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c11_fd67_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_9224_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_4daa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1092_c11_1db5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1096_c11_edad_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1099_c11_b2cc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1104_c11_acd4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1107_c11_f648_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1116_c11_6882_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1121_c11_eab8_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1093_c3_2484_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1109_c11_e6e4_right := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1076_c2_fe42_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1081_c7_172b_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1089_c7_3efb_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1092_c7_f344_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1119_c31_fd46_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1076_c2_fe42_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1081_c7_172b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1084_c7_745f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1089_c7_3efb_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1092_c7_f344_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1096_c7_136e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1099_c7_077f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1104_c7_36b7_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1107_c7_6582_iffalse := tmp16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1084_l1081_l1104_l1076_l1099_l1096_l1092_l1089_l1116_DUPLICATE_7098 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1084_l1081_l1104_l1076_l1099_l1096_l1092_l1089_l1116_DUPLICATE_7098_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1116_c11_6882] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1116_c11_6882_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1116_c11_6882_left;
     BIN_OP_EQ_uxn_opcodes_h_l1116_c11_6882_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1116_c11_6882_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1116_c11_6882_return_output := BIN_OP_EQ_uxn_opcodes_h_l1116_c11_6882_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1084_l1081_l1104_l1076_l1099_l1096_l1092_l1121_l1089_l1116_DUPLICATE_6354 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1084_l1081_l1104_l1076_l1099_l1096_l1092_l1121_l1089_l1116_DUPLICATE_6354_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1121_c11_eab8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1121_c11_eab8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1121_c11_eab8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1121_c11_eab8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1121_c11_eab8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1121_c11_eab8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1121_c11_eab8_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1084_l1107_l1081_l1104_l1099_l1096_l1092_l1121_l1089_l1116_DUPLICATE_3290 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1084_l1107_l1081_l1104_l1099_l1096_l1092_l1121_l1089_l1116_DUPLICATE_3290_return_output := result.is_opc_done;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1084_l1107_l1081_l1104_l1076_l1099_l1096_l1092_l1089_DUPLICATE_0061 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1084_l1107_l1081_l1104_l1076_l1099_l1096_l1092_l1089_DUPLICATE_0061_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1076_c6_eec0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1076_c6_eec0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1076_c6_eec0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1076_c6_eec0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1076_c6_eec0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1076_c6_eec0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1076_c6_eec0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1084_c11_9224] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1084_c11_9224_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_9224_left;
     BIN_OP_EQ_uxn_opcodes_h_l1084_c11_9224_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_9224_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_9224_return_output := BIN_OP_EQ_uxn_opcodes_h_l1084_c11_9224_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1116_c7_310d] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1116_c7_310d_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1084_l1081_l1104_l1076_l1099_l1096_l1092_l1089_l1116_DUPLICATE_9b7c LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1084_l1081_l1104_l1076_l1099_l1096_l1092_l1089_l1116_DUPLICATE_9b7c_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1089_c11_4daa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1089_c11_4daa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_4daa_left;
     BIN_OP_EQ_uxn_opcodes_h_l1089_c11_4daa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_4daa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_4daa_return_output := BIN_OP_EQ_uxn_opcodes_h_l1089_c11_4daa_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1092_c11_1db5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1092_c11_1db5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1092_c11_1db5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1092_c11_1db5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1092_c11_1db5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1092_c11_1db5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1092_c11_1db5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1107_c11_f648] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1107_c11_f648_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1107_c11_f648_left;
     BIN_OP_EQ_uxn_opcodes_h_l1107_c11_f648_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1107_c11_f648_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1107_c11_f648_return_output := BIN_OP_EQ_uxn_opcodes_h_l1107_c11_f648_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1081_c11_fd67] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1081_c11_fd67_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c11_fd67_left;
     BIN_OP_EQ_uxn_opcodes_h_l1081_c11_fd67_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c11_fd67_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c11_fd67_return_output := BIN_OP_EQ_uxn_opcodes_h_l1081_c11_fd67_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1099_c11_b2cc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1099_c11_b2cc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1099_c11_b2cc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1099_c11_b2cc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1099_c11_b2cc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1099_c11_b2cc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1099_c11_b2cc_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1111_c30_d622] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1111_c30_d622_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1111_c30_d622_ins;
     sp_relative_shift_uxn_opcodes_h_l1111_c30_d622_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1111_c30_d622_x;
     sp_relative_shift_uxn_opcodes_h_l1111_c30_d622_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1111_c30_d622_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1111_c30_d622_return_output := sp_relative_shift_uxn_opcodes_h_l1111_c30_d622_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1119_c31_fd46] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1119_c31_fd46_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1119_c31_fd46_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1119_c31_fd46_return_output := CONST_SR_8_uxn_opcodes_h_l1119_c31_fd46_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1104_c11_acd4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1104_c11_acd4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1104_c11_acd4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1104_c11_acd4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1104_c11_acd4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1104_c11_acd4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1104_c11_acd4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1096_c11_edad] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1096_c11_edad_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1096_c11_edad_left;
     BIN_OP_EQ_uxn_opcodes_h_l1096_c11_edad_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1096_c11_edad_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1096_c11_edad_return_output := BIN_OP_EQ_uxn_opcodes_h_l1096_c11_edad_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1093_l1100_l1085_l1108_DUPLICATE_7275 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1093_l1100_l1085_l1108_DUPLICATE_7275_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1076_c1_af8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1076_c6_eec0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1076_c2_fe42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1076_c6_eec0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1076_c2_fe42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1076_c6_eec0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1076_c2_fe42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1076_c6_eec0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1076_c2_fe42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1076_c6_eec0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1076_c2_fe42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1076_c6_eec0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c2_fe42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1076_c6_eec0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1076_c2_fe42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1076_c6_eec0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1076_c2_fe42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1076_c6_eec0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1076_c2_fe42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1076_c6_eec0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1081_c7_172b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c11_fd67_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_172b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c11_fd67_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c7_172b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c11_fd67_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_172b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c11_fd67_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c7_172b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c11_fd67_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c7_172b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c11_fd67_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1081_c7_172b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c11_fd67_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1081_c7_172b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c11_fd67_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1081_c7_172b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c11_fd67_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1084_c7_745f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_9224_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_745f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_9224_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_745f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_9224_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_745f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_9224_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_745f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_9224_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_745f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_9224_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1084_c7_745f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_9224_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1084_c7_745f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_9224_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1084_c7_745f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_9224_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1089_c7_3efb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_4daa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_3efb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_4daa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_3efb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_4daa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_3efb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_4daa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_3efb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_4daa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_3efb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_4daa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1089_c7_3efb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_4daa_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1089_c7_3efb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_4daa_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1089_c7_3efb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_4daa_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1092_c7_f344_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1092_c11_1db5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1092_c7_f344_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1092_c11_1db5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c7_f344_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1092_c11_1db5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1092_c7_f344_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1092_c11_1db5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c7_f344_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1092_c11_1db5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c7_f344_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1092_c11_1db5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1092_c7_f344_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1092_c11_1db5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1092_c7_f344_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1092_c11_1db5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1092_c7_f344_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1092_c11_1db5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1096_c7_136e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1096_c11_edad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_136e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1096_c11_edad_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_136e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1096_c11_edad_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_136e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1096_c11_edad_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_136e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1096_c11_edad_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_136e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1096_c11_edad_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1096_c7_136e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1096_c11_edad_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1096_c7_136e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1096_c11_edad_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1099_c7_077f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1099_c11_b2cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1099_c7_077f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1099_c11_b2cc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1099_c7_077f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1099_c11_b2cc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1099_c7_077f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1099_c11_b2cc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1099_c7_077f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1099_c11_b2cc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1099_c7_077f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1099_c11_b2cc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1099_c7_077f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1099_c11_b2cc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1099_c7_077f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1099_c11_b2cc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1104_c7_36b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1104_c11_acd4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_36b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1104_c11_acd4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_36b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1104_c11_acd4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_36b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1104_c11_acd4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_36b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1104_c11_acd4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_36b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1104_c11_acd4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1104_c7_36b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1104_c11_acd4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1104_c7_36b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1104_c11_acd4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1107_c7_6582_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1107_c11_f648_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1107_c7_6582_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1107_c11_f648_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c7_6582_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1107_c11_f648_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1107_c7_6582_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1107_c11_f648_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c7_6582_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1107_c11_f648_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c7_6582_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1107_c11_f648_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1107_c7_6582_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1107_c11_f648_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1107_c7_6582_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1107_c11_f648_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_310d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1116_c11_6882_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_310d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1116_c11_6882_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_310d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1116_c11_6882_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_310d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1116_c11_6882_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1116_c7_310d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1116_c11_6882_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_1c79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1121_c11_eab8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_1c79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1121_c11_eab8_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1093_c3_2484_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1093_l1100_l1085_l1108_DUPLICATE_7275_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1108_c3_a5c6_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1093_l1100_l1085_l1108_DUPLICATE_7275_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1101_l1086_DUPLICATE_608e_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1093_l1100_l1085_l1108_DUPLICATE_7275_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1076_c2_fe42_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1084_l1107_l1081_l1104_l1076_l1099_l1096_l1092_l1089_DUPLICATE_0061_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c7_172b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1084_l1107_l1081_l1104_l1076_l1099_l1096_l1092_l1089_DUPLICATE_0061_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_745f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1084_l1107_l1081_l1104_l1076_l1099_l1096_l1092_l1089_DUPLICATE_0061_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_3efb_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1084_l1107_l1081_l1104_l1076_l1099_l1096_l1092_l1089_DUPLICATE_0061_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c7_f344_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1084_l1107_l1081_l1104_l1076_l1099_l1096_l1092_l1089_DUPLICATE_0061_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_136e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1084_l1107_l1081_l1104_l1076_l1099_l1096_l1092_l1089_DUPLICATE_0061_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1099_c7_077f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1084_l1107_l1081_l1104_l1076_l1099_l1096_l1092_l1089_DUPLICATE_0061_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_36b7_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1084_l1107_l1081_l1104_l1076_l1099_l1096_l1092_l1089_DUPLICATE_0061_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c7_6582_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1084_l1107_l1081_l1104_l1076_l1099_l1096_l1092_l1089_DUPLICATE_0061_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_172b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1084_l1107_l1081_l1104_l1099_l1096_l1092_l1121_l1089_l1116_DUPLICATE_3290_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_745f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1084_l1107_l1081_l1104_l1099_l1096_l1092_l1121_l1089_l1116_DUPLICATE_3290_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_3efb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1084_l1107_l1081_l1104_l1099_l1096_l1092_l1121_l1089_l1116_DUPLICATE_3290_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1092_c7_f344_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1084_l1107_l1081_l1104_l1099_l1096_l1092_l1121_l1089_l1116_DUPLICATE_3290_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_136e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1084_l1107_l1081_l1104_l1099_l1096_l1092_l1121_l1089_l1116_DUPLICATE_3290_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1099_c7_077f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1084_l1107_l1081_l1104_l1099_l1096_l1092_l1121_l1089_l1116_DUPLICATE_3290_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_36b7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1084_l1107_l1081_l1104_l1099_l1096_l1092_l1121_l1089_l1116_DUPLICATE_3290_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1107_c7_6582_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1084_l1107_l1081_l1104_l1099_l1096_l1092_l1121_l1089_l1116_DUPLICATE_3290_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_310d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1084_l1107_l1081_l1104_l1099_l1096_l1092_l1121_l1089_l1116_DUPLICATE_3290_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_1c79_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1084_l1107_l1081_l1104_l1099_l1096_l1092_l1121_l1089_l1116_DUPLICATE_3290_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1076_c2_fe42_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1084_l1081_l1104_l1076_l1099_l1096_l1092_l1089_l1116_DUPLICATE_7098_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c7_172b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1084_l1081_l1104_l1076_l1099_l1096_l1092_l1089_l1116_DUPLICATE_7098_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_745f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1084_l1081_l1104_l1076_l1099_l1096_l1092_l1089_l1116_DUPLICATE_7098_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_3efb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1084_l1081_l1104_l1076_l1099_l1096_l1092_l1089_l1116_DUPLICATE_7098_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c7_f344_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1084_l1081_l1104_l1076_l1099_l1096_l1092_l1089_l1116_DUPLICATE_7098_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_136e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1084_l1081_l1104_l1076_l1099_l1096_l1092_l1089_l1116_DUPLICATE_7098_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1099_c7_077f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1084_l1081_l1104_l1076_l1099_l1096_l1092_l1089_l1116_DUPLICATE_7098_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_36b7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1084_l1081_l1104_l1076_l1099_l1096_l1092_l1089_l1116_DUPLICATE_7098_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_310d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1084_l1081_l1104_l1076_l1099_l1096_l1092_l1089_l1116_DUPLICATE_7098_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1076_c2_fe42_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1084_l1081_l1104_l1076_l1099_l1096_l1092_l1121_l1089_l1116_DUPLICATE_6354_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_172b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1084_l1081_l1104_l1076_l1099_l1096_l1092_l1121_l1089_l1116_DUPLICATE_6354_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_745f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1084_l1081_l1104_l1076_l1099_l1096_l1092_l1121_l1089_l1116_DUPLICATE_6354_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_3efb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1084_l1081_l1104_l1076_l1099_l1096_l1092_l1121_l1089_l1116_DUPLICATE_6354_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1092_c7_f344_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1084_l1081_l1104_l1076_l1099_l1096_l1092_l1121_l1089_l1116_DUPLICATE_6354_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_136e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1084_l1081_l1104_l1076_l1099_l1096_l1092_l1121_l1089_l1116_DUPLICATE_6354_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1099_c7_077f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1084_l1081_l1104_l1076_l1099_l1096_l1092_l1121_l1089_l1116_DUPLICATE_6354_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_36b7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1084_l1081_l1104_l1076_l1099_l1096_l1092_l1121_l1089_l1116_DUPLICATE_6354_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_310d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1084_l1081_l1104_l1076_l1099_l1096_l1092_l1121_l1089_l1116_DUPLICATE_6354_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_1c79_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1084_l1081_l1104_l1076_l1099_l1096_l1092_l1121_l1089_l1116_DUPLICATE_6354_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1076_c2_fe42_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1084_l1081_l1104_l1076_l1099_l1096_l1092_l1089_l1116_DUPLICATE_9b7c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1081_c7_172b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1084_l1081_l1104_l1076_l1099_l1096_l1092_l1089_l1116_DUPLICATE_9b7c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1084_c7_745f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1084_l1081_l1104_l1076_l1099_l1096_l1092_l1089_l1116_DUPLICATE_9b7c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1089_c7_3efb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1084_l1081_l1104_l1076_l1099_l1096_l1092_l1089_l1116_DUPLICATE_9b7c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1092_c7_f344_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1084_l1081_l1104_l1076_l1099_l1096_l1092_l1089_l1116_DUPLICATE_9b7c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1096_c7_136e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1084_l1081_l1104_l1076_l1099_l1096_l1092_l1089_l1116_DUPLICATE_9b7c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1099_c7_077f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1084_l1081_l1104_l1076_l1099_l1096_l1092_l1089_l1116_DUPLICATE_9b7c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1104_c7_36b7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1084_l1081_l1104_l1076_l1099_l1096_l1092_l1089_l1116_DUPLICATE_9b7c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1116_c7_310d_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1084_l1081_l1104_l1076_l1099_l1096_l1092_l1089_l1116_DUPLICATE_9b7c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_310d_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1116_c7_310d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c7_6582_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1111_c30_d622_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1107_c7_6582] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c7_6582_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c7_6582_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c7_6582_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c7_6582_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c7_6582_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c7_6582_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c7_6582_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c7_6582_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1116_c7_310d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_310d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_310d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_310d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_310d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_310d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_310d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_310d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_310d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1116_c7_310d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_310d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_310d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_310d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_310d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_310d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_310d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_310d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_310d_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1093_c3_2484] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1093_c3_2484_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1093_c3_2484_left;
     BIN_OP_OR_uxn_opcodes_h_l1093_c3_2484_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1093_c3_2484_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1093_c3_2484_return_output := BIN_OP_OR_uxn_opcodes_h_l1093_c3_2484_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1076_c1_af8d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1076_c1_af8d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1076_c1_af8d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1076_c1_af8d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1076_c1_af8d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1076_c1_af8d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1076_c1_af8d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1076_c1_af8d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1076_c1_af8d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1121_c7_1c79] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_1c79_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_1c79_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_1c79_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_1c79_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_1c79_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_1c79_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_1c79_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_1c79_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1101_l1086_DUPLICATE_608e LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1101_l1086_DUPLICATE_608e_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1101_l1086_DUPLICATE_608e_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1101_l1086_DUPLICATE_608e_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1101_l1086_DUPLICATE_608e_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1119_c21_bf40] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1119_c21_bf40_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1119_c31_fd46_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1121_c7_1c79] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_1c79_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_1c79_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_1c79_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_1c79_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_1c79_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_1c79_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_1c79_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_1c79_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1108_c3_a5c6] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1108_c3_a5c6_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1108_c3_a5c6_left;
     BIN_OP_OR_uxn_opcodes_h_l1108_c3_a5c6_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1108_c3_a5c6_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1108_c3_a5c6_return_output := BIN_OP_OR_uxn_opcodes_h_l1108_c3_a5c6_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1092_c7_f344_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1093_c3_2484_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1109_c11_e6e4_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1108_c3_a5c6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1107_c7_6582_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1108_c3_a5c6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1116_c7_310d_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1119_c21_bf40_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1099_c7_077f_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1101_l1086_DUPLICATE_608e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1084_c7_745f_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1101_l1086_DUPLICATE_608e_return_output;
     VAR_printf_uxn_opcodes_h_l1077_c3_a629_uxn_opcodes_h_l1077_c3_a629_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1076_c1_af8d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_310d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_1c79_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c7_6582_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_310d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_310d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_1c79_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_36b7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c7_6582_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c7_6582_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_310d_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1107_c7_6582] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c7_6582_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c7_6582_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c7_6582_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c7_6582_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c7_6582_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c7_6582_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c7_6582_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c7_6582_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1107_c7_6582] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c7_6582_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c7_6582_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c7_6582_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c7_6582_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c7_6582_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c7_6582_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c7_6582_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c7_6582_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1109_c11_e6e4] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1109_c11_e6e4_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1109_c11_e6e4_left;
     BIN_OP_OR_uxn_opcodes_h_l1109_c11_e6e4_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1109_c11_e6e4_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1109_c11_e6e4_return_output := BIN_OP_OR_uxn_opcodes_h_l1109_c11_e6e4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1116_c7_310d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_310d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_310d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_310d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_310d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_310d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_310d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_310d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_310d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1116_c7_310d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_310d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_310d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_310d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_310d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_310d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_310d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_310d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_310d_return_output;

     -- printf_uxn_opcodes_h_l1077_c3_a629[uxn_opcodes_h_l1077_c3_a629] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1077_c3_a629_uxn_opcodes_h_l1077_c3_a629_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1077_c3_a629_uxn_opcodes_h_l1077_c3_a629_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_u8_value_MUX[uxn_opcodes_h_l1116_c7_310d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1116_c7_310d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1116_c7_310d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1116_c7_310d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1116_c7_310d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1116_c7_310d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1116_c7_310d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1116_c7_310d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1116_c7_310d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1104_c7_36b7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_36b7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_36b7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_36b7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_36b7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_36b7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_36b7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_36b7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_36b7_return_output;

     -- t16_MUX[uxn_opcodes_h_l1092_c7_f344] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1092_c7_f344_cond <= VAR_t16_MUX_uxn_opcodes_h_l1092_c7_f344_cond;
     t16_MUX_uxn_opcodes_h_l1092_c7_f344_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1092_c7_f344_iftrue;
     t16_MUX_uxn_opcodes_h_l1092_c7_f344_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1092_c7_f344_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1092_c7_f344_return_output := t16_MUX_uxn_opcodes_h_l1092_c7_f344_return_output;

     -- n16_MUX[uxn_opcodes_h_l1107_c7_6582] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1107_c7_6582_cond <= VAR_n16_MUX_uxn_opcodes_h_l1107_c7_6582_cond;
     n16_MUX_uxn_opcodes_h_l1107_c7_6582_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1107_c7_6582_iftrue;
     n16_MUX_uxn_opcodes_h_l1107_c7_6582_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1107_c7_6582_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1107_c7_6582_return_output := n16_MUX_uxn_opcodes_h_l1107_c7_6582_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l1107_c7_6582_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1109_c11_e6e4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1104_c7_36b7_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1107_c7_6582_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1107_c7_6582_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_310d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_36b7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c7_6582_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1107_c7_6582_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_310d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1099_c7_077f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_36b7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_36b7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c7_6582_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1107_c7_6582_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1116_c7_310d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1089_c7_3efb_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1092_c7_f344_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1107_c7_6582] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1107_c7_6582_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1107_c7_6582_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1107_c7_6582_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1107_c7_6582_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1107_c7_6582_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1107_c7_6582_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1107_c7_6582_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1107_c7_6582_return_output;

     -- n16_MUX[uxn_opcodes_h_l1104_c7_36b7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1104_c7_36b7_cond <= VAR_n16_MUX_uxn_opcodes_h_l1104_c7_36b7_cond;
     n16_MUX_uxn_opcodes_h_l1104_c7_36b7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1104_c7_36b7_iftrue;
     n16_MUX_uxn_opcodes_h_l1104_c7_36b7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1104_c7_36b7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1104_c7_36b7_return_output := n16_MUX_uxn_opcodes_h_l1104_c7_36b7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1099_c7_077f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1099_c7_077f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1099_c7_077f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1099_c7_077f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1099_c7_077f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1099_c7_077f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1099_c7_077f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1099_c7_077f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1099_c7_077f_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1114_c21_b8df] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1114_c21_b8df_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l1109_c11_e6e4_return_output);

     -- tmp16_MUX[uxn_opcodes_h_l1107_c7_6582] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1107_c7_6582_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1107_c7_6582_cond;
     tmp16_MUX_uxn_opcodes_h_l1107_c7_6582_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1107_c7_6582_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1107_c7_6582_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1107_c7_6582_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1107_c7_6582_return_output := tmp16_MUX_uxn_opcodes_h_l1107_c7_6582_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1107_c7_6582] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1107_c7_6582_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1107_c7_6582_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1107_c7_6582_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1107_c7_6582_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1107_c7_6582_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1107_c7_6582_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1107_c7_6582_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1107_c7_6582_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1104_c7_36b7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_36b7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_36b7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_36b7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_36b7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_36b7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_36b7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_36b7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_36b7_return_output;

     -- t16_MUX[uxn_opcodes_h_l1089_c7_3efb] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1089_c7_3efb_cond <= VAR_t16_MUX_uxn_opcodes_h_l1089_c7_3efb_cond;
     t16_MUX_uxn_opcodes_h_l1089_c7_3efb_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1089_c7_3efb_iftrue;
     t16_MUX_uxn_opcodes_h_l1089_c7_3efb_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1089_c7_3efb_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1089_c7_3efb_return_output := t16_MUX_uxn_opcodes_h_l1089_c7_3efb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1104_c7_36b7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_36b7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_36b7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_36b7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_36b7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_36b7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_36b7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_36b7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_36b7_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1107_c7_6582_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1114_c21_b8df_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1099_c7_077f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1104_c7_36b7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_36b7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1107_c7_6582_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1099_c7_077f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_36b7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_36b7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1107_c7_6582_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_136e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1099_c7_077f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1099_c7_077f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_36b7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1084_c7_745f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1089_c7_3efb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1104_c7_36b7_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1107_c7_6582_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1104_c7_36b7] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1104_c7_36b7_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1104_c7_36b7_cond;
     tmp16_MUX_uxn_opcodes_h_l1104_c7_36b7_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1104_c7_36b7_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1104_c7_36b7_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1104_c7_36b7_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1104_c7_36b7_return_output := tmp16_MUX_uxn_opcodes_h_l1104_c7_36b7_return_output;

     -- t16_MUX[uxn_opcodes_h_l1084_c7_745f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1084_c7_745f_cond <= VAR_t16_MUX_uxn_opcodes_h_l1084_c7_745f_cond;
     t16_MUX_uxn_opcodes_h_l1084_c7_745f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1084_c7_745f_iftrue;
     t16_MUX_uxn_opcodes_h_l1084_c7_745f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1084_c7_745f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1084_c7_745f_return_output := t16_MUX_uxn_opcodes_h_l1084_c7_745f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1107_c7_6582] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1107_c7_6582_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1107_c7_6582_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1107_c7_6582_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1107_c7_6582_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1107_c7_6582_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1107_c7_6582_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1107_c7_6582_return_output := result_u8_value_MUX_uxn_opcodes_h_l1107_c7_6582_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1099_c7_077f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1099_c7_077f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1099_c7_077f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1099_c7_077f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1099_c7_077f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1099_c7_077f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1099_c7_077f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1099_c7_077f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1099_c7_077f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1104_c7_36b7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_36b7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_36b7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_36b7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_36b7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_36b7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_36b7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_36b7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_36b7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1096_c7_136e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_136e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_136e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_136e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_136e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_136e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_136e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_136e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_136e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1104_c7_36b7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_36b7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_36b7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_36b7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_36b7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_36b7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_36b7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_36b7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_36b7_return_output;

     -- n16_MUX[uxn_opcodes_h_l1099_c7_077f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1099_c7_077f_cond <= VAR_n16_MUX_uxn_opcodes_h_l1099_c7_077f_cond;
     n16_MUX_uxn_opcodes_h_l1099_c7_077f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1099_c7_077f_iftrue;
     n16_MUX_uxn_opcodes_h_l1099_c7_077f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1099_c7_077f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1099_c7_077f_return_output := n16_MUX_uxn_opcodes_h_l1099_c7_077f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1099_c7_077f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1099_c7_077f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1099_c7_077f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1099_c7_077f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1099_c7_077f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1099_c7_077f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1099_c7_077f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1099_c7_077f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1099_c7_077f_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1096_c7_136e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1099_c7_077f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1099_c7_077f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_36b7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_136e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1099_c7_077f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1099_c7_077f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_36b7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c7_f344_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_136e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_136e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1099_c7_077f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1104_c7_36b7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1107_c7_6582_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1081_c7_172b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1084_c7_745f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1099_c7_077f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1104_c7_36b7_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1096_c7_136e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_136e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_136e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_136e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_136e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_136e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_136e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_136e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_136e_return_output;

     -- n16_MUX[uxn_opcodes_h_l1096_c7_136e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1096_c7_136e_cond <= VAR_n16_MUX_uxn_opcodes_h_l1096_c7_136e_cond;
     n16_MUX_uxn_opcodes_h_l1096_c7_136e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1096_c7_136e_iftrue;
     n16_MUX_uxn_opcodes_h_l1096_c7_136e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1096_c7_136e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1096_c7_136e_return_output := n16_MUX_uxn_opcodes_h_l1096_c7_136e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1096_c7_136e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_136e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_136e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_136e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_136e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_136e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_136e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_136e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_136e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1104_c7_36b7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1104_c7_36b7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1104_c7_36b7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1104_c7_36b7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1104_c7_36b7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1104_c7_36b7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1104_c7_36b7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1104_c7_36b7_return_output := result_u8_value_MUX_uxn_opcodes_h_l1104_c7_36b7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1099_c7_077f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1099_c7_077f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1099_c7_077f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1099_c7_077f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1099_c7_077f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1099_c7_077f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1099_c7_077f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1099_c7_077f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1099_c7_077f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1099_c7_077f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1099_c7_077f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1099_c7_077f_cond;
     tmp16_MUX_uxn_opcodes_h_l1099_c7_077f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1099_c7_077f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1099_c7_077f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1099_c7_077f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1099_c7_077f_return_output := tmp16_MUX_uxn_opcodes_h_l1099_c7_077f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1099_c7_077f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1099_c7_077f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1099_c7_077f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1099_c7_077f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1099_c7_077f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1099_c7_077f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1099_c7_077f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1099_c7_077f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1099_c7_077f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1092_c7_f344] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c7_f344_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c7_f344_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c7_f344_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c7_f344_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c7_f344_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c7_f344_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c7_f344_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c7_f344_return_output;

     -- t16_MUX[uxn_opcodes_h_l1081_c7_172b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1081_c7_172b_cond <= VAR_t16_MUX_uxn_opcodes_h_l1081_c7_172b_cond;
     t16_MUX_uxn_opcodes_h_l1081_c7_172b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1081_c7_172b_iftrue;
     t16_MUX_uxn_opcodes_h_l1081_c7_172b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1081_c7_172b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1081_c7_172b_return_output := t16_MUX_uxn_opcodes_h_l1081_c7_172b_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1092_c7_f344_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1096_c7_136e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_136e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1099_c7_077f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c7_f344_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_136e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_136e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1099_c7_077f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_3efb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c7_f344_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c7_f344_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_136e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1099_c7_077f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1104_c7_36b7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1076_c2_fe42_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1081_c7_172b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1096_c7_136e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1099_c7_077f_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1096_c7_136e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1096_c7_136e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1096_c7_136e_cond;
     tmp16_MUX_uxn_opcodes_h_l1096_c7_136e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1096_c7_136e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1096_c7_136e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1096_c7_136e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1096_c7_136e_return_output := tmp16_MUX_uxn_opcodes_h_l1096_c7_136e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1092_c7_f344] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c7_f344_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c7_f344_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c7_f344_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c7_f344_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c7_f344_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c7_f344_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c7_f344_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c7_f344_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1096_c7_136e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_136e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_136e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_136e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_136e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_136e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_136e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_136e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_136e_return_output;

     -- t16_MUX[uxn_opcodes_h_l1076_c2_fe42] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1076_c2_fe42_cond <= VAR_t16_MUX_uxn_opcodes_h_l1076_c2_fe42_cond;
     t16_MUX_uxn_opcodes_h_l1076_c2_fe42_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1076_c2_fe42_iftrue;
     t16_MUX_uxn_opcodes_h_l1076_c2_fe42_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1076_c2_fe42_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1076_c2_fe42_return_output := t16_MUX_uxn_opcodes_h_l1076_c2_fe42_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1092_c7_f344] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c7_f344_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c7_f344_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c7_f344_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c7_f344_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c7_f344_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c7_f344_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c7_f344_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c7_f344_return_output;

     -- n16_MUX[uxn_opcodes_h_l1092_c7_f344] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1092_c7_f344_cond <= VAR_n16_MUX_uxn_opcodes_h_l1092_c7_f344_cond;
     n16_MUX_uxn_opcodes_h_l1092_c7_f344_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1092_c7_f344_iftrue;
     n16_MUX_uxn_opcodes_h_l1092_c7_f344_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1092_c7_f344_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1092_c7_f344_return_output := n16_MUX_uxn_opcodes_h_l1092_c7_f344_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1099_c7_077f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1099_c7_077f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1099_c7_077f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1099_c7_077f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1099_c7_077f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1099_c7_077f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1099_c7_077f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1099_c7_077f_return_output := result_u8_value_MUX_uxn_opcodes_h_l1099_c7_077f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1089_c7_3efb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_3efb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_3efb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_3efb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_3efb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_3efb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_3efb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_3efb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_3efb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1096_c7_136e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_136e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_136e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_136e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_136e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_136e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_136e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_136e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_136e_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1089_c7_3efb_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1092_c7_f344_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1092_c7_f344_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_136e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_3efb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c7_f344_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1092_c7_f344_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_136e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_745f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_3efb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_3efb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c7_f344_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1096_c7_136e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1099_c7_077f_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1076_c2_fe42_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1092_c7_f344_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1096_c7_136e_return_output;
     -- n16_MUX[uxn_opcodes_h_l1089_c7_3efb] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1089_c7_3efb_cond <= VAR_n16_MUX_uxn_opcodes_h_l1089_c7_3efb_cond;
     n16_MUX_uxn_opcodes_h_l1089_c7_3efb_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1089_c7_3efb_iftrue;
     n16_MUX_uxn_opcodes_h_l1089_c7_3efb_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1089_c7_3efb_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1089_c7_3efb_return_output := n16_MUX_uxn_opcodes_h_l1089_c7_3efb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1092_c7_f344] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1092_c7_f344_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1092_c7_f344_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1092_c7_f344_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1092_c7_f344_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1092_c7_f344_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1092_c7_f344_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1092_c7_f344_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1092_c7_f344_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1092_c7_f344] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1092_c7_f344_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1092_c7_f344_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1092_c7_f344_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1092_c7_f344_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1092_c7_f344_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1092_c7_f344_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1092_c7_f344_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1092_c7_f344_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1089_c7_3efb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_3efb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_3efb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_3efb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_3efb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_3efb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_3efb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_3efb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_3efb_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1089_c7_3efb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_3efb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_3efb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_3efb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_3efb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_3efb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_3efb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_3efb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_3efb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1084_c7_745f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_745f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_745f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_745f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_745f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_745f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_745f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_745f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_745f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1092_c7_f344] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1092_c7_f344_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1092_c7_f344_cond;
     tmp16_MUX_uxn_opcodes_h_l1092_c7_f344_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1092_c7_f344_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1092_c7_f344_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1092_c7_f344_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1092_c7_f344_return_output := tmp16_MUX_uxn_opcodes_h_l1092_c7_f344_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1096_c7_136e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1096_c7_136e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1096_c7_136e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1096_c7_136e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1096_c7_136e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1096_c7_136e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1096_c7_136e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1096_c7_136e_return_output := result_u8_value_MUX_uxn_opcodes_h_l1096_c7_136e_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1084_c7_745f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1089_c7_3efb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_3efb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1092_c7_f344_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_745f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_3efb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_3efb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1092_c7_f344_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c7_172b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_745f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_745f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_3efb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1092_c7_f344_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1096_c7_136e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1089_c7_3efb_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1092_c7_f344_return_output;
     -- n16_MUX[uxn_opcodes_h_l1084_c7_745f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1084_c7_745f_cond <= VAR_n16_MUX_uxn_opcodes_h_l1084_c7_745f_cond;
     n16_MUX_uxn_opcodes_h_l1084_c7_745f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1084_c7_745f_iftrue;
     n16_MUX_uxn_opcodes_h_l1084_c7_745f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1084_c7_745f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1084_c7_745f_return_output := n16_MUX_uxn_opcodes_h_l1084_c7_745f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1089_c7_3efb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_3efb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_3efb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_3efb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_3efb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_3efb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_3efb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_3efb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_3efb_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1089_c7_3efb] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1089_c7_3efb_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1089_c7_3efb_cond;
     tmp16_MUX_uxn_opcodes_h_l1089_c7_3efb_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1089_c7_3efb_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1089_c7_3efb_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1089_c7_3efb_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1089_c7_3efb_return_output := tmp16_MUX_uxn_opcodes_h_l1089_c7_3efb_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1084_c7_745f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_745f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_745f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_745f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_745f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_745f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_745f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_745f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_745f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1081_c7_172b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c7_172b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c7_172b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c7_172b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c7_172b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c7_172b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c7_172b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c7_172b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c7_172b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1089_c7_3efb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_3efb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_3efb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_3efb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_3efb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_3efb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_3efb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_3efb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_3efb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1084_c7_745f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_745f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_745f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_745f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_745f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_745f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_745f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_745f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_745f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1092_c7_f344] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1092_c7_f344_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1092_c7_f344_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1092_c7_f344_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1092_c7_f344_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1092_c7_f344_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1092_c7_f344_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1092_c7_f344_return_output := result_u8_value_MUX_uxn_opcodes_h_l1092_c7_f344_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1081_c7_172b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1084_c7_745f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_745f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_3efb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c7_172b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_745f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_745f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_3efb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1076_c2_fe42_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c7_172b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c7_172b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_745f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1089_c7_3efb_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1092_c7_f344_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1084_c7_745f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1089_c7_3efb_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1076_c2_fe42] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1076_c2_fe42_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1076_c2_fe42_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1076_c2_fe42_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1076_c2_fe42_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1076_c2_fe42_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1076_c2_fe42_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1076_c2_fe42_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1076_c2_fe42_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1089_c7_3efb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1089_c7_3efb_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1089_c7_3efb_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1089_c7_3efb_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1089_c7_3efb_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1089_c7_3efb_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1089_c7_3efb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1089_c7_3efb_return_output := result_u8_value_MUX_uxn_opcodes_h_l1089_c7_3efb_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1084_c7_745f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1084_c7_745f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1084_c7_745f_cond;
     tmp16_MUX_uxn_opcodes_h_l1084_c7_745f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1084_c7_745f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1084_c7_745f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1084_c7_745f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1084_c7_745f_return_output := tmp16_MUX_uxn_opcodes_h_l1084_c7_745f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1081_c7_172b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c7_172b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c7_172b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c7_172b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c7_172b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c7_172b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c7_172b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c7_172b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c7_172b_return_output;

     -- n16_MUX[uxn_opcodes_h_l1081_c7_172b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1081_c7_172b_cond <= VAR_n16_MUX_uxn_opcodes_h_l1081_c7_172b_cond;
     n16_MUX_uxn_opcodes_h_l1081_c7_172b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1081_c7_172b_iftrue;
     n16_MUX_uxn_opcodes_h_l1081_c7_172b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1081_c7_172b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1081_c7_172b_return_output := n16_MUX_uxn_opcodes_h_l1081_c7_172b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1084_c7_745f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_745f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_745f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_745f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_745f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_745f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_745f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_745f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_745f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1081_c7_172b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c7_172b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c7_172b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c7_172b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c7_172b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c7_172b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c7_172b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c7_172b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c7_172b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1084_c7_745f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_745f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_745f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_745f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_745f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_745f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_745f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_745f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_745f_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1076_c2_fe42_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1081_c7_172b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_172b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_745f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1076_c2_fe42_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c7_172b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_172b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_745f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c2_fe42_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c7_172b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1084_c7_745f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1089_c7_3efb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1081_c7_172b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1084_c7_745f_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1076_c2_fe42] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1076_c2_fe42_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1076_c2_fe42_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1076_c2_fe42_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1076_c2_fe42_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1076_c2_fe42_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1076_c2_fe42_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1076_c2_fe42_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1076_c2_fe42_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1081_c7_172b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_172b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_172b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_172b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_172b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_172b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_172b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_172b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_172b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1081_c7_172b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_172b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_172b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_172b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_172b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_172b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_172b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_172b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_172b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1084_c7_745f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1084_c7_745f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1084_c7_745f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1084_c7_745f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1084_c7_745f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1084_c7_745f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1084_c7_745f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1084_c7_745f_return_output := result_u8_value_MUX_uxn_opcodes_h_l1084_c7_745f_return_output;

     -- n16_MUX[uxn_opcodes_h_l1076_c2_fe42] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1076_c2_fe42_cond <= VAR_n16_MUX_uxn_opcodes_h_l1076_c2_fe42_cond;
     n16_MUX_uxn_opcodes_h_l1076_c2_fe42_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1076_c2_fe42_iftrue;
     n16_MUX_uxn_opcodes_h_l1076_c2_fe42_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1076_c2_fe42_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1076_c2_fe42_return_output := n16_MUX_uxn_opcodes_h_l1076_c2_fe42_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1081_c7_172b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1081_c7_172b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1081_c7_172b_cond;
     tmp16_MUX_uxn_opcodes_h_l1081_c7_172b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1081_c7_172b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1081_c7_172b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1081_c7_172b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1081_c7_172b_return_output := tmp16_MUX_uxn_opcodes_h_l1081_c7_172b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1076_c2_fe42] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c2_fe42_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c2_fe42_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c2_fe42_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c2_fe42_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c2_fe42_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c2_fe42_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c2_fe42_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c2_fe42_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1076_c2_fe42_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1076_c2_fe42_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_172b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1076_c2_fe42_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_172b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1081_c7_172b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1084_c7_745f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1076_c2_fe42_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1081_c7_172b_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1076_c2_fe42] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1076_c2_fe42_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1076_c2_fe42_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1076_c2_fe42_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1076_c2_fe42_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1076_c2_fe42_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1076_c2_fe42_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1076_c2_fe42_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1076_c2_fe42_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1076_c2_fe42] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1076_c2_fe42_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1076_c2_fe42_cond;
     tmp16_MUX_uxn_opcodes_h_l1076_c2_fe42_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1076_c2_fe42_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1076_c2_fe42_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1076_c2_fe42_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1076_c2_fe42_return_output := tmp16_MUX_uxn_opcodes_h_l1076_c2_fe42_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1081_c7_172b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1081_c7_172b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1081_c7_172b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1081_c7_172b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1081_c7_172b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1081_c7_172b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1081_c7_172b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1081_c7_172b_return_output := result_u8_value_MUX_uxn_opcodes_h_l1081_c7_172b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1076_c2_fe42] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1076_c2_fe42_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1076_c2_fe42_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1076_c2_fe42_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1076_c2_fe42_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1076_c2_fe42_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1076_c2_fe42_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1076_c2_fe42_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1076_c2_fe42_return_output;

     -- Submodule level 12
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1076_c2_fe42_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1081_c7_172b_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1076_c2_fe42_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1076_c2_fe42] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1076_c2_fe42_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1076_c2_fe42_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1076_c2_fe42_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1076_c2_fe42_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1076_c2_fe42_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1076_c2_fe42_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1076_c2_fe42_return_output := result_u8_value_MUX_uxn_opcodes_h_l1076_c2_fe42_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l1072_l1126_DUPLICATE_a199 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l1072_l1126_DUPLICATE_a199_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_25e8(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1076_c2_fe42_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1076_c2_fe42_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1076_c2_fe42_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1076_c2_fe42_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1076_c2_fe42_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c2_fe42_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l1072_l1126_DUPLICATE_a199_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l1072_l1126_DUPLICATE_a199_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
