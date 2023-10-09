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
entity gth2_0CLK_3a9c1537 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end gth2_0CLK_3a9c1537;
architecture arch of gth2_0CLK_3a9c1537 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2095_c6_eb58]
signal BIN_OP_EQ_uxn_opcodes_h_l2095_c6_eb58_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2095_c6_eb58_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2095_c6_eb58_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2095_c1_dc4f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2095_c1_dc4f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2095_c1_dc4f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2095_c1_dc4f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2095_c1_dc4f_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2095_c2_7fef]
signal t16_MUX_uxn_opcodes_h_l2095_c2_7fef_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2095_c2_7fef_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2095_c2_7fef_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2095_c2_7fef_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2095_c2_7fef]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2095_c2_7fef_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2095_c2_7fef_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2095_c2_7fef_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2095_c2_7fef_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2095_c2_7fef]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2095_c2_7fef_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2095_c2_7fef_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2095_c2_7fef_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2095_c2_7fef_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2095_c2_7fef]
signal result_stack_value_MUX_uxn_opcodes_h_l2095_c2_7fef_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2095_c2_7fef_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2095_c2_7fef_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2095_c2_7fef_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2095_c2_7fef]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2095_c2_7fef_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2095_c2_7fef_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2095_c2_7fef_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2095_c2_7fef_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2095_c2_7fef]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2095_c2_7fef_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2095_c2_7fef_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2095_c2_7fef_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2095_c2_7fef_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2095_c2_7fef]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2095_c2_7fef_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2095_c2_7fef_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2095_c2_7fef_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2095_c2_7fef_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2095_c2_7fef]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2095_c2_7fef_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2095_c2_7fef_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2095_c2_7fef_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2095_c2_7fef_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l2095_c2_7fef]
signal n16_MUX_uxn_opcodes_h_l2095_c2_7fef_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2095_c2_7fef_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2095_c2_7fef_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2095_c2_7fef_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2096_c3_df40[uxn_opcodes_h_l2096_c3_df40]
signal printf_uxn_opcodes_h_l2096_c3_df40_uxn_opcodes_h_l2096_c3_df40_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2101_c11_60a6]
signal BIN_OP_EQ_uxn_opcodes_h_l2101_c11_60a6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2101_c11_60a6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2101_c11_60a6_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2101_c7_9120]
signal t16_MUX_uxn_opcodes_h_l2101_c7_9120_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2101_c7_9120_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2101_c7_9120_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2101_c7_9120_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2101_c7_9120]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2101_c7_9120_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2101_c7_9120_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2101_c7_9120_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2101_c7_9120_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2101_c7_9120]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_9120_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_9120_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_9120_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_9120_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2101_c7_9120]
signal result_stack_value_MUX_uxn_opcodes_h_l2101_c7_9120_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2101_c7_9120_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2101_c7_9120_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2101_c7_9120_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2101_c7_9120]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_9120_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_9120_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_9120_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_9120_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2101_c7_9120]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_9120_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_9120_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_9120_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_9120_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2101_c7_9120]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_9120_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_9120_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_9120_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_9120_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2101_c7_9120]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_9120_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_9120_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_9120_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_9120_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l2101_c7_9120]
signal n16_MUX_uxn_opcodes_h_l2101_c7_9120_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2101_c7_9120_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2101_c7_9120_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2101_c7_9120_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2104_c11_429e]
signal BIN_OP_EQ_uxn_opcodes_h_l2104_c11_429e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2104_c11_429e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2104_c11_429e_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2104_c7_f327]
signal t16_MUX_uxn_opcodes_h_l2104_c7_f327_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2104_c7_f327_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2104_c7_f327_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2104_c7_f327_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2104_c7_f327]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2104_c7_f327_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2104_c7_f327_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2104_c7_f327_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2104_c7_f327_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2104_c7_f327]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_f327_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_f327_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_f327_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_f327_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2104_c7_f327]
signal result_stack_value_MUX_uxn_opcodes_h_l2104_c7_f327_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2104_c7_f327_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2104_c7_f327_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2104_c7_f327_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2104_c7_f327]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2104_c7_f327_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2104_c7_f327_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2104_c7_f327_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2104_c7_f327_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2104_c7_f327]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_f327_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_f327_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_f327_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_f327_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2104_c7_f327]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_f327_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_f327_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_f327_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_f327_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2104_c7_f327]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_f327_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_f327_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_f327_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_f327_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l2104_c7_f327]
signal n16_MUX_uxn_opcodes_h_l2104_c7_f327_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2104_c7_f327_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2104_c7_f327_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2104_c7_f327_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2109_c11_afc8]
signal BIN_OP_EQ_uxn_opcodes_h_l2109_c11_afc8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2109_c11_afc8_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2109_c11_afc8_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2109_c7_c534]
signal t16_MUX_uxn_opcodes_h_l2109_c7_c534_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2109_c7_c534_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2109_c7_c534_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2109_c7_c534_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2109_c7_c534]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2109_c7_c534_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2109_c7_c534_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2109_c7_c534_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2109_c7_c534_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2109_c7_c534]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2109_c7_c534_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2109_c7_c534_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2109_c7_c534_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2109_c7_c534_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2109_c7_c534]
signal result_stack_value_MUX_uxn_opcodes_h_l2109_c7_c534_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2109_c7_c534_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2109_c7_c534_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2109_c7_c534_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2109_c7_c534]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_c534_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_c534_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_c534_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_c534_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2109_c7_c534]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_c534_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_c534_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_c534_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_c534_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2109_c7_c534]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_c534_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_c534_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_c534_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_c534_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2109_c7_c534]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_c534_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_c534_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_c534_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_c534_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l2109_c7_c534]
signal n16_MUX_uxn_opcodes_h_l2109_c7_c534_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2109_c7_c534_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2109_c7_c534_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2109_c7_c534_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2112_c11_c46d]
signal BIN_OP_EQ_uxn_opcodes_h_l2112_c11_c46d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2112_c11_c46d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2112_c11_c46d_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2112_c7_c88f]
signal t16_MUX_uxn_opcodes_h_l2112_c7_c88f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2112_c7_c88f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2112_c7_c88f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2112_c7_c88f_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2112_c7_c88f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2112_c7_c88f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2112_c7_c88f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2112_c7_c88f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2112_c7_c88f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2112_c7_c88f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_c88f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_c88f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_c88f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_c88f_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2112_c7_c88f]
signal result_stack_value_MUX_uxn_opcodes_h_l2112_c7_c88f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2112_c7_c88f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2112_c7_c88f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2112_c7_c88f_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2112_c7_c88f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2112_c7_c88f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2112_c7_c88f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2112_c7_c88f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2112_c7_c88f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2112_c7_c88f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_c88f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_c88f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_c88f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_c88f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2112_c7_c88f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_c88f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_c88f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_c88f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_c88f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2112_c7_c88f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_c88f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_c88f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_c88f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_c88f_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l2112_c7_c88f]
signal n16_MUX_uxn_opcodes_h_l2112_c7_c88f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2112_c7_c88f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2112_c7_c88f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2112_c7_c88f_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2113_c3_df16]
signal BIN_OP_OR_uxn_opcodes_h_l2113_c3_df16_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2113_c3_df16_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2113_c3_df16_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2116_c11_40a2]
signal BIN_OP_EQ_uxn_opcodes_h_l2116_c11_40a2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2116_c11_40a2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2116_c11_40a2_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2116_c7_59f5]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2116_c7_59f5_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2116_c7_59f5_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2116_c7_59f5_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2116_c7_59f5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2116_c7_59f5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_59f5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_59f5_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_59f5_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_59f5_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2116_c7_59f5]
signal result_stack_value_MUX_uxn_opcodes_h_l2116_c7_59f5_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2116_c7_59f5_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2116_c7_59f5_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2116_c7_59f5_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2116_c7_59f5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_59f5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_59f5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_59f5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_59f5_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2116_c7_59f5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_59f5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_59f5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_59f5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_59f5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2116_c7_59f5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_59f5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_59f5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_59f5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_59f5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2116_c7_59f5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_59f5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_59f5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_59f5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_59f5_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l2116_c7_59f5]
signal n16_MUX_uxn_opcodes_h_l2116_c7_59f5_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2116_c7_59f5_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2116_c7_59f5_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2116_c7_59f5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2119_c11_f1ad]
signal BIN_OP_EQ_uxn_opcodes_h_l2119_c11_f1ad_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2119_c11_f1ad_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2119_c11_f1ad_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2119_c7_d1c4]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2119_c7_d1c4_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2119_c7_d1c4_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2119_c7_d1c4_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2119_c7_d1c4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2119_c7_d1c4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_d1c4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_d1c4_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_d1c4_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_d1c4_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2119_c7_d1c4]
signal result_stack_value_MUX_uxn_opcodes_h_l2119_c7_d1c4_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2119_c7_d1c4_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2119_c7_d1c4_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2119_c7_d1c4_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2119_c7_d1c4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2119_c7_d1c4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2119_c7_d1c4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2119_c7_d1c4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2119_c7_d1c4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2119_c7_d1c4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_d1c4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_d1c4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_d1c4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_d1c4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2119_c7_d1c4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_d1c4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_d1c4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_d1c4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_d1c4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2119_c7_d1c4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_d1c4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_d1c4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_d1c4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_d1c4_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l2119_c7_d1c4]
signal n16_MUX_uxn_opcodes_h_l2119_c7_d1c4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2119_c7_d1c4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2119_c7_d1c4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2119_c7_d1c4_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2124_c11_df46]
signal BIN_OP_EQ_uxn_opcodes_h_l2124_c11_df46_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2124_c11_df46_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2124_c11_df46_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2124_c7_4e3d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2124_c7_4e3d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2124_c7_4e3d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2124_c7_4e3d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2124_c7_4e3d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2124_c7_4e3d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2124_c7_4e3d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2124_c7_4e3d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2124_c7_4e3d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2124_c7_4e3d_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2124_c7_4e3d]
signal result_stack_value_MUX_uxn_opcodes_h_l2124_c7_4e3d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2124_c7_4e3d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2124_c7_4e3d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2124_c7_4e3d_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2124_c7_4e3d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2124_c7_4e3d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2124_c7_4e3d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2124_c7_4e3d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2124_c7_4e3d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2124_c7_4e3d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2124_c7_4e3d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2124_c7_4e3d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2124_c7_4e3d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2124_c7_4e3d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2124_c7_4e3d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2124_c7_4e3d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2124_c7_4e3d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2124_c7_4e3d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2124_c7_4e3d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2124_c7_4e3d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2124_c7_4e3d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2124_c7_4e3d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2124_c7_4e3d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2124_c7_4e3d_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l2124_c7_4e3d]
signal n16_MUX_uxn_opcodes_h_l2124_c7_4e3d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2124_c7_4e3d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2124_c7_4e3d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2124_c7_4e3d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2127_c11_05ea]
signal BIN_OP_EQ_uxn_opcodes_h_l2127_c11_05ea_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2127_c11_05ea_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2127_c11_05ea_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2127_c7_4079]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2127_c7_4079_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2127_c7_4079_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2127_c7_4079_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2127_c7_4079_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2127_c7_4079]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_4079_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_4079_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_4079_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_4079_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2127_c7_4079]
signal result_stack_value_MUX_uxn_opcodes_h_l2127_c7_4079_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2127_c7_4079_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2127_c7_4079_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2127_c7_4079_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2127_c7_4079]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2127_c7_4079_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2127_c7_4079_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2127_c7_4079_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2127_c7_4079_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2127_c7_4079]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2127_c7_4079_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2127_c7_4079_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2127_c7_4079_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2127_c7_4079_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2127_c7_4079]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_4079_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_4079_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_4079_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_4079_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2127_c7_4079]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_4079_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_4079_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_4079_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_4079_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l2127_c7_4079]
signal n16_MUX_uxn_opcodes_h_l2127_c7_4079_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2127_c7_4079_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2127_c7_4079_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2127_c7_4079_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2128_c3_4633]
signal BIN_OP_OR_uxn_opcodes_h_l2128_c3_4633_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2128_c3_4633_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2128_c3_4633_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2131_c32_8012]
signal BIN_OP_AND_uxn_opcodes_h_l2131_c32_8012_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2131_c32_8012_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2131_c32_8012_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2131_c32_a9b7]
signal BIN_OP_GT_uxn_opcodes_h_l2131_c32_a9b7_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2131_c32_a9b7_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2131_c32_a9b7_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2131_c32_4489]
signal MUX_uxn_opcodes_h_l2131_c32_4489_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2131_c32_4489_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2131_c32_4489_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2131_c32_4489_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2133_c11_746e]
signal BIN_OP_EQ_uxn_opcodes_h_l2133_c11_746e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2133_c11_746e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2133_c11_746e_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2133_c7_dfa4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_dfa4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_dfa4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_dfa4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_dfa4_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2133_c7_dfa4]
signal result_stack_value_MUX_uxn_opcodes_h_l2133_c7_dfa4_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2133_c7_dfa4_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2133_c7_dfa4_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2133_c7_dfa4_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2133_c7_dfa4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_dfa4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_dfa4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_dfa4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_dfa4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2133_c7_dfa4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_dfa4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_dfa4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_dfa4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_dfa4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2133_c7_dfa4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_dfa4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_dfa4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_dfa4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_dfa4_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2137_c24_b41f]
signal BIN_OP_GT_uxn_opcodes_h_l2137_c24_b41f_left : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2137_c24_b41f_right : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2137_c24_b41f_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2137_c24_cb4a]
signal MUX_uxn_opcodes_h_l2137_c24_cb4a_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2137_c24_cb4a_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2137_c24_cb4a_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2137_c24_cb4a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2139_c11_343c]
signal BIN_OP_EQ_uxn_opcodes_h_l2139_c11_343c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2139_c11_343c_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2139_c11_343c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2139_c7_7bb2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2139_c7_7bb2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2139_c7_7bb2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2139_c7_7bb2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2139_c7_7bb2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2139_c7_7bb2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2139_c7_7bb2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2139_c7_7bb2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2139_c7_7bb2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2139_c7_7bb2_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2106_l2121_DUPLICATE_a6e0
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2106_l2121_DUPLICATE_a6e0_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2106_l2121_DUPLICATE_a6e0_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : signed;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_read := ref_toks_1;
      base.sp_relative_shift := ref_toks_2;
      base.stack_value := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2095_c6_eb58
