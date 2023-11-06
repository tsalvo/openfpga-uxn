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
-- BIN_OP_EQ[uxn_opcodes_h_l909_c6_9f35]
signal BIN_OP_EQ_uxn_opcodes_h_l909_c6_9f35_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l909_c6_9f35_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l909_c6_9f35_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l909_c1_94df]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_94df_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_94df_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_94df_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_94df_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l909_c2_9341]
signal n16_MUX_uxn_opcodes_h_l909_c2_9341_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l909_c2_9341_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l909_c2_9341_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l909_c2_9341_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l909_c2_9341]
signal result_u8_value_MUX_uxn_opcodes_h_l909_c2_9341_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l909_c2_9341_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l909_c2_9341_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l909_c2_9341_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l909_c2_9341]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_9341_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_9341_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_9341_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_9341_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l909_c2_9341]
signal result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_9341_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_9341_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_9341_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_9341_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l909_c2_9341]
signal result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_9341_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_9341_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_9341_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_9341_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l909_c2_9341]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_9341_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_9341_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_9341_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_9341_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l909_c2_9341]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_9341_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_9341_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_9341_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_9341_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l909_c2_9341]
signal t16_MUX_uxn_opcodes_h_l909_c2_9341_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l909_c2_9341_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l909_c2_9341_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l909_c2_9341_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l909_c2_9341]
signal tmp16_MUX_uxn_opcodes_h_l909_c2_9341_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l909_c2_9341_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l909_c2_9341_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l909_c2_9341_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l910_c3_5dcc[uxn_opcodes_h_l910_c3_5dcc]
signal printf_uxn_opcodes_h_l910_c3_5dcc_uxn_opcodes_h_l910_c3_5dcc_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l914_c11_ee02]
signal BIN_OP_EQ_uxn_opcodes_h_l914_c11_ee02_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l914_c11_ee02_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l914_c11_ee02_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l914_c7_826c]
signal n16_MUX_uxn_opcodes_h_l914_c7_826c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l914_c7_826c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l914_c7_826c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l914_c7_826c_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l914_c7_826c]
signal result_u8_value_MUX_uxn_opcodes_h_l914_c7_826c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l914_c7_826c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l914_c7_826c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l914_c7_826c_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l914_c7_826c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_826c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_826c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_826c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_826c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l914_c7_826c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_826c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_826c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_826c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_826c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l914_c7_826c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_826c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_826c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_826c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_826c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l914_c7_826c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_826c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_826c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_826c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_826c_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l914_c7_826c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_826c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_826c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_826c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_826c_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l914_c7_826c]
signal t16_MUX_uxn_opcodes_h_l914_c7_826c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l914_c7_826c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l914_c7_826c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l914_c7_826c_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l914_c7_826c]
signal tmp16_MUX_uxn_opcodes_h_l914_c7_826c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l914_c7_826c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l914_c7_826c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l914_c7_826c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l917_c11_27b4]
signal BIN_OP_EQ_uxn_opcodes_h_l917_c11_27b4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l917_c11_27b4_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l917_c11_27b4_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l917_c7_a954]
signal n16_MUX_uxn_opcodes_h_l917_c7_a954_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l917_c7_a954_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l917_c7_a954_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l917_c7_a954_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l917_c7_a954]
signal result_u8_value_MUX_uxn_opcodes_h_l917_c7_a954_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l917_c7_a954_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l917_c7_a954_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l917_c7_a954_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l917_c7_a954]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_a954_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_a954_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_a954_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_a954_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l917_c7_a954]
signal result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_a954_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_a954_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_a954_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_a954_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l917_c7_a954]
signal result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_a954_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_a954_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_a954_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_a954_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l917_c7_a954]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_a954_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_a954_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_a954_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_a954_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l917_c7_a954]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_a954_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_a954_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_a954_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_a954_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l917_c7_a954]
signal t16_MUX_uxn_opcodes_h_l917_c7_a954_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l917_c7_a954_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l917_c7_a954_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l917_c7_a954_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l917_c7_a954]
signal tmp16_MUX_uxn_opcodes_h_l917_c7_a954_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l917_c7_a954_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l917_c7_a954_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l917_c7_a954_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l922_c11_80d1]
signal BIN_OP_EQ_uxn_opcodes_h_l922_c11_80d1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l922_c11_80d1_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l922_c11_80d1_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l922_c7_c7bd]
signal n16_MUX_uxn_opcodes_h_l922_c7_c7bd_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l922_c7_c7bd_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l922_c7_c7bd_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l922_c7_c7bd_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l922_c7_c7bd]
signal result_u8_value_MUX_uxn_opcodes_h_l922_c7_c7bd_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l922_c7_c7bd_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l922_c7_c7bd_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l922_c7_c7bd_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l922_c7_c7bd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_c7bd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_c7bd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_c7bd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_c7bd_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l922_c7_c7bd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_c7bd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_c7bd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_c7bd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_c7bd_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l922_c7_c7bd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_c7bd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_c7bd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_c7bd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_c7bd_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l922_c7_c7bd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_c7bd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_c7bd_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_c7bd_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_c7bd_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l922_c7_c7bd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_c7bd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_c7bd_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_c7bd_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_c7bd_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l922_c7_c7bd]
signal t16_MUX_uxn_opcodes_h_l922_c7_c7bd_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l922_c7_c7bd_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l922_c7_c7bd_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l922_c7_c7bd_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l922_c7_c7bd]
signal tmp16_MUX_uxn_opcodes_h_l922_c7_c7bd_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l922_c7_c7bd_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l922_c7_c7bd_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l922_c7_c7bd_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l923_c3_a221]
signal BIN_OP_OR_uxn_opcodes_h_l923_c3_a221_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l923_c3_a221_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l923_c3_a221_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l926_c11_2ea1]
signal BIN_OP_EQ_uxn_opcodes_h_l926_c11_2ea1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l926_c11_2ea1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l926_c11_2ea1_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l926_c7_723a]
signal n16_MUX_uxn_opcodes_h_l926_c7_723a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l926_c7_723a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l926_c7_723a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l926_c7_723a_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l926_c7_723a]
signal result_u8_value_MUX_uxn_opcodes_h_l926_c7_723a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l926_c7_723a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l926_c7_723a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l926_c7_723a_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l926_c7_723a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_723a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_723a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_723a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_723a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l926_c7_723a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_723a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_723a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_723a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_723a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l926_c7_723a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_723a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_723a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_723a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_723a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l926_c7_723a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_723a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_723a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_723a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_723a_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l926_c7_723a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_723a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_723a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_723a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_723a_return_output : signed(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l926_c7_723a]
signal tmp16_MUX_uxn_opcodes_h_l926_c7_723a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l926_c7_723a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l926_c7_723a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l926_c7_723a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l930_c11_c7f8]
signal BIN_OP_EQ_uxn_opcodes_h_l930_c11_c7f8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l930_c11_c7f8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l930_c11_c7f8_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l930_c7_e5e3]
signal n16_MUX_uxn_opcodes_h_l930_c7_e5e3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l930_c7_e5e3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l930_c7_e5e3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l930_c7_e5e3_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l930_c7_e5e3]
signal result_u8_value_MUX_uxn_opcodes_h_l930_c7_e5e3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l930_c7_e5e3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l930_c7_e5e3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l930_c7_e5e3_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l930_c7_e5e3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_e5e3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_e5e3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_e5e3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_e5e3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l930_c7_e5e3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_e5e3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_e5e3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_e5e3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_e5e3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l930_c7_e5e3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_e5e3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_e5e3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_e5e3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_e5e3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l930_c7_e5e3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_e5e3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_e5e3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_e5e3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_e5e3_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l930_c7_e5e3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_e5e3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_e5e3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_e5e3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_e5e3_return_output : signed(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l930_c7_e5e3]
signal tmp16_MUX_uxn_opcodes_h_l930_c7_e5e3_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l930_c7_e5e3_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l930_c7_e5e3_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l930_c7_e5e3_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l931_c3_575a]
signal BIN_OP_OR_uxn_opcodes_h_l931_c3_575a_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l931_c3_575a_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l931_c3_575a_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l932_c11_9060]
signal BIN_OP_AND_uxn_opcodes_h_l932_c11_9060_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l932_c11_9060_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l932_c11_9060_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l934_c30_36da]
signal sp_relative_shift_uxn_opcodes_h_l934_c30_36da_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l934_c30_36da_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l934_c30_36da_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l934_c30_36da_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l939_c11_810f]
signal BIN_OP_EQ_uxn_opcodes_h_l939_c11_810f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l939_c11_810f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l939_c11_810f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l939_c7_249b]
signal result_u8_value_MUX_uxn_opcodes_h_l939_c7_249b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l939_c7_249b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l939_c7_249b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l939_c7_249b_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l939_c7_249b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_249b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_249b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_249b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_249b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l939_c7_249b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_249b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_249b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_249b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_249b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l939_c7_249b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_249b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_249b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_249b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_249b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l939_c7_249b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_249b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_249b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_249b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_249b_return_output : unsigned(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l942_c31_9e10]
signal CONST_SR_8_uxn_opcodes_h_l942_c31_9e10_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l942_c31_9e10_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l944_c11_3c1e]
signal BIN_OP_EQ_uxn_opcodes_h_l944_c11_3c1e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l944_c11_3c1e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l944_c11_3c1e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l944_c7_8c72]
signal result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_8c72_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_8c72_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_8c72_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_8c72_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l944_c7_8c72]
signal result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_8c72_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_8c72_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_8c72_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_8c72_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l919_l928_DUPLICATE_b245
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l919_l928_DUPLICATE_b245_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l919_l928_DUPLICATE_b245_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l909_c6_9f35
BIN_OP_EQ_uxn_opcodes_h_l909_c6_9f35 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l909_c6_9f35_left,
BIN_OP_EQ_uxn_opcodes_h_l909_c6_9f35_right,
BIN_OP_EQ_uxn_opcodes_h_l909_c6_9f35_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_94df
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_94df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_94df_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_94df_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_94df_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_94df_return_output);

