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
entity mul2_0CLK_a7b4806f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end mul2_0CLK_a7b4806f;
architecture arch of mul2_0CLK_a7b4806f is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2128_c6_533c]
signal BIN_OP_EQ_uxn_opcodes_h_l2128_c6_533c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2128_c6_533c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2128_c6_533c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2128_c1_1d50]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2128_c1_1d50_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2128_c1_1d50_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2128_c1_1d50_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2128_c1_1d50_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2128_c2_fabf]
signal n16_MUX_uxn_opcodes_h_l2128_c2_fabf_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2128_c2_fabf_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2128_c2_fabf_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2128_c2_fabf_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2128_c2_fabf]
signal tmp16_MUX_uxn_opcodes_h_l2128_c2_fabf_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2128_c2_fabf_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2128_c2_fabf_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2128_c2_fabf_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2128_c2_fabf]
signal result_u8_value_MUX_uxn_opcodes_h_l2128_c2_fabf_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2128_c2_fabf_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2128_c2_fabf_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2128_c2_fabf_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2128_c2_fabf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2128_c2_fabf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2128_c2_fabf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2128_c2_fabf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2128_c2_fabf_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2128_c2_fabf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c2_fabf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c2_fabf_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c2_fabf_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c2_fabf_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2128_c2_fabf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2128_c2_fabf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2128_c2_fabf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2128_c2_fabf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2128_c2_fabf_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2128_c2_fabf]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2128_c2_fabf_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2128_c2_fabf_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2128_c2_fabf_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2128_c2_fabf_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2128_c2_fabf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c2_fabf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c2_fabf_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c2_fabf_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c2_fabf_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l2128_c2_fabf]
signal t16_MUX_uxn_opcodes_h_l2128_c2_fabf_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2128_c2_fabf_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2128_c2_fabf_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2128_c2_fabf_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2129_c3_c32a[uxn_opcodes_h_l2129_c3_c32a]
signal printf_uxn_opcodes_h_l2129_c3_c32a_uxn_opcodes_h_l2129_c3_c32a_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2133_c11_13fa]
signal BIN_OP_EQ_uxn_opcodes_h_l2133_c11_13fa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2133_c11_13fa_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2133_c11_13fa_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2133_c7_63a9]
signal n16_MUX_uxn_opcodes_h_l2133_c7_63a9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2133_c7_63a9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2133_c7_63a9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2133_c7_63a9_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2133_c7_63a9]
signal tmp16_MUX_uxn_opcodes_h_l2133_c7_63a9_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2133_c7_63a9_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2133_c7_63a9_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2133_c7_63a9_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2133_c7_63a9]
signal result_u8_value_MUX_uxn_opcodes_h_l2133_c7_63a9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2133_c7_63a9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2133_c7_63a9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2133_c7_63a9_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2133_c7_63a9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_63a9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_63a9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_63a9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_63a9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2133_c7_63a9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_63a9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_63a9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_63a9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_63a9_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2133_c7_63a9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_63a9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_63a9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_63a9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_63a9_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2133_c7_63a9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_63a9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_63a9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_63a9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_63a9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2133_c7_63a9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_63a9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_63a9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_63a9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_63a9_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l2133_c7_63a9]
signal t16_MUX_uxn_opcodes_h_l2133_c7_63a9_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2133_c7_63a9_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2133_c7_63a9_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2133_c7_63a9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2136_c11_bfd4]
signal BIN_OP_EQ_uxn_opcodes_h_l2136_c11_bfd4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2136_c11_bfd4_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2136_c11_bfd4_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2136_c7_4b93]
signal n16_MUX_uxn_opcodes_h_l2136_c7_4b93_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2136_c7_4b93_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2136_c7_4b93_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2136_c7_4b93_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2136_c7_4b93]
signal tmp16_MUX_uxn_opcodes_h_l2136_c7_4b93_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2136_c7_4b93_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2136_c7_4b93_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2136_c7_4b93_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2136_c7_4b93]
signal result_u8_value_MUX_uxn_opcodes_h_l2136_c7_4b93_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2136_c7_4b93_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2136_c7_4b93_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2136_c7_4b93_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2136_c7_4b93]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_4b93_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_4b93_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_4b93_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_4b93_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2136_c7_4b93]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_4b93_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_4b93_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_4b93_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_4b93_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2136_c7_4b93]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_4b93_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_4b93_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_4b93_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_4b93_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2136_c7_4b93]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_4b93_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_4b93_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_4b93_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_4b93_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2136_c7_4b93]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_4b93_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_4b93_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_4b93_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_4b93_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l2136_c7_4b93]
signal t16_MUX_uxn_opcodes_h_l2136_c7_4b93_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2136_c7_4b93_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2136_c7_4b93_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2136_c7_4b93_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2141_c11_bde3]
signal BIN_OP_EQ_uxn_opcodes_h_l2141_c11_bde3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2141_c11_bde3_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2141_c11_bde3_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2141_c7_893e]
signal n16_MUX_uxn_opcodes_h_l2141_c7_893e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2141_c7_893e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2141_c7_893e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2141_c7_893e_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2141_c7_893e]
signal tmp16_MUX_uxn_opcodes_h_l2141_c7_893e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2141_c7_893e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2141_c7_893e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2141_c7_893e_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2141_c7_893e]
signal result_u8_value_MUX_uxn_opcodes_h_l2141_c7_893e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2141_c7_893e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2141_c7_893e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2141_c7_893e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2141_c7_893e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_893e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_893e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_893e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_893e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2141_c7_893e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_893e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_893e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_893e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_893e_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2141_c7_893e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_893e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_893e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_893e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_893e_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2141_c7_893e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_893e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_893e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_893e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_893e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2141_c7_893e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_893e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_893e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_893e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_893e_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l2141_c7_893e]
signal t16_MUX_uxn_opcodes_h_l2141_c7_893e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2141_c7_893e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2141_c7_893e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2141_c7_893e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2144_c11_d41f]
signal BIN_OP_EQ_uxn_opcodes_h_l2144_c11_d41f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2144_c11_d41f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2144_c11_d41f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2144_c7_0074]
signal n16_MUX_uxn_opcodes_h_l2144_c7_0074_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2144_c7_0074_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2144_c7_0074_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2144_c7_0074_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2144_c7_0074]
signal tmp16_MUX_uxn_opcodes_h_l2144_c7_0074_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2144_c7_0074_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2144_c7_0074_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2144_c7_0074_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2144_c7_0074]
signal result_u8_value_MUX_uxn_opcodes_h_l2144_c7_0074_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2144_c7_0074_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2144_c7_0074_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2144_c7_0074_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2144_c7_0074]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_0074_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_0074_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_0074_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_0074_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2144_c7_0074]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_0074_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_0074_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_0074_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_0074_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2144_c7_0074]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_0074_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_0074_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_0074_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_0074_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2144_c7_0074]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_0074_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_0074_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_0074_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_0074_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2144_c7_0074]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_0074_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_0074_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_0074_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_0074_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l2144_c7_0074]
signal t16_MUX_uxn_opcodes_h_l2144_c7_0074_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2144_c7_0074_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2144_c7_0074_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2144_c7_0074_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2145_c3_84c9]
signal BIN_OP_OR_uxn_opcodes_h_l2145_c3_84c9_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2145_c3_84c9_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2145_c3_84c9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2148_c11_6d1f]
signal BIN_OP_EQ_uxn_opcodes_h_l2148_c11_6d1f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2148_c11_6d1f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2148_c11_6d1f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2148_c7_0884]
signal n16_MUX_uxn_opcodes_h_l2148_c7_0884_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2148_c7_0884_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2148_c7_0884_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2148_c7_0884_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2148_c7_0884]
signal tmp16_MUX_uxn_opcodes_h_l2148_c7_0884_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2148_c7_0884_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2148_c7_0884_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2148_c7_0884_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2148_c7_0884]
signal result_u8_value_MUX_uxn_opcodes_h_l2148_c7_0884_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2148_c7_0884_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2148_c7_0884_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2148_c7_0884_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2148_c7_0884]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2148_c7_0884_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2148_c7_0884_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2148_c7_0884_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2148_c7_0884_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2148_c7_0884]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2148_c7_0884_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2148_c7_0884_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2148_c7_0884_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2148_c7_0884_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2148_c7_0884]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2148_c7_0884_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2148_c7_0884_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2148_c7_0884_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2148_c7_0884_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2148_c7_0884]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2148_c7_0884_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2148_c7_0884_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2148_c7_0884_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2148_c7_0884_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2148_c7_0884]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2148_c7_0884_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2148_c7_0884_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2148_c7_0884_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2148_c7_0884_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2151_c11_1990]
signal BIN_OP_EQ_uxn_opcodes_h_l2151_c11_1990_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2151_c11_1990_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2151_c11_1990_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2151_c7_3de2]
signal n16_MUX_uxn_opcodes_h_l2151_c7_3de2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2151_c7_3de2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2151_c7_3de2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2151_c7_3de2_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2151_c7_3de2]
signal tmp16_MUX_uxn_opcodes_h_l2151_c7_3de2_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2151_c7_3de2_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2151_c7_3de2_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2151_c7_3de2_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2151_c7_3de2]
signal result_u8_value_MUX_uxn_opcodes_h_l2151_c7_3de2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2151_c7_3de2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2151_c7_3de2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2151_c7_3de2_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2151_c7_3de2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_3de2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_3de2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_3de2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_3de2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2151_c7_3de2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_3de2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_3de2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_3de2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_3de2_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2151_c7_3de2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_3de2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_3de2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_3de2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_3de2_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2151_c7_3de2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_3de2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_3de2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_3de2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_3de2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2151_c7_3de2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_3de2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_3de2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_3de2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_3de2_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2156_c11_184e]
signal BIN_OP_EQ_uxn_opcodes_h_l2156_c11_184e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2156_c11_184e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2156_c11_184e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2156_c7_441b]
signal n16_MUX_uxn_opcodes_h_l2156_c7_441b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2156_c7_441b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2156_c7_441b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2156_c7_441b_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2156_c7_441b]
signal tmp16_MUX_uxn_opcodes_h_l2156_c7_441b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2156_c7_441b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2156_c7_441b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2156_c7_441b_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2156_c7_441b]
signal result_u8_value_MUX_uxn_opcodes_h_l2156_c7_441b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2156_c7_441b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2156_c7_441b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2156_c7_441b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2156_c7_441b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2156_c7_441b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2156_c7_441b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2156_c7_441b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2156_c7_441b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2156_c7_441b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2156_c7_441b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2156_c7_441b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2156_c7_441b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2156_c7_441b_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2156_c7_441b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2156_c7_441b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2156_c7_441b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2156_c7_441b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2156_c7_441b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2156_c7_441b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2156_c7_441b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2156_c7_441b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2156_c7_441b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2156_c7_441b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2156_c7_441b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2156_c7_441b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2156_c7_441b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2156_c7_441b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2156_c7_441b_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2159_c11_814d]
signal BIN_OP_EQ_uxn_opcodes_h_l2159_c11_814d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2159_c11_814d_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2159_c11_814d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2159_c7_3865]
signal n16_MUX_uxn_opcodes_h_l2159_c7_3865_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2159_c7_3865_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2159_c7_3865_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2159_c7_3865_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2159_c7_3865]
signal tmp16_MUX_uxn_opcodes_h_l2159_c7_3865_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2159_c7_3865_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2159_c7_3865_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2159_c7_3865_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2159_c7_3865]
signal result_u8_value_MUX_uxn_opcodes_h_l2159_c7_3865_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2159_c7_3865_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2159_c7_3865_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2159_c7_3865_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2159_c7_3865]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_3865_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_3865_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_3865_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_3865_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2159_c7_3865]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_3865_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_3865_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_3865_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_3865_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2159_c7_3865]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_3865_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_3865_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_3865_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_3865_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2159_c7_3865]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_3865_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_3865_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_3865_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_3865_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2159_c7_3865]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_3865_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_3865_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_3865_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_3865_return_output : unsigned(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2160_c3_c9c5]
signal BIN_OP_OR_uxn_opcodes_h_l2160_c3_c9c5_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2160_c3_c9c5_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2160_c3_c9c5_return_output : unsigned(15 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l2161_c11_4fa4]
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2161_c11_4fa4_left : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2161_c11_4fa4_right : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2161_c11_4fa4_return_output : unsigned(31 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2163_c30_84ac]
signal sp_relative_shift_uxn_opcodes_h_l2163_c30_84ac_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2163_c30_84ac_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2163_c30_84ac_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2163_c30_84ac_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2168_c11_5cfc]
signal BIN_OP_EQ_uxn_opcodes_h_l2168_c11_5cfc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2168_c11_5cfc_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2168_c11_5cfc_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2168_c7_d4f6]
signal result_u8_value_MUX_uxn_opcodes_h_l2168_c7_d4f6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2168_c7_d4f6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2168_c7_d4f6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2168_c7_d4f6_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2168_c7_d4f6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2168_c7_d4f6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2168_c7_d4f6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2168_c7_d4f6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2168_c7_d4f6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2168_c7_d4f6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2168_c7_d4f6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2168_c7_d4f6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2168_c7_d4f6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2168_c7_d4f6_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2168_c7_d4f6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c7_d4f6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c7_d4f6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c7_d4f6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c7_d4f6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2168_c7_d4f6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c7_d4f6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c7_d4f6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c7_d4f6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c7_d4f6_return_output : unsigned(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2171_c31_ba49]
signal CONST_SR_8_uxn_opcodes_h_l2171_c31_ba49_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2171_c31_ba49_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2173_c11_cefc]
signal BIN_OP_EQ_uxn_opcodes_h_l2173_c11_cefc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2173_c11_cefc_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2173_c11_cefc_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2173_c7_1329]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_1329_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_1329_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_1329_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_1329_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2173_c7_1329]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_1329_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_1329_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_1329_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_1329_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2138_l2153_DUPLICATE_055d
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2138_l2153_DUPLICATE_055d_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2138_l2153_DUPLICATE_055d_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2128_c6_533c
BIN_OP_EQ_uxn_opcodes_h_l2128_c6_533c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2128_c6_533c_left,
BIN_OP_EQ_uxn_opcodes_h_l2128_c6_533c_right,
BIN_OP_EQ_uxn_opcodes_h_l2128_c6_533c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2128_c1_1d50
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2128_c1_1d50 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2128_c1_1d50_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2128_c1_1d50_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2128_c1_1d50_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2128_c1_1d50_return_output);

