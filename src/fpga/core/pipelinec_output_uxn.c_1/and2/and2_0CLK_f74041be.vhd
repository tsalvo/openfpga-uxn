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
-- BIN_OP_EQ[uxn_opcodes_h_l901_c6_7588]
signal BIN_OP_EQ_uxn_opcodes_h_l901_c6_7588_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l901_c6_7588_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l901_c6_7588_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l901_c1_d24b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l901_c1_d24b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l901_c1_d24b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l901_c1_d24b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l901_c1_d24b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l901_c2_9c33]
signal n16_MUX_uxn_opcodes_h_l901_c2_9c33_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l901_c2_9c33_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l901_c2_9c33_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l901_c2_9c33_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l901_c2_9c33]
signal tmp16_MUX_uxn_opcodes_h_l901_c2_9c33_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l901_c2_9c33_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l901_c2_9c33_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l901_c2_9c33_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l901_c2_9c33]
signal result_is_stack_write_MUX_uxn_opcodes_h_l901_c2_9c33_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l901_c2_9c33_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l901_c2_9c33_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l901_c2_9c33_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l901_c2_9c33]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c2_9c33_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c2_9c33_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c2_9c33_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c2_9c33_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l901_c2_9c33]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c2_9c33_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c2_9c33_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c2_9c33_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c2_9c33_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l901_c2_9c33]
signal result_u8_value_MUX_uxn_opcodes_h_l901_c2_9c33_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l901_c2_9c33_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l901_c2_9c33_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l901_c2_9c33_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l901_c2_9c33]
signal result_is_opc_done_MUX_uxn_opcodes_h_l901_c2_9c33_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l901_c2_9c33_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l901_c2_9c33_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l901_c2_9c33_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l901_c2_9c33]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l901_c2_9c33_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l901_c2_9c33_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l901_c2_9c33_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l901_c2_9c33_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l901_c2_9c33]
signal t16_MUX_uxn_opcodes_h_l901_c2_9c33_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l901_c2_9c33_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l901_c2_9c33_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l901_c2_9c33_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l902_c3_9593[uxn_opcodes_h_l902_c3_9593]
signal printf_uxn_opcodes_h_l902_c3_9593_uxn_opcodes_h_l902_c3_9593_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l906_c11_dc38]
signal BIN_OP_EQ_uxn_opcodes_h_l906_c11_dc38_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l906_c11_dc38_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l906_c11_dc38_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l906_c7_d1a5]
signal n16_MUX_uxn_opcodes_h_l906_c7_d1a5_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l906_c7_d1a5_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l906_c7_d1a5_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l906_c7_d1a5_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l906_c7_d1a5]
signal tmp16_MUX_uxn_opcodes_h_l906_c7_d1a5_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l906_c7_d1a5_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l906_c7_d1a5_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l906_c7_d1a5_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l906_c7_d1a5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_d1a5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_d1a5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_d1a5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_d1a5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l906_c7_d1a5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_d1a5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_d1a5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_d1a5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_d1a5_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l906_c7_d1a5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_d1a5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_d1a5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_d1a5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_d1a5_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l906_c7_d1a5]
signal result_u8_value_MUX_uxn_opcodes_h_l906_c7_d1a5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l906_c7_d1a5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l906_c7_d1a5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l906_c7_d1a5_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l906_c7_d1a5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_d1a5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_d1a5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_d1a5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_d1a5_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l906_c7_d1a5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_d1a5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_d1a5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_d1a5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_d1a5_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l906_c7_d1a5]
signal t16_MUX_uxn_opcodes_h_l906_c7_d1a5_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l906_c7_d1a5_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l906_c7_d1a5_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l906_c7_d1a5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l909_c11_742e]
signal BIN_OP_EQ_uxn_opcodes_h_l909_c11_742e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l909_c11_742e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l909_c11_742e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l909_c7_47e9]
signal n16_MUX_uxn_opcodes_h_l909_c7_47e9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l909_c7_47e9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l909_c7_47e9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l909_c7_47e9_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l909_c7_47e9]
signal tmp16_MUX_uxn_opcodes_h_l909_c7_47e9_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l909_c7_47e9_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l909_c7_47e9_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l909_c7_47e9_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l909_c7_47e9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_47e9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_47e9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_47e9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_47e9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l909_c7_47e9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_47e9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_47e9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_47e9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_47e9_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l909_c7_47e9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_47e9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_47e9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_47e9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_47e9_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l909_c7_47e9]
signal result_u8_value_MUX_uxn_opcodes_h_l909_c7_47e9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l909_c7_47e9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l909_c7_47e9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l909_c7_47e9_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l909_c7_47e9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_47e9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_47e9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_47e9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_47e9_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l909_c7_47e9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_47e9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_47e9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_47e9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_47e9_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l909_c7_47e9]
signal t16_MUX_uxn_opcodes_h_l909_c7_47e9_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l909_c7_47e9_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l909_c7_47e9_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l909_c7_47e9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l914_c11_ecb9]
signal BIN_OP_EQ_uxn_opcodes_h_l914_c11_ecb9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l914_c11_ecb9_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l914_c11_ecb9_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l914_c7_d305]
signal n16_MUX_uxn_opcodes_h_l914_c7_d305_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l914_c7_d305_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l914_c7_d305_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l914_c7_d305_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l914_c7_d305]
signal tmp16_MUX_uxn_opcodes_h_l914_c7_d305_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l914_c7_d305_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l914_c7_d305_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l914_c7_d305_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l914_c7_d305]
signal result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_d305_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_d305_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_d305_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_d305_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l914_c7_d305]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_d305_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_d305_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_d305_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_d305_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l914_c7_d305]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_d305_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_d305_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_d305_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_d305_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l914_c7_d305]
signal result_u8_value_MUX_uxn_opcodes_h_l914_c7_d305_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l914_c7_d305_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l914_c7_d305_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l914_c7_d305_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l914_c7_d305]
signal result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_d305_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_d305_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_d305_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_d305_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l914_c7_d305]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_d305_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_d305_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_d305_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_d305_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l914_c7_d305]
signal t16_MUX_uxn_opcodes_h_l914_c7_d305_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l914_c7_d305_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l914_c7_d305_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l914_c7_d305_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l915_c3_0c54]
signal BIN_OP_OR_uxn_opcodes_h_l915_c3_0c54_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l915_c3_0c54_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l915_c3_0c54_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l918_c11_e570]
signal BIN_OP_EQ_uxn_opcodes_h_l918_c11_e570_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l918_c11_e570_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l918_c11_e570_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l918_c7_1ed3]
signal n16_MUX_uxn_opcodes_h_l918_c7_1ed3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l918_c7_1ed3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l918_c7_1ed3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l918_c7_1ed3_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l918_c7_1ed3]
signal tmp16_MUX_uxn_opcodes_h_l918_c7_1ed3_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l918_c7_1ed3_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l918_c7_1ed3_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l918_c7_1ed3_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l918_c7_1ed3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_1ed3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_1ed3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_1ed3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_1ed3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l918_c7_1ed3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_1ed3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_1ed3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_1ed3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_1ed3_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l918_c7_1ed3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_1ed3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_1ed3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_1ed3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_1ed3_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l918_c7_1ed3]
signal result_u8_value_MUX_uxn_opcodes_h_l918_c7_1ed3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l918_c7_1ed3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l918_c7_1ed3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l918_c7_1ed3_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l918_c7_1ed3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_1ed3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_1ed3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_1ed3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_1ed3_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l918_c7_1ed3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_1ed3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_1ed3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_1ed3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_1ed3_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l922_c11_56bc]
signal BIN_OP_EQ_uxn_opcodes_h_l922_c11_56bc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l922_c11_56bc_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l922_c11_56bc_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l922_c7_092a]
signal n16_MUX_uxn_opcodes_h_l922_c7_092a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l922_c7_092a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l922_c7_092a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l922_c7_092a_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l922_c7_092a]
signal tmp16_MUX_uxn_opcodes_h_l922_c7_092a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l922_c7_092a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l922_c7_092a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l922_c7_092a_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l922_c7_092a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_092a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_092a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_092a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_092a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l922_c7_092a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_092a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_092a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_092a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_092a_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l922_c7_092a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_092a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_092a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_092a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_092a_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l922_c7_092a]
signal result_u8_value_MUX_uxn_opcodes_h_l922_c7_092a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l922_c7_092a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l922_c7_092a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l922_c7_092a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l922_c7_092a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_092a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_092a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_092a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_092a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l922_c7_092a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_092a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_092a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_092a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_092a_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l923_c3_3756]
signal BIN_OP_OR_uxn_opcodes_h_l923_c3_3756_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l923_c3_3756_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l923_c3_3756_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l924_c11_310c]
signal BIN_OP_AND_uxn_opcodes_h_l924_c11_310c_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l924_c11_310c_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l924_c11_310c_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l926_c30_d961]
signal sp_relative_shift_uxn_opcodes_h_l926_c30_d961_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l926_c30_d961_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l926_c30_d961_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l926_c30_d961_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l931_c11_6d23]
signal BIN_OP_EQ_uxn_opcodes_h_l931_c11_6d23_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l931_c11_6d23_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l931_c11_6d23_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l931_c7_d563]
signal result_is_stack_write_MUX_uxn_opcodes_h_l931_c7_d563_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l931_c7_d563_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l931_c7_d563_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l931_c7_d563_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l931_c7_d563]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c7_d563_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c7_d563_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c7_d563_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c7_d563_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l931_c7_d563]
signal result_u8_value_MUX_uxn_opcodes_h_l931_c7_d563_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l931_c7_d563_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l931_c7_d563_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l931_c7_d563_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l931_c7_d563]
signal result_is_opc_done_MUX_uxn_opcodes_h_l931_c7_d563_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l931_c7_d563_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l931_c7_d563_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l931_c7_d563_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l931_c7_d563]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l931_c7_d563_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l931_c7_d563_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l931_c7_d563_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l931_c7_d563_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l934_c31_81e7]
signal CONST_SR_8_uxn_opcodes_h_l934_c31_81e7_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l934_c31_81e7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l936_c11_d724]
signal BIN_OP_EQ_uxn_opcodes_h_l936_c11_d724_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l936_c11_d724_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l936_c11_d724_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l936_c7_1a81]
signal result_is_stack_write_MUX_uxn_opcodes_h_l936_c7_1a81_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l936_c7_1a81_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l936_c7_1a81_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l936_c7_1a81_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l936_c7_1a81]
signal result_is_opc_done_MUX_uxn_opcodes_h_l936_c7_1a81_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l936_c7_1a81_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l936_c7_1a81_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l936_c7_1a81_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l920_l911_DUPLICATE_006d
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l920_l911_DUPLICATE_006d_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l920_l911_DUPLICATE_006d_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_c551( ref_toks_0 : opcode_result_t;
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
      base.is_stack_write := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.is_sp_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l901_c6_7588
BIN_OP_EQ_uxn_opcodes_h_l901_c6_7588 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l901_c6_7588_left,
BIN_OP_EQ_uxn_opcodes_h_l901_c6_7588_right,
BIN_OP_EQ_uxn_opcodes_h_l901_c6_7588_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l901_c1_d24b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l901_c1_d24b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l901_c1_d24b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l901_c1_d24b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l901_c1_d24b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l901_c1_d24b_return_output);