-- n16_MUX_uxn_opcodes_h_l909_c2_9341
n16_MUX_uxn_opcodes_h_l909_c2_9341 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l909_c2_9341_cond,
n16_MUX_uxn_opcodes_h_l909_c2_9341_iftrue,
n16_MUX_uxn_opcodes_h_l909_c2_9341_iffalse,
n16_MUX_uxn_opcodes_h_l909_c2_9341_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l909_c2_9341
result_u8_value_MUX_uxn_opcodes_h_l909_c2_9341 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l909_c2_9341_cond,
result_u8_value_MUX_uxn_opcodes_h_l909_c2_9341_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l909_c2_9341_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l909_c2_9341_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_9341
result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_9341 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_9341_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_9341_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_9341_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_9341_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_9341
result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_9341 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_9341_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_9341_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_9341_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_9341_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_9341
result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_9341 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_9341_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_9341_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_9341_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_9341_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_9341
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_9341 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_9341_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_9341_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_9341_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_9341_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_9341
result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_9341 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_9341_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_9341_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_9341_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_9341_return_output);

-- t16_MUX_uxn_opcodes_h_l909_c2_9341
t16_MUX_uxn_opcodes_h_l909_c2_9341 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l909_c2_9341_cond,
t16_MUX_uxn_opcodes_h_l909_c2_9341_iftrue,
t16_MUX_uxn_opcodes_h_l909_c2_9341_iffalse,
t16_MUX_uxn_opcodes_h_l909_c2_9341_return_output);

-- tmp16_MUX_uxn_opcodes_h_l909_c2_9341
tmp16_MUX_uxn_opcodes_h_l909_c2_9341 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l909_c2_9341_cond,
tmp16_MUX_uxn_opcodes_h_l909_c2_9341_iftrue,
tmp16_MUX_uxn_opcodes_h_l909_c2_9341_iffalse,
tmp16_MUX_uxn_opcodes_h_l909_c2_9341_return_output);

-- printf_uxn_opcodes_h_l910_c3_5dcc_uxn_opcodes_h_l910_c3_5dcc
printf_uxn_opcodes_h_l910_c3_5dcc_uxn_opcodes_h_l910_c3_5dcc : entity work.printf_uxn_opcodes_h_l910_c3_5dcc_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l910_c3_5dcc_uxn_opcodes_h_l910_c3_5dcc_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l914_c11_ee02
BIN_OP_EQ_uxn_opcodes_h_l914_c11_ee02 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l914_c11_ee02_left,
BIN_OP_EQ_uxn_opcodes_h_l914_c11_ee02_right,
BIN_OP_EQ_uxn_opcodes_h_l914_c11_ee02_return_output);

-- n16_MUX_uxn_opcodes_h_l914_c7_826c
n16_MUX_uxn_opcodes_h_l914_c7_826c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l914_c7_826c_cond,
n16_MUX_uxn_opcodes_h_l914_c7_826c_iftrue,
n16_MUX_uxn_opcodes_h_l914_c7_826c_iffalse,
n16_MUX_uxn_opcodes_h_l914_c7_826c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l914_c7_826c
result_u8_value_MUX_uxn_opcodes_h_l914_c7_826c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l914_c7_826c_cond,
result_u8_value_MUX_uxn_opcodes_h_l914_c7_826c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l914_c7_826c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l914_c7_826c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_826c
result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_826c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_826c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_826c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_826c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_826c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_826c
result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_826c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_826c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_826c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_826c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_826c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_826c
result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_826c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_826c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_826c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_826c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_826c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_826c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_826c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_826c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_826c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_826c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_826c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_826c
result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_826c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_826c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_826c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_826c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_826c_return_output);

-- t16_MUX_uxn_opcodes_h_l914_c7_826c
t16_MUX_uxn_opcodes_h_l914_c7_826c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l914_c7_826c_cond,
t16_MUX_uxn_opcodes_h_l914_c7_826c_iftrue,
t16_MUX_uxn_opcodes_h_l914_c7_826c_iffalse,
t16_MUX_uxn_opcodes_h_l914_c7_826c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l914_c7_826c
tmp16_MUX_uxn_opcodes_h_l914_c7_826c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l914_c7_826c_cond,
tmp16_MUX_uxn_opcodes_h_l914_c7_826c_iftrue,
tmp16_MUX_uxn_opcodes_h_l914_c7_826c_iffalse,
tmp16_MUX_uxn_opcodes_h_l914_c7_826c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l917_c11_27b4
BIN_OP_EQ_uxn_opcodes_h_l917_c11_27b4 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l917_c11_27b4_left,
BIN_OP_EQ_uxn_opcodes_h_l917_c11_27b4_right,
BIN_OP_EQ_uxn_opcodes_h_l917_c11_27b4_return_output);

-- n16_MUX_uxn_opcodes_h_l917_c7_a954
n16_MUX_uxn_opcodes_h_l917_c7_a954 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l917_c7_a954_cond,
n16_MUX_uxn_opcodes_h_l917_c7_a954_iftrue,
n16_MUX_uxn_opcodes_h_l917_c7_a954_iffalse,
n16_MUX_uxn_opcodes_h_l917_c7_a954_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l917_c7_a954
result_u8_value_MUX_uxn_opcodes_h_l917_c7_a954 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l917_c7_a954_cond,
result_u8_value_MUX_uxn_opcodes_h_l917_c7_a954_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l917_c7_a954_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l917_c7_a954_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_a954
result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_a954 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_a954_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_a954_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_a954_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_a954_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_a954
result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_a954 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_a954_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_a954_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_a954_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_a954_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_a954
result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_a954 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_a954_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_a954_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_a954_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_a954_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_a954
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_a954 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_a954_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_a954_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_a954_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_a954_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_a954
result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_a954 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_a954_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_a954_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_a954_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_a954_return_output);

-- t16_MUX_uxn_opcodes_h_l917_c7_a954
t16_MUX_uxn_opcodes_h_l917_c7_a954 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l917_c7_a954_cond,
t16_MUX_uxn_opcodes_h_l917_c7_a954_iftrue,
t16_MUX_uxn_opcodes_h_l917_c7_a954_iffalse,
t16_MUX_uxn_opcodes_h_l917_c7_a954_return_output);

