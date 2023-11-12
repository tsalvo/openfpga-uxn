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
-- BIN_OP_EQ[uxn_opcodes_h_l909_c6_677e]
signal BIN_OP_EQ_uxn_opcodes_h_l909_c6_677e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l909_c6_677e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l909_c6_677e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l909_c1_7b32]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_7b32_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_7b32_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_7b32_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_7b32_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l909_c2_3140]
signal n16_MUX_uxn_opcodes_h_l909_c2_3140_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l909_c2_3140_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l909_c2_3140_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l909_c2_3140_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l909_c2_3140]
signal t16_MUX_uxn_opcodes_h_l909_c2_3140_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l909_c2_3140_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l909_c2_3140_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l909_c2_3140_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l909_c2_3140]
signal result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_3140_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_3140_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_3140_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_3140_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l909_c2_3140]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_3140_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_3140_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_3140_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_3140_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l909_c2_3140]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_3140_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_3140_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_3140_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_3140_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l909_c2_3140]
signal result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_3140_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_3140_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_3140_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_3140_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l909_c2_3140]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_3140_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_3140_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_3140_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_3140_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l909_c2_3140]
signal result_u8_value_MUX_uxn_opcodes_h_l909_c2_3140_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l909_c2_3140_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l909_c2_3140_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l909_c2_3140_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l909_c2_3140]
signal tmp16_MUX_uxn_opcodes_h_l909_c2_3140_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l909_c2_3140_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l909_c2_3140_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l909_c2_3140_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l910_c3_e6a0[uxn_opcodes_h_l910_c3_e6a0]
signal printf_uxn_opcodes_h_l910_c3_e6a0_uxn_opcodes_h_l910_c3_e6a0_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l914_c11_c684]
signal BIN_OP_EQ_uxn_opcodes_h_l914_c11_c684_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l914_c11_c684_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l914_c11_c684_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l914_c7_3b69]
signal n16_MUX_uxn_opcodes_h_l914_c7_3b69_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l914_c7_3b69_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l914_c7_3b69_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l914_c7_3b69_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l914_c7_3b69]
signal t16_MUX_uxn_opcodes_h_l914_c7_3b69_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l914_c7_3b69_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l914_c7_3b69_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l914_c7_3b69_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l914_c7_3b69]
signal result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_3b69_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_3b69_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_3b69_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_3b69_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l914_c7_3b69]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_3b69_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_3b69_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_3b69_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_3b69_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l914_c7_3b69]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_3b69_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_3b69_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_3b69_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_3b69_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l914_c7_3b69]
signal result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_3b69_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_3b69_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_3b69_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_3b69_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l914_c7_3b69]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_3b69_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_3b69_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_3b69_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_3b69_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l914_c7_3b69]
signal result_u8_value_MUX_uxn_opcodes_h_l914_c7_3b69_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l914_c7_3b69_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l914_c7_3b69_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l914_c7_3b69_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l914_c7_3b69]
signal tmp16_MUX_uxn_opcodes_h_l914_c7_3b69_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l914_c7_3b69_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l914_c7_3b69_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l914_c7_3b69_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l917_c11_6a02]
signal BIN_OP_EQ_uxn_opcodes_h_l917_c11_6a02_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l917_c11_6a02_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l917_c11_6a02_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l917_c7_2442]
signal n16_MUX_uxn_opcodes_h_l917_c7_2442_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l917_c7_2442_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l917_c7_2442_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l917_c7_2442_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l917_c7_2442]
signal t16_MUX_uxn_opcodes_h_l917_c7_2442_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l917_c7_2442_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l917_c7_2442_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l917_c7_2442_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l917_c7_2442]
signal result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_2442_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_2442_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_2442_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_2442_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l917_c7_2442]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_2442_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_2442_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_2442_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_2442_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l917_c7_2442]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_2442_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_2442_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_2442_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_2442_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l917_c7_2442]
signal result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_2442_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_2442_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_2442_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_2442_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l917_c7_2442]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_2442_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_2442_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_2442_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_2442_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l917_c7_2442]
signal result_u8_value_MUX_uxn_opcodes_h_l917_c7_2442_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l917_c7_2442_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l917_c7_2442_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l917_c7_2442_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l917_c7_2442]
signal tmp16_MUX_uxn_opcodes_h_l917_c7_2442_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l917_c7_2442_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l917_c7_2442_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l917_c7_2442_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l922_c11_8829]
signal BIN_OP_EQ_uxn_opcodes_h_l922_c11_8829_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l922_c11_8829_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l922_c11_8829_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l922_c7_0552]
signal n16_MUX_uxn_opcodes_h_l922_c7_0552_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l922_c7_0552_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l922_c7_0552_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l922_c7_0552_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l922_c7_0552]
signal t16_MUX_uxn_opcodes_h_l922_c7_0552_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l922_c7_0552_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l922_c7_0552_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l922_c7_0552_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l922_c7_0552]
signal result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_0552_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_0552_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_0552_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_0552_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l922_c7_0552]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_0552_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_0552_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_0552_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_0552_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l922_c7_0552]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_0552_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_0552_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_0552_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_0552_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l922_c7_0552]
signal result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_0552_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_0552_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_0552_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_0552_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l922_c7_0552]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_0552_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_0552_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_0552_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_0552_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l922_c7_0552]
signal result_u8_value_MUX_uxn_opcodes_h_l922_c7_0552_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l922_c7_0552_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l922_c7_0552_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l922_c7_0552_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l922_c7_0552]
signal tmp16_MUX_uxn_opcodes_h_l922_c7_0552_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l922_c7_0552_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l922_c7_0552_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l922_c7_0552_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l923_c3_932e]
signal BIN_OP_OR_uxn_opcodes_h_l923_c3_932e_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l923_c3_932e_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l923_c3_932e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l926_c11_f4ab]
signal BIN_OP_EQ_uxn_opcodes_h_l926_c11_f4ab_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l926_c11_f4ab_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l926_c11_f4ab_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l926_c7_2b4c]
signal n16_MUX_uxn_opcodes_h_l926_c7_2b4c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l926_c7_2b4c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l926_c7_2b4c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l926_c7_2b4c_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l926_c7_2b4c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_2b4c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_2b4c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_2b4c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_2b4c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l926_c7_2b4c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_2b4c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_2b4c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_2b4c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_2b4c_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l926_c7_2b4c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_2b4c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_2b4c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_2b4c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_2b4c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l926_c7_2b4c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_2b4c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_2b4c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_2b4c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_2b4c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l926_c7_2b4c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_2b4c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_2b4c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_2b4c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_2b4c_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l926_c7_2b4c]
signal result_u8_value_MUX_uxn_opcodes_h_l926_c7_2b4c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l926_c7_2b4c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l926_c7_2b4c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l926_c7_2b4c_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l926_c7_2b4c]
signal tmp16_MUX_uxn_opcodes_h_l926_c7_2b4c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l926_c7_2b4c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l926_c7_2b4c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l926_c7_2b4c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l930_c11_5224]
signal BIN_OP_EQ_uxn_opcodes_h_l930_c11_5224_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l930_c11_5224_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l930_c11_5224_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l930_c7_f154]
signal n16_MUX_uxn_opcodes_h_l930_c7_f154_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l930_c7_f154_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l930_c7_f154_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l930_c7_f154_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l930_c7_f154]
signal result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_f154_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_f154_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_f154_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_f154_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l930_c7_f154]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_f154_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_f154_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_f154_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_f154_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l930_c7_f154]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_f154_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_f154_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_f154_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_f154_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l930_c7_f154]
signal result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_f154_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_f154_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_f154_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_f154_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l930_c7_f154]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_f154_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_f154_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_f154_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_f154_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l930_c7_f154]
signal result_u8_value_MUX_uxn_opcodes_h_l930_c7_f154_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l930_c7_f154_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l930_c7_f154_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l930_c7_f154_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l930_c7_f154]
signal tmp16_MUX_uxn_opcodes_h_l930_c7_f154_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l930_c7_f154_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l930_c7_f154_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l930_c7_f154_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l931_c3_e512]
signal BIN_OP_OR_uxn_opcodes_h_l931_c3_e512_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l931_c3_e512_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l931_c3_e512_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l932_c11_65ab]
signal BIN_OP_AND_uxn_opcodes_h_l932_c11_65ab_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l932_c11_65ab_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l932_c11_65ab_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l934_c30_26d9]
signal sp_relative_shift_uxn_opcodes_h_l934_c30_26d9_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l934_c30_26d9_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l934_c30_26d9_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l934_c30_26d9_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l939_c11_0e72]
signal BIN_OP_EQ_uxn_opcodes_h_l939_c11_0e72_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l939_c11_0e72_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l939_c11_0e72_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l939_c7_01a0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_01a0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_01a0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_01a0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_01a0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l939_c7_01a0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_01a0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_01a0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_01a0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_01a0_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l939_c7_01a0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_01a0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_01a0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_01a0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_01a0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l939_c7_01a0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_01a0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_01a0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_01a0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_01a0_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l939_c7_01a0]
signal result_u8_value_MUX_uxn_opcodes_h_l939_c7_01a0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l939_c7_01a0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l939_c7_01a0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l939_c7_01a0_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l942_c31_8349]
signal CONST_SR_8_uxn_opcodes_h_l942_c31_8349_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l942_c31_8349_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l944_c11_f0bd]
signal BIN_OP_EQ_uxn_opcodes_h_l944_c11_f0bd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l944_c11_f0bd_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l944_c11_f0bd_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l944_c7_7b4a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_7b4a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_7b4a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_7b4a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_7b4a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l944_c7_7b4a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_7b4a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_7b4a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_7b4a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_7b4a_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l919_l928_DUPLICATE_66a0
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l919_l928_DUPLICATE_66a0_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l919_l928_DUPLICATE_66a0_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_5b93( ref_toks_0 : opcode_result_t;
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
      base.is_stack_write := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.u8_value := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l909_c6_677e
BIN_OP_EQ_uxn_opcodes_h_l909_c6_677e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l909_c6_677e_left,
BIN_OP_EQ_uxn_opcodes_h_l909_c6_677e_right,
BIN_OP_EQ_uxn_opcodes_h_l909_c6_677e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_7b32
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_7b32 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_7b32_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_7b32_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_7b32_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_7b32_return_output);