-- n16_MUX_uxn_opcodes_h_l901_c2_9c33
n16_MUX_uxn_opcodes_h_l901_c2_9c33 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l901_c2_9c33_cond,
n16_MUX_uxn_opcodes_h_l901_c2_9c33_iftrue,
n16_MUX_uxn_opcodes_h_l901_c2_9c33_iffalse,
n16_MUX_uxn_opcodes_h_l901_c2_9c33_return_output);

-- tmp16_MUX_uxn_opcodes_h_l901_c2_9c33
tmp16_MUX_uxn_opcodes_h_l901_c2_9c33 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l901_c2_9c33_cond,
tmp16_MUX_uxn_opcodes_h_l901_c2_9c33_iftrue,
tmp16_MUX_uxn_opcodes_h_l901_c2_9c33_iffalse,
tmp16_MUX_uxn_opcodes_h_l901_c2_9c33_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l901_c2_9c33
result_is_stack_write_MUX_uxn_opcodes_h_l901_c2_9c33 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l901_c2_9c33_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l901_c2_9c33_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l901_c2_9c33_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l901_c2_9c33_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c2_9c33
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c2_9c33 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c2_9c33_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c2_9c33_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c2_9c33_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c2_9c33_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c2_9c33
result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c2_9c33 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c2_9c33_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c2_9c33_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c2_9c33_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c2_9c33_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l901_c2_9c33
result_u8_value_MUX_uxn_opcodes_h_l901_c2_9c33 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l901_c2_9c33_cond,
result_u8_value_MUX_uxn_opcodes_h_l901_c2_9c33_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l901_c2_9c33_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l901_c2_9c33_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l901_c2_9c33
result_is_opc_done_MUX_uxn_opcodes_h_l901_c2_9c33 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l901_c2_9c33_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l901_c2_9c33_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l901_c2_9c33_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l901_c2_9c33_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l901_c2_9c33
result_is_sp_shift_MUX_uxn_opcodes_h_l901_c2_9c33 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l901_c2_9c33_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l901_c2_9c33_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l901_c2_9c33_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l901_c2_9c33_return_output);

-- t16_MUX_uxn_opcodes_h_l901_c2_9c33
t16_MUX_uxn_opcodes_h_l901_c2_9c33 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l901_c2_9c33_cond,
t16_MUX_uxn_opcodes_h_l901_c2_9c33_iftrue,
t16_MUX_uxn_opcodes_h_l901_c2_9c33_iffalse,
t16_MUX_uxn_opcodes_h_l901_c2_9c33_return_output);

-- printf_uxn_opcodes_h_l902_c3_9593_uxn_opcodes_h_l902_c3_9593
printf_uxn_opcodes_h_l902_c3_9593_uxn_opcodes_h_l902_c3_9593 : entity work.printf_uxn_opcodes_h_l902_c3_9593_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l902_c3_9593_uxn_opcodes_h_l902_c3_9593_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l906_c11_dc38
BIN_OP_EQ_uxn_opcodes_h_l906_c11_dc38 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l906_c11_dc38_left,
BIN_OP_EQ_uxn_opcodes_h_l906_c11_dc38_right,
BIN_OP_EQ_uxn_opcodes_h_l906_c11_dc38_return_output);

-- n16_MUX_uxn_opcodes_h_l906_c7_d1a5
n16_MUX_uxn_opcodes_h_l906_c7_d1a5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l906_c7_d1a5_cond,
n16_MUX_uxn_opcodes_h_l906_c7_d1a5_iftrue,
n16_MUX_uxn_opcodes_h_l906_c7_d1a5_iffalse,
n16_MUX_uxn_opcodes_h_l906_c7_d1a5_return_output);

-- tmp16_MUX_uxn_opcodes_h_l906_c7_d1a5
tmp16_MUX_uxn_opcodes_h_l906_c7_d1a5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l906_c7_d1a5_cond,
tmp16_MUX_uxn_opcodes_h_l906_c7_d1a5_iftrue,
tmp16_MUX_uxn_opcodes_h_l906_c7_d1a5_iffalse,
tmp16_MUX_uxn_opcodes_h_l906_c7_d1a5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_d1a5
result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_d1a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_d1a5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_d1a5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_d1a5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_d1a5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_d1a5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_d1a5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_d1a5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_d1a5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_d1a5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_d1a5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_d1a5
result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_d1a5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_d1a5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_d1a5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_d1a5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_d1a5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l906_c7_d1a5
result_u8_value_MUX_uxn_opcodes_h_l906_c7_d1a5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l906_c7_d1a5_cond,
result_u8_value_MUX_uxn_opcodes_h_l906_c7_d1a5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l906_c7_d1a5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l906_c7_d1a5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_d1a5
result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_d1a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_d1a5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_d1a5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_d1a5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_d1a5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_d1a5
result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_d1a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_d1a5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_d1a5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_d1a5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_d1a5_return_output);

-- t16_MUX_uxn_opcodes_h_l906_c7_d1a5
t16_MUX_uxn_opcodes_h_l906_c7_d1a5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l906_c7_d1a5_cond,
t16_MUX_uxn_opcodes_h_l906_c7_d1a5_iftrue,
t16_MUX_uxn_opcodes_h_l906_c7_d1a5_iffalse,
t16_MUX_uxn_opcodes_h_l906_c7_d1a5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l909_c11_742e
BIN_OP_EQ_uxn_opcodes_h_l909_c11_742e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l909_c11_742e_left,
BIN_OP_EQ_uxn_opcodes_h_l909_c11_742e_right,
BIN_OP_EQ_uxn_opcodes_h_l909_c11_742e_return_output);

-- n16_MUX_uxn_opcodes_h_l909_c7_47e9
n16_MUX_uxn_opcodes_h_l909_c7_47e9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l909_c7_47e9_cond,
n16_MUX_uxn_opcodes_h_l909_c7_47e9_iftrue,
n16_MUX_uxn_opcodes_h_l909_c7_47e9_iffalse,
n16_MUX_uxn_opcodes_h_l909_c7_47e9_return_output);