BIN_OP_EQ_uxn_opcodes_h_l2095_c6_eb58 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2095_c6_eb58_left,
BIN_OP_EQ_uxn_opcodes_h_l2095_c6_eb58_right,
BIN_OP_EQ_uxn_opcodes_h_l2095_c6_eb58_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2095_c1_dc4f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2095_c1_dc4f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2095_c1_dc4f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2095_c1_dc4f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2095_c1_dc4f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2095_c1_dc4f_return_output);

-- t16_MUX_uxn_opcodes_h_l2095_c2_7fef
t16_MUX_uxn_opcodes_h_l2095_c2_7fef : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2095_c2_7fef_cond,
t16_MUX_uxn_opcodes_h_l2095_c2_7fef_iftrue,
t16_MUX_uxn_opcodes_h_l2095_c2_7fef_iffalse,
t16_MUX_uxn_opcodes_h_l2095_c2_7fef_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2095_c2_7fef
result_is_stack_read_MUX_uxn_opcodes_h_l2095_c2_7fef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2095_c2_7fef_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2095_c2_7fef_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2095_c2_7fef_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2095_c2_7fef_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2095_c2_7fef
result_sp_relative_shift_MUX_uxn_opcodes_h_l2095_c2_7fef : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2095_c2_7fef_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2095_c2_7fef_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2095_c2_7fef_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2095_c2_7fef_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2095_c2_7fef
result_stack_value_MUX_uxn_opcodes_h_l2095_c2_7fef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2095_c2_7fef_cond,
result_stack_value_MUX_uxn_opcodes_h_l2095_c2_7fef_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2095_c2_7fef_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2095_c2_7fef_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2095_c2_7fef
result_is_sp_shift_MUX_uxn_opcodes_h_l2095_c2_7fef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2095_c2_7fef_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2095_c2_7fef_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2095_c2_7fef_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2095_c2_7fef_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2095_c2_7fef
result_is_stack_write_MUX_uxn_opcodes_h_l2095_c2_7fef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2095_c2_7fef_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2095_c2_7fef_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2095_c2_7fef_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2095_c2_7fef_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2095_c2_7fef
result_is_opc_done_MUX_uxn_opcodes_h_l2095_c2_7fef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2095_c2_7fef_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2095_c2_7fef_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2095_c2_7fef_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2095_c2_7fef_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2095_c2_7fef
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2095_c2_7fef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2095_c2_7fef_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2095_c2_7fef_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2095_c2_7fef_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2095_c2_7fef_return_output);

-- n16_MUX_uxn_opcodes_h_l2095_c2_7fef
n16_MUX_uxn_opcodes_h_l2095_c2_7fef : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2095_c2_7fef_cond,
n16_MUX_uxn_opcodes_h_l2095_c2_7fef_iftrue,
n16_MUX_uxn_opcodes_h_l2095_c2_7fef_iffalse,
n16_MUX_uxn_opcodes_h_l2095_c2_7fef_return_output);

-- printf_uxn_opcodes_h_l2096_c3_df40_uxn_opcodes_h_l2096_c3_df40
printf_uxn_opcodes_h_l2096_c3_df40_uxn_opcodes_h_l2096_c3_df40 : entity work.printf_uxn_opcodes_h_l2096_c3_df40_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2096_c3_df40_uxn_opcodes_h_l2096_c3_df40_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2101_c11_60a6
BIN_OP_EQ_uxn_opcodes_h_l2101_c11_60a6 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2101_c11_60a6_left,
BIN_OP_EQ_uxn_opcodes_h_l2101_c11_60a6_right,
BIN_OP_EQ_uxn_opcodes_h_l2101_c11_60a6_return_output);

-- t16_MUX_uxn_opcodes_h_l2101_c7_9120
t16_MUX_uxn_opcodes_h_l2101_c7_9120 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2101_c7_9120_cond,
t16_MUX_uxn_opcodes_h_l2101_c7_9120_iftrue,
t16_MUX_uxn_opcodes_h_l2101_c7_9120_iffalse,
t16_MUX_uxn_opcodes_h_l2101_c7_9120_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2101_c7_9120
result_is_stack_read_MUX_uxn_opcodes_h_l2101_c7_9120 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2101_c7_9120_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2101_c7_9120_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2101_c7_9120_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2101_c7_9120_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_9120
result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_9120 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_9120_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_9120_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_9120_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_9120_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2101_c7_9120
result_stack_value_MUX_uxn_opcodes_h_l2101_c7_9120 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2101_c7_9120_cond,
result_stack_value_MUX_uxn_opcodes_h_l2101_c7_9120_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2101_c7_9120_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2101_c7_9120_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_9120
result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_9120 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_9120_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_9120_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_9120_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_9120_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_9120
result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_9120 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_9120_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_9120_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_9120_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_9120_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_9120
result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_9120 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_9120_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_9120_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_9120_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_9120_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_9120
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_9120 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_9120_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_9120_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_9120_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_9120_return_output);

-- n16_MUX_uxn_opcodes_h_l2101_c7_9120
n16_MUX_uxn_opcodes_h_l2101_c7_9120 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2101_c7_9120_cond,
n16_MUX_uxn_opcodes_h_l2101_c7_9120_iftrue,
n16_MUX_uxn_opcodes_h_l2101_c7_9120_iffalse,
n16_MUX_uxn_opcodes_h_l2101_c7_9120_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2104_c11_429e
BIN_OP_EQ_uxn_opcodes_h_l2104_c11_429e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2104_c11_429e_left,
BIN_OP_EQ_uxn_opcodes_h_l2104_c11_429e_right,
BIN_OP_EQ_uxn_opcodes_h_l2104_c11_429e_return_output);

-- t16_MUX_uxn_opcodes_h_l2104_c7_f327
t16_MUX_uxn_opcodes_h_l2104_c7_f327 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2104_c7_f327_cond,
t16_MUX_uxn_opcodes_h_l2104_c7_f327_iftrue,
t16_MUX_uxn_opcodes_h_l2104_c7_f327_iffalse,
t16_MUX_uxn_opcodes_h_l2104_c7_f327_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2104_c7_f327
result_is_stack_read_MUX_uxn_opcodes_h_l2104_c7_f327 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2104_c7_f327_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2104_c7_f327_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2104_c7_f327_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2104_c7_f327_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_f327
result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_f327 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_f327_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_f327_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_f327_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_f327_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2104_c7_f327
result_stack_value_MUX_uxn_opcodes_h_l2104_c7_f327 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2104_c7_f327_cond,
result_stack_value_MUX_uxn_opcodes_h_l2104_c7_f327_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2104_c7_f327_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2104_c7_f327_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2104_c7_f327
result_is_sp_shift_MUX_uxn_opcodes_h_l2104_c7_f327 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2104_c7_f327_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2104_c7_f327_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2104_c7_f327_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2104_c7_f327_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_f327
result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_f327 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_f327_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_f327_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_f327_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_f327_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_f327
result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_f327 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_f327_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_f327_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_f327_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_f327_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_f327
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_f327 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_f327_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_f327_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_f327_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_f327_return_output);

-- n16_MUX_uxn_opcodes_h_l2104_c7_f327
n16_MUX_uxn_opcodes_h_l2104_c7_f327 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2104_c7_f327_cond,
n16_MUX_uxn_opcodes_h_l2104_c7_f327_iftrue,
n16_MUX_uxn_opcodes_h_l2104_c7_f327_iffalse,
n16_MUX_uxn_opcodes_h_l2104_c7_f327_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2109_c11_afc8
BIN_OP_EQ_uxn_opcodes_h_l2109_c11_afc8 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2109_c11_afc8_left,
BIN_OP_EQ_uxn_opcodes_h_l2109_c11_afc8_right,
BIN_OP_EQ_uxn_opcodes_h_l2109_c11_afc8_return_output);

-- t16_MUX_uxn_opcodes_h_l2109_c7_c534
t16_MUX_uxn_opcodes_h_l2109_c7_c534 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2109_c7_c534_cond,
t16_MUX_uxn_opcodes_h_l2109_c7_c534_iftrue,
t16_MUX_uxn_opcodes_h_l2109_c7_c534_iffalse,
t16_MUX_uxn_opcodes_h_l2109_c7_c534_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2109_c7_c534
result_is_stack_read_MUX_uxn_opcodes_h_l2109_c7_c534 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2109_c7_c534_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2109_c7_c534_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2109_c7_c534_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2109_c7_c534_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2109_c7_c534
result_sp_relative_shift_MUX_uxn_opcodes_h_l2109_c7_c534 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2109_c7_c534_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2109_c7_c534_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2109_c7_c534_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2109_c7_c534_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2109_c7_c534
result_stack_value_MUX_uxn_opcodes_h_l2109_c7_c534 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2109_c7_c534_cond,
result_stack_value_MUX_uxn_opcodes_h_l2109_c7_c534_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2109_c7_c534_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2109_c7_c534_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_c534
result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_c534 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_c534_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_c534_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_c534_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_c534_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_c534
result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_c534 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_c534_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_c534_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_c534_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_c534_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_c534
result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_c534 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_c534_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_c534_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_c534_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_c534_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_c534
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_c534 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_c534_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_c534_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_c534_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_c534_return_output);

-- n16_MUX_uxn_opcodes_h_l2109_c7_c534
n16_MUX_uxn_opcodes_h_l2109_c7_c534 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2109_c7_c534_cond,
n16_MUX_uxn_opcodes_h_l2109_c7_c534_iftrue,
n16_MUX_uxn_opcodes_h_l2109_c7_c534_iffalse,
n16_MUX_uxn_opcodes_h_l2109_c7_c534_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2112_c11_c46d
BIN_OP_EQ_uxn_opcodes_h_l2112_c11_c46d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2112_c11_c46d_left,
BIN_OP_EQ_uxn_opcodes_h_l2112_c11_c46d_right,
BIN_OP_EQ_uxn_opcodes_h_l2112_c11_c46d_return_output);

