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
-- BIN_OP_EQ[uxn_opcodes_h_l2133_c6_50db]
signal BIN_OP_EQ_uxn_opcodes_h_l2133_c6_50db_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2133_c6_50db_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2133_c6_50db_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2133_c1_5432]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_5432_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_5432_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_5432_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_5432_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2133_c2_b3b4]
signal t8_MUX_uxn_opcodes_h_l2133_c2_b3b4_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2133_c2_b3b4_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2133_c2_b3b4_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2133_c2_b3b4_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l2133_c2_b3b4]
signal n16_MUX_uxn_opcodes_h_l2133_c2_b3b4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2133_c2_b3b4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2133_c2_b3b4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2133_c2_b3b4_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2133_c2_b3b4]
signal result_u8_value_MUX_uxn_opcodes_h_l2133_c2_b3b4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2133_c2_b3b4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2133_c2_b3b4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2133_c2_b3b4_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2133_c2_b3b4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_b3b4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_b3b4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_b3b4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_b3b4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2133_c2_b3b4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_b3b4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_b3b4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_b3b4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_b3b4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2133_c2_b3b4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_b3b4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_b3b4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_b3b4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_b3b4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2133_c2_b3b4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_b3b4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_b3b4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_b3b4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_b3b4_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2133_c2_b3b4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_b3b4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_b3b4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_b3b4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_b3b4_return_output : signed(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2133_c2_b3b4]
signal tmp16_MUX_uxn_opcodes_h_l2133_c2_b3b4_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2133_c2_b3b4_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2133_c2_b3b4_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2133_c2_b3b4_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2134_c3_42da[uxn_opcodes_h_l2134_c3_42da]
signal printf_uxn_opcodes_h_l2134_c3_42da_uxn_opcodes_h_l2134_c3_42da_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2138_c11_7294]
signal BIN_OP_EQ_uxn_opcodes_h_l2138_c11_7294_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2138_c11_7294_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2138_c11_7294_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2138_c7_7da7]
signal t8_MUX_uxn_opcodes_h_l2138_c7_7da7_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2138_c7_7da7_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2138_c7_7da7_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2138_c7_7da7_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l2138_c7_7da7]
signal n16_MUX_uxn_opcodes_h_l2138_c7_7da7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2138_c7_7da7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2138_c7_7da7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2138_c7_7da7_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2138_c7_7da7]
signal result_u8_value_MUX_uxn_opcodes_h_l2138_c7_7da7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2138_c7_7da7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2138_c7_7da7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2138_c7_7da7_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2138_c7_7da7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_7da7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_7da7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_7da7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_7da7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2138_c7_7da7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_7da7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_7da7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_7da7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_7da7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2138_c7_7da7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_7da7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_7da7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_7da7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_7da7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2138_c7_7da7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_7da7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_7da7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_7da7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_7da7_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2138_c7_7da7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_7da7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_7da7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_7da7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_7da7_return_output : signed(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2138_c7_7da7]
signal tmp16_MUX_uxn_opcodes_h_l2138_c7_7da7_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2138_c7_7da7_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2138_c7_7da7_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2138_c7_7da7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2141_c11_d23e]
signal BIN_OP_EQ_uxn_opcodes_h_l2141_c11_d23e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2141_c11_d23e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2141_c11_d23e_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2141_c7_43dd]
signal t8_MUX_uxn_opcodes_h_l2141_c7_43dd_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2141_c7_43dd_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2141_c7_43dd_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2141_c7_43dd_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l2141_c7_43dd]
signal n16_MUX_uxn_opcodes_h_l2141_c7_43dd_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2141_c7_43dd_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2141_c7_43dd_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2141_c7_43dd_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2141_c7_43dd]
signal result_u8_value_MUX_uxn_opcodes_h_l2141_c7_43dd_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2141_c7_43dd_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2141_c7_43dd_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2141_c7_43dd_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2141_c7_43dd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_43dd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_43dd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_43dd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_43dd_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2141_c7_43dd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_43dd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_43dd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_43dd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_43dd_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2141_c7_43dd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_43dd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_43dd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_43dd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_43dd_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2141_c7_43dd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_43dd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_43dd_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_43dd_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_43dd_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2141_c7_43dd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_43dd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_43dd_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_43dd_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_43dd_return_output : signed(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2141_c7_43dd]
signal tmp16_MUX_uxn_opcodes_h_l2141_c7_43dd_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2141_c7_43dd_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2141_c7_43dd_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2141_c7_43dd_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2145_c11_27a2]
signal BIN_OP_EQ_uxn_opcodes_h_l2145_c11_27a2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2145_c11_27a2_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2145_c11_27a2_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2145_c7_8ec4]
signal n16_MUX_uxn_opcodes_h_l2145_c7_8ec4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2145_c7_8ec4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2145_c7_8ec4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2145_c7_8ec4_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2145_c7_8ec4]
signal result_u8_value_MUX_uxn_opcodes_h_l2145_c7_8ec4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2145_c7_8ec4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2145_c7_8ec4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2145_c7_8ec4_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2145_c7_8ec4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_8ec4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_8ec4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_8ec4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_8ec4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2145_c7_8ec4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_8ec4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_8ec4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_8ec4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_8ec4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2145_c7_8ec4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_8ec4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_8ec4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_8ec4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_8ec4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2145_c7_8ec4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_8ec4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_8ec4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_8ec4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_8ec4_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2145_c7_8ec4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_8ec4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_8ec4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_8ec4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_8ec4_return_output : signed(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2145_c7_8ec4]
signal tmp16_MUX_uxn_opcodes_h_l2145_c7_8ec4_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2145_c7_8ec4_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2145_c7_8ec4_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2145_c7_8ec4_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2147_c3_5f55]
signal CONST_SL_8_uxn_opcodes_h_l2147_c3_5f55_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2147_c3_5f55_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2149_c11_ce64]
signal BIN_OP_EQ_uxn_opcodes_h_l2149_c11_ce64_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2149_c11_ce64_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2149_c11_ce64_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2149_c7_776f]
signal n16_MUX_uxn_opcodes_h_l2149_c7_776f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2149_c7_776f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2149_c7_776f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2149_c7_776f_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2149_c7_776f]
signal result_u8_value_MUX_uxn_opcodes_h_l2149_c7_776f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2149_c7_776f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2149_c7_776f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2149_c7_776f_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2149_c7_776f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_776f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_776f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_776f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_776f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2149_c7_776f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_776f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_776f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_776f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_776f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2149_c7_776f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_776f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_776f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_776f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_776f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2149_c7_776f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_776f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_776f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_776f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_776f_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2149_c7_776f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_776f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_776f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_776f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_776f_return_output : signed(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2149_c7_776f]
signal tmp16_MUX_uxn_opcodes_h_l2149_c7_776f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2149_c7_776f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2149_c7_776f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2149_c7_776f_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2150_c3_611b]
signal BIN_OP_OR_uxn_opcodes_h_l2150_c3_611b_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2150_c3_611b_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2150_c3_611b_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2152_c30_b14e]
signal sp_relative_shift_uxn_opcodes_h_l2152_c30_b14e_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2152_c30_b14e_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2152_c30_b14e_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2152_c30_b14e_return_output : signed(3 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2153_c20_86dc]
signal BIN_OP_AND_uxn_opcodes_h_l2153_c20_86dc_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2153_c20_86dc_right : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2153_c20_86dc_return_output : unsigned(7 downto 0);