-- tmp16_MUX_uxn_opcodes_h_l909_c7_47e9
tmp16_MUX_uxn_opcodes_h_l909_c7_47e9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l909_c7_47e9_cond,
tmp16_MUX_uxn_opcodes_h_l909_c7_47e9_iftrue,
tmp16_MUX_uxn_opcodes_h_l909_c7_47e9_iffalse,
tmp16_MUX_uxn_opcodes_h_l909_c7_47e9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_47e9
result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_47e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_47e9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_47e9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_47e9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_47e9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_47e9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_47e9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_47e9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_47e9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_47e9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_47e9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_47e9
result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_47e9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_47e9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_47e9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_47e9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_47e9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l909_c7_47e9
result_u8_value_MUX_uxn_opcodes_h_l909_c7_47e9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l909_c7_47e9_cond,
result_u8_value_MUX_uxn_opcodes_h_l909_c7_47e9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l909_c7_47e9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l909_c7_47e9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_47e9
result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_47e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_47e9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_47e9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_47e9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_47e9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_47e9
result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_47e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_47e9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_47e9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_47e9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_47e9_return_output);

-- t16_MUX_uxn_opcodes_h_l909_c7_47e9
t16_MUX_uxn_opcodes_h_l909_c7_47e9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l909_c7_47e9_cond,
t16_MUX_uxn_opcodes_h_l909_c7_47e9_iftrue,
t16_MUX_uxn_opcodes_h_l909_c7_47e9_iffalse,
t16_MUX_uxn_opcodes_h_l909_c7_47e9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l914_c11_ecb9
BIN_OP_EQ_uxn_opcodes_h_l914_c11_ecb9 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l914_c11_ecb9_left,
BIN_OP_EQ_uxn_opcodes_h_l914_c11_ecb9_right,
BIN_OP_EQ_uxn_opcodes_h_l914_c11_ecb9_return_output);

-- n16_MUX_uxn_opcodes_h_l914_c7_d305
n16_MUX_uxn_opcodes_h_l914_c7_d305 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l914_c7_d305_cond,
n16_MUX_uxn_opcodes_h_l914_c7_d305_iftrue,
n16_MUX_uxn_opcodes_h_l914_c7_d305_iffalse,
n16_MUX_uxn_opcodes_h_l914_c7_d305_return_output);

-- tmp16_MUX_uxn_opcodes_h_l914_c7_d305
tmp16_MUX_uxn_opcodes_h_l914_c7_d305 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l914_c7_d305_cond,
tmp16_MUX_uxn_opcodes_h_l914_c7_d305_iftrue,
tmp16_MUX_uxn_opcodes_h_l914_c7_d305_iffalse,
tmp16_MUX_uxn_opcodes_h_l914_c7_d305_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_d305
result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_d305 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_d305_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_d305_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_d305_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_d305_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_d305
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_d305 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_d305_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_d305_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_d305_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_d305_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_d305
result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_d305 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_d305_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_d305_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_d305_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_d305_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l914_c7_d305
result_u8_value_MUX_uxn_opcodes_h_l914_c7_d305 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l914_c7_d305_cond,
result_u8_value_MUX_uxn_opcodes_h_l914_c7_d305_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l914_c7_d305_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l914_c7_d305_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_d305
result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_d305 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_d305_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_d305_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_d305_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_d305_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_d305
result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_d305 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_d305_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_d305_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_d305_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_d305_return_output);

-- t16_MUX_uxn_opcodes_h_l914_c7_d305
t16_MUX_uxn_opcodes_h_l914_c7_d305 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l914_c7_d305_cond,
t16_MUX_uxn_opcodes_h_l914_c7_d305_iftrue,
t16_MUX_uxn_opcodes_h_l914_c7_d305_iffalse,
t16_MUX_uxn_opcodes_h_l914_c7_d305_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l915_c3_0c54
BIN_OP_OR_uxn_opcodes_h_l915_c3_0c54 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l915_c3_0c54_left,
BIN_OP_OR_uxn_opcodes_h_l915_c3_0c54_right,
BIN_OP_OR_uxn_opcodes_h_l915_c3_0c54_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l918_c11_e570
BIN_OP_EQ_uxn_opcodes_h_l918_c11_e570 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l918_c11_e570_left,
BIN_OP_EQ_uxn_opcodes_h_l918_c11_e570_right,
BIN_OP_EQ_uxn_opcodes_h_l918_c11_e570_return_output);

-- n16_MUX_uxn_opcodes_h_l918_c7_1ed3
n16_MUX_uxn_opcodes_h_l918_c7_1ed3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l918_c7_1ed3_cond,
n16_MUX_uxn_opcodes_h_l918_c7_1ed3_iftrue,
n16_MUX_uxn_opcodes_h_l918_c7_1ed3_iffalse,
n16_MUX_uxn_opcodes_h_l918_c7_1ed3_return_output);

-- tmp16_MUX_uxn_opcodes_h_l918_c7_1ed3
tmp16_MUX_uxn_opcodes_h_l918_c7_1ed3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l918_c7_1ed3_cond,
tmp16_MUX_uxn_opcodes_h_l918_c7_1ed3_iftrue,
tmp16_MUX_uxn_opcodes_h_l918_c7_1ed3_iffalse,
tmp16_MUX_uxn_opcodes_h_l918_c7_1ed3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_1ed3
result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_1ed3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_1ed3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_1ed3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_1ed3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_1ed3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_1ed3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_1ed3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_1ed3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_1ed3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_1ed3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_1ed3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_1ed3
result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_1ed3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_1ed3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_1ed3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_1ed3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_1ed3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l918_c7_1ed3
result_u8_value_MUX_uxn_opcodes_h_l918_c7_1ed3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l918_c7_1ed3_cond,
result_u8_value_MUX_uxn_opcodes_h_l918_c7_1ed3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l918_c7_1ed3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l918_c7_1ed3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_1ed3
result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_1ed3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_1ed3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_1ed3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_1ed3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_1ed3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_1ed3
result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_1ed3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_1ed3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_1ed3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_1ed3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_1ed3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l922_c11_56bc
BIN_OP_EQ_uxn_opcodes_h_l922_c11_56bc : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l922_c11_56bc_left,
BIN_OP_EQ_uxn_opcodes_h_l922_c11_56bc_right,
BIN_OP_EQ_uxn_opcodes_h_l922_c11_56bc_return_output);

-- n16_MUX_uxn_opcodes_h_l922_c7_092a
n16_MUX_uxn_opcodes_h_l922_c7_092a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l922_c7_092a_cond,
n16_MUX_uxn_opcodes_h_l922_c7_092a_iftrue,
n16_MUX_uxn_opcodes_h_l922_c7_092a_iffalse,
n16_MUX_uxn_opcodes_h_l922_c7_092a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l922_c7_092a
tmp16_MUX_uxn_opcodes_h_l922_c7_092a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l922_c7_092a_cond,
tmp16_MUX_uxn_opcodes_h_l922_c7_092a_iftrue,
tmp16_MUX_uxn_opcodes_h_l922_c7_092a_iffalse,
tmp16_MUX_uxn_opcodes_h_l922_c7_092a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_092a
result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_092a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_092a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_092a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_092a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_092a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_092a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_092a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_092a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_092a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_092a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_092a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_092a
result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_092a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_092a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_092a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_092a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_092a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l922_c7_092a
result_u8_value_MUX_uxn_opcodes_h_l922_c7_092a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l922_c7_092a_cond,
result_u8_value_MUX_uxn_opcodes_h_l922_c7_092a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l922_c7_092a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l922_c7_092a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_092a
result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_092a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_092a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_092a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_092a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_092a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_092a
result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_092a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_092a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_092a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_092a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_092a_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l923_c3_3756
BIN_OP_OR_uxn_opcodes_h_l923_c3_3756 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l923_c3_3756_left,
BIN_OP_OR_uxn_opcodes_h_l923_c3_3756_right,
BIN_OP_OR_uxn_opcodes_h_l923_c3_3756_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l924_c11_310c
BIN_OP_AND_uxn_opcodes_h_l924_c11_310c : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l924_c11_310c_left,
BIN_OP_AND_uxn_opcodes_h_l924_c11_310c_right,
BIN_OP_AND_uxn_opcodes_h_l924_c11_310c_return_output);

-- sp_relative_shift_uxn_opcodes_h_l926_c30_d961
sp_relative_shift_uxn_opcodes_h_l926_c30_d961 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l926_c30_d961_ins,
sp_relative_shift_uxn_opcodes_h_l926_c30_d961_x,
sp_relative_shift_uxn_opcodes_h_l926_c30_d961_y,
sp_relative_shift_uxn_opcodes_h_l926_c30_d961_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l931_c11_6d23
BIN_OP_EQ_uxn_opcodes_h_l931_c11_6d23 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l931_c11_6d23_left,
BIN_OP_EQ_uxn_opcodes_h_l931_c11_6d23_right,
BIN_OP_EQ_uxn_opcodes_h_l931_c11_6d23_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l931_c7_d563
result_is_stack_write_MUX_uxn_opcodes_h_l931_c7_d563 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l931_c7_d563_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l931_c7_d563_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l931_c7_d563_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l931_c7_d563_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c7_d563
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c7_d563 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c7_d563_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c7_d563_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c7_d563_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c7_d563_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l931_c7_d563
result_u8_value_MUX_uxn_opcodes_h_l931_c7_d563 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l931_c7_d563_cond,
result_u8_value_MUX_uxn_opcodes_h_l931_c7_d563_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l931_c7_d563_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l931_c7_d563_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l931_c7_d563
result_is_opc_done_MUX_uxn_opcodes_h_l931_c7_d563 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l931_c7_d563_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l931_c7_d563_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l931_c7_d563_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l931_c7_d563_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l931_c7_d563
result_is_sp_shift_MUX_uxn_opcodes_h_l931_c7_d563 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l931_c7_d563_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l931_c7_d563_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l931_c7_d563_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l931_c7_d563_return_output);