-- t16_MUX_uxn_opcodes_h_l2112_c7_c88f
t16_MUX_uxn_opcodes_h_l2112_c7_c88f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2112_c7_c88f_cond,
t16_MUX_uxn_opcodes_h_l2112_c7_c88f_iftrue,
t16_MUX_uxn_opcodes_h_l2112_c7_c88f_iffalse,
t16_MUX_uxn_opcodes_h_l2112_c7_c88f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2112_c7_c88f
result_is_stack_read_MUX_uxn_opcodes_h_l2112_c7_c88f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2112_c7_c88f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2112_c7_c88f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2112_c7_c88f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2112_c7_c88f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_c88f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_c88f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_c88f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_c88f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_c88f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_c88f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2112_c7_c88f
result_stack_value_MUX_uxn_opcodes_h_l2112_c7_c88f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2112_c7_c88f_cond,
result_stack_value_MUX_uxn_opcodes_h_l2112_c7_c88f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2112_c7_c88f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2112_c7_c88f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2112_c7_c88f
result_is_sp_shift_MUX_uxn_opcodes_h_l2112_c7_c88f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2112_c7_c88f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2112_c7_c88f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2112_c7_c88f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2112_c7_c88f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_c88f
result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_c88f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_c88f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_c88f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_c88f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_c88f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_c88f
result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_c88f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_c88f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_c88f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_c88f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_c88f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_c88f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_c88f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_c88f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_c88f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_c88f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_c88f_return_output);

-- n16_MUX_uxn_opcodes_h_l2112_c7_c88f
n16_MUX_uxn_opcodes_h_l2112_c7_c88f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2112_c7_c88f_cond,
n16_MUX_uxn_opcodes_h_l2112_c7_c88f_iftrue,
n16_MUX_uxn_opcodes_h_l2112_c7_c88f_iffalse,
n16_MUX_uxn_opcodes_h_l2112_c7_c88f_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2113_c3_df16
BIN_OP_OR_uxn_opcodes_h_l2113_c3_df16 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2113_c3_df16_left,
BIN_OP_OR_uxn_opcodes_h_l2113_c3_df16_right,
BIN_OP_OR_uxn_opcodes_h_l2113_c3_df16_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2116_c11_40a2
BIN_OP_EQ_uxn_opcodes_h_l2116_c11_40a2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2116_c11_40a2_left,
BIN_OP_EQ_uxn_opcodes_h_l2116_c11_40a2_right,
BIN_OP_EQ_uxn_opcodes_h_l2116_c11_40a2_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2116_c7_59f5
result_is_stack_read_MUX_uxn_opcodes_h_l2116_c7_59f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2116_c7_59f5_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2116_c7_59f5_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2116_c7_59f5_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2116_c7_59f5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_59f5
result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_59f5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_59f5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_59f5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_59f5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_59f5_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2116_c7_59f5
result_stack_value_MUX_uxn_opcodes_h_l2116_c7_59f5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2116_c7_59f5_cond,
result_stack_value_MUX_uxn_opcodes_h_l2116_c7_59f5_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2116_c7_59f5_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2116_c7_59f5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_59f5
result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_59f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_59f5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_59f5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_59f5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_59f5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_59f5
result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_59f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_59f5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_59f5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_59f5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_59f5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_59f5
result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_59f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_59f5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_59f5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_59f5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_59f5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_59f5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_59f5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_59f5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_59f5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_59f5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_59f5_return_output);

-- n16_MUX_uxn_opcodes_h_l2116_c7_59f5
n16_MUX_uxn_opcodes_h_l2116_c7_59f5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2116_c7_59f5_cond,
n16_MUX_uxn_opcodes_h_l2116_c7_59f5_iftrue,
n16_MUX_uxn_opcodes_h_l2116_c7_59f5_iffalse,
n16_MUX_uxn_opcodes_h_l2116_c7_59f5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2119_c11_f1ad
BIN_OP_EQ_uxn_opcodes_h_l2119_c11_f1ad : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2119_c11_f1ad_left,
BIN_OP_EQ_uxn_opcodes_h_l2119_c11_f1ad_right,
BIN_OP_EQ_uxn_opcodes_h_l2119_c11_f1ad_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2119_c7_d1c4
result_is_stack_read_MUX_uxn_opcodes_h_l2119_c7_d1c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2119_c7_d1c4_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2119_c7_d1c4_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2119_c7_d1c4_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2119_c7_d1c4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_d1c4
result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_d1c4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_d1c4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_d1c4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_d1c4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_d1c4_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2119_c7_d1c4
result_stack_value_MUX_uxn_opcodes_h_l2119_c7_d1c4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2119_c7_d1c4_cond,
result_stack_value_MUX_uxn_opcodes_h_l2119_c7_d1c4_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2119_c7_d1c4_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2119_c7_d1c4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2119_c7_d1c4
result_is_sp_shift_MUX_uxn_opcodes_h_l2119_c7_d1c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2119_c7_d1c4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2119_c7_d1c4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2119_c7_d1c4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2119_c7_d1c4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_d1c4
result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_d1c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_d1c4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_d1c4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_d1c4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_d1c4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_d1c4
result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_d1c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_d1c4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_d1c4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_d1c4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_d1c4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_d1c4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_d1c4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_d1c4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_d1c4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_d1c4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_d1c4_return_output);

-- n16_MUX_uxn_opcodes_h_l2119_c7_d1c4
n16_MUX_uxn_opcodes_h_l2119_c7_d1c4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2119_c7_d1c4_cond,
n16_MUX_uxn_opcodes_h_l2119_c7_d1c4_iftrue,
n16_MUX_uxn_opcodes_h_l2119_c7_d1c4_iffalse,
n16_MUX_uxn_opcodes_h_l2119_c7_d1c4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2124_c11_df46
BIN_OP_EQ_uxn_opcodes_h_l2124_c11_df46 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2124_c11_df46_left,
BIN_OP_EQ_uxn_opcodes_h_l2124_c11_df46_right,
BIN_OP_EQ_uxn_opcodes_h_l2124_c11_df46_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2124_c7_4e3d
result_is_stack_read_MUX_uxn_opcodes_h_l2124_c7_4e3d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2124_c7_4e3d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2124_c7_4e3d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2124_c7_4e3d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2124_c7_4e3d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2124_c7_4e3d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2124_c7_4e3d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2124_c7_4e3d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2124_c7_4e3d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2124_c7_4e3d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2124_c7_4e3d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2124_c7_4e3d
result_stack_value_MUX_uxn_opcodes_h_l2124_c7_4e3d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2124_c7_4e3d_cond,
result_stack_value_MUX_uxn_opcodes_h_l2124_c7_4e3d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2124_c7_4e3d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2124_c7_4e3d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2124_c7_4e3d
result_is_sp_shift_MUX_uxn_opcodes_h_l2124_c7_4e3d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2124_c7_4e3d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2124_c7_4e3d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2124_c7_4e3d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2124_c7_4e3d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2124_c7_4e3d
result_is_stack_write_MUX_uxn_opcodes_h_l2124_c7_4e3d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2124_c7_4e3d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2124_c7_4e3d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2124_c7_4e3d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2124_c7_4e3d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2124_c7_4e3d
result_is_opc_done_MUX_uxn_opcodes_h_l2124_c7_4e3d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2124_c7_4e3d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2124_c7_4e3d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2124_c7_4e3d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2124_c7_4e3d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2124_c7_4e3d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2124_c7_4e3d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2124_c7_4e3d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2124_c7_4e3d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2124_c7_4e3d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2124_c7_4e3d_return_output);

-- n16_MUX_uxn_opcodes_h_l2124_c7_4e3d
n16_MUX_uxn_opcodes_h_l2124_c7_4e3d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2124_c7_4e3d_cond,
n16_MUX_uxn_opcodes_h_l2124_c7_4e3d_iftrue,
n16_MUX_uxn_opcodes_h_l2124_c7_4e3d_iffalse,
n16_MUX_uxn_opcodes_h_l2124_c7_4e3d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2127_c11_05ea
BIN_OP_EQ_uxn_opcodes_h_l2127_c11_05ea : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2127_c11_05ea_left,
BIN_OP_EQ_uxn_opcodes_h_l2127_c11_05ea_right,
BIN_OP_EQ_uxn_opcodes_h_l2127_c11_05ea_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2127_c7_4079
result_is_stack_read_MUX_uxn_opcodes_h_l2127_c7_4079 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2127_c7_4079_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2127_c7_4079_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2127_c7_4079_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2127_c7_4079_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_4079
result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_4079 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_4079_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_4079_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_4079_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_4079_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2127_c7_4079
result_stack_value_MUX_uxn_opcodes_h_l2127_c7_4079 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2127_c7_4079_cond,
result_stack_value_MUX_uxn_opcodes_h_l2127_c7_4079_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2127_c7_4079_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2127_c7_4079_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2127_c7_4079
result_is_sp_shift_MUX_uxn_opcodes_h_l2127_c7_4079 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2127_c7_4079_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2127_c7_4079_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2127_c7_4079_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2127_c7_4079_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2127_c7_4079
result_is_stack_write_MUX_uxn_opcodes_h_l2127_c7_4079 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2127_c7_4079_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2127_c7_4079_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2127_c7_4079_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2127_c7_4079_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_4079
result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_4079 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_4079_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_4079_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_4079_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_4079_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_4079
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_4079 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_4079_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_4079_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_4079_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_4079_return_output);

-- n16_MUX_uxn_opcodes_h_l2127_c7_4079
n16_MUX_uxn_opcodes_h_l2127_c7_4079 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2127_c7_4079_cond,
n16_MUX_uxn_opcodes_h_l2127_c7_4079_iftrue,
n16_MUX_uxn_opcodes_h_l2127_c7_4079_iffalse,
n16_MUX_uxn_opcodes_h_l2127_c7_4079_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2128_c3_4633
BIN_OP_OR_uxn_opcodes_h_l2128_c3_4633 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2128_c3_4633_left,
BIN_OP_OR_uxn_opcodes_h_l2128_c3_4633_right,
BIN_OP_OR_uxn_opcodes_h_l2128_c3_4633_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2131_c32_8012
BIN_OP_AND_uxn_opcodes_h_l2131_c32_8012 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2131_c32_8012_left,
BIN_OP_AND_uxn_opcodes_h_l2131_c32_8012_right,
BIN_OP_AND_uxn_opcodes_h_l2131_c32_8012_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2131_c32_a9b7
BIN_OP_GT_uxn_opcodes_h_l2131_c32_a9b7 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2131_c32_a9b7_left,
BIN_OP_GT_uxn_opcodes_h_l2131_c32_a9b7_right,
BIN_OP_GT_uxn_opcodes_h_l2131_c32_a9b7_return_output);

-- MUX_uxn_opcodes_h_l2131_c32_4489
MUX_uxn_opcodes_h_l2131_c32_4489 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2131_c32_4489_cond,
MUX_uxn_opcodes_h_l2131_c32_4489_iftrue,
MUX_uxn_opcodes_h_l2131_c32_4489_iffalse,
MUX_uxn_opcodes_h_l2131_c32_4489_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2133_c11_746e
BIN_OP_EQ_uxn_opcodes_h_l2133_c11_746e : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2133_c11_746e_left,
BIN_OP_EQ_uxn_opcodes_h_l2133_c11_746e_right,
BIN_OP_EQ_uxn_opcodes_h_l2133_c11_746e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_dfa4
result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_dfa4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_dfa4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_dfa4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_dfa4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_dfa4_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2133_c7_dfa4
result_stack_value_MUX_uxn_opcodes_h_l2133_c7_dfa4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2133_c7_dfa4_cond,
result_stack_value_MUX_uxn_opcodes_h_l2133_c7_dfa4_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2133_c7_dfa4_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2133_c7_dfa4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_dfa4
result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_dfa4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_dfa4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_dfa4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_dfa4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_dfa4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_dfa4
result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_dfa4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_dfa4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_dfa4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_dfa4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_dfa4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_dfa4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_dfa4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_dfa4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_dfa4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_dfa4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_dfa4_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2137_c24_b41f
BIN_OP_GT_uxn_opcodes_h_l2137_c24_b41f : entity work.BIN_OP_GT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2137_c24_b41f_left,
BIN_OP_GT_uxn_opcodes_h_l2137_c24_b41f_right,
BIN_OP_GT_uxn_opcodes_h_l2137_c24_b41f_return_output);