-- n16_MUX_uxn_opcodes_h_l2128_c2_fabf
n16_MUX_uxn_opcodes_h_l2128_c2_fabf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2128_c2_fabf_cond,
n16_MUX_uxn_opcodes_h_l2128_c2_fabf_iftrue,
n16_MUX_uxn_opcodes_h_l2128_c2_fabf_iffalse,
n16_MUX_uxn_opcodes_h_l2128_c2_fabf_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2128_c2_fabf
tmp16_MUX_uxn_opcodes_h_l2128_c2_fabf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2128_c2_fabf_cond,
tmp16_MUX_uxn_opcodes_h_l2128_c2_fabf_iftrue,
tmp16_MUX_uxn_opcodes_h_l2128_c2_fabf_iffalse,
tmp16_MUX_uxn_opcodes_h_l2128_c2_fabf_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2128_c2_fabf
result_u8_value_MUX_uxn_opcodes_h_l2128_c2_fabf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2128_c2_fabf_cond,
result_u8_value_MUX_uxn_opcodes_h_l2128_c2_fabf_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2128_c2_fabf_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2128_c2_fabf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2128_c2_fabf
result_is_opc_done_MUX_uxn_opcodes_h_l2128_c2_fabf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2128_c2_fabf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2128_c2_fabf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2128_c2_fabf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2128_c2_fabf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c2_fabf
result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c2_fabf : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c2_fabf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c2_fabf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c2_fabf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c2_fabf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2128_c2_fabf
result_is_stack_write_MUX_uxn_opcodes_h_l2128_c2_fabf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2128_c2_fabf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2128_c2_fabf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2128_c2_fabf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2128_c2_fabf_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2128_c2_fabf
result_is_sp_shift_MUX_uxn_opcodes_h_l2128_c2_fabf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2128_c2_fabf_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2128_c2_fabf_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2128_c2_fabf_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2128_c2_fabf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c2_fabf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c2_fabf : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c2_fabf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c2_fabf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c2_fabf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c2_fabf_return_output);

-- t16_MUX_uxn_opcodes_h_l2128_c2_fabf
t16_MUX_uxn_opcodes_h_l2128_c2_fabf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2128_c2_fabf_cond,
t16_MUX_uxn_opcodes_h_l2128_c2_fabf_iftrue,
t16_MUX_uxn_opcodes_h_l2128_c2_fabf_iffalse,
t16_MUX_uxn_opcodes_h_l2128_c2_fabf_return_output);

-- printf_uxn_opcodes_h_l2129_c3_c32a_uxn_opcodes_h_l2129_c3_c32a
printf_uxn_opcodes_h_l2129_c3_c32a_uxn_opcodes_h_l2129_c3_c32a : entity work.printf_uxn_opcodes_h_l2129_c3_c32a_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2129_c3_c32a_uxn_opcodes_h_l2129_c3_c32a_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2133_c11_13fa
BIN_OP_EQ_uxn_opcodes_h_l2133_c11_13fa : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2133_c11_13fa_left,
BIN_OP_EQ_uxn_opcodes_h_l2133_c11_13fa_right,
BIN_OP_EQ_uxn_opcodes_h_l2133_c11_13fa_return_output);

-- n16_MUX_uxn_opcodes_h_l2133_c7_63a9
n16_MUX_uxn_opcodes_h_l2133_c7_63a9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2133_c7_63a9_cond,
n16_MUX_uxn_opcodes_h_l2133_c7_63a9_iftrue,
n16_MUX_uxn_opcodes_h_l2133_c7_63a9_iffalse,
n16_MUX_uxn_opcodes_h_l2133_c7_63a9_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2133_c7_63a9
tmp16_MUX_uxn_opcodes_h_l2133_c7_63a9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2133_c7_63a9_cond,
tmp16_MUX_uxn_opcodes_h_l2133_c7_63a9_iftrue,
tmp16_MUX_uxn_opcodes_h_l2133_c7_63a9_iffalse,
tmp16_MUX_uxn_opcodes_h_l2133_c7_63a9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2133_c7_63a9
result_u8_value_MUX_uxn_opcodes_h_l2133_c7_63a9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2133_c7_63a9_cond,
result_u8_value_MUX_uxn_opcodes_h_l2133_c7_63a9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2133_c7_63a9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2133_c7_63a9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_63a9
result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_63a9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_63a9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_63a9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_63a9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_63a9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_63a9
result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_63a9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_63a9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_63a9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_63a9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_63a9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_63a9
result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_63a9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_63a9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_63a9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_63a9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_63a9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_63a9
result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_63a9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_63a9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_63a9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_63a9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_63a9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_63a9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_63a9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_63a9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_63a9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_63a9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_63a9_return_output);

-- t16_MUX_uxn_opcodes_h_l2133_c7_63a9
t16_MUX_uxn_opcodes_h_l2133_c7_63a9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2133_c7_63a9_cond,
t16_MUX_uxn_opcodes_h_l2133_c7_63a9_iftrue,
t16_MUX_uxn_opcodes_h_l2133_c7_63a9_iffalse,
t16_MUX_uxn_opcodes_h_l2133_c7_63a9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2136_c11_bfd4
BIN_OP_EQ_uxn_opcodes_h_l2136_c11_bfd4 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2136_c11_bfd4_left,
BIN_OP_EQ_uxn_opcodes_h_l2136_c11_bfd4_right,
BIN_OP_EQ_uxn_opcodes_h_l2136_c11_bfd4_return_output);

-- n16_MUX_uxn_opcodes_h_l2136_c7_4b93
n16_MUX_uxn_opcodes_h_l2136_c7_4b93 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2136_c7_4b93_cond,
n16_MUX_uxn_opcodes_h_l2136_c7_4b93_iftrue,
n16_MUX_uxn_opcodes_h_l2136_c7_4b93_iffalse,
n16_MUX_uxn_opcodes_h_l2136_c7_4b93_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2136_c7_4b93
tmp16_MUX_uxn_opcodes_h_l2136_c7_4b93 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2136_c7_4b93_cond,
tmp16_MUX_uxn_opcodes_h_l2136_c7_4b93_iftrue,
tmp16_MUX_uxn_opcodes_h_l2136_c7_4b93_iffalse,
tmp16_MUX_uxn_opcodes_h_l2136_c7_4b93_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2136_c7_4b93
result_u8_value_MUX_uxn_opcodes_h_l2136_c7_4b93 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2136_c7_4b93_cond,
result_u8_value_MUX_uxn_opcodes_h_l2136_c7_4b93_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2136_c7_4b93_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2136_c7_4b93_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_4b93
result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_4b93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_4b93_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_4b93_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_4b93_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_4b93_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_4b93
result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_4b93 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_4b93_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_4b93_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_4b93_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_4b93_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_4b93
result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_4b93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_4b93_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_4b93_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_4b93_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_4b93_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_4b93
result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_4b93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_4b93_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_4b93_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_4b93_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_4b93_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_4b93
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_4b93 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_4b93_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_4b93_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_4b93_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_4b93_return_output);

-- t16_MUX_uxn_opcodes_h_l2136_c7_4b93
t16_MUX_uxn_opcodes_h_l2136_c7_4b93 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2136_c7_4b93_cond,
t16_MUX_uxn_opcodes_h_l2136_c7_4b93_iftrue,
t16_MUX_uxn_opcodes_h_l2136_c7_4b93_iffalse,
t16_MUX_uxn_opcodes_h_l2136_c7_4b93_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2141_c11_bde3
BIN_OP_EQ_uxn_opcodes_h_l2141_c11_bde3 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2141_c11_bde3_left,
BIN_OP_EQ_uxn_opcodes_h_l2141_c11_bde3_right,
BIN_OP_EQ_uxn_opcodes_h_l2141_c11_bde3_return_output);

-- n16_MUX_uxn_opcodes_h_l2141_c7_893e
n16_MUX_uxn_opcodes_h_l2141_c7_893e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2141_c7_893e_cond,
n16_MUX_uxn_opcodes_h_l2141_c7_893e_iftrue,
n16_MUX_uxn_opcodes_h_l2141_c7_893e_iffalse,
n16_MUX_uxn_opcodes_h_l2141_c7_893e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2141_c7_893e
tmp16_MUX_uxn_opcodes_h_l2141_c7_893e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2141_c7_893e_cond,
tmp16_MUX_uxn_opcodes_h_l2141_c7_893e_iftrue,
tmp16_MUX_uxn_opcodes_h_l2141_c7_893e_iffalse,
tmp16_MUX_uxn_opcodes_h_l2141_c7_893e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2141_c7_893e
result_u8_value_MUX_uxn_opcodes_h_l2141_c7_893e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2141_c7_893e_cond,
result_u8_value_MUX_uxn_opcodes_h_l2141_c7_893e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2141_c7_893e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2141_c7_893e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_893e
result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_893e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_893e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_893e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_893e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_893e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_893e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_893e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_893e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_893e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_893e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_893e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_893e
result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_893e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_893e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_893e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_893e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_893e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_893e
result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_893e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_893e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_893e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_893e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_893e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_893e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_893e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_893e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_893e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_893e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_893e_return_output);

