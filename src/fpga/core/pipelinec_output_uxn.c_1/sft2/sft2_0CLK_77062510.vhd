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
-- Submodules: 71
entity sft2_0CLK_77062510 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sft2_0CLK_77062510;
architecture arch of sft2_0CLK_77062510 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2133_c6_6320]
signal BIN_OP_EQ_uxn_opcodes_h_l2133_c6_6320_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2133_c6_6320_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2133_c6_6320_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2133_c1_0a5c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_0a5c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_0a5c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_0a5c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_0a5c_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2133_c2_1f77]
signal t8_MUX_uxn_opcodes_h_l2133_c2_1f77_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2133_c2_1f77_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2133_c2_1f77_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2133_c2_1f77_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l2133_c2_1f77]
signal n16_MUX_uxn_opcodes_h_l2133_c2_1f77_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2133_c2_1f77_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2133_c2_1f77_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2133_c2_1f77_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2133_c2_1f77]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_1f77_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_1f77_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_1f77_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_1f77_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2133_c2_1f77]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_1f77_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_1f77_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_1f77_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_1f77_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2133_c2_1f77]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_1f77_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_1f77_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_1f77_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_1f77_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2133_c2_1f77]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_1f77_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_1f77_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_1f77_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_1f77_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2133_c2_1f77]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_1f77_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_1f77_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_1f77_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_1f77_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2133_c2_1f77]
signal result_u8_value_MUX_uxn_opcodes_h_l2133_c2_1f77_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2133_c2_1f77_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2133_c2_1f77_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2133_c2_1f77_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2133_c2_1f77]
signal tmp16_MUX_uxn_opcodes_h_l2133_c2_1f77_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2133_c2_1f77_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2133_c2_1f77_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2133_c2_1f77_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2134_c3_ac6d[uxn_opcodes_h_l2134_c3_ac6d]
signal printf_uxn_opcodes_h_l2134_c3_ac6d_uxn_opcodes_h_l2134_c3_ac6d_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2138_c11_82e4]
signal BIN_OP_EQ_uxn_opcodes_h_l2138_c11_82e4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2138_c11_82e4_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2138_c11_82e4_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2138_c7_3bf1]
signal t8_MUX_uxn_opcodes_h_l2138_c7_3bf1_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2138_c7_3bf1_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2138_c7_3bf1_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2138_c7_3bf1_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l2138_c7_3bf1]
signal n16_MUX_uxn_opcodes_h_l2138_c7_3bf1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2138_c7_3bf1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2138_c7_3bf1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2138_c7_3bf1_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2138_c7_3bf1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_3bf1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_3bf1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_3bf1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_3bf1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2138_c7_3bf1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_3bf1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_3bf1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_3bf1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_3bf1_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2138_c7_3bf1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_3bf1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_3bf1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_3bf1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_3bf1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2138_c7_3bf1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_3bf1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_3bf1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_3bf1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_3bf1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2138_c7_3bf1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_3bf1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_3bf1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_3bf1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_3bf1_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2138_c7_3bf1]
signal result_u8_value_MUX_uxn_opcodes_h_l2138_c7_3bf1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2138_c7_3bf1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2138_c7_3bf1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2138_c7_3bf1_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2138_c7_3bf1]
signal tmp16_MUX_uxn_opcodes_h_l2138_c7_3bf1_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2138_c7_3bf1_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2138_c7_3bf1_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2138_c7_3bf1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2141_c11_e61b]
signal BIN_OP_EQ_uxn_opcodes_h_l2141_c11_e61b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2141_c11_e61b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2141_c11_e61b_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2141_c7_21a9]
signal t8_MUX_uxn_opcodes_h_l2141_c7_21a9_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2141_c7_21a9_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2141_c7_21a9_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2141_c7_21a9_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l2141_c7_21a9]
signal n16_MUX_uxn_opcodes_h_l2141_c7_21a9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2141_c7_21a9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2141_c7_21a9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2141_c7_21a9_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2141_c7_21a9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_21a9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_21a9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_21a9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_21a9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2141_c7_21a9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_21a9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_21a9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_21a9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_21a9_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2141_c7_21a9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_21a9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_21a9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_21a9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_21a9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2141_c7_21a9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_21a9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_21a9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_21a9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_21a9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2141_c7_21a9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_21a9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_21a9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_21a9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_21a9_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2141_c7_21a9]
signal result_u8_value_MUX_uxn_opcodes_h_l2141_c7_21a9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2141_c7_21a9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2141_c7_21a9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2141_c7_21a9_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2141_c7_21a9]
signal tmp16_MUX_uxn_opcodes_h_l2141_c7_21a9_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2141_c7_21a9_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2141_c7_21a9_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2141_c7_21a9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2145_c11_1efd]
signal BIN_OP_EQ_uxn_opcodes_h_l2145_c11_1efd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2145_c11_1efd_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2145_c11_1efd_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2145_c7_57ee]
signal n16_MUX_uxn_opcodes_h_l2145_c7_57ee_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2145_c7_57ee_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2145_c7_57ee_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2145_c7_57ee_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2145_c7_57ee]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_57ee_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_57ee_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_57ee_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_57ee_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2145_c7_57ee]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_57ee_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_57ee_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_57ee_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_57ee_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2145_c7_57ee]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_57ee_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_57ee_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_57ee_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_57ee_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2145_c7_57ee]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_57ee_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_57ee_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_57ee_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_57ee_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2145_c7_57ee]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_57ee_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_57ee_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_57ee_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_57ee_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2145_c7_57ee]
signal result_u8_value_MUX_uxn_opcodes_h_l2145_c7_57ee_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2145_c7_57ee_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2145_c7_57ee_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2145_c7_57ee_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2145_c7_57ee]
signal tmp16_MUX_uxn_opcodes_h_l2145_c7_57ee_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2145_c7_57ee_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2145_c7_57ee_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2145_c7_57ee_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2147_c3_7a9c]
signal CONST_SL_8_uxn_opcodes_h_l2147_c3_7a9c_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2147_c3_7a9c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2149_c11_5c7a]
signal BIN_OP_EQ_uxn_opcodes_h_l2149_c11_5c7a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2149_c11_5c7a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2149_c11_5c7a_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2149_c7_24ae]
signal n16_MUX_uxn_opcodes_h_l2149_c7_24ae_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2149_c7_24ae_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2149_c7_24ae_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2149_c7_24ae_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2149_c7_24ae]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_24ae_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_24ae_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_24ae_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_24ae_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2149_c7_24ae]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_24ae_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_24ae_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_24ae_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_24ae_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2149_c7_24ae]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_24ae_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_24ae_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_24ae_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_24ae_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2149_c7_24ae]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_24ae_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_24ae_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_24ae_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_24ae_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2149_c7_24ae]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_24ae_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_24ae_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_24ae_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_24ae_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2149_c7_24ae]
signal result_u8_value_MUX_uxn_opcodes_h_l2149_c7_24ae_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2149_c7_24ae_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2149_c7_24ae_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2149_c7_24ae_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2149_c7_24ae]
signal tmp16_MUX_uxn_opcodes_h_l2149_c7_24ae_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2149_c7_24ae_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2149_c7_24ae_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2149_c7_24ae_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2150_c3_f335]
signal BIN_OP_OR_uxn_opcodes_h_l2150_c3_f335_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2150_c3_f335_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2150_c3_f335_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2152_c30_d550]
signal sp_relative_shift_uxn_opcodes_h_l2152_c30_d550_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2152_c30_d550_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2152_c30_d550_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2152_c30_d550_return_output : signed(3 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2153_c20_4e7b]
signal BIN_OP_AND_uxn_opcodes_h_l2153_c20_4e7b_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2153_c20_4e7b_right : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2153_c20_4e7b_return_output : unsigned(7 downto 0);