-- BIN_OP_SR[uxn_opcodes_h_l2153_c12_c1ef]
signal BIN_OP_SR_uxn_opcodes_h_l2153_c12_c1ef_left : unsigned(15 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2153_c12_c1ef_right : unsigned(7 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2153_c12_c1ef_return_output : unsigned(15 downto 0);

-- CONST_SR_4[uxn_opcodes_h_l2153_c36_265f]
signal CONST_SR_4_uxn_opcodes_h_l2153_c36_265f_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_opcodes_h_l2153_c36_265f_return_output : unsigned(7 downto 0);

-- BIN_OP_SL[uxn_opcodes_h_l2153_c12_d9a8]
signal BIN_OP_SL_uxn_opcodes_h_l2153_c12_d9a8_left : unsigned(15 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2153_c12_d9a8_right : unsigned(7 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2153_c12_d9a8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2158_c11_6a21]
signal BIN_OP_EQ_uxn_opcodes_h_l2158_c11_6a21_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2158_c11_6a21_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2158_c11_6a21_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2158_c7_5cf7]
signal result_u8_value_MUX_uxn_opcodes_h_l2158_c7_5cf7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2158_c7_5cf7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2158_c7_5cf7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2158_c7_5cf7_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2158_c7_5cf7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_5cf7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_5cf7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_5cf7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_5cf7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2158_c7_5cf7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_5cf7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_5cf7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_5cf7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_5cf7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2158_c7_5cf7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_5cf7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_5cf7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_5cf7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_5cf7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2158_c7_5cf7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_5cf7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_5cf7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_5cf7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_5cf7_return_output : unsigned(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2161_c31_7a3a]
signal CONST_SR_8_uxn_opcodes_h_l2161_c31_7a3a_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2161_c31_7a3a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2163_c11_50af]
signal BIN_OP_EQ_uxn_opcodes_h_l2163_c11_50af_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2163_c11_50af_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2163_c11_50af_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2163_c7_f846]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_f846_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_f846_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_f846_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_f846_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2163_c7_f846]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_f846_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_f846_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_f846_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_f846_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2133_c6_50db
BIN_OP_EQ_uxn_opcodes_h_l2133_c6_50db : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2133_c6_50db_left,
BIN_OP_EQ_uxn_opcodes_h_l2133_c6_50db_right,
BIN_OP_EQ_uxn_opcodes_h_l2133_c6_50db_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_5432
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_5432 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_5432_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_5432_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_5432_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_5432_return_output);

-- t8_MUX_uxn_opcodes_h_l2133_c2_b3b4
t8_MUX_uxn_opcodes_h_l2133_c2_b3b4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2133_c2_b3b4_cond,
t8_MUX_uxn_opcodes_h_l2133_c2_b3b4_iftrue,
t8_MUX_uxn_opcodes_h_l2133_c2_b3b4_iffalse,
t8_MUX_uxn_opcodes_h_l2133_c2_b3b4_return_output);

-- n16_MUX_uxn_opcodes_h_l2133_c2_b3b4
n16_MUX_uxn_opcodes_h_l2133_c2_b3b4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2133_c2_b3b4_cond,
n16_MUX_uxn_opcodes_h_l2133_c2_b3b4_iftrue,
n16_MUX_uxn_opcodes_h_l2133_c2_b3b4_iffalse,
n16_MUX_uxn_opcodes_h_l2133_c2_b3b4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2133_c2_b3b4
result_u8_value_MUX_uxn_opcodes_h_l2133_c2_b3b4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2133_c2_b3b4_cond,
result_u8_value_MUX_uxn_opcodes_h_l2133_c2_b3b4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2133_c2_b3b4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2133_c2_b3b4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_b3b4
result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_b3b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_b3b4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_b3b4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_b3b4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_b3b4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_b3b4
result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_b3b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_b3b4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_b3b4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_b3b4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_b3b4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_b3b4
result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_b3b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_b3b4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_b3b4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_b3b4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_b3b4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_b3b4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_b3b4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_b3b4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_b3b4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_b3b4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_b3b4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_b3b4
result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_b3b4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_b3b4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_b3b4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_b3b4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_b3b4_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2133_c2_b3b4
tmp16_MUX_uxn_opcodes_h_l2133_c2_b3b4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2133_c2_b3b4_cond,
tmp16_MUX_uxn_opcodes_h_l2133_c2_b3b4_iftrue,
tmp16_MUX_uxn_opcodes_h_l2133_c2_b3b4_iffalse,
tmp16_MUX_uxn_opcodes_h_l2133_c2_b3b4_return_output);

-- printf_uxn_opcodes_h_l2134_c3_42da_uxn_opcodes_h_l2134_c3_42da
printf_uxn_opcodes_h_l2134_c3_42da_uxn_opcodes_h_l2134_c3_42da : entity work.printf_uxn_opcodes_h_l2134_c3_42da_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2134_c3_42da_uxn_opcodes_h_l2134_c3_42da_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2138_c11_7294
BIN_OP_EQ_uxn_opcodes_h_l2138_c11_7294 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2138_c11_7294_left,
BIN_OP_EQ_uxn_opcodes_h_l2138_c11_7294_right,
BIN_OP_EQ_uxn_opcodes_h_l2138_c11_7294_return_output);

-- t8_MUX_uxn_opcodes_h_l2138_c7_7da7
t8_MUX_uxn_opcodes_h_l2138_c7_7da7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2138_c7_7da7_cond,
t8_MUX_uxn_opcodes_h_l2138_c7_7da7_iftrue,
t8_MUX_uxn_opcodes_h_l2138_c7_7da7_iffalse,
t8_MUX_uxn_opcodes_h_l2138_c7_7da7_return_output);

-- n16_MUX_uxn_opcodes_h_l2138_c7_7da7
n16_MUX_uxn_opcodes_h_l2138_c7_7da7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2138_c7_7da7_cond,
n16_MUX_uxn_opcodes_h_l2138_c7_7da7_iftrue,
n16_MUX_uxn_opcodes_h_l2138_c7_7da7_iffalse,
n16_MUX_uxn_opcodes_h_l2138_c7_7da7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2138_c7_7da7
result_u8_value_MUX_uxn_opcodes_h_l2138_c7_7da7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2138_c7_7da7_cond,
result_u8_value_MUX_uxn_opcodes_h_l2138_c7_7da7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2138_c7_7da7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2138_c7_7da7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_7da7
result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_7da7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_7da7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_7da7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_7da7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_7da7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_7da7
result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_7da7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_7da7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_7da7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_7da7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_7da7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_7da7
result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_7da7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_7da7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_7da7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_7da7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_7da7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_7da7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_7da7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_7da7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_7da7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_7da7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_7da7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_7da7
result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_7da7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_7da7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_7da7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_7da7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_7da7_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2138_c7_7da7
tmp16_MUX_uxn_opcodes_h_l2138_c7_7da7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2138_c7_7da7_cond,
tmp16_MUX_uxn_opcodes_h_l2138_c7_7da7_iftrue,
tmp16_MUX_uxn_opcodes_h_l2138_c7_7da7_iffalse,
tmp16_MUX_uxn_opcodes_h_l2138_c7_7da7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2141_c11_d23e
BIN_OP_EQ_uxn_opcodes_h_l2141_c11_d23e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2141_c11_d23e_left,
BIN_OP_EQ_uxn_opcodes_h_l2141_c11_d23e_right,
BIN_OP_EQ_uxn_opcodes_h_l2141_c11_d23e_return_output);

