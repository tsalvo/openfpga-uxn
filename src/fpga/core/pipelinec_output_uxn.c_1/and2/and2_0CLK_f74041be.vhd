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
-- Submodules: 79
entity and2_0CLK_f74041be is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end and2_0CLK_f74041be;
architecture arch of and2_0CLK_f74041be is
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
-- BIN_OP_EQ[uxn_opcodes_h_l909_c6_e223]
signal BIN_OP_EQ_uxn_opcodes_h_l909_c6_e223_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l909_c6_e223_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l909_c6_e223_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l909_c1_1ad1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_1ad1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_1ad1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_1ad1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_1ad1_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l909_c2_2e76]
signal tmp16_MUX_uxn_opcodes_h_l909_c2_2e76_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l909_c2_2e76_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l909_c2_2e76_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l909_c2_2e76_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l909_c2_2e76]
signal result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_2e76_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_2e76_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_2e76_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_2e76_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l909_c2_2e76]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_2e76_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_2e76_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_2e76_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_2e76_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l909_c2_2e76]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_2e76_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_2e76_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_2e76_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_2e76_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l909_c2_2e76]
signal result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_2e76_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_2e76_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_2e76_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_2e76_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l909_c2_2e76]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_2e76_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_2e76_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_2e76_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_2e76_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l909_c2_2e76]
signal result_u8_value_MUX_uxn_opcodes_h_l909_c2_2e76_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l909_c2_2e76_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l909_c2_2e76_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l909_c2_2e76_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l909_c2_2e76]
signal t16_MUX_uxn_opcodes_h_l909_c2_2e76_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l909_c2_2e76_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l909_c2_2e76_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l909_c2_2e76_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l909_c2_2e76]
signal n16_MUX_uxn_opcodes_h_l909_c2_2e76_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l909_c2_2e76_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l909_c2_2e76_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l909_c2_2e76_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l910_c3_4c08[uxn_opcodes_h_l910_c3_4c08]
signal printf_uxn_opcodes_h_l910_c3_4c08_uxn_opcodes_h_l910_c3_4c08_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l914_c11_c4fb]
signal BIN_OP_EQ_uxn_opcodes_h_l914_c11_c4fb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l914_c11_c4fb_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l914_c11_c4fb_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l914_c7_4c66]
signal tmp16_MUX_uxn_opcodes_h_l914_c7_4c66_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l914_c7_4c66_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l914_c7_4c66_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l914_c7_4c66_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l914_c7_4c66]
signal result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_4c66_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_4c66_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_4c66_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_4c66_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l914_c7_4c66]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_4c66_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_4c66_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_4c66_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_4c66_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l914_c7_4c66]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_4c66_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_4c66_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_4c66_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_4c66_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l914_c7_4c66]
signal result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_4c66_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_4c66_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_4c66_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_4c66_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l914_c7_4c66]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_4c66_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_4c66_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_4c66_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_4c66_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l914_c7_4c66]
signal result_u8_value_MUX_uxn_opcodes_h_l914_c7_4c66_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l914_c7_4c66_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l914_c7_4c66_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l914_c7_4c66_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l914_c7_4c66]
signal t16_MUX_uxn_opcodes_h_l914_c7_4c66_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l914_c7_4c66_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l914_c7_4c66_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l914_c7_4c66_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l914_c7_4c66]
signal n16_MUX_uxn_opcodes_h_l914_c7_4c66_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l914_c7_4c66_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l914_c7_4c66_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l914_c7_4c66_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l917_c11_bcd2]
signal BIN_OP_EQ_uxn_opcodes_h_l917_c11_bcd2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l917_c11_bcd2_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l917_c11_bcd2_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l917_c7_54e7]
signal tmp16_MUX_uxn_opcodes_h_l917_c7_54e7_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l917_c7_54e7_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l917_c7_54e7_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l917_c7_54e7_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l917_c7_54e7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_54e7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_54e7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_54e7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_54e7_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l917_c7_54e7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_54e7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_54e7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_54e7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_54e7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l917_c7_54e7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_54e7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_54e7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_54e7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_54e7_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l917_c7_54e7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_54e7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_54e7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_54e7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_54e7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l917_c7_54e7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_54e7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_54e7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_54e7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_54e7_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l917_c7_54e7]
signal result_u8_value_MUX_uxn_opcodes_h_l917_c7_54e7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l917_c7_54e7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l917_c7_54e7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l917_c7_54e7_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l917_c7_54e7]
signal t16_MUX_uxn_opcodes_h_l917_c7_54e7_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l917_c7_54e7_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l917_c7_54e7_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l917_c7_54e7_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l917_c7_54e7]
signal n16_MUX_uxn_opcodes_h_l917_c7_54e7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l917_c7_54e7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l917_c7_54e7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l917_c7_54e7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l922_c11_b255]
signal BIN_OP_EQ_uxn_opcodes_h_l922_c11_b255_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l922_c11_b255_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l922_c11_b255_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l922_c7_d328]
signal tmp16_MUX_uxn_opcodes_h_l922_c7_d328_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l922_c7_d328_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l922_c7_d328_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l922_c7_d328_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l922_c7_d328]
signal result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_d328_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_d328_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_d328_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_d328_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l922_c7_d328]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_d328_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_d328_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_d328_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_d328_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l922_c7_d328]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_d328_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_d328_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_d328_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_d328_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l922_c7_d328]
signal result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_d328_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_d328_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_d328_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_d328_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l922_c7_d328]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_d328_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_d328_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_d328_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_d328_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l922_c7_d328]
signal result_u8_value_MUX_uxn_opcodes_h_l922_c7_d328_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l922_c7_d328_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l922_c7_d328_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l922_c7_d328_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l922_c7_d328]
signal t16_MUX_uxn_opcodes_h_l922_c7_d328_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l922_c7_d328_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l922_c7_d328_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l922_c7_d328_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l922_c7_d328]
signal n16_MUX_uxn_opcodes_h_l922_c7_d328_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l922_c7_d328_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l922_c7_d328_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l922_c7_d328_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l923_c3_415e]
signal BIN_OP_OR_uxn_opcodes_h_l923_c3_415e_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l923_c3_415e_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l923_c3_415e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l926_c11_9ef8]
signal BIN_OP_EQ_uxn_opcodes_h_l926_c11_9ef8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l926_c11_9ef8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l926_c11_9ef8_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l926_c7_03f7]
signal tmp16_MUX_uxn_opcodes_h_l926_c7_03f7_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l926_c7_03f7_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l926_c7_03f7_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l926_c7_03f7_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l926_c7_03f7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_03f7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_03f7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_03f7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_03f7_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l926_c7_03f7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_03f7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_03f7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_03f7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_03f7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l926_c7_03f7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_03f7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_03f7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_03f7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_03f7_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l926_c7_03f7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_03f7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_03f7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_03f7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_03f7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l926_c7_03f7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_03f7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_03f7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_03f7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_03f7_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l926_c7_03f7]
signal result_u8_value_MUX_uxn_opcodes_h_l926_c7_03f7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l926_c7_03f7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l926_c7_03f7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l926_c7_03f7_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l926_c7_03f7]
signal n16_MUX_uxn_opcodes_h_l926_c7_03f7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l926_c7_03f7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l926_c7_03f7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l926_c7_03f7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l930_c11_fa08]
signal BIN_OP_EQ_uxn_opcodes_h_l930_c11_fa08_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l930_c11_fa08_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l930_c11_fa08_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l930_c7_647f]
signal tmp16_MUX_uxn_opcodes_h_l930_c7_647f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l930_c7_647f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l930_c7_647f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l930_c7_647f_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l930_c7_647f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_647f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_647f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_647f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_647f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l930_c7_647f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_647f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_647f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_647f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_647f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l930_c7_647f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_647f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_647f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_647f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_647f_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l930_c7_647f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_647f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_647f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_647f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_647f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l930_c7_647f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_647f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_647f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_647f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_647f_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l930_c7_647f]
signal result_u8_value_MUX_uxn_opcodes_h_l930_c7_647f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l930_c7_647f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l930_c7_647f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l930_c7_647f_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l930_c7_647f]
signal n16_MUX_uxn_opcodes_h_l930_c7_647f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l930_c7_647f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l930_c7_647f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l930_c7_647f_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l931_c3_760b]
signal BIN_OP_OR_uxn_opcodes_h_l931_c3_760b_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l931_c3_760b_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l931_c3_760b_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l932_c11_90e3]
signal BIN_OP_AND_uxn_opcodes_h_l932_c11_90e3_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l932_c11_90e3_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l932_c11_90e3_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l934_c30_fdba]
signal sp_relative_shift_uxn_opcodes_h_l934_c30_fdba_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l934_c30_fdba_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l934_c30_fdba_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l934_c30_fdba_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l939_c11_f736]
signal BIN_OP_EQ_uxn_opcodes_h_l939_c11_f736_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l939_c11_f736_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l939_c11_f736_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l939_c7_6543]
signal result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_6543_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_6543_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_6543_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_6543_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l939_c7_6543]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_6543_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_6543_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_6543_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_6543_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l939_c7_6543]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_6543_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_6543_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_6543_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_6543_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l939_c7_6543]
signal result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_6543_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_6543_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_6543_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_6543_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l939_c7_6543]
signal result_u8_value_MUX_uxn_opcodes_h_l939_c7_6543_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l939_c7_6543_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l939_c7_6543_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l939_c7_6543_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l942_c31_8873]
signal CONST_SR_8_uxn_opcodes_h_l942_c31_8873_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l942_c31_8873_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l944_c11_e807]
signal BIN_OP_EQ_uxn_opcodes_h_l944_c11_e807_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l944_c11_e807_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l944_c11_e807_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l944_c7_764f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_764f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_764f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_764f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_764f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l944_c7_764f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_764f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_764f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_764f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_764f_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l928_l919_DUPLICATE_1642
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l928_l919_DUPLICATE_1642_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l928_l919_DUPLICATE_1642_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_8c29( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_opc_done := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.u8_value := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l909_c6_e223
BIN_OP_EQ_uxn_opcodes_h_l909_c6_e223 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l909_c6_e223_left,
BIN_OP_EQ_uxn_opcodes_h_l909_c6_e223_right,
BIN_OP_EQ_uxn_opcodes_h_l909_c6_e223_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_1ad1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_1ad1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_1ad1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_1ad1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_1ad1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_1ad1_return_output);