-- n16_MUX_uxn_opcodes_h_l909_c2_3140
n16_MUX_uxn_opcodes_h_l909_c2_3140 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l909_c2_3140_cond,
n16_MUX_uxn_opcodes_h_l909_c2_3140_iftrue,
n16_MUX_uxn_opcodes_h_l909_c2_3140_iffalse,
n16_MUX_uxn_opcodes_h_l909_c2_3140_return_output);

-- t16_MUX_uxn_opcodes_h_l909_c2_3140
t16_MUX_uxn_opcodes_h_l909_c2_3140 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l909_c2_3140_cond,
t16_MUX_uxn_opcodes_h_l909_c2_3140_iftrue,
t16_MUX_uxn_opcodes_h_l909_c2_3140_iffalse,
t16_MUX_uxn_opcodes_h_l909_c2_3140_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_3140
result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_3140 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_3140_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_3140_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_3140_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_3140_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_3140
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_3140 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_3140_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_3140_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_3140_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_3140_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_3140
result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_3140 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_3140_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_3140_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_3140_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_3140_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_3140
result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_3140 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_3140_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_3140_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_3140_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_3140_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_3140
result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_3140 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_3140_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_3140_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_3140_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_3140_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l909_c2_3140
result_u8_value_MUX_uxn_opcodes_h_l909_c2_3140 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l909_c2_3140_cond,
result_u8_value_MUX_uxn_opcodes_h_l909_c2_3140_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l909_c2_3140_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l909_c2_3140_return_output);

-- tmp16_MUX_uxn_opcodes_h_l909_c2_3140
tmp16_MUX_uxn_opcodes_h_l909_c2_3140 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l909_c2_3140_cond,
tmp16_MUX_uxn_opcodes_h_l909_c2_3140_iftrue,
tmp16_MUX_uxn_opcodes_h_l909_c2_3140_iffalse,
tmp16_MUX_uxn_opcodes_h_l909_c2_3140_return_output);

-- printf_uxn_opcodes_h_l910_c3_e6a0_uxn_opcodes_h_l910_c3_e6a0
printf_uxn_opcodes_h_l910_c3_e6a0_uxn_opcodes_h_l910_c3_e6a0 : entity work.printf_uxn_opcodes_h_l910_c3_e6a0_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l910_c3_e6a0_uxn_opcodes_h_l910_c3_e6a0_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l914_c11_c684
BIN_OP_EQ_uxn_opcodes_h_l914_c11_c684 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l914_c11_c684_left,
BIN_OP_EQ_uxn_opcodes_h_l914_c11_c684_right,
BIN_OP_EQ_uxn_opcodes_h_l914_c11_c684_return_output);

-- n16_MUX_uxn_opcodes_h_l914_c7_3b69
n16_MUX_uxn_opcodes_h_l914_c7_3b69 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l914_c7_3b69_cond,
n16_MUX_uxn_opcodes_h_l914_c7_3b69_iftrue,
n16_MUX_uxn_opcodes_h_l914_c7_3b69_iffalse,
n16_MUX_uxn_opcodes_h_l914_c7_3b69_return_output);

-- t16_MUX_uxn_opcodes_h_l914_c7_3b69
t16_MUX_uxn_opcodes_h_l914_c7_3b69 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l914_c7_3b69_cond,
t16_MUX_uxn_opcodes_h_l914_c7_3b69_iftrue,
t16_MUX_uxn_opcodes_h_l914_c7_3b69_iffalse,
t16_MUX_uxn_opcodes_h_l914_c7_3b69_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_3b69
result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_3b69 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_3b69_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_3b69_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_3b69_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_3b69_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_3b69
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_3b69 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_3b69_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_3b69_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_3b69_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_3b69_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_3b69
result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_3b69 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_3b69_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_3b69_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_3b69_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_3b69_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_3b69
result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_3b69 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_3b69_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_3b69_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_3b69_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_3b69_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_3b69
result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_3b69 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_3b69_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_3b69_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_3b69_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_3b69_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l914_c7_3b69
result_u8_value_MUX_uxn_opcodes_h_l914_c7_3b69 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l914_c7_3b69_cond,
result_u8_value_MUX_uxn_opcodes_h_l914_c7_3b69_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l914_c7_3b69_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l914_c7_3b69_return_output);

-- tmp16_MUX_uxn_opcodes_h_l914_c7_3b69
tmp16_MUX_uxn_opcodes_h_l914_c7_3b69 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l914_c7_3b69_cond,
tmp16_MUX_uxn_opcodes_h_l914_c7_3b69_iftrue,
tmp16_MUX_uxn_opcodes_h_l914_c7_3b69_iffalse,
tmp16_MUX_uxn_opcodes_h_l914_c7_3b69_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l917_c11_6a02
BIN_OP_EQ_uxn_opcodes_h_l917_c11_6a02 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l917_c11_6a02_left,
BIN_OP_EQ_uxn_opcodes_h_l917_c11_6a02_right,
BIN_OP_EQ_uxn_opcodes_h_l917_c11_6a02_return_output);

-- n16_MUX_uxn_opcodes_h_l917_c7_2442
n16_MUX_uxn_opcodes_h_l917_c7_2442 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l917_c7_2442_cond,
n16_MUX_uxn_opcodes_h_l917_c7_2442_iftrue,
n16_MUX_uxn_opcodes_h_l917_c7_2442_iffalse,
n16_MUX_uxn_opcodes_h_l917_c7_2442_return_output);

-- t16_MUX_uxn_opcodes_h_l917_c7_2442
t16_MUX_uxn_opcodes_h_l917_c7_2442 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l917_c7_2442_cond,
t16_MUX_uxn_opcodes_h_l917_c7_2442_iftrue,
t16_MUX_uxn_opcodes_h_l917_c7_2442_iffalse,
t16_MUX_uxn_opcodes_h_l917_c7_2442_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_2442
result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_2442 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_2442_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_2442_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_2442_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_2442_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_2442
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_2442 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_2442_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_2442_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_2442_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_2442_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_2442
result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_2442 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_2442_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_2442_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_2442_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_2442_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_2442
result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_2442 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_2442_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_2442_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_2442_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_2442_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_2442
result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_2442 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_2442_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_2442_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_2442_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_2442_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l917_c7_2442
result_u8_value_MUX_uxn_opcodes_h_l917_c7_2442 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l917_c7_2442_cond,
result_u8_value_MUX_uxn_opcodes_h_l917_c7_2442_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l917_c7_2442_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l917_c7_2442_return_output);