-- t8_MUX_uxn_opcodes_h_l2141_c7_43dd
t8_MUX_uxn_opcodes_h_l2141_c7_43dd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2141_c7_43dd_cond,
t8_MUX_uxn_opcodes_h_l2141_c7_43dd_iftrue,
t8_MUX_uxn_opcodes_h_l2141_c7_43dd_iffalse,
t8_MUX_uxn_opcodes_h_l2141_c7_43dd_return_output);

-- n16_MUX_uxn_opcodes_h_l2141_c7_43dd
n16_MUX_uxn_opcodes_h_l2141_c7_43dd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2141_c7_43dd_cond,
n16_MUX_uxn_opcodes_h_l2141_c7_43dd_iftrue,
n16_MUX_uxn_opcodes_h_l2141_c7_43dd_iffalse,
n16_MUX_uxn_opcodes_h_l2141_c7_43dd_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2141_c7_43dd
result_u8_value_MUX_uxn_opcodes_h_l2141_c7_43dd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2141_c7_43dd_cond,
result_u8_value_MUX_uxn_opcodes_h_l2141_c7_43dd_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2141_c7_43dd_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2141_c7_43dd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_43dd
result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_43dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_43dd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_43dd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_43dd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_43dd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_43dd
result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_43dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_43dd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_43dd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_43dd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_43dd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_43dd
result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_43dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_43dd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_43dd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_43dd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_43dd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_43dd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_43dd : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_43dd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_43dd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_43dd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_43dd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_43dd
result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_43dd : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_43dd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_43dd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_43dd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_43dd_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2141_c7_43dd
tmp16_MUX_uxn_opcodes_h_l2141_c7_43dd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2141_c7_43dd_cond,
tmp16_MUX_uxn_opcodes_h_l2141_c7_43dd_iftrue,
tmp16_MUX_uxn_opcodes_h_l2141_c7_43dd_iffalse,
tmp16_MUX_uxn_opcodes_h_l2141_c7_43dd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2145_c11_27a2
BIN_OP_EQ_uxn_opcodes_h_l2145_c11_27a2 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2145_c11_27a2_left,
BIN_OP_EQ_uxn_opcodes_h_l2145_c11_27a2_right,
BIN_OP_EQ_uxn_opcodes_h_l2145_c11_27a2_return_output);

-- n16_MUX_uxn_opcodes_h_l2145_c7_8ec4
n16_MUX_uxn_opcodes_h_l2145_c7_8ec4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2145_c7_8ec4_cond,
n16_MUX_uxn_opcodes_h_l2145_c7_8ec4_iftrue,
n16_MUX_uxn_opcodes_h_l2145_c7_8ec4_iffalse,
n16_MUX_uxn_opcodes_h_l2145_c7_8ec4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2145_c7_8ec4
result_u8_value_MUX_uxn_opcodes_h_l2145_c7_8ec4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2145_c7_8ec4_cond,
result_u8_value_MUX_uxn_opcodes_h_l2145_c7_8ec4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2145_c7_8ec4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2145_c7_8ec4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_8ec4
result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_8ec4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_8ec4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_8ec4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_8ec4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_8ec4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_8ec4
result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_8ec4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_8ec4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_8ec4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_8ec4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_8ec4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_8ec4
result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_8ec4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_8ec4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_8ec4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_8ec4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_8ec4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_8ec4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_8ec4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_8ec4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_8ec4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_8ec4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_8ec4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_8ec4
result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_8ec4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_8ec4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_8ec4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_8ec4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_8ec4_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2145_c7_8ec4
tmp16_MUX_uxn_opcodes_h_l2145_c7_8ec4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2145_c7_8ec4_cond,
tmp16_MUX_uxn_opcodes_h_l2145_c7_8ec4_iftrue,
tmp16_MUX_uxn_opcodes_h_l2145_c7_8ec4_iffalse,
tmp16_MUX_uxn_opcodes_h_l2145_c7_8ec4_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2147_c3_5f55
CONST_SL_8_uxn_opcodes_h_l2147_c3_5f55 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2147_c3_5f55_x,
CONST_SL_8_uxn_opcodes_h_l2147_c3_5f55_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2149_c11_ce64
BIN_OP_EQ_uxn_opcodes_h_l2149_c11_ce64 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2149_c11_ce64_left,
BIN_OP_EQ_uxn_opcodes_h_l2149_c11_ce64_right,
BIN_OP_EQ_uxn_opcodes_h_l2149_c11_ce64_return_output);

-- n16_MUX_uxn_opcodes_h_l2149_c7_776f
n16_MUX_uxn_opcodes_h_l2149_c7_776f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2149_c7_776f_cond,
n16_MUX_uxn_opcodes_h_l2149_c7_776f_iftrue,
n16_MUX_uxn_opcodes_h_l2149_c7_776f_iffalse,
n16_MUX_uxn_opcodes_h_l2149_c7_776f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2149_c7_776f
result_u8_value_MUX_uxn_opcodes_h_l2149_c7_776f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2149_c7_776f_cond,
result_u8_value_MUX_uxn_opcodes_h_l2149_c7_776f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2149_c7_776f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2149_c7_776f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_776f
result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_776f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_776f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_776f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_776f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_776f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_776f
result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_776f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_776f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_776f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_776f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_776f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_776f
result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_776f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_776f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_776f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_776f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_776f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_776f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_776f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_776f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_776f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_776f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_776f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_776f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_776f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_776f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_776f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_776f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_776f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2149_c7_776f
tmp16_MUX_uxn_opcodes_h_l2149_c7_776f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2149_c7_776f_cond,
tmp16_MUX_uxn_opcodes_h_l2149_c7_776f_iftrue,
tmp16_MUX_uxn_opcodes_h_l2149_c7_776f_iffalse,
tmp16_MUX_uxn_opcodes_h_l2149_c7_776f_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2150_c3_611b
BIN_OP_OR_uxn_opcodes_h_l2150_c3_611b : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2150_c3_611b_left,
BIN_OP_OR_uxn_opcodes_h_l2150_c3_611b_right,
BIN_OP_OR_uxn_opcodes_h_l2150_c3_611b_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2152_c30_b14e
sp_relative_shift_uxn_opcodes_h_l2152_c30_b14e : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2152_c30_b14e_ins,
sp_relative_shift_uxn_opcodes_h_l2152_c30_b14e_x,
sp_relative_shift_uxn_opcodes_h_l2152_c30_b14e_y,
sp_relative_shift_uxn_opcodes_h_l2152_c30_b14e_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2153_c20_86dc
BIN_OP_AND_uxn_opcodes_h_l2153_c20_86dc : entity work.BIN_OP_AND_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2153_c20_86dc_left,
BIN_OP_AND_uxn_opcodes_h_l2153_c20_86dc_right,
BIN_OP_AND_uxn_opcodes_h_l2153_c20_86dc_return_output);

-- BIN_OP_SR_uxn_opcodes_h_l2153_c12_c1ef
BIN_OP_SR_uxn_opcodes_h_l2153_c12_c1ef : entity work.BIN_OP_SR_uint16_t_uint8_t_0CLK_295015b8 port map (
BIN_OP_SR_uxn_opcodes_h_l2153_c12_c1ef_left,
BIN_OP_SR_uxn_opcodes_h_l2153_c12_c1ef_right,
BIN_OP_SR_uxn_opcodes_h_l2153_c12_c1ef_return_output);

-- CONST_SR_4_uxn_opcodes_h_l2153_c36_265f
CONST_SR_4_uxn_opcodes_h_l2153_c36_265f : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_opcodes_h_l2153_c36_265f_x,
CONST_SR_4_uxn_opcodes_h_l2153_c36_265f_return_output);