-- tmp16_MUX_uxn_opcodes_h_l909_c2_2e76
tmp16_MUX_uxn_opcodes_h_l909_c2_2e76 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l909_c2_2e76_cond,
tmp16_MUX_uxn_opcodes_h_l909_c2_2e76_iftrue,
tmp16_MUX_uxn_opcodes_h_l909_c2_2e76_iffalse,
tmp16_MUX_uxn_opcodes_h_l909_c2_2e76_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_2e76
result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_2e76 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_2e76_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_2e76_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_2e76_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_2e76_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_2e76
result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_2e76 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_2e76_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_2e76_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_2e76_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_2e76_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_2e76
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_2e76 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_2e76_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_2e76_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_2e76_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_2e76_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_2e76
result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_2e76 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_2e76_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_2e76_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_2e76_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_2e76_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_2e76
result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_2e76 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_2e76_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_2e76_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_2e76_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_2e76_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l909_c2_2e76
result_u8_value_MUX_uxn_opcodes_h_l909_c2_2e76 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l909_c2_2e76_cond,
result_u8_value_MUX_uxn_opcodes_h_l909_c2_2e76_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l909_c2_2e76_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l909_c2_2e76_return_output);

-- t16_MUX_uxn_opcodes_h_l909_c2_2e76
t16_MUX_uxn_opcodes_h_l909_c2_2e76 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l909_c2_2e76_cond,
t16_MUX_uxn_opcodes_h_l909_c2_2e76_iftrue,
t16_MUX_uxn_opcodes_h_l909_c2_2e76_iffalse,
t16_MUX_uxn_opcodes_h_l909_c2_2e76_return_output);

-- n16_MUX_uxn_opcodes_h_l909_c2_2e76
n16_MUX_uxn_opcodes_h_l909_c2_2e76 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l909_c2_2e76_cond,
n16_MUX_uxn_opcodes_h_l909_c2_2e76_iftrue,
n16_MUX_uxn_opcodes_h_l909_c2_2e76_iffalse,
n16_MUX_uxn_opcodes_h_l909_c2_2e76_return_output);

-- printf_uxn_opcodes_h_l910_c3_4c08_uxn_opcodes_h_l910_c3_4c08
printf_uxn_opcodes_h_l910_c3_4c08_uxn_opcodes_h_l910_c3_4c08 : entity work.printf_uxn_opcodes_h_l910_c3_4c08_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l910_c3_4c08_uxn_opcodes_h_l910_c3_4c08_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l914_c11_c4fb
BIN_OP_EQ_uxn_opcodes_h_l914_c11_c4fb : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l914_c11_c4fb_left,
BIN_OP_EQ_uxn_opcodes_h_l914_c11_c4fb_right,
BIN_OP_EQ_uxn_opcodes_h_l914_c11_c4fb_return_output);

-- tmp16_MUX_uxn_opcodes_h_l914_c7_4c66
tmp16_MUX_uxn_opcodes_h_l914_c7_4c66 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l914_c7_4c66_cond,
tmp16_MUX_uxn_opcodes_h_l914_c7_4c66_iftrue,
tmp16_MUX_uxn_opcodes_h_l914_c7_4c66_iffalse,
tmp16_MUX_uxn_opcodes_h_l914_c7_4c66_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_4c66
result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_4c66 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_4c66_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_4c66_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_4c66_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_4c66_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_4c66
result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_4c66 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_4c66_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_4c66_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_4c66_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_4c66_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_4c66
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_4c66 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_4c66_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_4c66_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_4c66_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_4c66_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_4c66
result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_4c66 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_4c66_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_4c66_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_4c66_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_4c66_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_4c66
result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_4c66 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_4c66_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_4c66_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_4c66_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_4c66_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l914_c7_4c66
result_u8_value_MUX_uxn_opcodes_h_l914_c7_4c66 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l914_c7_4c66_cond,
result_u8_value_MUX_uxn_opcodes_h_l914_c7_4c66_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l914_c7_4c66_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l914_c7_4c66_return_output);

-- t16_MUX_uxn_opcodes_h_l914_c7_4c66
t16_MUX_uxn_opcodes_h_l914_c7_4c66 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l914_c7_4c66_cond,
t16_MUX_uxn_opcodes_h_l914_c7_4c66_iftrue,
t16_MUX_uxn_opcodes_h_l914_c7_4c66_iffalse,
t16_MUX_uxn_opcodes_h_l914_c7_4c66_return_output);

-- n16_MUX_uxn_opcodes_h_l914_c7_4c66
n16_MUX_uxn_opcodes_h_l914_c7_4c66 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l914_c7_4c66_cond,
n16_MUX_uxn_opcodes_h_l914_c7_4c66_iftrue,
n16_MUX_uxn_opcodes_h_l914_c7_4c66_iffalse,
n16_MUX_uxn_opcodes_h_l914_c7_4c66_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l917_c11_bcd2
BIN_OP_EQ_uxn_opcodes_h_l917_c11_bcd2 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l917_c11_bcd2_left,
BIN_OP_EQ_uxn_opcodes_h_l917_c11_bcd2_right,
BIN_OP_EQ_uxn_opcodes_h_l917_c11_bcd2_return_output);

-- tmp16_MUX_uxn_opcodes_h_l917_c7_54e7
tmp16_MUX_uxn_opcodes_h_l917_c7_54e7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l917_c7_54e7_cond,
tmp16_MUX_uxn_opcodes_h_l917_c7_54e7_iftrue,
tmp16_MUX_uxn_opcodes_h_l917_c7_54e7_iffalse,
tmp16_MUX_uxn_opcodes_h_l917_c7_54e7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_54e7
result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_54e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_54e7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_54e7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_54e7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_54e7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_54e7
result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_54e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_54e7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_54e7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_54e7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_54e7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_54e7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_54e7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_54e7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_54e7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_54e7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_54e7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_54e7
result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_54e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_54e7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_54e7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_54e7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_54e7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_54e7
result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_54e7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_54e7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_54e7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_54e7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_54e7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l917_c7_54e7
result_u8_value_MUX_uxn_opcodes_h_l917_c7_54e7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l917_c7_54e7_cond,
result_u8_value_MUX_uxn_opcodes_h_l917_c7_54e7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l917_c7_54e7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l917_c7_54e7_return_output);