-- t16_MUX_uxn_opcodes_h_l2141_c7_893e
t16_MUX_uxn_opcodes_h_l2141_c7_893e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2141_c7_893e_cond,
t16_MUX_uxn_opcodes_h_l2141_c7_893e_iftrue,
t16_MUX_uxn_opcodes_h_l2141_c7_893e_iffalse,
t16_MUX_uxn_opcodes_h_l2141_c7_893e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2144_c11_d41f
BIN_OP_EQ_uxn_opcodes_h_l2144_c11_d41f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2144_c11_d41f_left,
BIN_OP_EQ_uxn_opcodes_h_l2144_c11_d41f_right,
BIN_OP_EQ_uxn_opcodes_h_l2144_c11_d41f_return_output);

-- n16_MUX_uxn_opcodes_h_l2144_c7_0074
n16_MUX_uxn_opcodes_h_l2144_c7_0074 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2144_c7_0074_cond,
n16_MUX_uxn_opcodes_h_l2144_c7_0074_iftrue,
n16_MUX_uxn_opcodes_h_l2144_c7_0074_iffalse,
n16_MUX_uxn_opcodes_h_l2144_c7_0074_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2144_c7_0074
tmp16_MUX_uxn_opcodes_h_l2144_c7_0074 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2144_c7_0074_cond,
tmp16_MUX_uxn_opcodes_h_l2144_c7_0074_iftrue,
tmp16_MUX_uxn_opcodes_h_l2144_c7_0074_iffalse,
tmp16_MUX_uxn_opcodes_h_l2144_c7_0074_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2144_c7_0074
result_u8_value_MUX_uxn_opcodes_h_l2144_c7_0074 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2144_c7_0074_cond,
result_u8_value_MUX_uxn_opcodes_h_l2144_c7_0074_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2144_c7_0074_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2144_c7_0074_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_0074
result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_0074 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_0074_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_0074_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_0074_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_0074_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_0074
result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_0074 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_0074_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_0074_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_0074_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_0074_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_0074
result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_0074 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_0074_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_0074_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_0074_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_0074_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_0074
result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_0074 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_0074_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_0074_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_0074_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_0074_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_0074
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_0074 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_0074_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_0074_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_0074_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_0074_return_output);

-- t16_MUX_uxn_opcodes_h_l2144_c7_0074
t16_MUX_uxn_opcodes_h_l2144_c7_0074 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2144_c7_0074_cond,
t16_MUX_uxn_opcodes_h_l2144_c7_0074_iftrue,
t16_MUX_uxn_opcodes_h_l2144_c7_0074_iffalse,
t16_MUX_uxn_opcodes_h_l2144_c7_0074_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2145_c3_84c9
BIN_OP_OR_uxn_opcodes_h_l2145_c3_84c9 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2145_c3_84c9_left,
BIN_OP_OR_uxn_opcodes_h_l2145_c3_84c9_right,
BIN_OP_OR_uxn_opcodes_h_l2145_c3_84c9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2148_c11_6d1f
BIN_OP_EQ_uxn_opcodes_h_l2148_c11_6d1f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2148_c11_6d1f_left,
BIN_OP_EQ_uxn_opcodes_h_l2148_c11_6d1f_right,
BIN_OP_EQ_uxn_opcodes_h_l2148_c11_6d1f_return_output);

-- n16_MUX_uxn_opcodes_h_l2148_c7_0884
n16_MUX_uxn_opcodes_h_l2148_c7_0884 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2148_c7_0884_cond,
n16_MUX_uxn_opcodes_h_l2148_c7_0884_iftrue,
n16_MUX_uxn_opcodes_h_l2148_c7_0884_iffalse,
n16_MUX_uxn_opcodes_h_l2148_c7_0884_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2148_c7_0884
tmp16_MUX_uxn_opcodes_h_l2148_c7_0884 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2148_c7_0884_cond,
tmp16_MUX_uxn_opcodes_h_l2148_c7_0884_iftrue,
tmp16_MUX_uxn_opcodes_h_l2148_c7_0884_iffalse,
tmp16_MUX_uxn_opcodes_h_l2148_c7_0884_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2148_c7_0884
result_u8_value_MUX_uxn_opcodes_h_l2148_c7_0884 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2148_c7_0884_cond,
result_u8_value_MUX_uxn_opcodes_h_l2148_c7_0884_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2148_c7_0884_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2148_c7_0884_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2148_c7_0884
result_is_opc_done_MUX_uxn_opcodes_h_l2148_c7_0884 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2148_c7_0884_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2148_c7_0884_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2148_c7_0884_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2148_c7_0884_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2148_c7_0884
result_sp_relative_shift_MUX_uxn_opcodes_h_l2148_c7_0884 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2148_c7_0884_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2148_c7_0884_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2148_c7_0884_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2148_c7_0884_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2148_c7_0884
result_is_stack_write_MUX_uxn_opcodes_h_l2148_c7_0884 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2148_c7_0884_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2148_c7_0884_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2148_c7_0884_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2148_c7_0884_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2148_c7_0884
result_is_sp_shift_MUX_uxn_opcodes_h_l2148_c7_0884 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2148_c7_0884_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2148_c7_0884_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2148_c7_0884_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2148_c7_0884_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2148_c7_0884
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2148_c7_0884 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2148_c7_0884_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2148_c7_0884_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2148_c7_0884_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2148_c7_0884_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2151_c11_1990
BIN_OP_EQ_uxn_opcodes_h_l2151_c11_1990 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2151_c11_1990_left,
BIN_OP_EQ_uxn_opcodes_h_l2151_c11_1990_right,
BIN_OP_EQ_uxn_opcodes_h_l2151_c11_1990_return_output);

-- n16_MUX_uxn_opcodes_h_l2151_c7_3de2
n16_MUX_uxn_opcodes_h_l2151_c7_3de2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2151_c7_3de2_cond,
n16_MUX_uxn_opcodes_h_l2151_c7_3de2_iftrue,
n16_MUX_uxn_opcodes_h_l2151_c7_3de2_iffalse,
n16_MUX_uxn_opcodes_h_l2151_c7_3de2_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2151_c7_3de2
tmp16_MUX_uxn_opcodes_h_l2151_c7_3de2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2151_c7_3de2_cond,
tmp16_MUX_uxn_opcodes_h_l2151_c7_3de2_iftrue,
tmp16_MUX_uxn_opcodes_h_l2151_c7_3de2_iffalse,
tmp16_MUX_uxn_opcodes_h_l2151_c7_3de2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2151_c7_3de2
result_u8_value_MUX_uxn_opcodes_h_l2151_c7_3de2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2151_c7_3de2_cond,
result_u8_value_MUX_uxn_opcodes_h_l2151_c7_3de2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2151_c7_3de2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2151_c7_3de2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_3de2
result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_3de2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_3de2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_3de2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_3de2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_3de2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_3de2
result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_3de2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_3de2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_3de2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_3de2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_3de2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_3de2
result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_3de2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_3de2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_3de2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_3de2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_3de2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_3de2
result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_3de2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_3de2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_3de2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_3de2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_3de2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_3de2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_3de2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_3de2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_3de2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_3de2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_3de2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2156_c11_184e
BIN_OP_EQ_uxn_opcodes_h_l2156_c11_184e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2156_c11_184e_left,
BIN_OP_EQ_uxn_opcodes_h_l2156_c11_184e_right,
BIN_OP_EQ_uxn_opcodes_h_l2156_c11_184e_return_output);

-- n16_MUX_uxn_opcodes_h_l2156_c7_441b
n16_MUX_uxn_opcodes_h_l2156_c7_441b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2156_c7_441b_cond,
n16_MUX_uxn_opcodes_h_l2156_c7_441b_iftrue,
n16_MUX_uxn_opcodes_h_l2156_c7_441b_iffalse,
n16_MUX_uxn_opcodes_h_l2156_c7_441b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2156_c7_441b
tmp16_MUX_uxn_opcodes_h_l2156_c7_441b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2156_c7_441b_cond,
tmp16_MUX_uxn_opcodes_h_l2156_c7_441b_iftrue,
tmp16_MUX_uxn_opcodes_h_l2156_c7_441b_iffalse,
tmp16_MUX_uxn_opcodes_h_l2156_c7_441b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2156_c7_441b
result_u8_value_MUX_uxn_opcodes_h_l2156_c7_441b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2156_c7_441b_cond,
result_u8_value_MUX_uxn_opcodes_h_l2156_c7_441b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2156_c7_441b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2156_c7_441b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2156_c7_441b
result_is_opc_done_MUX_uxn_opcodes_h_l2156_c7_441b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2156_c7_441b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2156_c7_441b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2156_c7_441b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2156_c7_441b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2156_c7_441b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2156_c7_441b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2156_c7_441b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2156_c7_441b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2156_c7_441b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2156_c7_441b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2156_c7_441b
result_is_stack_write_MUX_uxn_opcodes_h_l2156_c7_441b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2156_c7_441b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2156_c7_441b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2156_c7_441b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2156_c7_441b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2156_c7_441b
result_is_sp_shift_MUX_uxn_opcodes_h_l2156_c7_441b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2156_c7_441b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2156_c7_441b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2156_c7_441b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2156_c7_441b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2156_c7_441b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2156_c7_441b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2156_c7_441b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2156_c7_441b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2156_c7_441b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2156_c7_441b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2159_c11_814d
BIN_OP_EQ_uxn_opcodes_h_l2159_c11_814d : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2159_c11_814d_left,
BIN_OP_EQ_uxn_opcodes_h_l2159_c11_814d_right,
BIN_OP_EQ_uxn_opcodes_h_l2159_c11_814d_return_output);

-- n16_MUX_uxn_opcodes_h_l2159_c7_3865
n16_MUX_uxn_opcodes_h_l2159_c7_3865 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2159_c7_3865_cond,
n16_MUX_uxn_opcodes_h_l2159_c7_3865_iftrue,
n16_MUX_uxn_opcodes_h_l2159_c7_3865_iffalse,
n16_MUX_uxn_opcodes_h_l2159_c7_3865_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2159_c7_3865
tmp16_MUX_uxn_opcodes_h_l2159_c7_3865 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2159_c7_3865_cond,
tmp16_MUX_uxn_opcodes_h_l2159_c7_3865_iftrue,
tmp16_MUX_uxn_opcodes_h_l2159_c7_3865_iffalse,
tmp16_MUX_uxn_opcodes_h_l2159_c7_3865_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2159_c7_3865
result_u8_value_MUX_uxn_opcodes_h_l2159_c7_3865 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2159_c7_3865_cond,
result_u8_value_MUX_uxn_opcodes_h_l2159_c7_3865_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2159_c7_3865_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2159_c7_3865_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_3865
result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_3865 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_3865_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_3865_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_3865_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_3865_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_3865
result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_3865 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_3865_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_3865_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_3865_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_3865_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_3865
result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_3865 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_3865_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_3865_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_3865_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_3865_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_3865
result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_3865 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_3865_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_3865_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_3865_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_3865_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_3865
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_3865 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_3865_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_3865_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_3865_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_3865_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2160_c3_c9c5
BIN_OP_OR_uxn_opcodes_h_l2160_c3_c9c5 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2160_c3_c9c5_left,
BIN_OP_OR_uxn_opcodes_h_l2160_c3_c9c5_right,
BIN_OP_OR_uxn_opcodes_h_l2160_c3_c9c5_return_output);

-- BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2161_c11_4fa4
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2161_c11_4fa4 : entity work.BIN_OP_INFERRED_MULT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2161_c11_4fa4_left,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2161_c11_4fa4_right,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2161_c11_4fa4_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2163_c30_84ac
sp_relative_shift_uxn_opcodes_h_l2163_c30_84ac : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2163_c30_84ac_ins,
sp_relative_shift_uxn_opcodes_h_l2163_c30_84ac_x,
sp_relative_shift_uxn_opcodes_h_l2163_c30_84ac_y,
sp_relative_shift_uxn_opcodes_h_l2163_c30_84ac_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2168_c11_5cfc
BIN_OP_EQ_uxn_opcodes_h_l2168_c11_5cfc : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2168_c11_5cfc_left,
BIN_OP_EQ_uxn_opcodes_h_l2168_c11_5cfc_right,
BIN_OP_EQ_uxn_opcodes_h_l2168_c11_5cfc_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2168_c7_d4f6
result_u8_value_MUX_uxn_opcodes_h_l2168_c7_d4f6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2168_c7_d4f6_cond,
result_u8_value_MUX_uxn_opcodes_h_l2168_c7_d4f6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2168_c7_d4f6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2168_c7_d4f6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2168_c7_d4f6
result_is_opc_done_MUX_uxn_opcodes_h_l2168_c7_d4f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2168_c7_d4f6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2168_c7_d4f6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2168_c7_d4f6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2168_c7_d4f6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2168_c7_d4f6
result_is_stack_write_MUX_uxn_opcodes_h_l2168_c7_d4f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2168_c7_d4f6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2168_c7_d4f6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2168_c7_d4f6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2168_c7_d4f6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c7_d4f6
result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c7_d4f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c7_d4f6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c7_d4f6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c7_d4f6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c7_d4f6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c7_d4f6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c7_d4f6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c7_d4f6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c7_d4f6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c7_d4f6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c7_d4f6_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2171_c31_ba49
CONST_SR_8_uxn_opcodes_h_l2171_c31_ba49 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2171_c31_ba49_x,
CONST_SR_8_uxn_opcodes_h_l2171_c31_ba49_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2173_c11_cefc
BIN_OP_EQ_uxn_opcodes_h_l2173_c11_cefc : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2173_c11_cefc_left,
BIN_OP_EQ_uxn_opcodes_h_l2173_c11_cefc_right,
BIN_OP_EQ_uxn_opcodes_h_l2173_c11_cefc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_1329
result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_1329 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_1329_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_1329_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_1329_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_1329_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_1329
result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_1329 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_1329_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_1329_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_1329_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_1329_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2138_l2153_DUPLICATE_055d
CONST_SL_8_uint16_t_uxn_opcodes_h_l2138_l2153_DUPLICATE_055d : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2138_l2153_DUPLICATE_055d_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2138_l2153_DUPLICATE_055d_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2128_c6_533c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2128_c1_1d50_return_output,
 n16_MUX_uxn_opcodes_h_l2128_c2_fabf_return_output,
 tmp16_MUX_uxn_opcodes_h_l2128_c2_fabf_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2128_c2_fabf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2128_c2_fabf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c2_fabf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2128_c2_fabf_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2128_c2_fabf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c2_fabf_return_output,
 t16_MUX_uxn_opcodes_h_l2128_c2_fabf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2133_c11_13fa_return_output,
 n16_MUX_uxn_opcodes_h_l2133_c7_63a9_return_output,
 tmp16_MUX_uxn_opcodes_h_l2133_c7_63a9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2133_c7_63a9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_63a9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_63a9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_63a9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_63a9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_63a9_return_output,
 t16_MUX_uxn_opcodes_h_l2133_c7_63a9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2136_c11_bfd4_return_output,
 n16_MUX_uxn_opcodes_h_l2136_c7_4b93_return_output,
 tmp16_MUX_uxn_opcodes_h_l2136_c7_4b93_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2136_c7_4b93_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_4b93_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_4b93_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_4b93_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_4b93_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_4b93_return_output,
 t16_MUX_uxn_opcodes_h_l2136_c7_4b93_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2141_c11_bde3_return_output,
 n16_MUX_uxn_opcodes_h_l2141_c7_893e_return_output,
 tmp16_MUX_uxn_opcodes_h_l2141_c7_893e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2141_c7_893e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_893e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_893e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_893e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_893e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_893e_return_output,
 t16_MUX_uxn_opcodes_h_l2141_c7_893e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2144_c11_d41f_return_output,
 n16_MUX_uxn_opcodes_h_l2144_c7_0074_return_output,
 tmp16_MUX_uxn_opcodes_h_l2144_c7_0074_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2144_c7_0074_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_0074_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_0074_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_0074_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_0074_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_0074_return_output,
 t16_MUX_uxn_opcodes_h_l2144_c7_0074_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2145_c3_84c9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2148_c11_6d1f_return_output,
 n16_MUX_uxn_opcodes_h_l2148_c7_0884_return_output,
 tmp16_MUX_uxn_opcodes_h_l2148_c7_0884_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2148_c7_0884_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2148_c7_0884_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2148_c7_0884_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2148_c7_0884_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2148_c7_0884_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2148_c7_0884_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2151_c11_1990_return_output,
 n16_MUX_uxn_opcodes_h_l2151_c7_3de2_return_output,
 tmp16_MUX_uxn_opcodes_h_l2151_c7_3de2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2151_c7_3de2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_3de2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_3de2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_3de2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_3de2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_3de2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2156_c11_184e_return_output,
 n16_MUX_uxn_opcodes_h_l2156_c7_441b_return_output,
 tmp16_MUX_uxn_opcodes_h_l2156_c7_441b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2156_c7_441b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2156_c7_441b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2156_c7_441b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2156_c7_441b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2156_c7_441b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2156_c7_441b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2159_c11_814d_return_output,
 n16_MUX_uxn_opcodes_h_l2159_c7_3865_return_output,
 tmp16_MUX_uxn_opcodes_h_l2159_c7_3865_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2159_c7_3865_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_3865_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_3865_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_3865_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_3865_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_3865_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2160_c3_c9c5_return_output,
 BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2161_c11_4fa4_return_output,
 sp_relative_shift_uxn_opcodes_h_l2163_c30_84ac_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2168_c11_5cfc_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2168_c7_d4f6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2168_c7_d4f6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2168_c7_d4f6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c7_d4f6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c7_d4f6_return_output,
 CONST_SR_8_uxn_opcodes_h_l2171_c31_ba49_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2173_c11_cefc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_1329_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_1329_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2138_l2153_DUPLICATE_055d_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c6_533c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c6_533c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c6_533c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2128_c1_1d50_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2128_c1_1d50_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2128_c1_1d50_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2128_c1_1d50_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2128_c2_fabf_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2128_c2_fabf_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2133_c7_63a9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2128_c2_fabf_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2128_c2_fabf_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2128_c2_fabf_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2128_c2_fabf_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2133_c7_63a9_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2128_c2_fabf_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2128_c2_fabf_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c2_fabf_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c2_fabf_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c7_63a9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c2_fabf_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c2_fabf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c2_fabf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c2_fabf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_63a9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c2_fabf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c2_fabf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c2_fabf_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c2_fabf_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_63a9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c2_fabf_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c2_fabf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2128_c2_fabf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2128_c2_fabf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_63a9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2128_c2_fabf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2128_c2_fabf_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2128_c2_fabf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2128_c2_fabf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_63a9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2128_c2_fabf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2128_c2_fabf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c2_fabf_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2130_c3_aabf : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c2_fabf_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_63a9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c2_fabf_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c2_fabf_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2128_c2_fabf_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2128_c2_fabf_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2133_c7_63a9_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2128_c2_fabf_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2128_c2_fabf_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2129_c3_c32a_uxn_opcodes_h_l2129_c3_c32a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_13fa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_13fa_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_13fa_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2133_c7_63a9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2133_c7_63a9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2136_c7_4b93_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2133_c7_63a9_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2133_c7_63a9_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2133_c7_63a9_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2136_c7_4b93_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2133_c7_63a9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c7_63a9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c7_63a9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2136_c7_4b93_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c7_63a9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_63a9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_63a9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_4b93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_63a9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_63a9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_63a9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_4b93_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_63a9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_63a9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_63a9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_4b93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_63a9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_63a9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_63a9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_4b93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_63a9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_63a9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2134_c3_98d1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_63a9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_4b93_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_63a9_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2133_c7_63a9_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2133_c7_63a9_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2136_c7_4b93_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2133_c7_63a9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_bfd4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_bfd4_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_bfd4_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2136_c7_4b93_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2136_c7_4b93_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2141_c7_893e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2136_c7_4b93_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2136_c7_4b93_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2136_c7_4b93_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_893e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2136_c7_4b93_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2136_c7_4b93_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2136_c7_4b93_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_893e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2136_c7_4b93_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_4b93_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_4b93_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_893e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_4b93_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_4b93_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_4b93_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_893e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_4b93_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_4b93_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_4b93_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_893e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_4b93_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_4b93_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_4b93_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_893e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_4b93_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_4b93_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2139_c3_9dbb : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_4b93_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_893e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_4b93_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2136_c7_4b93_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2136_c7_4b93_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2141_c7_893e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2136_c7_4b93_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_bde3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_bde3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_bde3_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2141_c7_893e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2141_c7_893e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2144_c7_0074_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2141_c7_893e_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_893e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_893e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2144_c7_0074_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_893e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_893e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_893e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2144_c7_0074_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_893e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_893e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_893e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_0074_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_893e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_893e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_893e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_0074_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_893e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_893e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_893e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_0074_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_893e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_893e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_893e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_0074_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_893e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_893e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2142_c3_a489 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_893e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_0074_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_893e_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2141_c7_893e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2141_c7_893e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2144_c7_0074_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2141_c7_893e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_d41f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_d41f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_d41f_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2144_c7_0074_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2144_c7_0074_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2148_c7_0884_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2144_c7_0074_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2144_c7_0074_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2144_c7_0074_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2148_c7_0884_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2144_c7_0074_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2144_c7_0074_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2144_c7_0074_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2148_c7_0884_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2144_c7_0074_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_0074_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_0074_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2148_c7_0884_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_0074_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_0074_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_0074_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2148_c7_0884_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_0074_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_0074_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_0074_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2148_c7_0884_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_0074_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_0074_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_0074_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2148_c7_0884_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_0074_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_0074_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2146_c3_6ec0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_0074_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2148_c7_0884_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_0074_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2144_c7_0074_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2144_c7_0074_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2144_c7_0074_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2145_c3_84c9_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2145_c3_84c9_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2145_c3_84c9_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2148_c11_6d1f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2148_c11_6d1f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2148_c11_6d1f_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2148_c7_0884_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2148_c7_0884_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2151_c7_3de2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2148_c7_0884_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2148_c7_0884_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2148_c7_0884_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2151_c7_3de2_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2148_c7_0884_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2148_c7_0884_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2148_c7_0884_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2151_c7_3de2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2148_c7_0884_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2148_c7_0884_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2148_c7_0884_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_3de2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2148_c7_0884_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2148_c7_0884_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2148_c7_0884_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_3de2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2148_c7_0884_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2148_c7_0884_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2148_c7_0884_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_3de2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2148_c7_0884_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2148_c7_0884_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2148_c7_0884_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_3de2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2148_c7_0884_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2148_c7_0884_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2149_c3_3313 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2148_c7_0884_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_3de2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2148_c7_0884_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2151_c11_1990_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2151_c11_1990_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2151_c11_1990_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2151_c7_3de2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2151_c7_3de2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2156_c7_441b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2151_c7_3de2_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2151_c7_3de2_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2151_c7_3de2_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2156_c7_441b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2151_c7_3de2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2151_c7_3de2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2151_c7_3de2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2156_c7_441b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2151_c7_3de2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_3de2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_3de2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2156_c7_441b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_3de2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_3de2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_3de2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2156_c7_441b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_3de2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_3de2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_3de2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2156_c7_441b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_3de2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_3de2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_3de2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2156_c7_441b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_3de2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_3de2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2154_c3_f908 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_3de2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2156_c7_441b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_3de2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2156_c11_184e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2156_c11_184e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2156_c11_184e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2156_c7_441b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2156_c7_441b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2159_c7_3865_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2156_c7_441b_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2156_c7_441b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2156_c7_441b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2159_c7_3865_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2156_c7_441b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2156_c7_441b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2156_c7_441b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2159_c7_3865_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2156_c7_441b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2156_c7_441b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2156_c7_441b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_3865_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2156_c7_441b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2156_c7_441b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2156_c7_441b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_3865_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2156_c7_441b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2156_c7_441b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2156_c7_441b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_3865_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2156_c7_441b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2156_c7_441b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2156_c7_441b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_3865_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2156_c7_441b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2156_c7_441b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2157_c3_76d6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2156_c7_441b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_3865_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2156_c7_441b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2159_c11_814d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2159_c11_814d_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2159_c11_814d_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2159_c7_3865_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2159_c7_3865_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2159_c7_3865_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2159_c7_3865_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l2161_c3_1c84 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2159_c7_3865_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2159_c7_3865_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2159_c7_3865_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2159_c7_3865_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2168_c7_d4f6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2159_c7_3865_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_3865_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_3865_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2168_c7_d4f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_3865_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_3865_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_3865_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_3865_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_3865_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_3865_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2168_c7_d4f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_3865_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_3865_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_3865_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c7_d4f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_3865_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_3865_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2165_c3_57d5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_3865_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c7_d4f6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_3865_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2160_c3_c9c5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2160_c3_c9c5_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2160_c3_c9c5_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2161_c11_4fa4_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2161_c11_4fa4_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2161_c11_4fa4_return_output : unsigned(31 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2163_c30_84ac_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2163_c30_84ac_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2163_c30_84ac_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2163_c30_84ac_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2166_c21_1fb7_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2168_c11_5cfc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2168_c11_5cfc_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2168_c11_5cfc_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2168_c7_d4f6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2168_c7_d4f6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2168_c7_d4f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2168_c7_d4f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2168_c7_d4f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_1329_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2168_c7_d4f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2168_c7_d4f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2168_c7_d4f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_1329_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2168_c7_d4f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c7_d4f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c7_d4f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c7_d4f6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c7_d4f6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2170_c3_e9a2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c7_d4f6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2168_c7_d4f6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c7_d4f6_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2171_c31_ba49_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2171_c31_ba49_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2171_c21_80f7_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_cefc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_cefc_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_cefc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_1329_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_1329_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_1329_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_1329_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_1329_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_1329_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2168_l2136_l2133_l2156_l2128_l2151_l2148_l2144_l2141_DUPLICATE_27dd_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2136_l2159_l2133_l2156_l2128_l2151_l2148_l2144_l2141_DUPLICATE_f33c_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2168_l2136_l2133_l2156_l2128_l2151_l2148_l2144_l2173_l2141_DUPLICATE_dcc1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2168_l2136_l2133_l2156_l2128_l2151_l2148_l2144_l2141_DUPLICATE_2797_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2168_l2136_l2159_l2133_l2156_l2151_l2148_l2144_l2173_l2141_DUPLICATE_409e_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2160_l2152_l2137_l2145_DUPLICATE_8a58_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2138_l2153_DUPLICATE_055d_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2138_l2153_DUPLICATE_055d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l2178_l2124_DUPLICATE_6c99_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_bde3_right := to_unsigned(3, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_3865_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_13fa_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2165_c3_57d5 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_3865_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2165_c3_57d5;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2146_c3_6ec0 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_0074_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2146_c3_6ec0;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2157_c3_76d6 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2156_c7_441b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2157_c3_76d6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_cefc_right := to_unsigned(10, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2170_c3_e9a2 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c7_d4f6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2170_c3_e9a2;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_3865_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2130_c3_aabf := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c2_fabf_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2130_c3_aabf;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c7_d4f6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2156_c11_184e_right := to_unsigned(7, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l2163_c30_84ac_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_1329_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c2_fabf_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2142_c3_a489 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_893e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2142_c3_a489;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2151_c11_1990_right := to_unsigned(6, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2128_c1_1d50_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2159_c11_814d_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2154_c3_f908 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_3de2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2154_c3_f908;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2168_c11_5cfc_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_bfd4_right := to_unsigned(2, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l2163_c30_84ac_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2149_c3_3313 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2148_c7_0884_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2149_c3_3313;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c6_533c_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_1329_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2134_c3_98d1 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_63a9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2134_c3_98d1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2148_c11_6d1f_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_d41f_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2139_c3_9dbb := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_4b93_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2139_c3_9dbb;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2128_c1_1d50_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2163_c30_84ac_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2160_c3_c9c5_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2128_c2_fabf_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2133_c7_63a9_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2136_c7_4b93_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2141_c7_893e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2144_c7_0074_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2148_c7_0884_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2156_c7_441b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2159_c7_3865_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c6_533c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_13fa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_bfd4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_bde3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_d41f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2148_c11_6d1f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2151_c11_1990_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2156_c11_184e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2159_c11_814d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2168_c11_5cfc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_cefc_left := VAR_phase;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2161_c11_4fa4_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2145_c3_84c9_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2128_c2_fabf_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2133_c7_63a9_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2141_c7_893e_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2144_c7_0074_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2171_c31_ba49_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2128_c2_fabf_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2133_c7_63a9_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2136_c7_4b93_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_893e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2144_c7_0074_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2148_c7_0884_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2151_c7_3de2_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2156_c7_441b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2159_c7_3865_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2144_c11_d41f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2144_c11_d41f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_d41f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2144_c11_d41f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_d41f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_d41f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2144_c11_d41f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2151_c11_1990] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2151_c11_1990_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2151_c11_1990_left;
     BIN_OP_EQ_uxn_opcodes_h_l2151_c11_1990_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2151_c11_1990_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2151_c11_1990_return_output := BIN_OP_EQ_uxn_opcodes_h_l2151_c11_1990_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2160_l2152_l2137_l2145_DUPLICATE_8a58 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2160_l2152_l2137_l2145_DUPLICATE_8a58_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_SR_8[uxn_opcodes_h_l2171_c31_ba49] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2171_c31_ba49_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2171_c31_ba49_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2171_c31_ba49_return_output := CONST_SR_8_uxn_opcodes_h_l2171_c31_ba49_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2168_l2136_l2133_l2156_l2128_l2151_l2148_l2144_l2173_l2141_DUPLICATE_dcc1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2168_l2136_l2133_l2156_l2128_l2151_l2148_l2144_l2173_l2141_DUPLICATE_dcc1_return_output := result.is_stack_write;

     -- sp_relative_shift[uxn_opcodes_h_l2163_c30_84ac] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2163_c30_84ac_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2163_c30_84ac_ins;
     sp_relative_shift_uxn_opcodes_h_l2163_c30_84ac_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2163_c30_84ac_x;
     sp_relative_shift_uxn_opcodes_h_l2163_c30_84ac_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2163_c30_84ac_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2163_c30_84ac_return_output := sp_relative_shift_uxn_opcodes_h_l2163_c30_84ac_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2133_c11_13fa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2133_c11_13fa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_13fa_left;
     BIN_OP_EQ_uxn_opcodes_h_l2133_c11_13fa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_13fa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_13fa_return_output := BIN_OP_EQ_uxn_opcodes_h_l2133_c11_13fa_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2136_c11_bfd4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2136_c11_bfd4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_bfd4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2136_c11_bfd4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_bfd4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_bfd4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2136_c11_bfd4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2141_c11_bde3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2141_c11_bde3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_bde3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2141_c11_bde3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_bde3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_bde3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2141_c11_bde3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2159_c11_814d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2159_c11_814d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2159_c11_814d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2159_c11_814d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2159_c11_814d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2159_c11_814d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2159_c11_814d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2168_c11_5cfc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2168_c11_5cfc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2168_c11_5cfc_left;
     BIN_OP_EQ_uxn_opcodes_h_l2168_c11_5cfc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2168_c11_5cfc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2168_c11_5cfc_return_output := BIN_OP_EQ_uxn_opcodes_h_l2168_c11_5cfc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2173_c11_cefc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2173_c11_cefc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_cefc_left;
     BIN_OP_EQ_uxn_opcodes_h_l2173_c11_cefc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_cefc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_cefc_return_output := BIN_OP_EQ_uxn_opcodes_h_l2173_c11_cefc_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2168_l2136_l2159_l2133_l2156_l2151_l2148_l2144_l2173_l2141_DUPLICATE_409e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2168_l2136_l2159_l2133_l2156_l2151_l2148_l2144_l2173_l2141_DUPLICATE_409e_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2148_c11_6d1f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2148_c11_6d1f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2148_c11_6d1f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2148_c11_6d1f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2148_c11_6d1f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2148_c11_6d1f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2148_c11_6d1f_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2136_l2159_l2133_l2156_l2128_l2151_l2148_l2144_l2141_DUPLICATE_f33c LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2136_l2159_l2133_l2156_l2128_l2151_l2148_l2144_l2141_DUPLICATE_f33c_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2156_c11_184e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2156_c11_184e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2156_c11_184e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2156_c11_184e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2156_c11_184e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2156_c11_184e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2156_c11_184e_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2168_c7_d4f6] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2168_c7_d4f6_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2128_c6_533c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2128_c6_533c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c6_533c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2128_c6_533c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c6_533c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c6_533c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2128_c6_533c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2168_l2136_l2133_l2156_l2128_l2151_l2148_l2144_l2141_DUPLICATE_2797 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2168_l2136_l2133_l2156_l2128_l2151_l2148_l2144_l2141_DUPLICATE_2797_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2168_l2136_l2133_l2156_l2128_l2151_l2148_l2144_l2141_DUPLICATE_27dd LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2168_l2136_l2133_l2156_l2128_l2151_l2148_l2144_l2141_DUPLICATE_27dd_return_output := result.u8_value;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2128_c1_1d50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c6_533c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2128_c2_fabf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c6_533c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c2_fabf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c6_533c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2128_c2_fabf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c6_533c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2128_c2_fabf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c6_533c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c2_fabf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c6_533c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c2_fabf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c6_533c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c2_fabf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c6_533c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2128_c2_fabf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c6_533c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2128_c2_fabf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c6_533c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2133_c7_63a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_13fa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_63a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_13fa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_63a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_13fa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_63a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_13fa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_63a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_13fa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_63a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_13fa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c7_63a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_13fa_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2133_c7_63a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_13fa_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2133_c7_63a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_13fa_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2136_c7_4b93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_bfd4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_4b93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_bfd4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_4b93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_bfd4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_4b93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_bfd4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_4b93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_bfd4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_4b93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_bfd4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2136_c7_4b93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_bfd4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2136_c7_4b93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_bfd4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2136_c7_4b93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_bfd4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2141_c7_893e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_bde3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_893e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_bde3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_893e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_bde3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_893e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_bde3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_893e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_bde3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_893e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_bde3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_893e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_bde3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2141_c7_893e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_bde3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_893e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_bde3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2144_c7_0074_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_d41f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_0074_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_d41f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_0074_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_d41f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_0074_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_d41f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_0074_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_d41f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_0074_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_d41f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2144_c7_0074_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_d41f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2144_c7_0074_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_d41f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2144_c7_0074_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_d41f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2148_c7_0884_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2148_c11_6d1f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2148_c7_0884_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2148_c11_6d1f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2148_c7_0884_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2148_c11_6d1f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2148_c7_0884_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2148_c11_6d1f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2148_c7_0884_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2148_c11_6d1f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2148_c7_0884_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2148_c11_6d1f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2148_c7_0884_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2148_c11_6d1f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2148_c7_0884_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2148_c11_6d1f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2151_c7_3de2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2151_c11_1990_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_3de2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2151_c11_1990_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_3de2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2151_c11_1990_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_3de2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2151_c11_1990_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_3de2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2151_c11_1990_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_3de2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2151_c11_1990_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2151_c7_3de2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2151_c11_1990_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2151_c7_3de2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2151_c11_1990_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2156_c7_441b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2156_c11_184e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2156_c7_441b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2156_c11_184e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2156_c7_441b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2156_c11_184e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2156_c7_441b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2156_c11_184e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2156_c7_441b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2156_c11_184e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2156_c7_441b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2156_c11_184e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2156_c7_441b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2156_c11_184e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2156_c7_441b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2156_c11_184e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2159_c7_3865_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2159_c11_814d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_3865_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2159_c11_814d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_3865_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2159_c11_814d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_3865_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2159_c11_814d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_3865_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2159_c11_814d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_3865_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2159_c11_814d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2159_c7_3865_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2159_c11_814d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2159_c7_3865_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2159_c11_814d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2168_c7_d4f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2168_c11_5cfc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c7_d4f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2168_c11_5cfc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2168_c7_d4f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2168_c11_5cfc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c7_d4f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2168_c11_5cfc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2168_c7_d4f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2168_c11_5cfc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_1329_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_cefc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_1329_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_cefc_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2145_c3_84c9_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2160_l2152_l2137_l2145_DUPLICATE_8a58_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2160_c3_c9c5_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2160_l2152_l2137_l2145_DUPLICATE_8a58_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2138_l2153_DUPLICATE_055d_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2160_l2152_l2137_l2145_DUPLICATE_8a58_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c2_fabf_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2136_l2159_l2133_l2156_l2128_l2151_l2148_l2144_l2141_DUPLICATE_f33c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_63a9_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2136_l2159_l2133_l2156_l2128_l2151_l2148_l2144_l2141_DUPLICATE_f33c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_4b93_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2136_l2159_l2133_l2156_l2128_l2151_l2148_l2144_l2141_DUPLICATE_f33c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_893e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2136_l2159_l2133_l2156_l2128_l2151_l2148_l2144_l2141_DUPLICATE_f33c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_0074_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2136_l2159_l2133_l2156_l2128_l2151_l2148_l2144_l2141_DUPLICATE_f33c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2148_c7_0884_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2136_l2159_l2133_l2156_l2128_l2151_l2148_l2144_l2141_DUPLICATE_f33c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_3de2_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2136_l2159_l2133_l2156_l2128_l2151_l2148_l2144_l2141_DUPLICATE_f33c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2156_c7_441b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2136_l2159_l2133_l2156_l2128_l2151_l2148_l2144_l2141_DUPLICATE_f33c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_3865_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2136_l2159_l2133_l2156_l2128_l2151_l2148_l2144_l2141_DUPLICATE_f33c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_63a9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2168_l2136_l2159_l2133_l2156_l2151_l2148_l2144_l2173_l2141_DUPLICATE_409e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_4b93_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2168_l2136_l2159_l2133_l2156_l2151_l2148_l2144_l2173_l2141_DUPLICATE_409e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_893e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2168_l2136_l2159_l2133_l2156_l2151_l2148_l2144_l2173_l2141_DUPLICATE_409e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_0074_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2168_l2136_l2159_l2133_l2156_l2151_l2148_l2144_l2173_l2141_DUPLICATE_409e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2148_c7_0884_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2168_l2136_l2159_l2133_l2156_l2151_l2148_l2144_l2173_l2141_DUPLICATE_409e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_3de2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2168_l2136_l2159_l2133_l2156_l2151_l2148_l2144_l2173_l2141_DUPLICATE_409e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2156_c7_441b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2168_l2136_l2159_l2133_l2156_l2151_l2148_l2144_l2173_l2141_DUPLICATE_409e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_3865_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2168_l2136_l2159_l2133_l2156_l2151_l2148_l2144_l2173_l2141_DUPLICATE_409e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2168_c7_d4f6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2168_l2136_l2159_l2133_l2156_l2151_l2148_l2144_l2173_l2141_DUPLICATE_409e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_1329_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2168_l2136_l2159_l2133_l2156_l2151_l2148_l2144_l2173_l2141_DUPLICATE_409e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2128_c2_fabf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2168_l2136_l2133_l2156_l2128_l2151_l2148_l2144_l2141_DUPLICATE_2797_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_63a9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2168_l2136_l2133_l2156_l2128_l2151_l2148_l2144_l2141_DUPLICATE_2797_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_4b93_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2168_l2136_l2133_l2156_l2128_l2151_l2148_l2144_l2141_DUPLICATE_2797_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_893e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2168_l2136_l2133_l2156_l2128_l2151_l2148_l2144_l2141_DUPLICATE_2797_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_0074_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2168_l2136_l2133_l2156_l2128_l2151_l2148_l2144_l2141_DUPLICATE_2797_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2148_c7_0884_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2168_l2136_l2133_l2156_l2128_l2151_l2148_l2144_l2141_DUPLICATE_2797_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_3de2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2168_l2136_l2133_l2156_l2128_l2151_l2148_l2144_l2141_DUPLICATE_2797_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2156_c7_441b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2168_l2136_l2133_l2156_l2128_l2151_l2148_l2144_l2141_DUPLICATE_2797_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c7_d4f6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2168_l2136_l2133_l2156_l2128_l2151_l2148_l2144_l2141_DUPLICATE_2797_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2128_c2_fabf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2168_l2136_l2133_l2156_l2128_l2151_l2148_l2144_l2173_l2141_DUPLICATE_dcc1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_63a9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2168_l2136_l2133_l2156_l2128_l2151_l2148_l2144_l2173_l2141_DUPLICATE_dcc1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_4b93_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2168_l2136_l2133_l2156_l2128_l2151_l2148_l2144_l2173_l2141_DUPLICATE_dcc1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_893e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2168_l2136_l2133_l2156_l2128_l2151_l2148_l2144_l2173_l2141_DUPLICATE_dcc1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_0074_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2168_l2136_l2133_l2156_l2128_l2151_l2148_l2144_l2173_l2141_DUPLICATE_dcc1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2148_c7_0884_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2168_l2136_l2133_l2156_l2128_l2151_l2148_l2144_l2173_l2141_DUPLICATE_dcc1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_3de2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2168_l2136_l2133_l2156_l2128_l2151_l2148_l2144_l2173_l2141_DUPLICATE_dcc1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2156_c7_441b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2168_l2136_l2133_l2156_l2128_l2151_l2148_l2144_l2173_l2141_DUPLICATE_dcc1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2168_c7_d4f6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2168_l2136_l2133_l2156_l2128_l2151_l2148_l2144_l2173_l2141_DUPLICATE_dcc1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_1329_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2168_l2136_l2133_l2156_l2128_l2151_l2148_l2144_l2173_l2141_DUPLICATE_dcc1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c2_fabf_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2168_l2136_l2133_l2156_l2128_l2151_l2148_l2144_l2141_DUPLICATE_27dd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c7_63a9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2168_l2136_l2133_l2156_l2128_l2151_l2148_l2144_l2141_DUPLICATE_27dd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2136_c7_4b93_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2168_l2136_l2133_l2156_l2128_l2151_l2148_l2144_l2141_DUPLICATE_27dd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_893e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2168_l2136_l2133_l2156_l2128_l2151_l2148_l2144_l2141_DUPLICATE_27dd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2144_c7_0074_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2168_l2136_l2133_l2156_l2128_l2151_l2148_l2144_l2141_DUPLICATE_27dd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2148_c7_0884_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2168_l2136_l2133_l2156_l2128_l2151_l2148_l2144_l2141_DUPLICATE_27dd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2151_c7_3de2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2168_l2136_l2133_l2156_l2128_l2151_l2148_l2144_l2141_DUPLICATE_27dd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2156_c7_441b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2168_l2136_l2133_l2156_l2128_l2151_l2148_l2144_l2141_DUPLICATE_27dd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2168_c7_d4f6_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2168_l2136_l2133_l2156_l2128_l2151_l2148_l2144_l2141_DUPLICATE_27dd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c7_d4f6_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2168_c7_d4f6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_3865_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2163_c30_84ac_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2173_c7_1329] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_1329_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_1329_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_1329_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_1329_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_1329_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_1329_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_1329_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_1329_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2168_c7_d4f6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c7_d4f6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c7_d4f6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c7_d4f6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c7_d4f6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c7_d4f6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c7_d4f6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c7_d4f6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c7_d4f6_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2128_c1_1d50] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2128_c1_1d50_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2128_c1_1d50_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2128_c1_1d50_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2128_c1_1d50_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2128_c1_1d50_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2128_c1_1d50_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2128_c1_1d50_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2128_c1_1d50_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2173_c7_1329] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_1329_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_1329_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_1329_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_1329_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_1329_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_1329_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_1329_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_1329_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2168_c7_d4f6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c7_d4f6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c7_d4f6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c7_d4f6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c7_d4f6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c7_d4f6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c7_d4f6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c7_d4f6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c7_d4f6_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2160_c3_c9c5] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2160_c3_c9c5_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2160_c3_c9c5_left;
     BIN_OP_OR_uxn_opcodes_h_l2160_c3_c9c5_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2160_c3_c9c5_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2160_c3_c9c5_return_output := BIN_OP_OR_uxn_opcodes_h_l2160_c3_c9c5_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2171_c21_80f7] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2171_c21_80f7_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2171_c31_ba49_return_output);

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2159_c7_3865] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_3865_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_3865_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_3865_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_3865_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_3865_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_3865_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_3865_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_3865_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2138_l2153_DUPLICATE_055d LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2138_l2153_DUPLICATE_055d_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2138_l2153_DUPLICATE_055d_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2138_l2153_DUPLICATE_055d_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2138_l2153_DUPLICATE_055d_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2145_c3_84c9] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2145_c3_84c9_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2145_c3_84c9_left;
     BIN_OP_OR_uxn_opcodes_h_l2145_c3_84c9_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2145_c3_84c9_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2145_c3_84c9_return_output := BIN_OP_OR_uxn_opcodes_h_l2145_c3_84c9_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2144_c7_0074_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2145_c3_84c9_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2161_c11_4fa4_right := VAR_BIN_OP_OR_uxn_opcodes_h_l2160_c3_c9c5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2159_c7_3865_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2160_c3_c9c5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2168_c7_d4f6_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2171_c21_80f7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2151_c7_3de2_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2138_l2153_DUPLICATE_055d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2136_c7_4b93_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2138_l2153_DUPLICATE_055d_return_output;
     VAR_printf_uxn_opcodes_h_l2129_c3_c32a_uxn_opcodes_h_l2129_c3_c32a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2128_c1_1d50_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2168_c7_d4f6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_1329_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_3865_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c7_d4f6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2168_c7_d4f6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_1329_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2156_c7_441b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_3865_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_3865_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c7_d4f6_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2168_c7_d4f6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2168_c7_d4f6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2168_c7_d4f6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2168_c7_d4f6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2168_c7_d4f6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2168_c7_d4f6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2168_c7_d4f6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2168_c7_d4f6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2168_c7_d4f6_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l2161_c11_4fa4] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2161_c11_4fa4_left <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2161_c11_4fa4_left;
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2161_c11_4fa4_right <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2161_c11_4fa4_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2161_c11_4fa4_return_output := BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2161_c11_4fa4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2159_c7_3865] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_3865_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_3865_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_3865_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_3865_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_3865_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_3865_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_3865_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_3865_return_output;

     -- t16_MUX[uxn_opcodes_h_l2144_c7_0074] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2144_c7_0074_cond <= VAR_t16_MUX_uxn_opcodes_h_l2144_c7_0074_cond;
     t16_MUX_uxn_opcodes_h_l2144_c7_0074_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2144_c7_0074_iftrue;
     t16_MUX_uxn_opcodes_h_l2144_c7_0074_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2144_c7_0074_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2144_c7_0074_return_output := t16_MUX_uxn_opcodes_h_l2144_c7_0074_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2168_c7_d4f6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2168_c7_d4f6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2168_c7_d4f6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2168_c7_d4f6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2168_c7_d4f6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2168_c7_d4f6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2168_c7_d4f6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2168_c7_d4f6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2168_c7_d4f6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2159_c7_3865] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_3865_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_3865_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_3865_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_3865_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_3865_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_3865_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_3865_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_3865_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2168_c7_d4f6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2168_c7_d4f6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2168_c7_d4f6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2168_c7_d4f6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2168_c7_d4f6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2168_c7_d4f6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2168_c7_d4f6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2168_c7_d4f6_return_output := result_u8_value_MUX_uxn_opcodes_h_l2168_c7_d4f6_return_output;

     -- printf_uxn_opcodes_h_l2129_c3_c32a[uxn_opcodes_h_l2129_c3_c32a] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2129_c3_c32a_uxn_opcodes_h_l2129_c3_c32a_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2129_c3_c32a_uxn_opcodes_h_l2129_c3_c32a_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2156_c7_441b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2156_c7_441b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2156_c7_441b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2156_c7_441b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2156_c7_441b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2156_c7_441b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2156_c7_441b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2156_c7_441b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2156_c7_441b_return_output;

     -- n16_MUX[uxn_opcodes_h_l2159_c7_3865] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2159_c7_3865_cond <= VAR_n16_MUX_uxn_opcodes_h_l2159_c7_3865_cond;
     n16_MUX_uxn_opcodes_h_l2159_c7_3865_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2159_c7_3865_iftrue;
     n16_MUX_uxn_opcodes_h_l2159_c7_3865_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2159_c7_3865_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2159_c7_3865_return_output := n16_MUX_uxn_opcodes_h_l2159_c7_3865_return_output;

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l2161_c3_1c84 := resize(VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2161_c11_4fa4_return_output, 16);
     VAR_n16_MUX_uxn_opcodes_h_l2156_c7_441b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2159_c7_3865_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_3865_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2168_c7_d4f6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2156_c7_441b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_3865_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_3865_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2168_c7_d4f6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_3de2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2156_c7_441b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2156_c7_441b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_3865_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2159_c7_3865_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2168_c7_d4f6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2141_c7_893e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2144_c7_0074_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2159_c7_3865_iftrue := VAR_tmp16_uxn_opcodes_h_l2161_c3_1c84;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2159_c7_3865] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_3865_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_3865_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_3865_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_3865_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_3865_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_3865_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_3865_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_3865_return_output;

     -- t16_MUX[uxn_opcodes_h_l2141_c7_893e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2141_c7_893e_cond <= VAR_t16_MUX_uxn_opcodes_h_l2141_c7_893e_cond;
     t16_MUX_uxn_opcodes_h_l2141_c7_893e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2141_c7_893e_iftrue;
     t16_MUX_uxn_opcodes_h_l2141_c7_893e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2141_c7_893e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2141_c7_893e_return_output := t16_MUX_uxn_opcodes_h_l2141_c7_893e_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2166_c21_1fb7] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2166_c21_1fb7_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_tmp16_uxn_opcodes_h_l2161_c3_1c84);

     -- n16_MUX[uxn_opcodes_h_l2156_c7_441b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2156_c7_441b_cond <= VAR_n16_MUX_uxn_opcodes_h_l2156_c7_441b_cond;
     n16_MUX_uxn_opcodes_h_l2156_c7_441b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2156_c7_441b_iftrue;
     n16_MUX_uxn_opcodes_h_l2156_c7_441b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2156_c7_441b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2156_c7_441b_return_output := n16_MUX_uxn_opcodes_h_l2156_c7_441b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2156_c7_441b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2156_c7_441b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2156_c7_441b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2156_c7_441b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2156_c7_441b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2156_c7_441b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2156_c7_441b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2156_c7_441b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2156_c7_441b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2156_c7_441b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2156_c7_441b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2156_c7_441b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2156_c7_441b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2156_c7_441b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2156_c7_441b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2156_c7_441b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2156_c7_441b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2156_c7_441b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2151_c7_3de2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_3de2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_3de2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_3de2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_3de2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_3de2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_3de2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_3de2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_3de2_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2159_c7_3865] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2159_c7_3865_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2159_c7_3865_cond;
     tmp16_MUX_uxn_opcodes_h_l2159_c7_3865_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2159_c7_3865_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2159_c7_3865_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2159_c7_3865_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2159_c7_3865_return_output := tmp16_MUX_uxn_opcodes_h_l2159_c7_3865_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2159_c7_3865] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_3865_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_3865_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_3865_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_3865_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_3865_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_3865_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_3865_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_3865_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2159_c7_3865_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2166_c21_1fb7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2151_c7_3de2_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2156_c7_441b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2156_c7_441b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_3865_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_3de2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2156_c7_441b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2156_c7_441b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_3865_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2148_c7_0884_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_3de2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_3de2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2156_c7_441b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2136_c7_4b93_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2141_c7_893e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2156_c7_441b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2159_c7_3865_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2151_c7_3de2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_3de2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_3de2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_3de2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_3de2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_3de2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_3de2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_3de2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_3de2_return_output;

     -- t16_MUX[uxn_opcodes_h_l2136_c7_4b93] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2136_c7_4b93_cond <= VAR_t16_MUX_uxn_opcodes_h_l2136_c7_4b93_cond;
     t16_MUX_uxn_opcodes_h_l2136_c7_4b93_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2136_c7_4b93_iftrue;
     t16_MUX_uxn_opcodes_h_l2136_c7_4b93_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2136_c7_4b93_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2136_c7_4b93_return_output := t16_MUX_uxn_opcodes_h_l2136_c7_4b93_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2156_c7_441b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2156_c7_441b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2156_c7_441b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2156_c7_441b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2156_c7_441b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2156_c7_441b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2156_c7_441b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2156_c7_441b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2156_c7_441b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2151_c7_3de2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_3de2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_3de2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_3de2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_3de2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_3de2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_3de2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_3de2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_3de2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2148_c7_0884] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2148_c7_0884_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2148_c7_0884_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2148_c7_0884_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2148_c7_0884_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2148_c7_0884_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2148_c7_0884_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2148_c7_0884_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2148_c7_0884_return_output;

     -- n16_MUX[uxn_opcodes_h_l2151_c7_3de2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2151_c7_3de2_cond <= VAR_n16_MUX_uxn_opcodes_h_l2151_c7_3de2_cond;
     n16_MUX_uxn_opcodes_h_l2151_c7_3de2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2151_c7_3de2_iftrue;
     n16_MUX_uxn_opcodes_h_l2151_c7_3de2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2151_c7_3de2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2151_c7_3de2_return_output := n16_MUX_uxn_opcodes_h_l2151_c7_3de2_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2156_c7_441b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2156_c7_441b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2156_c7_441b_cond;
     tmp16_MUX_uxn_opcodes_h_l2156_c7_441b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2156_c7_441b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2156_c7_441b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2156_c7_441b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2156_c7_441b_return_output := tmp16_MUX_uxn_opcodes_h_l2156_c7_441b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2156_c7_441b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2156_c7_441b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2156_c7_441b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2156_c7_441b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2156_c7_441b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2156_c7_441b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2156_c7_441b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2156_c7_441b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2156_c7_441b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2159_c7_3865] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2159_c7_3865_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2159_c7_3865_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2159_c7_3865_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2159_c7_3865_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2159_c7_3865_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2159_c7_3865_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2159_c7_3865_return_output := result_u8_value_MUX_uxn_opcodes_h_l2159_c7_3865_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2148_c7_0884_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2151_c7_3de2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_3de2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2156_c7_441b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2148_c7_0884_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_3de2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_3de2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2156_c7_441b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_0074_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2148_c7_0884_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2148_c7_0884_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_3de2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2156_c7_441b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2159_c7_3865_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2133_c7_63a9_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2136_c7_4b93_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2151_c7_3de2_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2156_c7_441b_return_output;
     -- t16_MUX[uxn_opcodes_h_l2133_c7_63a9] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2133_c7_63a9_cond <= VAR_t16_MUX_uxn_opcodes_h_l2133_c7_63a9_cond;
     t16_MUX_uxn_opcodes_h_l2133_c7_63a9_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2133_c7_63a9_iftrue;
     t16_MUX_uxn_opcodes_h_l2133_c7_63a9_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2133_c7_63a9_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2133_c7_63a9_return_output := t16_MUX_uxn_opcodes_h_l2133_c7_63a9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2156_c7_441b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2156_c7_441b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2156_c7_441b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2156_c7_441b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2156_c7_441b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2156_c7_441b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2156_c7_441b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2156_c7_441b_return_output := result_u8_value_MUX_uxn_opcodes_h_l2156_c7_441b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2151_c7_3de2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_3de2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_3de2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_3de2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_3de2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_3de2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_3de2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_3de2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_3de2_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2151_c7_3de2] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2151_c7_3de2_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2151_c7_3de2_cond;
     tmp16_MUX_uxn_opcodes_h_l2151_c7_3de2_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2151_c7_3de2_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2151_c7_3de2_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2151_c7_3de2_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2151_c7_3de2_return_output := tmp16_MUX_uxn_opcodes_h_l2151_c7_3de2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2144_c7_0074] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_0074_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_0074_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_0074_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_0074_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_0074_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_0074_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_0074_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_0074_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2148_c7_0884] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2148_c7_0884_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2148_c7_0884_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2148_c7_0884_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2148_c7_0884_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2148_c7_0884_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2148_c7_0884_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2148_c7_0884_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2148_c7_0884_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2151_c7_3de2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_3de2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_3de2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_3de2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_3de2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_3de2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_3de2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_3de2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_3de2_return_output;

     -- n16_MUX[uxn_opcodes_h_l2148_c7_0884] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2148_c7_0884_cond <= VAR_n16_MUX_uxn_opcodes_h_l2148_c7_0884_cond;
     n16_MUX_uxn_opcodes_h_l2148_c7_0884_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2148_c7_0884_iftrue;
     n16_MUX_uxn_opcodes_h_l2148_c7_0884_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2148_c7_0884_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2148_c7_0884_return_output := n16_MUX_uxn_opcodes_h_l2148_c7_0884_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2148_c7_0884] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2148_c7_0884_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2148_c7_0884_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2148_c7_0884_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2148_c7_0884_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2148_c7_0884_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2148_c7_0884_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2148_c7_0884_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2148_c7_0884_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2144_c7_0074_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2148_c7_0884_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2148_c7_0884_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_3de2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_0074_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2148_c7_0884_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2148_c7_0884_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_3de2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_893e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_0074_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_0074_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2148_c7_0884_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2151_c7_3de2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2156_c7_441b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2128_c2_fabf_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2133_c7_63a9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2148_c7_0884_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2151_c7_3de2_return_output;
     -- t16_MUX[uxn_opcodes_h_l2128_c2_fabf] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2128_c2_fabf_cond <= VAR_t16_MUX_uxn_opcodes_h_l2128_c2_fabf_cond;
     t16_MUX_uxn_opcodes_h_l2128_c2_fabf_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2128_c2_fabf_iftrue;
     t16_MUX_uxn_opcodes_h_l2128_c2_fabf_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2128_c2_fabf_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2128_c2_fabf_return_output := t16_MUX_uxn_opcodes_h_l2128_c2_fabf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2148_c7_0884] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2148_c7_0884_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2148_c7_0884_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2148_c7_0884_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2148_c7_0884_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2148_c7_0884_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2148_c7_0884_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2148_c7_0884_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2148_c7_0884_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2144_c7_0074] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_0074_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_0074_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_0074_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_0074_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_0074_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_0074_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_0074_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_0074_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2144_c7_0074] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_0074_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_0074_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_0074_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_0074_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_0074_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_0074_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_0074_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_0074_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2151_c7_3de2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2151_c7_3de2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2151_c7_3de2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2151_c7_3de2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2151_c7_3de2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2151_c7_3de2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2151_c7_3de2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2151_c7_3de2_return_output := result_u8_value_MUX_uxn_opcodes_h_l2151_c7_3de2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2148_c7_0884] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2148_c7_0884_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2148_c7_0884_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2148_c7_0884_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2148_c7_0884_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2148_c7_0884_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2148_c7_0884_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2148_c7_0884_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2148_c7_0884_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2141_c7_893e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_893e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_893e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_893e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_893e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_893e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_893e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_893e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_893e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2148_c7_0884] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2148_c7_0884_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2148_c7_0884_cond;
     tmp16_MUX_uxn_opcodes_h_l2148_c7_0884_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2148_c7_0884_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2148_c7_0884_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2148_c7_0884_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2148_c7_0884_return_output := tmp16_MUX_uxn_opcodes_h_l2148_c7_0884_return_output;

     -- n16_MUX[uxn_opcodes_h_l2144_c7_0074] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2144_c7_0074_cond <= VAR_n16_MUX_uxn_opcodes_h_l2144_c7_0074_cond;
     n16_MUX_uxn_opcodes_h_l2144_c7_0074_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2144_c7_0074_iftrue;
     n16_MUX_uxn_opcodes_h_l2144_c7_0074_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2144_c7_0074_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2144_c7_0074_return_output := n16_MUX_uxn_opcodes_h_l2144_c7_0074_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2141_c7_893e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2144_c7_0074_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_0074_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2148_c7_0884_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_893e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_0074_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_0074_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2148_c7_0884_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_4b93_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_893e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_893e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_0074_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2148_c7_0884_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2151_c7_3de2_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2128_c2_fabf_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2144_c7_0074_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2148_c7_0884_return_output;
     -- n16_MUX[uxn_opcodes_h_l2141_c7_893e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2141_c7_893e_cond <= VAR_n16_MUX_uxn_opcodes_h_l2141_c7_893e_cond;
     n16_MUX_uxn_opcodes_h_l2141_c7_893e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2141_c7_893e_iftrue;
     n16_MUX_uxn_opcodes_h_l2141_c7_893e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2141_c7_893e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2141_c7_893e_return_output := n16_MUX_uxn_opcodes_h_l2141_c7_893e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2141_c7_893e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_893e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_893e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_893e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_893e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_893e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_893e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_893e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_893e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2141_c7_893e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_893e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_893e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_893e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_893e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_893e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_893e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_893e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_893e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2144_c7_0074] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_0074_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_0074_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_0074_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_0074_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_0074_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_0074_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_0074_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_0074_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2148_c7_0884] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2148_c7_0884_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2148_c7_0884_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2148_c7_0884_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2148_c7_0884_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2148_c7_0884_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2148_c7_0884_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2148_c7_0884_return_output := result_u8_value_MUX_uxn_opcodes_h_l2148_c7_0884_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2144_c7_0074] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_0074_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_0074_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_0074_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_0074_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_0074_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_0074_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_0074_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_0074_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2144_c7_0074] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2144_c7_0074_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2144_c7_0074_cond;
     tmp16_MUX_uxn_opcodes_h_l2144_c7_0074_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2144_c7_0074_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2144_c7_0074_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2144_c7_0074_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2144_c7_0074_return_output := tmp16_MUX_uxn_opcodes_h_l2144_c7_0074_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2136_c7_4b93] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_4b93_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_4b93_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_4b93_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_4b93_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_4b93_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_4b93_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_4b93_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_4b93_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l2136_c7_4b93_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2141_c7_893e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_893e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_0074_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_4b93_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_893e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_893e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_0074_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_63a9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_4b93_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_4b93_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_893e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2144_c7_0074_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2148_c7_0884_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_893e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2144_c7_0074_return_output;
     -- n16_MUX[uxn_opcodes_h_l2136_c7_4b93] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2136_c7_4b93_cond <= VAR_n16_MUX_uxn_opcodes_h_l2136_c7_4b93_cond;
     n16_MUX_uxn_opcodes_h_l2136_c7_4b93_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2136_c7_4b93_iftrue;
     n16_MUX_uxn_opcodes_h_l2136_c7_4b93_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2136_c7_4b93_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2136_c7_4b93_return_output := n16_MUX_uxn_opcodes_h_l2136_c7_4b93_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2144_c7_0074] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2144_c7_0074_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2144_c7_0074_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2144_c7_0074_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2144_c7_0074_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2144_c7_0074_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2144_c7_0074_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2144_c7_0074_return_output := result_u8_value_MUX_uxn_opcodes_h_l2144_c7_0074_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2136_c7_4b93] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_4b93_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_4b93_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_4b93_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_4b93_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_4b93_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_4b93_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_4b93_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_4b93_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2141_c7_893e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2141_c7_893e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_893e_cond;
     tmp16_MUX_uxn_opcodes_h_l2141_c7_893e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_893e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2141_c7_893e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_893e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_893e_return_output := tmp16_MUX_uxn_opcodes_h_l2141_c7_893e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2136_c7_4b93] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_4b93_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_4b93_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_4b93_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_4b93_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_4b93_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_4b93_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_4b93_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_4b93_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2141_c7_893e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_893e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_893e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_893e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_893e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_893e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_893e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_893e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_893e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2133_c7_63a9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_63a9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_63a9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_63a9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_63a9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_63a9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_63a9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_63a9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_63a9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2141_c7_893e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_893e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_893e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_893e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_893e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_893e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_893e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_893e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_893e_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l2133_c7_63a9_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2136_c7_4b93_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_4b93_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_893e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_63a9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_4b93_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_4b93_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_893e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c2_fabf_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_63a9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_63a9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_4b93_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_893e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2144_c7_0074_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2136_c7_4b93_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_893e_return_output;
     -- n16_MUX[uxn_opcodes_h_l2133_c7_63a9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2133_c7_63a9_cond <= VAR_n16_MUX_uxn_opcodes_h_l2133_c7_63a9_cond;
     n16_MUX_uxn_opcodes_h_l2133_c7_63a9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2133_c7_63a9_iftrue;
     n16_MUX_uxn_opcodes_h_l2133_c7_63a9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2133_c7_63a9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2133_c7_63a9_return_output := n16_MUX_uxn_opcodes_h_l2133_c7_63a9_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2136_c7_4b93] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2136_c7_4b93_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2136_c7_4b93_cond;
     tmp16_MUX_uxn_opcodes_h_l2136_c7_4b93_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2136_c7_4b93_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2136_c7_4b93_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2136_c7_4b93_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2136_c7_4b93_return_output := tmp16_MUX_uxn_opcodes_h_l2136_c7_4b93_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2128_c2_fabf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c2_fabf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c2_fabf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c2_fabf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c2_fabf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c2_fabf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c2_fabf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c2_fabf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c2_fabf_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2141_c7_893e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2141_c7_893e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_893e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2141_c7_893e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_893e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2141_c7_893e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_893e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_893e_return_output := result_u8_value_MUX_uxn_opcodes_h_l2141_c7_893e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2136_c7_4b93] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_4b93_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_4b93_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_4b93_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_4b93_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_4b93_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_4b93_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_4b93_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_4b93_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2133_c7_63a9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_63a9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_63a9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_63a9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_63a9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_63a9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_63a9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_63a9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_63a9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2136_c7_4b93] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_4b93_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_4b93_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_4b93_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_4b93_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_4b93_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_4b93_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_4b93_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_4b93_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2133_c7_63a9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_63a9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_63a9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_63a9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_63a9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_63a9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_63a9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_63a9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_63a9_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l2128_c2_fabf_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2133_c7_63a9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_63a9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_4b93_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2128_c2_fabf_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_63a9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_63a9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_4b93_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c2_fabf_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_63a9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2136_c7_4b93_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_893e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2133_c7_63a9_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2136_c7_4b93_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2133_c7_63a9] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2133_c7_63a9_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2133_c7_63a9_cond;
     tmp16_MUX_uxn_opcodes_h_l2133_c7_63a9_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2133_c7_63a9_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2133_c7_63a9_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2133_c7_63a9_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2133_c7_63a9_return_output := tmp16_MUX_uxn_opcodes_h_l2133_c7_63a9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2133_c7_63a9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_63a9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_63a9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_63a9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_63a9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_63a9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_63a9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_63a9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_63a9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2133_c7_63a9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_63a9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_63a9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_63a9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_63a9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_63a9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_63a9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_63a9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_63a9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2128_c2_fabf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c2_fabf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c2_fabf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c2_fabf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c2_fabf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c2_fabf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c2_fabf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c2_fabf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c2_fabf_return_output;

     -- n16_MUX[uxn_opcodes_h_l2128_c2_fabf] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2128_c2_fabf_cond <= VAR_n16_MUX_uxn_opcodes_h_l2128_c2_fabf_cond;
     n16_MUX_uxn_opcodes_h_l2128_c2_fabf_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2128_c2_fabf_iftrue;
     n16_MUX_uxn_opcodes_h_l2128_c2_fabf_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2128_c2_fabf_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2128_c2_fabf_return_output := n16_MUX_uxn_opcodes_h_l2128_c2_fabf_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2128_c2_fabf] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2128_c2_fabf_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2128_c2_fabf_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2128_c2_fabf_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2128_c2_fabf_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2128_c2_fabf_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2128_c2_fabf_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2128_c2_fabf_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2128_c2_fabf_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2136_c7_4b93] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2136_c7_4b93_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2136_c7_4b93_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2136_c7_4b93_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2136_c7_4b93_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2136_c7_4b93_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2136_c7_4b93_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2136_c7_4b93_return_output := result_u8_value_MUX_uxn_opcodes_h_l2136_c7_4b93_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2128_c2_fabf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c2_fabf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_63a9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2128_c2_fabf_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_63a9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c7_63a9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2136_c7_4b93_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2128_c2_fabf_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2133_c7_63a9_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2128_c2_fabf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2128_c2_fabf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c2_fabf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2128_c2_fabf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c2_fabf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2128_c2_fabf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c2_fabf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c2_fabf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2128_c2_fabf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2128_c2_fabf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2128_c2_fabf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2128_c2_fabf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2128_c2_fabf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2128_c2_fabf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2128_c2_fabf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2128_c2_fabf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2128_c2_fabf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2128_c2_fabf_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2133_c7_63a9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2133_c7_63a9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c7_63a9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2133_c7_63a9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c7_63a9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2133_c7_63a9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c7_63a9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c7_63a9_return_output := result_u8_value_MUX_uxn_opcodes_h_l2133_c7_63a9_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2128_c2_fabf] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2128_c2_fabf_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2128_c2_fabf_cond;
     tmp16_MUX_uxn_opcodes_h_l2128_c2_fabf_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2128_c2_fabf_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2128_c2_fabf_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2128_c2_fabf_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2128_c2_fabf_return_output := tmp16_MUX_uxn_opcodes_h_l2128_c2_fabf_return_output;

     -- Submodule level 12
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c2_fabf_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c7_63a9_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2128_c2_fabf_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2128_c2_fabf] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2128_c2_fabf_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c2_fabf_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2128_c2_fabf_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c2_fabf_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2128_c2_fabf_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c2_fabf_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c2_fabf_return_output := result_u8_value_MUX_uxn_opcodes_h_l2128_c2_fabf_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l2178_l2124_DUPLICATE_6c99 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l2178_l2124_DUPLICATE_6c99_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_25e8(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c2_fabf_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c2_fabf_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c2_fabf_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2128_c2_fabf_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2128_c2_fabf_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c2_fabf_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l2178_l2124_DUPLICATE_6c99_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l2178_l2124_DUPLICATE_6c99_return_output;
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