-- BIN_OP_SR[uxn_opcodes_h_l2153_c12_95a8]
signal BIN_OP_SR_uxn_opcodes_h_l2153_c12_95a8_left : unsigned(15 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2153_c12_95a8_right : unsigned(7 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2153_c12_95a8_return_output : unsigned(15 downto 0);

-- CONST_SR_4[uxn_opcodes_h_l2153_c36_2ed8]
signal CONST_SR_4_uxn_opcodes_h_l2153_c36_2ed8_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_opcodes_h_l2153_c36_2ed8_return_output : unsigned(7 downto 0);

-- BIN_OP_SL[uxn_opcodes_h_l2153_c12_4fba]
signal BIN_OP_SL_uxn_opcodes_h_l2153_c12_4fba_left : unsigned(15 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2153_c12_4fba_right : unsigned(7 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2153_c12_4fba_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2158_c11_24ff]
signal BIN_OP_EQ_uxn_opcodes_h_l2158_c11_24ff_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2158_c11_24ff_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2158_c11_24ff_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2158_c7_e699]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_e699_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_e699_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_e699_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_e699_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2158_c7_e699]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_e699_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_e699_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_e699_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_e699_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2158_c7_e699]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_e699_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_e699_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_e699_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_e699_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2158_c7_e699]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_e699_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_e699_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_e699_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_e699_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2158_c7_e699]
signal result_u8_value_MUX_uxn_opcodes_h_l2158_c7_e699_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2158_c7_e699_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2158_c7_e699_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2158_c7_e699_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2161_c31_44d1]
signal CONST_SR_8_uxn_opcodes_h_l2161_c31_44d1_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2161_c31_44d1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2163_c11_f68a]
signal BIN_OP_EQ_uxn_opcodes_h_l2163_c11_f68a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2163_c11_f68a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2163_c11_f68a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2163_c7_6445]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_6445_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_6445_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_6445_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_6445_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2163_c7_6445]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_6445_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_6445_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_6445_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_6445_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2133_c6_6320
BIN_OP_EQ_uxn_opcodes_h_l2133_c6_6320 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2133_c6_6320_left,
BIN_OP_EQ_uxn_opcodes_h_l2133_c6_6320_right,
BIN_OP_EQ_uxn_opcodes_h_l2133_c6_6320_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_0a5c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_0a5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_0a5c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_0a5c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_0a5c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_0a5c_return_output);

-- t8_MUX_uxn_opcodes_h_l2133_c2_1f77
t8_MUX_uxn_opcodes_h_l2133_c2_1f77 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2133_c2_1f77_cond,
t8_MUX_uxn_opcodes_h_l2133_c2_1f77_iftrue,
t8_MUX_uxn_opcodes_h_l2133_c2_1f77_iffalse,
t8_MUX_uxn_opcodes_h_l2133_c2_1f77_return_output);

-- n16_MUX_uxn_opcodes_h_l2133_c2_1f77
n16_MUX_uxn_opcodes_h_l2133_c2_1f77 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2133_c2_1f77_cond,
n16_MUX_uxn_opcodes_h_l2133_c2_1f77_iftrue,
n16_MUX_uxn_opcodes_h_l2133_c2_1f77_iffalse,
n16_MUX_uxn_opcodes_h_l2133_c2_1f77_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_1f77
result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_1f77 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_1f77_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_1f77_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_1f77_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_1f77_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_1f77
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_1f77 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_1f77_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_1f77_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_1f77_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_1f77_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_1f77
result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_1f77 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_1f77_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_1f77_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_1f77_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_1f77_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_1f77
result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_1f77 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_1f77_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_1f77_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_1f77_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_1f77_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_1f77
result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_1f77 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_1f77_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_1f77_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_1f77_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_1f77_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2133_c2_1f77
result_u8_value_MUX_uxn_opcodes_h_l2133_c2_1f77 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2133_c2_1f77_cond,
result_u8_value_MUX_uxn_opcodes_h_l2133_c2_1f77_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2133_c2_1f77_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2133_c2_1f77_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2133_c2_1f77
tmp16_MUX_uxn_opcodes_h_l2133_c2_1f77 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2133_c2_1f77_cond,
tmp16_MUX_uxn_opcodes_h_l2133_c2_1f77_iftrue,
tmp16_MUX_uxn_opcodes_h_l2133_c2_1f77_iffalse,
tmp16_MUX_uxn_opcodes_h_l2133_c2_1f77_return_output);

-- printf_uxn_opcodes_h_l2134_c3_ac6d_uxn_opcodes_h_l2134_c3_ac6d
printf_uxn_opcodes_h_l2134_c3_ac6d_uxn_opcodes_h_l2134_c3_ac6d : entity work.printf_uxn_opcodes_h_l2134_c3_ac6d_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2134_c3_ac6d_uxn_opcodes_h_l2134_c3_ac6d_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2138_c11_82e4
BIN_OP_EQ_uxn_opcodes_h_l2138_c11_82e4 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2138_c11_82e4_left,
BIN_OP_EQ_uxn_opcodes_h_l2138_c11_82e4_right,
BIN_OP_EQ_uxn_opcodes_h_l2138_c11_82e4_return_output);

-- t8_MUX_uxn_opcodes_h_l2138_c7_3bf1
t8_MUX_uxn_opcodes_h_l2138_c7_3bf1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2138_c7_3bf1_cond,
t8_MUX_uxn_opcodes_h_l2138_c7_3bf1_iftrue,
t8_MUX_uxn_opcodes_h_l2138_c7_3bf1_iffalse,
t8_MUX_uxn_opcodes_h_l2138_c7_3bf1_return_output);

-- n16_MUX_uxn_opcodes_h_l2138_c7_3bf1
n16_MUX_uxn_opcodes_h_l2138_c7_3bf1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2138_c7_3bf1_cond,
n16_MUX_uxn_opcodes_h_l2138_c7_3bf1_iftrue,
n16_MUX_uxn_opcodes_h_l2138_c7_3bf1_iffalse,
n16_MUX_uxn_opcodes_h_l2138_c7_3bf1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_3bf1
result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_3bf1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_3bf1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_3bf1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_3bf1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_3bf1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_3bf1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_3bf1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_3bf1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_3bf1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_3bf1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_3bf1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_3bf1
result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_3bf1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_3bf1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_3bf1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_3bf1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_3bf1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_3bf1
result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_3bf1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_3bf1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_3bf1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_3bf1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_3bf1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_3bf1
result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_3bf1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_3bf1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_3bf1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_3bf1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_3bf1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2138_c7_3bf1
result_u8_value_MUX_uxn_opcodes_h_l2138_c7_3bf1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2138_c7_3bf1_cond,
result_u8_value_MUX_uxn_opcodes_h_l2138_c7_3bf1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2138_c7_3bf1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2138_c7_3bf1_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2138_c7_3bf1
tmp16_MUX_uxn_opcodes_h_l2138_c7_3bf1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2138_c7_3bf1_cond,
tmp16_MUX_uxn_opcodes_h_l2138_c7_3bf1_iftrue,
tmp16_MUX_uxn_opcodes_h_l2138_c7_3bf1_iffalse,
tmp16_MUX_uxn_opcodes_h_l2138_c7_3bf1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2141_c11_e61b
BIN_OP_EQ_uxn_opcodes_h_l2141_c11_e61b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2141_c11_e61b_left,
BIN_OP_EQ_uxn_opcodes_h_l2141_c11_e61b_right,
BIN_OP_EQ_uxn_opcodes_h_l2141_c11_e61b_return_output);