-- t16_MUX_uxn_opcodes_h_l917_c7_54e7
t16_MUX_uxn_opcodes_h_l917_c7_54e7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l917_c7_54e7_cond,
t16_MUX_uxn_opcodes_h_l917_c7_54e7_iftrue,
t16_MUX_uxn_opcodes_h_l917_c7_54e7_iffalse,
t16_MUX_uxn_opcodes_h_l917_c7_54e7_return_output);

-- n16_MUX_uxn_opcodes_h_l917_c7_54e7
n16_MUX_uxn_opcodes_h_l917_c7_54e7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l917_c7_54e7_cond,
n16_MUX_uxn_opcodes_h_l917_c7_54e7_iftrue,
n16_MUX_uxn_opcodes_h_l917_c7_54e7_iffalse,
n16_MUX_uxn_opcodes_h_l917_c7_54e7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l922_c11_b255
BIN_OP_EQ_uxn_opcodes_h_l922_c11_b255 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l922_c11_b255_left,
BIN_OP_EQ_uxn_opcodes_h_l922_c11_b255_right,
BIN_OP_EQ_uxn_opcodes_h_l922_c11_b255_return_output);

-- tmp16_MUX_uxn_opcodes_h_l922_c7_d328
tmp16_MUX_uxn_opcodes_h_l922_c7_d328 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l922_c7_d328_cond,
tmp16_MUX_uxn_opcodes_h_l922_c7_d328_iftrue,
tmp16_MUX_uxn_opcodes_h_l922_c7_d328_iffalse,
tmp16_MUX_uxn_opcodes_h_l922_c7_d328_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_d328
result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_d328 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_d328_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_d328_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_d328_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_d328_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_d328
result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_d328 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_d328_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_d328_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_d328_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_d328_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_d328
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_d328 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_d328_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_d328_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_d328_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_d328_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_d328
result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_d328 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_d328_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_d328_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_d328_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_d328_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_d328
result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_d328 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_d328_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_d328_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_d328_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_d328_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l922_c7_d328
result_u8_value_MUX_uxn_opcodes_h_l922_c7_d328 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l922_c7_d328_cond,
result_u8_value_MUX_uxn_opcodes_h_l922_c7_d328_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l922_c7_d328_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l922_c7_d328_return_output);

-- t16_MUX_uxn_opcodes_h_l922_c7_d328
t16_MUX_uxn_opcodes_h_l922_c7_d328 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l922_c7_d328_cond,
t16_MUX_uxn_opcodes_h_l922_c7_d328_iftrue,
t16_MUX_uxn_opcodes_h_l922_c7_d328_iffalse,
t16_MUX_uxn_opcodes_h_l922_c7_d328_return_output);

-- n16_MUX_uxn_opcodes_h_l922_c7_d328
n16_MUX_uxn_opcodes_h_l922_c7_d328 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l922_c7_d328_cond,
n16_MUX_uxn_opcodes_h_l922_c7_d328_iftrue,
n16_MUX_uxn_opcodes_h_l922_c7_d328_iffalse,
n16_MUX_uxn_opcodes_h_l922_c7_d328_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l923_c3_415e
BIN_OP_OR_uxn_opcodes_h_l923_c3_415e : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l923_c3_415e_left,
BIN_OP_OR_uxn_opcodes_h_l923_c3_415e_right,
BIN_OP_OR_uxn_opcodes_h_l923_c3_415e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l926_c11_9ef8
BIN_OP_EQ_uxn_opcodes_h_l926_c11_9ef8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l926_c11_9ef8_left,
BIN_OP_EQ_uxn_opcodes_h_l926_c11_9ef8_right,
BIN_OP_EQ_uxn_opcodes_h_l926_c11_9ef8_return_output);

-- tmp16_MUX_uxn_opcodes_h_l926_c7_03f7
tmp16_MUX_uxn_opcodes_h_l926_c7_03f7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l926_c7_03f7_cond,
tmp16_MUX_uxn_opcodes_h_l926_c7_03f7_iftrue,
tmp16_MUX_uxn_opcodes_h_l926_c7_03f7_iffalse,
tmp16_MUX_uxn_opcodes_h_l926_c7_03f7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_03f7
result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_03f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_03f7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_03f7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_03f7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_03f7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_03f7
result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_03f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_03f7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_03f7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_03f7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_03f7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_03f7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_03f7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_03f7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_03f7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_03f7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_03f7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_03f7
result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_03f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_03f7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_03f7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_03f7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_03f7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_03f7
result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_03f7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_03f7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_03f7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_03f7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_03f7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l926_c7_03f7
result_u8_value_MUX_uxn_opcodes_h_l926_c7_03f7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l926_c7_03f7_cond,
result_u8_value_MUX_uxn_opcodes_h_l926_c7_03f7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l926_c7_03f7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l926_c7_03f7_return_output);

-- n16_MUX_uxn_opcodes_h_l926_c7_03f7
n16_MUX_uxn_opcodes_h_l926_c7_03f7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l926_c7_03f7_cond,
n16_MUX_uxn_opcodes_h_l926_c7_03f7_iftrue,
n16_MUX_uxn_opcodes_h_l926_c7_03f7_iffalse,
n16_MUX_uxn_opcodes_h_l926_c7_03f7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l930_c11_fa08
BIN_OP_EQ_uxn_opcodes_h_l930_c11_fa08 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l930_c11_fa08_left,
BIN_OP_EQ_uxn_opcodes_h_l930_c11_fa08_right,
BIN_OP_EQ_uxn_opcodes_h_l930_c11_fa08_return_output);

-- tmp16_MUX_uxn_opcodes_h_l930_c7_647f
tmp16_MUX_uxn_opcodes_h_l930_c7_647f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l930_c7_647f_cond,
tmp16_MUX_uxn_opcodes_h_l930_c7_647f_iftrue,
tmp16_MUX_uxn_opcodes_h_l930_c7_647f_iffalse,
tmp16_MUX_uxn_opcodes_h_l930_c7_647f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_647f
result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_647f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_647f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_647f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_647f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_647f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_647f
result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_647f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_647f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_647f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_647f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_647f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_647f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_647f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_647f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_647f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_647f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_647f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_647f
result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_647f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_647f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_647f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_647f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_647f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_647f
result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_647f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_647f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_647f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_647f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_647f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l930_c7_647f
result_u8_value_MUX_uxn_opcodes_h_l930_c7_647f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l930_c7_647f_cond,
result_u8_value_MUX_uxn_opcodes_h_l930_c7_647f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l930_c7_647f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l930_c7_647f_return_output);

-- n16_MUX_uxn_opcodes_h_l930_c7_647f
n16_MUX_uxn_opcodes_h_l930_c7_647f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l930_c7_647f_cond,
n16_MUX_uxn_opcodes_h_l930_c7_647f_iftrue,
n16_MUX_uxn_opcodes_h_l930_c7_647f_iffalse,
n16_MUX_uxn_opcodes_h_l930_c7_647f_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l931_c3_760b
BIN_OP_OR_uxn_opcodes_h_l931_c3_760b : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l931_c3_760b_left,
BIN_OP_OR_uxn_opcodes_h_l931_c3_760b_right,
BIN_OP_OR_uxn_opcodes_h_l931_c3_760b_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l932_c11_90e3
BIN_OP_AND_uxn_opcodes_h_l932_c11_90e3 : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l932_c11_90e3_left,
BIN_OP_AND_uxn_opcodes_h_l932_c11_90e3_right,
BIN_OP_AND_uxn_opcodes_h_l932_c11_90e3_return_output);