-- tmp16_MUX_uxn_opcodes_h_l917_c7_2442
tmp16_MUX_uxn_opcodes_h_l917_c7_2442 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l917_c7_2442_cond,
tmp16_MUX_uxn_opcodes_h_l917_c7_2442_iftrue,
tmp16_MUX_uxn_opcodes_h_l917_c7_2442_iffalse,
tmp16_MUX_uxn_opcodes_h_l917_c7_2442_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l922_c11_8829
BIN_OP_EQ_uxn_opcodes_h_l922_c11_8829 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l922_c11_8829_left,
BIN_OP_EQ_uxn_opcodes_h_l922_c11_8829_right,
BIN_OP_EQ_uxn_opcodes_h_l922_c11_8829_return_output);

-- n16_MUX_uxn_opcodes_h_l922_c7_0552
n16_MUX_uxn_opcodes_h_l922_c7_0552 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l922_c7_0552_cond,
n16_MUX_uxn_opcodes_h_l922_c7_0552_iftrue,
n16_MUX_uxn_opcodes_h_l922_c7_0552_iffalse,
n16_MUX_uxn_opcodes_h_l922_c7_0552_return_output);

-- t16_MUX_uxn_opcodes_h_l922_c7_0552
t16_MUX_uxn_opcodes_h_l922_c7_0552 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l922_c7_0552_cond,
t16_MUX_uxn_opcodes_h_l922_c7_0552_iftrue,
t16_MUX_uxn_opcodes_h_l922_c7_0552_iffalse,
t16_MUX_uxn_opcodes_h_l922_c7_0552_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_0552
result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_0552 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_0552_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_0552_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_0552_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_0552_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_0552
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_0552 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_0552_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_0552_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_0552_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_0552_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_0552
result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_0552 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_0552_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_0552_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_0552_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_0552_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_0552
result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_0552 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_0552_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_0552_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_0552_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_0552_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_0552
result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_0552 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_0552_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_0552_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_0552_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_0552_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l922_c7_0552
result_u8_value_MUX_uxn_opcodes_h_l922_c7_0552 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l922_c7_0552_cond,
result_u8_value_MUX_uxn_opcodes_h_l922_c7_0552_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l922_c7_0552_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l922_c7_0552_return_output);

-- tmp16_MUX_uxn_opcodes_h_l922_c7_0552
tmp16_MUX_uxn_opcodes_h_l922_c7_0552 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l922_c7_0552_cond,
tmp16_MUX_uxn_opcodes_h_l922_c7_0552_iftrue,
tmp16_MUX_uxn_opcodes_h_l922_c7_0552_iffalse,
tmp16_MUX_uxn_opcodes_h_l922_c7_0552_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l923_c3_932e
BIN_OP_OR_uxn_opcodes_h_l923_c3_932e : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l923_c3_932e_left,
BIN_OP_OR_uxn_opcodes_h_l923_c3_932e_right,
BIN_OP_OR_uxn_opcodes_h_l923_c3_932e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l926_c11_f4ab
BIN_OP_EQ_uxn_opcodes_h_l926_c11_f4ab : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l926_c11_f4ab_left,
BIN_OP_EQ_uxn_opcodes_h_l926_c11_f4ab_right,
BIN_OP_EQ_uxn_opcodes_h_l926_c11_f4ab_return_output);

-- n16_MUX_uxn_opcodes_h_l926_c7_2b4c
n16_MUX_uxn_opcodes_h_l926_c7_2b4c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l926_c7_2b4c_cond,
n16_MUX_uxn_opcodes_h_l926_c7_2b4c_iftrue,
n16_MUX_uxn_opcodes_h_l926_c7_2b4c_iffalse,
n16_MUX_uxn_opcodes_h_l926_c7_2b4c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_2b4c
result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_2b4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_2b4c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_2b4c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_2b4c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_2b4c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_2b4c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_2b4c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_2b4c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_2b4c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_2b4c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_2b4c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_2b4c
result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_2b4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_2b4c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_2b4c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_2b4c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_2b4c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_2b4c
result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_2b4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_2b4c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_2b4c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_2b4c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_2b4c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_2b4c
result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_2b4c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_2b4c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_2b4c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_2b4c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_2b4c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l926_c7_2b4c
result_u8_value_MUX_uxn_opcodes_h_l926_c7_2b4c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l926_c7_2b4c_cond,
result_u8_value_MUX_uxn_opcodes_h_l926_c7_2b4c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l926_c7_2b4c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l926_c7_2b4c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l926_c7_2b4c
tmp16_MUX_uxn_opcodes_h_l926_c7_2b4c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l926_c7_2b4c_cond,
tmp16_MUX_uxn_opcodes_h_l926_c7_2b4c_iftrue,
tmp16_MUX_uxn_opcodes_h_l926_c7_2b4c_iffalse,
tmp16_MUX_uxn_opcodes_h_l926_c7_2b4c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l930_c11_5224
BIN_OP_EQ_uxn_opcodes_h_l930_c11_5224 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l930_c11_5224_left,
BIN_OP_EQ_uxn_opcodes_h_l930_c11_5224_right,
BIN_OP_EQ_uxn_opcodes_h_l930_c11_5224_return_output);

-- n16_MUX_uxn_opcodes_h_l930_c7_f154
n16_MUX_uxn_opcodes_h_l930_c7_f154 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l930_c7_f154_cond,
n16_MUX_uxn_opcodes_h_l930_c7_f154_iftrue,
n16_MUX_uxn_opcodes_h_l930_c7_f154_iffalse,
n16_MUX_uxn_opcodes_h_l930_c7_f154_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_f154
result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_f154 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_f154_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_f154_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_f154_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_f154_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_f154
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_f154 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_f154_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_f154_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_f154_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_f154_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_f154
result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_f154 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_f154_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_f154_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_f154_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_f154_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_f154
result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_f154 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_f154_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_f154_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_f154_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_f154_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_f154
result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_f154 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_f154_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_f154_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_f154_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_f154_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l930_c7_f154
result_u8_value_MUX_uxn_opcodes_h_l930_c7_f154 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l930_c7_f154_cond,
result_u8_value_MUX_uxn_opcodes_h_l930_c7_f154_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l930_c7_f154_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l930_c7_f154_return_output);

-- tmp16_MUX_uxn_opcodes_h_l930_c7_f154
tmp16_MUX_uxn_opcodes_h_l930_c7_f154 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l930_c7_f154_cond,
tmp16_MUX_uxn_opcodes_h_l930_c7_f154_iftrue,
tmp16_MUX_uxn_opcodes_h_l930_c7_f154_iffalse,
tmp16_MUX_uxn_opcodes_h_l930_c7_f154_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l931_c3_e512
BIN_OP_OR_uxn_opcodes_h_l931_c3_e512 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l931_c3_e512_left,
BIN_OP_OR_uxn_opcodes_h_l931_c3_e512_right,
BIN_OP_OR_uxn_opcodes_h_l931_c3_e512_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l932_c11_65ab
BIN_OP_AND_uxn_opcodes_h_l932_c11_65ab : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l932_c11_65ab_left,
BIN_OP_AND_uxn_opcodes_h_l932_c11_65ab_right,
BIN_OP_AND_uxn_opcodes_h_l932_c11_65ab_return_output);