-- t8_MUX_uxn_opcodes_h_l2141_c7_21a9
t8_MUX_uxn_opcodes_h_l2141_c7_21a9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2141_c7_21a9_cond,
t8_MUX_uxn_opcodes_h_l2141_c7_21a9_iftrue,
t8_MUX_uxn_opcodes_h_l2141_c7_21a9_iffalse,
t8_MUX_uxn_opcodes_h_l2141_c7_21a9_return_output);

-- n16_MUX_uxn_opcodes_h_l2141_c7_21a9
n16_MUX_uxn_opcodes_h_l2141_c7_21a9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2141_c7_21a9_cond,
n16_MUX_uxn_opcodes_h_l2141_c7_21a9_iftrue,
n16_MUX_uxn_opcodes_h_l2141_c7_21a9_iffalse,
n16_MUX_uxn_opcodes_h_l2141_c7_21a9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_21a9
result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_21a9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_21a9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_21a9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_21a9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_21a9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_21a9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_21a9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_21a9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_21a9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_21a9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_21a9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_21a9
result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_21a9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_21a9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_21a9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_21a9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_21a9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_21a9
result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_21a9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_21a9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_21a9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_21a9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_21a9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_21a9
result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_21a9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_21a9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_21a9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_21a9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_21a9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2141_c7_21a9
result_u8_value_MUX_uxn_opcodes_h_l2141_c7_21a9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2141_c7_21a9_cond,
result_u8_value_MUX_uxn_opcodes_h_l2141_c7_21a9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2141_c7_21a9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2141_c7_21a9_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2141_c7_21a9
tmp16_MUX_uxn_opcodes_h_l2141_c7_21a9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2141_c7_21a9_cond,
tmp16_MUX_uxn_opcodes_h_l2141_c7_21a9_iftrue,
tmp16_MUX_uxn_opcodes_h_l2141_c7_21a9_iffalse,
tmp16_MUX_uxn_opcodes_h_l2141_c7_21a9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2145_c11_1efd
BIN_OP_EQ_uxn_opcodes_h_l2145_c11_1efd : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2145_c11_1efd_left,
BIN_OP_EQ_uxn_opcodes_h_l2145_c11_1efd_right,
BIN_OP_EQ_uxn_opcodes_h_l2145_c11_1efd_return_output);

-- n16_MUX_uxn_opcodes_h_l2145_c7_57ee
n16_MUX_uxn_opcodes_h_l2145_c7_57ee : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2145_c7_57ee_cond,
n16_MUX_uxn_opcodes_h_l2145_c7_57ee_iftrue,
n16_MUX_uxn_opcodes_h_l2145_c7_57ee_iffalse,
n16_MUX_uxn_opcodes_h_l2145_c7_57ee_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_57ee
result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_57ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_57ee_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_57ee_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_57ee_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_57ee_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_57ee
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_57ee : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_57ee_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_57ee_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_57ee_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_57ee_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_57ee
result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_57ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_57ee_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_57ee_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_57ee_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_57ee_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_57ee
result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_57ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_57ee_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_57ee_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_57ee_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_57ee_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_57ee
result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_57ee : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_57ee_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_57ee_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_57ee_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_57ee_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2145_c7_57ee
result_u8_value_MUX_uxn_opcodes_h_l2145_c7_57ee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2145_c7_57ee_cond,
result_u8_value_MUX_uxn_opcodes_h_l2145_c7_57ee_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2145_c7_57ee_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2145_c7_57ee_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2145_c7_57ee
tmp16_MUX_uxn_opcodes_h_l2145_c7_57ee : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2145_c7_57ee_cond,
tmp16_MUX_uxn_opcodes_h_l2145_c7_57ee_iftrue,
tmp16_MUX_uxn_opcodes_h_l2145_c7_57ee_iffalse,
tmp16_MUX_uxn_opcodes_h_l2145_c7_57ee_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2147_c3_7a9c
CONST_SL_8_uxn_opcodes_h_l2147_c3_7a9c : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2147_c3_7a9c_x,
CONST_SL_8_uxn_opcodes_h_l2147_c3_7a9c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2149_c11_5c7a
BIN_OP_EQ_uxn_opcodes_h_l2149_c11_5c7a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2149_c11_5c7a_left,
BIN_OP_EQ_uxn_opcodes_h_l2149_c11_5c7a_right,
BIN_OP_EQ_uxn_opcodes_h_l2149_c11_5c7a_return_output);

-- n16_MUX_uxn_opcodes_h_l2149_c7_24ae
n16_MUX_uxn_opcodes_h_l2149_c7_24ae : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2149_c7_24ae_cond,
n16_MUX_uxn_opcodes_h_l2149_c7_24ae_iftrue,
n16_MUX_uxn_opcodes_h_l2149_c7_24ae_iffalse,
n16_MUX_uxn_opcodes_h_l2149_c7_24ae_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_24ae
result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_24ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_24ae_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_24ae_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_24ae_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_24ae_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_24ae
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_24ae : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_24ae_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_24ae_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_24ae_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_24ae_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_24ae
result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_24ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_24ae_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_24ae_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_24ae_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_24ae_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_24ae
result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_24ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_24ae_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_24ae_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_24ae_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_24ae_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_24ae
result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_24ae : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_24ae_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_24ae_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_24ae_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_24ae_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2149_c7_24ae
result_u8_value_MUX_uxn_opcodes_h_l2149_c7_24ae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2149_c7_24ae_cond,
result_u8_value_MUX_uxn_opcodes_h_l2149_c7_24ae_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2149_c7_24ae_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2149_c7_24ae_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2149_c7_24ae
tmp16_MUX_uxn_opcodes_h_l2149_c7_24ae : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2149_c7_24ae_cond,
tmp16_MUX_uxn_opcodes_h_l2149_c7_24ae_iftrue,
tmp16_MUX_uxn_opcodes_h_l2149_c7_24ae_iffalse,
tmp16_MUX_uxn_opcodes_h_l2149_c7_24ae_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2150_c3_f335
BIN_OP_OR_uxn_opcodes_h_l2150_c3_f335 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2150_c3_f335_left,
BIN_OP_OR_uxn_opcodes_h_l2150_c3_f335_right,
BIN_OP_OR_uxn_opcodes_h_l2150_c3_f335_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2152_c30_d550
sp_relative_shift_uxn_opcodes_h_l2152_c30_d550 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2152_c30_d550_ins,
sp_relative_shift_uxn_opcodes_h_l2152_c30_d550_x,
sp_relative_shift_uxn_opcodes_h_l2152_c30_d550_y,
sp_relative_shift_uxn_opcodes_h_l2152_c30_d550_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2153_c20_4e7b
BIN_OP_AND_uxn_opcodes_h_l2153_c20_4e7b : entity work.BIN_OP_AND_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2153_c20_4e7b_left,
BIN_OP_AND_uxn_opcodes_h_l2153_c20_4e7b_right,
BIN_OP_AND_uxn_opcodes_h_l2153_c20_4e7b_return_output);