-- sp_relative_shift_uxn_opcodes_h_l934_c30_fdba
sp_relative_shift_uxn_opcodes_h_l934_c30_fdba : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l934_c30_fdba_ins,
sp_relative_shift_uxn_opcodes_h_l934_c30_fdba_x,
sp_relative_shift_uxn_opcodes_h_l934_c30_fdba_y,
sp_relative_shift_uxn_opcodes_h_l934_c30_fdba_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l939_c11_f736
BIN_OP_EQ_uxn_opcodes_h_l939_c11_f736 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l939_c11_f736_left,
BIN_OP_EQ_uxn_opcodes_h_l939_c11_f736_right,
BIN_OP_EQ_uxn_opcodes_h_l939_c11_f736_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_6543
result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_6543 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_6543_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_6543_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_6543_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_6543_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_6543
result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_6543 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_6543_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_6543_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_6543_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_6543_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_6543
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_6543 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_6543_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_6543_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_6543_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_6543_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_6543
result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_6543 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_6543_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_6543_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_6543_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_6543_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l939_c7_6543
result_u8_value_MUX_uxn_opcodes_h_l939_c7_6543 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l939_c7_6543_cond,
result_u8_value_MUX_uxn_opcodes_h_l939_c7_6543_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l939_c7_6543_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l939_c7_6543_return_output);