-- MUX_uxn_opcodes_h_l2137_c24_cb4a
MUX_uxn_opcodes_h_l2137_c24_cb4a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2137_c24_cb4a_cond,
MUX_uxn_opcodes_h_l2137_c24_cb4a_iftrue,
MUX_uxn_opcodes_h_l2137_c24_cb4a_iffalse,
MUX_uxn_opcodes_h_l2137_c24_cb4a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2139_c11_343c
BIN_OP_EQ_uxn_opcodes_h_l2139_c11_343c : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2139_c11_343c_left,
BIN_OP_EQ_uxn_opcodes_h_l2139_c11_343c_right,
BIN_OP_EQ_uxn_opcodes_h_l2139_c11_343c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2139_c7_7bb2
result_is_stack_write_MUX_uxn_opcodes_h_l2139_c7_7bb2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2139_c7_7bb2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2139_c7_7bb2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2139_c7_7bb2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2139_c7_7bb2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2139_c7_7bb2
result_is_opc_done_MUX_uxn_opcodes_h_l2139_c7_7bb2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2139_c7_7bb2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2139_c7_7bb2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2139_c7_7bb2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2139_c7_7bb2_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2106_l2121_DUPLICATE_a6e0
CONST_SL_8_uint16_t_uxn_opcodes_h_l2106_l2121_DUPLICATE_a6e0 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2106_l2121_DUPLICATE_a6e0_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2106_l2121_DUPLICATE_a6e0_return_output);



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
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2095_c6_eb58_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2095_c1_dc4f_return_output,
 t16_MUX_uxn_opcodes_h_l2095_c2_7fef_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2095_c2_7fef_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2095_c2_7fef_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2095_c2_7fef_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2095_c2_7fef_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2095_c2_7fef_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2095_c2_7fef_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2095_c2_7fef_return_output,
 n16_MUX_uxn_opcodes_h_l2095_c2_7fef_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2101_c11_60a6_return_output,
 t16_MUX_uxn_opcodes_h_l2101_c7_9120_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2101_c7_9120_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_9120_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2101_c7_9120_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_9120_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_9120_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_9120_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_9120_return_output,
 n16_MUX_uxn_opcodes_h_l2101_c7_9120_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2104_c11_429e_return_output,
 t16_MUX_uxn_opcodes_h_l2104_c7_f327_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2104_c7_f327_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_f327_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2104_c7_f327_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2104_c7_f327_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_f327_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_f327_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_f327_return_output,
 n16_MUX_uxn_opcodes_h_l2104_c7_f327_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2109_c11_afc8_return_output,
 t16_MUX_uxn_opcodes_h_l2109_c7_c534_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2109_c7_c534_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2109_c7_c534_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2109_c7_c534_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_c534_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_c534_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_c534_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_c534_return_output,
 n16_MUX_uxn_opcodes_h_l2109_c7_c534_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2112_c11_c46d_return_output,
 t16_MUX_uxn_opcodes_h_l2112_c7_c88f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2112_c7_c88f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_c88f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2112_c7_c88f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2112_c7_c88f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_c88f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_c88f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_c88f_return_output,
 n16_MUX_uxn_opcodes_h_l2112_c7_c88f_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2113_c3_df16_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2116_c11_40a2_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2116_c7_59f5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_59f5_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2116_c7_59f5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_59f5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_59f5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_59f5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_59f5_return_output,
 n16_MUX_uxn_opcodes_h_l2116_c7_59f5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2119_c11_f1ad_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2119_c7_d1c4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_d1c4_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2119_c7_d1c4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2119_c7_d1c4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_d1c4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_d1c4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_d1c4_return_output,
 n16_MUX_uxn_opcodes_h_l2119_c7_d1c4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2124_c11_df46_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2124_c7_4e3d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2124_c7_4e3d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2124_c7_4e3d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2124_c7_4e3d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2124_c7_4e3d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2124_c7_4e3d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2124_c7_4e3d_return_output,
 n16_MUX_uxn_opcodes_h_l2124_c7_4e3d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2127_c11_05ea_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2127_c7_4079_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_4079_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2127_c7_4079_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2127_c7_4079_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2127_c7_4079_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_4079_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_4079_return_output,
 n16_MUX_uxn_opcodes_h_l2127_c7_4079_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2128_c3_4633_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2131_c32_8012_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2131_c32_a9b7_return_output,
 MUX_uxn_opcodes_h_l2131_c32_4489_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2133_c11_746e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_dfa4_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2133_c7_dfa4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_dfa4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_dfa4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_dfa4_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2137_c24_b41f_return_output,
 MUX_uxn_opcodes_h_l2137_c24_cb4a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2139_c11_343c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2139_c7_7bb2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2139_c7_7bb2_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2106_l2121_DUPLICATE_a6e0_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2095_c6_eb58_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2095_c6_eb58_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2095_c6_eb58_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2095_c1_dc4f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2095_c1_dc4f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2095_c1_dc4f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2095_c1_dc4f_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2095_c2_7fef_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2095_c2_7fef_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2101_c7_9120_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2095_c2_7fef_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2095_c2_7fef_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2095_c2_7fef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2095_c2_7fef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2101_c7_9120_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2095_c2_7fef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2095_c2_7fef_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2095_c2_7fef_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2095_c2_7fef_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_9120_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2095_c2_7fef_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2095_c2_7fef_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2095_c2_7fef_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2095_c2_7fef_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2101_c7_9120_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2095_c2_7fef_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2095_c2_7fef_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2095_c2_7fef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2095_c2_7fef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_9120_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2095_c2_7fef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2095_c2_7fef_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2095_c2_7fef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2095_c2_7fef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_9120_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2095_c2_7fef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2095_c2_7fef_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2095_c2_7fef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2095_c2_7fef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_9120_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2095_c2_7fef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2095_c2_7fef_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2095_c2_7fef_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2098_c3_60d2 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2095_c2_7fef_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_9120_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2095_c2_7fef_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2095_c2_7fef_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2095_c2_7fef_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2095_c2_7fef_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2101_c7_9120_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2095_c2_7fef_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2095_c2_7fef_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2096_c3_df40_uxn_opcodes_h_l2096_c3_df40_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2101_c11_60a6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2101_c11_60a6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2101_c11_60a6_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2101_c7_9120_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2101_c7_9120_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2104_c7_f327_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2101_c7_9120_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2101_c7_9120_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2101_c7_9120_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2104_c7_f327_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2101_c7_9120_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_9120_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_9120_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_f327_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_9120_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2101_c7_9120_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2101_c7_9120_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2104_c7_f327_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2101_c7_9120_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_9120_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_9120_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2104_c7_f327_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_9120_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_9120_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_9120_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_f327_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_9120_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_9120_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_9120_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_f327_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_9120_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_9120_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2102_c3_d212 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_9120_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_f327_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_9120_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2101_c7_9120_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2101_c7_9120_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2104_c7_f327_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2101_c7_9120_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_429e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_429e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_429e_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2104_c7_f327_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2104_c7_f327_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2109_c7_c534_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2104_c7_f327_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2104_c7_f327_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2104_c7_f327_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2109_c7_c534_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2104_c7_f327_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_f327_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_f327_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2109_c7_c534_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_f327_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2104_c7_f327_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2104_c7_f327_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2109_c7_c534_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2104_c7_f327_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2104_c7_f327_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2104_c7_f327_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_c534_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2104_c7_f327_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_f327_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_f327_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_c534_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_f327_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_f327_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_f327_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_c534_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_f327_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_f327_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2107_c3_39da : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_f327_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_c534_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_f327_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2104_c7_f327_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2104_c7_f327_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2109_c7_c534_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2104_c7_f327_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2109_c11_afc8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2109_c11_afc8_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2109_c11_afc8_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2109_c7_c534_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2109_c7_c534_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2112_c7_c88f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2109_c7_c534_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2109_c7_c534_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2109_c7_c534_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2112_c7_c88f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2109_c7_c534_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2109_c7_c534_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2109_c7_c534_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_c88f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2109_c7_c534_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2109_c7_c534_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2109_c7_c534_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2112_c7_c88f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2109_c7_c534_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_c534_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_c534_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2112_c7_c88f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_c534_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_c534_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_c534_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_c88f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_c534_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_c534_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_c534_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_c88f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_c534_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_c534_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2110_c3_0022 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_c534_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_c88f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_c534_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2109_c7_c534_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2109_c7_c534_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2112_c7_c88f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2109_c7_c534_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_c46d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_c46d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_c46d_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2112_c7_c88f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2112_c7_c88f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2112_c7_c88f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2112_c7_c88f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2112_c7_c88f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2116_c7_59f5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2112_c7_c88f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_c88f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_c88f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_59f5_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_c88f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2112_c7_c88f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2112_c7_c88f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2116_c7_59f5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2112_c7_c88f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2112_c7_c88f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2112_c7_c88f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_59f5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2112_c7_c88f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_c88f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_c88f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_59f5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_c88f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_c88f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_c88f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_59f5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_c88f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_c88f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2114_c3_3dcb : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_c88f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_59f5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_c88f_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2112_c7_c88f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2112_c7_c88f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2116_c7_59f5_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2112_c7_c88f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2113_c3_df16_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2113_c3_df16_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2113_c3_df16_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_40a2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_40a2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_40a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2116_c7_59f5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2116_c7_59f5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2119_c7_d1c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2116_c7_59f5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_59f5_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_59f5_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_d1c4_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_59f5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2116_c7_59f5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2116_c7_59f5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2119_c7_d1c4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2116_c7_59f5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_59f5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_59f5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2119_c7_d1c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_59f5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_59f5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_59f5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_d1c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_59f5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_59f5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_59f5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_d1c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_59f5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_59f5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2117_c3_d080 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_59f5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_d1c4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_59f5_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2116_c7_59f5_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2116_c7_59f5_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2119_c7_d1c4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2116_c7_59f5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_f1ad_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_f1ad_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_f1ad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2119_c7_d1c4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2119_c7_d1c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2124_c7_4e3d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2119_c7_d1c4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_d1c4_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_d1c4_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2124_c7_4e3d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_d1c4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2119_c7_d1c4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2119_c7_d1c4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2124_c7_4e3d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2119_c7_d1c4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2119_c7_d1c4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2119_c7_d1c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2124_c7_4e3d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2119_c7_d1c4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_d1c4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_d1c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2124_c7_4e3d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_d1c4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_d1c4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_d1c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2124_c7_4e3d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_d1c4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_d1c4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2122_c3_d54e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_d1c4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2124_c7_4e3d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_d1c4_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2119_c7_d1c4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2119_c7_d1c4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2124_c7_4e3d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2119_c7_d1c4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2124_c11_df46_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2124_c11_df46_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2124_c11_df46_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2124_c7_4e3d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2124_c7_4e3d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2127_c7_4079_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2124_c7_4e3d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2124_c7_4e3d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2124_c7_4e3d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_4079_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2124_c7_4e3d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2124_c7_4e3d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2124_c7_4e3d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2127_c7_4079_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2124_c7_4e3d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2124_c7_4e3d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2124_c7_4e3d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2127_c7_4079_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2124_c7_4e3d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2124_c7_4e3d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2124_c7_4e3d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2127_c7_4079_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2124_c7_4e3d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2124_c7_4e3d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2124_c7_4e3d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_4079_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2124_c7_4e3d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2124_c7_4e3d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2125_c3_8dee : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2124_c7_4e3d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_4079_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2124_c7_4e3d_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2124_c7_4e3d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2124_c7_4e3d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2127_c7_4079_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2124_c7_4e3d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_05ea_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_05ea_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_05ea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2127_c7_4079_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2127_c7_4079_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2127_c7_4079_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_4079_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_4079_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_4079_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2127_c7_4079_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2127_c7_4079_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2133_c7_dfa4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2127_c7_4079_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2127_c7_4079_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2127_c7_4079_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_dfa4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2127_c7_4079_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2127_c7_4079_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2127_c7_4079_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_dfa4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2127_c7_4079_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_4079_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_4079_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_dfa4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_4079_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_4079_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_4079_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_dfa4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_4079_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2127_c7_4079_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2127_c7_4079_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2127_c7_4079_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2128_c3_4633_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2128_c3_4633_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2128_c3_4633_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2131_c32_4489_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2131_c32_4489_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2131_c32_4489_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2131_c32_8012_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2131_c32_8012_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2131_c32_8012_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2131_c32_a9b7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2131_c32_a9b7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2131_c32_a9b7_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2131_c32_4489_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_746e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_746e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_746e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_dfa4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_dfa4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_dfa4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2133_c7_dfa4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2133_c7_dfa4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2133_c7_dfa4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_dfa4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_dfa4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2139_c7_7bb2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_dfa4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_dfa4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_dfa4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2139_c7_7bb2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_dfa4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_dfa4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2136_c3_85ef : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_dfa4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_dfa4_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2137_c24_cb4a_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2137_c24_cb4a_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2137_c24_cb4a_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2137_c24_b41f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2137_c24_b41f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2137_c24_b41f_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2137_c24_cb4a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2139_c11_343c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2139_c11_343c_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2139_c11_343c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2139_c7_7bb2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2139_c7_7bb2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2139_c7_7bb2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2139_c7_7bb2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2139_c7_7bb2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2139_c7_7bb2_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2104_l2127_l2101_l2124_l2095_l2119_l2116_l2112_l2109_DUPLICATE_8f69_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2104_l2127_l2101_l2124_l2095_l2119_l2116_l2112_l2109_l2133_DUPLICATE_ea43_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2104_l2101_l2124_l2095_l2119_l2116_l2112_l2109_l2133_DUPLICATE_ad54_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2104_l2127_l2101_l2124_l2095_l2119_l2116_l2112_l2139_l2109_DUPLICATE_5ed4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2104_l2127_l2101_l2124_l2119_l2116_l2112_l2109_DUPLICATE_acce_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2104_l2127_l2101_l2124_l2119_l2116_l2112_l2139_l2109_l2133_DUPLICATE_02df_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2113_l2128_l2120_l2105_DUPLICATE_cfb0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2106_l2121_DUPLICATE_a6e0_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2106_l2121_DUPLICATE_a6e0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2127_l2133_DUPLICATE_ead3_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l2144_l2091_DUPLICATE_d880_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2139_c11_343c_right := to_unsigned(10, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2127_c7_4079_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2101_c11_60a6_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2139_c7_7bb2_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2131_c32_a9b7_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2124_c11_df46_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2117_c3_d080 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_59f5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2117_c3_d080;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2125_c3_8dee := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2124_c7_4e3d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2125_c3_8dee;
     VAR_MUX_uxn_opcodes_h_l2131_c32_4489_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2136_c3_85ef := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_dfa4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2136_c3_85ef;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2098_c3_60d2 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2095_c2_7fef_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2098_c3_60d2;
     VAR_MUX_uxn_opcodes_h_l2131_c32_4489_iffalse := resize(to_signed(-3, 3), 8);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2095_c2_7fef_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2095_c2_7fef_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_746e_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2109_c11_afc8_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2122_c3_d54e := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_d1c4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2122_c3_d54e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_c46d_right := to_unsigned(4, 3);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2131_c32_8012_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2114_c3_3dcb := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_c88f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2114_c3_3dcb;
     VAR_MUX_uxn_opcodes_h_l2137_c24_cb4a_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2139_c7_7bb2_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2102_c3_d212 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_9120_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2102_c3_d212;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2107_c3_39da := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_f327_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2107_c3_39da;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2095_c6_eb58_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_40a2_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_f1ad_right := to_unsigned(6, 3);
     VAR_MUX_uxn_opcodes_h_l2137_c24_cb4a_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_05ea_right := to_unsigned(8, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2095_c1_dc4f_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_429e_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_dfa4_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2110_c3_0022 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_c534_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2110_c3_0022;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2127_c7_4079_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_dfa4_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2095_c1_dc4f_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2131_c32_8012_left := VAR_ins;
     VAR_BIN_OP_GT_uxn_opcodes_h_l2137_c24_b41f_left := n16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2128_c3_4633_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2095_c2_7fef_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2101_c7_9120_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2104_c7_f327_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2109_c7_c534_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2112_c7_c88f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2116_c7_59f5_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2124_c7_4e3d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2127_c7_4079_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2095_c6_eb58_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2101_c11_60a6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_429e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2109_c11_afc8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_c46d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_40a2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_f1ad_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2124_c11_df46_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_05ea_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_746e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2139_c11_343c_left := VAR_phase;
     VAR_BIN_OP_GT_uxn_opcodes_h_l2137_c24_b41f_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2113_c3_df16_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2095_c2_7fef_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2101_c7_9120_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2109_c7_c534_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2112_c7_c88f_iffalse := t16;
     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2104_l2127_l2101_l2124_l2095_l2119_l2116_l2112_l2109_l2133_DUPLICATE_ea43 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2104_l2127_l2101_l2124_l2095_l2119_l2116_l2112_l2109_l2133_DUPLICATE_ea43_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2095_c6_eb58] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2095_c6_eb58_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2095_c6_eb58_left;
     BIN_OP_EQ_uxn_opcodes_h_l2095_c6_eb58_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2095_c6_eb58_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2095_c6_eb58_return_output := BIN_OP_EQ_uxn_opcodes_h_l2095_c6_eb58_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2127_c11_05ea] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2127_c11_05ea_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_05ea_left;
     BIN_OP_EQ_uxn_opcodes_h_l2127_c11_05ea_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_05ea_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_05ea_return_output := BIN_OP_EQ_uxn_opcodes_h_l2127_c11_05ea_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2113_l2128_l2120_l2105_DUPLICATE_cfb0 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2113_l2128_l2120_l2105_DUPLICATE_cfb0_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2104_l2101_l2124_l2095_l2119_l2116_l2112_l2109_l2133_DUPLICATE_ad54 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2104_l2101_l2124_l2095_l2119_l2116_l2112_l2109_l2133_DUPLICATE_ad54_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2116_c11_40a2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2116_c11_40a2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_40a2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2116_c11_40a2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_40a2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_40a2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2116_c11_40a2_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2104_l2127_l2101_l2124_l2095_l2119_l2116_l2112_l2139_l2109_DUPLICATE_5ed4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2104_l2127_l2101_l2124_l2095_l2119_l2116_l2112_l2139_l2109_DUPLICATE_5ed4_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2104_l2127_l2101_l2124_l2119_l2116_l2112_l2139_l2109_l2133_DUPLICATE_02df LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2104_l2127_l2101_l2124_l2119_l2116_l2112_l2139_l2109_l2133_DUPLICATE_02df_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2112_c11_c46d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2112_c11_c46d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_c46d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2112_c11_c46d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_c46d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_c46d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2112_c11_c46d_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2127_l2133_DUPLICATE_ead3 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2127_l2133_DUPLICATE_ead3_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2104_c11_429e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2104_c11_429e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_429e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2104_c11_429e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_429e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_429e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2104_c11_429e_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2137_c24_b41f] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2137_c24_b41f_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2137_c24_b41f_left;
     BIN_OP_GT_uxn_opcodes_h_l2137_c24_b41f_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2137_c24_b41f_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2137_c24_b41f_return_output := BIN_OP_GT_uxn_opcodes_h_l2137_c24_b41f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2133_c11_746e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2133_c11_746e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_746e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2133_c11_746e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_746e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_746e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2133_c11_746e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2104_l2127_l2101_l2124_l2119_l2116_l2112_l2109_DUPLICATE_acce LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2104_l2127_l2101_l2124_l2119_l2116_l2112_l2109_DUPLICATE_acce_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l2119_c11_f1ad] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2119_c11_f1ad_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_f1ad_left;
     BIN_OP_EQ_uxn_opcodes_h_l2119_c11_f1ad_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_f1ad_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_f1ad_return_output := BIN_OP_EQ_uxn_opcodes_h_l2119_c11_f1ad_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2124_c11_df46] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2124_c11_df46_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2124_c11_df46_left;
     BIN_OP_EQ_uxn_opcodes_h_l2124_c11_df46_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2124_c11_df46_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2124_c11_df46_return_output := BIN_OP_EQ_uxn_opcodes_h_l2124_c11_df46_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2131_c32_8012] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2131_c32_8012_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2131_c32_8012_left;
     BIN_OP_AND_uxn_opcodes_h_l2131_c32_8012_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2131_c32_8012_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2131_c32_8012_return_output := BIN_OP_AND_uxn_opcodes_h_l2131_c32_8012_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2101_c11_60a6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2101_c11_60a6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2101_c11_60a6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2101_c11_60a6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2101_c11_60a6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2101_c11_60a6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2101_c11_60a6_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2104_l2127_l2101_l2124_l2095_l2119_l2116_l2112_l2109_DUPLICATE_8f69 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2104_l2127_l2101_l2124_l2095_l2119_l2116_l2112_l2109_DUPLICATE_8f69_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2139_c11_343c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2139_c11_343c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2139_c11_343c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2139_c11_343c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2139_c11_343c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2139_c11_343c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2139_c11_343c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2109_c11_afc8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2109_c11_afc8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2109_c11_afc8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2109_c11_afc8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2109_c11_afc8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2109_c11_afc8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2109_c11_afc8_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2131_c32_a9b7_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2131_c32_8012_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2095_c1_dc4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2095_c6_eb58_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2095_c2_7fef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2095_c6_eb58_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2095_c2_7fef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2095_c6_eb58_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2095_c2_7fef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2095_c6_eb58_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2095_c2_7fef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2095_c6_eb58_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2095_c2_7fef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2095_c6_eb58_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2095_c2_7fef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2095_c6_eb58_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2095_c2_7fef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2095_c6_eb58_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2095_c2_7fef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2095_c6_eb58_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2095_c2_7fef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2095_c6_eb58_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2101_c7_9120_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2101_c11_60a6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_9120_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2101_c11_60a6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_9120_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2101_c11_60a6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2101_c7_9120_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2101_c11_60a6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_9120_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2101_c11_60a6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_9120_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2101_c11_60a6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_9120_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2101_c11_60a6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2101_c7_9120_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2101_c11_60a6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2101_c7_9120_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2101_c11_60a6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2104_c7_f327_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_429e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_f327_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_429e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2104_c7_f327_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_429e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2104_c7_f327_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_429e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_f327_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_429e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_f327_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_429e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_f327_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_429e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2104_c7_f327_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_429e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2104_c7_f327_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_429e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2109_c7_c534_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2109_c11_afc8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_c534_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2109_c11_afc8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_c534_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2109_c11_afc8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2109_c7_c534_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2109_c11_afc8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_c534_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2109_c11_afc8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2109_c7_c534_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2109_c11_afc8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_c534_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2109_c11_afc8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2109_c7_c534_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2109_c11_afc8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2109_c7_c534_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2109_c11_afc8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2112_c7_c88f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_c46d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_c88f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_c46d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2112_c7_c88f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_c46d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2112_c7_c88f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_c46d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_c88f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_c46d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_c88f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_c46d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_c88f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_c46d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2112_c7_c88f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_c46d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2112_c7_c88f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_c46d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2116_c7_59f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_40a2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_59f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_40a2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_59f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_40a2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2116_c7_59f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_40a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_59f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_40a2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_59f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_40a2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_59f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_40a2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2116_c7_59f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_40a2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2119_c7_d1c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_f1ad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_d1c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_f1ad_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2119_c7_d1c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_f1ad_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2119_c7_d1c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_f1ad_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_d1c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_f1ad_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_d1c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_f1ad_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_d1c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_f1ad_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2119_c7_d1c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_f1ad_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2124_c7_4e3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2124_c11_df46_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2124_c7_4e3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2124_c11_df46_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2124_c7_4e3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2124_c11_df46_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2124_c7_4e3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2124_c11_df46_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2124_c7_4e3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2124_c11_df46_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2124_c7_4e3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2124_c11_df46_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2124_c7_4e3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2124_c11_df46_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2124_c7_4e3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2124_c11_df46_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2127_c7_4079_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_05ea_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_4079_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_05ea_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2127_c7_4079_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_05ea_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2127_c7_4079_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_05ea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2127_c7_4079_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_05ea_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_4079_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_05ea_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_4079_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_05ea_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2127_c7_4079_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_05ea_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_dfa4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_746e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_dfa4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_746e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_dfa4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_746e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_dfa4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_746e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2133_c7_dfa4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_746e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2139_c7_7bb2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2139_c11_343c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2139_c7_7bb2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2139_c11_343c_return_output;
     VAR_MUX_uxn_opcodes_h_l2137_c24_cb4a_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2137_c24_b41f_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2113_c3_df16_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2113_l2128_l2120_l2105_DUPLICATE_cfb0_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2128_c3_4633_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2113_l2128_l2120_l2105_DUPLICATE_cfb0_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2106_l2121_DUPLICATE_a6e0_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2113_l2128_l2120_l2105_DUPLICATE_cfb0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2095_c2_7fef_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2104_l2127_l2101_l2124_l2095_l2119_l2116_l2112_l2109_DUPLICATE_8f69_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_9120_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2104_l2127_l2101_l2124_l2095_l2119_l2116_l2112_l2109_DUPLICATE_8f69_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_f327_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2104_l2127_l2101_l2124_l2095_l2119_l2116_l2112_l2109_DUPLICATE_8f69_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2109_c7_c534_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2104_l2127_l2101_l2124_l2095_l2119_l2116_l2112_l2109_DUPLICATE_8f69_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_c88f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2104_l2127_l2101_l2124_l2095_l2119_l2116_l2112_l2109_DUPLICATE_8f69_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_59f5_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2104_l2127_l2101_l2124_l2095_l2119_l2116_l2112_l2109_DUPLICATE_8f69_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_d1c4_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2104_l2127_l2101_l2124_l2095_l2119_l2116_l2112_l2109_DUPLICATE_8f69_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2124_c7_4e3d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2104_l2127_l2101_l2124_l2095_l2119_l2116_l2112_l2109_DUPLICATE_8f69_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_4079_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2104_l2127_l2101_l2124_l2095_l2119_l2116_l2112_l2109_DUPLICATE_8f69_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_9120_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2104_l2127_l2101_l2124_l2119_l2116_l2112_l2139_l2109_l2133_DUPLICATE_02df_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_f327_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2104_l2127_l2101_l2124_l2119_l2116_l2112_l2139_l2109_l2133_DUPLICATE_02df_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_c534_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2104_l2127_l2101_l2124_l2119_l2116_l2112_l2139_l2109_l2133_DUPLICATE_02df_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_c88f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2104_l2127_l2101_l2124_l2119_l2116_l2112_l2139_l2109_l2133_DUPLICATE_02df_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_59f5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2104_l2127_l2101_l2124_l2119_l2116_l2112_l2139_l2109_l2133_DUPLICATE_02df_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_d1c4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2104_l2127_l2101_l2124_l2119_l2116_l2112_l2139_l2109_l2133_DUPLICATE_02df_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2124_c7_4e3d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2104_l2127_l2101_l2124_l2119_l2116_l2112_l2139_l2109_l2133_DUPLICATE_02df_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_4079_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2104_l2127_l2101_l2124_l2119_l2116_l2112_l2139_l2109_l2133_DUPLICATE_02df_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_dfa4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2104_l2127_l2101_l2124_l2119_l2116_l2112_l2139_l2109_l2133_DUPLICATE_02df_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2139_c7_7bb2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2104_l2127_l2101_l2124_l2119_l2116_l2112_l2139_l2109_l2133_DUPLICATE_02df_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2095_c2_7fef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2104_l2101_l2124_l2095_l2119_l2116_l2112_l2109_l2133_DUPLICATE_ad54_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_9120_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2104_l2101_l2124_l2095_l2119_l2116_l2112_l2109_l2133_DUPLICATE_ad54_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2104_c7_f327_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2104_l2101_l2124_l2095_l2119_l2116_l2112_l2109_l2133_DUPLICATE_ad54_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_c534_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2104_l2101_l2124_l2095_l2119_l2116_l2112_l2109_l2133_DUPLICATE_ad54_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2112_c7_c88f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2104_l2101_l2124_l2095_l2119_l2116_l2112_l2109_l2133_DUPLICATE_ad54_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_59f5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2104_l2101_l2124_l2095_l2119_l2116_l2112_l2109_l2133_DUPLICATE_ad54_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2119_c7_d1c4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2104_l2101_l2124_l2095_l2119_l2116_l2112_l2109_l2133_DUPLICATE_ad54_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2124_c7_4e3d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2104_l2101_l2124_l2095_l2119_l2116_l2112_l2109_l2133_DUPLICATE_ad54_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_dfa4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2104_l2101_l2124_l2095_l2119_l2116_l2112_l2109_l2133_DUPLICATE_ad54_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2101_c7_9120_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2104_l2127_l2101_l2124_l2119_l2116_l2112_l2109_DUPLICATE_acce_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2104_c7_f327_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2104_l2127_l2101_l2124_l2119_l2116_l2112_l2109_DUPLICATE_acce_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2109_c7_c534_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2104_l2127_l2101_l2124_l2119_l2116_l2112_l2109_DUPLICATE_acce_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2112_c7_c88f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2104_l2127_l2101_l2124_l2119_l2116_l2112_l2109_DUPLICATE_acce_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2116_c7_59f5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2104_l2127_l2101_l2124_l2119_l2116_l2112_l2109_DUPLICATE_acce_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2119_c7_d1c4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2104_l2127_l2101_l2124_l2119_l2116_l2112_l2109_DUPLICATE_acce_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2124_c7_4e3d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2104_l2127_l2101_l2124_l2119_l2116_l2112_l2109_DUPLICATE_acce_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2127_c7_4079_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2104_l2127_l2101_l2124_l2119_l2116_l2112_l2109_DUPLICATE_acce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2095_c2_7fef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2104_l2127_l2101_l2124_l2095_l2119_l2116_l2112_l2139_l2109_DUPLICATE_5ed4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_9120_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2104_l2127_l2101_l2124_l2095_l2119_l2116_l2112_l2139_l2109_DUPLICATE_5ed4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_f327_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2104_l2127_l2101_l2124_l2095_l2119_l2116_l2112_l2139_l2109_DUPLICATE_5ed4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_c534_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2104_l2127_l2101_l2124_l2095_l2119_l2116_l2112_l2139_l2109_DUPLICATE_5ed4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_c88f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2104_l2127_l2101_l2124_l2095_l2119_l2116_l2112_l2139_l2109_DUPLICATE_5ed4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_59f5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2104_l2127_l2101_l2124_l2095_l2119_l2116_l2112_l2139_l2109_DUPLICATE_5ed4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_d1c4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2104_l2127_l2101_l2124_l2095_l2119_l2116_l2112_l2139_l2109_DUPLICATE_5ed4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2124_c7_4e3d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2104_l2127_l2101_l2124_l2095_l2119_l2116_l2112_l2139_l2109_DUPLICATE_5ed4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2127_c7_4079_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2104_l2127_l2101_l2124_l2095_l2119_l2116_l2112_l2139_l2109_DUPLICATE_5ed4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2139_c7_7bb2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2104_l2127_l2101_l2124_l2095_l2119_l2116_l2112_l2139_l2109_DUPLICATE_5ed4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_4079_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2127_l2133_DUPLICATE_ead3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_dfa4_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2127_l2133_DUPLICATE_ead3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2095_c2_7fef_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2104_l2127_l2101_l2124_l2095_l2119_l2116_l2112_l2109_l2133_DUPLICATE_ea43_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2101_c7_9120_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2104_l2127_l2101_l2124_l2095_l2119_l2116_l2112_l2109_l2133_DUPLICATE_ea43_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2104_c7_f327_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2104_l2127_l2101_l2124_l2095_l2119_l2116_l2112_l2109_l2133_DUPLICATE_ea43_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2109_c7_c534_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2104_l2127_l2101_l2124_l2095_l2119_l2116_l2112_l2109_l2133_DUPLICATE_ea43_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2112_c7_c88f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2104_l2127_l2101_l2124_l2095_l2119_l2116_l2112_l2109_l2133_DUPLICATE_ea43_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2116_c7_59f5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2104_l2127_l2101_l2124_l2095_l2119_l2116_l2112_l2109_l2133_DUPLICATE_ea43_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2119_c7_d1c4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2104_l2127_l2101_l2124_l2095_l2119_l2116_l2112_l2109_l2133_DUPLICATE_ea43_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2124_c7_4e3d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2104_l2127_l2101_l2124_l2095_l2119_l2116_l2112_l2109_l2133_DUPLICATE_ea43_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2127_c7_4079_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2104_l2127_l2101_l2124_l2095_l2119_l2116_l2112_l2109_l2133_DUPLICATE_ea43_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2133_c7_dfa4_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2104_l2127_l2101_l2124_l2095_l2119_l2116_l2112_l2109_l2133_DUPLICATE_ea43_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l2113_c3_df16] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2113_c3_df16_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2113_c3_df16_left;
     BIN_OP_OR_uxn_opcodes_h_l2113_c3_df16_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2113_c3_df16_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2113_c3_df16_return_output := BIN_OP_OR_uxn_opcodes_h_l2113_c3_df16_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2128_c3_4633] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2128_c3_4633_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2128_c3_4633_left;
     BIN_OP_OR_uxn_opcodes_h_l2128_c3_4633_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2128_c3_4633_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2128_c3_4633_return_output := BIN_OP_OR_uxn_opcodes_h_l2128_c3_4633_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2133_c7_dfa4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_dfa4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_dfa4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_dfa4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_dfa4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_dfa4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_dfa4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_dfa4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_dfa4_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2127_c7_4079] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2127_c7_4079_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2127_c7_4079_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2127_c7_4079_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2127_c7_4079_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2127_c7_4079_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2127_c7_4079_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2127_c7_4079_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2127_c7_4079_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2106_l2121_DUPLICATE_a6e0 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2106_l2121_DUPLICATE_a6e0_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2106_l2121_DUPLICATE_a6e0_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2106_l2121_DUPLICATE_a6e0_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2106_l2121_DUPLICATE_a6e0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2139_c7_7bb2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2139_c7_7bb2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2139_c7_7bb2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2139_c7_7bb2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2139_c7_7bb2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2139_c7_7bb2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2139_c7_7bb2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2139_c7_7bb2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2139_c7_7bb2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2133_c7_dfa4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_dfa4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_dfa4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_dfa4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_dfa4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_dfa4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_dfa4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_dfa4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_dfa4_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2131_c32_a9b7] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2131_c32_a9b7_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2131_c32_a9b7_left;
     BIN_OP_GT_uxn_opcodes_h_l2131_c32_a9b7_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2131_c32_a9b7_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2131_c32_a9b7_return_output := BIN_OP_GT_uxn_opcodes_h_l2131_c32_a9b7_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2095_c1_dc4f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2095_c1_dc4f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2095_c1_dc4f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2095_c1_dc4f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2095_c1_dc4f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2095_c1_dc4f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2095_c1_dc4f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2095_c1_dc4f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2095_c1_dc4f_return_output;

     -- MUX[uxn_opcodes_h_l2137_c24_cb4a] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2137_c24_cb4a_cond <= VAR_MUX_uxn_opcodes_h_l2137_c24_cb4a_cond;
     MUX_uxn_opcodes_h_l2137_c24_cb4a_iftrue <= VAR_MUX_uxn_opcodes_h_l2137_c24_cb4a_iftrue;
     MUX_uxn_opcodes_h_l2137_c24_cb4a_iffalse <= VAR_MUX_uxn_opcodes_h_l2137_c24_cb4a_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2137_c24_cb4a_return_output := MUX_uxn_opcodes_h_l2137_c24_cb4a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2139_c7_7bb2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2139_c7_7bb2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2139_c7_7bb2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2139_c7_7bb2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2139_c7_7bb2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2139_c7_7bb2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2139_c7_7bb2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2139_c7_7bb2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2139_c7_7bb2_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2131_c32_4489_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2131_c32_a9b7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2112_c7_c88f_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2113_c3_df16_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2127_c7_4079_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2128_c3_4633_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2119_c7_d1c4_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2106_l2121_DUPLICATE_a6e0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2104_c7_f327_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2106_l2121_DUPLICATE_a6e0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2133_c7_dfa4_iftrue := VAR_MUX_uxn_opcodes_h_l2137_c24_cb4a_return_output;
     VAR_printf_uxn_opcodes_h_l2096_c3_df40_uxn_opcodes_h_l2096_c3_df40_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2095_c1_dc4f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_dfa4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2139_c7_7bb2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2127_c7_4079_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_dfa4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2124_c7_4e3d_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2127_c7_4079_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_dfa4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2139_c7_7bb2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_4079_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_dfa4_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2127_c7_4079] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_4079_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_4079_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_4079_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_4079_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_4079_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_4079_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_4079_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_4079_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2133_c7_dfa4] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2133_c7_dfa4_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2133_c7_dfa4_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2133_c7_dfa4_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2133_c7_dfa4_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2133_c7_dfa4_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2133_c7_dfa4_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2133_c7_dfa4_return_output := result_stack_value_MUX_uxn_opcodes_h_l2133_c7_dfa4_return_output;

     -- printf_uxn_opcodes_h_l2096_c3_df40[uxn_opcodes_h_l2096_c3_df40] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2096_c3_df40_uxn_opcodes_h_l2096_c3_df40_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2096_c3_df40_uxn_opcodes_h_l2096_c3_df40_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- t16_MUX[uxn_opcodes_h_l2112_c7_c88f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2112_c7_c88f_cond <= VAR_t16_MUX_uxn_opcodes_h_l2112_c7_c88f_cond;
     t16_MUX_uxn_opcodes_h_l2112_c7_c88f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2112_c7_c88f_iftrue;
     t16_MUX_uxn_opcodes_h_l2112_c7_c88f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2112_c7_c88f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2112_c7_c88f_return_output := t16_MUX_uxn_opcodes_h_l2112_c7_c88f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2127_c7_4079] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2127_c7_4079_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2127_c7_4079_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2127_c7_4079_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2127_c7_4079_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2127_c7_4079_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2127_c7_4079_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2127_c7_4079_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2127_c7_4079_return_output;

     -- n16_MUX[uxn_opcodes_h_l2127_c7_4079] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2127_c7_4079_cond <= VAR_n16_MUX_uxn_opcodes_h_l2127_c7_4079_cond;
     n16_MUX_uxn_opcodes_h_l2127_c7_4079_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2127_c7_4079_iftrue;
     n16_MUX_uxn_opcodes_h_l2127_c7_4079_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2127_c7_4079_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2127_c7_4079_return_output := n16_MUX_uxn_opcodes_h_l2127_c7_4079_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2124_c7_4e3d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2124_c7_4e3d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2124_c7_4e3d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2124_c7_4e3d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2124_c7_4e3d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2124_c7_4e3d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2124_c7_4e3d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2124_c7_4e3d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2124_c7_4e3d_return_output;

     -- MUX[uxn_opcodes_h_l2131_c32_4489] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2131_c32_4489_cond <= VAR_MUX_uxn_opcodes_h_l2131_c32_4489_cond;
     MUX_uxn_opcodes_h_l2131_c32_4489_iftrue <= VAR_MUX_uxn_opcodes_h_l2131_c32_4489_iftrue;
     MUX_uxn_opcodes_h_l2131_c32_4489_iffalse <= VAR_MUX_uxn_opcodes_h_l2131_c32_4489_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2131_c32_4489_return_output := MUX_uxn_opcodes_h_l2131_c32_4489_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2133_c7_dfa4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_dfa4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_dfa4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_dfa4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_dfa4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_dfa4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_dfa4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_dfa4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_dfa4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2133_c7_dfa4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_dfa4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_dfa4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_dfa4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_dfa4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_dfa4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_dfa4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_dfa4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_dfa4_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_4079_iftrue := VAR_MUX_uxn_opcodes_h_l2131_c32_4489_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2124_c7_4e3d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2127_c7_4079_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_4079_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_dfa4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2124_c7_4e3d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2127_c7_4079_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2119_c7_d1c4_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2124_c7_4e3d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2127_c7_4079_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_dfa4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2124_c7_4e3d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_4079_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2127_c7_4079_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2133_c7_dfa4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2109_c7_c534_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2112_c7_c88f_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2127_c7_4079] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_4079_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_4079_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_4079_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_4079_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_4079_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_4079_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_4079_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_4079_return_output;

     -- t16_MUX[uxn_opcodes_h_l2109_c7_c534] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2109_c7_c534_cond <= VAR_t16_MUX_uxn_opcodes_h_l2109_c7_c534_cond;
     t16_MUX_uxn_opcodes_h_l2109_c7_c534_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2109_c7_c534_iftrue;
     t16_MUX_uxn_opcodes_h_l2109_c7_c534_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2109_c7_c534_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2109_c7_c534_return_output := t16_MUX_uxn_opcodes_h_l2109_c7_c534_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2124_c7_4e3d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2124_c7_4e3d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2124_c7_4e3d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2124_c7_4e3d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2124_c7_4e3d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2124_c7_4e3d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2124_c7_4e3d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2124_c7_4e3d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2124_c7_4e3d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2124_c7_4e3d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2124_c7_4e3d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2124_c7_4e3d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2124_c7_4e3d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2124_c7_4e3d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2124_c7_4e3d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2124_c7_4e3d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2124_c7_4e3d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2124_c7_4e3d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2127_c7_4079] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_4079_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_4079_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_4079_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_4079_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_4079_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_4079_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_4079_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_4079_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2119_c7_d1c4] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2119_c7_d1c4_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2119_c7_d1c4_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2119_c7_d1c4_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2119_c7_d1c4_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2119_c7_d1c4_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2119_c7_d1c4_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2119_c7_d1c4_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2119_c7_d1c4_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2127_c7_4079] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2127_c7_4079_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2127_c7_4079_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2127_c7_4079_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2127_c7_4079_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2127_c7_4079_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2127_c7_4079_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2127_c7_4079_return_output := result_stack_value_MUX_uxn_opcodes_h_l2127_c7_4079_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2127_c7_4079] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2127_c7_4079_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2127_c7_4079_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2127_c7_4079_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2127_c7_4079_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2127_c7_4079_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2127_c7_4079_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2127_c7_4079_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2127_c7_4079_return_output;

     -- n16_MUX[uxn_opcodes_h_l2124_c7_4e3d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2124_c7_4e3d_cond <= VAR_n16_MUX_uxn_opcodes_h_l2124_c7_4e3d_cond;
     n16_MUX_uxn_opcodes_h_l2124_c7_4e3d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2124_c7_4e3d_iftrue;
     n16_MUX_uxn_opcodes_h_l2124_c7_4e3d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2124_c7_4e3d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2124_c7_4e3d_return_output := n16_MUX_uxn_opcodes_h_l2124_c7_4e3d_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l2119_c7_d1c4_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2124_c7_4e3d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2124_c7_4e3d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_4079_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2119_c7_d1c4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2124_c7_4e3d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2116_c7_59f5_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2119_c7_d1c4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2124_c7_4e3d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2127_c7_4079_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2124_c7_4e3d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_4079_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_d1c4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2124_c7_4e3d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2124_c7_4e3d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2127_c7_4079_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2104_c7_f327_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2109_c7_c534_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2124_c7_4e3d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2124_c7_4e3d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2124_c7_4e3d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2124_c7_4e3d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2124_c7_4e3d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2124_c7_4e3d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2124_c7_4e3d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2124_c7_4e3d_return_output := result_stack_value_MUX_uxn_opcodes_h_l2124_c7_4e3d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2116_c7_59f5] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2116_c7_59f5_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2116_c7_59f5_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2116_c7_59f5_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2116_c7_59f5_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2116_c7_59f5_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2116_c7_59f5_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2116_c7_59f5_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2116_c7_59f5_return_output;

     -- n16_MUX[uxn_opcodes_h_l2119_c7_d1c4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2119_c7_d1c4_cond <= VAR_n16_MUX_uxn_opcodes_h_l2119_c7_d1c4_cond;
     n16_MUX_uxn_opcodes_h_l2119_c7_d1c4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2119_c7_d1c4_iftrue;
     n16_MUX_uxn_opcodes_h_l2119_c7_d1c4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2119_c7_d1c4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2119_c7_d1c4_return_output := n16_MUX_uxn_opcodes_h_l2119_c7_d1c4_return_output;

     -- t16_MUX[uxn_opcodes_h_l2104_c7_f327] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2104_c7_f327_cond <= VAR_t16_MUX_uxn_opcodes_h_l2104_c7_f327_cond;
     t16_MUX_uxn_opcodes_h_l2104_c7_f327_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2104_c7_f327_iftrue;
     t16_MUX_uxn_opcodes_h_l2104_c7_f327_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2104_c7_f327_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2104_c7_f327_return_output := t16_MUX_uxn_opcodes_h_l2104_c7_f327_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2119_c7_d1c4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2119_c7_d1c4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2119_c7_d1c4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2119_c7_d1c4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2119_c7_d1c4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2119_c7_d1c4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2119_c7_d1c4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2119_c7_d1c4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2119_c7_d1c4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2124_c7_4e3d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2124_c7_4e3d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2124_c7_4e3d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2124_c7_4e3d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2124_c7_4e3d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2124_c7_4e3d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2124_c7_4e3d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2124_c7_4e3d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2124_c7_4e3d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2124_c7_4e3d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2124_c7_4e3d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2124_c7_4e3d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2124_c7_4e3d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2124_c7_4e3d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2124_c7_4e3d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2124_c7_4e3d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2124_c7_4e3d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2124_c7_4e3d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2119_c7_d1c4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_d1c4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_d1c4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_d1c4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_d1c4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_d1c4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_d1c4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_d1c4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_d1c4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2124_c7_4e3d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2124_c7_4e3d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2124_c7_4e3d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2124_c7_4e3d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2124_c7_4e3d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2124_c7_4e3d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2124_c7_4e3d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2124_c7_4e3d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2124_c7_4e3d_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2116_c7_59f5_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2119_c7_d1c4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_d1c4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2124_c7_4e3d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_59f5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2119_c7_d1c4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2112_c7_c88f_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2116_c7_59f5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_d1c4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2124_c7_4e3d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_d1c4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2124_c7_4e3d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_59f5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_d1c4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2119_c7_d1c4_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2124_c7_4e3d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2101_c7_9120_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2104_c7_f327_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2119_c7_d1c4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_d1c4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_d1c4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_d1c4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_d1c4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_d1c4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_d1c4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_d1c4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_d1c4_return_output;

     -- t16_MUX[uxn_opcodes_h_l2101_c7_9120] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2101_c7_9120_cond <= VAR_t16_MUX_uxn_opcodes_h_l2101_c7_9120_cond;
     t16_MUX_uxn_opcodes_h_l2101_c7_9120_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2101_c7_9120_iftrue;
     t16_MUX_uxn_opcodes_h_l2101_c7_9120_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2101_c7_9120_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2101_c7_9120_return_output := t16_MUX_uxn_opcodes_h_l2101_c7_9120_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2119_c7_d1c4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_d1c4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_d1c4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_d1c4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_d1c4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_d1c4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_d1c4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_d1c4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_d1c4_return_output;

     -- n16_MUX[uxn_opcodes_h_l2116_c7_59f5] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2116_c7_59f5_cond <= VAR_n16_MUX_uxn_opcodes_h_l2116_c7_59f5_cond;
     n16_MUX_uxn_opcodes_h_l2116_c7_59f5_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2116_c7_59f5_iftrue;
     n16_MUX_uxn_opcodes_h_l2116_c7_59f5_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2116_c7_59f5_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2116_c7_59f5_return_output := n16_MUX_uxn_opcodes_h_l2116_c7_59f5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2119_c7_d1c4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_d1c4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_d1c4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_d1c4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_d1c4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_d1c4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_d1c4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_d1c4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_d1c4_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2119_c7_d1c4] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2119_c7_d1c4_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2119_c7_d1c4_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2119_c7_d1c4_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2119_c7_d1c4_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2119_c7_d1c4_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2119_c7_d1c4_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2119_c7_d1c4_return_output := result_stack_value_MUX_uxn_opcodes_h_l2119_c7_d1c4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2116_c7_59f5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_59f5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_59f5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_59f5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_59f5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_59f5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_59f5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_59f5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_59f5_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2112_c7_c88f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2112_c7_c88f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2112_c7_c88f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2112_c7_c88f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2112_c7_c88f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2112_c7_c88f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2112_c7_c88f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2112_c7_c88f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2112_c7_c88f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2116_c7_59f5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_59f5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_59f5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_59f5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_59f5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_59f5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_59f5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_59f5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_59f5_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2112_c7_c88f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2116_c7_59f5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_59f5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_d1c4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2112_c7_c88f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_59f5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2109_c7_c534_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2112_c7_c88f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_59f5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_d1c4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_59f5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_d1c4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_c88f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_59f5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2116_c7_59f5_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2119_c7_d1c4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2095_c2_7fef_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2101_c7_9120_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2116_c7_59f5] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2116_c7_59f5_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2116_c7_59f5_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2116_c7_59f5_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2116_c7_59f5_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2116_c7_59f5_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2116_c7_59f5_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2116_c7_59f5_return_output := result_stack_value_MUX_uxn_opcodes_h_l2116_c7_59f5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2112_c7_c88f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_c88f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_c88f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_c88f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_c88f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_c88f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_c88f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_c88f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_c88f_return_output;

     -- t16_MUX[uxn_opcodes_h_l2095_c2_7fef] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2095_c2_7fef_cond <= VAR_t16_MUX_uxn_opcodes_h_l2095_c2_7fef_cond;
     t16_MUX_uxn_opcodes_h_l2095_c2_7fef_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2095_c2_7fef_iftrue;
     t16_MUX_uxn_opcodes_h_l2095_c2_7fef_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2095_c2_7fef_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2095_c2_7fef_return_output := t16_MUX_uxn_opcodes_h_l2095_c2_7fef_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2116_c7_59f5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_59f5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_59f5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_59f5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_59f5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_59f5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_59f5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_59f5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_59f5_return_output;

     -- n16_MUX[uxn_opcodes_h_l2112_c7_c88f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2112_c7_c88f_cond <= VAR_n16_MUX_uxn_opcodes_h_l2112_c7_c88f_cond;
     n16_MUX_uxn_opcodes_h_l2112_c7_c88f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2112_c7_c88f_iftrue;
     n16_MUX_uxn_opcodes_h_l2112_c7_c88f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2112_c7_c88f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2112_c7_c88f_return_output := n16_MUX_uxn_opcodes_h_l2112_c7_c88f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2116_c7_59f5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_59f5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_59f5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_59f5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_59f5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_59f5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_59f5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_59f5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_59f5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2116_c7_59f5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_59f5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_59f5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_59f5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_59f5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_59f5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_59f5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_59f5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_59f5_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2109_c7_c534] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2109_c7_c534_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2109_c7_c534_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2109_c7_c534_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2109_c7_c534_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2109_c7_c534_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2109_c7_c534_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2109_c7_c534_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2109_c7_c534_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2112_c7_c88f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2112_c7_c88f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2112_c7_c88f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2112_c7_c88f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2112_c7_c88f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2112_c7_c88f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2112_c7_c88f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2112_c7_c88f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2112_c7_c88f_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2109_c7_c534_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2112_c7_c88f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_c88f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_59f5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_c534_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2112_c7_c88f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2104_c7_f327_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2109_c7_c534_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_c88f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_59f5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_c88f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_59f5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_c534_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_c88f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2112_c7_c88f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2116_c7_59f5_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2095_c2_7fef_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2109_c7_c534] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_c534_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_c534_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_c534_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_c534_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_c534_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_c534_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_c534_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_c534_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2104_c7_f327] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2104_c7_f327_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2104_c7_f327_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2104_c7_f327_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2104_c7_f327_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2104_c7_f327_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2104_c7_f327_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2104_c7_f327_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2104_c7_f327_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2112_c7_c88f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_c88f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_c88f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_c88f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_c88f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_c88f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_c88f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_c88f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_c88f_return_output;

     -- n16_MUX[uxn_opcodes_h_l2109_c7_c534] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2109_c7_c534_cond <= VAR_n16_MUX_uxn_opcodes_h_l2109_c7_c534_cond;
     n16_MUX_uxn_opcodes_h_l2109_c7_c534_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2109_c7_c534_iftrue;
     n16_MUX_uxn_opcodes_h_l2109_c7_c534_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2109_c7_c534_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2109_c7_c534_return_output := n16_MUX_uxn_opcodes_h_l2109_c7_c534_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2112_c7_c88f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_c88f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_c88f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_c88f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_c88f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_c88f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_c88f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_c88f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_c88f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2112_c7_c88f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2112_c7_c88f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2112_c7_c88f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2112_c7_c88f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2112_c7_c88f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2112_c7_c88f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2112_c7_c88f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2112_c7_c88f_return_output := result_stack_value_MUX_uxn_opcodes_h_l2112_c7_c88f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2109_c7_c534] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_c534_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_c534_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_c534_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_c534_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_c534_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_c534_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_c534_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_c534_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2112_c7_c88f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_c88f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_c88f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_c88f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_c88f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_c88f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_c88f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_c88f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_c88f_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l2104_c7_f327_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2109_c7_c534_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_c534_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_c88f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2104_c7_f327_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_c534_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2101_c7_9120_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2104_c7_f327_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_c534_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_c88f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2109_c7_c534_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_c88f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_f327_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_c534_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2109_c7_c534_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2112_c7_c88f_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2109_c7_c534] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2109_c7_c534_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2109_c7_c534_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2109_c7_c534_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2109_c7_c534_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2109_c7_c534_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2109_c7_c534_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2109_c7_c534_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2109_c7_c534_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2109_c7_c534] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_c534_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_c534_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_c534_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_c534_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_c534_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_c534_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_c534_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_c534_return_output;

     -- n16_MUX[uxn_opcodes_h_l2104_c7_f327] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2104_c7_f327_cond <= VAR_n16_MUX_uxn_opcodes_h_l2104_c7_f327_cond;
     n16_MUX_uxn_opcodes_h_l2104_c7_f327_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2104_c7_f327_iftrue;
     n16_MUX_uxn_opcodes_h_l2104_c7_f327_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2104_c7_f327_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2104_c7_f327_return_output := n16_MUX_uxn_opcodes_h_l2104_c7_f327_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2109_c7_c534] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_c534_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_c534_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_c534_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_c534_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_c534_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_c534_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_c534_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_c534_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2109_c7_c534] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2109_c7_c534_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2109_c7_c534_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2109_c7_c534_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2109_c7_c534_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2109_c7_c534_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2109_c7_c534_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2109_c7_c534_return_output := result_stack_value_MUX_uxn_opcodes_h_l2109_c7_c534_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2101_c7_9120] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2101_c7_9120_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2101_c7_9120_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2101_c7_9120_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2101_c7_9120_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2101_c7_9120_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2101_c7_9120_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2101_c7_9120_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2101_c7_9120_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2104_c7_f327] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_f327_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_f327_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_f327_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_f327_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_f327_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_f327_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_f327_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_f327_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2104_c7_f327] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2104_c7_f327_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2104_c7_f327_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2104_c7_f327_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2104_c7_f327_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2104_c7_f327_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2104_c7_f327_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2104_c7_f327_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2104_c7_f327_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l2101_c7_9120_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2104_c7_f327_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_f327_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_c534_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_9120_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2104_c7_f327_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2095_c2_7fef_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2101_c7_9120_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_f327_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_c534_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_f327_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2109_c7_c534_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_9120_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_f327_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2104_c7_f327_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2109_c7_c534_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l2095_c2_7fef] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2095_c2_7fef_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2095_c2_7fef_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2095_c2_7fef_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2095_c2_7fef_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2095_c2_7fef_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2095_c2_7fef_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2095_c2_7fef_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2095_c2_7fef_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2104_c7_f327] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_f327_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_f327_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_f327_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_f327_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_f327_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_f327_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_f327_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_f327_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2104_c7_f327] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_f327_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_f327_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_f327_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_f327_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_f327_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_f327_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_f327_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_f327_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2101_c7_9120] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_9120_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_9120_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_9120_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_9120_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_9120_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_9120_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_9120_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_9120_return_output;

     -- n16_MUX[uxn_opcodes_h_l2101_c7_9120] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2101_c7_9120_cond <= VAR_n16_MUX_uxn_opcodes_h_l2101_c7_9120_cond;
     n16_MUX_uxn_opcodes_h_l2101_c7_9120_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2101_c7_9120_iftrue;
     n16_MUX_uxn_opcodes_h_l2101_c7_9120_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2101_c7_9120_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2101_c7_9120_return_output := n16_MUX_uxn_opcodes_h_l2101_c7_9120_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2104_c7_f327] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2104_c7_f327_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2104_c7_f327_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2104_c7_f327_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2104_c7_f327_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2104_c7_f327_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2104_c7_f327_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2104_c7_f327_return_output := result_stack_value_MUX_uxn_opcodes_h_l2104_c7_f327_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2101_c7_9120] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_9120_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_9120_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_9120_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_9120_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_9120_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_9120_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_9120_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_9120_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2104_c7_f327] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_f327_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_f327_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_f327_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_f327_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_f327_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_f327_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_f327_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_f327_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l2095_c2_7fef_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2101_c7_9120_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_9120_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_f327_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2095_c2_7fef_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_9120_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_9120_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_f327_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_9120_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_f327_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2095_c2_7fef_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_9120_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2101_c7_9120_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2104_c7_f327_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2101_c7_9120] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_9120_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_9120_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_9120_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_9120_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_9120_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_9120_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_9120_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_9120_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2101_c7_9120] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2101_c7_9120_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2101_c7_9120_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2101_c7_9120_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2101_c7_9120_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2101_c7_9120_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2101_c7_9120_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2101_c7_9120_return_output := result_stack_value_MUX_uxn_opcodes_h_l2101_c7_9120_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2095_c2_7fef] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2095_c2_7fef_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2095_c2_7fef_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2095_c2_7fef_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2095_c2_7fef_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2095_c2_7fef_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2095_c2_7fef_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2095_c2_7fef_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2095_c2_7fef_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2101_c7_9120] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_9120_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_9120_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_9120_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_9120_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_9120_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_9120_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_9120_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_9120_return_output;

     -- n16_MUX[uxn_opcodes_h_l2095_c2_7fef] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2095_c2_7fef_cond <= VAR_n16_MUX_uxn_opcodes_h_l2095_c2_7fef_cond;
     n16_MUX_uxn_opcodes_h_l2095_c2_7fef_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2095_c2_7fef_iftrue;
     n16_MUX_uxn_opcodes_h_l2095_c2_7fef_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2095_c2_7fef_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2095_c2_7fef_return_output := n16_MUX_uxn_opcodes_h_l2095_c2_7fef_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2095_c2_7fef] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2095_c2_7fef_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2095_c2_7fef_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2095_c2_7fef_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2095_c2_7fef_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2095_c2_7fef_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2095_c2_7fef_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2095_c2_7fef_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2095_c2_7fef_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2101_c7_9120] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_9120_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_9120_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_9120_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_9120_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_9120_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_9120_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_9120_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_9120_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2095_c2_7fef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2095_c2_7fef_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_9120_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2095_c2_7fef_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_9120_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2095_c2_7fef_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_9120_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2095_c2_7fef_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2101_c7_9120_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2095_c2_7fef] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2095_c2_7fef_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2095_c2_7fef_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2095_c2_7fef_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2095_c2_7fef_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2095_c2_7fef_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2095_c2_7fef_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2095_c2_7fef_return_output := result_stack_value_MUX_uxn_opcodes_h_l2095_c2_7fef_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2095_c2_7fef] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2095_c2_7fef_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2095_c2_7fef_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2095_c2_7fef_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2095_c2_7fef_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2095_c2_7fef_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2095_c2_7fef_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2095_c2_7fef_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2095_c2_7fef_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2095_c2_7fef] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2095_c2_7fef_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2095_c2_7fef_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2095_c2_7fef_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2095_c2_7fef_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2095_c2_7fef_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2095_c2_7fef_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2095_c2_7fef_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2095_c2_7fef_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2095_c2_7fef] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2095_c2_7fef_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2095_c2_7fef_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2095_c2_7fef_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2095_c2_7fef_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2095_c2_7fef_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2095_c2_7fef_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2095_c2_7fef_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2095_c2_7fef_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l2144_l2091_DUPLICATE_d880 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l2144_l2091_DUPLICATE_d880_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3(
     result,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2095_c2_7fef_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2095_c2_7fef_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2095_c2_7fef_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2095_c2_7fef_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2095_c2_7fef_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2095_c2_7fef_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2095_c2_7fef_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l2144_l2091_DUPLICATE_d880_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l2144_l2091_DUPLICATE_d880_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