-- tmp16_MUX_uxn_opcodes_h_l917_c7_a954
tmp16_MUX_uxn_opcodes_h_l917_c7_a954 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l917_c7_a954_cond,
tmp16_MUX_uxn_opcodes_h_l917_c7_a954_iftrue,
tmp16_MUX_uxn_opcodes_h_l917_c7_a954_iffalse,
tmp16_MUX_uxn_opcodes_h_l917_c7_a954_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l922_c11_80d1
BIN_OP_EQ_uxn_opcodes_h_l922_c11_80d1 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l922_c11_80d1_left,
BIN_OP_EQ_uxn_opcodes_h_l922_c11_80d1_right,
BIN_OP_EQ_uxn_opcodes_h_l922_c11_80d1_return_output);

-- n16_MUX_uxn_opcodes_h_l922_c7_c7bd
n16_MUX_uxn_opcodes_h_l922_c7_c7bd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l922_c7_c7bd_cond,
n16_MUX_uxn_opcodes_h_l922_c7_c7bd_iftrue,
n16_MUX_uxn_opcodes_h_l922_c7_c7bd_iffalse,
n16_MUX_uxn_opcodes_h_l922_c7_c7bd_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l922_c7_c7bd
result_u8_value_MUX_uxn_opcodes_h_l922_c7_c7bd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l922_c7_c7bd_cond,
result_u8_value_MUX_uxn_opcodes_h_l922_c7_c7bd_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l922_c7_c7bd_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l922_c7_c7bd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_c7bd
result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_c7bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_c7bd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_c7bd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_c7bd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_c7bd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_c7bd
result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_c7bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_c7bd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_c7bd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_c7bd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_c7bd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_c7bd
result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_c7bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_c7bd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_c7bd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_c7bd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_c7bd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_c7bd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_c7bd : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_c7bd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_c7bd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_c7bd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_c7bd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_c7bd
result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_c7bd : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_c7bd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_c7bd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_c7bd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_c7bd_return_output);

-- t16_MUX_uxn_opcodes_h_l922_c7_c7bd
t16_MUX_uxn_opcodes_h_l922_c7_c7bd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l922_c7_c7bd_cond,
t16_MUX_uxn_opcodes_h_l922_c7_c7bd_iftrue,
t16_MUX_uxn_opcodes_h_l922_c7_c7bd_iffalse,
t16_MUX_uxn_opcodes_h_l922_c7_c7bd_return_output);

-- tmp16_MUX_uxn_opcodes_h_l922_c7_c7bd
tmp16_MUX_uxn_opcodes_h_l922_c7_c7bd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l922_c7_c7bd_cond,
tmp16_MUX_uxn_opcodes_h_l922_c7_c7bd_iftrue,
tmp16_MUX_uxn_opcodes_h_l922_c7_c7bd_iffalse,
tmp16_MUX_uxn_opcodes_h_l922_c7_c7bd_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l923_c3_a221
BIN_OP_OR_uxn_opcodes_h_l923_c3_a221 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l923_c3_a221_left,
BIN_OP_OR_uxn_opcodes_h_l923_c3_a221_right,
BIN_OP_OR_uxn_opcodes_h_l923_c3_a221_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l926_c11_2ea1
BIN_OP_EQ_uxn_opcodes_h_l926_c11_2ea1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l926_c11_2ea1_left,
BIN_OP_EQ_uxn_opcodes_h_l926_c11_2ea1_right,
BIN_OP_EQ_uxn_opcodes_h_l926_c11_2ea1_return_output);

-- n16_MUX_uxn_opcodes_h_l926_c7_723a
n16_MUX_uxn_opcodes_h_l926_c7_723a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l926_c7_723a_cond,
n16_MUX_uxn_opcodes_h_l926_c7_723a_iftrue,
n16_MUX_uxn_opcodes_h_l926_c7_723a_iffalse,
n16_MUX_uxn_opcodes_h_l926_c7_723a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l926_c7_723a
result_u8_value_MUX_uxn_opcodes_h_l926_c7_723a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l926_c7_723a_cond,
result_u8_value_MUX_uxn_opcodes_h_l926_c7_723a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l926_c7_723a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l926_c7_723a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_723a
result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_723a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_723a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_723a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_723a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_723a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_723a
result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_723a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_723a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_723a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_723a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_723a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_723a
result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_723a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_723a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_723a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_723a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_723a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_723a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_723a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_723a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_723a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_723a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_723a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_723a
result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_723a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_723a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_723a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_723a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_723a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l926_c7_723a
tmp16_MUX_uxn_opcodes_h_l926_c7_723a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l926_c7_723a_cond,
tmp16_MUX_uxn_opcodes_h_l926_c7_723a_iftrue,
tmp16_MUX_uxn_opcodes_h_l926_c7_723a_iffalse,
tmp16_MUX_uxn_opcodes_h_l926_c7_723a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l930_c11_c7f8
BIN_OP_EQ_uxn_opcodes_h_l930_c11_c7f8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l930_c11_c7f8_left,
BIN_OP_EQ_uxn_opcodes_h_l930_c11_c7f8_right,
BIN_OP_EQ_uxn_opcodes_h_l930_c11_c7f8_return_output);

-- n16_MUX_uxn_opcodes_h_l930_c7_e5e3
n16_MUX_uxn_opcodes_h_l930_c7_e5e3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l930_c7_e5e3_cond,
n16_MUX_uxn_opcodes_h_l930_c7_e5e3_iftrue,
n16_MUX_uxn_opcodes_h_l930_c7_e5e3_iffalse,
n16_MUX_uxn_opcodes_h_l930_c7_e5e3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l930_c7_e5e3
result_u8_value_MUX_uxn_opcodes_h_l930_c7_e5e3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l930_c7_e5e3_cond,
result_u8_value_MUX_uxn_opcodes_h_l930_c7_e5e3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l930_c7_e5e3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l930_c7_e5e3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_e5e3
result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_e5e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_e5e3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_e5e3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_e5e3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_e5e3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_e5e3
result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_e5e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_e5e3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_e5e3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_e5e3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_e5e3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_e5e3
result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_e5e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_e5e3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_e5e3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_e5e3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_e5e3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_e5e3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_e5e3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_e5e3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_e5e3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_e5e3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_e5e3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_e5e3
result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_e5e3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_e5e3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_e5e3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_e5e3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_e5e3_return_output);

-- tmp16_MUX_uxn_opcodes_h_l930_c7_e5e3
tmp16_MUX_uxn_opcodes_h_l930_c7_e5e3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l930_c7_e5e3_cond,
tmp16_MUX_uxn_opcodes_h_l930_c7_e5e3_iftrue,
tmp16_MUX_uxn_opcodes_h_l930_c7_e5e3_iffalse,
tmp16_MUX_uxn_opcodes_h_l930_c7_e5e3_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l931_c3_575a
BIN_OP_OR_uxn_opcodes_h_l931_c3_575a : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l931_c3_575a_left,
BIN_OP_OR_uxn_opcodes_h_l931_c3_575a_right,
BIN_OP_OR_uxn_opcodes_h_l931_c3_575a_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l932_c11_9060
BIN_OP_AND_uxn_opcodes_h_l932_c11_9060 : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l932_c11_9060_left,
BIN_OP_AND_uxn_opcodes_h_l932_c11_9060_right,
BIN_OP_AND_uxn_opcodes_h_l932_c11_9060_return_output);

