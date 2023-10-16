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
-- BIN_OP_EQ[uxn_opcodes_h_l2128_c6_894e]
signal BIN_OP_EQ_uxn_opcodes_h_l2128_c6_894e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2128_c6_894e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2128_c6_894e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2128_c1_2978]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2128_c1_2978_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2128_c1_2978_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2128_c1_2978_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2128_c1_2978_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2128_c2_d461]
signal n16_MUX_uxn_opcodes_h_l2128_c2_d461_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2128_c2_d461_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2128_c2_d461_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2128_c2_d461_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2128_c2_d461]
signal tmp16_MUX_uxn_opcodes_h_l2128_c2_d461_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2128_c2_d461_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2128_c2_d461_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2128_c2_d461_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2128_c2_d461]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c2_d461_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c2_d461_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c2_d461_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c2_d461_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2128_c2_d461]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c2_d461_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c2_d461_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c2_d461_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c2_d461_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2128_c2_d461]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2128_c2_d461_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2128_c2_d461_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2128_c2_d461_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2128_c2_d461_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2128_c2_d461]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2128_c2_d461_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2128_c2_d461_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2128_c2_d461_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2128_c2_d461_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2128_c2_d461]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2128_c2_d461_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2128_c2_d461_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2128_c2_d461_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2128_c2_d461_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2128_c2_d461]
signal result_u8_value_MUX_uxn_opcodes_h_l2128_c2_d461_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2128_c2_d461_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2128_c2_d461_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2128_c2_d461_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2128_c2_d461]
signal t16_MUX_uxn_opcodes_h_l2128_c2_d461_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2128_c2_d461_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2128_c2_d461_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2128_c2_d461_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2129_c3_a087[uxn_opcodes_h_l2129_c3_a087]
signal printf_uxn_opcodes_h_l2129_c3_a087_uxn_opcodes_h_l2129_c3_a087_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2133_c11_638e]
signal BIN_OP_EQ_uxn_opcodes_h_l2133_c11_638e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2133_c11_638e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2133_c11_638e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2133_c7_f0cf]
signal n16_MUX_uxn_opcodes_h_l2133_c7_f0cf_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2133_c7_f0cf_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2133_c7_f0cf_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2133_c7_f0cf_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2133_c7_f0cf]
signal tmp16_MUX_uxn_opcodes_h_l2133_c7_f0cf_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2133_c7_f0cf_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2133_c7_f0cf_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2133_c7_f0cf_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2133_c7_f0cf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_f0cf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_f0cf_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_f0cf_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_f0cf_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2133_c7_f0cf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_f0cf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_f0cf_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_f0cf_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_f0cf_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2133_c7_f0cf]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_f0cf_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_f0cf_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_f0cf_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_f0cf_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2133_c7_f0cf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_f0cf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_f0cf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_f0cf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_f0cf_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2133_c7_f0cf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_f0cf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_f0cf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_f0cf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_f0cf_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2133_c7_f0cf]
signal result_u8_value_MUX_uxn_opcodes_h_l2133_c7_f0cf_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2133_c7_f0cf_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2133_c7_f0cf_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2133_c7_f0cf_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2133_c7_f0cf]
signal t16_MUX_uxn_opcodes_h_l2133_c7_f0cf_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2133_c7_f0cf_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2133_c7_f0cf_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2133_c7_f0cf_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2136_c11_0ba3]
signal BIN_OP_EQ_uxn_opcodes_h_l2136_c11_0ba3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2136_c11_0ba3_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2136_c11_0ba3_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2136_c7_e985]
signal n16_MUX_uxn_opcodes_h_l2136_c7_e985_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2136_c7_e985_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2136_c7_e985_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2136_c7_e985_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2136_c7_e985]
signal tmp16_MUX_uxn_opcodes_h_l2136_c7_e985_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2136_c7_e985_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2136_c7_e985_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2136_c7_e985_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2136_c7_e985]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_e985_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_e985_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_e985_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_e985_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2136_c7_e985]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_e985_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_e985_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_e985_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_e985_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2136_c7_e985]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_e985_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_e985_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_e985_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_e985_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2136_c7_e985]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_e985_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_e985_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_e985_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_e985_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2136_c7_e985]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_e985_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_e985_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_e985_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_e985_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2136_c7_e985]
signal result_u8_value_MUX_uxn_opcodes_h_l2136_c7_e985_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2136_c7_e985_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2136_c7_e985_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2136_c7_e985_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2136_c7_e985]
signal t16_MUX_uxn_opcodes_h_l2136_c7_e985_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2136_c7_e985_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2136_c7_e985_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2136_c7_e985_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2141_c11_0347]
signal BIN_OP_EQ_uxn_opcodes_h_l2141_c11_0347_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2141_c11_0347_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2141_c11_0347_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2141_c7_6c3e]
signal n16_MUX_uxn_opcodes_h_l2141_c7_6c3e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2141_c7_6c3e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2141_c7_6c3e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2141_c7_6c3e_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2141_c7_6c3e]
signal tmp16_MUX_uxn_opcodes_h_l2141_c7_6c3e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2141_c7_6c3e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2141_c7_6c3e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2141_c7_6c3e_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2141_c7_6c3e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_6c3e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_6c3e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_6c3e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_6c3e_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2141_c7_6c3e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_6c3e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_6c3e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_6c3e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_6c3e_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2141_c7_6c3e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_6c3e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_6c3e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_6c3e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_6c3e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2141_c7_6c3e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_6c3e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_6c3e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_6c3e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_6c3e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2141_c7_6c3e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_6c3e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_6c3e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_6c3e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_6c3e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2141_c7_6c3e]
signal result_u8_value_MUX_uxn_opcodes_h_l2141_c7_6c3e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2141_c7_6c3e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2141_c7_6c3e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2141_c7_6c3e_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2141_c7_6c3e]
signal t16_MUX_uxn_opcodes_h_l2141_c7_6c3e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2141_c7_6c3e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2141_c7_6c3e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2141_c7_6c3e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2144_c11_43ee]
signal BIN_OP_EQ_uxn_opcodes_h_l2144_c11_43ee_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2144_c11_43ee_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2144_c11_43ee_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2144_c7_2ed0]
signal n16_MUX_uxn_opcodes_h_l2144_c7_2ed0_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2144_c7_2ed0_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2144_c7_2ed0_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2144_c7_2ed0_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2144_c7_2ed0]
signal tmp16_MUX_uxn_opcodes_h_l2144_c7_2ed0_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2144_c7_2ed0_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2144_c7_2ed0_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2144_c7_2ed0_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2144_c7_2ed0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_2ed0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_2ed0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_2ed0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_2ed0_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2144_c7_2ed0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_2ed0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_2ed0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_2ed0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_2ed0_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2144_c7_2ed0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_2ed0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_2ed0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_2ed0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_2ed0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2144_c7_2ed0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_2ed0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_2ed0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_2ed0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_2ed0_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2144_c7_2ed0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_2ed0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_2ed0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_2ed0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_2ed0_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2144_c7_2ed0]
signal result_u8_value_MUX_uxn_opcodes_h_l2144_c7_2ed0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2144_c7_2ed0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2144_c7_2ed0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2144_c7_2ed0_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2144_c7_2ed0]
signal t16_MUX_uxn_opcodes_h_l2144_c7_2ed0_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2144_c7_2ed0_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2144_c7_2ed0_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2144_c7_2ed0_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2145_c3_c702]
signal BIN_OP_OR_uxn_opcodes_h_l2145_c3_c702_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2145_c3_c702_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2145_c3_c702_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2148_c11_161e]
signal BIN_OP_EQ_uxn_opcodes_h_l2148_c11_161e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2148_c11_161e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2148_c11_161e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2148_c7_7c06]
signal n16_MUX_uxn_opcodes_h_l2148_c7_7c06_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2148_c7_7c06_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2148_c7_7c06_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2148_c7_7c06_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2148_c7_7c06]
signal tmp16_MUX_uxn_opcodes_h_l2148_c7_7c06_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2148_c7_7c06_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2148_c7_7c06_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2148_c7_7c06_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2148_c7_7c06]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2148_c7_7c06_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2148_c7_7c06_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2148_c7_7c06_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2148_c7_7c06_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2148_c7_7c06]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2148_c7_7c06_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2148_c7_7c06_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2148_c7_7c06_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2148_c7_7c06_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2148_c7_7c06]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2148_c7_7c06_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2148_c7_7c06_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2148_c7_7c06_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2148_c7_7c06_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2148_c7_7c06]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2148_c7_7c06_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2148_c7_7c06_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2148_c7_7c06_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2148_c7_7c06_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2148_c7_7c06]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2148_c7_7c06_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2148_c7_7c06_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2148_c7_7c06_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2148_c7_7c06_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2148_c7_7c06]
signal result_u8_value_MUX_uxn_opcodes_h_l2148_c7_7c06_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2148_c7_7c06_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2148_c7_7c06_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2148_c7_7c06_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2151_c11_4c56]
signal BIN_OP_EQ_uxn_opcodes_h_l2151_c11_4c56_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2151_c11_4c56_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2151_c11_4c56_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2151_c7_5148]
signal n16_MUX_uxn_opcodes_h_l2151_c7_5148_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2151_c7_5148_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2151_c7_5148_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2151_c7_5148_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2151_c7_5148]
signal tmp16_MUX_uxn_opcodes_h_l2151_c7_5148_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2151_c7_5148_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2151_c7_5148_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2151_c7_5148_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2151_c7_5148]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_5148_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_5148_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_5148_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_5148_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2151_c7_5148]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_5148_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_5148_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_5148_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_5148_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2151_c7_5148]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_5148_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_5148_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_5148_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_5148_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2151_c7_5148]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_5148_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_5148_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_5148_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_5148_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2151_c7_5148]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_5148_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_5148_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_5148_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_5148_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2151_c7_5148]
signal result_u8_value_MUX_uxn_opcodes_h_l2151_c7_5148_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2151_c7_5148_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2151_c7_5148_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2151_c7_5148_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2156_c11_7295]
signal BIN_OP_EQ_uxn_opcodes_h_l2156_c11_7295_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2156_c11_7295_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2156_c11_7295_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2156_c7_0501]
signal n16_MUX_uxn_opcodes_h_l2156_c7_0501_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2156_c7_0501_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2156_c7_0501_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2156_c7_0501_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2156_c7_0501]
signal tmp16_MUX_uxn_opcodes_h_l2156_c7_0501_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2156_c7_0501_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2156_c7_0501_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2156_c7_0501_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2156_c7_0501]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2156_c7_0501_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2156_c7_0501_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2156_c7_0501_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2156_c7_0501_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2156_c7_0501]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2156_c7_0501_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2156_c7_0501_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2156_c7_0501_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2156_c7_0501_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2156_c7_0501]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2156_c7_0501_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2156_c7_0501_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2156_c7_0501_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2156_c7_0501_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2156_c7_0501]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2156_c7_0501_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2156_c7_0501_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2156_c7_0501_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2156_c7_0501_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2156_c7_0501]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2156_c7_0501_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2156_c7_0501_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2156_c7_0501_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2156_c7_0501_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2156_c7_0501]
signal result_u8_value_MUX_uxn_opcodes_h_l2156_c7_0501_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2156_c7_0501_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2156_c7_0501_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2156_c7_0501_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2159_c11_cbc3]
signal BIN_OP_EQ_uxn_opcodes_h_l2159_c11_cbc3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2159_c11_cbc3_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2159_c11_cbc3_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2159_c7_e653]
signal n16_MUX_uxn_opcodes_h_l2159_c7_e653_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2159_c7_e653_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2159_c7_e653_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2159_c7_e653_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2159_c7_e653]
signal tmp16_MUX_uxn_opcodes_h_l2159_c7_e653_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2159_c7_e653_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2159_c7_e653_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2159_c7_e653_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2159_c7_e653]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_e653_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_e653_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_e653_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_e653_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2159_c7_e653]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_e653_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_e653_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_e653_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_e653_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2159_c7_e653]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_e653_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_e653_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_e653_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_e653_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2159_c7_e653]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_e653_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_e653_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_e653_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_e653_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2159_c7_e653]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_e653_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_e653_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_e653_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_e653_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2159_c7_e653]
signal result_u8_value_MUX_uxn_opcodes_h_l2159_c7_e653_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2159_c7_e653_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2159_c7_e653_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2159_c7_e653_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2160_c3_4b76]
signal BIN_OP_OR_uxn_opcodes_h_l2160_c3_4b76_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2160_c3_4b76_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2160_c3_4b76_return_output : unsigned(15 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l2161_c11_7d1d]
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2161_c11_7d1d_left : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2161_c11_7d1d_right : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2161_c11_7d1d_return_output : unsigned(31 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2163_c30_4fb0]
signal sp_relative_shift_uxn_opcodes_h_l2163_c30_4fb0_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2163_c30_4fb0_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2163_c30_4fb0_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2163_c30_4fb0_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2168_c11_6a06]
signal BIN_OP_EQ_uxn_opcodes_h_l2168_c11_6a06_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2168_c11_6a06_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2168_c11_6a06_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2168_c7_00e2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c7_00e2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c7_00e2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c7_00e2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c7_00e2_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2168_c7_00e2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c7_00e2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c7_00e2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c7_00e2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c7_00e2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2168_c7_00e2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2168_c7_00e2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2168_c7_00e2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2168_c7_00e2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2168_c7_00e2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2168_c7_00e2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2168_c7_00e2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2168_c7_00e2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2168_c7_00e2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2168_c7_00e2_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2168_c7_00e2]
signal result_u8_value_MUX_uxn_opcodes_h_l2168_c7_00e2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2168_c7_00e2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2168_c7_00e2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2168_c7_00e2_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2171_c31_6182]
signal CONST_SR_8_uxn_opcodes_h_l2171_c31_6182_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2171_c31_6182_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2173_c11_d4a9]
signal BIN_OP_EQ_uxn_opcodes_h_l2173_c11_d4a9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2173_c11_d4a9_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2173_c11_d4a9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2173_c7_4ae4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_4ae4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_4ae4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_4ae4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_4ae4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2173_c7_4ae4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_4ae4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_4ae4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_4ae4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_4ae4_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2153_l2138_DUPLICATE_5588
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2153_l2138_DUPLICATE_5588_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2153_l2138_DUPLICATE_5588_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_8cda( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.sp_relative_shift := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.u8_value := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2128_c6_894e
BIN_OP_EQ_uxn_opcodes_h_l2128_c6_894e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2128_c6_894e_left,
BIN_OP_EQ_uxn_opcodes_h_l2128_c6_894e_right,
BIN_OP_EQ_uxn_opcodes_h_l2128_c6_894e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2128_c1_2978
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2128_c1_2978 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2128_c1_2978_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2128_c1_2978_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2128_c1_2978_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2128_c1_2978_return_output);