-- CONST_SR_8_uxn_opcodes_h_l934_c31_81e7
CONST_SR_8_uxn_opcodes_h_l934_c31_81e7 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l934_c31_81e7_x,
CONST_SR_8_uxn_opcodes_h_l934_c31_81e7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l936_c11_d724
BIN_OP_EQ_uxn_opcodes_h_l936_c11_d724 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l936_c11_d724_left,
BIN_OP_EQ_uxn_opcodes_h_l936_c11_d724_right,
BIN_OP_EQ_uxn_opcodes_h_l936_c11_d724_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l936_c7_1a81
result_is_stack_write_MUX_uxn_opcodes_h_l936_c7_1a81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l936_c7_1a81_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l936_c7_1a81_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l936_c7_1a81_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l936_c7_1a81_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l936_c7_1a81
result_is_opc_done_MUX_uxn_opcodes_h_l936_c7_1a81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l936_c7_1a81_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l936_c7_1a81_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l936_c7_1a81_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l936_c7_1a81_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l920_l911_DUPLICATE_006d
CONST_SL_8_uint16_t_uxn_opcodes_h_l920_l911_DUPLICATE_006d : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l920_l911_DUPLICATE_006d_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l920_l911_DUPLICATE_006d_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l901_c6_7588_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l901_c1_d24b_return_output,
 n16_MUX_uxn_opcodes_h_l901_c2_9c33_return_output,
 tmp16_MUX_uxn_opcodes_h_l901_c2_9c33_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l901_c2_9c33_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c2_9c33_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c2_9c33_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l901_c2_9c33_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l901_c2_9c33_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l901_c2_9c33_return_output,
 t16_MUX_uxn_opcodes_h_l901_c2_9c33_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l906_c11_dc38_return_output,
 n16_MUX_uxn_opcodes_h_l906_c7_d1a5_return_output,
 tmp16_MUX_uxn_opcodes_h_l906_c7_d1a5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_d1a5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_d1a5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_d1a5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l906_c7_d1a5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_d1a5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_d1a5_return_output,
 t16_MUX_uxn_opcodes_h_l906_c7_d1a5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l909_c11_742e_return_output,
 n16_MUX_uxn_opcodes_h_l909_c7_47e9_return_output,
 tmp16_MUX_uxn_opcodes_h_l909_c7_47e9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_47e9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_47e9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_47e9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l909_c7_47e9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_47e9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_47e9_return_output,
 t16_MUX_uxn_opcodes_h_l909_c7_47e9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l914_c11_ecb9_return_output,
 n16_MUX_uxn_opcodes_h_l914_c7_d305_return_output,
 tmp16_MUX_uxn_opcodes_h_l914_c7_d305_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_d305_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_d305_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_d305_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l914_c7_d305_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_d305_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_d305_return_output,
 t16_MUX_uxn_opcodes_h_l914_c7_d305_return_output,
 BIN_OP_OR_uxn_opcodes_h_l915_c3_0c54_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l918_c11_e570_return_output,
 n16_MUX_uxn_opcodes_h_l918_c7_1ed3_return_output,
 tmp16_MUX_uxn_opcodes_h_l918_c7_1ed3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_1ed3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_1ed3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_1ed3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l918_c7_1ed3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_1ed3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_1ed3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l922_c11_56bc_return_output,
 n16_MUX_uxn_opcodes_h_l922_c7_092a_return_output,
 tmp16_MUX_uxn_opcodes_h_l922_c7_092a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_092a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_092a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_092a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l922_c7_092a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_092a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_092a_return_output,
 BIN_OP_OR_uxn_opcodes_h_l923_c3_3756_return_output,
 BIN_OP_AND_uxn_opcodes_h_l924_c11_310c_return_output,
 sp_relative_shift_uxn_opcodes_h_l926_c30_d961_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l931_c11_6d23_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l931_c7_d563_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c7_d563_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l931_c7_d563_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l931_c7_d563_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l931_c7_d563_return_output,
 CONST_SR_8_uxn_opcodes_h_l934_c31_81e7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l936_c11_d724_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l936_c7_1a81_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l936_c7_1a81_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l920_l911_DUPLICATE_006d_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c6_7588_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c6_7588_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c6_7588_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l901_c1_d24b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l901_c1_d24b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l901_c1_d24b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l901_c1_d24b_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l901_c2_9c33_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l901_c2_9c33_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l906_c7_d1a5_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l901_c2_9c33_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l901_c2_9c33_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l901_c2_9c33_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l901_c2_9c33_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l906_c7_d1a5_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l901_c2_9c33_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l901_c2_9c33_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l901_c2_9c33_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l901_c2_9c33_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_d1a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l901_c2_9c33_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l901_c2_9c33_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c2_9c33_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l903_c3_e53d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c2_9c33_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_d1a5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c2_9c33_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c2_9c33_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c2_9c33_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c2_9c33_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_d1a5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c2_9c33_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c2_9c33_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l901_c2_9c33_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l901_c2_9c33_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l906_c7_d1a5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l901_c2_9c33_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l901_c2_9c33_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l901_c2_9c33_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l901_c2_9c33_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_d1a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l901_c2_9c33_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l901_c2_9c33_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l901_c2_9c33_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l901_c2_9c33_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_d1a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l901_c2_9c33_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l901_c2_9c33_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l901_c2_9c33_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l901_c2_9c33_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l906_c7_d1a5_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l901_c2_9c33_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l901_c2_9c33_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l902_c3_9593_uxn_opcodes_h_l902_c3_9593_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_dc38_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_dc38_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_dc38_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l906_c7_d1a5_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l906_c7_d1a5_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l909_c7_47e9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l906_c7_d1a5_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l906_c7_d1a5_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l906_c7_d1a5_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l909_c7_47e9_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l906_c7_d1a5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_d1a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_d1a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_47e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_d1a5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_d1a5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l907_c3_5dd2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_d1a5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_47e9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_d1a5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_d1a5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_d1a5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_47e9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_d1a5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l906_c7_d1a5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l906_c7_d1a5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l909_c7_47e9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l906_c7_d1a5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_d1a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_d1a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_47e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_d1a5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_d1a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_d1a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_47e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_d1a5_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l906_c7_d1a5_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l906_c7_d1a5_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l909_c7_47e9_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l906_c7_d1a5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c11_742e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c11_742e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c11_742e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l909_c7_47e9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l909_c7_47e9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l914_c7_d305_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l909_c7_47e9_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l909_c7_47e9_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l909_c7_47e9_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l914_c7_d305_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l909_c7_47e9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_47e9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_47e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_d305_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_47e9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_47e9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l912_c3_3721 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_47e9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_d305_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_47e9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_47e9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_47e9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_d305_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_47e9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l909_c7_47e9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l909_c7_47e9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l914_c7_d305_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l909_c7_47e9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_47e9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_47e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_d305_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_47e9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_47e9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_47e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_d305_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_47e9_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l909_c7_47e9_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l909_c7_47e9_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l914_c7_d305_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l909_c7_47e9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_ecb9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_ecb9_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_ecb9_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l914_c7_d305_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l914_c7_d305_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l918_c7_1ed3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l914_c7_d305_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l914_c7_d305_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l914_c7_d305_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l918_c7_1ed3_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l914_c7_d305_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_d305_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_d305_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_1ed3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_d305_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_d305_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l916_c3_b791 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_d305_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_1ed3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_d305_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_d305_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_d305_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_1ed3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_d305_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l914_c7_d305_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l914_c7_d305_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l918_c7_1ed3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l914_c7_d305_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_d305_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_d305_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_1ed3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_d305_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_d305_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_d305_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_1ed3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_d305_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l914_c7_d305_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l914_c7_d305_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l914_c7_d305_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l915_c3_0c54_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l915_c3_0c54_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l915_c3_0c54_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_e570_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_e570_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_e570_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l918_c7_1ed3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l918_c7_1ed3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l922_c7_092a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l918_c7_1ed3_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l918_c7_1ed3_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l918_c7_1ed3_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l922_c7_092a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l918_c7_1ed3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_1ed3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_1ed3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_092a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_1ed3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_1ed3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_1ed3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_092a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_1ed3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_1ed3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_1ed3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_092a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_1ed3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l918_c7_1ed3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l918_c7_1ed3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l922_c7_092a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l918_c7_1ed3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_1ed3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_1ed3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_092a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_1ed3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_1ed3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_1ed3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_092a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_1ed3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_56bc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_56bc_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_56bc_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l922_c7_092a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l922_c7_092a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l922_c7_092a_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l922_c7_092a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l922_c7_092a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l922_c7_092a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_092a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_092a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l931_c7_d563_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_092a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_092a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l928_c3_7829 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_092a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c7_d563_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_092a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_092a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_092a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_092a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l922_c7_092a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l922_c7_092a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l931_c7_d563_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l922_c7_092a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_092a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_092a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l931_c7_d563_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_092a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_092a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_092a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l931_c7_d563_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_092a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l923_c3_3756_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l923_c3_3756_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l923_c3_3756_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l924_c11_310c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l924_c11_310c_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l924_c11_310c_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l926_c30_d961_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l926_c30_d961_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l926_c30_d961_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l926_c30_d961_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l929_c21_dc8c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l931_c11_6d23_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l931_c11_6d23_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l931_c11_6d23_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l931_c7_d563_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l931_c7_d563_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l936_c7_1a81_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l931_c7_d563_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c7_d563_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l933_c3_ebea : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c7_d563_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c7_d563_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l931_c7_d563_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l931_c7_d563_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l931_c7_d563_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l931_c7_d563_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l931_c7_d563_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l936_c7_1a81_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l931_c7_d563_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l931_c7_d563_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l931_c7_d563_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l931_c7_d563_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l934_c31_81e7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l934_c31_81e7_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l934_c21_1834_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l936_c11_d724_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l936_c11_d724_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l936_c11_d724_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l936_c7_1a81_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l936_c7_1a81_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l936_c7_1a81_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l936_c7_1a81_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l936_c7_1a81_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l936_c7_1a81_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l918_l914_l909_l906_l936_l901_l931_DUPLICATE_7fd7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l922_l918_l914_l909_l906_l901_DUPLICATE_a517_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l918_l914_l909_l906_l901_l931_DUPLICATE_697c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l918_l914_l909_l906_l901_l931_DUPLICATE_c4d7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l922_l918_l914_l909_l906_l936_l931_DUPLICATE_415e_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l910_l919_l915_l923_DUPLICATE_7dcb_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l920_l911_DUPLICATE_006d_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l920_l911_DUPLICATE_006d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l931_l918_DUPLICATE_30d2_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l941_l897_DUPLICATE_b51c_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_56bc_right := to_unsigned(5, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_092a_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_092a_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l926_c30_d961_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l936_c7_1a81_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l901_c1_d24b_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_dc38_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c11_742e_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l936_c7_1a81_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l933_c3_ebea := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c7_d563_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l933_c3_ebea;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_ecb9_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c6_7588_right := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l926_c30_d961_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l936_c11_d724_right := to_unsigned(7, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l901_c2_9c33_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l912_c3_3721 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_47e9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l912_c3_3721;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l907_c3_5dd2 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_d1a5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l907_c3_5dd2;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l931_c11_6d23_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l916_c3_b791 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_d305_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l916_c3_b791;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l928_c3_7829 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_092a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l928_c3_7829;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l931_c7_d563_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l903_c3_e53d := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c2_9c33_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l903_c3_e53d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_e570_right := to_unsigned(4, 3);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l901_c1_d24b_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l926_c30_d961_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l923_c3_3756_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l901_c2_9c33_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l906_c7_d1a5_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l909_c7_47e9_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l914_c7_d305_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l922_c7_092a_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c6_7588_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_dc38_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c11_742e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_ecb9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_e570_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_56bc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l931_c11_6d23_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l936_c11_d724_left := VAR_phase;
     VAR_BIN_OP_AND_uxn_opcodes_h_l924_c11_310c_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l915_c3_0c54_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l901_c2_9c33_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l906_c7_d1a5_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l914_c7_d305_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l934_c31_81e7_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l901_c2_9c33_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l906_c7_d1a5_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l909_c7_47e9_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l914_c7_d305_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l918_c7_1ed3_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l922_c7_092a_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l906_c11_dc38] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l906_c11_dc38_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_dc38_left;
     BIN_OP_EQ_uxn_opcodes_h_l906_c11_dc38_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_dc38_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_dc38_return_output := BIN_OP_EQ_uxn_opcodes_h_l906_c11_dc38_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l914_c11_ecb9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l914_c11_ecb9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_ecb9_left;
     BIN_OP_EQ_uxn_opcodes_h_l914_c11_ecb9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_ecb9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_ecb9_return_output := BIN_OP_EQ_uxn_opcodes_h_l914_c11_ecb9_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l922_l918_l914_l909_l906_l901_DUPLICATE_a517 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l922_l918_l914_l909_l906_l901_DUPLICATE_a517_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l918_l914_l909_l906_l901_l931_DUPLICATE_697c LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l918_l914_l909_l906_l901_l931_DUPLICATE_697c_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l918_c11_e570] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l918_c11_e570_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_e570_left;
     BIN_OP_EQ_uxn_opcodes_h_l918_c11_e570_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_e570_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_e570_return_output := BIN_OP_EQ_uxn_opcodes_h_l918_c11_e570_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l931_c11_6d23] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l931_c11_6d23_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l931_c11_6d23_left;
     BIN_OP_EQ_uxn_opcodes_h_l931_c11_6d23_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l931_c11_6d23_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l931_c11_6d23_return_output := BIN_OP_EQ_uxn_opcodes_h_l931_c11_6d23_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l901_c6_7588] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l901_c6_7588_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c6_7588_left;
     BIN_OP_EQ_uxn_opcodes_h_l901_c6_7588_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c6_7588_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c6_7588_return_output := BIN_OP_EQ_uxn_opcodes_h_l901_c6_7588_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l909_c11_742e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l909_c11_742e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c11_742e_left;
     BIN_OP_EQ_uxn_opcodes_h_l909_c11_742e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c11_742e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c11_742e_return_output := BIN_OP_EQ_uxn_opcodes_h_l909_c11_742e_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l926_c30_d961] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l926_c30_d961_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l926_c30_d961_ins;
     sp_relative_shift_uxn_opcodes_h_l926_c30_d961_x <= VAR_sp_relative_shift_uxn_opcodes_h_l926_c30_d961_x;
     sp_relative_shift_uxn_opcodes_h_l926_c30_d961_y <= VAR_sp_relative_shift_uxn_opcodes_h_l926_c30_d961_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l926_c30_d961_return_output := sp_relative_shift_uxn_opcodes_h_l926_c30_d961_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l922_c11_56bc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l922_c11_56bc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_56bc_left;
     BIN_OP_EQ_uxn_opcodes_h_l922_c11_56bc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_56bc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_56bc_return_output := BIN_OP_EQ_uxn_opcodes_h_l922_c11_56bc_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l918_l914_l909_l906_l936_l901_l931_DUPLICATE_7fd7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l918_l914_l909_l906_l936_l901_l931_DUPLICATE_7fd7_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l918_l914_l909_l906_l901_l931_DUPLICATE_c4d7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l918_l914_l909_l906_l901_l931_DUPLICATE_c4d7_return_output := result.is_sp_shift;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l910_l919_l915_l923_DUPLICATE_7dcb LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l910_l919_l915_l923_DUPLICATE_7dcb_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l931_l918_DUPLICATE_30d2 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l931_l918_DUPLICATE_30d2_return_output := result.stack_address_sp_offset;

     -- CONST_SR_8[uxn_opcodes_h_l934_c31_81e7] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l934_c31_81e7_x <= VAR_CONST_SR_8_uxn_opcodes_h_l934_c31_81e7_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l934_c31_81e7_return_output := CONST_SR_8_uxn_opcodes_h_l934_c31_81e7_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l922_l918_l914_l909_l906_l936_l931_DUPLICATE_415e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l922_l918_l914_l909_l906_l936_l931_DUPLICATE_415e_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l936_c11_d724] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l936_c11_d724_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l936_c11_d724_left;
     BIN_OP_EQ_uxn_opcodes_h_l936_c11_d724_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l936_c11_d724_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l936_c11_d724_return_output := BIN_OP_EQ_uxn_opcodes_h_l936_c11_d724_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l901_c1_d24b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c6_7588_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l901_c2_9c33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c6_7588_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l901_c2_9c33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c6_7588_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l901_c2_9c33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c6_7588_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l901_c2_9c33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c6_7588_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c2_9c33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c6_7588_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c2_9c33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c6_7588_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l901_c2_9c33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c6_7588_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l901_c2_9c33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c6_7588_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l901_c2_9c33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c6_7588_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l906_c7_d1a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_dc38_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_d1a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_dc38_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_d1a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_dc38_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_d1a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_dc38_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_d1a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_dc38_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_d1a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_dc38_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l906_c7_d1a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_dc38_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l906_c7_d1a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_dc38_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l906_c7_d1a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_dc38_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l909_c7_47e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c11_742e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_47e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c11_742e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_47e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c11_742e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_47e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c11_742e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_47e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c11_742e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_47e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c11_742e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l909_c7_47e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c11_742e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l909_c7_47e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c11_742e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l909_c7_47e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l909_c11_742e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l914_c7_d305_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_ecb9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_d305_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_ecb9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_d305_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_ecb9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_d305_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_ecb9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_d305_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_ecb9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_d305_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_ecb9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l914_c7_d305_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_ecb9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l914_c7_d305_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_ecb9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l914_c7_d305_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_ecb9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l918_c7_1ed3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_e570_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_1ed3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_e570_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_1ed3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_e570_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_1ed3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_e570_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_1ed3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_e570_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_1ed3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_e570_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l918_c7_1ed3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_e570_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l918_c7_1ed3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_e570_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l922_c7_092a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_56bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_092a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_56bc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_092a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_56bc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_092a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_56bc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_092a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_56bc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_092a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_56bc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l922_c7_092a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_56bc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l922_c7_092a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_56bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l931_c7_d563_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l931_c11_6d23_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l931_c7_d563_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l931_c11_6d23_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l931_c7_d563_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l931_c11_6d23_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c7_d563_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l931_c11_6d23_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l931_c7_d563_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l931_c11_6d23_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l936_c7_1a81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l936_c11_d724_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l936_c7_1a81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l936_c11_d724_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l915_c3_0c54_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l910_l919_l915_l923_DUPLICATE_7dcb_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l923_c3_3756_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l910_l919_l915_l923_DUPLICATE_7dcb_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l920_l911_DUPLICATE_006d_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l910_l919_l915_l923_DUPLICATE_7dcb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c2_9c33_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l922_l918_l914_l909_l906_l901_DUPLICATE_a517_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_d1a5_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l922_l918_l914_l909_l906_l901_DUPLICATE_a517_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_47e9_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l922_l918_l914_l909_l906_l901_DUPLICATE_a517_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_d305_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l922_l918_l914_l909_l906_l901_DUPLICATE_a517_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_1ed3_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l922_l918_l914_l909_l906_l901_DUPLICATE_a517_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_092a_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l922_l918_l914_l909_l906_l901_DUPLICATE_a517_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_d1a5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l922_l918_l914_l909_l906_l936_l931_DUPLICATE_415e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_47e9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l922_l918_l914_l909_l906_l936_l931_DUPLICATE_415e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_d305_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l922_l918_l914_l909_l906_l936_l931_DUPLICATE_415e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_1ed3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l922_l918_l914_l909_l906_l936_l931_DUPLICATE_415e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_092a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l922_l918_l914_l909_l906_l936_l931_DUPLICATE_415e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l931_c7_d563_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l922_l918_l914_l909_l906_l936_l931_DUPLICATE_415e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l936_c7_1a81_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l922_l918_l914_l909_l906_l936_l931_DUPLICATE_415e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l901_c2_9c33_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l918_l914_l909_l906_l901_l931_DUPLICATE_c4d7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_d1a5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l918_l914_l909_l906_l901_l931_DUPLICATE_c4d7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_47e9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l918_l914_l909_l906_l901_l931_DUPLICATE_c4d7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_d305_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l918_l914_l909_l906_l901_l931_DUPLICATE_c4d7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_1ed3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l918_l914_l909_l906_l901_l931_DUPLICATE_c4d7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l931_c7_d563_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l918_l914_l909_l906_l901_l931_DUPLICATE_c4d7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l901_c2_9c33_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l918_l914_l909_l906_l936_l901_l931_DUPLICATE_7fd7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_d1a5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l918_l914_l909_l906_l936_l901_l931_DUPLICATE_7fd7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_47e9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l918_l914_l909_l906_l936_l901_l931_DUPLICATE_7fd7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_d305_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l918_l914_l909_l906_l936_l901_l931_DUPLICATE_7fd7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_1ed3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l918_l914_l909_l906_l936_l901_l931_DUPLICATE_7fd7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l931_c7_d563_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l918_l914_l909_l906_l936_l901_l931_DUPLICATE_7fd7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l936_c7_1a81_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l918_l914_l909_l906_l936_l901_l931_DUPLICATE_7fd7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_1ed3_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l931_l918_DUPLICATE_30d2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c7_d563_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l931_l918_DUPLICATE_30d2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l901_c2_9c33_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l918_l914_l909_l906_l901_l931_DUPLICATE_697c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l906_c7_d1a5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l918_l914_l909_l906_l901_l931_DUPLICATE_697c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l909_c7_47e9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l918_l914_l909_l906_l901_l931_DUPLICATE_697c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l914_c7_d305_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l918_l914_l909_l906_l901_l931_DUPLICATE_697c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l918_c7_1ed3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l918_l914_l909_l906_l901_l931_DUPLICATE_697c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l931_c7_d563_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l918_l914_l909_l906_l901_l931_DUPLICATE_697c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_092a_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l926_c30_d961_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l936_c7_1a81] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l936_c7_1a81_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l936_c7_1a81_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l936_c7_1a81_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l936_c7_1a81_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l936_c7_1a81_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l936_c7_1a81_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l936_c7_1a81_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l936_c7_1a81_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l934_c21_1834] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l934_c21_1834_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l934_c31_81e7_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l915_c3_0c54] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l915_c3_0c54_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l915_c3_0c54_left;
     BIN_OP_OR_uxn_opcodes_h_l915_c3_0c54_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l915_c3_0c54_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l915_c3_0c54_return_output := BIN_OP_OR_uxn_opcodes_h_l915_c3_0c54_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l936_c7_1a81] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l936_c7_1a81_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l936_c7_1a81_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l936_c7_1a81_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l936_c7_1a81_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l936_c7_1a81_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l936_c7_1a81_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l936_c7_1a81_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l936_c7_1a81_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l920_l911_DUPLICATE_006d LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l920_l911_DUPLICATE_006d_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l920_l911_DUPLICATE_006d_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l920_l911_DUPLICATE_006d_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l920_l911_DUPLICATE_006d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l931_c7_d563] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c7_d563_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c7_d563_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c7_d563_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c7_d563_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c7_d563_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c7_d563_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c7_d563_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c7_d563_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l901_c1_d24b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l901_c1_d24b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l901_c1_d24b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l901_c1_d24b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l901_c1_d24b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l901_c1_d24b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l901_c1_d24b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l901_c1_d24b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l901_c1_d24b_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l923_c3_3756] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l923_c3_3756_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l923_c3_3756_left;
     BIN_OP_OR_uxn_opcodes_h_l923_c3_3756_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l923_c3_3756_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l923_c3_3756_return_output := BIN_OP_OR_uxn_opcodes_h_l923_c3_3756_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l922_c7_092a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_092a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_092a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_092a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_092a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_092a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_092a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_092a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_092a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l931_c7_d563] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l931_c7_d563_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l931_c7_d563_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l931_c7_d563_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l931_c7_d563_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l931_c7_d563_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l931_c7_d563_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l931_c7_d563_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l931_c7_d563_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l914_c7_d305_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l915_c3_0c54_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l924_c11_310c_right := VAR_BIN_OP_OR_uxn_opcodes_h_l923_c3_3756_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l922_c7_092a_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l923_c3_3756_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l931_c7_d563_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l934_c21_1834_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l918_c7_1ed3_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l920_l911_DUPLICATE_006d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l909_c7_47e9_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l920_l911_DUPLICATE_006d_return_output;
     VAR_printf_uxn_opcodes_h_l902_c3_9593_uxn_opcodes_h_l902_c3_9593_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l901_c1_d24b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l931_c7_d563_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l936_c7_1a81_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_092a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l931_c7_d563_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l931_c7_d563_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l936_c7_1a81_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_1ed3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l922_c7_092a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_092a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c7_d563_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l922_c7_092a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_092a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_092a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_092a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_092a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_092a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_092a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_092a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_092a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l931_c7_d563] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l931_c7_d563_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l931_c7_d563_cond;
     result_u8_value_MUX_uxn_opcodes_h_l931_c7_d563_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l931_c7_d563_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l931_c7_d563_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l931_c7_d563_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l931_c7_d563_return_output := result_u8_value_MUX_uxn_opcodes_h_l931_c7_d563_return_output;

     -- printf_uxn_opcodes_h_l902_c3_9593[uxn_opcodes_h_l902_c3_9593] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l902_c3_9593_uxn_opcodes_h_l902_c3_9593_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l902_c3_9593_uxn_opcodes_h_l902_c3_9593_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l918_c7_1ed3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_1ed3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_1ed3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_1ed3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_1ed3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_1ed3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_1ed3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_1ed3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_1ed3_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l924_c11_310c] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l924_c11_310c_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l924_c11_310c_left;
     BIN_OP_AND_uxn_opcodes_h_l924_c11_310c_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l924_c11_310c_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l924_c11_310c_return_output := BIN_OP_AND_uxn_opcodes_h_l924_c11_310c_return_output;

     -- n16_MUX[uxn_opcodes_h_l922_c7_092a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l922_c7_092a_cond <= VAR_n16_MUX_uxn_opcodes_h_l922_c7_092a_cond;
     n16_MUX_uxn_opcodes_h_l922_c7_092a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l922_c7_092a_iftrue;
     n16_MUX_uxn_opcodes_h_l922_c7_092a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l922_c7_092a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l922_c7_092a_return_output := n16_MUX_uxn_opcodes_h_l922_c7_092a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l931_c7_d563] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l931_c7_d563_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l931_c7_d563_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l931_c7_d563_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l931_c7_d563_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l931_c7_d563_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l931_c7_d563_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l931_c7_d563_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l931_c7_d563_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l922_c7_092a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_092a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_092a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_092a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_092a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_092a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_092a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_092a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_092a_return_output;

     -- t16_MUX[uxn_opcodes_h_l914_c7_d305] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l914_c7_d305_cond <= VAR_t16_MUX_uxn_opcodes_h_l914_c7_d305_cond;
     t16_MUX_uxn_opcodes_h_l914_c7_d305_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l914_c7_d305_iftrue;
     t16_MUX_uxn_opcodes_h_l914_c7_d305_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l914_c7_d305_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l914_c7_d305_return_output := t16_MUX_uxn_opcodes_h_l914_c7_d305_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l931_c7_d563] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l931_c7_d563_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l931_c7_d563_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l931_c7_d563_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l931_c7_d563_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l931_c7_d563_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l931_c7_d563_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l931_c7_d563_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l931_c7_d563_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l922_c7_092a_iftrue := VAR_BIN_OP_AND_uxn_opcodes_h_l924_c11_310c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l918_c7_1ed3_iffalse := VAR_n16_MUX_uxn_opcodes_h_l922_c7_092a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_092a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l931_c7_d563_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_1ed3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l922_c7_092a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_092a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l931_c7_d563_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_d305_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_1ed3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_1ed3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l922_c7_092a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l922_c7_092a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l931_c7_d563_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l909_c7_47e9_iffalse := VAR_t16_MUX_uxn_opcodes_h_l914_c7_d305_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l922_c7_092a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_092a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_092a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_092a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_092a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_092a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_092a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_092a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_092a_return_output;

     -- t16_MUX[uxn_opcodes_h_l909_c7_47e9] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l909_c7_47e9_cond <= VAR_t16_MUX_uxn_opcodes_h_l909_c7_47e9_cond;
     t16_MUX_uxn_opcodes_h_l909_c7_47e9_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l909_c7_47e9_iftrue;
     t16_MUX_uxn_opcodes_h_l909_c7_47e9_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l909_c7_47e9_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l909_c7_47e9_return_output := t16_MUX_uxn_opcodes_h_l909_c7_47e9_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l929_c21_dc8c] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l929_c21_dc8c_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_AND_uxn_opcodes_h_l924_c11_310c_return_output);

     -- tmp16_MUX[uxn_opcodes_h_l922_c7_092a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l922_c7_092a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l922_c7_092a_cond;
     tmp16_MUX_uxn_opcodes_h_l922_c7_092a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l922_c7_092a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l922_c7_092a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l922_c7_092a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l922_c7_092a_return_output := tmp16_MUX_uxn_opcodes_h_l922_c7_092a_return_output;

     -- n16_MUX[uxn_opcodes_h_l918_c7_1ed3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l918_c7_1ed3_cond <= VAR_n16_MUX_uxn_opcodes_h_l918_c7_1ed3_cond;
     n16_MUX_uxn_opcodes_h_l918_c7_1ed3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l918_c7_1ed3_iftrue;
     n16_MUX_uxn_opcodes_h_l918_c7_1ed3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l918_c7_1ed3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l918_c7_1ed3_return_output := n16_MUX_uxn_opcodes_h_l918_c7_1ed3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l918_c7_1ed3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_1ed3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_1ed3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_1ed3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_1ed3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_1ed3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_1ed3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_1ed3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_1ed3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l918_c7_1ed3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_1ed3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_1ed3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_1ed3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_1ed3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_1ed3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_1ed3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_1ed3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_1ed3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l922_c7_092a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_092a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_092a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_092a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_092a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_092a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_092a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_092a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_092a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l914_c7_d305] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_d305_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_d305_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_d305_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_d305_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_d305_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_d305_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_d305_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_d305_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l922_c7_092a_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l929_c21_dc8c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l914_c7_d305_iffalse := VAR_n16_MUX_uxn_opcodes_h_l918_c7_1ed3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_1ed3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_092a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_d305_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_1ed3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_1ed3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_092a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_47e9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_d305_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_d305_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_1ed3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l906_c7_d1a5_iffalse := VAR_t16_MUX_uxn_opcodes_h_l909_c7_47e9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l918_c7_1ed3_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l922_c7_092a_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l918_c7_1ed3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_1ed3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_1ed3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_1ed3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_1ed3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_1ed3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_1ed3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_1ed3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_1ed3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l909_c7_47e9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_47e9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_47e9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_47e9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_47e9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_47e9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_47e9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_47e9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_47e9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l918_c7_1ed3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_1ed3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_1ed3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_1ed3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_1ed3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_1ed3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_1ed3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_1ed3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_1ed3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l914_c7_d305] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_d305_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_d305_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_d305_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_d305_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_d305_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_d305_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_d305_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_d305_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l922_c7_092a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l922_c7_092a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l922_c7_092a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l922_c7_092a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l922_c7_092a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l922_c7_092a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l922_c7_092a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l922_c7_092a_return_output := result_u8_value_MUX_uxn_opcodes_h_l922_c7_092a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l918_c7_1ed3] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l918_c7_1ed3_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l918_c7_1ed3_cond;
     tmp16_MUX_uxn_opcodes_h_l918_c7_1ed3_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l918_c7_1ed3_iftrue;
     tmp16_MUX_uxn_opcodes_h_l918_c7_1ed3_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l918_c7_1ed3_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l918_c7_1ed3_return_output := tmp16_MUX_uxn_opcodes_h_l918_c7_1ed3_return_output;

     -- n16_MUX[uxn_opcodes_h_l914_c7_d305] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l914_c7_d305_cond <= VAR_n16_MUX_uxn_opcodes_h_l914_c7_d305_cond;
     n16_MUX_uxn_opcodes_h_l914_c7_d305_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l914_c7_d305_iftrue;
     n16_MUX_uxn_opcodes_h_l914_c7_d305_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l914_c7_d305_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l914_c7_d305_return_output := n16_MUX_uxn_opcodes_h_l914_c7_d305_return_output;

     -- t16_MUX[uxn_opcodes_h_l906_c7_d1a5] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l906_c7_d1a5_cond <= VAR_t16_MUX_uxn_opcodes_h_l906_c7_d1a5_cond;
     t16_MUX_uxn_opcodes_h_l906_c7_d1a5_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l906_c7_d1a5_iftrue;
     t16_MUX_uxn_opcodes_h_l906_c7_d1a5_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l906_c7_d1a5_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l906_c7_d1a5_return_output := t16_MUX_uxn_opcodes_h_l906_c7_d1a5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l914_c7_d305] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_d305_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_d305_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_d305_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_d305_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_d305_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_d305_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_d305_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_d305_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l909_c7_47e9_iffalse := VAR_n16_MUX_uxn_opcodes_h_l914_c7_d305_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_d305_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_1ed3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_47e9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_d305_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_d305_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_1ed3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_d1a5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l909_c7_47e9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_47e9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_d305_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l918_c7_1ed3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l922_c7_092a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l901_c2_9c33_iffalse := VAR_t16_MUX_uxn_opcodes_h_l906_c7_d1a5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l914_c7_d305_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l918_c7_1ed3_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l914_c7_d305] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_d305_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_d305_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_d305_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_d305_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_d305_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_d305_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_d305_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_d305_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l909_c7_47e9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_47e9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_47e9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_47e9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_47e9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_47e9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_47e9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_47e9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_47e9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l909_c7_47e9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_47e9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_47e9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_47e9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_47e9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_47e9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_47e9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_47e9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_47e9_return_output;

     -- n16_MUX[uxn_opcodes_h_l909_c7_47e9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l909_c7_47e9_cond <= VAR_n16_MUX_uxn_opcodes_h_l909_c7_47e9_cond;
     n16_MUX_uxn_opcodes_h_l909_c7_47e9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l909_c7_47e9_iftrue;
     n16_MUX_uxn_opcodes_h_l909_c7_47e9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l909_c7_47e9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l909_c7_47e9_return_output := n16_MUX_uxn_opcodes_h_l909_c7_47e9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l918_c7_1ed3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l918_c7_1ed3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l918_c7_1ed3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l918_c7_1ed3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l918_c7_1ed3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l918_c7_1ed3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l918_c7_1ed3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l918_c7_1ed3_return_output := result_u8_value_MUX_uxn_opcodes_h_l918_c7_1ed3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l906_c7_d1a5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_d1a5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_d1a5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_d1a5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_d1a5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_d1a5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_d1a5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_d1a5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_d1a5_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l914_c7_d305] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l914_c7_d305_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l914_c7_d305_cond;
     tmp16_MUX_uxn_opcodes_h_l914_c7_d305_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l914_c7_d305_iftrue;
     tmp16_MUX_uxn_opcodes_h_l914_c7_d305_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l914_c7_d305_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l914_c7_d305_return_output := tmp16_MUX_uxn_opcodes_h_l914_c7_d305_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l914_c7_d305] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_d305_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_d305_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_d305_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_d305_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_d305_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_d305_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_d305_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_d305_return_output;

     -- t16_MUX[uxn_opcodes_h_l901_c2_9c33] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l901_c2_9c33_cond <= VAR_t16_MUX_uxn_opcodes_h_l901_c2_9c33_cond;
     t16_MUX_uxn_opcodes_h_l901_c2_9c33_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l901_c2_9c33_iftrue;
     t16_MUX_uxn_opcodes_h_l901_c2_9c33_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l901_c2_9c33_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l901_c2_9c33_return_output := t16_MUX_uxn_opcodes_h_l901_c2_9c33_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l906_c7_d1a5_iffalse := VAR_n16_MUX_uxn_opcodes_h_l909_c7_47e9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_47e9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_d305_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_d1a5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l909_c7_47e9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_47e9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_d305_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c2_9c33_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_d1a5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_d1a5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l909_c7_47e9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l914_c7_d305_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l918_c7_1ed3_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l901_c2_9c33_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l909_c7_47e9_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l914_c7_d305_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l901_c2_9c33] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c2_9c33_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c2_9c33_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c2_9c33_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c2_9c33_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c2_9c33_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c2_9c33_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c2_9c33_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c2_9c33_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l909_c7_47e9] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l909_c7_47e9_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l909_c7_47e9_cond;
     tmp16_MUX_uxn_opcodes_h_l909_c7_47e9_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l909_c7_47e9_iftrue;
     tmp16_MUX_uxn_opcodes_h_l909_c7_47e9_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l909_c7_47e9_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l909_c7_47e9_return_output := tmp16_MUX_uxn_opcodes_h_l909_c7_47e9_return_output;

     -- n16_MUX[uxn_opcodes_h_l906_c7_d1a5] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l906_c7_d1a5_cond <= VAR_n16_MUX_uxn_opcodes_h_l906_c7_d1a5_cond;
     n16_MUX_uxn_opcodes_h_l906_c7_d1a5_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l906_c7_d1a5_iftrue;
     n16_MUX_uxn_opcodes_h_l906_c7_d1a5_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l906_c7_d1a5_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l906_c7_d1a5_return_output := n16_MUX_uxn_opcodes_h_l906_c7_d1a5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l909_c7_47e9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_47e9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_47e9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_47e9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_47e9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_47e9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_47e9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_47e9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_47e9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l906_c7_d1a5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_d1a5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_d1a5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_d1a5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_d1a5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_d1a5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_d1a5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_d1a5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_d1a5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l906_c7_d1a5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_d1a5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_d1a5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_d1a5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_d1a5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_d1a5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_d1a5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_d1a5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_d1a5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l909_c7_47e9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_47e9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_47e9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_47e9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_47e9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_47e9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_47e9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_47e9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_47e9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l914_c7_d305] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l914_c7_d305_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l914_c7_d305_cond;
     result_u8_value_MUX_uxn_opcodes_h_l914_c7_d305_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l914_c7_d305_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l914_c7_d305_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l914_c7_d305_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l914_c7_d305_return_output := result_u8_value_MUX_uxn_opcodes_h_l914_c7_d305_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l901_c2_9c33_iffalse := VAR_n16_MUX_uxn_opcodes_h_l906_c7_d1a5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_d1a5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l909_c7_47e9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l901_c2_9c33_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_d1a5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_d1a5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l909_c7_47e9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c2_9c33_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_d1a5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l909_c7_47e9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l914_c7_d305_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l906_c7_d1a5_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l909_c7_47e9_return_output;
     -- n16_MUX[uxn_opcodes_h_l901_c2_9c33] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l901_c2_9c33_cond <= VAR_n16_MUX_uxn_opcodes_h_l901_c2_9c33_cond;
     n16_MUX_uxn_opcodes_h_l901_c2_9c33_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l901_c2_9c33_iftrue;
     n16_MUX_uxn_opcodes_h_l901_c2_9c33_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l901_c2_9c33_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l901_c2_9c33_return_output := n16_MUX_uxn_opcodes_h_l901_c2_9c33_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l909_c7_47e9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l909_c7_47e9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l909_c7_47e9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l909_c7_47e9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l909_c7_47e9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l909_c7_47e9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l909_c7_47e9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l909_c7_47e9_return_output := result_u8_value_MUX_uxn_opcodes_h_l909_c7_47e9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l901_c2_9c33] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c2_9c33_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c2_9c33_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c2_9c33_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c2_9c33_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c2_9c33_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c2_9c33_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c2_9c33_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c2_9c33_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l906_c7_d1a5] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l906_c7_d1a5_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l906_c7_d1a5_cond;
     tmp16_MUX_uxn_opcodes_h_l906_c7_d1a5_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l906_c7_d1a5_iftrue;
     tmp16_MUX_uxn_opcodes_h_l906_c7_d1a5_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l906_c7_d1a5_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l906_c7_d1a5_return_output := tmp16_MUX_uxn_opcodes_h_l906_c7_d1a5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l906_c7_d1a5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_d1a5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_d1a5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_d1a5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_d1a5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_d1a5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_d1a5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_d1a5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_d1a5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l906_c7_d1a5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_d1a5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_d1a5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_d1a5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_d1a5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_d1a5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_d1a5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_d1a5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_d1a5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l901_c2_9c33] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l901_c2_9c33_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l901_c2_9c33_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l901_c2_9c33_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l901_c2_9c33_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l901_c2_9c33_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l901_c2_9c33_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l901_c2_9c33_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l901_c2_9c33_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l901_c2_9c33_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l901_c2_9c33_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_d1a5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l901_c2_9c33_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_d1a5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l906_c7_d1a5_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l909_c7_47e9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l901_c2_9c33_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l906_c7_d1a5_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l906_c7_d1a5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l906_c7_d1a5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l906_c7_d1a5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l906_c7_d1a5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l906_c7_d1a5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l906_c7_d1a5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l906_c7_d1a5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l906_c7_d1a5_return_output := result_u8_value_MUX_uxn_opcodes_h_l906_c7_d1a5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l901_c2_9c33] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l901_c2_9c33_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l901_c2_9c33_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l901_c2_9c33_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l901_c2_9c33_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l901_c2_9c33_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l901_c2_9c33_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l901_c2_9c33_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l901_c2_9c33_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l901_c2_9c33] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l901_c2_9c33_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l901_c2_9c33_cond;
     tmp16_MUX_uxn_opcodes_h_l901_c2_9c33_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l901_c2_9c33_iftrue;
     tmp16_MUX_uxn_opcodes_h_l901_c2_9c33_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l901_c2_9c33_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l901_c2_9c33_return_output := tmp16_MUX_uxn_opcodes_h_l901_c2_9c33_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l901_c2_9c33] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l901_c2_9c33_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l901_c2_9c33_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l901_c2_9c33_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l901_c2_9c33_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l901_c2_9c33_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l901_c2_9c33_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l901_c2_9c33_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l901_c2_9c33_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l901_c2_9c33_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l906_c7_d1a5_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l901_c2_9c33_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l901_c2_9c33] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l901_c2_9c33_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l901_c2_9c33_cond;
     result_u8_value_MUX_uxn_opcodes_h_l901_c2_9c33_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l901_c2_9c33_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l901_c2_9c33_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l901_c2_9c33_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l901_c2_9c33_return_output := result_u8_value_MUX_uxn_opcodes_h_l901_c2_9c33_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l941_l897_DUPLICATE_b51c LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l941_l897_DUPLICATE_b51c_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c551(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l901_c2_9c33_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c2_9c33_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c2_9c33_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l901_c2_9c33_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l901_c2_9c33_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l901_c2_9c33_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l941_l897_DUPLICATE_b51c_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l941_l897_DUPLICATE_b51c_return_output;
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