-- CONST_SR_8_uxn_opcodes_h_l942_c31_8873
CONST_SR_8_uxn_opcodes_h_l942_c31_8873 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l942_c31_8873_x,
CONST_SR_8_uxn_opcodes_h_l942_c31_8873_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l944_c11_e807
BIN_OP_EQ_uxn_opcodes_h_l944_c11_e807 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l944_c11_e807_left,
BIN_OP_EQ_uxn_opcodes_h_l944_c11_e807_right,
BIN_OP_EQ_uxn_opcodes_h_l944_c11_e807_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_764f
result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_764f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_764f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_764f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_764f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_764f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_764f
result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_764f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_764f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_764f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_764f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_764f_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l928_l919_DUPLICATE_1642
CONST_SL_8_uint16_t_uxn_opcodes_h_l928_l919_DUPLICATE_1642 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l928_l919_DUPLICATE_1642_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l928_l919_DUPLICATE_1642_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l909_c6_e223_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_1ad1_return_output,
 tmp16_MUX_uxn_opcodes_h_l909_c2_2e76_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_2e76_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_2e76_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_2e76_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_2e76_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_2e76_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l909_c2_2e76_return_output,
 t16_MUX_uxn_opcodes_h_l909_c2_2e76_return_output,
 n16_MUX_uxn_opcodes_h_l909_c2_2e76_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l914_c11_c4fb_return_output,
 tmp16_MUX_uxn_opcodes_h_l914_c7_4c66_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_4c66_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_4c66_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_4c66_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_4c66_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_4c66_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l914_c7_4c66_return_output,
 t16_MUX_uxn_opcodes_h_l914_c7_4c66_return_output,
 n16_MUX_uxn_opcodes_h_l914_c7_4c66_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l917_c11_bcd2_return_output,
 tmp16_MUX_uxn_opcodes_h_l917_c7_54e7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_54e7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_54e7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_54e7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_54e7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_54e7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l917_c7_54e7_return_output,
 t16_MUX_uxn_opcodes_h_l917_c7_54e7_return_output,
 n16_MUX_uxn_opcodes_h_l917_c7_54e7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l922_c11_b255_return_output,
 tmp16_MUX_uxn_opcodes_h_l922_c7_d328_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_d328_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_d328_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_d328_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_d328_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_d328_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l922_c7_d328_return_output,
 t16_MUX_uxn_opcodes_h_l922_c7_d328_return_output,
 n16_MUX_uxn_opcodes_h_l922_c7_d328_return_output,
 BIN_OP_OR_uxn_opcodes_h_l923_c3_415e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l926_c11_9ef8_return_output,
 tmp16_MUX_uxn_opcodes_h_l926_c7_03f7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_03f7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_03f7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_03f7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_03f7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_03f7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l926_c7_03f7_return_output,
 n16_MUX_uxn_opcodes_h_l926_c7_03f7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l930_c11_fa08_return_output,
 tmp16_MUX_uxn_opcodes_h_l930_c7_647f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_647f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_647f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_647f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_647f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_647f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l930_c7_647f_return_output,
 n16_MUX_uxn_opcodes_h_l930_c7_647f_return_output,
 BIN_OP_OR_uxn_opcodes_h_l931_c3_760b_return_output,
 BIN_OP_AND_uxn_opcodes_h_l932_c11_90e3_return_output,
 sp_relative_shift_uxn_opcodes_h_l934_c30_fdba_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l939_c11_f736_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_6543_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_6543_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_6543_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_6543_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l939_c7_6543_return_output,
 CONST_SR_8_uxn_opcodes_h_l942_c31_8873_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l944_c11_e807_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_764f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_764f_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l928_l919_DUPLICATE_1642_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c6_e223_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c6_e223_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c6_e223_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_1ad1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_1ad1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_1ad1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_1ad1_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l909_c2_2e76_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l909_c2_2e76_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l914_c7_4c66_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l909_c2_2e76_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l909_c2_2e76_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_2e76_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_2e76_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_4c66_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_2e76_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_2e76_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_2e76_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_2e76_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_4c66_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_2e76_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_2e76_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_2e76_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l911_c3_5539 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_2e76_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_4c66_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_2e76_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_2e76_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_2e76_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_2e76_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_4c66_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_2e76_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_2e76_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_2e76_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_2e76_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_4c66_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_2e76_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_2e76_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l909_c2_2e76_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l909_c2_2e76_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l914_c7_4c66_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l909_c2_2e76_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l909_c2_2e76_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l909_c2_2e76_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l909_c2_2e76_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l914_c7_4c66_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l909_c2_2e76_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l909_c2_2e76_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l909_c2_2e76_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l909_c2_2e76_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l914_c7_4c66_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l909_c2_2e76_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l909_c2_2e76_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l910_c3_4c08_uxn_opcodes_h_l910_c3_4c08_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_c4fb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_c4fb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_c4fb_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l914_c7_4c66_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l914_c7_4c66_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l917_c7_54e7_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l914_c7_4c66_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_4c66_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_4c66_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_54e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_4c66_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_4c66_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_4c66_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_54e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_4c66_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_4c66_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l915_c3_d3ae : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_4c66_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_54e7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_4c66_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_4c66_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_4c66_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_54e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_4c66_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_4c66_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_4c66_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_54e7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_4c66_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l914_c7_4c66_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l914_c7_4c66_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_54e7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l914_c7_4c66_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l914_c7_4c66_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l914_c7_4c66_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l917_c7_54e7_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l914_c7_4c66_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l914_c7_4c66_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l914_c7_4c66_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l917_c7_54e7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l914_c7_4c66_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_bcd2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_bcd2_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_bcd2_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l917_c7_54e7_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l917_c7_54e7_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l922_c7_d328_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l917_c7_54e7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_54e7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_54e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_d328_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_54e7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_54e7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_54e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_d328_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_54e7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_54e7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l920_c3_39a4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_54e7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_d328_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_54e7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_54e7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_54e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_d328_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_54e7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_54e7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_54e7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_d328_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_54e7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_54e7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_54e7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l922_c7_d328_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_54e7_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l917_c7_54e7_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l917_c7_54e7_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l922_c7_d328_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l917_c7_54e7_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l917_c7_54e7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l917_c7_54e7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l922_c7_d328_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l917_c7_54e7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_b255_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_b255_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_b255_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l922_c7_d328_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l922_c7_d328_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l926_c7_03f7_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l922_c7_d328_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_d328_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_d328_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_03f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_d328_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_d328_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_d328_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_03f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_d328_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_d328_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l924_c3_1166 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_d328_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_03f7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_d328_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_d328_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_d328_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_03f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_d328_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_d328_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_d328_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_03f7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_d328_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l922_c7_d328_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l922_c7_d328_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l926_c7_03f7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l922_c7_d328_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l922_c7_d328_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l922_c7_d328_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l922_c7_d328_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l922_c7_d328_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l922_c7_d328_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l926_c7_03f7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l922_c7_d328_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l923_c3_415e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l923_c3_415e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l923_c3_415e_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_9ef8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_9ef8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_9ef8_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l926_c7_03f7_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l926_c7_03f7_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l930_c7_647f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l926_c7_03f7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_03f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_03f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_647f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_03f7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_03f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_03f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_647f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_03f7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_03f7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_03f7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_647f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_03f7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_03f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_03f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_647f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_03f7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_03f7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_03f7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_647f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_03f7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l926_c7_03f7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l926_c7_03f7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l930_c7_647f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l926_c7_03f7_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l926_c7_03f7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l926_c7_03f7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l930_c7_647f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l926_c7_03f7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_fa08_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_fa08_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_fa08_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l930_c7_647f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l930_c7_647f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l930_c7_647f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_647f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_647f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_6543_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_647f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_647f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_647f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_6543_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_647f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_647f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l936_c3_8fea : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_647f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_6543_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_647f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_647f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_647f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_6543_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_647f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_647f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_647f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_647f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l930_c7_647f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l930_c7_647f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c7_6543_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l930_c7_647f_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l930_c7_647f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l930_c7_647f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l930_c7_647f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l931_c3_760b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l931_c3_760b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l931_c3_760b_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l932_c11_90e3_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l932_c11_90e3_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l932_c11_90e3_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l934_c30_fdba_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l934_c30_fdba_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l934_c30_fdba_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l934_c30_fdba_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l937_c21_b207_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c11_f736_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c11_f736_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c11_f736_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_6543_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_6543_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_764f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_6543_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_6543_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_6543_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_6543_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_6543_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l941_c3_8781 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_6543_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_6543_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_6543_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_6543_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_764f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_6543_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c7_6543_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c7_6543_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c7_6543_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l942_c31_8873_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l942_c31_8873_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l942_c21_d222_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_e807_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_e807_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_e807_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_764f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_764f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_764f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_764f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_764f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_764f_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l917_l914_l909_l939_l926_l922_DUPLICATE_862c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l917_l914_l944_l909_l939_l926_l922_DUPLICATE_2ab4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l917_l914_l909_l930_l926_l922_DUPLICATE_f61a_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l917_l914_l909_l939_l926_l922_DUPLICATE_40ef_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l917_l914_l944_l939_l930_l926_l922_DUPLICATE_bcba_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l918_l931_l927_l923_DUPLICATE_ea5e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l928_l919_DUPLICATE_1642_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l928_l919_DUPLICATE_1642_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l926_l939_DUPLICATE_b8f1_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l949_l905_DUPLICATE_c2bd_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_9ef8_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l911_c3_5539 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_2e76_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l911_c3_5539;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_fa08_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c11_f736_right := to_unsigned(6, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l934_c30_fdba_y := resize(to_signed(-2, 3), 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_1ad1_iffalse := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l934_c30_fdba_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_b255_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_e807_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_bcd2_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_647f_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_c4fb_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l936_c3_8fea := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_647f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l936_c3_8fea;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l924_c3_1166 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_d328_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l924_c3_1166;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_2e76_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c6_e223_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l920_c3_39a4 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_54e7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l920_c3_39a4;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l941_c3_8781 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_6543_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l941_c3_8781;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_764f_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_764f_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l915_c3_d3ae := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_4c66_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l915_c3_d3ae;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_6543_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_647f_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_1ad1_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l934_c30_fdba_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l931_c3_760b_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l909_c2_2e76_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l914_c7_4c66_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l917_c7_54e7_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l922_c7_d328_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l930_c7_647f_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c6_e223_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_c4fb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_bcd2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_b255_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_9ef8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_fa08_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c11_f736_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_e807_left := VAR_phase;
     VAR_BIN_OP_AND_uxn_opcodes_h_l932_c11_90e3_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l923_c3_415e_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l909_c2_2e76_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l914_c7_4c66_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l922_c7_d328_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l942_c31_8873_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l909_c2_2e76_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l914_c7_4c66_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l917_c7_54e7_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l922_c7_d328_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l926_c7_03f7_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l930_c7_647f_iffalse := tmp16;
     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l917_l914_l909_l930_l926_l922_DUPLICATE_f61a LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l917_l914_l909_l930_l926_l922_DUPLICATE_f61a_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l909_c6_e223] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l909_c6_e223_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c6_e223_left;
     BIN_OP_EQ_uxn_opcodes_h_l909_c6_e223_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c6_e223_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c6_e223_return_output := BIN_OP_EQ_uxn_opcodes_h_l909_c6_e223_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l926_c11_9ef8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l926_c11_9ef8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_9ef8_left;
     BIN_OP_EQ_uxn_opcodes_h_l926_c11_9ef8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_9ef8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_9ef8_return_output := BIN_OP_EQ_uxn_opcodes_h_l926_c11_9ef8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l914_c11_c4fb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l914_c11_c4fb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_c4fb_left;
     BIN_OP_EQ_uxn_opcodes_h_l914_c11_c4fb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_c4fb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_c4fb_return_output := BIN_OP_EQ_uxn_opcodes_h_l914_c11_c4fb_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l917_l914_l944_l939_l930_l926_l922_DUPLICATE_bcba LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l917_l914_l944_l939_l930_l926_l922_DUPLICATE_bcba_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l917_l914_l909_l939_l926_l922_DUPLICATE_40ef LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l917_l914_l909_l939_l926_l922_DUPLICATE_40ef_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l917_l914_l944_l909_l939_l926_l922_DUPLICATE_2ab4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l917_l914_l944_l909_l939_l926_l922_DUPLICATE_2ab4_return_output := result.is_stack_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l918_l931_l927_l923_DUPLICATE_ea5e LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l918_l931_l927_l923_DUPLICATE_ea5e_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l930_c11_fa08] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l930_c11_fa08_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_fa08_left;
     BIN_OP_EQ_uxn_opcodes_h_l930_c11_fa08_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_fa08_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_fa08_return_output := BIN_OP_EQ_uxn_opcodes_h_l930_c11_fa08_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l917_c11_bcd2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l917_c11_bcd2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_bcd2_left;
     BIN_OP_EQ_uxn_opcodes_h_l917_c11_bcd2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_bcd2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_bcd2_return_output := BIN_OP_EQ_uxn_opcodes_h_l917_c11_bcd2_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l934_c30_fdba] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l934_c30_fdba_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l934_c30_fdba_ins;
     sp_relative_shift_uxn_opcodes_h_l934_c30_fdba_x <= VAR_sp_relative_shift_uxn_opcodes_h_l934_c30_fdba_x;
     sp_relative_shift_uxn_opcodes_h_l934_c30_fdba_y <= VAR_sp_relative_shift_uxn_opcodes_h_l934_c30_fdba_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l934_c30_fdba_return_output := sp_relative_shift_uxn_opcodes_h_l934_c30_fdba_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l926_l939_DUPLICATE_b8f1 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l926_l939_DUPLICATE_b8f1_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l944_c11_e807] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l944_c11_e807_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_e807_left;
     BIN_OP_EQ_uxn_opcodes_h_l944_c11_e807_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_e807_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_e807_return_output := BIN_OP_EQ_uxn_opcodes_h_l944_c11_e807_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l917_l914_l909_l939_l926_l922_DUPLICATE_862c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l917_l914_l909_l939_l926_l922_DUPLICATE_862c_return_output := result.is_sp_shift;

     -- CONST_SR_8[uxn_opcodes_h_l942_c31_8873] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l942_c31_8873_x <= VAR_CONST_SR_8_uxn_opcodes_h_l942_c31_8873_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l942_c31_8873_return_output := CONST_SR_8_uxn_opcodes_h_l942_c31_8873_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l939_c11_f736] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l939_c11_f736_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c11_f736_left;
     BIN_OP_EQ_uxn_opcodes_h_l939_c11_f736_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c11_f736_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c11_f736_return_output := BIN_OP_EQ_uxn_opcodes_h_l939_c11_f736_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l922_c11_b255] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l922_c11_b255_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_b255_left;
     BIN_OP_EQ_uxn_opcodes_h_l922_c11_b255_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_b255_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_b255_return_output := BIN_OP_EQ_uxn_opcodes_h_l922_c11_b255_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_1ad1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c6_e223_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l909_c2_2e76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c6_e223_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_2e76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c6_e223_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_2e76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c6_e223_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_2e76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c6_e223_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_2e76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c6_e223_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_2e76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c6_e223_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l909_c2_2e76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c6_e223_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l909_c2_2e76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c6_e223_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l909_c2_2e76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c6_e223_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l914_c7_4c66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_c4fb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_4c66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_c4fb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_4c66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_c4fb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_4c66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_c4fb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_4c66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_c4fb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_4c66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_c4fb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l914_c7_4c66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_c4fb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l914_c7_4c66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_c4fb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l914_c7_4c66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_c4fb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l917_c7_54e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_bcd2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_54e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_bcd2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_54e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_bcd2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_54e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_bcd2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_54e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_bcd2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_54e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_bcd2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_54e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_bcd2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l917_c7_54e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_bcd2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l917_c7_54e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_bcd2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l922_c7_d328_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_b255_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_d328_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_b255_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_d328_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_b255_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_d328_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_b255_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_d328_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_b255_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_d328_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_b255_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l922_c7_d328_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_b255_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l922_c7_d328_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_b255_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l922_c7_d328_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_b255_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l926_c7_03f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_9ef8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_03f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_9ef8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_03f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_9ef8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_03f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_9ef8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_03f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_9ef8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_03f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_9ef8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l926_c7_03f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_9ef8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l926_c7_03f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_9ef8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l930_c7_647f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_fa08_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_647f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_fa08_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_647f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_fa08_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_647f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_fa08_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_647f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_fa08_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_647f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_fa08_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l930_c7_647f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_fa08_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l930_c7_647f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_fa08_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_6543_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c11_f736_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_6543_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c11_f736_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_6543_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c11_f736_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_6543_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c11_f736_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c7_6543_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c11_f736_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_764f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_e807_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_764f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_e807_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l923_c3_415e_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l918_l931_l927_l923_DUPLICATE_ea5e_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l931_c3_760b_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l918_l931_l927_l923_DUPLICATE_ea5e_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l928_l919_DUPLICATE_1642_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l918_l931_l927_l923_DUPLICATE_ea5e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_2e76_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l917_l914_l909_l930_l926_l922_DUPLICATE_f61a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_4c66_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l917_l914_l909_l930_l926_l922_DUPLICATE_f61a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_54e7_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l917_l914_l909_l930_l926_l922_DUPLICATE_f61a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_d328_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l917_l914_l909_l930_l926_l922_DUPLICATE_f61a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_03f7_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l917_l914_l909_l930_l926_l922_DUPLICATE_f61a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_647f_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l917_l914_l909_l930_l926_l922_DUPLICATE_f61a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_4c66_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l917_l914_l944_l939_l930_l926_l922_DUPLICATE_bcba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_54e7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l917_l914_l944_l939_l930_l926_l922_DUPLICATE_bcba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_d328_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l917_l914_l944_l939_l930_l926_l922_DUPLICATE_bcba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_03f7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l917_l914_l944_l939_l930_l926_l922_DUPLICATE_bcba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_647f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l917_l914_l944_l939_l930_l926_l922_DUPLICATE_bcba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_6543_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l917_l914_l944_l939_l930_l926_l922_DUPLICATE_bcba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_764f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l917_l914_l944_l939_l930_l926_l922_DUPLICATE_bcba_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_2e76_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l917_l914_l909_l939_l926_l922_DUPLICATE_862c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_4c66_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l917_l914_l909_l939_l926_l922_DUPLICATE_862c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_54e7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l917_l914_l909_l939_l926_l922_DUPLICATE_862c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_d328_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l917_l914_l909_l939_l926_l922_DUPLICATE_862c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_03f7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l917_l914_l909_l939_l926_l922_DUPLICATE_862c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_6543_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l917_l914_l909_l939_l926_l922_DUPLICATE_862c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_2e76_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l917_l914_l944_l909_l939_l926_l922_DUPLICATE_2ab4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_4c66_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l917_l914_l944_l909_l939_l926_l922_DUPLICATE_2ab4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_54e7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l917_l914_l944_l909_l939_l926_l922_DUPLICATE_2ab4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_d328_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l917_l914_l944_l909_l939_l926_l922_DUPLICATE_2ab4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_03f7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l917_l914_l944_l909_l939_l926_l922_DUPLICATE_2ab4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_6543_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l917_l914_l944_l909_l939_l926_l922_DUPLICATE_2ab4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_764f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l917_l914_l944_l909_l939_l926_l922_DUPLICATE_2ab4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_03f7_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l926_l939_DUPLICATE_b8f1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_6543_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l926_l939_DUPLICATE_b8f1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l909_c2_2e76_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l917_l914_l909_l939_l926_l922_DUPLICATE_40ef_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l914_c7_4c66_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l917_l914_l909_l939_l926_l922_DUPLICATE_40ef_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_54e7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l917_l914_l909_l939_l926_l922_DUPLICATE_40ef_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l922_c7_d328_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l917_l914_l909_l939_l926_l922_DUPLICATE_40ef_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l926_c7_03f7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l917_l914_l909_l939_l926_l922_DUPLICATE_40ef_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c7_6543_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l917_l914_l909_l939_l926_l922_DUPLICATE_40ef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_647f_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l934_c30_fdba_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l939_c7_6543] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_6543_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_6543_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_6543_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_6543_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_6543_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_6543_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_6543_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_6543_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l939_c7_6543] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_6543_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_6543_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_6543_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_6543_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_6543_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_6543_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_6543_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_6543_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l942_c21_d222] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l942_c21_d222_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l942_c31_8873_return_output);

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l909_c1_1ad1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_1ad1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_1ad1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_1ad1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_1ad1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_1ad1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_1ad1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_1ad1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_1ad1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l930_c7_647f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_647f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_647f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_647f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_647f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_647f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_647f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_647f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_647f_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l928_l919_DUPLICATE_1642 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l928_l919_DUPLICATE_1642_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l928_l919_DUPLICATE_1642_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l928_l919_DUPLICATE_1642_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l928_l919_DUPLICATE_1642_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l944_c7_764f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_764f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_764f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_764f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_764f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_764f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_764f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_764f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_764f_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l931_c3_760b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l931_c3_760b_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l931_c3_760b_left;
     BIN_OP_OR_uxn_opcodes_h_l931_c3_760b_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l931_c3_760b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l931_c3_760b_return_output := BIN_OP_OR_uxn_opcodes_h_l931_c3_760b_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l923_c3_415e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l923_c3_415e_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l923_c3_415e_left;
     BIN_OP_OR_uxn_opcodes_h_l923_c3_415e_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l923_c3_415e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l923_c3_415e_return_output := BIN_OP_OR_uxn_opcodes_h_l923_c3_415e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l944_c7_764f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_764f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_764f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_764f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_764f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_764f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_764f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_764f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_764f_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l922_c7_d328_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l923_c3_415e_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l932_c11_90e3_right := VAR_BIN_OP_OR_uxn_opcodes_h_l931_c3_760b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l930_c7_647f_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l931_c3_760b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c7_6543_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l942_c21_d222_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l926_c7_03f7_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l928_l919_DUPLICATE_1642_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l917_c7_54e7_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l928_l919_DUPLICATE_1642_return_output;
     VAR_printf_uxn_opcodes_h_l910_c3_4c08_uxn_opcodes_h_l910_c3_4c08_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_1ad1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_6543_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_764f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_647f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_6543_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_6543_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_764f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_03f7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_647f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_647f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_6543_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l939_c7_6543] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_6543_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_6543_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_6543_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_6543_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_6543_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_6543_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_6543_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_6543_return_output;

     -- t16_MUX[uxn_opcodes_h_l922_c7_d328] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l922_c7_d328_cond <= VAR_t16_MUX_uxn_opcodes_h_l922_c7_d328_cond;
     t16_MUX_uxn_opcodes_h_l922_c7_d328_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l922_c7_d328_iftrue;
     t16_MUX_uxn_opcodes_h_l922_c7_d328_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l922_c7_d328_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l922_c7_d328_return_output := t16_MUX_uxn_opcodes_h_l922_c7_d328_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l939_c7_6543] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_6543_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_6543_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_6543_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_6543_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_6543_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_6543_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_6543_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_6543_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l939_c7_6543] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l939_c7_6543_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c7_6543_cond;
     result_u8_value_MUX_uxn_opcodes_h_l939_c7_6543_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c7_6543_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l939_c7_6543_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c7_6543_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c7_6543_return_output := result_u8_value_MUX_uxn_opcodes_h_l939_c7_6543_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l932_c11_90e3] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l932_c11_90e3_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l932_c11_90e3_left;
     BIN_OP_AND_uxn_opcodes_h_l932_c11_90e3_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l932_c11_90e3_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l932_c11_90e3_return_output := BIN_OP_AND_uxn_opcodes_h_l932_c11_90e3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l930_c7_647f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_647f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_647f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_647f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_647f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_647f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_647f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_647f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_647f_return_output;

     -- n16_MUX[uxn_opcodes_h_l930_c7_647f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l930_c7_647f_cond <= VAR_n16_MUX_uxn_opcodes_h_l930_c7_647f_cond;
     n16_MUX_uxn_opcodes_h_l930_c7_647f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l930_c7_647f_iftrue;
     n16_MUX_uxn_opcodes_h_l930_c7_647f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l930_c7_647f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l930_c7_647f_return_output := n16_MUX_uxn_opcodes_h_l930_c7_647f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l926_c7_03f7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_03f7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_03f7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_03f7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_03f7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_03f7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_03f7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_03f7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_03f7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l930_c7_647f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_647f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_647f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_647f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_647f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_647f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_647f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_647f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_647f_return_output;

     -- printf_uxn_opcodes_h_l910_c3_4c08[uxn_opcodes_h_l910_c3_4c08] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l910_c3_4c08_uxn_opcodes_h_l910_c3_4c08_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l910_c3_4c08_uxn_opcodes_h_l910_c3_4c08_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l930_c7_647f_iftrue := VAR_BIN_OP_AND_uxn_opcodes_h_l932_c11_90e3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l926_c7_03f7_iffalse := VAR_n16_MUX_uxn_opcodes_h_l930_c7_647f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_647f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_6543_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_03f7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_647f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_647f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_6543_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_d328_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_03f7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_03f7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_647f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l930_c7_647f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c7_6543_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l917_c7_54e7_iffalse := VAR_t16_MUX_uxn_opcodes_h_l922_c7_d328_return_output;
     -- n16_MUX[uxn_opcodes_h_l926_c7_03f7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l926_c7_03f7_cond <= VAR_n16_MUX_uxn_opcodes_h_l926_c7_03f7_cond;
     n16_MUX_uxn_opcodes_h_l926_c7_03f7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l926_c7_03f7_iftrue;
     n16_MUX_uxn_opcodes_h_l926_c7_03f7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l926_c7_03f7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l926_c7_03f7_return_output := n16_MUX_uxn_opcodes_h_l926_c7_03f7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l930_c7_647f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_647f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_647f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_647f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_647f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_647f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_647f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_647f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_647f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l930_c7_647f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l930_c7_647f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l930_c7_647f_cond;
     tmp16_MUX_uxn_opcodes_h_l930_c7_647f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l930_c7_647f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l930_c7_647f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l930_c7_647f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l930_c7_647f_return_output := tmp16_MUX_uxn_opcodes_h_l930_c7_647f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l930_c7_647f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_647f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_647f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_647f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_647f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_647f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_647f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_647f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_647f_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l937_c21_b207] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l937_c21_b207_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_AND_uxn_opcodes_h_l932_c11_90e3_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l926_c7_03f7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_03f7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_03f7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_03f7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_03f7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_03f7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_03f7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_03f7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_03f7_return_output;

     -- t16_MUX[uxn_opcodes_h_l917_c7_54e7] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l917_c7_54e7_cond <= VAR_t16_MUX_uxn_opcodes_h_l917_c7_54e7_cond;
     t16_MUX_uxn_opcodes_h_l917_c7_54e7_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l917_c7_54e7_iftrue;
     t16_MUX_uxn_opcodes_h_l917_c7_54e7_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l917_c7_54e7_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l917_c7_54e7_return_output := t16_MUX_uxn_opcodes_h_l917_c7_54e7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l922_c7_d328] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_d328_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_d328_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_d328_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_d328_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_d328_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_d328_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_d328_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_d328_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l926_c7_03f7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_03f7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_03f7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_03f7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_03f7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_03f7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_03f7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_03f7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_03f7_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l930_c7_647f_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l937_c21_b207_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l922_c7_d328_iffalse := VAR_n16_MUX_uxn_opcodes_h_l926_c7_03f7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_03f7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_647f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_d328_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_03f7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_03f7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_647f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_54e7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_d328_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_d328_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_03f7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l914_c7_4c66_iffalse := VAR_t16_MUX_uxn_opcodes_h_l917_c7_54e7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l926_c7_03f7_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l930_c7_647f_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l922_c7_d328] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_d328_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_d328_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_d328_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_d328_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_d328_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_d328_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_d328_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_d328_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l926_c7_03f7] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l926_c7_03f7_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l926_c7_03f7_cond;
     tmp16_MUX_uxn_opcodes_h_l926_c7_03f7_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l926_c7_03f7_iftrue;
     tmp16_MUX_uxn_opcodes_h_l926_c7_03f7_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l926_c7_03f7_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l926_c7_03f7_return_output := tmp16_MUX_uxn_opcodes_h_l926_c7_03f7_return_output;

     -- t16_MUX[uxn_opcodes_h_l914_c7_4c66] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l914_c7_4c66_cond <= VAR_t16_MUX_uxn_opcodes_h_l914_c7_4c66_cond;
     t16_MUX_uxn_opcodes_h_l914_c7_4c66_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l914_c7_4c66_iftrue;
     t16_MUX_uxn_opcodes_h_l914_c7_4c66_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l914_c7_4c66_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l914_c7_4c66_return_output := t16_MUX_uxn_opcodes_h_l914_c7_4c66_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l917_c7_54e7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_54e7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_54e7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_54e7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_54e7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_54e7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_54e7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_54e7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_54e7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l926_c7_03f7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_03f7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_03f7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_03f7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_03f7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_03f7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_03f7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_03f7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_03f7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l922_c7_d328] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_d328_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_d328_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_d328_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_d328_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_d328_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_d328_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_d328_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_d328_return_output;

     -- n16_MUX[uxn_opcodes_h_l922_c7_d328] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l922_c7_d328_cond <= VAR_n16_MUX_uxn_opcodes_h_l922_c7_d328_cond;
     n16_MUX_uxn_opcodes_h_l922_c7_d328_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l922_c7_d328_iftrue;
     n16_MUX_uxn_opcodes_h_l922_c7_d328_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l922_c7_d328_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l922_c7_d328_return_output := n16_MUX_uxn_opcodes_h_l922_c7_d328_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l930_c7_647f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l930_c7_647f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l930_c7_647f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l930_c7_647f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l930_c7_647f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l930_c7_647f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l930_c7_647f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l930_c7_647f_return_output := result_u8_value_MUX_uxn_opcodes_h_l930_c7_647f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l926_c7_03f7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_03f7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_03f7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_03f7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_03f7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_03f7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_03f7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_03f7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_03f7_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l917_c7_54e7_iffalse := VAR_n16_MUX_uxn_opcodes_h_l922_c7_d328_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_d328_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_03f7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_54e7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_d328_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_d328_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_03f7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_4c66_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_54e7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_54e7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_d328_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l926_c7_03f7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l930_c7_647f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l909_c2_2e76_iffalse := VAR_t16_MUX_uxn_opcodes_h_l914_c7_4c66_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l922_c7_d328_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l926_c7_03f7_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l926_c7_03f7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l926_c7_03f7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l926_c7_03f7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l926_c7_03f7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l926_c7_03f7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l926_c7_03f7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l926_c7_03f7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l926_c7_03f7_return_output := result_u8_value_MUX_uxn_opcodes_h_l926_c7_03f7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l922_c7_d328] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_d328_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_d328_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_d328_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_d328_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_d328_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_d328_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_d328_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_d328_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l917_c7_54e7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_54e7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_54e7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_54e7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_54e7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_54e7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_54e7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_54e7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_54e7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l914_c7_4c66] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_4c66_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_4c66_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_4c66_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_4c66_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_4c66_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_4c66_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_4c66_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_4c66_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l922_c7_d328] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l922_c7_d328_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l922_c7_d328_cond;
     tmp16_MUX_uxn_opcodes_h_l922_c7_d328_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l922_c7_d328_iftrue;
     tmp16_MUX_uxn_opcodes_h_l922_c7_d328_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l922_c7_d328_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l922_c7_d328_return_output := tmp16_MUX_uxn_opcodes_h_l922_c7_d328_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l922_c7_d328] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_d328_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_d328_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_d328_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_d328_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_d328_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_d328_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_d328_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_d328_return_output;

     -- t16_MUX[uxn_opcodes_h_l909_c2_2e76] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l909_c2_2e76_cond <= VAR_t16_MUX_uxn_opcodes_h_l909_c2_2e76_cond;
     t16_MUX_uxn_opcodes_h_l909_c2_2e76_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l909_c2_2e76_iftrue;
     t16_MUX_uxn_opcodes_h_l909_c2_2e76_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l909_c2_2e76_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l909_c2_2e76_return_output := t16_MUX_uxn_opcodes_h_l909_c2_2e76_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l917_c7_54e7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_54e7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_54e7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_54e7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_54e7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_54e7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_54e7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_54e7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_54e7_return_output;

     -- n16_MUX[uxn_opcodes_h_l917_c7_54e7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l917_c7_54e7_cond <= VAR_n16_MUX_uxn_opcodes_h_l917_c7_54e7_cond;
     n16_MUX_uxn_opcodes_h_l917_c7_54e7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l917_c7_54e7_iftrue;
     n16_MUX_uxn_opcodes_h_l917_c7_54e7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l917_c7_54e7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l917_c7_54e7_return_output := n16_MUX_uxn_opcodes_h_l917_c7_54e7_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l914_c7_4c66_iffalse := VAR_n16_MUX_uxn_opcodes_h_l917_c7_54e7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_54e7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_d328_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_4c66_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_54e7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_54e7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_d328_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_2e76_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_4c66_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_4c66_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_54e7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l922_c7_d328_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l926_c7_03f7_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l909_c2_2e76_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l917_c7_54e7_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l922_c7_d328_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l917_c7_54e7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_54e7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_54e7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_54e7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_54e7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_54e7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_54e7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_54e7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_54e7_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l917_c7_54e7] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l917_c7_54e7_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l917_c7_54e7_cond;
     tmp16_MUX_uxn_opcodes_h_l917_c7_54e7_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l917_c7_54e7_iftrue;
     tmp16_MUX_uxn_opcodes_h_l917_c7_54e7_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l917_c7_54e7_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l917_c7_54e7_return_output := tmp16_MUX_uxn_opcodes_h_l917_c7_54e7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l914_c7_4c66] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_4c66_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_4c66_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_4c66_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_4c66_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_4c66_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_4c66_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_4c66_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_4c66_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l914_c7_4c66] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_4c66_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_4c66_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_4c66_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_4c66_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_4c66_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_4c66_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_4c66_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_4c66_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l917_c7_54e7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_54e7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_54e7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_54e7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_54e7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_54e7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_54e7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_54e7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_54e7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l922_c7_d328] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l922_c7_d328_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l922_c7_d328_cond;
     result_u8_value_MUX_uxn_opcodes_h_l922_c7_d328_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l922_c7_d328_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l922_c7_d328_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l922_c7_d328_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l922_c7_d328_return_output := result_u8_value_MUX_uxn_opcodes_h_l922_c7_d328_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l909_c2_2e76] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_2e76_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_2e76_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_2e76_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_2e76_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_2e76_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_2e76_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_2e76_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_2e76_return_output;

     -- n16_MUX[uxn_opcodes_h_l914_c7_4c66] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l914_c7_4c66_cond <= VAR_n16_MUX_uxn_opcodes_h_l914_c7_4c66_cond;
     n16_MUX_uxn_opcodes_h_l914_c7_4c66_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l914_c7_4c66_iftrue;
     n16_MUX_uxn_opcodes_h_l914_c7_4c66_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l914_c7_4c66_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l914_c7_4c66_return_output := n16_MUX_uxn_opcodes_h_l914_c7_4c66_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l909_c2_2e76_iffalse := VAR_n16_MUX_uxn_opcodes_h_l914_c7_4c66_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_4c66_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_54e7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_2e76_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_4c66_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_4c66_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_54e7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_2e76_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_4c66_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_54e7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l922_c7_d328_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l914_c7_4c66_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l917_c7_54e7_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l917_c7_54e7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l917_c7_54e7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_54e7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l917_c7_54e7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_54e7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l917_c7_54e7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_54e7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_54e7_return_output := result_u8_value_MUX_uxn_opcodes_h_l917_c7_54e7_return_output;

     -- n16_MUX[uxn_opcodes_h_l909_c2_2e76] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l909_c2_2e76_cond <= VAR_n16_MUX_uxn_opcodes_h_l909_c2_2e76_cond;
     n16_MUX_uxn_opcodes_h_l909_c2_2e76_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l909_c2_2e76_iftrue;
     n16_MUX_uxn_opcodes_h_l909_c2_2e76_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l909_c2_2e76_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l909_c2_2e76_return_output := n16_MUX_uxn_opcodes_h_l909_c2_2e76_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l914_c7_4c66] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l914_c7_4c66_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l914_c7_4c66_cond;
     tmp16_MUX_uxn_opcodes_h_l914_c7_4c66_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l914_c7_4c66_iftrue;
     tmp16_MUX_uxn_opcodes_h_l914_c7_4c66_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l914_c7_4c66_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l914_c7_4c66_return_output := tmp16_MUX_uxn_opcodes_h_l914_c7_4c66_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l914_c7_4c66] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_4c66_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_4c66_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_4c66_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_4c66_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_4c66_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_4c66_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_4c66_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_4c66_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l909_c2_2e76] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_2e76_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_2e76_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_2e76_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_2e76_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_2e76_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_2e76_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_2e76_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_2e76_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l914_c7_4c66] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_4c66_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_4c66_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_4c66_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_4c66_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_4c66_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_4c66_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_4c66_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_4c66_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l909_c2_2e76] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_2e76_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_2e76_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_2e76_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_2e76_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_2e76_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_2e76_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_2e76_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_2e76_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l909_c2_2e76_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_2e76_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_4c66_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_2e76_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_4c66_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l914_c7_4c66_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_54e7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l909_c2_2e76_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l914_c7_4c66_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l909_c2_2e76] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_2e76_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_2e76_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_2e76_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_2e76_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_2e76_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_2e76_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_2e76_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_2e76_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l914_c7_4c66] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l914_c7_4c66_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l914_c7_4c66_cond;
     result_u8_value_MUX_uxn_opcodes_h_l914_c7_4c66_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l914_c7_4c66_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l914_c7_4c66_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l914_c7_4c66_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l914_c7_4c66_return_output := result_u8_value_MUX_uxn_opcodes_h_l914_c7_4c66_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l909_c2_2e76] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l909_c2_2e76_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l909_c2_2e76_cond;
     tmp16_MUX_uxn_opcodes_h_l909_c2_2e76_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l909_c2_2e76_iftrue;
     tmp16_MUX_uxn_opcodes_h_l909_c2_2e76_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l909_c2_2e76_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l909_c2_2e76_return_output := tmp16_MUX_uxn_opcodes_h_l909_c2_2e76_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l909_c2_2e76] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_2e76_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_2e76_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_2e76_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_2e76_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_2e76_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_2e76_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_2e76_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_2e76_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l909_c2_2e76_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l914_c7_4c66_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l909_c2_2e76_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l909_c2_2e76] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l909_c2_2e76_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l909_c2_2e76_cond;
     result_u8_value_MUX_uxn_opcodes_h_l909_c2_2e76_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l909_c2_2e76_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l909_c2_2e76_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l909_c2_2e76_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l909_c2_2e76_return_output := result_u8_value_MUX_uxn_opcodes_h_l909_c2_2e76_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l949_l905_DUPLICATE_c2bd LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l949_l905_DUPLICATE_c2bd_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_8c29(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_2e76_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_2e76_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_2e76_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_2e76_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_2e76_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l909_c2_2e76_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l949_l905_DUPLICATE_c2bd_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l949_l905_DUPLICATE_c2bd_return_output;
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