-- BIN_OP_SL_uxn_opcodes_h_l2153_c12_d9a8
BIN_OP_SL_uxn_opcodes_h_l2153_c12_d9a8 : entity work.BIN_OP_SL_uint16_t_uint8_t_0CLK_b6546dec port map (
BIN_OP_SL_uxn_opcodes_h_l2153_c12_d9a8_left,
BIN_OP_SL_uxn_opcodes_h_l2153_c12_d9a8_right,
BIN_OP_SL_uxn_opcodes_h_l2153_c12_d9a8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2158_c11_6a21
BIN_OP_EQ_uxn_opcodes_h_l2158_c11_6a21 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2158_c11_6a21_left,
BIN_OP_EQ_uxn_opcodes_h_l2158_c11_6a21_right,
BIN_OP_EQ_uxn_opcodes_h_l2158_c11_6a21_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2158_c7_5cf7
result_u8_value_MUX_uxn_opcodes_h_l2158_c7_5cf7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2158_c7_5cf7_cond,
result_u8_value_MUX_uxn_opcodes_h_l2158_c7_5cf7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2158_c7_5cf7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2158_c7_5cf7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_5cf7
result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_5cf7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_5cf7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_5cf7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_5cf7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_5cf7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_5cf7
result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_5cf7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_5cf7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_5cf7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_5cf7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_5cf7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_5cf7
result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_5cf7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_5cf7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_5cf7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_5cf7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_5cf7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_5cf7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_5cf7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_5cf7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_5cf7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_5cf7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_5cf7_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2161_c31_7a3a
CONST_SR_8_uxn_opcodes_h_l2161_c31_7a3a : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2161_c31_7a3a_x,
CONST_SR_8_uxn_opcodes_h_l2161_c31_7a3a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2163_c11_50af
BIN_OP_EQ_uxn_opcodes_h_l2163_c11_50af : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2163_c11_50af_left,
BIN_OP_EQ_uxn_opcodes_h_l2163_c11_50af_right,
BIN_OP_EQ_uxn_opcodes_h_l2163_c11_50af_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_f846
result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_f846 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_f846_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_f846_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_f846_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_f846_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_f846
result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_f846 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_f846_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_f846_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_f846_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_f846_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2133_c6_50db_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_5432_return_output,
 t8_MUX_uxn_opcodes_h_l2133_c2_b3b4_return_output,
 n16_MUX_uxn_opcodes_h_l2133_c2_b3b4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2133_c2_b3b4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_b3b4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_b3b4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_b3b4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_b3b4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_b3b4_return_output,
 tmp16_MUX_uxn_opcodes_h_l2133_c2_b3b4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2138_c11_7294_return_output,
 t8_MUX_uxn_opcodes_h_l2138_c7_7da7_return_output,
 n16_MUX_uxn_opcodes_h_l2138_c7_7da7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2138_c7_7da7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_7da7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_7da7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_7da7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_7da7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_7da7_return_output,
 tmp16_MUX_uxn_opcodes_h_l2138_c7_7da7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2141_c11_d23e_return_output,
 t8_MUX_uxn_opcodes_h_l2141_c7_43dd_return_output,
 n16_MUX_uxn_opcodes_h_l2141_c7_43dd_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2141_c7_43dd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_43dd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_43dd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_43dd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_43dd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_43dd_return_output,
 tmp16_MUX_uxn_opcodes_h_l2141_c7_43dd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2145_c11_27a2_return_output,
 n16_MUX_uxn_opcodes_h_l2145_c7_8ec4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2145_c7_8ec4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_8ec4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_8ec4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_8ec4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_8ec4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_8ec4_return_output,
 tmp16_MUX_uxn_opcodes_h_l2145_c7_8ec4_return_output,
 CONST_SL_8_uxn_opcodes_h_l2147_c3_5f55_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2149_c11_ce64_return_output,
 n16_MUX_uxn_opcodes_h_l2149_c7_776f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2149_c7_776f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_776f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_776f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_776f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_776f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_776f_return_output,
 tmp16_MUX_uxn_opcodes_h_l2149_c7_776f_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2150_c3_611b_return_output,
 sp_relative_shift_uxn_opcodes_h_l2152_c30_b14e_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2153_c20_86dc_return_output,
 BIN_OP_SR_uxn_opcodes_h_l2153_c12_c1ef_return_output,
 CONST_SR_4_uxn_opcodes_h_l2153_c36_265f_return_output,
 BIN_OP_SL_uxn_opcodes_h_l2153_c12_d9a8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2158_c11_6a21_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2158_c7_5cf7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_5cf7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_5cf7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_5cf7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_5cf7_return_output,
 CONST_SR_8_uxn_opcodes_h_l2161_c31_7a3a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2163_c11_50af_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_f846_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_f846_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_50db_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_50db_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_50db_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_5432_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_5432_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_5432_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_5432_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2133_c2_b3b4_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2133_c2_b3b4_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2138_c7_7da7_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2133_c2_b3b4_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2133_c2_b3b4_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2133_c2_b3b4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2133_c2_b3b4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2138_c7_7da7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2133_c2_b3b4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2133_c2_b3b4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c2_b3b4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c2_b3b4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2138_c7_7da7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c2_b3b4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c2_b3b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_b3b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_b3b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_7da7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_b3b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_b3b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_b3b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_b3b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_7da7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_b3b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_b3b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_b3b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_b3b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_7da7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_b3b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_b3b4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_b3b4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2135_c3_2441 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_b3b4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_7da7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_b3b4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_b3b4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_b3b4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_b3b4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_7da7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_b3b4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_b3b4_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2133_c2_b3b4_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2133_c2_b3b4_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2138_c7_7da7_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2133_c2_b3b4_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2133_c2_b3b4_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2134_c3_42da_uxn_opcodes_h_l2134_c3_42da_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_7294_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_7294_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_7294_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2138_c7_7da7_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2138_c7_7da7_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2141_c7_43dd_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2138_c7_7da7_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2138_c7_7da7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2138_c7_7da7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2141_c7_43dd_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2138_c7_7da7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2138_c7_7da7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2138_c7_7da7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_43dd_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2138_c7_7da7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_7da7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_7da7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_43dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_7da7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_7da7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_7da7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_43dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_7da7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_7da7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_7da7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_43dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_7da7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_7da7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2139_c3_2df4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_7da7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_43dd_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_7da7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_7da7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_7da7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_43dd_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_7da7_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2138_c7_7da7_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2138_c7_7da7_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_43dd_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2138_c7_7da7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_d23e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_d23e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_d23e_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2141_c7_43dd_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2141_c7_43dd_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2141_c7_43dd_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2141_c7_43dd_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2141_c7_43dd_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2145_c7_8ec4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2141_c7_43dd_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_43dd_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_43dd_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2145_c7_8ec4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_43dd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_43dd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_43dd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_8ec4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_43dd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_43dd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_43dd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_8ec4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_43dd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_43dd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_43dd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_8ec4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_43dd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_43dd_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2143_c3_1d50 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_43dd_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_8ec4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_43dd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_43dd_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_43dd_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_8ec4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_43dd_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_43dd_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_43dd_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2145_c7_8ec4_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_43dd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_27a2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_27a2_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_27a2_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2145_c7_8ec4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2145_c7_8ec4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2149_c7_776f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2145_c7_8ec4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2145_c7_8ec4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2145_c7_8ec4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2149_c7_776f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2145_c7_8ec4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_8ec4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_8ec4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_776f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_8ec4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_8ec4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_8ec4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_776f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_8ec4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_8ec4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_8ec4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_776f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_8ec4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_8ec4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_8ec4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_776f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_8ec4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_8ec4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_8ec4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_776f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_8ec4_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2145_c7_8ec4_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2145_c7_8ec4_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2149_c7_776f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2145_c7_8ec4_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2147_c3_5f55_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2147_c3_5f55_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_ce64_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_ce64_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_ce64_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2149_c7_776f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2149_c7_776f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2149_c7_776f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2149_c7_776f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2149_c7_776f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2158_c7_5cf7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2149_c7_776f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_776f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_776f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_5cf7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_776f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_776f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_776f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_5cf7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_776f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_776f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_776f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_5cf7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_776f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_776f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2155_c3_b8b5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_776f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_5cf7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_776f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_776f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_776f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_776f_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2149_c7_776f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2149_c7_776f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2149_c7_776f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2150_c3_611b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2150_c3_611b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2150_c3_611b_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2152_c30_b14e_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2152_c30_b14e_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2152_c30_b14e_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2152_c30_b14e_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2153_c12_c1ef_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2153_c20_86dc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2153_c20_86dc_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2153_c20_86dc_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2153_c12_c1ef_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2153_c12_c1ef_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2153_c12_d9a8_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2153_c12_d9a8_right : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2153_c36_265f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2153_c36_265f_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2153_c12_d9a8_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2156_c21_e923_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2158_c11_6a21_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2158_c11_6a21_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2158_c11_6a21_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2158_c7_5cf7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2158_c7_5cf7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2158_c7_5cf7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_5cf7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_5cf7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_5cf7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_5cf7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_5cf7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_f846_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_5cf7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_5cf7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_5cf7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_f846_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_5cf7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_5cf7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2160_c3_869d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_5cf7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_5cf7_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2161_c31_7a3a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2161_c31_7a3a_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2161_c21_7ae8_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2163_c11_50af_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2163_c11_50af_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2163_c11_50af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_f846_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_f846_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_f846_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_f846_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_f846_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_f846_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2158_DUPLICATE_17f5_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2158_DUPLICATE_d258_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2163_l2158_DUPLICATE_25cd_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2149_l2145_l2141_l2138_l2133_DUPLICATE_bb98_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2149_l2145_l2141_l2138_l2163_l2158_DUPLICATE_a502_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2146_l2150_DUPLICATE_d5fe_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2158_l2145_DUPLICATE_ae6b_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l2168_l2128_DUPLICATE_9629_return_output : opcode_result_t;
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
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_776f_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2143_c3_1d50 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_43dd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2143_c3_1d50;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_5cf7_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_776f_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2160_c3_869d := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_5cf7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2160_c3_869d;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_f846_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_27a2_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2135_c3_2441 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_b3b4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2135_c3_2441;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2163_c11_50af_right := to_unsigned(6, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_5432_iffalse := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2152_c30_b14e_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2139_c3_2df4 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_7da7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2139_c3_2df4;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_f846_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2158_c11_6a21_right := to_unsigned(5, 3);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2153_c20_86dc_right := to_unsigned(15, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_ce64_right := to_unsigned(4, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_b3b4_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2155_c3_b8b5 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_776f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2155_c3_b8b5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_50db_right := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2152_c30_b14e_y := resize(to_signed(-1, 2), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_7294_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_d23e_right := to_unsigned(2, 2);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_5432_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2152_c30_b14e_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2150_c3_611b_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2133_c2_b3b4_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2138_c7_7da7_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2141_c7_43dd_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2149_c7_776f_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_50db_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_7294_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_d23e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_27a2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_ce64_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2158_c11_6a21_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2163_c11_50af_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l2141_c7_43dd_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2153_c20_86dc_left := t8;
     VAR_CONST_SR_4_uxn_opcodes_h_l2153_c36_265f_x := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2133_c2_b3b4_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2138_c7_7da7_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2141_c7_43dd_iffalse := t8;
     VAR_CONST_SR_8_uxn_opcodes_h_l2161_c31_7a3a_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2133_c2_b3b4_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2138_c7_7da7_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_43dd_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2145_c7_8ec4_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2149_c7_776f_iffalse := tmp16;
     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2158_DUPLICATE_17f5 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2158_DUPLICATE_17f5_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2133_c6_50db] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2133_c6_50db_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_50db_left;
     BIN_OP_EQ_uxn_opcodes_h_l2133_c6_50db_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_50db_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_50db_return_output := BIN_OP_EQ_uxn_opcodes_h_l2133_c6_50db_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2152_c30_b14e] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2152_c30_b14e_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2152_c30_b14e_ins;
     sp_relative_shift_uxn_opcodes_h_l2152_c30_b14e_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2152_c30_b14e_x;
     sp_relative_shift_uxn_opcodes_h_l2152_c30_b14e_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2152_c30_b14e_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2152_c30_b14e_return_output := sp_relative_shift_uxn_opcodes_h_l2152_c30_b14e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2149_c11_ce64] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2149_c11_ce64_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_ce64_left;
     BIN_OP_EQ_uxn_opcodes_h_l2149_c11_ce64_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_ce64_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_ce64_return_output := BIN_OP_EQ_uxn_opcodes_h_l2149_c11_ce64_return_output;

     -- CONST_SR_4[uxn_opcodes_h_l2153_c36_265f] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_opcodes_h_l2153_c36_265f_x <= VAR_CONST_SR_4_uxn_opcodes_h_l2153_c36_265f_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_opcodes_h_l2153_c36_265f_return_output := CONST_SR_4_uxn_opcodes_h_l2153_c36_265f_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2153_c20_86dc] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2153_c20_86dc_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2153_c20_86dc_left;
     BIN_OP_AND_uxn_opcodes_h_l2153_c20_86dc_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2153_c20_86dc_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2153_c20_86dc_return_output := BIN_OP_AND_uxn_opcodes_h_l2153_c20_86dc_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2158_l2145_DUPLICATE_ae6b LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2158_l2145_DUPLICATE_ae6b_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2158_DUPLICATE_d258 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2158_DUPLICATE_d258_return_output := result.is_sp_shift;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2149_l2145_l2141_l2138_l2133_DUPLICATE_bb98 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2149_l2145_l2141_l2138_l2133_DUPLICATE_bb98_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2163_l2158_DUPLICATE_25cd LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2163_l2158_DUPLICATE_25cd_return_output := result.is_stack_write;

     -- CONST_SR_8[uxn_opcodes_h_l2161_c31_7a3a] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2161_c31_7a3a_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2161_c31_7a3a_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2161_c31_7a3a_return_output := CONST_SR_8_uxn_opcodes_h_l2161_c31_7a3a_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2146_l2150_DUPLICATE_d5fe LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2146_l2150_DUPLICATE_d5fe_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2158_c11_6a21] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2158_c11_6a21_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2158_c11_6a21_left;
     BIN_OP_EQ_uxn_opcodes_h_l2158_c11_6a21_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2158_c11_6a21_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2158_c11_6a21_return_output := BIN_OP_EQ_uxn_opcodes_h_l2158_c11_6a21_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2141_c11_d23e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2141_c11_d23e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_d23e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2141_c11_d23e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_d23e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_d23e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2141_c11_d23e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2138_c11_7294] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2138_c11_7294_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_7294_left;
     BIN_OP_EQ_uxn_opcodes_h_l2138_c11_7294_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_7294_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_7294_return_output := BIN_OP_EQ_uxn_opcodes_h_l2138_c11_7294_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2149_l2145_l2141_l2138_l2163_l2158_DUPLICATE_a502 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2149_l2145_l2141_l2138_l2163_l2158_DUPLICATE_a502_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2145_c11_27a2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2145_c11_27a2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_27a2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2145_c11_27a2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_27a2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_27a2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2145_c11_27a2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2163_c11_50af] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2163_c11_50af_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2163_c11_50af_left;
     BIN_OP_EQ_uxn_opcodes_h_l2163_c11_50af_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2163_c11_50af_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2163_c11_50af_return_output := BIN_OP_EQ_uxn_opcodes_h_l2163_c11_50af_return_output;

     -- Submodule level 1
     VAR_BIN_OP_SR_uxn_opcodes_h_l2153_c12_c1ef_right := VAR_BIN_OP_AND_uxn_opcodes_h_l2153_c20_86dc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_5432_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_50db_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2133_c2_b3b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_50db_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_b3b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_50db_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_b3b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_50db_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_b3b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_50db_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_b3b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_50db_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_b3b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_50db_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c2_b3b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_50db_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2133_c2_b3b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_50db_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2133_c2_b3b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_50db_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2138_c7_7da7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_7294_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_7da7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_7294_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_7da7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_7294_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_7da7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_7294_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_7da7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_7294_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_7da7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_7294_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2138_c7_7da7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_7294_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2138_c7_7da7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_7294_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2138_c7_7da7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_7294_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2141_c7_43dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_d23e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_43dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_d23e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_43dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_d23e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_43dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_d23e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_43dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_d23e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_43dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_d23e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_43dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_d23e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2141_c7_43dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_d23e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_43dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_d23e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2145_c7_8ec4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_27a2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_8ec4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_27a2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_8ec4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_27a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_8ec4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_27a2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_8ec4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_27a2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_8ec4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_27a2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2145_c7_8ec4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_27a2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2145_c7_8ec4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_27a2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2149_c7_776f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_ce64_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_776f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_ce64_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_776f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_ce64_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_776f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_ce64_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_776f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_ce64_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_776f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_ce64_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2149_c7_776f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_ce64_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2149_c7_776f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_ce64_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_5cf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2158_c11_6a21_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_5cf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2158_c11_6a21_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_5cf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2158_c11_6a21_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_5cf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2158_c11_6a21_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2158_c7_5cf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2158_c11_6a21_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_f846_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2163_c11_50af_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_f846_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2163_c11_50af_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2150_c3_611b_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2146_l2150_DUPLICATE_d5fe_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2147_c3_5f55_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2146_l2150_DUPLICATE_d5fe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_b3b4_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2149_l2145_l2141_l2138_l2133_DUPLICATE_bb98_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_7da7_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2149_l2145_l2141_l2138_l2133_DUPLICATE_bb98_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_43dd_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2149_l2145_l2141_l2138_l2133_DUPLICATE_bb98_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_8ec4_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2149_l2145_l2141_l2138_l2133_DUPLICATE_bb98_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_776f_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2149_l2145_l2141_l2138_l2133_DUPLICATE_bb98_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_7da7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2149_l2145_l2141_l2138_l2163_l2158_DUPLICATE_a502_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_43dd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2149_l2145_l2141_l2138_l2163_l2158_DUPLICATE_a502_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_8ec4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2149_l2145_l2141_l2138_l2163_l2158_DUPLICATE_a502_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_776f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2149_l2145_l2141_l2138_l2163_l2158_DUPLICATE_a502_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_5cf7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2149_l2145_l2141_l2138_l2163_l2158_DUPLICATE_a502_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_f846_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2149_l2145_l2141_l2138_l2163_l2158_DUPLICATE_a502_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_b3b4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2158_DUPLICATE_d258_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_7da7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2158_DUPLICATE_d258_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_43dd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2158_DUPLICATE_d258_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_8ec4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2158_DUPLICATE_d258_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_5cf7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2158_DUPLICATE_d258_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_b3b4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2163_l2158_DUPLICATE_25cd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_7da7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2163_l2158_DUPLICATE_25cd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_43dd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2163_l2158_DUPLICATE_25cd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_8ec4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2163_l2158_DUPLICATE_25cd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_5cf7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2163_l2158_DUPLICATE_25cd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_f846_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2163_l2158_DUPLICATE_25cd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_8ec4_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2158_l2145_DUPLICATE_ae6b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_5cf7_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2158_l2145_DUPLICATE_ae6b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c2_b3b4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2158_DUPLICATE_17f5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2138_c7_7da7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2158_DUPLICATE_17f5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_43dd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2158_DUPLICATE_17f5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2145_c7_8ec4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2158_DUPLICATE_17f5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2158_c7_5cf7_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2158_DUPLICATE_17f5_return_output;
     VAR_BIN_OP_SL_uxn_opcodes_h_l2153_c12_d9a8_right := VAR_CONST_SR_4_uxn_opcodes_h_l2153_c36_265f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_776f_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2152_c30_b14e_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2163_c7_f846] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_f846_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_f846_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_f846_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_f846_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_f846_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_f846_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_f846_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_f846_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2147_c3_5f55] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2147_c3_5f55_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2147_c3_5f55_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2147_c3_5f55_return_output := CONST_SL_8_uxn_opcodes_h_l2147_c3_5f55_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2150_c3_611b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2150_c3_611b_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2150_c3_611b_left;
     BIN_OP_OR_uxn_opcodes_h_l2150_c3_611b_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2150_c3_611b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2150_c3_611b_return_output := BIN_OP_OR_uxn_opcodes_h_l2150_c3_611b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2133_c1_5432] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_5432_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_5432_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_5432_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_5432_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_5432_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_5432_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_5432_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_5432_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2163_c7_f846] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_f846_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_f846_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_f846_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_f846_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_f846_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_f846_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_f846_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_f846_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2149_c7_776f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_776f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_776f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_776f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_776f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_776f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_776f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_776f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_776f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2158_c7_5cf7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_5cf7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_5cf7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_5cf7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_5cf7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_5cf7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_5cf7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_5cf7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_5cf7_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2161_c21_7ae8] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2161_c21_7ae8_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2161_c31_7a3a_return_output);

     -- t8_MUX[uxn_opcodes_h_l2141_c7_43dd] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2141_c7_43dd_cond <= VAR_t8_MUX_uxn_opcodes_h_l2141_c7_43dd_cond;
     t8_MUX_uxn_opcodes_h_l2141_c7_43dd_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2141_c7_43dd_iftrue;
     t8_MUX_uxn_opcodes_h_l2141_c7_43dd_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2141_c7_43dd_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2141_c7_43dd_return_output := t8_MUX_uxn_opcodes_h_l2141_c7_43dd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2158_c7_5cf7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_5cf7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_5cf7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_5cf7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_5cf7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_5cf7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_5cf7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_5cf7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_5cf7_return_output;

     -- Submodule level 2
     VAR_BIN_OP_SR_uxn_opcodes_h_l2153_c12_c1ef_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2150_c3_611b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2149_c7_776f_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2150_c3_611b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2158_c7_5cf7_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2161_c21_7ae8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2145_c7_8ec4_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2147_c3_5f55_return_output;
     VAR_printf_uxn_opcodes_h_l2134_c3_42da_uxn_opcodes_h_l2134_c3_42da_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_5432_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_5cf7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_f846_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_776f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_5cf7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_5cf7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_f846_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_8ec4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_776f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_776f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_5cf7_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2138_c7_7da7_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2141_c7_43dd_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2145_c7_8ec4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_8ec4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_8ec4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_8ec4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_8ec4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_8ec4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_8ec4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_8ec4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_8ec4_return_output;

     -- BIN_OP_SR[uxn_opcodes_h_l2153_c12_c1ef] LATENCY=0
     -- Inputs
     BIN_OP_SR_uxn_opcodes_h_l2153_c12_c1ef_left <= VAR_BIN_OP_SR_uxn_opcodes_h_l2153_c12_c1ef_left;
     BIN_OP_SR_uxn_opcodes_h_l2153_c12_c1ef_right <= VAR_BIN_OP_SR_uxn_opcodes_h_l2153_c12_c1ef_right;
     -- Outputs
     VAR_BIN_OP_SR_uxn_opcodes_h_l2153_c12_c1ef_return_output := BIN_OP_SR_uxn_opcodes_h_l2153_c12_c1ef_return_output;

     -- t8_MUX[uxn_opcodes_h_l2138_c7_7da7] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2138_c7_7da7_cond <= VAR_t8_MUX_uxn_opcodes_h_l2138_c7_7da7_cond;
     t8_MUX_uxn_opcodes_h_l2138_c7_7da7_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2138_c7_7da7_iftrue;
     t8_MUX_uxn_opcodes_h_l2138_c7_7da7_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2138_c7_7da7_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2138_c7_7da7_return_output := t8_MUX_uxn_opcodes_h_l2138_c7_7da7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2149_c7_776f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_776f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_776f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_776f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_776f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_776f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_776f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_776f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_776f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2158_c7_5cf7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_5cf7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_5cf7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_5cf7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_5cf7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_5cf7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_5cf7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_5cf7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_5cf7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2158_c7_5cf7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2158_c7_5cf7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2158_c7_5cf7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2158_c7_5cf7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2158_c7_5cf7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2158_c7_5cf7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2158_c7_5cf7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2158_c7_5cf7_return_output := result_u8_value_MUX_uxn_opcodes_h_l2158_c7_5cf7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2149_c7_776f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_776f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_776f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_776f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_776f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_776f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_776f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_776f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_776f_return_output;

     -- n16_MUX[uxn_opcodes_h_l2149_c7_776f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2149_c7_776f_cond <= VAR_n16_MUX_uxn_opcodes_h_l2149_c7_776f_cond;
     n16_MUX_uxn_opcodes_h_l2149_c7_776f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2149_c7_776f_iftrue;
     n16_MUX_uxn_opcodes_h_l2149_c7_776f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2149_c7_776f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2149_c7_776f_return_output := n16_MUX_uxn_opcodes_h_l2149_c7_776f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2158_c7_5cf7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_5cf7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_5cf7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_5cf7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_5cf7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_5cf7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_5cf7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_5cf7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_5cf7_return_output;

     -- printf_uxn_opcodes_h_l2134_c3_42da[uxn_opcodes_h_l2134_c3_42da] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2134_c3_42da_uxn_opcodes_h_l2134_c3_42da_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2134_c3_42da_uxn_opcodes_h_l2134_c3_42da_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_BIN_OP_SL_uxn_opcodes_h_l2153_c12_d9a8_left := VAR_BIN_OP_SR_uxn_opcodes_h_l2153_c12_c1ef_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2145_c7_8ec4_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2149_c7_776f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_776f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_5cf7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_8ec4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_776f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_776f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_5cf7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_43dd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_8ec4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_8ec4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_776f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2149_c7_776f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2158_c7_5cf7_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2133_c2_b3b4_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2138_c7_7da7_return_output;
     -- n16_MUX[uxn_opcodes_h_l2145_c7_8ec4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2145_c7_8ec4_cond <= VAR_n16_MUX_uxn_opcodes_h_l2145_c7_8ec4_cond;
     n16_MUX_uxn_opcodes_h_l2145_c7_8ec4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2145_c7_8ec4_iftrue;
     n16_MUX_uxn_opcodes_h_l2145_c7_8ec4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2145_c7_8ec4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2145_c7_8ec4_return_output := n16_MUX_uxn_opcodes_h_l2145_c7_8ec4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2145_c7_8ec4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_8ec4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_8ec4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_8ec4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_8ec4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_8ec4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_8ec4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_8ec4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_8ec4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2149_c7_776f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_776f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_776f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_776f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_776f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_776f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_776f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_776f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_776f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2149_c7_776f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_776f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_776f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_776f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_776f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_776f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_776f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_776f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_776f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2141_c7_43dd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_43dd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_43dd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_43dd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_43dd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_43dd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_43dd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_43dd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_43dd_return_output;

     -- BIN_OP_SL[uxn_opcodes_h_l2153_c12_d9a8] LATENCY=0
     -- Inputs
     BIN_OP_SL_uxn_opcodes_h_l2153_c12_d9a8_left <= VAR_BIN_OP_SL_uxn_opcodes_h_l2153_c12_d9a8_left;
     BIN_OP_SL_uxn_opcodes_h_l2153_c12_d9a8_right <= VAR_BIN_OP_SL_uxn_opcodes_h_l2153_c12_d9a8_right;
     -- Outputs
     VAR_BIN_OP_SL_uxn_opcodes_h_l2153_c12_d9a8_return_output := BIN_OP_SL_uxn_opcodes_h_l2153_c12_d9a8_return_output;

     -- t8_MUX[uxn_opcodes_h_l2133_c2_b3b4] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2133_c2_b3b4_cond <= VAR_t8_MUX_uxn_opcodes_h_l2133_c2_b3b4_cond;
     t8_MUX_uxn_opcodes_h_l2133_c2_b3b4_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2133_c2_b3b4_iftrue;
     t8_MUX_uxn_opcodes_h_l2133_c2_b3b4_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2133_c2_b3b4_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2133_c2_b3b4_return_output := t8_MUX_uxn_opcodes_h_l2133_c2_b3b4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2145_c7_8ec4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_8ec4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_8ec4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_8ec4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_8ec4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_8ec4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_8ec4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_8ec4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_8ec4_return_output;

     -- Submodule level 4
     VAR_tmp16_MUX_uxn_opcodes_h_l2149_c7_776f_iftrue := VAR_BIN_OP_SL_uxn_opcodes_h_l2153_c12_d9a8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2141_c7_43dd_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2145_c7_8ec4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_8ec4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_776f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_43dd_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_8ec4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_8ec4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_776f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_7da7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_43dd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_43dd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_8ec4_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2133_c2_b3b4_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2145_c7_8ec4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_8ec4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_8ec4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_8ec4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_8ec4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_8ec4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_8ec4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_8ec4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_8ec4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2141_c7_43dd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_43dd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_43dd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_43dd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_43dd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_43dd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_43dd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_43dd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_43dd_return_output;

     -- n16_MUX[uxn_opcodes_h_l2141_c7_43dd] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2141_c7_43dd_cond <= VAR_n16_MUX_uxn_opcodes_h_l2141_c7_43dd_cond;
     n16_MUX_uxn_opcodes_h_l2141_c7_43dd_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2141_c7_43dd_iftrue;
     n16_MUX_uxn_opcodes_h_l2141_c7_43dd_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2141_c7_43dd_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2141_c7_43dd_return_output := n16_MUX_uxn_opcodes_h_l2141_c7_43dd_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2156_c21_e923] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2156_c21_e923_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_SL_uxn_opcodes_h_l2153_c12_d9a8_return_output);

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2141_c7_43dd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_43dd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_43dd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_43dd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_43dd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_43dd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_43dd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_43dd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_43dd_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2149_c7_776f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2149_c7_776f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2149_c7_776f_cond;
     tmp16_MUX_uxn_opcodes_h_l2149_c7_776f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2149_c7_776f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2149_c7_776f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2149_c7_776f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2149_c7_776f_return_output := tmp16_MUX_uxn_opcodes_h_l2149_c7_776f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2145_c7_8ec4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_8ec4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_8ec4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_8ec4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_8ec4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_8ec4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_8ec4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_8ec4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_8ec4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2138_c7_7da7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_7da7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_7da7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_7da7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_7da7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_7da7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_7da7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_7da7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_7da7_return_output;

     -- Submodule level 5
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2149_c7_776f_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2156_c21_e923_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2138_c7_7da7_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2141_c7_43dd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_43dd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_8ec4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_7da7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_43dd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_43dd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_8ec4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_b3b4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_7da7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_7da7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_43dd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2145_c7_8ec4_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2149_c7_776f_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2138_c7_7da7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_7da7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_7da7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_7da7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_7da7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_7da7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_7da7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_7da7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_7da7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2133_c2_b3b4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_b3b4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_b3b4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_b3b4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_b3b4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_b3b4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_b3b4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_b3b4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_b3b4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2138_c7_7da7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_7da7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_7da7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_7da7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_7da7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_7da7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_7da7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_7da7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_7da7_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2145_c7_8ec4] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2145_c7_8ec4_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2145_c7_8ec4_cond;
     tmp16_MUX_uxn_opcodes_h_l2145_c7_8ec4_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2145_c7_8ec4_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2145_c7_8ec4_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2145_c7_8ec4_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2145_c7_8ec4_return_output := tmp16_MUX_uxn_opcodes_h_l2145_c7_8ec4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2141_c7_43dd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_43dd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_43dd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_43dd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_43dd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_43dd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_43dd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_43dd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_43dd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2141_c7_43dd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_43dd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_43dd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_43dd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_43dd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_43dd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_43dd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_43dd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_43dd_return_output;

     -- n16_MUX[uxn_opcodes_h_l2138_c7_7da7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2138_c7_7da7_cond <= VAR_n16_MUX_uxn_opcodes_h_l2138_c7_7da7_cond;
     n16_MUX_uxn_opcodes_h_l2138_c7_7da7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2138_c7_7da7_iftrue;
     n16_MUX_uxn_opcodes_h_l2138_c7_7da7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2138_c7_7da7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2138_c7_7da7_return_output := n16_MUX_uxn_opcodes_h_l2138_c7_7da7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2149_c7_776f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2149_c7_776f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2149_c7_776f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2149_c7_776f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2149_c7_776f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2149_c7_776f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2149_c7_776f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2149_c7_776f_return_output := result_u8_value_MUX_uxn_opcodes_h_l2149_c7_776f_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2133_c2_b3b4_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2138_c7_7da7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_7da7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_43dd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_b3b4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_7da7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_7da7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_43dd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_b3b4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_7da7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2145_c7_8ec4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2149_c7_776f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_43dd_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2145_c7_8ec4_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2145_c7_8ec4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2145_c7_8ec4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2145_c7_8ec4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2145_c7_8ec4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2145_c7_8ec4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2145_c7_8ec4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2145_c7_8ec4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2145_c7_8ec4_return_output := result_u8_value_MUX_uxn_opcodes_h_l2145_c7_8ec4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2138_c7_7da7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_7da7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_7da7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_7da7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_7da7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_7da7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_7da7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_7da7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_7da7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2138_c7_7da7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_7da7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_7da7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_7da7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_7da7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_7da7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_7da7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_7da7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_7da7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2133_c2_b3b4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_b3b4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_b3b4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_b3b4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_b3b4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_b3b4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_b3b4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_b3b4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_b3b4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2133_c2_b3b4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_b3b4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_b3b4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_b3b4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_b3b4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_b3b4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_b3b4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_b3b4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_b3b4_return_output;

     -- n16_MUX[uxn_opcodes_h_l2133_c2_b3b4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2133_c2_b3b4_cond <= VAR_n16_MUX_uxn_opcodes_h_l2133_c2_b3b4_cond;
     n16_MUX_uxn_opcodes_h_l2133_c2_b3b4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2133_c2_b3b4_iftrue;
     n16_MUX_uxn_opcodes_h_l2133_c2_b3b4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2133_c2_b3b4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2133_c2_b3b4_return_output := n16_MUX_uxn_opcodes_h_l2133_c2_b3b4_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2141_c7_43dd] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2141_c7_43dd_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_43dd_cond;
     tmp16_MUX_uxn_opcodes_h_l2141_c7_43dd_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_43dd_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2141_c7_43dd_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_43dd_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_43dd_return_output := tmp16_MUX_uxn_opcodes_h_l2141_c7_43dd_return_output;

     -- Submodule level 7
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2133_c2_b3b4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_b3b4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_7da7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_b3b4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_7da7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_43dd_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2145_c7_8ec4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2138_c7_7da7_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_43dd_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2141_c7_43dd] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2141_c7_43dd_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_43dd_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2141_c7_43dd_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_43dd_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2141_c7_43dd_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_43dd_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_43dd_return_output := result_u8_value_MUX_uxn_opcodes_h_l2141_c7_43dd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2133_c2_b3b4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_b3b4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_b3b4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_b3b4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_b3b4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_b3b4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_b3b4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_b3b4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_b3b4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2133_c2_b3b4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_b3b4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_b3b4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_b3b4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_b3b4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_b3b4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_b3b4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_b3b4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_b3b4_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2138_c7_7da7] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2138_c7_7da7_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2138_c7_7da7_cond;
     tmp16_MUX_uxn_opcodes_h_l2138_c7_7da7_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2138_c7_7da7_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2138_c7_7da7_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2138_c7_7da7_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2138_c7_7da7_return_output := tmp16_MUX_uxn_opcodes_h_l2138_c7_7da7_return_output;

     -- Submodule level 8
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2138_c7_7da7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_43dd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2133_c2_b3b4_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2138_c7_7da7_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2133_c2_b3b4] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2133_c2_b3b4_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2133_c2_b3b4_cond;
     tmp16_MUX_uxn_opcodes_h_l2133_c2_b3b4_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2133_c2_b3b4_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2133_c2_b3b4_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2133_c2_b3b4_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2133_c2_b3b4_return_output := tmp16_MUX_uxn_opcodes_h_l2133_c2_b3b4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2138_c7_7da7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2138_c7_7da7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2138_c7_7da7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2138_c7_7da7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2138_c7_7da7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2138_c7_7da7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2138_c7_7da7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2138_c7_7da7_return_output := result_u8_value_MUX_uxn_opcodes_h_l2138_c7_7da7_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c2_b3b4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2138_c7_7da7_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2133_c2_b3b4_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2133_c2_b3b4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2133_c2_b3b4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c2_b3b4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2133_c2_b3b4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c2_b3b4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2133_c2_b3b4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c2_b3b4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c2_b3b4_return_output := result_u8_value_MUX_uxn_opcodes_h_l2133_c2_b3b4_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l2168_l2128_DUPLICATE_9629 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l2168_l2128_DUPLICATE_9629_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c2_b3b4_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_b3b4_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_b3b4_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_b3b4_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_b3b4_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_b3b4_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l2168_l2128_DUPLICATE_9629_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l2168_l2128_DUPLICATE_9629_return_output;
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