-- n16_MUX_uxn_opcodes_h_l2128_c2_d461
n16_MUX_uxn_opcodes_h_l2128_c2_d461 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2128_c2_d461_cond,
n16_MUX_uxn_opcodes_h_l2128_c2_d461_iftrue,
n16_MUX_uxn_opcodes_h_l2128_c2_d461_iffalse,
n16_MUX_uxn_opcodes_h_l2128_c2_d461_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2128_c2_d461
tmp16_MUX_uxn_opcodes_h_l2128_c2_d461 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2128_c2_d461_cond,
tmp16_MUX_uxn_opcodes_h_l2128_c2_d461_iftrue,
tmp16_MUX_uxn_opcodes_h_l2128_c2_d461_iffalse,
tmp16_MUX_uxn_opcodes_h_l2128_c2_d461_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c2_d461
result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c2_d461 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c2_d461_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c2_d461_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c2_d461_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c2_d461_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c2_d461
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c2_d461 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c2_d461_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c2_d461_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c2_d461_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c2_d461_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2128_c2_d461
result_is_sp_shift_MUX_uxn_opcodes_h_l2128_c2_d461 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2128_c2_d461_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2128_c2_d461_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2128_c2_d461_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2128_c2_d461_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2128_c2_d461
result_is_opc_done_MUX_uxn_opcodes_h_l2128_c2_d461 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2128_c2_d461_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2128_c2_d461_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2128_c2_d461_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2128_c2_d461_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2128_c2_d461
result_is_stack_write_MUX_uxn_opcodes_h_l2128_c2_d461 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2128_c2_d461_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2128_c2_d461_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2128_c2_d461_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2128_c2_d461_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2128_c2_d461
result_u8_value_MUX_uxn_opcodes_h_l2128_c2_d461 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2128_c2_d461_cond,
result_u8_value_MUX_uxn_opcodes_h_l2128_c2_d461_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2128_c2_d461_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2128_c2_d461_return_output);

-- t16_MUX_uxn_opcodes_h_l2128_c2_d461
t16_MUX_uxn_opcodes_h_l2128_c2_d461 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2128_c2_d461_cond,
t16_MUX_uxn_opcodes_h_l2128_c2_d461_iftrue,
t16_MUX_uxn_opcodes_h_l2128_c2_d461_iffalse,
t16_MUX_uxn_opcodes_h_l2128_c2_d461_return_output);

-- printf_uxn_opcodes_h_l2129_c3_a087_uxn_opcodes_h_l2129_c3_a087
printf_uxn_opcodes_h_l2129_c3_a087_uxn_opcodes_h_l2129_c3_a087 : entity work.printf_uxn_opcodes_h_l2129_c3_a087_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2129_c3_a087_uxn_opcodes_h_l2129_c3_a087_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2133_c11_638e
BIN_OP_EQ_uxn_opcodes_h_l2133_c11_638e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2133_c11_638e_left,
BIN_OP_EQ_uxn_opcodes_h_l2133_c11_638e_right,
BIN_OP_EQ_uxn_opcodes_h_l2133_c11_638e_return_output);

-- n16_MUX_uxn_opcodes_h_l2133_c7_f0cf
n16_MUX_uxn_opcodes_h_l2133_c7_f0cf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2133_c7_f0cf_cond,
n16_MUX_uxn_opcodes_h_l2133_c7_f0cf_iftrue,
n16_MUX_uxn_opcodes_h_l2133_c7_f0cf_iffalse,
n16_MUX_uxn_opcodes_h_l2133_c7_f0cf_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2133_c7_f0cf
tmp16_MUX_uxn_opcodes_h_l2133_c7_f0cf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2133_c7_f0cf_cond,
tmp16_MUX_uxn_opcodes_h_l2133_c7_f0cf_iftrue,
tmp16_MUX_uxn_opcodes_h_l2133_c7_f0cf_iffalse,
tmp16_MUX_uxn_opcodes_h_l2133_c7_f0cf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_f0cf
result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_f0cf : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_f0cf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_f0cf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_f0cf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_f0cf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_f0cf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_f0cf : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_f0cf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_f0cf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_f0cf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_f0cf_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_f0cf
result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_f0cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_f0cf_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_f0cf_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_f0cf_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_f0cf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_f0cf
result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_f0cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_f0cf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_f0cf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_f0cf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_f0cf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_f0cf
result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_f0cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_f0cf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_f0cf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_f0cf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_f0cf_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2133_c7_f0cf
result_u8_value_MUX_uxn_opcodes_h_l2133_c7_f0cf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2133_c7_f0cf_cond,
result_u8_value_MUX_uxn_opcodes_h_l2133_c7_f0cf_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2133_c7_f0cf_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2133_c7_f0cf_return_output);

-- t16_MUX_uxn_opcodes_h_l2133_c7_f0cf
t16_MUX_uxn_opcodes_h_l2133_c7_f0cf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2133_c7_f0cf_cond,
t16_MUX_uxn_opcodes_h_l2133_c7_f0cf_iftrue,
t16_MUX_uxn_opcodes_h_l2133_c7_f0cf_iffalse,
t16_MUX_uxn_opcodes_h_l2133_c7_f0cf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2136_c11_0ba3
BIN_OP_EQ_uxn_opcodes_h_l2136_c11_0ba3 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2136_c11_0ba3_left,
BIN_OP_EQ_uxn_opcodes_h_l2136_c11_0ba3_right,
BIN_OP_EQ_uxn_opcodes_h_l2136_c11_0ba3_return_output);

-- n16_MUX_uxn_opcodes_h_l2136_c7_e985
n16_MUX_uxn_opcodes_h_l2136_c7_e985 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2136_c7_e985_cond,
n16_MUX_uxn_opcodes_h_l2136_c7_e985_iftrue,
n16_MUX_uxn_opcodes_h_l2136_c7_e985_iffalse,
n16_MUX_uxn_opcodes_h_l2136_c7_e985_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2136_c7_e985
tmp16_MUX_uxn_opcodes_h_l2136_c7_e985 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2136_c7_e985_cond,
tmp16_MUX_uxn_opcodes_h_l2136_c7_e985_iftrue,
tmp16_MUX_uxn_opcodes_h_l2136_c7_e985_iffalse,
tmp16_MUX_uxn_opcodes_h_l2136_c7_e985_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_e985
result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_e985 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_e985_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_e985_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_e985_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_e985_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_e985
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_e985 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_e985_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_e985_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_e985_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_e985_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_e985
result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_e985 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_e985_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_e985_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_e985_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_e985_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_e985
result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_e985 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_e985_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_e985_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_e985_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_e985_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_e985
result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_e985 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_e985_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_e985_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_e985_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_e985_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2136_c7_e985
result_u8_value_MUX_uxn_opcodes_h_l2136_c7_e985 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2136_c7_e985_cond,
result_u8_value_MUX_uxn_opcodes_h_l2136_c7_e985_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2136_c7_e985_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2136_c7_e985_return_output);

-- t16_MUX_uxn_opcodes_h_l2136_c7_e985
t16_MUX_uxn_opcodes_h_l2136_c7_e985 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2136_c7_e985_cond,
t16_MUX_uxn_opcodes_h_l2136_c7_e985_iftrue,
t16_MUX_uxn_opcodes_h_l2136_c7_e985_iffalse,
t16_MUX_uxn_opcodes_h_l2136_c7_e985_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2141_c11_0347
BIN_OP_EQ_uxn_opcodes_h_l2141_c11_0347 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2141_c11_0347_left,
BIN_OP_EQ_uxn_opcodes_h_l2141_c11_0347_right,
BIN_OP_EQ_uxn_opcodes_h_l2141_c11_0347_return_output);

-- n16_MUX_uxn_opcodes_h_l2141_c7_6c3e
n16_MUX_uxn_opcodes_h_l2141_c7_6c3e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2141_c7_6c3e_cond,
n16_MUX_uxn_opcodes_h_l2141_c7_6c3e_iftrue,
n16_MUX_uxn_opcodes_h_l2141_c7_6c3e_iffalse,
n16_MUX_uxn_opcodes_h_l2141_c7_6c3e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2141_c7_6c3e
tmp16_MUX_uxn_opcodes_h_l2141_c7_6c3e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2141_c7_6c3e_cond,
tmp16_MUX_uxn_opcodes_h_l2141_c7_6c3e_iftrue,
tmp16_MUX_uxn_opcodes_h_l2141_c7_6c3e_iffalse,
tmp16_MUX_uxn_opcodes_h_l2141_c7_6c3e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_6c3e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_6c3e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_6c3e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_6c3e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_6c3e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_6c3e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_6c3e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_6c3e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_6c3e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_6c3e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_6c3e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_6c3e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_6c3e
result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_6c3e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_6c3e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_6c3e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_6c3e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_6c3e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_6c3e
result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_6c3e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_6c3e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_6c3e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_6c3e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_6c3e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_6c3e
result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_6c3e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_6c3e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_6c3e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_6c3e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_6c3e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2141_c7_6c3e
result_u8_value_MUX_uxn_opcodes_h_l2141_c7_6c3e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2141_c7_6c3e_cond,
result_u8_value_MUX_uxn_opcodes_h_l2141_c7_6c3e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2141_c7_6c3e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2141_c7_6c3e_return_output);