-- sp_relative_shift_uxn_opcodes_h_l934_c30_26d9
sp_relative_shift_uxn_opcodes_h_l934_c30_26d9 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l934_c30_26d9_ins,
sp_relative_shift_uxn_opcodes_h_l934_c30_26d9_x,
sp_relative_shift_uxn_opcodes_h_l934_c30_26d9_y,
sp_relative_shift_uxn_opcodes_h_l934_c30_26d9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l939_c11_0e72
BIN_OP_EQ_uxn_opcodes_h_l939_c11_0e72 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l939_c11_0e72_left,
BIN_OP_EQ_uxn_opcodes_h_l939_c11_0e72_right,
BIN_OP_EQ_uxn_opcodes_h_l939_c11_0e72_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_01a0
result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_01a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_01a0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_01a0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_01a0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_01a0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_01a0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_01a0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_01a0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_01a0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_01a0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_01a0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_01a0
result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_01a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_01a0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_01a0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_01a0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_01a0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_01a0
result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_01a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_01a0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_01a0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_01a0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_01a0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l939_c7_01a0
result_u8_value_MUX_uxn_opcodes_h_l939_c7_01a0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l939_c7_01a0_cond,
result_u8_value_MUX_uxn_opcodes_h_l939_c7_01a0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l939_c7_01a0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l939_c7_01a0_return_output);