-- sp_relative_shift_uxn_opcodes_h_l934_c30_36da
sp_relative_shift_uxn_opcodes_h_l934_c30_36da : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l934_c30_36da_ins,
sp_relative_shift_uxn_opcodes_h_l934_c30_36da_x,
sp_relative_shift_uxn_opcodes_h_l934_c30_36da_y,
sp_relative_shift_uxn_opcodes_h_l934_c30_36da_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l939_c11_810f
BIN_OP_EQ_uxn_opcodes_h_l939_c11_810f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l939_c11_810f_left,
BIN_OP_EQ_uxn_opcodes_h_l939_c11_810f_right,
BIN_OP_EQ_uxn_opcodes_h_l939_c11_810f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l939_c7_249b
result_u8_value_MUX_uxn_opcodes_h_l939_c7_249b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l939_c7_249b_cond,
result_u8_value_MUX_uxn_opcodes_h_l939_c7_249b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l939_c7_249b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l939_c7_249b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_249b
result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_249b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_249b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_249b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_249b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_249b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_249b
result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_249b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_249b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_249b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_249b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_249b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_249b
result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_249b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_249b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_249b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_249b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_249b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_249b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_249b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_249b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_249b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_249b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_249b_return_output);

-- CONST_SR_8_uxn_opcodes_h_l942_c31_9e10
CONST_SR_8_uxn_opcodes_h_l942_c31_9e10 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l942_c31_9e10_x,
CONST_SR_8_uxn_opcodes_h_l942_c31_9e10_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l944_c11_3c1e
BIN_OP_EQ_uxn_opcodes_h_l944_c11_3c1e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l944_c11_3c1e_left,
BIN_OP_EQ_uxn_opcodes_h_l944_c11_3c1e_right,
BIN_OP_EQ_uxn_opcodes_h_l944_c11_3c1e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_8c72
result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_8c72 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_8c72_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_8c72_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_8c72_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_8c72_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_8c72
result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_8c72 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_8c72_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_8c72_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_8c72_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_8c72_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l919_l928_DUPLICATE_b245
CONST_SL_8_uint16_t_uxn_opcodes_h_l919_l928_DUPLICATE_b245 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l919_l928_DUPLICATE_b245_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l919_l928_DUPLICATE_b245_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l909_c6_9f35_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_94df_return_output,
 n16_MUX_uxn_opcodes_h_l909_c2_9341_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l909_c2_9341_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_9341_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_9341_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_9341_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_9341_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_9341_return_output,
 t16_MUX_uxn_opcodes_h_l909_c2_9341_return_output,
 tmp16_MUX_uxn_opcodes_h_l909_c2_9341_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l914_c11_ee02_return_output,
 n16_MUX_uxn_opcodes_h_l914_c7_826c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l914_c7_826c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_826c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_826c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_826c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_826c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_826c_return_output,
 t16_MUX_uxn_opcodes_h_l914_c7_826c_return_output,
 tmp16_MUX_uxn_opcodes_h_l914_c7_826c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l917_c11_27b4_return_output,
 n16_MUX_uxn_opcodes_h_l917_c7_a954_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l917_c7_a954_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_a954_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_a954_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_a954_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_a954_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_a954_return_output,
 t16_MUX_uxn_opcodes_h_l917_c7_a954_return_output,
 tmp16_MUX_uxn_opcodes_h_l917_c7_a954_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l922_c11_80d1_return_output,
 n16_MUX_uxn_opcodes_h_l922_c7_c7bd_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l922_c7_c7bd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_c7bd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_c7bd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_c7bd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_c7bd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_c7bd_return_output,
 t16_MUX_uxn_opcodes_h_l922_c7_c7bd_return_output,
 tmp16_MUX_uxn_opcodes_h_l922_c7_c7bd_return_output,
 BIN_OP_OR_uxn_opcodes_h_l923_c3_a221_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l926_c11_2ea1_return_output,
 n16_MUX_uxn_opcodes_h_l926_c7_723a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l926_c7_723a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_723a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_723a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_723a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_723a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_723a_return_output,
 tmp16_MUX_uxn_opcodes_h_l926_c7_723a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l930_c11_c7f8_return_output,
 n16_MUX_uxn_opcodes_h_l930_c7_e5e3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l930_c7_e5e3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_e5e3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_e5e3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_e5e3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_e5e3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_e5e3_return_output,
 tmp16_MUX_uxn_opcodes_h_l930_c7_e5e3_return_output,
 BIN_OP_OR_uxn_opcodes_h_l931_c3_575a_return_output,
 BIN_OP_AND_uxn_opcodes_h_l932_c11_9060_return_output,
 sp_relative_shift_uxn_opcodes_h_l934_c30_36da_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l939_c11_810f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l939_c7_249b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_249b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_249b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_249b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_249b_return_output,
 CONST_SR_8_uxn_opcodes_h_l942_c31_9e10_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l944_c11_3c1e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_8c72_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_8c72_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l919_l928_DUPLICATE_b245_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c6_9f35_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c6_9f35_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c6_9f35_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_94df_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_94df_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_94df_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_94df_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l909_c2_9341_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l909_c2_9341_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l914_c7_826c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l909_c2_9341_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l909_c2_9341_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l909_c2_9341_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l909_c2_9341_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l914_c7_826c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l909_c2_9341_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l909_c2_9341_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_9341_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_9341_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_826c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_9341_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_9341_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_9341_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_9341_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_826c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_9341_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_9341_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_9341_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_9341_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_826c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_9341_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_9341_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_9341_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l911_c3_19cb : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_9341_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_826c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_9341_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_9341_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_9341_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_9341_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_826c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_9341_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_9341_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l909_c2_9341_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l909_c2_9341_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l914_c7_826c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l909_c2_9341_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l909_c2_9341_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l909_c2_9341_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l909_c2_9341_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l914_c7_826c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l909_c2_9341_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l909_c2_9341_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l910_c3_5dcc_uxn_opcodes_h_l910_c3_5dcc_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_ee02_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_ee02_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_ee02_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l914_c7_826c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l914_c7_826c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l917_c7_a954_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l914_c7_826c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l914_c7_826c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l914_c7_826c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_a954_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l914_c7_826c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_826c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_826c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_a954_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_826c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_826c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_826c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_a954_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_826c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_826c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_826c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_a954_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_826c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_826c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l915_c3_d8a7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_826c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_a954_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_826c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_826c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_826c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_a954_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_826c_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l914_c7_826c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l914_c7_826c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l917_c7_a954_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l914_c7_826c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l914_c7_826c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l914_c7_826c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l917_c7_a954_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l914_c7_826c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_27b4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_27b4_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_27b4_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l917_c7_a954_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l917_c7_a954_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l922_c7_c7bd_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l917_c7_a954_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_a954_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_a954_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l922_c7_c7bd_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_a954_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_a954_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_a954_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_c7bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_a954_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_a954_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_a954_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_c7bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_a954_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_a954_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_a954_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_c7bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_a954_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_a954_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l920_c3_b770 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_a954_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_c7bd_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_a954_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_a954_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_a954_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_c7bd_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_a954_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l917_c7_a954_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l917_c7_a954_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l922_c7_c7bd_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l917_c7_a954_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l917_c7_a954_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l917_c7_a954_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l922_c7_c7bd_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l917_c7_a954_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_80d1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_80d1_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_80d1_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l922_c7_c7bd_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l922_c7_c7bd_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l926_c7_723a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l922_c7_c7bd_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l922_c7_c7bd_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l922_c7_c7bd_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l926_c7_723a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l922_c7_c7bd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_c7bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_c7bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_723a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_c7bd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_c7bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_c7bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_723a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_c7bd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_c7bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_c7bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_723a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_c7bd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_c7bd_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l924_c3_2091 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_c7bd_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_723a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_c7bd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_c7bd_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_c7bd_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_723a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_c7bd_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l922_c7_c7bd_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l922_c7_c7bd_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l922_c7_c7bd_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l922_c7_c7bd_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l922_c7_c7bd_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l926_c7_723a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l922_c7_c7bd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l923_c3_a221_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l923_c3_a221_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l923_c3_a221_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_2ea1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_2ea1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_2ea1_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l926_c7_723a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l926_c7_723a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l930_c7_e5e3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l926_c7_723a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l926_c7_723a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l926_c7_723a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l930_c7_e5e3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l926_c7_723a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_723a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_723a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_e5e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_723a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_723a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_723a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_e5e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_723a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_723a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_723a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_e5e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_723a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_723a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_723a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_e5e3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_723a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_723a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_723a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_e5e3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_723a_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l926_c7_723a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l926_c7_723a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l930_c7_e5e3_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l926_c7_723a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_c7f8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_c7f8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_c7f8_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l930_c7_e5e3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l930_c7_e5e3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l930_c7_e5e3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l930_c7_e5e3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l930_c7_e5e3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c7_249b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l930_c7_e5e3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_e5e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_e5e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_249b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_e5e3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_e5e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_e5e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_249b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_e5e3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_e5e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_e5e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_249b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_e5e3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_e5e3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l936_c3_41e8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_e5e3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_249b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_e5e3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_e5e3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_e5e3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_e5e3_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l930_c7_e5e3_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l930_c7_e5e3_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l930_c7_e5e3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l931_c3_575a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l931_c3_575a_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l931_c3_575a_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l932_c11_9060_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l932_c11_9060_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l932_c11_9060_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l934_c30_36da_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l934_c30_36da_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l934_c30_36da_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l934_c30_36da_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l937_c21_8ed9_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c11_810f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c11_810f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c11_810f_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c7_249b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c7_249b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c7_249b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_249b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_249b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_249b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_249b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_249b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_8c72_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_249b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_249b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_249b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_8c72_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_249b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_249b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l941_c3_04c8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_249b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_249b_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l942_c31_9e10_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l942_c31_9e10_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l942_c21_70f1_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_3c1e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_3c1e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_3c1e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_8c72_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_8c72_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_8c72_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_8c72_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_8c72_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_8c72_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l922_l917_l914_l909_l939_l926_DUPLICATE_fd30_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l922_l917_l914_l909_l939_l926_DUPLICATE_a573_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l922_l917_l914_l944_l909_l939_l926_DUPLICATE_8b53_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l922_l917_l914_l909_l930_l926_DUPLICATE_8d3c_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l922_l917_l914_l944_l939_l930_l926_DUPLICATE_3fb3_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l923_l931_l918_l927_DUPLICATE_ef55_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l919_l928_DUPLICATE_b245_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l919_l928_DUPLICATE_b245_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l939_l926_DUPLICATE_a4f5_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l949_l905_DUPLICATE_cdc5_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_3c1e_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_c7f8_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_80d1_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l941_c3_04c8 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_249b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l941_c3_04c8;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_249b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_2ea1_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l924_c3_2091 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_c7bd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l924_c3_2091;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_94df_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_27b4_right := to_unsigned(2, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l934_c30_36da_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_ee02_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_8c72_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_8c72_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_9341_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l911_c3_19cb := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_9341_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l911_c3_19cb;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c11_810f_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l936_c3_41e8 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_e5e3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l936_c3_41e8;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l920_c3_b770 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_a954_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l920_c3_b770;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l915_c3_d8a7 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_826c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l915_c3_d8a7;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c6_9f35_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_e5e3_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_e5e3_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l934_c30_36da_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_94df_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l934_c30_36da_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l931_c3_575a_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l909_c2_9341_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l914_c7_826c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l917_c7_a954_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l922_c7_c7bd_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l930_c7_e5e3_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c6_9f35_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_ee02_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_27b4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_80d1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_2ea1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_c7f8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c11_810f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_3c1e_left := VAR_phase;
     VAR_BIN_OP_AND_uxn_opcodes_h_l932_c11_9060_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l923_c3_a221_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l909_c2_9341_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l914_c7_826c_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l922_c7_c7bd_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l942_c31_9e10_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l909_c2_9341_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l914_c7_826c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l917_c7_a954_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l922_c7_c7bd_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l926_c7_723a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l930_c7_e5e3_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l922_c11_80d1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l922_c11_80d1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_80d1_left;
     BIN_OP_EQ_uxn_opcodes_h_l922_c11_80d1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_80d1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_80d1_return_output := BIN_OP_EQ_uxn_opcodes_h_l922_c11_80d1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l930_c11_c7f8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l930_c11_c7f8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_c7f8_left;
     BIN_OP_EQ_uxn_opcodes_h_l930_c11_c7f8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_c7f8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_c7f8_return_output := BIN_OP_EQ_uxn_opcodes_h_l930_c11_c7f8_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l922_l917_l914_l909_l939_l926_DUPLICATE_fd30 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l922_l917_l914_l909_l939_l926_DUPLICATE_fd30_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l914_c11_ee02] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l914_c11_ee02_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_ee02_left;
     BIN_OP_EQ_uxn_opcodes_h_l914_c11_ee02_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_ee02_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_ee02_return_output := BIN_OP_EQ_uxn_opcodes_h_l914_c11_ee02_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l944_c11_3c1e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l944_c11_3c1e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_3c1e_left;
     BIN_OP_EQ_uxn_opcodes_h_l944_c11_3c1e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_3c1e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_3c1e_return_output := BIN_OP_EQ_uxn_opcodes_h_l944_c11_3c1e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l917_c11_27b4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l917_c11_27b4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_27b4_left;
     BIN_OP_EQ_uxn_opcodes_h_l917_c11_27b4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_27b4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_27b4_return_output := BIN_OP_EQ_uxn_opcodes_h_l917_c11_27b4_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l923_l931_l918_l927_DUPLICATE_ef55 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l923_l931_l918_l927_DUPLICATE_ef55_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l939_l926_DUPLICATE_a4f5 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l939_l926_DUPLICATE_a4f5_return_output := result.stack_address_sp_offset;

     -- sp_relative_shift[uxn_opcodes_h_l934_c30_36da] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l934_c30_36da_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l934_c30_36da_ins;
     sp_relative_shift_uxn_opcodes_h_l934_c30_36da_x <= VAR_sp_relative_shift_uxn_opcodes_h_l934_c30_36da_x;
     sp_relative_shift_uxn_opcodes_h_l934_c30_36da_y <= VAR_sp_relative_shift_uxn_opcodes_h_l934_c30_36da_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l934_c30_36da_return_output := sp_relative_shift_uxn_opcodes_h_l934_c30_36da_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l939_c11_810f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l939_c11_810f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c11_810f_left;
     BIN_OP_EQ_uxn_opcodes_h_l939_c11_810f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c11_810f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c11_810f_return_output := BIN_OP_EQ_uxn_opcodes_h_l939_c11_810f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l909_c6_9f35] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l909_c6_9f35_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c6_9f35_left;
     BIN_OP_EQ_uxn_opcodes_h_l909_c6_9f35_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c6_9f35_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c6_9f35_return_output := BIN_OP_EQ_uxn_opcodes_h_l909_c6_9f35_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l922_l917_l914_l909_l939_l926_DUPLICATE_a573 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l922_l917_l914_l909_l939_l926_DUPLICATE_a573_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l926_c11_2ea1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l926_c11_2ea1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_2ea1_left;
     BIN_OP_EQ_uxn_opcodes_h_l926_c11_2ea1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_2ea1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_2ea1_return_output := BIN_OP_EQ_uxn_opcodes_h_l926_c11_2ea1_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l942_c31_9e10] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l942_c31_9e10_x <= VAR_CONST_SR_8_uxn_opcodes_h_l942_c31_9e10_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l942_c31_9e10_return_output := CONST_SR_8_uxn_opcodes_h_l942_c31_9e10_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l922_l917_l914_l944_l939_l930_l926_DUPLICATE_3fb3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l922_l917_l914_l944_l939_l930_l926_DUPLICATE_3fb3_return_output := result.is_opc_done;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l922_l917_l914_l909_l930_l926_DUPLICATE_8d3c LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l922_l917_l914_l909_l930_l926_DUPLICATE_8d3c_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l922_l917_l914_l944_l909_l939_l926_DUPLICATE_8b53 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l922_l917_l914_l944_l909_l939_l926_DUPLICATE_8b53_return_output := result.is_stack_write;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_94df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c6_9f35_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l909_c2_9341_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c6_9f35_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_9341_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c6_9f35_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_9341_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c6_9f35_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_9341_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c6_9f35_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_9341_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c6_9f35_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_9341_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c6_9f35_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l909_c2_9341_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c6_9f35_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l909_c2_9341_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c6_9f35_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l909_c2_9341_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c6_9f35_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l914_c7_826c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_ee02_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_826c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_ee02_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_826c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_ee02_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_826c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_ee02_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_826c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_ee02_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_826c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_ee02_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l914_c7_826c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_ee02_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l914_c7_826c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_ee02_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l914_c7_826c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_ee02_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l917_c7_a954_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_27b4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_a954_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_27b4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_a954_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_27b4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_a954_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_27b4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_a954_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_27b4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_a954_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_27b4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_a954_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_27b4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l917_c7_a954_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_27b4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l917_c7_a954_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_27b4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l922_c7_c7bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_80d1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_c7bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_80d1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_c7bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_80d1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_c7bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_80d1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_c7bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_80d1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_c7bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_80d1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l922_c7_c7bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_80d1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l922_c7_c7bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_80d1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l922_c7_c7bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_80d1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l926_c7_723a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_2ea1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_723a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_2ea1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_723a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_2ea1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_723a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_2ea1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_723a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_2ea1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_723a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_2ea1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l926_c7_723a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_2ea1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l926_c7_723a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l926_c11_2ea1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l930_c7_e5e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_c7f8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_e5e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_c7f8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_e5e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_c7f8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_e5e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_c7f8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_e5e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_c7f8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_e5e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_c7f8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l930_c7_e5e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_c7f8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l930_c7_e5e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c11_c7f8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_249b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c11_810f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_249b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c11_810f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_249b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c11_810f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_249b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c11_810f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c7_249b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c11_810f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_8c72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_3c1e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_8c72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_3c1e_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l923_c3_a221_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l923_l931_l918_l927_DUPLICATE_ef55_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l931_c3_575a_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l923_l931_l918_l927_DUPLICATE_ef55_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l919_l928_DUPLICATE_b245_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l923_l931_l918_l927_DUPLICATE_ef55_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_9341_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l922_l917_l914_l909_l930_l926_DUPLICATE_8d3c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_826c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l922_l917_l914_l909_l930_l926_DUPLICATE_8d3c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_a954_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l922_l917_l914_l909_l930_l926_DUPLICATE_8d3c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_c7bd_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l922_l917_l914_l909_l930_l926_DUPLICATE_8d3c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_723a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l922_l917_l914_l909_l930_l926_DUPLICATE_8d3c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_e5e3_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l922_l917_l914_l909_l930_l926_DUPLICATE_8d3c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_826c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l922_l917_l914_l944_l939_l930_l926_DUPLICATE_3fb3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_a954_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l922_l917_l914_l944_l939_l930_l926_DUPLICATE_3fb3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_c7bd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l922_l917_l914_l944_l939_l930_l926_DUPLICATE_3fb3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_723a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l922_l917_l914_l944_l939_l930_l926_DUPLICATE_3fb3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_e5e3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l922_l917_l914_l944_l939_l930_l926_DUPLICATE_3fb3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_249b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l922_l917_l914_l944_l939_l930_l926_DUPLICATE_3fb3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_8c72_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l922_l917_l914_l944_l939_l930_l926_DUPLICATE_3fb3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_9341_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l922_l917_l914_l909_l939_l926_DUPLICATE_a573_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_826c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l922_l917_l914_l909_l939_l926_DUPLICATE_a573_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_a954_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l922_l917_l914_l909_l939_l926_DUPLICATE_a573_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_c7bd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l922_l917_l914_l909_l939_l926_DUPLICATE_a573_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_723a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l922_l917_l914_l909_l939_l926_DUPLICATE_a573_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_249b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l922_l917_l914_l909_l939_l926_DUPLICATE_a573_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_9341_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l922_l917_l914_l944_l909_l939_l926_DUPLICATE_8b53_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_826c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l922_l917_l914_l944_l909_l939_l926_DUPLICATE_8b53_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_a954_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l922_l917_l914_l944_l909_l939_l926_DUPLICATE_8b53_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_c7bd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l922_l917_l914_l944_l909_l939_l926_DUPLICATE_8b53_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_723a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l922_l917_l914_l944_l909_l939_l926_DUPLICATE_8b53_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_249b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l922_l917_l914_l944_l909_l939_l926_DUPLICATE_8b53_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_8c72_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l922_l917_l914_l944_l909_l939_l926_DUPLICATE_8b53_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_723a_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l939_l926_DUPLICATE_a4f5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_249b_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l939_l926_DUPLICATE_a4f5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l909_c2_9341_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l922_l917_l914_l909_l939_l926_DUPLICATE_fd30_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l914_c7_826c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l922_l917_l914_l909_l939_l926_DUPLICATE_fd30_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_a954_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l922_l917_l914_l909_l939_l926_DUPLICATE_fd30_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l922_c7_c7bd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l922_l917_l914_l909_l939_l926_DUPLICATE_fd30_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l926_c7_723a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l922_l917_l914_l909_l939_l926_DUPLICATE_fd30_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c7_249b_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l922_l917_l914_l909_l939_l926_DUPLICATE_fd30_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_e5e3_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l934_c30_36da_return_output;
     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l919_l928_DUPLICATE_b245 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l919_l928_DUPLICATE_b245_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l919_l928_DUPLICATE_b245_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l919_l928_DUPLICATE_b245_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l919_l928_DUPLICATE_b245_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l923_c3_a221] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l923_c3_a221_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l923_c3_a221_left;
     BIN_OP_OR_uxn_opcodes_h_l923_c3_a221_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l923_c3_a221_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l923_c3_a221_return_output := BIN_OP_OR_uxn_opcodes_h_l923_c3_a221_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l942_c21_70f1] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l942_c21_70f1_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l942_c31_9e10_return_output);

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l930_c7_e5e3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_e5e3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_e5e3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_e5e3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_e5e3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_e5e3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_e5e3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_e5e3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_e5e3_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l909_c1_94df] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_94df_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_94df_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_94df_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_94df_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_94df_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_94df_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_94df_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_94df_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l939_c7_249b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_249b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_249b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_249b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_249b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_249b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_249b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_249b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_249b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l939_c7_249b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_249b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_249b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_249b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_249b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_249b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_249b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_249b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_249b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l944_c7_8c72] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_8c72_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_8c72_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_8c72_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_8c72_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_8c72_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_8c72_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_8c72_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_8c72_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l944_c7_8c72] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_8c72_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_8c72_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_8c72_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_8c72_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_8c72_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_8c72_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_8c72_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_8c72_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l931_c3_575a] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l931_c3_575a_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l931_c3_575a_left;
     BIN_OP_OR_uxn_opcodes_h_l931_c3_575a_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l931_c3_575a_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l931_c3_575a_return_output := BIN_OP_OR_uxn_opcodes_h_l931_c3_575a_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l922_c7_c7bd_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l923_c3_a221_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l932_c11_9060_right := VAR_BIN_OP_OR_uxn_opcodes_h_l931_c3_575a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l930_c7_e5e3_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l931_c3_575a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c7_249b_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l942_c21_70f1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l926_c7_723a_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l919_l928_DUPLICATE_b245_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l917_c7_a954_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l919_l928_DUPLICATE_b245_return_output;
     VAR_printf_uxn_opcodes_h_l910_c3_5dcc_uxn_opcodes_h_l910_c3_5dcc_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l909_c1_94df_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_249b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_8c72_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_e5e3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_249b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_249b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_8c72_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_723a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c7_e5e3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_e5e3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_249b_return_output;
     -- n16_MUX[uxn_opcodes_h_l930_c7_e5e3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l930_c7_e5e3_cond <= VAR_n16_MUX_uxn_opcodes_h_l930_c7_e5e3_cond;
     n16_MUX_uxn_opcodes_h_l930_c7_e5e3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l930_c7_e5e3_iftrue;
     n16_MUX_uxn_opcodes_h_l930_c7_e5e3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l930_c7_e5e3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l930_c7_e5e3_return_output := n16_MUX_uxn_opcodes_h_l930_c7_e5e3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l930_c7_e5e3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_e5e3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_e5e3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_e5e3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_e5e3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_e5e3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_e5e3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_e5e3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_e5e3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l930_c7_e5e3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_e5e3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_e5e3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_e5e3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_e5e3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_e5e3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_e5e3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_e5e3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_e5e3_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l932_c11_9060] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l932_c11_9060_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l932_c11_9060_left;
     BIN_OP_AND_uxn_opcodes_h_l932_c11_9060_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l932_c11_9060_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l932_c11_9060_return_output := BIN_OP_AND_uxn_opcodes_h_l932_c11_9060_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l939_c7_249b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_249b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_249b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_249b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_249b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_249b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_249b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_249b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_249b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l939_c7_249b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_249b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_249b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_249b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_249b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_249b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_249b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_249b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_249b_return_output;

     -- t16_MUX[uxn_opcodes_h_l922_c7_c7bd] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l922_c7_c7bd_cond <= VAR_t16_MUX_uxn_opcodes_h_l922_c7_c7bd_cond;
     t16_MUX_uxn_opcodes_h_l922_c7_c7bd_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l922_c7_c7bd_iftrue;
     t16_MUX_uxn_opcodes_h_l922_c7_c7bd_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l922_c7_c7bd_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l922_c7_c7bd_return_output := t16_MUX_uxn_opcodes_h_l922_c7_c7bd_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l939_c7_249b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l939_c7_249b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c7_249b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l939_c7_249b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c7_249b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l939_c7_249b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c7_249b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c7_249b_return_output := result_u8_value_MUX_uxn_opcodes_h_l939_c7_249b_return_output;

     -- printf_uxn_opcodes_h_l910_c3_5dcc[uxn_opcodes_h_l910_c3_5dcc] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l910_c3_5dcc_uxn_opcodes_h_l910_c3_5dcc_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l910_c3_5dcc_uxn_opcodes_h_l910_c3_5dcc_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l926_c7_723a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_723a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_723a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_723a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_723a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_723a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_723a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_723a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_723a_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l930_c7_e5e3_iftrue := VAR_BIN_OP_AND_uxn_opcodes_h_l932_c11_9060_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l926_c7_723a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l930_c7_e5e3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_e5e3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_249b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_723a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c7_e5e3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_e5e3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_249b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_c7bd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l926_c7_723a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_723a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c7_e5e3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l930_c7_e5e3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c7_249b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l917_c7_a954_iffalse := VAR_t16_MUX_uxn_opcodes_h_l922_c7_c7bd_return_output;
     -- n16_MUX[uxn_opcodes_h_l926_c7_723a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l926_c7_723a_cond <= VAR_n16_MUX_uxn_opcodes_h_l926_c7_723a_cond;
     n16_MUX_uxn_opcodes_h_l926_c7_723a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l926_c7_723a_iftrue;
     n16_MUX_uxn_opcodes_h_l926_c7_723a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l926_c7_723a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l926_c7_723a_return_output := n16_MUX_uxn_opcodes_h_l926_c7_723a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l922_c7_c7bd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_c7bd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_c7bd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_c7bd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_c7bd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_c7bd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_c7bd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_c7bd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_c7bd_return_output;

     -- t16_MUX[uxn_opcodes_h_l917_c7_a954] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l917_c7_a954_cond <= VAR_t16_MUX_uxn_opcodes_h_l917_c7_a954_cond;
     t16_MUX_uxn_opcodes_h_l917_c7_a954_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l917_c7_a954_iftrue;
     t16_MUX_uxn_opcodes_h_l917_c7_a954_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l917_c7_a954_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l917_c7_a954_return_output := t16_MUX_uxn_opcodes_h_l917_c7_a954_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l937_c21_8ed9] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l937_c21_8ed9_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_AND_uxn_opcodes_h_l932_c11_9060_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l930_c7_e5e3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_e5e3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_e5e3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_e5e3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_e5e3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_e5e3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_e5e3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_e5e3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_e5e3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l926_c7_723a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_723a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_723a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_723a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_723a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_723a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_723a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_723a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_723a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l930_c7_e5e3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_e5e3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_e5e3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_e5e3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_e5e3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_e5e3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_e5e3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_e5e3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_e5e3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l926_c7_723a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_723a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_723a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_723a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_723a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_723a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_723a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_723a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_723a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l930_c7_e5e3] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l930_c7_e5e3_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l930_c7_e5e3_cond;
     tmp16_MUX_uxn_opcodes_h_l930_c7_e5e3_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l930_c7_e5e3_iftrue;
     tmp16_MUX_uxn_opcodes_h_l930_c7_e5e3_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l930_c7_e5e3_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l930_c7_e5e3_return_output := tmp16_MUX_uxn_opcodes_h_l930_c7_e5e3_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l930_c7_e5e3_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l937_c21_8ed9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l922_c7_c7bd_iffalse := VAR_n16_MUX_uxn_opcodes_h_l926_c7_723a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_723a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c7_e5e3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_c7bd_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l926_c7_723a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_723a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c7_e5e3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_a954_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_c7bd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_c7bd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l926_c7_723a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l914_c7_826c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l917_c7_a954_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l926_c7_723a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l930_c7_e5e3_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l926_c7_723a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_723a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_723a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_723a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_723a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_723a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_723a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_723a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_723a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l926_c7_723a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l926_c7_723a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l926_c7_723a_cond;
     tmp16_MUX_uxn_opcodes_h_l926_c7_723a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l926_c7_723a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l926_c7_723a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l926_c7_723a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l926_c7_723a_return_output := tmp16_MUX_uxn_opcodes_h_l926_c7_723a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l922_c7_c7bd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_c7bd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_c7bd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_c7bd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_c7bd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_c7bd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_c7bd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_c7bd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_c7bd_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l930_c7_e5e3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l930_c7_e5e3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l930_c7_e5e3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l930_c7_e5e3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l930_c7_e5e3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l930_c7_e5e3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l930_c7_e5e3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l930_c7_e5e3_return_output := result_u8_value_MUX_uxn_opcodes_h_l930_c7_e5e3_return_output;

     -- n16_MUX[uxn_opcodes_h_l922_c7_c7bd] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l922_c7_c7bd_cond <= VAR_n16_MUX_uxn_opcodes_h_l922_c7_c7bd_cond;
     n16_MUX_uxn_opcodes_h_l922_c7_c7bd_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l922_c7_c7bd_iftrue;
     n16_MUX_uxn_opcodes_h_l922_c7_c7bd_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l922_c7_c7bd_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l922_c7_c7bd_return_output := n16_MUX_uxn_opcodes_h_l922_c7_c7bd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l917_c7_a954] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_a954_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_a954_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_a954_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_a954_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_a954_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_a954_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_a954_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_a954_return_output;

     -- t16_MUX[uxn_opcodes_h_l914_c7_826c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l914_c7_826c_cond <= VAR_t16_MUX_uxn_opcodes_h_l914_c7_826c_cond;
     t16_MUX_uxn_opcodes_h_l914_c7_826c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l914_c7_826c_iftrue;
     t16_MUX_uxn_opcodes_h_l914_c7_826c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l914_c7_826c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l914_c7_826c_return_output := t16_MUX_uxn_opcodes_h_l914_c7_826c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l922_c7_c7bd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_c7bd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_c7bd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_c7bd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_c7bd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_c7bd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_c7bd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_c7bd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_c7bd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l926_c7_723a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_723a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_723a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_723a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_723a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_723a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_723a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_723a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_723a_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l917_c7_a954_iffalse := VAR_n16_MUX_uxn_opcodes_h_l922_c7_c7bd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_c7bd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l926_c7_723a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_a954_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_c7bd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_c7bd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l926_c7_723a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_826c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_a954_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_a954_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_c7bd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l926_c7_723a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l930_c7_e5e3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l909_c2_9341_iffalse := VAR_t16_MUX_uxn_opcodes_h_l914_c7_826c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l922_c7_c7bd_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l926_c7_723a_return_output;
     -- t16_MUX[uxn_opcodes_h_l909_c2_9341] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l909_c2_9341_cond <= VAR_t16_MUX_uxn_opcodes_h_l909_c2_9341_cond;
     t16_MUX_uxn_opcodes_h_l909_c2_9341_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l909_c2_9341_iftrue;
     t16_MUX_uxn_opcodes_h_l909_c2_9341_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l909_c2_9341_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l909_c2_9341_return_output := t16_MUX_uxn_opcodes_h_l909_c2_9341_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l922_c7_c7bd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_c7bd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_c7bd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_c7bd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_c7bd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_c7bd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_c7bd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_c7bd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_c7bd_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l922_c7_c7bd] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l922_c7_c7bd_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l922_c7_c7bd_cond;
     tmp16_MUX_uxn_opcodes_h_l922_c7_c7bd_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l922_c7_c7bd_iftrue;
     tmp16_MUX_uxn_opcodes_h_l922_c7_c7bd_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l922_c7_c7bd_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l922_c7_c7bd_return_output := tmp16_MUX_uxn_opcodes_h_l922_c7_c7bd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l914_c7_826c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_826c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_826c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_826c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_826c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_826c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_826c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_826c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_826c_return_output;

     -- n16_MUX[uxn_opcodes_h_l917_c7_a954] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l917_c7_a954_cond <= VAR_n16_MUX_uxn_opcodes_h_l917_c7_a954_cond;
     n16_MUX_uxn_opcodes_h_l917_c7_a954_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l917_c7_a954_iftrue;
     n16_MUX_uxn_opcodes_h_l917_c7_a954_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l917_c7_a954_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l917_c7_a954_return_output := n16_MUX_uxn_opcodes_h_l917_c7_a954_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l917_c7_a954] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_a954_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_a954_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_a954_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_a954_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_a954_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_a954_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_a954_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_a954_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l922_c7_c7bd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_c7bd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_c7bd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_c7bd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_c7bd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_c7bd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_c7bd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_c7bd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_c7bd_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l926_c7_723a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l926_c7_723a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l926_c7_723a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l926_c7_723a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l926_c7_723a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l926_c7_723a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l926_c7_723a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l926_c7_723a_return_output := result_u8_value_MUX_uxn_opcodes_h_l926_c7_723a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l917_c7_a954] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_a954_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_a954_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_a954_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_a954_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_a954_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_a954_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_a954_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_a954_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l914_c7_826c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l917_c7_a954_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_a954_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_c7bd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_826c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l917_c7_a954_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_a954_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_c7bd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_9341_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_826c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_826c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_a954_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l922_c7_c7bd_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l926_c7_723a_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l909_c2_9341_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l917_c7_a954_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l922_c7_c7bd_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l914_c7_826c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_826c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_826c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_826c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_826c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_826c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_826c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_826c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_826c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l917_c7_a954] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_a954_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_a954_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_a954_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_a954_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_a954_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_a954_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_a954_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_a954_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l914_c7_826c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_826c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_826c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_826c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_826c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_826c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_826c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_826c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_826c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l917_c7_a954] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l917_c7_a954_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l917_c7_a954_cond;
     tmp16_MUX_uxn_opcodes_h_l917_c7_a954_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l917_c7_a954_iftrue;
     tmp16_MUX_uxn_opcodes_h_l917_c7_a954_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l917_c7_a954_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l917_c7_a954_return_output := tmp16_MUX_uxn_opcodes_h_l917_c7_a954_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l909_c2_9341] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_9341_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_9341_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_9341_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_9341_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_9341_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_9341_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_9341_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_9341_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l917_c7_a954] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_a954_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_a954_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_a954_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_a954_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_a954_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_a954_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_a954_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_a954_return_output;

     -- n16_MUX[uxn_opcodes_h_l914_c7_826c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l914_c7_826c_cond <= VAR_n16_MUX_uxn_opcodes_h_l914_c7_826c_cond;
     n16_MUX_uxn_opcodes_h_l914_c7_826c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l914_c7_826c_iftrue;
     n16_MUX_uxn_opcodes_h_l914_c7_826c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l914_c7_826c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l914_c7_826c_return_output := n16_MUX_uxn_opcodes_h_l914_c7_826c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l922_c7_c7bd] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l922_c7_c7bd_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l922_c7_c7bd_cond;
     result_u8_value_MUX_uxn_opcodes_h_l922_c7_c7bd_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l922_c7_c7bd_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l922_c7_c7bd_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l922_c7_c7bd_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l922_c7_c7bd_return_output := result_u8_value_MUX_uxn_opcodes_h_l922_c7_c7bd_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l909_c2_9341_iffalse := VAR_n16_MUX_uxn_opcodes_h_l914_c7_826c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_826c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_a954_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_9341_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_826c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_826c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_a954_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_9341_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_826c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_a954_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l922_c7_c7bd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l914_c7_826c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l917_c7_a954_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l914_c7_826c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_826c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_826c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_826c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_826c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_826c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_826c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_826c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_826c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l917_c7_a954] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l917_c7_a954_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_a954_cond;
     result_u8_value_MUX_uxn_opcodes_h_l917_c7_a954_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_a954_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l917_c7_a954_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_a954_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_a954_return_output := result_u8_value_MUX_uxn_opcodes_h_l917_c7_a954_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l909_c2_9341] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_9341_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_9341_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_9341_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_9341_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_9341_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_9341_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_9341_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_9341_return_output;

     -- n16_MUX[uxn_opcodes_h_l909_c2_9341] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l909_c2_9341_cond <= VAR_n16_MUX_uxn_opcodes_h_l909_c2_9341_cond;
     n16_MUX_uxn_opcodes_h_l909_c2_9341_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l909_c2_9341_iftrue;
     n16_MUX_uxn_opcodes_h_l909_c2_9341_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l909_c2_9341_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l909_c2_9341_return_output := n16_MUX_uxn_opcodes_h_l909_c2_9341_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l909_c2_9341] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_9341_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_9341_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_9341_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_9341_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_9341_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_9341_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_9341_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_9341_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l914_c7_826c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l914_c7_826c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l914_c7_826c_cond;
     tmp16_MUX_uxn_opcodes_h_l914_c7_826c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l914_c7_826c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l914_c7_826c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l914_c7_826c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l914_c7_826c_return_output := tmp16_MUX_uxn_opcodes_h_l914_c7_826c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l914_c7_826c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_826c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_826c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_826c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_826c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_826c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_826c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_826c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_826c_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l909_c2_9341_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_9341_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_826c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_9341_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_826c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l914_c7_826c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_a954_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l909_c2_9341_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l914_c7_826c_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l909_c2_9341] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_9341_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_9341_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_9341_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_9341_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_9341_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_9341_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_9341_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_9341_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l914_c7_826c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l914_c7_826c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l914_c7_826c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l914_c7_826c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l914_c7_826c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l914_c7_826c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l914_c7_826c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l914_c7_826c_return_output := result_u8_value_MUX_uxn_opcodes_h_l914_c7_826c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l909_c2_9341] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_9341_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_9341_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_9341_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_9341_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_9341_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_9341_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_9341_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_9341_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l909_c2_9341] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l909_c2_9341_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l909_c2_9341_cond;
     tmp16_MUX_uxn_opcodes_h_l909_c2_9341_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l909_c2_9341_iftrue;
     tmp16_MUX_uxn_opcodes_h_l909_c2_9341_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l909_c2_9341_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l909_c2_9341_return_output := tmp16_MUX_uxn_opcodes_h_l909_c2_9341_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l909_c2_9341_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l914_c7_826c_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l909_c2_9341_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l909_c2_9341] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l909_c2_9341_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l909_c2_9341_cond;
     result_u8_value_MUX_uxn_opcodes_h_l909_c2_9341_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l909_c2_9341_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l909_c2_9341_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l909_c2_9341_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l909_c2_9341_return_output := result_u8_value_MUX_uxn_opcodes_h_l909_c2_9341_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l949_l905_DUPLICATE_cdc5 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l949_l905_DUPLICATE_cdc5_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l909_c2_9341_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c2_9341_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c2_9341_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c2_9341_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c2_9341_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c2_9341_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l949_l905_DUPLICATE_cdc5_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l949_l905_DUPLICATE_cdc5_return_output;
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