-- BIN_OP_SR_uxn_opcodes_h_l2153_c12_95a8
BIN_OP_SR_uxn_opcodes_h_l2153_c12_95a8 : entity work.BIN_OP_SR_uint16_t_uint8_t_0CLK_295015b8 port map (
BIN_OP_SR_uxn_opcodes_h_l2153_c12_95a8_left,
BIN_OP_SR_uxn_opcodes_h_l2153_c12_95a8_right,
BIN_OP_SR_uxn_opcodes_h_l2153_c12_95a8_return_output);

-- CONST_SR_4_uxn_opcodes_h_l2153_c36_2ed8
CONST_SR_4_uxn_opcodes_h_l2153_c36_2ed8 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_opcodes_h_l2153_c36_2ed8_x,
CONST_SR_4_uxn_opcodes_h_l2153_c36_2ed8_return_output);

-- BIN_OP_SL_uxn_opcodes_h_l2153_c12_4fba
BIN_OP_SL_uxn_opcodes_h_l2153_c12_4fba : entity work.BIN_OP_SL_uint16_t_uint8_t_0CLK_b6546dec port map (
BIN_OP_SL_uxn_opcodes_h_l2153_c12_4fba_left,
BIN_OP_SL_uxn_opcodes_h_l2153_c12_4fba_right,
BIN_OP_SL_uxn_opcodes_h_l2153_c12_4fba_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2158_c11_24ff
BIN_OP_EQ_uxn_opcodes_h_l2158_c11_24ff : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2158_c11_24ff_left,
BIN_OP_EQ_uxn_opcodes_h_l2158_c11_24ff_right,
BIN_OP_EQ_uxn_opcodes_h_l2158_c11_24ff_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_e699
result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_e699 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_e699_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_e699_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_e699_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_e699_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_e699
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_e699 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_e699_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_e699_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_e699_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_e699_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_e699
result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_e699 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_e699_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_e699_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_e699_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_e699_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_e699
result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_e699 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_e699_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_e699_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_e699_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_e699_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2158_c7_e699
result_u8_value_MUX_uxn_opcodes_h_l2158_c7_e699 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2158_c7_e699_cond,
result_u8_value_MUX_uxn_opcodes_h_l2158_c7_e699_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2158_c7_e699_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2158_c7_e699_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2161_c31_44d1
CONST_SR_8_uxn_opcodes_h_l2161_c31_44d1 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2161_c31_44d1_x,
CONST_SR_8_uxn_opcodes_h_l2161_c31_44d1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2163_c11_f68a
BIN_OP_EQ_uxn_opcodes_h_l2163_c11_f68a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2163_c11_f68a_left,
BIN_OP_EQ_uxn_opcodes_h_l2163_c11_f68a_right,
BIN_OP_EQ_uxn_opcodes_h_l2163_c11_f68a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_6445
result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_6445 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_6445_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_6445_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_6445_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_6445_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_6445
result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_6445 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_6445_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_6445_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_6445_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_6445_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t8,
 n16,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2133_c6_6320_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_0a5c_return_output,
 t8_MUX_uxn_opcodes_h_l2133_c2_1f77_return_output,
 n16_MUX_uxn_opcodes_h_l2133_c2_1f77_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_1f77_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_1f77_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_1f77_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_1f77_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_1f77_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2133_c2_1f77_return_output,
 tmp16_MUX_uxn_opcodes_h_l2133_c2_1f77_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2138_c11_82e4_return_output,
 t8_MUX_uxn_opcodes_h_l2138_c7_3bf1_return_output,
 n16_MUX_uxn_opcodes_h_l2138_c7_3bf1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_3bf1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_3bf1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_3bf1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_3bf1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_3bf1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2138_c7_3bf1_return_output,
 tmp16_MUX_uxn_opcodes_h_l2138_c7_3bf1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2141_c11_e61b_return_output,
 t8_MUX_uxn_opcodes_h_l2141_c7_21a9_return_output,
 n16_MUX_uxn_opcodes_h_l2141_c7_21a9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_21a9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_21a9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_21a9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_21a9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_21a9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2141_c7_21a9_return_output,
 tmp16_MUX_uxn_opcodes_h_l2141_c7_21a9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2145_c11_1efd_return_output,
 n16_MUX_uxn_opcodes_h_l2145_c7_57ee_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_57ee_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_57ee_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_57ee_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_57ee_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_57ee_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2145_c7_57ee_return_output,
 tmp16_MUX_uxn_opcodes_h_l2145_c7_57ee_return_output,
 CONST_SL_8_uxn_opcodes_h_l2147_c3_7a9c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2149_c11_5c7a_return_output,
 n16_MUX_uxn_opcodes_h_l2149_c7_24ae_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_24ae_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_24ae_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_24ae_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_24ae_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_24ae_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2149_c7_24ae_return_output,
 tmp16_MUX_uxn_opcodes_h_l2149_c7_24ae_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2150_c3_f335_return_output,
 sp_relative_shift_uxn_opcodes_h_l2152_c30_d550_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2153_c20_4e7b_return_output,
 BIN_OP_SR_uxn_opcodes_h_l2153_c12_95a8_return_output,
 CONST_SR_4_uxn_opcodes_h_l2153_c36_2ed8_return_output,
 BIN_OP_SL_uxn_opcodes_h_l2153_c12_4fba_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2158_c11_24ff_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_e699_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_e699_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_e699_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_e699_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2158_c7_e699_return_output,
 CONST_SR_8_uxn_opcodes_h_l2161_c31_44d1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2163_c11_f68a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_6445_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_6445_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_6320_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_6320_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_6320_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_0a5c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_0a5c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_0a5c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_0a5c_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2133_c2_1f77_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2133_c2_1f77_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2138_c7_3bf1_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2133_c2_1f77_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2133_c2_1f77_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2133_c2_1f77_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2133_c2_1f77_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2138_c7_3bf1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2133_c2_1f77_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2133_c2_1f77_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_1f77_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_1f77_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_3bf1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_1f77_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_1f77_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_1f77_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2135_c3_f424 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_1f77_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_3bf1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_1f77_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_1f77_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_1f77_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_1f77_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_3bf1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_1f77_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_1f77_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_1f77_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_1f77_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_3bf1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_1f77_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_1f77_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_1f77_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_1f77_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_3bf1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_1f77_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_1f77_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c2_1f77_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c2_1f77_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2138_c7_3bf1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c2_1f77_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c2_1f77_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2133_c2_1f77_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2133_c2_1f77_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2138_c7_3bf1_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2133_c2_1f77_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2133_c2_1f77_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2134_c3_ac6d_uxn_opcodes_h_l2134_c3_ac6d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_82e4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_82e4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_82e4_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2138_c7_3bf1_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2138_c7_3bf1_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2141_c7_21a9_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2138_c7_3bf1_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2138_c7_3bf1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2138_c7_3bf1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2141_c7_21a9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2138_c7_3bf1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_3bf1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_3bf1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_21a9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_3bf1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_3bf1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2139_c3_fe92 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_3bf1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_21a9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_3bf1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_3bf1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_3bf1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_21a9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_3bf1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_3bf1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_3bf1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_21a9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_3bf1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_3bf1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_3bf1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_21a9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_3bf1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2138_c7_3bf1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2138_c7_3bf1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_21a9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2138_c7_3bf1_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2138_c7_3bf1_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2138_c7_3bf1_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_21a9_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2138_c7_3bf1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_e61b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_e61b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_e61b_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2141_c7_21a9_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2141_c7_21a9_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2141_c7_21a9_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2141_c7_21a9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2141_c7_21a9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2145_c7_57ee_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2141_c7_21a9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_21a9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_21a9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_57ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_21a9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_21a9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2143_c3_37df : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_21a9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_57ee_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_21a9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_21a9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_21a9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_57ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_21a9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_21a9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_21a9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_57ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_21a9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_21a9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_21a9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_57ee_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_21a9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_21a9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_21a9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2145_c7_57ee_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_21a9_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_21a9_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_21a9_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2145_c7_57ee_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_21a9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_1efd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_1efd_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_1efd_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2145_c7_57ee_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2145_c7_57ee_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2149_c7_24ae_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2145_c7_57ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_57ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_57ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_24ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_57ee_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_57ee_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_57ee_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_24ae_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_57ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_57ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_57ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_24ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_57ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_57ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_57ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_24ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_57ee_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_57ee_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_57ee_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_24ae_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_57ee_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2145_c7_57ee_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2145_c7_57ee_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2149_c7_24ae_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2145_c7_57ee_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2145_c7_57ee_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2145_c7_57ee_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2149_c7_24ae_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2145_c7_57ee_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2147_c3_7a9c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2147_c3_7a9c_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_5c7a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_5c7a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_5c7a_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2149_c7_24ae_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2149_c7_24ae_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2149_c7_24ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_24ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_24ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_e699_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_24ae_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_24ae_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2155_c3_cb33 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_24ae_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_e699_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_24ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_24ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_24ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_e699_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_24ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_24ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_24ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_e699_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_24ae_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_24ae_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_24ae_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_24ae_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2149_c7_24ae_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2149_c7_24ae_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2158_c7_e699_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2149_c7_24ae_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2149_c7_24ae_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2149_c7_24ae_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2149_c7_24ae_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2150_c3_f335_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2150_c3_f335_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2150_c3_f335_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2152_c30_d550_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2152_c30_d550_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2152_c30_d550_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2152_c30_d550_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2153_c12_95a8_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2153_c20_4e7b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2153_c20_4e7b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2153_c20_4e7b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2153_c12_95a8_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2153_c12_95a8_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2153_c12_4fba_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2153_c12_4fba_right : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2153_c36_2ed8_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2153_c36_2ed8_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2153_c12_4fba_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2156_c21_0981_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2158_c11_24ff_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2158_c11_24ff_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2158_c11_24ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_e699_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_e699_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_6445_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_e699_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_e699_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2160_c3_d7a4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_e699_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_e699_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_e699_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_e699_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_e699_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_e699_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_e699_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_6445_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_e699_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2158_c7_e699_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2158_c7_e699_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2158_c7_e699_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2161_c31_44d1_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2161_c31_44d1_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2161_c21_9738_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2163_c11_f68a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2163_c11_f68a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2163_c11_f68a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_6445_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_6445_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_6445_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_6445_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_6445_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_6445_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2163_l2158_DUPLICATE_1ee7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2158_DUPLICATE_8926_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2149_DUPLICATE_361a_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2158_DUPLICATE_e9e3_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2163_l2158_l2149_DUPLICATE_5d78_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2146_l2150_DUPLICATE_6905_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2145_l2158_DUPLICATE_f953_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l2168_l2128_DUPLICATE_d258_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n16 := n16;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2143_c3_37df := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_21a9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2143_c3_37df;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_6445_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2153_c20_4e7b_right := to_unsigned(15, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_e61b_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2135_c3_f424 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_1f77_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2135_c3_f424;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_82e4_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2158_c11_24ff_right := to_unsigned(5, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l2152_c30_d550_y := resize(to_signed(-1, 2), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2160_c3_d7a4 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_e699_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2160_c3_d7a4;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_e699_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2155_c3_cb33 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_24ae_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2155_c3_cb33;
     VAR_sp_relative_shift_uxn_opcodes_h_l2152_c30_d550_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_24ae_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_0a5c_iffalse := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_6445_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_6320_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_24ae_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2139_c3_fe92 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_3bf1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2139_c3_fe92;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2163_c11_f68a_right := to_unsigned(6, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_1f77_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_1efd_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_5c7a_right := to_unsigned(4, 3);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_0a5c_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2152_c30_d550_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2150_c3_f335_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2133_c2_1f77_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2138_c7_3bf1_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2141_c7_21a9_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2149_c7_24ae_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_6320_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_82e4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_e61b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_1efd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_5c7a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2158_c11_24ff_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2163_c11_f68a_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l2141_c7_21a9_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2153_c20_4e7b_left := t8;
     VAR_CONST_SR_4_uxn_opcodes_h_l2153_c36_2ed8_x := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2133_c2_1f77_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2138_c7_3bf1_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2141_c7_21a9_iffalse := t8;
     VAR_CONST_SR_8_uxn_opcodes_h_l2161_c31_44d1_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2133_c2_1f77_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2138_c7_3bf1_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_21a9_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2145_c7_57ee_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2149_c7_24ae_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2145_c11_1efd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2145_c11_1efd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_1efd_left;
     BIN_OP_EQ_uxn_opcodes_h_l2145_c11_1efd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_1efd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_1efd_return_output := BIN_OP_EQ_uxn_opcodes_h_l2145_c11_1efd_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2152_c30_d550] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2152_c30_d550_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2152_c30_d550_ins;
     sp_relative_shift_uxn_opcodes_h_l2152_c30_d550_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2152_c30_d550_x;
     sp_relative_shift_uxn_opcodes_h_l2152_c30_d550_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2152_c30_d550_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2152_c30_d550_return_output := sp_relative_shift_uxn_opcodes_h_l2152_c30_d550_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2153_c20_4e7b] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2153_c20_4e7b_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2153_c20_4e7b_left;
     BIN_OP_AND_uxn_opcodes_h_l2153_c20_4e7b_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2153_c20_4e7b_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2153_c20_4e7b_return_output := BIN_OP_AND_uxn_opcodes_h_l2153_c20_4e7b_return_output;

     -- CONST_SR_4[uxn_opcodes_h_l2153_c36_2ed8] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_opcodes_h_l2153_c36_2ed8_x <= VAR_CONST_SR_4_uxn_opcodes_h_l2153_c36_2ed8_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_opcodes_h_l2153_c36_2ed8_return_output := CONST_SR_4_uxn_opcodes_h_l2153_c36_2ed8_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2145_l2158_DUPLICATE_f953 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2145_l2158_DUPLICATE_f953_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2163_l2158_l2149_DUPLICATE_5d78 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2163_l2158_l2149_DUPLICATE_5d78_return_output := result.is_opc_done;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2146_l2150_DUPLICATE_6905 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2146_l2150_DUPLICATE_6905_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2163_l2158_DUPLICATE_1ee7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2163_l2158_DUPLICATE_1ee7_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2158_DUPLICATE_8926 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2158_DUPLICATE_8926_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2133_c6_6320] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2133_c6_6320_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_6320_left;
     BIN_OP_EQ_uxn_opcodes_h_l2133_c6_6320_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_6320_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_6320_return_output := BIN_OP_EQ_uxn_opcodes_h_l2133_c6_6320_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2141_c11_e61b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2141_c11_e61b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_e61b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2141_c11_e61b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_e61b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_e61b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2141_c11_e61b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2149_c11_5c7a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2149_c11_5c7a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_5c7a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2149_c11_5c7a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_5c7a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_5c7a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2149_c11_5c7a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2158_c11_24ff] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2158_c11_24ff_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2158_c11_24ff_left;
     BIN_OP_EQ_uxn_opcodes_h_l2158_c11_24ff_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2158_c11_24ff_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2158_c11_24ff_return_output := BIN_OP_EQ_uxn_opcodes_h_l2158_c11_24ff_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2138_c11_82e4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2138_c11_82e4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_82e4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2138_c11_82e4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_82e4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_82e4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2138_c11_82e4_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2161_c31_44d1] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2161_c31_44d1_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2161_c31_44d1_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2161_c31_44d1_return_output := CONST_SR_8_uxn_opcodes_h_l2161_c31_44d1_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2158_DUPLICATE_e9e3 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2158_DUPLICATE_e9e3_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2163_c11_f68a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2163_c11_f68a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2163_c11_f68a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2163_c11_f68a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2163_c11_f68a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2163_c11_f68a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2163_c11_f68a_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2149_DUPLICATE_361a LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2149_DUPLICATE_361a_return_output := result.sp_relative_shift;

     -- Submodule level 1
     VAR_BIN_OP_SR_uxn_opcodes_h_l2153_c12_95a8_right := VAR_BIN_OP_AND_uxn_opcodes_h_l2153_c20_4e7b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_0a5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_6320_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2133_c2_1f77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_6320_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_1f77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_6320_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_1f77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_6320_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_1f77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_6320_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_1f77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_6320_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_1f77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_6320_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c2_1f77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_6320_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2133_c2_1f77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_6320_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2133_c2_1f77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_6320_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2138_c7_3bf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_82e4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_3bf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_82e4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_3bf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_82e4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_3bf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_82e4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_3bf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_82e4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_3bf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_82e4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2138_c7_3bf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_82e4_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2138_c7_3bf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_82e4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2138_c7_3bf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_82e4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2141_c7_21a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_e61b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_21a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_e61b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_21a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_e61b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_21a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_e61b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_21a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_e61b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_21a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_e61b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_21a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_e61b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2141_c7_21a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_e61b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_21a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_e61b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2145_c7_57ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_1efd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_57ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_1efd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_57ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_1efd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_57ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_1efd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_57ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_1efd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_57ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_1efd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2145_c7_57ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_1efd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2145_c7_57ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_1efd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2149_c7_24ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_5c7a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_24ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_5c7a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_24ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_5c7a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_24ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_5c7a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_24ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_5c7a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_24ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_5c7a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2149_c7_24ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_5c7a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2149_c7_24ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_5c7a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_e699_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2158_c11_24ff_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_e699_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2158_c11_24ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_e699_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2158_c11_24ff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_e699_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2158_c11_24ff_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2158_c7_e699_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2158_c11_24ff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_6445_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2163_c11_f68a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_6445_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2163_c11_f68a_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2150_c3_f335_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2146_l2150_DUPLICATE_6905_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2147_c3_7a9c_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2146_l2150_DUPLICATE_6905_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_1f77_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2149_DUPLICATE_361a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_3bf1_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2149_DUPLICATE_361a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_21a9_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2149_DUPLICATE_361a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_57ee_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2149_DUPLICATE_361a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_24ae_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2149_DUPLICATE_361a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_3bf1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2163_l2158_l2149_DUPLICATE_5d78_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_21a9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2163_l2158_l2149_DUPLICATE_5d78_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_57ee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2163_l2158_l2149_DUPLICATE_5d78_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_24ae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2163_l2158_l2149_DUPLICATE_5d78_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_e699_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2163_l2158_l2149_DUPLICATE_5d78_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_6445_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2163_l2158_l2149_DUPLICATE_5d78_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_1f77_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2158_DUPLICATE_8926_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_3bf1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2158_DUPLICATE_8926_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_21a9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2158_DUPLICATE_8926_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_57ee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2158_DUPLICATE_8926_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_e699_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2158_DUPLICATE_8926_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_1f77_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2163_l2158_DUPLICATE_1ee7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_3bf1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2163_l2158_DUPLICATE_1ee7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_21a9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2163_l2158_DUPLICATE_1ee7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_57ee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2163_l2158_DUPLICATE_1ee7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_e699_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2163_l2158_DUPLICATE_1ee7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_6445_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2163_l2158_DUPLICATE_1ee7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_57ee_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2145_l2158_DUPLICATE_f953_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_e699_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2145_l2158_DUPLICATE_f953_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c2_1f77_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2158_DUPLICATE_e9e3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2138_c7_3bf1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2158_DUPLICATE_e9e3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_21a9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2158_DUPLICATE_e9e3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2145_c7_57ee_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2158_DUPLICATE_e9e3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2158_c7_e699_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2158_DUPLICATE_e9e3_return_output;
     VAR_BIN_OP_SL_uxn_opcodes_h_l2153_c12_4fba_right := VAR_CONST_SR_4_uxn_opcodes_h_l2153_c36_2ed8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_24ae_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2152_c30_d550_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l2150_c3_f335] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2150_c3_f335_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2150_c3_f335_left;
     BIN_OP_OR_uxn_opcodes_h_l2150_c3_f335_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2150_c3_f335_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2150_c3_f335_return_output := BIN_OP_OR_uxn_opcodes_h_l2150_c3_f335_return_output;

     -- t8_MUX[uxn_opcodes_h_l2141_c7_21a9] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2141_c7_21a9_cond <= VAR_t8_MUX_uxn_opcodes_h_l2141_c7_21a9_cond;
     t8_MUX_uxn_opcodes_h_l2141_c7_21a9_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2141_c7_21a9_iftrue;
     t8_MUX_uxn_opcodes_h_l2141_c7_21a9_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2141_c7_21a9_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2141_c7_21a9_return_output := t8_MUX_uxn_opcodes_h_l2141_c7_21a9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2158_c7_e699] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_e699_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_e699_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_e699_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_e699_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_e699_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_e699_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_e699_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_e699_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2158_c7_e699] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_e699_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_e699_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_e699_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_e699_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_e699_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_e699_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_e699_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_e699_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2133_c1_0a5c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_0a5c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_0a5c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_0a5c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_0a5c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_0a5c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_0a5c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_0a5c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_0a5c_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2161_c21_9738] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2161_c21_9738_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2161_c31_44d1_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2163_c7_6445] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_6445_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_6445_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_6445_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_6445_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_6445_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_6445_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_6445_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_6445_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2147_c3_7a9c] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2147_c3_7a9c_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2147_c3_7a9c_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2147_c3_7a9c_return_output := CONST_SL_8_uxn_opcodes_h_l2147_c3_7a9c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2149_c7_24ae] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_24ae_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_24ae_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_24ae_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_24ae_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_24ae_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_24ae_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_24ae_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_24ae_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2163_c7_6445] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_6445_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_6445_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_6445_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_6445_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_6445_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_6445_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_6445_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_6445_return_output;

     -- Submodule level 2
     VAR_BIN_OP_SR_uxn_opcodes_h_l2153_c12_95a8_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2150_c3_f335_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2149_c7_24ae_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2150_c3_f335_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2158_c7_e699_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2161_c21_9738_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2145_c7_57ee_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2147_c3_7a9c_return_output;
     VAR_printf_uxn_opcodes_h_l2134_c3_ac6d_uxn_opcodes_h_l2134_c3_ac6d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_0a5c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_e699_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_6445_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_24ae_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_e699_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_e699_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_6445_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_57ee_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_24ae_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_24ae_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_e699_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2138_c7_3bf1_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2141_c7_21a9_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2149_c7_24ae] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_24ae_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_24ae_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_24ae_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_24ae_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_24ae_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_24ae_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_24ae_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_24ae_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2145_c7_57ee] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_57ee_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_57ee_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_57ee_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_57ee_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_57ee_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_57ee_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_57ee_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_57ee_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2158_c7_e699] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2158_c7_e699_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2158_c7_e699_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2158_c7_e699_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2158_c7_e699_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2158_c7_e699_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2158_c7_e699_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2158_c7_e699_return_output := result_u8_value_MUX_uxn_opcodes_h_l2158_c7_e699_return_output;

     -- t8_MUX[uxn_opcodes_h_l2138_c7_3bf1] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2138_c7_3bf1_cond <= VAR_t8_MUX_uxn_opcodes_h_l2138_c7_3bf1_cond;
     t8_MUX_uxn_opcodes_h_l2138_c7_3bf1_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2138_c7_3bf1_iftrue;
     t8_MUX_uxn_opcodes_h_l2138_c7_3bf1_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2138_c7_3bf1_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2138_c7_3bf1_return_output := t8_MUX_uxn_opcodes_h_l2138_c7_3bf1_return_output;

     -- printf_uxn_opcodes_h_l2134_c3_ac6d[uxn_opcodes_h_l2134_c3_ac6d] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2134_c3_ac6d_uxn_opcodes_h_l2134_c3_ac6d_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2134_c3_ac6d_uxn_opcodes_h_l2134_c3_ac6d_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- BIN_OP_SR[uxn_opcodes_h_l2153_c12_95a8] LATENCY=0
     -- Inputs
     BIN_OP_SR_uxn_opcodes_h_l2153_c12_95a8_left <= VAR_BIN_OP_SR_uxn_opcodes_h_l2153_c12_95a8_left;
     BIN_OP_SR_uxn_opcodes_h_l2153_c12_95a8_right <= VAR_BIN_OP_SR_uxn_opcodes_h_l2153_c12_95a8_right;
     -- Outputs
     VAR_BIN_OP_SR_uxn_opcodes_h_l2153_c12_95a8_return_output := BIN_OP_SR_uxn_opcodes_h_l2153_c12_95a8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2158_c7_e699] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_e699_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_e699_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_e699_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_e699_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_e699_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_e699_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_e699_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_e699_return_output;

     -- n16_MUX[uxn_opcodes_h_l2149_c7_24ae] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2149_c7_24ae_cond <= VAR_n16_MUX_uxn_opcodes_h_l2149_c7_24ae_cond;
     n16_MUX_uxn_opcodes_h_l2149_c7_24ae_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2149_c7_24ae_iftrue;
     n16_MUX_uxn_opcodes_h_l2149_c7_24ae_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2149_c7_24ae_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2149_c7_24ae_return_output := n16_MUX_uxn_opcodes_h_l2149_c7_24ae_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2158_c7_e699] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_e699_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_e699_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_e699_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_e699_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_e699_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_e699_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_e699_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_e699_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2149_c7_24ae] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_24ae_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_24ae_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_24ae_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_24ae_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_24ae_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_24ae_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_24ae_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_24ae_return_output;

     -- Submodule level 3
     VAR_BIN_OP_SL_uxn_opcodes_h_l2153_c12_4fba_left := VAR_BIN_OP_SR_uxn_opcodes_h_l2153_c12_95a8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2145_c7_57ee_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2149_c7_24ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_24ae_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_e699_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_57ee_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_24ae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_24ae_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_e699_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_21a9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_57ee_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_57ee_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_24ae_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2149_c7_24ae_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2158_c7_e699_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2133_c2_1f77_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2138_c7_3bf1_return_output;
     -- BIN_OP_SL[uxn_opcodes_h_l2153_c12_4fba] LATENCY=0
     -- Inputs
     BIN_OP_SL_uxn_opcodes_h_l2153_c12_4fba_left <= VAR_BIN_OP_SL_uxn_opcodes_h_l2153_c12_4fba_left;
     BIN_OP_SL_uxn_opcodes_h_l2153_c12_4fba_right <= VAR_BIN_OP_SL_uxn_opcodes_h_l2153_c12_4fba_right;
     -- Outputs
     VAR_BIN_OP_SL_uxn_opcodes_h_l2153_c12_4fba_return_output := BIN_OP_SL_uxn_opcodes_h_l2153_c12_4fba_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2149_c7_24ae] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_24ae_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_24ae_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_24ae_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_24ae_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_24ae_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_24ae_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_24ae_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_24ae_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2145_c7_57ee] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_57ee_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_57ee_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_57ee_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_57ee_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_57ee_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_57ee_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_57ee_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_57ee_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2141_c7_21a9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_21a9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_21a9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_21a9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_21a9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_21a9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_21a9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_21a9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_21a9_return_output;

     -- n16_MUX[uxn_opcodes_h_l2145_c7_57ee] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2145_c7_57ee_cond <= VAR_n16_MUX_uxn_opcodes_h_l2145_c7_57ee_cond;
     n16_MUX_uxn_opcodes_h_l2145_c7_57ee_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2145_c7_57ee_iftrue;
     n16_MUX_uxn_opcodes_h_l2145_c7_57ee_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2145_c7_57ee_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2145_c7_57ee_return_output := n16_MUX_uxn_opcodes_h_l2145_c7_57ee_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2149_c7_24ae] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_24ae_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_24ae_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_24ae_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_24ae_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_24ae_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_24ae_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_24ae_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_24ae_return_output;

     -- t8_MUX[uxn_opcodes_h_l2133_c2_1f77] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2133_c2_1f77_cond <= VAR_t8_MUX_uxn_opcodes_h_l2133_c2_1f77_cond;
     t8_MUX_uxn_opcodes_h_l2133_c2_1f77_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2133_c2_1f77_iftrue;
     t8_MUX_uxn_opcodes_h_l2133_c2_1f77_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2133_c2_1f77_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2133_c2_1f77_return_output := t8_MUX_uxn_opcodes_h_l2133_c2_1f77_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2145_c7_57ee] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_57ee_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_57ee_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_57ee_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_57ee_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_57ee_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_57ee_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_57ee_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_57ee_return_output;

     -- Submodule level 4
     VAR_tmp16_MUX_uxn_opcodes_h_l2149_c7_24ae_iftrue := VAR_BIN_OP_SL_uxn_opcodes_h_l2153_c12_4fba_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2141_c7_21a9_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2145_c7_57ee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_57ee_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_24ae_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_21a9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_57ee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_57ee_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_24ae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_3bf1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_21a9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_21a9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_57ee_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2133_c2_1f77_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2141_c7_21a9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_21a9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_21a9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_21a9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_21a9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_21a9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_21a9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_21a9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_21a9_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2156_c21_0981] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2156_c21_0981_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_SL_uxn_opcodes_h_l2153_c12_4fba_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2141_c7_21a9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_21a9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_21a9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_21a9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_21a9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_21a9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_21a9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_21a9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_21a9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2145_c7_57ee] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_57ee_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_57ee_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_57ee_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_57ee_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_57ee_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_57ee_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_57ee_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_57ee_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2138_c7_3bf1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_3bf1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_3bf1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_3bf1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_3bf1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_3bf1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_3bf1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_3bf1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_3bf1_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2149_c7_24ae] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2149_c7_24ae_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2149_c7_24ae_cond;
     tmp16_MUX_uxn_opcodes_h_l2149_c7_24ae_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2149_c7_24ae_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2149_c7_24ae_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2149_c7_24ae_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2149_c7_24ae_return_output := tmp16_MUX_uxn_opcodes_h_l2149_c7_24ae_return_output;

     -- n16_MUX[uxn_opcodes_h_l2141_c7_21a9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2141_c7_21a9_cond <= VAR_n16_MUX_uxn_opcodes_h_l2141_c7_21a9_cond;
     n16_MUX_uxn_opcodes_h_l2141_c7_21a9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2141_c7_21a9_iftrue;
     n16_MUX_uxn_opcodes_h_l2141_c7_21a9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2141_c7_21a9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2141_c7_21a9_return_output := n16_MUX_uxn_opcodes_h_l2141_c7_21a9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2145_c7_57ee] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_57ee_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_57ee_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_57ee_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_57ee_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_57ee_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_57ee_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_57ee_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_57ee_return_output;

     -- Submodule level 5
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2149_c7_24ae_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2156_c21_0981_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2138_c7_3bf1_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2141_c7_21a9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_21a9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_57ee_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_3bf1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_21a9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_21a9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_57ee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_1f77_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_3bf1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_3bf1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_21a9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2145_c7_57ee_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2149_c7_24ae_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2141_c7_21a9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_21a9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_21a9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_21a9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_21a9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_21a9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_21a9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_21a9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_21a9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2141_c7_21a9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_21a9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_21a9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_21a9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_21a9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_21a9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_21a9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_21a9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_21a9_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2145_c7_57ee] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2145_c7_57ee_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2145_c7_57ee_cond;
     tmp16_MUX_uxn_opcodes_h_l2145_c7_57ee_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2145_c7_57ee_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2145_c7_57ee_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2145_c7_57ee_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2145_c7_57ee_return_output := tmp16_MUX_uxn_opcodes_h_l2145_c7_57ee_return_output;

     -- n16_MUX[uxn_opcodes_h_l2138_c7_3bf1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2138_c7_3bf1_cond <= VAR_n16_MUX_uxn_opcodes_h_l2138_c7_3bf1_cond;
     n16_MUX_uxn_opcodes_h_l2138_c7_3bf1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2138_c7_3bf1_iftrue;
     n16_MUX_uxn_opcodes_h_l2138_c7_3bf1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2138_c7_3bf1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2138_c7_3bf1_return_output := n16_MUX_uxn_opcodes_h_l2138_c7_3bf1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2149_c7_24ae] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2149_c7_24ae_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2149_c7_24ae_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2149_c7_24ae_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2149_c7_24ae_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2149_c7_24ae_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2149_c7_24ae_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2149_c7_24ae_return_output := result_u8_value_MUX_uxn_opcodes_h_l2149_c7_24ae_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2133_c2_1f77] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_1f77_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_1f77_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_1f77_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_1f77_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_1f77_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_1f77_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_1f77_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_1f77_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2138_c7_3bf1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_3bf1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_3bf1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_3bf1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_3bf1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_3bf1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_3bf1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_3bf1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_3bf1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2138_c7_3bf1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_3bf1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_3bf1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_3bf1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_3bf1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_3bf1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_3bf1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_3bf1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_3bf1_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2133_c2_1f77_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2138_c7_3bf1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_3bf1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_21a9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_1f77_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_3bf1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_3bf1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_21a9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_1f77_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_3bf1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2145_c7_57ee_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2149_c7_24ae_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_21a9_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2145_c7_57ee_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2133_c2_1f77] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_1f77_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_1f77_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_1f77_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_1f77_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_1f77_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_1f77_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_1f77_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_1f77_return_output;

     -- n16_MUX[uxn_opcodes_h_l2133_c2_1f77] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2133_c2_1f77_cond <= VAR_n16_MUX_uxn_opcodes_h_l2133_c2_1f77_cond;
     n16_MUX_uxn_opcodes_h_l2133_c2_1f77_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2133_c2_1f77_iftrue;
     n16_MUX_uxn_opcodes_h_l2133_c2_1f77_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2133_c2_1f77_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2133_c2_1f77_return_output := n16_MUX_uxn_opcodes_h_l2133_c2_1f77_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2138_c7_3bf1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_3bf1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_3bf1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_3bf1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_3bf1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_3bf1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_3bf1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_3bf1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_3bf1_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2141_c7_21a9] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2141_c7_21a9_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_21a9_cond;
     tmp16_MUX_uxn_opcodes_h_l2141_c7_21a9_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_21a9_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2141_c7_21a9_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_21a9_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_21a9_return_output := tmp16_MUX_uxn_opcodes_h_l2141_c7_21a9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2133_c2_1f77] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_1f77_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_1f77_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_1f77_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_1f77_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_1f77_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_1f77_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_1f77_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_1f77_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2145_c7_57ee] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2145_c7_57ee_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2145_c7_57ee_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2145_c7_57ee_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2145_c7_57ee_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2145_c7_57ee_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2145_c7_57ee_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2145_c7_57ee_return_output := result_u8_value_MUX_uxn_opcodes_h_l2145_c7_57ee_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2138_c7_3bf1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_3bf1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_3bf1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_3bf1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_3bf1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_3bf1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_3bf1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_3bf1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_3bf1_return_output;

     -- Submodule level 7
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2133_c2_1f77_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_1f77_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_3bf1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_1f77_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_3bf1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_21a9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2145_c7_57ee_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2138_c7_3bf1_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_21a9_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2133_c2_1f77] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_1f77_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_1f77_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_1f77_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_1f77_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_1f77_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_1f77_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_1f77_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_1f77_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2133_c2_1f77] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_1f77_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_1f77_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_1f77_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_1f77_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_1f77_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_1f77_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_1f77_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_1f77_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2138_c7_3bf1] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2138_c7_3bf1_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2138_c7_3bf1_cond;
     tmp16_MUX_uxn_opcodes_h_l2138_c7_3bf1_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2138_c7_3bf1_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2138_c7_3bf1_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2138_c7_3bf1_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2138_c7_3bf1_return_output := tmp16_MUX_uxn_opcodes_h_l2138_c7_3bf1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2141_c7_21a9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2141_c7_21a9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_21a9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2141_c7_21a9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_21a9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2141_c7_21a9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_21a9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_21a9_return_output := result_u8_value_MUX_uxn_opcodes_h_l2141_c7_21a9_return_output;

     -- Submodule level 8
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2138_c7_3bf1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_21a9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2133_c2_1f77_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2138_c7_3bf1_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2133_c2_1f77] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2133_c2_1f77_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2133_c2_1f77_cond;
     tmp16_MUX_uxn_opcodes_h_l2133_c2_1f77_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2133_c2_1f77_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2133_c2_1f77_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2133_c2_1f77_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2133_c2_1f77_return_output := tmp16_MUX_uxn_opcodes_h_l2133_c2_1f77_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2138_c7_3bf1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2138_c7_3bf1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2138_c7_3bf1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2138_c7_3bf1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2138_c7_3bf1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2138_c7_3bf1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2138_c7_3bf1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2138_c7_3bf1_return_output := result_u8_value_MUX_uxn_opcodes_h_l2138_c7_3bf1_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c2_1f77_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2138_c7_3bf1_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2133_c2_1f77_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2133_c2_1f77] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2133_c2_1f77_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c2_1f77_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2133_c2_1f77_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c2_1f77_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2133_c2_1f77_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c2_1f77_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c2_1f77_return_output := result_u8_value_MUX_uxn_opcodes_h_l2133_c2_1f77_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l2168_l2128_DUPLICATE_d258 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l2168_l2128_DUPLICATE_d258_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_5b93(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_1f77_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_1f77_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_1f77_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_1f77_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_1f77_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c2_1f77_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l2168_l2128_DUPLICATE_d258_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l2168_l2128_DUPLICATE_d258_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n16 <= REG_COMB_n16;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