-- t16_MUX_uxn_opcodes_h_l2141_c7_6c3e
t16_MUX_uxn_opcodes_h_l2141_c7_6c3e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2141_c7_6c3e_cond,
t16_MUX_uxn_opcodes_h_l2141_c7_6c3e_iftrue,
t16_MUX_uxn_opcodes_h_l2141_c7_6c3e_iffalse,
t16_MUX_uxn_opcodes_h_l2141_c7_6c3e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2144_c11_43ee
BIN_OP_EQ_uxn_opcodes_h_l2144_c11_43ee : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2144_c11_43ee_left,
BIN_OP_EQ_uxn_opcodes_h_l2144_c11_43ee_right,
BIN_OP_EQ_uxn_opcodes_h_l2144_c11_43ee_return_output);

-- n16_MUX_uxn_opcodes_h_l2144_c7_2ed0
n16_MUX_uxn_opcodes_h_l2144_c7_2ed0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2144_c7_2ed0_cond,
n16_MUX_uxn_opcodes_h_l2144_c7_2ed0_iftrue,
n16_MUX_uxn_opcodes_h_l2144_c7_2ed0_iffalse,
n16_MUX_uxn_opcodes_h_l2144_c7_2ed0_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2144_c7_2ed0
tmp16_MUX_uxn_opcodes_h_l2144_c7_2ed0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2144_c7_2ed0_cond,
tmp16_MUX_uxn_opcodes_h_l2144_c7_2ed0_iftrue,
tmp16_MUX_uxn_opcodes_h_l2144_c7_2ed0_iffalse,
tmp16_MUX_uxn_opcodes_h_l2144_c7_2ed0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_2ed0
result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_2ed0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_2ed0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_2ed0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_2ed0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_2ed0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_2ed0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_2ed0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_2ed0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_2ed0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_2ed0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_2ed0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_2ed0
result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_2ed0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_2ed0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_2ed0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_2ed0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_2ed0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_2ed0
result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_2ed0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_2ed0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_2ed0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_2ed0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_2ed0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_2ed0
result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_2ed0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_2ed0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_2ed0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_2ed0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_2ed0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2144_c7_2ed0
result_u8_value_MUX_uxn_opcodes_h_l2144_c7_2ed0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2144_c7_2ed0_cond,
result_u8_value_MUX_uxn_opcodes_h_l2144_c7_2ed0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2144_c7_2ed0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2144_c7_2ed0_return_output);

-- t16_MUX_uxn_opcodes_h_l2144_c7_2ed0
t16_MUX_uxn_opcodes_h_l2144_c7_2ed0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2144_c7_2ed0_cond,
t16_MUX_uxn_opcodes_h_l2144_c7_2ed0_iftrue,
t16_MUX_uxn_opcodes_h_l2144_c7_2ed0_iffalse,
t16_MUX_uxn_opcodes_h_l2144_c7_2ed0_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2145_c3_c702
BIN_OP_OR_uxn_opcodes_h_l2145_c3_c702 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2145_c3_c702_left,
BIN_OP_OR_uxn_opcodes_h_l2145_c3_c702_right,
BIN_OP_OR_uxn_opcodes_h_l2145_c3_c702_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2148_c11_161e
BIN_OP_EQ_uxn_opcodes_h_l2148_c11_161e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2148_c11_161e_left,
BIN_OP_EQ_uxn_opcodes_h_l2148_c11_161e_right,
BIN_OP_EQ_uxn_opcodes_h_l2148_c11_161e_return_output);

-- n16_MUX_uxn_opcodes_h_l2148_c7_7c06
n16_MUX_uxn_opcodes_h_l2148_c7_7c06 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2148_c7_7c06_cond,
n16_MUX_uxn_opcodes_h_l2148_c7_7c06_iftrue,
n16_MUX_uxn_opcodes_h_l2148_c7_7c06_iffalse,
n16_MUX_uxn_opcodes_h_l2148_c7_7c06_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2148_c7_7c06
tmp16_MUX_uxn_opcodes_h_l2148_c7_7c06 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2148_c7_7c06_cond,
tmp16_MUX_uxn_opcodes_h_l2148_c7_7c06_iftrue,
tmp16_MUX_uxn_opcodes_h_l2148_c7_7c06_iffalse,
tmp16_MUX_uxn_opcodes_h_l2148_c7_7c06_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2148_c7_7c06
result_sp_relative_shift_MUX_uxn_opcodes_h_l2148_c7_7c06 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2148_c7_7c06_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2148_c7_7c06_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2148_c7_7c06_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2148_c7_7c06_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2148_c7_7c06
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2148_c7_7c06 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2148_c7_7c06_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2148_c7_7c06_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2148_c7_7c06_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2148_c7_7c06_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2148_c7_7c06
result_is_sp_shift_MUX_uxn_opcodes_h_l2148_c7_7c06 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2148_c7_7c06_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2148_c7_7c06_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2148_c7_7c06_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2148_c7_7c06_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2148_c7_7c06
result_is_opc_done_MUX_uxn_opcodes_h_l2148_c7_7c06 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2148_c7_7c06_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2148_c7_7c06_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2148_c7_7c06_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2148_c7_7c06_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2148_c7_7c06
result_is_stack_write_MUX_uxn_opcodes_h_l2148_c7_7c06 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2148_c7_7c06_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2148_c7_7c06_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2148_c7_7c06_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2148_c7_7c06_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2148_c7_7c06
result_u8_value_MUX_uxn_opcodes_h_l2148_c7_7c06 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2148_c7_7c06_cond,
result_u8_value_MUX_uxn_opcodes_h_l2148_c7_7c06_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2148_c7_7c06_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2148_c7_7c06_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2151_c11_4c56
BIN_OP_EQ_uxn_opcodes_h_l2151_c11_4c56 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2151_c11_4c56_left,
BIN_OP_EQ_uxn_opcodes_h_l2151_c11_4c56_right,
BIN_OP_EQ_uxn_opcodes_h_l2151_c11_4c56_return_output);

-- n16_MUX_uxn_opcodes_h_l2151_c7_5148
n16_MUX_uxn_opcodes_h_l2151_c7_5148 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2151_c7_5148_cond,
n16_MUX_uxn_opcodes_h_l2151_c7_5148_iftrue,
n16_MUX_uxn_opcodes_h_l2151_c7_5148_iffalse,
n16_MUX_uxn_opcodes_h_l2151_c7_5148_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2151_c7_5148
tmp16_MUX_uxn_opcodes_h_l2151_c7_5148 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2151_c7_5148_cond,
tmp16_MUX_uxn_opcodes_h_l2151_c7_5148_iftrue,
tmp16_MUX_uxn_opcodes_h_l2151_c7_5148_iffalse,
tmp16_MUX_uxn_opcodes_h_l2151_c7_5148_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_5148
result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_5148 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_5148_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_5148_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_5148_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_5148_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_5148
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_5148 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_5148_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_5148_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_5148_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_5148_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_5148
result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_5148 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_5148_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_5148_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_5148_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_5148_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_5148
result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_5148 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_5148_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_5148_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_5148_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_5148_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_5148
result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_5148 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_5148_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_5148_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_5148_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_5148_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2151_c7_5148
result_u8_value_MUX_uxn_opcodes_h_l2151_c7_5148 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2151_c7_5148_cond,
result_u8_value_MUX_uxn_opcodes_h_l2151_c7_5148_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2151_c7_5148_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2151_c7_5148_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2156_c11_7295
BIN_OP_EQ_uxn_opcodes_h_l2156_c11_7295 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2156_c11_7295_left,
BIN_OP_EQ_uxn_opcodes_h_l2156_c11_7295_right,
BIN_OP_EQ_uxn_opcodes_h_l2156_c11_7295_return_output);

-- n16_MUX_uxn_opcodes_h_l2156_c7_0501
n16_MUX_uxn_opcodes_h_l2156_c7_0501 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2156_c7_0501_cond,
n16_MUX_uxn_opcodes_h_l2156_c7_0501_iftrue,
n16_MUX_uxn_opcodes_h_l2156_c7_0501_iffalse,
n16_MUX_uxn_opcodes_h_l2156_c7_0501_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2156_c7_0501
tmp16_MUX_uxn_opcodes_h_l2156_c7_0501 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2156_c7_0501_cond,
tmp16_MUX_uxn_opcodes_h_l2156_c7_0501_iftrue,
tmp16_MUX_uxn_opcodes_h_l2156_c7_0501_iffalse,
tmp16_MUX_uxn_opcodes_h_l2156_c7_0501_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2156_c7_0501
result_sp_relative_shift_MUX_uxn_opcodes_h_l2156_c7_0501 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2156_c7_0501_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2156_c7_0501_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2156_c7_0501_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2156_c7_0501_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2156_c7_0501
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2156_c7_0501 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2156_c7_0501_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2156_c7_0501_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2156_c7_0501_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2156_c7_0501_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2156_c7_0501
result_is_sp_shift_MUX_uxn_opcodes_h_l2156_c7_0501 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2156_c7_0501_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2156_c7_0501_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2156_c7_0501_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2156_c7_0501_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2156_c7_0501
result_is_opc_done_MUX_uxn_opcodes_h_l2156_c7_0501 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2156_c7_0501_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2156_c7_0501_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2156_c7_0501_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2156_c7_0501_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2156_c7_0501
result_is_stack_write_MUX_uxn_opcodes_h_l2156_c7_0501 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2156_c7_0501_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2156_c7_0501_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2156_c7_0501_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2156_c7_0501_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2156_c7_0501
result_u8_value_MUX_uxn_opcodes_h_l2156_c7_0501 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2156_c7_0501_cond,
result_u8_value_MUX_uxn_opcodes_h_l2156_c7_0501_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2156_c7_0501_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2156_c7_0501_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2159_c11_cbc3
BIN_OP_EQ_uxn_opcodes_h_l2159_c11_cbc3 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2159_c11_cbc3_left,
BIN_OP_EQ_uxn_opcodes_h_l2159_c11_cbc3_right,
BIN_OP_EQ_uxn_opcodes_h_l2159_c11_cbc3_return_output);

-- n16_MUX_uxn_opcodes_h_l2159_c7_e653
n16_MUX_uxn_opcodes_h_l2159_c7_e653 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2159_c7_e653_cond,
n16_MUX_uxn_opcodes_h_l2159_c7_e653_iftrue,
n16_MUX_uxn_opcodes_h_l2159_c7_e653_iffalse,
n16_MUX_uxn_opcodes_h_l2159_c7_e653_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2159_c7_e653
tmp16_MUX_uxn_opcodes_h_l2159_c7_e653 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2159_c7_e653_cond,
tmp16_MUX_uxn_opcodes_h_l2159_c7_e653_iftrue,
tmp16_MUX_uxn_opcodes_h_l2159_c7_e653_iffalse,
tmp16_MUX_uxn_opcodes_h_l2159_c7_e653_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_e653
result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_e653 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_e653_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_e653_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_e653_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_e653_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_e653
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_e653 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_e653_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_e653_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_e653_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_e653_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_e653
result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_e653 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_e653_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_e653_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_e653_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_e653_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_e653
result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_e653 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_e653_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_e653_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_e653_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_e653_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_e653
result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_e653 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_e653_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_e653_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_e653_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_e653_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2159_c7_e653
result_u8_value_MUX_uxn_opcodes_h_l2159_c7_e653 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2159_c7_e653_cond,
result_u8_value_MUX_uxn_opcodes_h_l2159_c7_e653_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2159_c7_e653_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2159_c7_e653_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2160_c3_4b76
BIN_OP_OR_uxn_opcodes_h_l2160_c3_4b76 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2160_c3_4b76_left,
BIN_OP_OR_uxn_opcodes_h_l2160_c3_4b76_right,
BIN_OP_OR_uxn_opcodes_h_l2160_c3_4b76_return_output);

-- BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2161_c11_7d1d
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2161_c11_7d1d : entity work.BIN_OP_INFERRED_MULT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2161_c11_7d1d_left,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2161_c11_7d1d_right,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2161_c11_7d1d_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2163_c30_4fb0
sp_relative_shift_uxn_opcodes_h_l2163_c30_4fb0 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2163_c30_4fb0_ins,
sp_relative_shift_uxn_opcodes_h_l2163_c30_4fb0_x,
sp_relative_shift_uxn_opcodes_h_l2163_c30_4fb0_y,
sp_relative_shift_uxn_opcodes_h_l2163_c30_4fb0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2168_c11_6a06
BIN_OP_EQ_uxn_opcodes_h_l2168_c11_6a06 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2168_c11_6a06_left,
BIN_OP_EQ_uxn_opcodes_h_l2168_c11_6a06_right,
BIN_OP_EQ_uxn_opcodes_h_l2168_c11_6a06_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c7_00e2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c7_00e2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c7_00e2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c7_00e2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c7_00e2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c7_00e2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c7_00e2
result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c7_00e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c7_00e2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c7_00e2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c7_00e2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c7_00e2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2168_c7_00e2
result_is_opc_done_MUX_uxn_opcodes_h_l2168_c7_00e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2168_c7_00e2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2168_c7_00e2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2168_c7_00e2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2168_c7_00e2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2168_c7_00e2
result_is_stack_write_MUX_uxn_opcodes_h_l2168_c7_00e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2168_c7_00e2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2168_c7_00e2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2168_c7_00e2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2168_c7_00e2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2168_c7_00e2
result_u8_value_MUX_uxn_opcodes_h_l2168_c7_00e2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2168_c7_00e2_cond,
result_u8_value_MUX_uxn_opcodes_h_l2168_c7_00e2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2168_c7_00e2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2168_c7_00e2_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2171_c31_6182
CONST_SR_8_uxn_opcodes_h_l2171_c31_6182 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2171_c31_6182_x,
CONST_SR_8_uxn_opcodes_h_l2171_c31_6182_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2173_c11_d4a9
BIN_OP_EQ_uxn_opcodes_h_l2173_c11_d4a9 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2173_c11_d4a9_left,
BIN_OP_EQ_uxn_opcodes_h_l2173_c11_d4a9_right,
BIN_OP_EQ_uxn_opcodes_h_l2173_c11_d4a9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_4ae4
result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_4ae4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_4ae4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_4ae4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_4ae4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_4ae4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_4ae4
result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_4ae4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_4ae4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_4ae4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_4ae4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_4ae4_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2153_l2138_DUPLICATE_5588
CONST_SL_8_uint16_t_uxn_opcodes_h_l2153_l2138_DUPLICATE_5588 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2153_l2138_DUPLICATE_5588_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2153_l2138_DUPLICATE_5588_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2128_c6_894e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2128_c1_2978_return_output,
 n16_MUX_uxn_opcodes_h_l2128_c2_d461_return_output,
 tmp16_MUX_uxn_opcodes_h_l2128_c2_d461_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c2_d461_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c2_d461_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2128_c2_d461_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2128_c2_d461_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2128_c2_d461_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2128_c2_d461_return_output,
 t16_MUX_uxn_opcodes_h_l2128_c2_d461_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2133_c11_638e_return_output,
 n16_MUX_uxn_opcodes_h_l2133_c7_f0cf_return_output,
 tmp16_MUX_uxn_opcodes_h_l2133_c7_f0cf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_f0cf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_f0cf_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_f0cf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_f0cf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_f0cf_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2133_c7_f0cf_return_output,
 t16_MUX_uxn_opcodes_h_l2133_c7_f0cf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2136_c11_0ba3_return_output,
 n16_MUX_uxn_opcodes_h_l2136_c7_e985_return_output,
 tmp16_MUX_uxn_opcodes_h_l2136_c7_e985_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_e985_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_e985_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_e985_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_e985_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_e985_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2136_c7_e985_return_output,
 t16_MUX_uxn_opcodes_h_l2136_c7_e985_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2141_c11_0347_return_output,
 n16_MUX_uxn_opcodes_h_l2141_c7_6c3e_return_output,
 tmp16_MUX_uxn_opcodes_h_l2141_c7_6c3e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_6c3e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_6c3e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_6c3e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_6c3e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_6c3e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2141_c7_6c3e_return_output,
 t16_MUX_uxn_opcodes_h_l2141_c7_6c3e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2144_c11_43ee_return_output,
 n16_MUX_uxn_opcodes_h_l2144_c7_2ed0_return_output,
 tmp16_MUX_uxn_opcodes_h_l2144_c7_2ed0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_2ed0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_2ed0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_2ed0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_2ed0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_2ed0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2144_c7_2ed0_return_output,
 t16_MUX_uxn_opcodes_h_l2144_c7_2ed0_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2145_c3_c702_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2148_c11_161e_return_output,
 n16_MUX_uxn_opcodes_h_l2148_c7_7c06_return_output,
 tmp16_MUX_uxn_opcodes_h_l2148_c7_7c06_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2148_c7_7c06_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2148_c7_7c06_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2148_c7_7c06_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2148_c7_7c06_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2148_c7_7c06_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2148_c7_7c06_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2151_c11_4c56_return_output,
 n16_MUX_uxn_opcodes_h_l2151_c7_5148_return_output,
 tmp16_MUX_uxn_opcodes_h_l2151_c7_5148_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_5148_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_5148_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_5148_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_5148_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_5148_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2151_c7_5148_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2156_c11_7295_return_output,
 n16_MUX_uxn_opcodes_h_l2156_c7_0501_return_output,
 tmp16_MUX_uxn_opcodes_h_l2156_c7_0501_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2156_c7_0501_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2156_c7_0501_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2156_c7_0501_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2156_c7_0501_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2156_c7_0501_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2156_c7_0501_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2159_c11_cbc3_return_output,
 n16_MUX_uxn_opcodes_h_l2159_c7_e653_return_output,
 tmp16_MUX_uxn_opcodes_h_l2159_c7_e653_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_e653_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_e653_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_e653_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_e653_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_e653_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2159_c7_e653_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2160_c3_4b76_return_output,
 BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2161_c11_7d1d_return_output,
 sp_relative_shift_uxn_opcodes_h_l2163_c30_4fb0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2168_c11_6a06_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c7_00e2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c7_00e2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2168_c7_00e2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2168_c7_00e2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2168_c7_00e2_return_output,
 CONST_SR_8_uxn_opcodes_h_l2171_c31_6182_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2173_c11_d4a9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_4ae4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_4ae4_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2153_l2138_DUPLICATE_5588_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c6_894e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c6_894e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c6_894e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2128_c1_2978_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2128_c1_2978_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2128_c1_2978_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2128_c1_2978_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2128_c2_d461_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2128_c2_d461_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2133_c7_f0cf_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2128_c2_d461_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2128_c2_d461_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2128_c2_d461_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2128_c2_d461_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2133_c7_f0cf_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2128_c2_d461_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2128_c2_d461_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c2_d461_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c2_d461_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_f0cf_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c2_d461_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c2_d461_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c2_d461_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2130_c3_150b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c2_d461_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_f0cf_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c2_d461_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c2_d461_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2128_c2_d461_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2128_c2_d461_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_f0cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2128_c2_d461_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2128_c2_d461_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c2_d461_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c2_d461_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_f0cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c2_d461_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c2_d461_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2128_c2_d461_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2128_c2_d461_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_f0cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2128_c2_d461_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2128_c2_d461_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c2_d461_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c2_d461_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c7_f0cf_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c2_d461_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c2_d461_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2128_c2_d461_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2128_c2_d461_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2133_c7_f0cf_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2128_c2_d461_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2128_c2_d461_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2129_c3_a087_uxn_opcodes_h_l2129_c3_a087_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_638e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_638e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_638e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2133_c7_f0cf_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2133_c7_f0cf_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2136_c7_e985_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2133_c7_f0cf_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2133_c7_f0cf_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2133_c7_f0cf_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2136_c7_e985_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2133_c7_f0cf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_f0cf_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_f0cf_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_e985_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_f0cf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_f0cf_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2134_c3_2900 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_f0cf_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_e985_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_f0cf_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_f0cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_f0cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_e985_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_f0cf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_f0cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_f0cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_e985_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_f0cf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_f0cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_f0cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_e985_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_f0cf_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c7_f0cf_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c7_f0cf_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2136_c7_e985_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c7_f0cf_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2133_c7_f0cf_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2133_c7_f0cf_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2136_c7_e985_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2133_c7_f0cf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_0ba3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_0ba3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_0ba3_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2136_c7_e985_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2136_c7_e985_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2141_c7_6c3e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2136_c7_e985_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2136_c7_e985_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2136_c7_e985_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_6c3e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2136_c7_e985_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_e985_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_e985_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_6c3e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_e985_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_e985_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2139_c3_3e55 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_e985_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_6c3e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_e985_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_e985_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_e985_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_6c3e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_e985_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_e985_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_e985_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_6c3e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_e985_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_e985_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_e985_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_6c3e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_e985_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2136_c7_e985_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2136_c7_e985_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_6c3e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2136_c7_e985_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2136_c7_e985_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2136_c7_e985_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2141_c7_6c3e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2136_c7_e985_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_0347_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_0347_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_0347_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2141_c7_6c3e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2141_c7_6c3e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2144_c7_2ed0_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2141_c7_6c3e_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_6c3e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_6c3e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2144_c7_2ed0_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_6c3e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_6c3e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_6c3e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_2ed0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_6c3e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_6c3e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2142_c3_8b48 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_6c3e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_2ed0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_6c3e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_6c3e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_6c3e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_2ed0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_6c3e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_6c3e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_6c3e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_2ed0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_6c3e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_6c3e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_6c3e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_2ed0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_6c3e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_6c3e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_6c3e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2144_c7_2ed0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_6c3e_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2141_c7_6c3e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2141_c7_6c3e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2144_c7_2ed0_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2141_c7_6c3e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_43ee_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_43ee_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_43ee_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2144_c7_2ed0_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2144_c7_2ed0_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2148_c7_7c06_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2144_c7_2ed0_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2144_c7_2ed0_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2144_c7_2ed0_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2148_c7_7c06_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2144_c7_2ed0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_2ed0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_2ed0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2148_c7_7c06_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_2ed0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_2ed0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2146_c3_80bc : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_2ed0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2148_c7_7c06_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_2ed0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_2ed0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_2ed0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2148_c7_7c06_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_2ed0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_2ed0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_2ed0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2148_c7_7c06_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_2ed0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_2ed0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_2ed0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2148_c7_7c06_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_2ed0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2144_c7_2ed0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2144_c7_2ed0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2148_c7_7c06_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2144_c7_2ed0_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2144_c7_2ed0_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2144_c7_2ed0_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2144_c7_2ed0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2145_c3_c702_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2145_c3_c702_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2145_c3_c702_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2148_c11_161e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2148_c11_161e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2148_c11_161e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2148_c7_7c06_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2148_c7_7c06_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2151_c7_5148_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2148_c7_7c06_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2148_c7_7c06_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2148_c7_7c06_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2151_c7_5148_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2148_c7_7c06_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2148_c7_7c06_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2148_c7_7c06_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_5148_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2148_c7_7c06_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2148_c7_7c06_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2149_c3_1217 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2148_c7_7c06_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_5148_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2148_c7_7c06_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2148_c7_7c06_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2148_c7_7c06_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_5148_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2148_c7_7c06_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2148_c7_7c06_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2148_c7_7c06_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_5148_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2148_c7_7c06_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2148_c7_7c06_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2148_c7_7c06_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_5148_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2148_c7_7c06_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2148_c7_7c06_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2148_c7_7c06_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2151_c7_5148_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2148_c7_7c06_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2151_c11_4c56_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2151_c11_4c56_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2151_c11_4c56_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2151_c7_5148_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2151_c7_5148_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2156_c7_0501_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2151_c7_5148_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2151_c7_5148_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2151_c7_5148_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2156_c7_0501_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2151_c7_5148_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_5148_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_5148_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2156_c7_0501_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_5148_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_5148_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2154_c3_d700 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_5148_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2156_c7_0501_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_5148_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_5148_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_5148_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2156_c7_0501_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_5148_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_5148_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_5148_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2156_c7_0501_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_5148_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_5148_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_5148_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2156_c7_0501_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_5148_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2151_c7_5148_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2151_c7_5148_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2156_c7_0501_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2151_c7_5148_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2156_c11_7295_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2156_c11_7295_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2156_c11_7295_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2156_c7_0501_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2156_c7_0501_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2159_c7_e653_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2156_c7_0501_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2156_c7_0501_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2156_c7_0501_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2159_c7_e653_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2156_c7_0501_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2156_c7_0501_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2156_c7_0501_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_e653_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2156_c7_0501_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2156_c7_0501_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2157_c3_c274 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2156_c7_0501_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_e653_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2156_c7_0501_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2156_c7_0501_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2156_c7_0501_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_e653_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2156_c7_0501_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2156_c7_0501_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2156_c7_0501_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_e653_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2156_c7_0501_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2156_c7_0501_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2156_c7_0501_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_e653_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2156_c7_0501_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2156_c7_0501_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2156_c7_0501_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2159_c7_e653_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2156_c7_0501_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2159_c11_cbc3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2159_c11_cbc3_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2159_c11_cbc3_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2159_c7_e653_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2159_c7_e653_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2159_c7_e653_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2159_c7_e653_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l2161_c3_e05a : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2159_c7_e653_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2159_c7_e653_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_e653_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_e653_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_e653_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_e653_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2165_c3_570e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_e653_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c7_00e2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_e653_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_e653_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_e653_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c7_00e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_e653_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_e653_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_e653_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2168_c7_00e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_e653_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_e653_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_e653_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2168_c7_00e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_e653_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2159_c7_e653_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2159_c7_e653_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2168_c7_00e2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2159_c7_e653_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2160_c3_4b76_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2160_c3_4b76_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2160_c3_4b76_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2161_c11_7d1d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2161_c11_7d1d_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2161_c11_7d1d_return_output : unsigned(31 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2163_c30_4fb0_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2163_c30_4fb0_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2163_c30_4fb0_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2163_c30_4fb0_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2166_c21_e14b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2168_c11_6a06_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2168_c11_6a06_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2168_c11_6a06_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c7_00e2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2170_c3_5850 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c7_00e2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2168_c7_00e2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c7_00e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c7_00e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c7_00e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c7_00e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2168_c7_00e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2168_c7_00e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_4ae4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2168_c7_00e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2168_c7_00e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2168_c7_00e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_4ae4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2168_c7_00e2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2168_c7_00e2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2168_c7_00e2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2168_c7_00e2_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2171_c31_6182_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2171_c31_6182_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2171_c21_9006_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_d4a9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_d4a9_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_d4a9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_4ae4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_4ae4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_4ae4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_4ae4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_4ae4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_4ae4_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2133_l2156_l2128_l2151_l2148_l2144_l2141_l2136_l2159_DUPLICATE_e669_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2133_l2156_l2128_l2151_l2148_l2144_l2141_l2168_l2136_DUPLICATE_a532_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2133_l2156_l2128_l2151_l2148_l2144_l2173_l2141_l2168_l2136_DUPLICATE_70bf_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2133_l2156_l2128_l2151_l2148_l2144_l2141_l2168_l2136_DUPLICATE_9303_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2133_l2156_l2151_l2148_l2144_l2173_l2141_l2168_l2136_l2159_DUPLICATE_7c02_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2145_l2137_l2152_l2160_DUPLICATE_2702_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2153_l2138_DUPLICATE_5588_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2153_l2138_DUPLICATE_5588_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l2124_l2178_DUPLICATE_7217_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2157_c3_c274 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2156_c7_0501_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2157_c3_c274;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_4ae4_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2134_c3_2900 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_f0cf_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2134_c3_2900;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2148_c11_161e_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_0ba3_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c6_894e_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2151_c11_4c56_right := to_unsigned(6, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2128_c1_2978_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2142_c3_8b48 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_6c3e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2142_c3_8b48;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2139_c3_3e55 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_e985_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2139_c3_3e55;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_43ee_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2165_c3_570e := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_e653_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2165_c3_570e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2168_c11_6a06_right := to_unsigned(9, 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c2_d461_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c7_00e2_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_0347_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2154_c3_d700 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_5148_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2154_c3_d700;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_e653_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2163_c30_4fb0_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2159_c11_cbc3_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_d4a9_right := to_unsigned(10, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2149_c3_1217 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2148_c7_7c06_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2149_c3_1217;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2156_c11_7295_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2130_c3_150b := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c2_d461_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2130_c3_150b;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2146_c3_80bc := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_2ed0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2146_c3_80bc;
     VAR_sp_relative_shift_uxn_opcodes_h_l2163_c30_4fb0_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_4ae4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_638e_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2170_c3_5850 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c7_00e2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2170_c3_5850;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_e653_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2128_c1_2978_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2163_c30_4fb0_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2160_c3_4b76_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2128_c2_d461_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2133_c7_f0cf_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2136_c7_e985_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2141_c7_6c3e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2144_c7_2ed0_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2148_c7_7c06_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2156_c7_0501_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2159_c7_e653_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c6_894e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_638e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_0ba3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_0347_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_43ee_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2148_c11_161e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2151_c11_4c56_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2156_c11_7295_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2159_c11_cbc3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2168_c11_6a06_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_d4a9_left := VAR_phase;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2161_c11_7d1d_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2145_c3_c702_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2128_c2_d461_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2133_c7_f0cf_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2141_c7_6c3e_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2144_c7_2ed0_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2171_c31_6182_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2128_c2_d461_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2133_c7_f0cf_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2136_c7_e985_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_6c3e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2144_c7_2ed0_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2148_c7_7c06_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2151_c7_5148_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2156_c7_0501_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2159_c7_e653_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2148_c11_161e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2148_c11_161e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2148_c11_161e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2148_c11_161e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2148_c11_161e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2148_c11_161e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2148_c11_161e_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2133_l2156_l2128_l2151_l2148_l2144_l2141_l2136_l2159_DUPLICATE_e669 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2133_l2156_l2128_l2151_l2148_l2144_l2141_l2136_l2159_DUPLICATE_e669_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2133_c11_638e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2133_c11_638e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_638e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2133_c11_638e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_638e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_638e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2133_c11_638e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2159_c11_cbc3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2159_c11_cbc3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2159_c11_cbc3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2159_c11_cbc3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2159_c11_cbc3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2159_c11_cbc3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2159_c11_cbc3_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2163_c30_4fb0] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2163_c30_4fb0_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2163_c30_4fb0_ins;
     sp_relative_shift_uxn_opcodes_h_l2163_c30_4fb0_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2163_c30_4fb0_x;
     sp_relative_shift_uxn_opcodes_h_l2163_c30_4fb0_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2163_c30_4fb0_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2163_c30_4fb0_return_output := sp_relative_shift_uxn_opcodes_h_l2163_c30_4fb0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2156_c11_7295] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2156_c11_7295_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2156_c11_7295_left;
     BIN_OP_EQ_uxn_opcodes_h_l2156_c11_7295_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2156_c11_7295_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2156_c11_7295_return_output := BIN_OP_EQ_uxn_opcodes_h_l2156_c11_7295_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2171_c31_6182] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2171_c31_6182_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2171_c31_6182_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2171_c31_6182_return_output := CONST_SR_8_uxn_opcodes_h_l2171_c31_6182_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2168_c7_00e2] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2168_c7_00e2_return_output := result.stack_address_sp_offset;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2145_l2137_l2152_l2160_DUPLICATE_2702 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2145_l2137_l2152_l2160_DUPLICATE_2702_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2128_c6_894e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2128_c6_894e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c6_894e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2128_c6_894e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c6_894e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c6_894e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2128_c6_894e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2173_c11_d4a9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2173_c11_d4a9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_d4a9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2173_c11_d4a9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_d4a9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_d4a9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2173_c11_d4a9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2136_c11_0ba3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2136_c11_0ba3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_0ba3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2136_c11_0ba3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_0ba3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_0ba3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2136_c11_0ba3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2144_c11_43ee] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2144_c11_43ee_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_43ee_left;
     BIN_OP_EQ_uxn_opcodes_h_l2144_c11_43ee_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_43ee_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_43ee_return_output := BIN_OP_EQ_uxn_opcodes_h_l2144_c11_43ee_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2133_l2156_l2151_l2148_l2144_l2173_l2141_l2168_l2136_l2159_DUPLICATE_7c02 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2133_l2156_l2151_l2148_l2144_l2173_l2141_l2168_l2136_l2159_DUPLICATE_7c02_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2133_l2156_l2128_l2151_l2148_l2144_l2173_l2141_l2168_l2136_DUPLICATE_70bf LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2133_l2156_l2128_l2151_l2148_l2144_l2173_l2141_l2168_l2136_DUPLICATE_70bf_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2133_l2156_l2128_l2151_l2148_l2144_l2141_l2168_l2136_DUPLICATE_a532 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2133_l2156_l2128_l2151_l2148_l2144_l2141_l2168_l2136_DUPLICATE_a532_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2141_c11_0347] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2141_c11_0347_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_0347_left;
     BIN_OP_EQ_uxn_opcodes_h_l2141_c11_0347_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_0347_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_0347_return_output := BIN_OP_EQ_uxn_opcodes_h_l2141_c11_0347_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2168_c11_6a06] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2168_c11_6a06_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2168_c11_6a06_left;
     BIN_OP_EQ_uxn_opcodes_h_l2168_c11_6a06_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2168_c11_6a06_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2168_c11_6a06_return_output := BIN_OP_EQ_uxn_opcodes_h_l2168_c11_6a06_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2133_l2156_l2128_l2151_l2148_l2144_l2141_l2168_l2136_DUPLICATE_9303 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2133_l2156_l2128_l2151_l2148_l2144_l2141_l2168_l2136_DUPLICATE_9303_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2151_c11_4c56] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2151_c11_4c56_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2151_c11_4c56_left;
     BIN_OP_EQ_uxn_opcodes_h_l2151_c11_4c56_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2151_c11_4c56_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2151_c11_4c56_return_output := BIN_OP_EQ_uxn_opcodes_h_l2151_c11_4c56_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2128_c1_2978_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c6_894e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2128_c2_d461_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c6_894e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c2_d461_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c6_894e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2128_c2_d461_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c6_894e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2128_c2_d461_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c6_894e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c2_d461_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c6_894e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c2_d461_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c6_894e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c2_d461_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c6_894e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2128_c2_d461_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c6_894e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2128_c2_d461_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c6_894e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2133_c7_f0cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_638e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_f0cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_638e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_f0cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_638e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_f0cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_638e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_f0cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_638e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_f0cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_638e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c7_f0cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_638e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2133_c7_f0cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_638e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2133_c7_f0cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c11_638e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2136_c7_e985_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_0ba3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_e985_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_0ba3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_e985_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_0ba3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_e985_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_0ba3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_e985_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_0ba3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_e985_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_0ba3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2136_c7_e985_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_0ba3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2136_c7_e985_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_0ba3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2136_c7_e985_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_0ba3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2141_c7_6c3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_0347_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_6c3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_0347_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_6c3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_0347_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_6c3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_0347_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_6c3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_0347_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_6c3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_0347_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_6c3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_0347_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2141_c7_6c3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_0347_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_6c3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_0347_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2144_c7_2ed0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_43ee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_2ed0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_43ee_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_2ed0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_43ee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_2ed0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_43ee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_2ed0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_43ee_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_2ed0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_43ee_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2144_c7_2ed0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_43ee_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2144_c7_2ed0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_43ee_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2144_c7_2ed0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_43ee_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2148_c7_7c06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2148_c11_161e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2148_c7_7c06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2148_c11_161e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2148_c7_7c06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2148_c11_161e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2148_c7_7c06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2148_c11_161e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2148_c7_7c06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2148_c11_161e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2148_c7_7c06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2148_c11_161e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2148_c7_7c06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2148_c11_161e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2148_c7_7c06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2148_c11_161e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2151_c7_5148_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2151_c11_4c56_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_5148_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2151_c11_4c56_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_5148_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2151_c11_4c56_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_5148_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2151_c11_4c56_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_5148_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2151_c11_4c56_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_5148_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2151_c11_4c56_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2151_c7_5148_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2151_c11_4c56_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2151_c7_5148_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2151_c11_4c56_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2156_c7_0501_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2156_c11_7295_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2156_c7_0501_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2156_c11_7295_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2156_c7_0501_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2156_c11_7295_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2156_c7_0501_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2156_c11_7295_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2156_c7_0501_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2156_c11_7295_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2156_c7_0501_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2156_c11_7295_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2156_c7_0501_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2156_c11_7295_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2156_c7_0501_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2156_c11_7295_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2159_c7_e653_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2159_c11_cbc3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_e653_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2159_c11_cbc3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_e653_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2159_c11_cbc3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_e653_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2159_c11_cbc3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_e653_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2159_c11_cbc3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_e653_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2159_c11_cbc3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2159_c7_e653_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2159_c11_cbc3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2159_c7_e653_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2159_c11_cbc3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2168_c7_00e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2168_c11_6a06_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c7_00e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2168_c11_6a06_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2168_c7_00e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2168_c11_6a06_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c7_00e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2168_c11_6a06_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2168_c7_00e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2168_c11_6a06_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_4ae4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_d4a9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_4ae4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_d4a9_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2145_c3_c702_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2145_l2137_l2152_l2160_DUPLICATE_2702_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2160_c3_4b76_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2145_l2137_l2152_l2160_DUPLICATE_2702_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2153_l2138_DUPLICATE_5588_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2145_l2137_l2152_l2160_DUPLICATE_2702_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c2_d461_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2133_l2156_l2128_l2151_l2148_l2144_l2141_l2136_l2159_DUPLICATE_e669_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_f0cf_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2133_l2156_l2128_l2151_l2148_l2144_l2141_l2136_l2159_DUPLICATE_e669_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_e985_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2133_l2156_l2128_l2151_l2148_l2144_l2141_l2136_l2159_DUPLICATE_e669_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_6c3e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2133_l2156_l2128_l2151_l2148_l2144_l2141_l2136_l2159_DUPLICATE_e669_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_2ed0_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2133_l2156_l2128_l2151_l2148_l2144_l2141_l2136_l2159_DUPLICATE_e669_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2148_c7_7c06_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2133_l2156_l2128_l2151_l2148_l2144_l2141_l2136_l2159_DUPLICATE_e669_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_5148_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2133_l2156_l2128_l2151_l2148_l2144_l2141_l2136_l2159_DUPLICATE_e669_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2156_c7_0501_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2133_l2156_l2128_l2151_l2148_l2144_l2141_l2136_l2159_DUPLICATE_e669_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_e653_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2133_l2156_l2128_l2151_l2148_l2144_l2141_l2136_l2159_DUPLICATE_e669_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_f0cf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2133_l2156_l2151_l2148_l2144_l2173_l2141_l2168_l2136_l2159_DUPLICATE_7c02_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_e985_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2133_l2156_l2151_l2148_l2144_l2173_l2141_l2168_l2136_l2159_DUPLICATE_7c02_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_6c3e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2133_l2156_l2151_l2148_l2144_l2173_l2141_l2168_l2136_l2159_DUPLICATE_7c02_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_2ed0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2133_l2156_l2151_l2148_l2144_l2173_l2141_l2168_l2136_l2159_DUPLICATE_7c02_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2148_c7_7c06_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2133_l2156_l2151_l2148_l2144_l2173_l2141_l2168_l2136_l2159_DUPLICATE_7c02_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_5148_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2133_l2156_l2151_l2148_l2144_l2173_l2141_l2168_l2136_l2159_DUPLICATE_7c02_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2156_c7_0501_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2133_l2156_l2151_l2148_l2144_l2173_l2141_l2168_l2136_l2159_DUPLICATE_7c02_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_e653_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2133_l2156_l2151_l2148_l2144_l2173_l2141_l2168_l2136_l2159_DUPLICATE_7c02_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2168_c7_00e2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2133_l2156_l2151_l2148_l2144_l2173_l2141_l2168_l2136_l2159_DUPLICATE_7c02_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_4ae4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2133_l2156_l2151_l2148_l2144_l2173_l2141_l2168_l2136_l2159_DUPLICATE_7c02_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2128_c2_d461_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2133_l2156_l2128_l2151_l2148_l2144_l2141_l2168_l2136_DUPLICATE_a532_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_f0cf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2133_l2156_l2128_l2151_l2148_l2144_l2141_l2168_l2136_DUPLICATE_a532_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_e985_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2133_l2156_l2128_l2151_l2148_l2144_l2141_l2168_l2136_DUPLICATE_a532_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_6c3e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2133_l2156_l2128_l2151_l2148_l2144_l2141_l2168_l2136_DUPLICATE_a532_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_2ed0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2133_l2156_l2128_l2151_l2148_l2144_l2141_l2168_l2136_DUPLICATE_a532_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2148_c7_7c06_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2133_l2156_l2128_l2151_l2148_l2144_l2141_l2168_l2136_DUPLICATE_a532_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_5148_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2133_l2156_l2128_l2151_l2148_l2144_l2141_l2168_l2136_DUPLICATE_a532_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2156_c7_0501_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2133_l2156_l2128_l2151_l2148_l2144_l2141_l2168_l2136_DUPLICATE_a532_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c7_00e2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2133_l2156_l2128_l2151_l2148_l2144_l2141_l2168_l2136_DUPLICATE_a532_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2128_c2_d461_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2133_l2156_l2128_l2151_l2148_l2144_l2173_l2141_l2168_l2136_DUPLICATE_70bf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_f0cf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2133_l2156_l2128_l2151_l2148_l2144_l2173_l2141_l2168_l2136_DUPLICATE_70bf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_e985_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2133_l2156_l2128_l2151_l2148_l2144_l2173_l2141_l2168_l2136_DUPLICATE_70bf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_6c3e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2133_l2156_l2128_l2151_l2148_l2144_l2173_l2141_l2168_l2136_DUPLICATE_70bf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_2ed0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2133_l2156_l2128_l2151_l2148_l2144_l2173_l2141_l2168_l2136_DUPLICATE_70bf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2148_c7_7c06_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2133_l2156_l2128_l2151_l2148_l2144_l2173_l2141_l2168_l2136_DUPLICATE_70bf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_5148_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2133_l2156_l2128_l2151_l2148_l2144_l2173_l2141_l2168_l2136_DUPLICATE_70bf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2156_c7_0501_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2133_l2156_l2128_l2151_l2148_l2144_l2173_l2141_l2168_l2136_DUPLICATE_70bf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2168_c7_00e2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2133_l2156_l2128_l2151_l2148_l2144_l2173_l2141_l2168_l2136_DUPLICATE_70bf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_4ae4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2133_l2156_l2128_l2151_l2148_l2144_l2173_l2141_l2168_l2136_DUPLICATE_70bf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c2_d461_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2133_l2156_l2128_l2151_l2148_l2144_l2141_l2168_l2136_DUPLICATE_9303_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c7_f0cf_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2133_l2156_l2128_l2151_l2148_l2144_l2141_l2168_l2136_DUPLICATE_9303_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2136_c7_e985_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2133_l2156_l2128_l2151_l2148_l2144_l2141_l2168_l2136_DUPLICATE_9303_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_6c3e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2133_l2156_l2128_l2151_l2148_l2144_l2141_l2168_l2136_DUPLICATE_9303_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2144_c7_2ed0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2133_l2156_l2128_l2151_l2148_l2144_l2141_l2168_l2136_DUPLICATE_9303_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2148_c7_7c06_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2133_l2156_l2128_l2151_l2148_l2144_l2141_l2168_l2136_DUPLICATE_9303_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2151_c7_5148_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2133_l2156_l2128_l2151_l2148_l2144_l2141_l2168_l2136_DUPLICATE_9303_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2156_c7_0501_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2133_l2156_l2128_l2151_l2148_l2144_l2141_l2168_l2136_DUPLICATE_9303_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2168_c7_00e2_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2133_l2156_l2128_l2151_l2148_l2144_l2141_l2168_l2136_DUPLICATE_9303_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c7_00e2_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2168_c7_00e2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_e653_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2163_c30_4fb0_return_output;
     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2153_l2138_DUPLICATE_5588 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2153_l2138_DUPLICATE_5588_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2153_l2138_DUPLICATE_5588_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2153_l2138_DUPLICATE_5588_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2153_l2138_DUPLICATE_5588_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2171_c21_9006] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2171_c21_9006_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2171_c31_6182_return_output);

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2168_c7_00e2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c7_00e2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c7_00e2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c7_00e2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c7_00e2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c7_00e2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c7_00e2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c7_00e2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c7_00e2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2173_c7_4ae4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_4ae4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_4ae4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_4ae4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_4ae4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_4ae4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_4ae4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_4ae4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_4ae4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2168_c7_00e2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c7_00e2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c7_00e2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c7_00e2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c7_00e2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c7_00e2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c7_00e2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c7_00e2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c7_00e2_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2145_c3_c702] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2145_c3_c702_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2145_c3_c702_left;
     BIN_OP_OR_uxn_opcodes_h_l2145_c3_c702_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2145_c3_c702_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2145_c3_c702_return_output := BIN_OP_OR_uxn_opcodes_h_l2145_c3_c702_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2159_c7_e653] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_e653_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_e653_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_e653_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_e653_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_e653_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_e653_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_e653_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_e653_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2160_c3_4b76] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2160_c3_4b76_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2160_c3_4b76_left;
     BIN_OP_OR_uxn_opcodes_h_l2160_c3_4b76_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2160_c3_4b76_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2160_c3_4b76_return_output := BIN_OP_OR_uxn_opcodes_h_l2160_c3_4b76_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2173_c7_4ae4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_4ae4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_4ae4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_4ae4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_4ae4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_4ae4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_4ae4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_4ae4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_4ae4_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2128_c1_2978] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2128_c1_2978_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2128_c1_2978_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2128_c1_2978_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2128_c1_2978_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2128_c1_2978_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2128_c1_2978_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2128_c1_2978_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2128_c1_2978_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2144_c7_2ed0_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2145_c3_c702_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2161_c11_7d1d_right := VAR_BIN_OP_OR_uxn_opcodes_h_l2160_c3_4b76_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2159_c7_e653_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2160_c3_4b76_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2168_c7_00e2_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2171_c21_9006_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2151_c7_5148_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2153_l2138_DUPLICATE_5588_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2136_c7_e985_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2153_l2138_DUPLICATE_5588_return_output;
     VAR_printf_uxn_opcodes_h_l2129_c3_a087_uxn_opcodes_h_l2129_c3_a087_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2128_c1_2978_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2168_c7_00e2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_4ae4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_e653_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c7_00e2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2168_c7_00e2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_4ae4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2156_c7_0501_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_e653_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_e653_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c7_00e2_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2159_c7_e653] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_e653_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_e653_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_e653_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_e653_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_e653_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_e653_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_e653_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_e653_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2168_c7_00e2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2168_c7_00e2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2168_c7_00e2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2168_c7_00e2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2168_c7_00e2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2168_c7_00e2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2168_c7_00e2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2168_c7_00e2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2168_c7_00e2_return_output;

     -- printf_uxn_opcodes_h_l2129_c3_a087[uxn_opcodes_h_l2129_c3_a087] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2129_c3_a087_uxn_opcodes_h_l2129_c3_a087_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2129_c3_a087_uxn_opcodes_h_l2129_c3_a087_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_u8_value_MUX[uxn_opcodes_h_l2168_c7_00e2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2168_c7_00e2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2168_c7_00e2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2168_c7_00e2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2168_c7_00e2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2168_c7_00e2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2168_c7_00e2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2168_c7_00e2_return_output := result_u8_value_MUX_uxn_opcodes_h_l2168_c7_00e2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2159_c7_e653] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_e653_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_e653_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_e653_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_e653_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_e653_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_e653_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_e653_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_e653_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2156_c7_0501] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2156_c7_0501_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2156_c7_0501_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2156_c7_0501_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2156_c7_0501_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2156_c7_0501_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2156_c7_0501_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2156_c7_0501_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2156_c7_0501_return_output;

     -- n16_MUX[uxn_opcodes_h_l2159_c7_e653] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2159_c7_e653_cond <= VAR_n16_MUX_uxn_opcodes_h_l2159_c7_e653_cond;
     n16_MUX_uxn_opcodes_h_l2159_c7_e653_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2159_c7_e653_iftrue;
     n16_MUX_uxn_opcodes_h_l2159_c7_e653_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2159_c7_e653_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2159_c7_e653_return_output := n16_MUX_uxn_opcodes_h_l2159_c7_e653_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2168_c7_00e2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2168_c7_00e2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2168_c7_00e2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2168_c7_00e2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2168_c7_00e2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2168_c7_00e2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2168_c7_00e2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2168_c7_00e2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2168_c7_00e2_return_output;

     -- t16_MUX[uxn_opcodes_h_l2144_c7_2ed0] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2144_c7_2ed0_cond <= VAR_t16_MUX_uxn_opcodes_h_l2144_c7_2ed0_cond;
     t16_MUX_uxn_opcodes_h_l2144_c7_2ed0_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2144_c7_2ed0_iftrue;
     t16_MUX_uxn_opcodes_h_l2144_c7_2ed0_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2144_c7_2ed0_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2144_c7_2ed0_return_output := t16_MUX_uxn_opcodes_h_l2144_c7_2ed0_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l2161_c11_7d1d] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2161_c11_7d1d_left <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2161_c11_7d1d_left;
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2161_c11_7d1d_right <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2161_c11_7d1d_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2161_c11_7d1d_return_output := BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2161_c11_7d1d_return_output;

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l2161_c3_e05a := resize(VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2161_c11_7d1d_return_output, 16);
     VAR_n16_MUX_uxn_opcodes_h_l2156_c7_0501_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2159_c7_e653_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_e653_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2168_c7_00e2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2156_c7_0501_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_e653_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_e653_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2168_c7_00e2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_5148_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2156_c7_0501_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2156_c7_0501_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_e653_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2159_c7_e653_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2168_c7_00e2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2141_c7_6c3e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2144_c7_2ed0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2159_c7_e653_iftrue := VAR_tmp16_uxn_opcodes_h_l2161_c3_e05a;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2151_c7_5148] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_5148_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_5148_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_5148_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_5148_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_5148_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_5148_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_5148_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_5148_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2156_c7_0501] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2156_c7_0501_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2156_c7_0501_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2156_c7_0501_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2156_c7_0501_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2156_c7_0501_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2156_c7_0501_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2156_c7_0501_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2156_c7_0501_return_output;

     -- n16_MUX[uxn_opcodes_h_l2156_c7_0501] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2156_c7_0501_cond <= VAR_n16_MUX_uxn_opcodes_h_l2156_c7_0501_cond;
     n16_MUX_uxn_opcodes_h_l2156_c7_0501_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2156_c7_0501_iftrue;
     n16_MUX_uxn_opcodes_h_l2156_c7_0501_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2156_c7_0501_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2156_c7_0501_return_output := n16_MUX_uxn_opcodes_h_l2156_c7_0501_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2156_c7_0501] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2156_c7_0501_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2156_c7_0501_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2156_c7_0501_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2156_c7_0501_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2156_c7_0501_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2156_c7_0501_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2156_c7_0501_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2156_c7_0501_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2159_c7_e653] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_e653_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_e653_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_e653_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_e653_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_e653_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_e653_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_e653_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_e653_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2159_c7_e653] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2159_c7_e653_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2159_c7_e653_cond;
     tmp16_MUX_uxn_opcodes_h_l2159_c7_e653_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2159_c7_e653_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2159_c7_e653_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2159_c7_e653_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2159_c7_e653_return_output := tmp16_MUX_uxn_opcodes_h_l2159_c7_e653_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2159_c7_e653] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_e653_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_e653_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_e653_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_e653_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_e653_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_e653_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_e653_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_e653_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2166_c21_e14b] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2166_c21_e14b_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_tmp16_uxn_opcodes_h_l2161_c3_e05a);

     -- t16_MUX[uxn_opcodes_h_l2141_c7_6c3e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2141_c7_6c3e_cond <= VAR_t16_MUX_uxn_opcodes_h_l2141_c7_6c3e_cond;
     t16_MUX_uxn_opcodes_h_l2141_c7_6c3e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2141_c7_6c3e_iftrue;
     t16_MUX_uxn_opcodes_h_l2141_c7_6c3e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2141_c7_6c3e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2141_c7_6c3e_return_output := t16_MUX_uxn_opcodes_h_l2141_c7_6c3e_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2159_c7_e653_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2166_c21_e14b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2151_c7_5148_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2156_c7_0501_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2156_c7_0501_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_e653_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_5148_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2156_c7_0501_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2156_c7_0501_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_e653_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2148_c7_7c06_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_5148_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_5148_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2156_c7_0501_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2136_c7_e985_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2141_c7_6c3e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2156_c7_0501_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2159_c7_e653_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2156_c7_0501] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2156_c7_0501_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2156_c7_0501_cond;
     tmp16_MUX_uxn_opcodes_h_l2156_c7_0501_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2156_c7_0501_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2156_c7_0501_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2156_c7_0501_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2156_c7_0501_return_output := tmp16_MUX_uxn_opcodes_h_l2156_c7_0501_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2156_c7_0501] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2156_c7_0501_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2156_c7_0501_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2156_c7_0501_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2156_c7_0501_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2156_c7_0501_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2156_c7_0501_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2156_c7_0501_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2156_c7_0501_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2159_c7_e653] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2159_c7_e653_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2159_c7_e653_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2159_c7_e653_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2159_c7_e653_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2159_c7_e653_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2159_c7_e653_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2159_c7_e653_return_output := result_u8_value_MUX_uxn_opcodes_h_l2159_c7_e653_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2151_c7_5148] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_5148_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_5148_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_5148_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_5148_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_5148_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_5148_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_5148_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_5148_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2156_c7_0501] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2156_c7_0501_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2156_c7_0501_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2156_c7_0501_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2156_c7_0501_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2156_c7_0501_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2156_c7_0501_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2156_c7_0501_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2156_c7_0501_return_output;

     -- n16_MUX[uxn_opcodes_h_l2151_c7_5148] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2151_c7_5148_cond <= VAR_n16_MUX_uxn_opcodes_h_l2151_c7_5148_cond;
     n16_MUX_uxn_opcodes_h_l2151_c7_5148_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2151_c7_5148_iftrue;
     n16_MUX_uxn_opcodes_h_l2151_c7_5148_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2151_c7_5148_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2151_c7_5148_return_output := n16_MUX_uxn_opcodes_h_l2151_c7_5148_return_output;

     -- t16_MUX[uxn_opcodes_h_l2136_c7_e985] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2136_c7_e985_cond <= VAR_t16_MUX_uxn_opcodes_h_l2136_c7_e985_cond;
     t16_MUX_uxn_opcodes_h_l2136_c7_e985_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2136_c7_e985_iftrue;
     t16_MUX_uxn_opcodes_h_l2136_c7_e985_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2136_c7_e985_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2136_c7_e985_return_output := t16_MUX_uxn_opcodes_h_l2136_c7_e985_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2151_c7_5148] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_5148_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_5148_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_5148_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_5148_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_5148_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_5148_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_5148_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_5148_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2148_c7_7c06] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2148_c7_7c06_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2148_c7_7c06_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2148_c7_7c06_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2148_c7_7c06_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2148_c7_7c06_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2148_c7_7c06_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2148_c7_7c06_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2148_c7_7c06_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2148_c7_7c06_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2151_c7_5148_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_5148_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2156_c7_0501_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2148_c7_7c06_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_5148_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_5148_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2156_c7_0501_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_2ed0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2148_c7_7c06_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2148_c7_7c06_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_5148_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2156_c7_0501_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2159_c7_e653_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2133_c7_f0cf_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2136_c7_e985_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2151_c7_5148_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2156_c7_0501_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2151_c7_5148] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2151_c7_5148_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2151_c7_5148_cond;
     tmp16_MUX_uxn_opcodes_h_l2151_c7_5148_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2151_c7_5148_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2151_c7_5148_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2151_c7_5148_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2151_c7_5148_return_output := tmp16_MUX_uxn_opcodes_h_l2151_c7_5148_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2151_c7_5148] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_5148_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_5148_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_5148_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_5148_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_5148_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_5148_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_5148_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_5148_return_output;

     -- t16_MUX[uxn_opcodes_h_l2133_c7_f0cf] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2133_c7_f0cf_cond <= VAR_t16_MUX_uxn_opcodes_h_l2133_c7_f0cf_cond;
     t16_MUX_uxn_opcodes_h_l2133_c7_f0cf_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2133_c7_f0cf_iftrue;
     t16_MUX_uxn_opcodes_h_l2133_c7_f0cf_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2133_c7_f0cf_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2133_c7_f0cf_return_output := t16_MUX_uxn_opcodes_h_l2133_c7_f0cf_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2148_c7_7c06] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2148_c7_7c06_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2148_c7_7c06_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2148_c7_7c06_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2148_c7_7c06_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2148_c7_7c06_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2148_c7_7c06_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2148_c7_7c06_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2148_c7_7c06_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2156_c7_0501] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2156_c7_0501_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2156_c7_0501_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2156_c7_0501_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2156_c7_0501_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2156_c7_0501_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2156_c7_0501_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2156_c7_0501_return_output := result_u8_value_MUX_uxn_opcodes_h_l2156_c7_0501_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2151_c7_5148] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_5148_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_5148_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_5148_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_5148_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_5148_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_5148_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_5148_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_5148_return_output;

     -- n16_MUX[uxn_opcodes_h_l2148_c7_7c06] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2148_c7_7c06_cond <= VAR_n16_MUX_uxn_opcodes_h_l2148_c7_7c06_cond;
     n16_MUX_uxn_opcodes_h_l2148_c7_7c06_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2148_c7_7c06_iftrue;
     n16_MUX_uxn_opcodes_h_l2148_c7_7c06_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2148_c7_7c06_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2148_c7_7c06_return_output := n16_MUX_uxn_opcodes_h_l2148_c7_7c06_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2144_c7_2ed0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_2ed0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_2ed0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_2ed0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_2ed0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_2ed0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_2ed0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_2ed0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_2ed0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2148_c7_7c06] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2148_c7_7c06_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2148_c7_7c06_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2148_c7_7c06_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2148_c7_7c06_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2148_c7_7c06_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2148_c7_7c06_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2148_c7_7c06_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2148_c7_7c06_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2144_c7_2ed0_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2148_c7_7c06_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2148_c7_7c06_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_5148_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_2ed0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2148_c7_7c06_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2148_c7_7c06_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_5148_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_6c3e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_2ed0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_2ed0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2148_c7_7c06_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2151_c7_5148_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2156_c7_0501_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2128_c2_d461_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2133_c7_f0cf_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2148_c7_7c06_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2151_c7_5148_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2148_c7_7c06] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2148_c7_7c06_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2148_c7_7c06_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2148_c7_7c06_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2148_c7_7c06_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2148_c7_7c06_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2148_c7_7c06_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2148_c7_7c06_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2148_c7_7c06_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2144_c7_2ed0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_2ed0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_2ed0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_2ed0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_2ed0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_2ed0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_2ed0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_2ed0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_2ed0_return_output;

     -- t16_MUX[uxn_opcodes_h_l2128_c2_d461] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2128_c2_d461_cond <= VAR_t16_MUX_uxn_opcodes_h_l2128_c2_d461_cond;
     t16_MUX_uxn_opcodes_h_l2128_c2_d461_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2128_c2_d461_iftrue;
     t16_MUX_uxn_opcodes_h_l2128_c2_d461_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2128_c2_d461_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2128_c2_d461_return_output := t16_MUX_uxn_opcodes_h_l2128_c2_d461_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2148_c7_7c06] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2148_c7_7c06_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2148_c7_7c06_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2148_c7_7c06_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2148_c7_7c06_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2148_c7_7c06_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2148_c7_7c06_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2148_c7_7c06_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2148_c7_7c06_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2144_c7_2ed0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_2ed0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_2ed0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_2ed0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_2ed0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_2ed0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_2ed0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_2ed0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_2ed0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2151_c7_5148] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2151_c7_5148_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2151_c7_5148_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2151_c7_5148_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2151_c7_5148_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2151_c7_5148_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2151_c7_5148_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2151_c7_5148_return_output := result_u8_value_MUX_uxn_opcodes_h_l2151_c7_5148_return_output;

     -- n16_MUX[uxn_opcodes_h_l2144_c7_2ed0] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2144_c7_2ed0_cond <= VAR_n16_MUX_uxn_opcodes_h_l2144_c7_2ed0_cond;
     n16_MUX_uxn_opcodes_h_l2144_c7_2ed0_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2144_c7_2ed0_iftrue;
     n16_MUX_uxn_opcodes_h_l2144_c7_2ed0_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2144_c7_2ed0_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2144_c7_2ed0_return_output := n16_MUX_uxn_opcodes_h_l2144_c7_2ed0_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2148_c7_7c06] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2148_c7_7c06_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2148_c7_7c06_cond;
     tmp16_MUX_uxn_opcodes_h_l2148_c7_7c06_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2148_c7_7c06_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2148_c7_7c06_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2148_c7_7c06_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2148_c7_7c06_return_output := tmp16_MUX_uxn_opcodes_h_l2148_c7_7c06_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2141_c7_6c3e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_6c3e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_6c3e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_6c3e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_6c3e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_6c3e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_6c3e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_6c3e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_6c3e_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2141_c7_6c3e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2144_c7_2ed0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_2ed0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2148_c7_7c06_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_6c3e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_2ed0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_2ed0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2148_c7_7c06_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_e985_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_6c3e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_6c3e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_2ed0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2148_c7_7c06_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2151_c7_5148_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2128_c2_d461_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2144_c7_2ed0_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2148_c7_7c06_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2136_c7_e985] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_e985_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_e985_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_e985_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_e985_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_e985_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_e985_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_e985_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_e985_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2141_c7_6c3e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_6c3e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_6c3e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_6c3e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_6c3e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_6c3e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_6c3e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_6c3e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_6c3e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2148_c7_7c06] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2148_c7_7c06_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2148_c7_7c06_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2148_c7_7c06_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2148_c7_7c06_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2148_c7_7c06_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2148_c7_7c06_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2148_c7_7c06_return_output := result_u8_value_MUX_uxn_opcodes_h_l2148_c7_7c06_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2141_c7_6c3e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_6c3e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_6c3e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_6c3e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_6c3e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_6c3e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_6c3e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_6c3e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_6c3e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2144_c7_2ed0] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2144_c7_2ed0_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2144_c7_2ed0_cond;
     tmp16_MUX_uxn_opcodes_h_l2144_c7_2ed0_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2144_c7_2ed0_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2144_c7_2ed0_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2144_c7_2ed0_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2144_c7_2ed0_return_output := tmp16_MUX_uxn_opcodes_h_l2144_c7_2ed0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2144_c7_2ed0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_2ed0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_2ed0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_2ed0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_2ed0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_2ed0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_2ed0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_2ed0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_2ed0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2144_c7_2ed0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_2ed0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_2ed0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_2ed0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_2ed0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_2ed0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_2ed0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_2ed0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_2ed0_return_output;

     -- n16_MUX[uxn_opcodes_h_l2141_c7_6c3e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2141_c7_6c3e_cond <= VAR_n16_MUX_uxn_opcodes_h_l2141_c7_6c3e_cond;
     n16_MUX_uxn_opcodes_h_l2141_c7_6c3e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2141_c7_6c3e_iftrue;
     n16_MUX_uxn_opcodes_h_l2141_c7_6c3e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2141_c7_6c3e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2141_c7_6c3e_return_output := n16_MUX_uxn_opcodes_h_l2141_c7_6c3e_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l2136_c7_e985_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2141_c7_6c3e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_6c3e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_2ed0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_e985_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_6c3e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_6c3e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_2ed0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_f0cf_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_e985_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_e985_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_6c3e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2144_c7_2ed0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2148_c7_7c06_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_6c3e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2144_c7_2ed0_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2133_c7_f0cf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_f0cf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_f0cf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_f0cf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_f0cf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_f0cf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_f0cf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_f0cf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_f0cf_return_output;

     -- n16_MUX[uxn_opcodes_h_l2136_c7_e985] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2136_c7_e985_cond <= VAR_n16_MUX_uxn_opcodes_h_l2136_c7_e985_cond;
     n16_MUX_uxn_opcodes_h_l2136_c7_e985_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2136_c7_e985_iftrue;
     n16_MUX_uxn_opcodes_h_l2136_c7_e985_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2136_c7_e985_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2136_c7_e985_return_output := n16_MUX_uxn_opcodes_h_l2136_c7_e985_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2141_c7_6c3e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2141_c7_6c3e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_6c3e_cond;
     tmp16_MUX_uxn_opcodes_h_l2141_c7_6c3e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_6c3e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2141_c7_6c3e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_6c3e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_6c3e_return_output := tmp16_MUX_uxn_opcodes_h_l2141_c7_6c3e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2144_c7_2ed0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2144_c7_2ed0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2144_c7_2ed0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2144_c7_2ed0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2144_c7_2ed0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2144_c7_2ed0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2144_c7_2ed0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2144_c7_2ed0_return_output := result_u8_value_MUX_uxn_opcodes_h_l2144_c7_2ed0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2136_c7_e985] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_e985_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_e985_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_e985_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_e985_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_e985_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_e985_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_e985_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_e985_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2141_c7_6c3e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_6c3e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_6c3e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_6c3e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_6c3e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_6c3e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_6c3e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_6c3e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_6c3e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2136_c7_e985] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_e985_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_e985_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_e985_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_e985_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_e985_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_e985_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_e985_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_e985_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2141_c7_6c3e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_6c3e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_6c3e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_6c3e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_6c3e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_6c3e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_6c3e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_6c3e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_6c3e_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l2133_c7_f0cf_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2136_c7_e985_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_e985_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_6c3e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_f0cf_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_e985_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_e985_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_6c3e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c2_d461_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c7_f0cf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_f0cf_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_e985_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_6c3e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2144_c7_2ed0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2136_c7_e985_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_6c3e_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2128_c2_d461] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c2_d461_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c2_d461_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c2_d461_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c2_d461_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c2_d461_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c2_d461_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c2_d461_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c2_d461_return_output;

     -- n16_MUX[uxn_opcodes_h_l2133_c7_f0cf] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2133_c7_f0cf_cond <= VAR_n16_MUX_uxn_opcodes_h_l2133_c7_f0cf_cond;
     n16_MUX_uxn_opcodes_h_l2133_c7_f0cf_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2133_c7_f0cf_iftrue;
     n16_MUX_uxn_opcodes_h_l2133_c7_f0cf_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2133_c7_f0cf_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2133_c7_f0cf_return_output := n16_MUX_uxn_opcodes_h_l2133_c7_f0cf_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2136_c7_e985] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2136_c7_e985_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2136_c7_e985_cond;
     tmp16_MUX_uxn_opcodes_h_l2136_c7_e985_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2136_c7_e985_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2136_c7_e985_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2136_c7_e985_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2136_c7_e985_return_output := tmp16_MUX_uxn_opcodes_h_l2136_c7_e985_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2136_c7_e985] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_e985_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_e985_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_e985_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_e985_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_e985_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_e985_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_e985_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_e985_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2136_c7_e985] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_e985_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_e985_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_e985_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_e985_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_e985_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_e985_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_e985_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_e985_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2141_c7_6c3e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2141_c7_6c3e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_6c3e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2141_c7_6c3e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_6c3e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2141_c7_6c3e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_6c3e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_6c3e_return_output := result_u8_value_MUX_uxn_opcodes_h_l2141_c7_6c3e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2133_c7_f0cf] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_f0cf_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_f0cf_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_f0cf_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_f0cf_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_f0cf_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_f0cf_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_f0cf_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_f0cf_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2133_c7_f0cf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_f0cf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_f0cf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_f0cf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_f0cf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_f0cf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_f0cf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_f0cf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_f0cf_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l2128_c2_d461_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2133_c7_f0cf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_f0cf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_e985_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2128_c2_d461_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c7_f0cf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_f0cf_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_e985_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c2_d461_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c7_f0cf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2136_c7_e985_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_6c3e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2133_c7_f0cf_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2136_c7_e985_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2133_c7_f0cf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_f0cf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_f0cf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_f0cf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_f0cf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_f0cf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_f0cf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_f0cf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_f0cf_return_output;

     -- n16_MUX[uxn_opcodes_h_l2128_c2_d461] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2128_c2_d461_cond <= VAR_n16_MUX_uxn_opcodes_h_l2128_c2_d461_cond;
     n16_MUX_uxn_opcodes_h_l2128_c2_d461_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2128_c2_d461_iftrue;
     n16_MUX_uxn_opcodes_h_l2128_c2_d461_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2128_c2_d461_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2128_c2_d461_return_output := n16_MUX_uxn_opcodes_h_l2128_c2_d461_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2133_c7_f0cf] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2133_c7_f0cf_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2133_c7_f0cf_cond;
     tmp16_MUX_uxn_opcodes_h_l2133_c7_f0cf_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2133_c7_f0cf_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2133_c7_f0cf_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2133_c7_f0cf_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2133_c7_f0cf_return_output := tmp16_MUX_uxn_opcodes_h_l2133_c7_f0cf_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2128_c2_d461] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c2_d461_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c2_d461_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c2_d461_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c2_d461_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c2_d461_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c2_d461_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c2_d461_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c2_d461_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2133_c7_f0cf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_f0cf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_f0cf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_f0cf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_f0cf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_f0cf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_f0cf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_f0cf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_f0cf_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2128_c2_d461] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2128_c2_d461_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2128_c2_d461_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2128_c2_d461_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2128_c2_d461_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2128_c2_d461_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2128_c2_d461_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2128_c2_d461_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2128_c2_d461_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2136_c7_e985] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2136_c7_e985_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2136_c7_e985_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2136_c7_e985_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2136_c7_e985_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2136_c7_e985_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2136_c7_e985_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2136_c7_e985_return_output := result_u8_value_MUX_uxn_opcodes_h_l2136_c7_e985_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2128_c2_d461_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c2_d461_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c7_f0cf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2128_c2_d461_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c7_f0cf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c7_f0cf_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2136_c7_e985_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2128_c2_d461_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2133_c7_f0cf_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2128_c2_d461] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2128_c2_d461_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2128_c2_d461_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2128_c2_d461_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2128_c2_d461_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2128_c2_d461_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2128_c2_d461_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2128_c2_d461_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2128_c2_d461_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2133_c7_f0cf] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2133_c7_f0cf_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c7_f0cf_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2133_c7_f0cf_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c7_f0cf_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2133_c7_f0cf_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c7_f0cf_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c7_f0cf_return_output := result_u8_value_MUX_uxn_opcodes_h_l2133_c7_f0cf_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2128_c2_d461] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2128_c2_d461_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2128_c2_d461_cond;
     tmp16_MUX_uxn_opcodes_h_l2128_c2_d461_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2128_c2_d461_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2128_c2_d461_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2128_c2_d461_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2128_c2_d461_return_output := tmp16_MUX_uxn_opcodes_h_l2128_c2_d461_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2128_c2_d461] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2128_c2_d461_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c2_d461_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2128_c2_d461_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c2_d461_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2128_c2_d461_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c2_d461_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c2_d461_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2128_c2_d461_return_output;

     -- Submodule level 12
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c2_d461_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c7_f0cf_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2128_c2_d461_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2128_c2_d461] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2128_c2_d461_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c2_d461_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2128_c2_d461_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c2_d461_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2128_c2_d461_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c2_d461_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c2_d461_return_output := result_u8_value_MUX_uxn_opcodes_h_l2128_c2_d461_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l2124_l2178_DUPLICATE_7217 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l2124_l2178_DUPLICATE_7217_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_8cda(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c2_d461_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c2_d461_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2128_c2_d461_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c2_d461_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2128_c2_d461_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c2_d461_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l2124_l2178_DUPLICATE_7217_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l2124_l2178_DUPLICATE_7217_return_output;
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