-- CONST_SR_8_uxn_opcodes_h_l942_c31_8349
CONST_SR_8_uxn_opcodes_h_l942_c31_8349 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l942_c31_8349_x,
CONST_SR_8_uxn_opcodes_h_l942_c31_8349_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l944_c11_f0bd
BIN_OP_EQ_uxn_opcodes_h_l944_c11_f0bd : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l944_c11_f0bd_left,
BIN_OP_EQ_uxn_opcodes_h_l944_c11_f0bd_right,
BIN_OP_EQ_uxn_opcodes_h_l944_c11_f0bd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_7b4a
result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_7b4a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_7b4a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_7b4a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_7b4a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_7b4a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_7b4a
result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_7b4a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_7b4a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_7b4a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_7b4a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_7b4a_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l919_l928_DUPLICATE_66a0
CONST_SL_8_uint16_t_uxn_opcodes_h_l919_l928_DUPLICATE_66a0 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l919_l928_DUPLICATE_66a0_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l919_l928_DUPLICATE_66a0_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l909_c6_677e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_7b32_return_output,
 n16_MUX_uxn_opcodes_h_l909_c2_3140_return_output,
 t16_MUX_uxn_opcodes_h_l909_c2_3140_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_3140_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_3140_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_3140_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_3140_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_3140_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l909_c2_3140_return_output,
 tmp16_MUX_uxn_opcodes_h_l909_c2_3140_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l914_c11_c684_return_output,
 n16_MUX_uxn_opcodes_h_l914_c7_3b69_return_output,
 t16_MUX_uxn_opcodes_h_l914_c7_3b69_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_3b69_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_3b69_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_3b69_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_3b69_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_3b69_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l914_c7_3b69_return_output,
 tmp16_MUX_uxn_opcodes_h_l914_c7_3b69_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l917_c11_6a02_return_output,
 n16_MUX_uxn_opcodes_h_l917_c7_2442_return_output,
 t16_MUX_uxn_opcodes_h_l917_c7_2442_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_2442_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_2442_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_2442_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_2442_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_2442_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l917_c7_2442_return_output,
 tmp16_MUX_uxn_opcodes_h_l917_c7_2442_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l922_c11_8829_return_output,
 n16_MUX_uxn_opcodes_h_l922_c7_0552_return_output,
 t16_MUX_uxn_opcodes_h_l922_c7_0552_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_0552_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_0552_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_0552_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_0552_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_0552_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l922_c7_0552_return_output,
 tmp16_MUX_uxn_opcodes_h_l922_c7_0552_return_output,
 BIN_OP_OR_uxn_opcodes_h_l923_c3_932e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l926_c11_f4ab_return_output,
 n16_MUX_uxn_opcodes_h_l926_c7_2b4c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_2b4c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_2b4c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_2b4c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_2b4c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_2b4c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l926_c7_2b4c_return_output,
 tmp16_MUX_uxn_opcodes_h_l926_c7_2b4c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l930_c11_5224_return_output,
 n16_MUX_uxn_opcodes_h_l930_c7_f154_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_f154_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_f154_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_f154_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_f154_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_f154_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l930_c7_f154_return_output,
 tmp16_MUX_uxn_opcodes_h_l930_c7_f154_return_output,
 BIN_OP_OR_uxn_opcodes_h_l931_c3_e512_return_output,
 BIN_OP_AND_uxn_opcodes_h_l932_c11_65ab_return_output,
 sp_relative_shift_uxn_opcodes_h_l934_c30_26d9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l939_c11_0e72_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_01a0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_01a0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_01a0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_01a0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l939_c7_01a0_return_output,
 CONST_SR_8_uxn_opcodes_h_l942_c31_8349_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l944_c11_f0bd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_7b4a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_7b4a_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l919_l928_DUPLICATE_66a0_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c6_677e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c6_677e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c6_677e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_7b32_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_7b32_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_7b32_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_7b32_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l909_c2_3140_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l909_c2_3140_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l914_c7_3b69_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l909_c2_3140_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l909_c2_3140_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l909_c2_3140_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l909_c2_3140_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l914_c7_3b69_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l909_c2_3140_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l909_c2_3140_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_3140_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_3140_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_3b69_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_3140_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_3140_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_3140_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l911_c3_248c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_3140_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_3b69_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_3140_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_3140_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_3140_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_3140_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_3b69_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_3140_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_3140_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_3140_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_3140_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_3b69_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_3140_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_3140_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_3140_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_3140_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_3b69_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_3140_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_3140_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l909_c2_3140_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l909_c2_3140_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l914_c7_3b69_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l909_c2_3140_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l909_c2_3140_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l909_c2_3140_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l909_c2_3140_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l914_c7_3b69_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l909_c2_3140_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l909_c2_3140_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l910_c3_e6a0_uxn_opcodes_h_l910_c3_e6a0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_c684_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_c684_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_c684_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l914_c7_3b69_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l914_c7_3b69_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l917_c7_2442_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l914_c7_3b69_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l914_c7_3b69_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l914_c7_3b69_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l917_c7_2442_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l914_c7_3b69_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_3b69_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_3b69_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_2442_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_3b69_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_3b69_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l915_c3_084f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_3b69_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_2442_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_3b69_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_3b69_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_3b69_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_2442_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_3b69_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_3b69_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_3b69_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_2442_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_3b69_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_3b69_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_3b69_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_2442_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_3b69_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l914_c7_3b69_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l914_c7_3b69_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_2442_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l914_c7_3b69_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l914_c7_3b69_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l914_c7_3b69_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l917_c7_2442_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l914_c7_3b69_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_6a02_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_6a02_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_6a02_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l917_c7_2442_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l917_c7_2442_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l922_c7_0552_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l917_c7_2442_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l917_c7_2442_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l917_c7_2442_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l922_c7_0552_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l917_c7_2442_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_2442_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_2442_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_0552_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_2442_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_2442_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l920_c3_998d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_2442_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_0552_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_2442_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_2442_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_2442_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_0552_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_2442_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_2442_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_2442_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_0552_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_2442_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_2442_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_2442_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_0552_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_2442_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_2442_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_2442_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l922_c7_0552_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_2442_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l917_c7_2442_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l917_c7_2442_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l922_c7_0552_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l917_c7_2442_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_8829_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_8829_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_8829_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l922_c7_0552_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l922_c7_0552_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l926_c7_2b4c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l922_c7_0552_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l922_c7_0552_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l922_c7_0552_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l922_c7_0552_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_0552_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_0552_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_2b4c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_0552_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_0552_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l924_c3_711b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_0552_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_2b4c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_0552_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_0552_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_0552_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_2b4c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_0552_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_0552_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_0552_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_2b4c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_0552_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_0552_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_0552_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_2b4c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_0552_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l922_c7_0552_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l922_c7_0552_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l926_c7_2b4c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l922_c7_0552_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l922_c7_0552_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l922_c7_0552_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l926_c7_2b4c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l922_c7_0552_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l923_c3_932e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l923_c3_932e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l923_c3_932e_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_f4ab_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_f4ab_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_f4ab_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l926_c7_2b4c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l926_c7_2b4c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l930_c7_f154_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l926_c7_2b4c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_2b4c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_2b4c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_f154_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_2b4c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_2b4c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_2b4c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_f154_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_2b4c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_2b4c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_2b4c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_f154_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_2b4c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_2b4c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_2b4c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_f154_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_2b4c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_2b4c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_2b4c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_f154_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_2b4c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l926_c7_2b4c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l926_c7_2b4c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l930_c7_f154_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l926_c7_2b4c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l926_c7_2b4c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l926_c7_2b4c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l930_c7_f154_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l926_c7_2b4c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_5224_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_5224_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_5224_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l930_c7_f154_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l930_c7_f154_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l930_c7_f154_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_f154_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_f154_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_01a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_f154_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_f154_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l936_c3_76c7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_f154_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_01a0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_f154_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_f154_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_f154_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_01a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_f154_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_f154_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_f154_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_01a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_f154_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_f154_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_f154_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_f154_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l930_c7_f154_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l930_c7_f154_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c7_01a0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l930_c7_f154_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l930_c7_f154_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l930_c7_f154_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l930_c7_f154_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l931_c3_e512_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l931_c3_e512_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l931_c3_e512_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l932_c11_65ab_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l932_c11_65ab_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l932_c11_65ab_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l934_c30_26d9_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l934_c30_26d9_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l934_c30_26d9_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l934_c30_26d9_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l937_c21_9ca0_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c11_0e72_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c11_0e72_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c11_0e72_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_01a0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_01a0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_7b4a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_01a0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_01a0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l941_c3_d473 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_01a0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_01a0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_01a0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_01a0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_01a0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_01a0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_01a0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_7b4a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_01a0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c7_01a0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c7_01a0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c7_01a0_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l942_c31_8349_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l942_c31_8349_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l942_c21_e079_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_f0bd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_f0bd_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_f0bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_7b4a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_7b4a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_7b4a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_7b4a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_7b4a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_7b4a_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l917_l914_l944_l909_l939_l926_l922_DUPLICATE_6f84_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l917_l914_l909_l939_l926_l922_DUPLICATE_bb50_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l917_l914_l909_l930_l926_l922_DUPLICATE_a92f_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l917_l914_l909_l939_l926_l922_DUPLICATE_376a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l917_l914_l944_l939_l930_l926_l922_DUPLICATE_72c6_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l923_l927_l931_l918_DUPLICATE_bfb2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l919_l928_DUPLICATE_66a0_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l919_l928_DUPLICATE_66a0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l926_l939_DUPLICATE_7c72_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l905_l949_DUPLICATE_fbe3_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c11_0e72_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_5224_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l924_c3_711b := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_0552_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l924_c3_711b;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_3140_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_7b32_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_8829_right := to_unsigned(3, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l934_c30_26d9_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_f4ab_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l936_c3_76c7 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_f154_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l936_c3_76c7;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_7b4a_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l941_c3_d473 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_01a0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l941_c3_d473;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c6_677e_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_f154_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_f0bd_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_6a02_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_c684_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_7b4a_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_01a0_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l911_c3_248c := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_3140_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l911_c3_248c;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l920_c3_998d := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_2442_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l920_c3_998d;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_f154_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l934_c30_26d9_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l915_c3_084f := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_3b69_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l915_c3_084f;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_7b32_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l934_c30_26d9_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l931_c3_e512_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l909_c2_3140_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l914_c7_3b69_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l917_c7_2442_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l922_c7_0552_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l930_c7_f154_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c6_677e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_c684_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_6a02_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_8829_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_f4ab_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_5224_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c11_0e72_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_f0bd_left := VAR_phase;
     VAR_BIN_OP_AND_uxn_opcodes_h_l932_c11_65ab_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l923_c3_932e_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l909_c2_3140_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l914_c7_3b69_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l922_c7_0552_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l942_c31_8349_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l909_c2_3140_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l914_c7_3b69_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l917_c7_2442_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l922_c7_0552_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l926_c7_2b4c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l930_c7_f154_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l922_c11_8829] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l922_c11_8829_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_8829_left;
     BIN_OP_EQ_uxn_opcodes_h_l922_c11_8829_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_8829_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_8829_return_output := BIN_OP_EQ_uxn_opcodes_h_l922_c11_8829_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l926_l939_DUPLICATE_7c72 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l926_l939_DUPLICATE_7c72_return_output := result.stack_address_sp_offset;

     -- CONST_SR_8[uxn_opcodes_h_l942_c31_8349] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l942_c31_8349_x <= VAR_CONST_SR_8_uxn_opcodes_h_l942_c31_8349_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l942_c31_8349_return_output := CONST_SR_8_uxn_opcodes_h_l942_c31_8349_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l930_c11_5224] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l930_c11_5224_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_5224_left;
     BIN_OP_EQ_uxn_opcodes_h_l930_c11_5224_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_5224_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_5224_return_output := BIN_OP_EQ_uxn_opcodes_h_l930_c11_5224_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l939_c11_0e72] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l939_c11_0e72_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c11_0e72_left;
     BIN_OP_EQ_uxn_opcodes_h_l939_c11_0e72_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c11_0e72_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c11_0e72_return_output := BIN_OP_EQ_uxn_opcodes_h_l939_c11_0e72_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l917_c11_6a02] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l917_c11_6a02_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_6a02_left;
     BIN_OP_EQ_uxn_opcodes_h_l917_c11_6a02_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_6a02_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_6a02_return_output := BIN_OP_EQ_uxn_opcodes_h_l917_c11_6a02_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l923_l927_l931_l918_DUPLICATE_bfb2 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l923_l927_l931_l918_DUPLICATE_bfb2_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l917_l914_l909_l939_l926_l922_DUPLICATE_bb50 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l917_l914_l909_l939_l926_l922_DUPLICATE_bb50_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l917_l914_l944_l939_l930_l926_l922_DUPLICATE_72c6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l917_l914_l944_l939_l930_l926_l922_DUPLICATE_72c6_return_output := result.is_opc_done;

     -- sp_relative_shift[uxn_opcodes_h_l934_c30_26d9] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l934_c30_26d9_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l934_c30_26d9_ins;
     sp_relative_shift_uxn_opcodes_h_l934_c30_26d9_x <= VAR_sp_relative_shift_uxn_opcodes_h_l934_c30_26d9_x;
     sp_relative_shift_uxn_opcodes_h_l934_c30_26d9_y <= VAR_sp_relative_shift_uxn_opcodes_h_l934_c30_26d9_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l934_c30_26d9_return_output := sp_relative_shift_uxn_opcodes_h_l934_c30_26d9_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l917_l914_l909_l930_l926_l922_DUPLICATE_a92f LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l917_l914_l909_l930_l926_l922_DUPLICATE_a92f_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l944_c11_f0bd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l944_c11_f0bd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_f0bd_left;
     BIN_OP_EQ_uxn_opcodes_h_l944_c11_f0bd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_f0bd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_f0bd_return_output := BIN_OP_EQ_uxn_opcodes_h_l944_c11_f0bd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l926_c11_f4ab] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l926_c11_f4ab_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_f4ab_left;
     BIN_OP_EQ_uxn_opcodes_h_l926_c11_f4ab_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_f4ab_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_f4ab_return_output := BIN_OP_EQ_uxn_opcodes_h_l926_c11_f4ab_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l917_l914_l909_l939_l926_l922_DUPLICATE_376a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l917_l914_l909_l939_l926_l922_DUPLICATE_376a_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l914_c11_c684] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l914_c11_c684_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_c684_left;
     BIN_OP_EQ_uxn_opcodes_h_l914_c11_c684_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_c684_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_c684_return_output := BIN_OP_EQ_uxn_opcodes_h_l914_c11_c684_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l917_l914_l944_l909_l939_l926_l922_DUPLICATE_6f84 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l917_l914_l944_l909_l939_l926_l922_DUPLICATE_6f84_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l909_c6_677e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l909_c6_677e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c6_677e_left;
     BIN_OP_EQ_uxn_opcodes_h_l909_c6_677e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c6_677e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c6_677e_return_output := BIN_OP_EQ_uxn_opcodes_h_l909_c6_677e_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_7b32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c6_677e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l909_c2_3140_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c6_677e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_3140_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c6_677e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_3140_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c6_677e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_3140_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c6_677e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_3140_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c6_677e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_3140_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c6_677e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l909_c2_3140_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c6_677e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l909_c2_3140_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c6_677e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l909_c2_3140_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c6_677e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l914_c7_3b69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_c684_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_3b69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_c684_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_3b69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_c684_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_3b69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_c684_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_3b69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_c684_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_3b69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_c684_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l914_c7_3b69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_c684_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l914_c7_3b69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_c684_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l914_c7_3b69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_c684_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l917_c7_2442_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_6a02_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_2442_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_6a02_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_2442_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_6a02_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_2442_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_6a02_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_2442_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_6a02_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_2442_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_6a02_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_2442_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_6a02_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l917_c7_2442_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_6a02_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l917_c7_2442_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_6a02_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l922_c7_0552_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_8829_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_0552_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_8829_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_0552_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_8829_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_0552_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_8829_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_0552_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_8829_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_0552_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_8829_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l922_c7_0552_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_8829_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l922_c7_0552_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_8829_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l922_c7_0552_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_8829_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l926_c7_2b4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_f4ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_2b4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_f4ab_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_2b4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_f4ab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_2b4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_f4ab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_2b4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_f4ab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_2b4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_f4ab_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l926_c7_2b4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_f4ab_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l926_c7_2b4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_f4ab_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l930_c7_f154_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_5224_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_f154_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_5224_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_f154_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_5224_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_f154_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_5224_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_f154_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_5224_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_f154_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_5224_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l930_c7_f154_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_5224_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l930_c7_f154_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_5224_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_01a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c11_0e72_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_01a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c11_0e72_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_01a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c11_0e72_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_01a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c11_0e72_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c7_01a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c11_0e72_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_7b4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_f0bd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_7b4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_f0bd_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l923_c3_932e_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l923_l927_l931_l918_DUPLICATE_bfb2_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l931_c3_e512_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l923_l927_l931_l918_DUPLICATE_bfb2_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l919_l928_DUPLICATE_66a0_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l923_l927_l931_l918_DUPLICATE_bfb2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_3140_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l917_l914_l909_l930_l926_l922_DUPLICATE_a92f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_3b69_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l917_l914_l909_l930_l926_l922_DUPLICATE_a92f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_2442_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l917_l914_l909_l930_l926_l922_DUPLICATE_a92f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_0552_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l917_l914_l909_l930_l926_l922_DUPLICATE_a92f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_2b4c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l917_l914_l909_l930_l926_l922_DUPLICATE_a92f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_f154_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l917_l914_l909_l930_l926_l922_DUPLICATE_a92f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_3b69_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l917_l914_l944_l939_l930_l926_l922_DUPLICATE_72c6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_2442_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l917_l914_l944_l939_l930_l926_l922_DUPLICATE_72c6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_0552_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l917_l914_l944_l939_l930_l926_l922_DUPLICATE_72c6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_2b4c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l917_l914_l944_l939_l930_l926_l922_DUPLICATE_72c6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_f154_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l917_l914_l944_l939_l930_l926_l922_DUPLICATE_72c6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_01a0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l917_l914_l944_l939_l930_l926_l922_DUPLICATE_72c6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_7b4a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l917_l914_l944_l939_l930_l926_l922_DUPLICATE_72c6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_3140_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l917_l914_l909_l939_l926_l922_DUPLICATE_bb50_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_3b69_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l917_l914_l909_l939_l926_l922_DUPLICATE_bb50_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_2442_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l917_l914_l909_l939_l926_l922_DUPLICATE_bb50_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_0552_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l917_l914_l909_l939_l926_l922_DUPLICATE_bb50_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_2b4c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l917_l914_l909_l939_l926_l922_DUPLICATE_bb50_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_01a0_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l917_l914_l909_l939_l926_l922_DUPLICATE_bb50_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_3140_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l917_l914_l944_l909_l939_l926_l922_DUPLICATE_6f84_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_3b69_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l917_l914_l944_l909_l939_l926_l922_DUPLICATE_6f84_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_2442_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l917_l914_l944_l909_l939_l926_l922_DUPLICATE_6f84_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_0552_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l917_l914_l944_l909_l939_l926_l922_DUPLICATE_6f84_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_2b4c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l917_l914_l944_l909_l939_l926_l922_DUPLICATE_6f84_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_01a0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l917_l914_l944_l909_l939_l926_l922_DUPLICATE_6f84_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_7b4a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l917_l914_l944_l909_l939_l926_l922_DUPLICATE_6f84_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_2b4c_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l926_l939_DUPLICATE_7c72_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_01a0_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l926_l939_DUPLICATE_7c72_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l909_c2_3140_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l917_l914_l909_l939_l926_l922_DUPLICATE_376a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l914_c7_3b69_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l917_l914_l909_l939_l926_l922_DUPLICATE_376a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_2442_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l917_l914_l909_l939_l926_l922_DUPLICATE_376a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l922_c7_0552_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l917_l914_l909_l939_l926_l922_DUPLICATE_376a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l926_c7_2b4c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l917_l914_l909_l939_l926_l922_DUPLICATE_376a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c7_01a0_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l917_l914_l909_l939_l926_l922_DUPLICATE_376a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_f154_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l934_c30_26d9_return_output;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l942_c21_e079] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l942_c21_e079_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l942_c31_8349_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l944_c7_7b4a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_7b4a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_7b4a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_7b4a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_7b4a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_7b4a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_7b4a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_7b4a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_7b4a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l939_c7_01a0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_01a0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_01a0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_01a0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_01a0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_01a0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_01a0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_01a0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_01a0_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l923_c3_932e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l923_c3_932e_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l923_c3_932e_left;
     BIN_OP_OR_uxn_opcodes_h_l923_c3_932e_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l923_c3_932e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l923_c3_932e_return_output := BIN_OP_OR_uxn_opcodes_h_l923_c3_932e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l909_c1_7b32] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_7b32_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_7b32_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_7b32_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_7b32_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_7b32_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_7b32_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_7b32_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_7b32_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l939_c7_01a0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_01a0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_01a0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_01a0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_01a0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_01a0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_01a0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_01a0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_01a0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l930_c7_f154] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_f154_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_f154_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_f154_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_f154_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_f154_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_f154_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_f154_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_f154_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l944_c7_7b4a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_7b4a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_7b4a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_7b4a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_7b4a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_7b4a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_7b4a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_7b4a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_7b4a_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l919_l928_DUPLICATE_66a0 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l919_l928_DUPLICATE_66a0_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l919_l928_DUPLICATE_66a0_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l919_l928_DUPLICATE_66a0_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l919_l928_DUPLICATE_66a0_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l931_c3_e512] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l931_c3_e512_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l931_c3_e512_left;
     BIN_OP_OR_uxn_opcodes_h_l931_c3_e512_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l931_c3_e512_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l931_c3_e512_return_output := BIN_OP_OR_uxn_opcodes_h_l931_c3_e512_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l922_c7_0552_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l923_c3_932e_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l932_c11_65ab_right := VAR_BIN_OP_OR_uxn_opcodes_h_l931_c3_e512_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l930_c7_f154_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l931_c3_e512_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c7_01a0_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l942_c21_e079_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l926_c7_2b4c_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l919_l928_DUPLICATE_66a0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l917_c7_2442_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l919_l928_DUPLICATE_66a0_return_output;
     VAR_printf_uxn_opcodes_h_l910_c3_e6a0_uxn_opcodes_h_l910_c3_e6a0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_7b32_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_01a0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_7b4a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_f154_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_01a0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_01a0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_7b4a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_2b4c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_f154_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_f154_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_01a0_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l939_c7_01a0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l939_c7_01a0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c7_01a0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l939_c7_01a0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c7_01a0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l939_c7_01a0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c7_01a0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c7_01a0_return_output := result_u8_value_MUX_uxn_opcodes_h_l939_c7_01a0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l930_c7_f154] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_f154_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_f154_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_f154_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_f154_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_f154_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_f154_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_f154_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_f154_return_output;

     -- t16_MUX[uxn_opcodes_h_l922_c7_0552] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l922_c7_0552_cond <= VAR_t16_MUX_uxn_opcodes_h_l922_c7_0552_cond;
     t16_MUX_uxn_opcodes_h_l922_c7_0552_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l922_c7_0552_iftrue;
     t16_MUX_uxn_opcodes_h_l922_c7_0552_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l922_c7_0552_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l922_c7_0552_return_output := t16_MUX_uxn_opcodes_h_l922_c7_0552_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l939_c7_01a0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_01a0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_01a0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_01a0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_01a0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_01a0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_01a0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_01a0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_01a0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l939_c7_01a0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_01a0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_01a0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_01a0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_01a0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_01a0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_01a0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_01a0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_01a0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l926_c7_2b4c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_2b4c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_2b4c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_2b4c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_2b4c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_2b4c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_2b4c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_2b4c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_2b4c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l930_c7_f154] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_f154_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_f154_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_f154_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_f154_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_f154_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_f154_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_f154_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_f154_return_output;

     -- n16_MUX[uxn_opcodes_h_l930_c7_f154] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l930_c7_f154_cond <= VAR_n16_MUX_uxn_opcodes_h_l930_c7_f154_cond;
     n16_MUX_uxn_opcodes_h_l930_c7_f154_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l930_c7_f154_iftrue;
     n16_MUX_uxn_opcodes_h_l930_c7_f154_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l930_c7_f154_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l930_c7_f154_return_output := n16_MUX_uxn_opcodes_h_l930_c7_f154_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l932_c11_65ab] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l932_c11_65ab_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l932_c11_65ab_left;
     BIN_OP_AND_uxn_opcodes_h_l932_c11_65ab_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l932_c11_65ab_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l932_c11_65ab_return_output := BIN_OP_AND_uxn_opcodes_h_l932_c11_65ab_return_output;

     -- printf_uxn_opcodes_h_l910_c3_e6a0[uxn_opcodes_h_l910_c3_e6a0] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l910_c3_e6a0_uxn_opcodes_h_l910_c3_e6a0_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l910_c3_e6a0_uxn_opcodes_h_l910_c3_e6a0_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l930_c7_f154_iftrue := VAR_BIN_OP_AND_uxn_opcodes_h_l932_c11_65ab_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l926_c7_2b4c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l930_c7_f154_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_f154_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_01a0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_2b4c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_f154_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_f154_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_01a0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_0552_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_2b4c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_2b4c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_f154_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l930_c7_f154_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c7_01a0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l917_c7_2442_iffalse := VAR_t16_MUX_uxn_opcodes_h_l922_c7_0552_return_output;
     -- t16_MUX[uxn_opcodes_h_l917_c7_2442] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l917_c7_2442_cond <= VAR_t16_MUX_uxn_opcodes_h_l917_c7_2442_cond;
     t16_MUX_uxn_opcodes_h_l917_c7_2442_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l917_c7_2442_iftrue;
     t16_MUX_uxn_opcodes_h_l917_c7_2442_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l917_c7_2442_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l917_c7_2442_return_output := t16_MUX_uxn_opcodes_h_l917_c7_2442_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l922_c7_0552] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_0552_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_0552_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_0552_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_0552_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_0552_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_0552_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_0552_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_0552_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l930_c7_f154] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_f154_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_f154_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_f154_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_f154_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_f154_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_f154_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_f154_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_f154_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l930_c7_f154] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l930_c7_f154_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l930_c7_f154_cond;
     tmp16_MUX_uxn_opcodes_h_l930_c7_f154_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l930_c7_f154_iftrue;
     tmp16_MUX_uxn_opcodes_h_l930_c7_f154_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l930_c7_f154_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l930_c7_f154_return_output := tmp16_MUX_uxn_opcodes_h_l930_c7_f154_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l937_c21_9ca0] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l937_c21_9ca0_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_AND_uxn_opcodes_h_l932_c11_65ab_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l930_c7_f154] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_f154_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_f154_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_f154_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_f154_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_f154_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_f154_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_f154_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_f154_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l926_c7_2b4c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_2b4c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_2b4c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_2b4c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_2b4c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_2b4c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_2b4c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_2b4c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_2b4c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l926_c7_2b4c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_2b4c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_2b4c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_2b4c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_2b4c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_2b4c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_2b4c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_2b4c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_2b4c_return_output;

     -- n16_MUX[uxn_opcodes_h_l926_c7_2b4c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l926_c7_2b4c_cond <= VAR_n16_MUX_uxn_opcodes_h_l926_c7_2b4c_cond;
     n16_MUX_uxn_opcodes_h_l926_c7_2b4c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l926_c7_2b4c_iftrue;
     n16_MUX_uxn_opcodes_h_l926_c7_2b4c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l926_c7_2b4c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l926_c7_2b4c_return_output := n16_MUX_uxn_opcodes_h_l926_c7_2b4c_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l930_c7_f154_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l937_c21_9ca0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l922_c7_0552_iffalse := VAR_n16_MUX_uxn_opcodes_h_l926_c7_2b4c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_2b4c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_f154_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_0552_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_2b4c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_2b4c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_f154_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_2442_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_0552_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_0552_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_2b4c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l914_c7_3b69_iffalse := VAR_t16_MUX_uxn_opcodes_h_l917_c7_2442_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l926_c7_2b4c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l930_c7_f154_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l926_c7_2b4c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_2b4c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_2b4c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_2b4c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_2b4c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_2b4c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_2b4c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_2b4c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_2b4c_return_output;

     -- n16_MUX[uxn_opcodes_h_l922_c7_0552] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l922_c7_0552_cond <= VAR_n16_MUX_uxn_opcodes_h_l922_c7_0552_cond;
     n16_MUX_uxn_opcodes_h_l922_c7_0552_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l922_c7_0552_iftrue;
     n16_MUX_uxn_opcodes_h_l922_c7_0552_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l922_c7_0552_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l922_c7_0552_return_output := n16_MUX_uxn_opcodes_h_l922_c7_0552_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l922_c7_0552] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_0552_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_0552_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_0552_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_0552_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_0552_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_0552_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_0552_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_0552_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l926_c7_2b4c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_2b4c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_2b4c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_2b4c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_2b4c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_2b4c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_2b4c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_2b4c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_2b4c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l922_c7_0552] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_0552_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_0552_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_0552_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_0552_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_0552_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_0552_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_0552_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_0552_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l926_c7_2b4c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l926_c7_2b4c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l926_c7_2b4c_cond;
     tmp16_MUX_uxn_opcodes_h_l926_c7_2b4c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l926_c7_2b4c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l926_c7_2b4c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l926_c7_2b4c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l926_c7_2b4c_return_output := tmp16_MUX_uxn_opcodes_h_l926_c7_2b4c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l917_c7_2442] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_2442_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_2442_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_2442_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_2442_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_2442_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_2442_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_2442_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_2442_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l930_c7_f154] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l930_c7_f154_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l930_c7_f154_cond;
     result_u8_value_MUX_uxn_opcodes_h_l930_c7_f154_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l930_c7_f154_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l930_c7_f154_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l930_c7_f154_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l930_c7_f154_return_output := result_u8_value_MUX_uxn_opcodes_h_l930_c7_f154_return_output;

     -- t16_MUX[uxn_opcodes_h_l914_c7_3b69] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l914_c7_3b69_cond <= VAR_t16_MUX_uxn_opcodes_h_l914_c7_3b69_cond;
     t16_MUX_uxn_opcodes_h_l914_c7_3b69_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l914_c7_3b69_iftrue;
     t16_MUX_uxn_opcodes_h_l914_c7_3b69_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l914_c7_3b69_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l914_c7_3b69_return_output := t16_MUX_uxn_opcodes_h_l914_c7_3b69_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l917_c7_2442_iffalse := VAR_n16_MUX_uxn_opcodes_h_l922_c7_0552_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_0552_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_2b4c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_2442_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_0552_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_0552_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_2b4c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_3b69_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_2442_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_2442_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_0552_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l926_c7_2b4c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l930_c7_f154_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l909_c2_3140_iffalse := VAR_t16_MUX_uxn_opcodes_h_l914_c7_3b69_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l922_c7_0552_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l926_c7_2b4c_return_output;
     -- t16_MUX[uxn_opcodes_h_l909_c2_3140] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l909_c2_3140_cond <= VAR_t16_MUX_uxn_opcodes_h_l909_c2_3140_cond;
     t16_MUX_uxn_opcodes_h_l909_c2_3140_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l909_c2_3140_iftrue;
     t16_MUX_uxn_opcodes_h_l909_c2_3140_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l909_c2_3140_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l909_c2_3140_return_output := t16_MUX_uxn_opcodes_h_l909_c2_3140_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l922_c7_0552] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_0552_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_0552_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_0552_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_0552_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_0552_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_0552_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_0552_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_0552_return_output;

     -- n16_MUX[uxn_opcodes_h_l917_c7_2442] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l917_c7_2442_cond <= VAR_n16_MUX_uxn_opcodes_h_l917_c7_2442_cond;
     n16_MUX_uxn_opcodes_h_l917_c7_2442_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l917_c7_2442_iftrue;
     n16_MUX_uxn_opcodes_h_l917_c7_2442_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l917_c7_2442_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l917_c7_2442_return_output := n16_MUX_uxn_opcodes_h_l917_c7_2442_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l914_c7_3b69] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_3b69_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_3b69_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_3b69_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_3b69_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_3b69_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_3b69_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_3b69_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_3b69_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l922_c7_0552] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_0552_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_0552_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_0552_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_0552_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_0552_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_0552_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_0552_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_0552_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l922_c7_0552] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l922_c7_0552_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l922_c7_0552_cond;
     tmp16_MUX_uxn_opcodes_h_l922_c7_0552_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l922_c7_0552_iftrue;
     tmp16_MUX_uxn_opcodes_h_l922_c7_0552_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l922_c7_0552_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l922_c7_0552_return_output := tmp16_MUX_uxn_opcodes_h_l922_c7_0552_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l917_c7_2442] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_2442_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_2442_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_2442_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_2442_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_2442_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_2442_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_2442_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_2442_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l917_c7_2442] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_2442_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_2442_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_2442_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_2442_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_2442_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_2442_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_2442_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_2442_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l926_c7_2b4c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l926_c7_2b4c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l926_c7_2b4c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l926_c7_2b4c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l926_c7_2b4c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l926_c7_2b4c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l926_c7_2b4c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l926_c7_2b4c_return_output := result_u8_value_MUX_uxn_opcodes_h_l926_c7_2b4c_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l914_c7_3b69_iffalse := VAR_n16_MUX_uxn_opcodes_h_l917_c7_2442_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_2442_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_0552_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_3b69_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_2442_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_2442_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_0552_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_3140_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_3b69_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_3b69_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_2442_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l922_c7_0552_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l926_c7_2b4c_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l909_c2_3140_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l917_c7_2442_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l922_c7_0552_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l914_c7_3b69] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_3b69_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_3b69_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_3b69_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_3b69_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_3b69_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_3b69_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_3b69_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_3b69_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l917_c7_2442] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l917_c7_2442_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l917_c7_2442_cond;
     tmp16_MUX_uxn_opcodes_h_l917_c7_2442_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l917_c7_2442_iftrue;
     tmp16_MUX_uxn_opcodes_h_l917_c7_2442_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l917_c7_2442_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l917_c7_2442_return_output := tmp16_MUX_uxn_opcodes_h_l917_c7_2442_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l917_c7_2442] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_2442_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_2442_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_2442_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_2442_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_2442_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_2442_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_2442_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_2442_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l914_c7_3b69] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_3b69_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_3b69_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_3b69_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_3b69_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_3b69_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_3b69_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_3b69_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_3b69_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l909_c2_3140] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_3140_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_3140_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_3140_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_3140_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_3140_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_3140_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_3140_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_3140_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l917_c7_2442] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_2442_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_2442_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_2442_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_2442_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_2442_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_2442_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_2442_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_2442_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l922_c7_0552] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l922_c7_0552_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l922_c7_0552_cond;
     result_u8_value_MUX_uxn_opcodes_h_l922_c7_0552_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l922_c7_0552_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l922_c7_0552_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l922_c7_0552_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l922_c7_0552_return_output := result_u8_value_MUX_uxn_opcodes_h_l922_c7_0552_return_output;

     -- n16_MUX[uxn_opcodes_h_l914_c7_3b69] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l914_c7_3b69_cond <= VAR_n16_MUX_uxn_opcodes_h_l914_c7_3b69_cond;
     n16_MUX_uxn_opcodes_h_l914_c7_3b69_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l914_c7_3b69_iftrue;
     n16_MUX_uxn_opcodes_h_l914_c7_3b69_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l914_c7_3b69_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l914_c7_3b69_return_output := n16_MUX_uxn_opcodes_h_l914_c7_3b69_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l909_c2_3140_iffalse := VAR_n16_MUX_uxn_opcodes_h_l914_c7_3b69_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_3b69_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_2442_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_3140_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_3b69_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_3b69_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_2442_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_3140_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_3b69_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_2442_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l922_c7_0552_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l914_c7_3b69_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l917_c7_2442_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l914_c7_3b69] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_3b69_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_3b69_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_3b69_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_3b69_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_3b69_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_3b69_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_3b69_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_3b69_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l909_c2_3140] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_3140_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_3140_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_3140_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_3140_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_3140_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_3140_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_3140_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_3140_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l914_c7_3b69] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_3b69_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_3b69_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_3b69_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_3b69_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_3b69_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_3b69_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_3b69_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_3b69_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l909_c2_3140] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_3140_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_3140_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_3140_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_3140_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_3140_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_3140_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_3140_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_3140_return_output;

     -- n16_MUX[uxn_opcodes_h_l909_c2_3140] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l909_c2_3140_cond <= VAR_n16_MUX_uxn_opcodes_h_l909_c2_3140_cond;
     n16_MUX_uxn_opcodes_h_l909_c2_3140_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l909_c2_3140_iftrue;
     n16_MUX_uxn_opcodes_h_l909_c2_3140_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l909_c2_3140_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l909_c2_3140_return_output := n16_MUX_uxn_opcodes_h_l909_c2_3140_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l917_c7_2442] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l917_c7_2442_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_2442_cond;
     result_u8_value_MUX_uxn_opcodes_h_l917_c7_2442_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_2442_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l917_c7_2442_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_2442_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_2442_return_output := result_u8_value_MUX_uxn_opcodes_h_l917_c7_2442_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l914_c7_3b69] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l914_c7_3b69_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l914_c7_3b69_cond;
     tmp16_MUX_uxn_opcodes_h_l914_c7_3b69_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l914_c7_3b69_iftrue;
     tmp16_MUX_uxn_opcodes_h_l914_c7_3b69_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l914_c7_3b69_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l914_c7_3b69_return_output := tmp16_MUX_uxn_opcodes_h_l914_c7_3b69_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l909_c2_3140_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_3140_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_3b69_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_3140_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_3b69_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l914_c7_3b69_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_2442_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l909_c2_3140_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l914_c7_3b69_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l914_c7_3b69] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l914_c7_3b69_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l914_c7_3b69_cond;
     result_u8_value_MUX_uxn_opcodes_h_l914_c7_3b69_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l914_c7_3b69_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l914_c7_3b69_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l914_c7_3b69_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l914_c7_3b69_return_output := result_u8_value_MUX_uxn_opcodes_h_l914_c7_3b69_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l909_c2_3140] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_3140_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_3140_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_3140_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_3140_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_3140_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_3140_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_3140_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_3140_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l909_c2_3140] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l909_c2_3140_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l909_c2_3140_cond;
     tmp16_MUX_uxn_opcodes_h_l909_c2_3140_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l909_c2_3140_iftrue;
     tmp16_MUX_uxn_opcodes_h_l909_c2_3140_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l909_c2_3140_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l909_c2_3140_return_output := tmp16_MUX_uxn_opcodes_h_l909_c2_3140_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l909_c2_3140] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_3140_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_3140_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_3140_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_3140_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_3140_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_3140_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_3140_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_3140_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l909_c2_3140_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l914_c7_3b69_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l909_c2_3140_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l909_c2_3140] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l909_c2_3140_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l909_c2_3140_cond;
     result_u8_value_MUX_uxn_opcodes_h_l909_c2_3140_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l909_c2_3140_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l909_c2_3140_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l909_c2_3140_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l909_c2_3140_return_output := result_u8_value_MUX_uxn_opcodes_h_l909_c2_3140_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l905_l949_DUPLICATE_fbe3 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l905_l949_DUPLICATE_fbe3_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_5b93(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_3140_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_3140_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_3140_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_3140_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_3140_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l909_c2_3140_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l905_l949_DUPLICATE_fbe3_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l905_l949_DUPLICATE_fbe3_return_output;
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
