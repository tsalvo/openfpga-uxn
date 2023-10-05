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
-- Submodules: 104
entity sft2_0CLK_d29b8e2d is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sft2_0CLK_d29b8e2d;
architecture arch of sft2_0CLK_d29b8e2d is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2136_c6_7876]
signal BIN_OP_EQ_uxn_opcodes_h_l2136_c6_7876_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2136_c6_7876_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2136_c6_7876_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2136_c1_261d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2136_c1_261d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2136_c1_261d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2136_c1_261d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2136_c1_261d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2136_c2_e08d]
signal n16_MUX_uxn_opcodes_h_l2136_c2_e08d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2136_c2_e08d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2136_c2_e08d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2136_c2_e08d_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l2136_c2_e08d]
signal t8_MUX_uxn_opcodes_h_l2136_c2_e08d_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2136_c2_e08d_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2136_c2_e08d_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2136_c2_e08d_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2136_c2_e08d]
signal result_stack_value_MUX_uxn_opcodes_h_l2136_c2_e08d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2136_c2_e08d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2136_c2_e08d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2136_c2_e08d_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2136_c2_e08d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c2_e08d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c2_e08d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c2_e08d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c2_e08d_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2136_c2_e08d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c2_e08d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c2_e08d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c2_e08d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c2_e08d_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2136_c2_e08d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2136_c2_e08d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2136_c2_e08d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2136_c2_e08d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2136_c2_e08d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2136_c2_e08d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c2_e08d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c2_e08d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c2_e08d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c2_e08d_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2136_c2_e08d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2136_c2_e08d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2136_c2_e08d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2136_c2_e08d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2136_c2_e08d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2136_c2_e08d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2136_c2_e08d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2136_c2_e08d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2136_c2_e08d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2136_c2_e08d_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2136_c2_e08d]
signal tmp16_MUX_uxn_opcodes_h_l2136_c2_e08d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2136_c2_e08d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2136_c2_e08d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2136_c2_e08d_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2137_c3_bd4c[uxn_opcodes_h_l2137_c3_bd4c]
signal printf_uxn_opcodes_h_l2137_c3_bd4c_uxn_opcodes_h_l2137_c3_bd4c_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2142_c11_8ec3]
signal BIN_OP_EQ_uxn_opcodes_h_l2142_c11_8ec3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2142_c11_8ec3_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2142_c11_8ec3_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2142_c7_d746]
signal n16_MUX_uxn_opcodes_h_l2142_c7_d746_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2142_c7_d746_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2142_c7_d746_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2142_c7_d746_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l2142_c7_d746]
signal t8_MUX_uxn_opcodes_h_l2142_c7_d746_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2142_c7_d746_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2142_c7_d746_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2142_c7_d746_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2142_c7_d746]
signal result_stack_value_MUX_uxn_opcodes_h_l2142_c7_d746_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2142_c7_d746_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2142_c7_d746_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2142_c7_d746_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2142_c7_d746]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c7_d746_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c7_d746_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c7_d746_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c7_d746_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2142_c7_d746]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2142_c7_d746_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2142_c7_d746_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2142_c7_d746_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2142_c7_d746_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2142_c7_d746]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2142_c7_d746_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2142_c7_d746_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2142_c7_d746_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2142_c7_d746_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2142_c7_d746]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c7_d746_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c7_d746_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c7_d746_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c7_d746_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2142_c7_d746]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2142_c7_d746_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2142_c7_d746_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2142_c7_d746_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2142_c7_d746_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2142_c7_d746]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_d746_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_d746_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_d746_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_d746_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2142_c7_d746]
signal tmp16_MUX_uxn_opcodes_h_l2142_c7_d746_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2142_c7_d746_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2142_c7_d746_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2142_c7_d746_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2145_c11_0cb0]
signal BIN_OP_EQ_uxn_opcodes_h_l2145_c11_0cb0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2145_c11_0cb0_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2145_c11_0cb0_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2145_c7_b2b7]
signal n16_MUX_uxn_opcodes_h_l2145_c7_b2b7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2145_c7_b2b7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2145_c7_b2b7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2145_c7_b2b7_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l2145_c7_b2b7]
signal t8_MUX_uxn_opcodes_h_l2145_c7_b2b7_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2145_c7_b2b7_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2145_c7_b2b7_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2145_c7_b2b7_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2145_c7_b2b7]
signal result_stack_value_MUX_uxn_opcodes_h_l2145_c7_b2b7_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2145_c7_b2b7_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2145_c7_b2b7_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2145_c7_b2b7_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2145_c7_b2b7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_b2b7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_b2b7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_b2b7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_b2b7_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2145_c7_b2b7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_b2b7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_b2b7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_b2b7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_b2b7_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2145_c7_b2b7]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2145_c7_b2b7_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2145_c7_b2b7_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2145_c7_b2b7_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2145_c7_b2b7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2145_c7_b2b7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_b2b7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_b2b7_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_b2b7_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_b2b7_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2145_c7_b2b7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_b2b7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_b2b7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_b2b7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_b2b7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2145_c7_b2b7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_b2b7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_b2b7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_b2b7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_b2b7_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2145_c7_b2b7]
signal tmp16_MUX_uxn_opcodes_h_l2145_c7_b2b7_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2145_c7_b2b7_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2145_c7_b2b7_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2145_c7_b2b7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2149_c11_93f4]
signal BIN_OP_EQ_uxn_opcodes_h_l2149_c11_93f4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2149_c11_93f4_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2149_c11_93f4_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2149_c7_304c]
signal n16_MUX_uxn_opcodes_h_l2149_c7_304c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2149_c7_304c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2149_c7_304c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2149_c7_304c_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2149_c7_304c]
signal result_stack_value_MUX_uxn_opcodes_h_l2149_c7_304c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2149_c7_304c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2149_c7_304c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2149_c7_304c_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2149_c7_304c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_304c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_304c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_304c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_304c_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2149_c7_304c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_304c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_304c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_304c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_304c_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2149_c7_304c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2149_c7_304c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2149_c7_304c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2149_c7_304c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2149_c7_304c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2149_c7_304c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_304c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_304c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_304c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_304c_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2149_c7_304c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_304c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_304c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_304c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_304c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2149_c7_304c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_304c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_304c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_304c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_304c_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2149_c7_304c]
signal tmp16_MUX_uxn_opcodes_h_l2149_c7_304c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2149_c7_304c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2149_c7_304c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2149_c7_304c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2152_c11_a822]
signal BIN_OP_EQ_uxn_opcodes_h_l2152_c11_a822_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2152_c11_a822_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2152_c11_a822_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2152_c7_a69d]
signal n16_MUX_uxn_opcodes_h_l2152_c7_a69d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2152_c7_a69d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2152_c7_a69d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2152_c7_a69d_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2152_c7_a69d]
signal result_stack_value_MUX_uxn_opcodes_h_l2152_c7_a69d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2152_c7_a69d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2152_c7_a69d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2152_c7_a69d_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2152_c7_a69d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2152_c7_a69d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2152_c7_a69d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2152_c7_a69d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2152_c7_a69d_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2152_c7_a69d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2152_c7_a69d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2152_c7_a69d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2152_c7_a69d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2152_c7_a69d_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2152_c7_a69d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2152_c7_a69d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2152_c7_a69d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2152_c7_a69d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2152_c7_a69d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2152_c7_a69d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2152_c7_a69d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2152_c7_a69d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2152_c7_a69d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2152_c7_a69d_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2152_c7_a69d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2152_c7_a69d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2152_c7_a69d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2152_c7_a69d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2152_c7_a69d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2152_c7_a69d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2152_c7_a69d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2152_c7_a69d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2152_c7_a69d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2152_c7_a69d_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2152_c7_a69d]
signal tmp16_MUX_uxn_opcodes_h_l2152_c7_a69d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2152_c7_a69d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2152_c7_a69d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2152_c7_a69d_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2154_c3_df46]
signal CONST_SL_8_uxn_opcodes_h_l2154_c3_df46_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2154_c3_df46_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2157_c11_a2fc]
signal BIN_OP_EQ_uxn_opcodes_h_l2157_c11_a2fc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2157_c11_a2fc_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2157_c11_a2fc_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2157_c7_130c]
signal n16_MUX_uxn_opcodes_h_l2157_c7_130c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2157_c7_130c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2157_c7_130c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2157_c7_130c_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2157_c7_130c]
signal result_stack_value_MUX_uxn_opcodes_h_l2157_c7_130c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2157_c7_130c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2157_c7_130c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2157_c7_130c_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2157_c7_130c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2157_c7_130c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2157_c7_130c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2157_c7_130c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2157_c7_130c_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2157_c7_130c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2157_c7_130c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2157_c7_130c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2157_c7_130c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2157_c7_130c_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2157_c7_130c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2157_c7_130c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2157_c7_130c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2157_c7_130c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2157_c7_130c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2157_c7_130c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2157_c7_130c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2157_c7_130c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2157_c7_130c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2157_c7_130c_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2157_c7_130c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2157_c7_130c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2157_c7_130c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2157_c7_130c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2157_c7_130c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2157_c7_130c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2157_c7_130c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2157_c7_130c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2157_c7_130c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2157_c7_130c_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2157_c7_130c]
signal tmp16_MUX_uxn_opcodes_h_l2157_c7_130c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2157_c7_130c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2157_c7_130c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2157_c7_130c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2160_c11_e244]
signal BIN_OP_EQ_uxn_opcodes_h_l2160_c11_e244_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2160_c11_e244_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2160_c11_e244_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2160_c7_72ba]
signal n16_MUX_uxn_opcodes_h_l2160_c7_72ba_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2160_c7_72ba_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2160_c7_72ba_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2160_c7_72ba_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2160_c7_72ba]
signal result_stack_value_MUX_uxn_opcodes_h_l2160_c7_72ba_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2160_c7_72ba_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2160_c7_72ba_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2160_c7_72ba_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2160_c7_72ba]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2160_c7_72ba_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2160_c7_72ba_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2160_c7_72ba_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2160_c7_72ba_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2160_c7_72ba]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2160_c7_72ba_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2160_c7_72ba_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2160_c7_72ba_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2160_c7_72ba_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2160_c7_72ba]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2160_c7_72ba_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2160_c7_72ba_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2160_c7_72ba_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2160_c7_72ba_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2160_c7_72ba]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2160_c7_72ba_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2160_c7_72ba_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2160_c7_72ba_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2160_c7_72ba_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2160_c7_72ba]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2160_c7_72ba_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2160_c7_72ba_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2160_c7_72ba_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2160_c7_72ba_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2160_c7_72ba]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2160_c7_72ba_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2160_c7_72ba_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2160_c7_72ba_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2160_c7_72ba_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2160_c7_72ba]
signal tmp16_MUX_uxn_opcodes_h_l2160_c7_72ba_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2160_c7_72ba_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2160_c7_72ba_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2160_c7_72ba_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2161_c3_ae8b]
signal BIN_OP_OR_uxn_opcodes_h_l2161_c3_ae8b_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2161_c3_ae8b_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2161_c3_ae8b_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2164_c32_4f61]
signal BIN_OP_AND_uxn_opcodes_h_l2164_c32_4f61_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2164_c32_4f61_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2164_c32_4f61_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2164_c32_d61d]
signal BIN_OP_GT_uxn_opcodes_h_l2164_c32_d61d_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2164_c32_d61d_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2164_c32_d61d_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2164_c32_6268]
signal MUX_uxn_opcodes_h_l2164_c32_6268_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2164_c32_6268_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2164_c32_6268_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2164_c32_6268_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2166_c11_fb19]
signal BIN_OP_EQ_uxn_opcodes_h_l2166_c11_fb19_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2166_c11_fb19_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2166_c11_fb19_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2166_c7_8aae]
signal result_stack_value_MUX_uxn_opcodes_h_l2166_c7_8aae_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2166_c7_8aae_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2166_c7_8aae_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2166_c7_8aae_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2166_c7_8aae]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2166_c7_8aae_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2166_c7_8aae_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2166_c7_8aae_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2166_c7_8aae_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2166_c7_8aae]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2166_c7_8aae_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2166_c7_8aae_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2166_c7_8aae_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2166_c7_8aae_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2166_c7_8aae]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2166_c7_8aae_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2166_c7_8aae_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2166_c7_8aae_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2166_c7_8aae_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2166_c7_8aae]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2166_c7_8aae_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2166_c7_8aae_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2166_c7_8aae_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2166_c7_8aae_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2166_c7_8aae]
signal tmp16_MUX_uxn_opcodes_h_l2166_c7_8aae_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2166_c7_8aae_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2166_c7_8aae_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2166_c7_8aae_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2167_c20_1a27]
signal BIN_OP_AND_uxn_opcodes_h_l2167_c20_1a27_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2167_c20_1a27_right : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2167_c20_1a27_return_output : unsigned(7 downto 0);

-- BIN_OP_SR[uxn_opcodes_h_l2167_c12_85b2]
signal BIN_OP_SR_uxn_opcodes_h_l2167_c12_85b2_left : unsigned(15 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2167_c12_85b2_right : unsigned(7 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2167_c12_85b2_return_output : unsigned(15 downto 0);

-- CONST_SR_4[uxn_opcodes_h_l2167_c36_696f]
signal CONST_SR_4_uxn_opcodes_h_l2167_c36_696f_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_opcodes_h_l2167_c36_696f_return_output : unsigned(7 downto 0);

-- BIN_OP_SL[uxn_opcodes_h_l2167_c12_384f]
signal BIN_OP_SL_uxn_opcodes_h_l2167_c12_384f_left : unsigned(15 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2167_c12_384f_right : unsigned(7 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2167_c12_384f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2173_c11_d06e]
signal BIN_OP_EQ_uxn_opcodes_h_l2173_c11_d06e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2173_c11_d06e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2173_c11_d06e_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2173_c7_0e4f]
signal result_stack_value_MUX_uxn_opcodes_h_l2173_c7_0e4f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2173_c7_0e4f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2173_c7_0e4f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2173_c7_0e4f_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2173_c7_0e4f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_0e4f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_0e4f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_0e4f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_0e4f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2173_c7_0e4f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_0e4f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_0e4f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_0e4f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_0e4f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2173_c7_0e4f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_0e4f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_0e4f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_0e4f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_0e4f_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2175_c34_3481]
signal CONST_SR_8_uxn_opcodes_h_l2175_c34_3481_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2175_c34_3481_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2177_c11_3681]
signal BIN_OP_EQ_uxn_opcodes_h_l2177_c11_3681_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2177_c11_3681_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2177_c11_3681_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2177_c7_28f7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2177_c7_28f7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2177_c7_28f7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2177_c7_28f7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2177_c7_28f7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2177_c7_28f7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2177_c7_28f7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2177_c7_28f7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2177_c7_28f7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2177_c7_28f7_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_df93( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_value := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_stack_read := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.is_opc_done := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2136_c6_7876
BIN_OP_EQ_uxn_opcodes_h_l2136_c6_7876 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2136_c6_7876_left,
BIN_OP_EQ_uxn_opcodes_h_l2136_c6_7876_right,
BIN_OP_EQ_uxn_opcodes_h_l2136_c6_7876_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2136_c1_261d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2136_c1_261d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2136_c1_261d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2136_c1_261d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2136_c1_261d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2136_c1_261d_return_output);

-- n16_MUX_uxn_opcodes_h_l2136_c2_e08d
n16_MUX_uxn_opcodes_h_l2136_c2_e08d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2136_c2_e08d_cond,
n16_MUX_uxn_opcodes_h_l2136_c2_e08d_iftrue,
n16_MUX_uxn_opcodes_h_l2136_c2_e08d_iffalse,
n16_MUX_uxn_opcodes_h_l2136_c2_e08d_return_output);

-- t8_MUX_uxn_opcodes_h_l2136_c2_e08d
t8_MUX_uxn_opcodes_h_l2136_c2_e08d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2136_c2_e08d_cond,
t8_MUX_uxn_opcodes_h_l2136_c2_e08d_iftrue,
t8_MUX_uxn_opcodes_h_l2136_c2_e08d_iffalse,
t8_MUX_uxn_opcodes_h_l2136_c2_e08d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2136_c2_e08d
result_stack_value_MUX_uxn_opcodes_h_l2136_c2_e08d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2136_c2_e08d_cond,
result_stack_value_MUX_uxn_opcodes_h_l2136_c2_e08d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2136_c2_e08d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2136_c2_e08d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c2_e08d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c2_e08d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c2_e08d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c2_e08d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c2_e08d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c2_e08d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c2_e08d
result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c2_e08d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c2_e08d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c2_e08d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c2_e08d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c2_e08d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2136_c2_e08d
result_is_stack_read_MUX_uxn_opcodes_h_l2136_c2_e08d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2136_c2_e08d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2136_c2_e08d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2136_c2_e08d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2136_c2_e08d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c2_e08d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c2_e08d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c2_e08d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c2_e08d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c2_e08d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c2_e08d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2136_c2_e08d
result_is_stack_write_MUX_uxn_opcodes_h_l2136_c2_e08d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2136_c2_e08d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2136_c2_e08d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2136_c2_e08d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2136_c2_e08d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2136_c2_e08d
result_is_opc_done_MUX_uxn_opcodes_h_l2136_c2_e08d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2136_c2_e08d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2136_c2_e08d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2136_c2_e08d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2136_c2_e08d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2136_c2_e08d
tmp16_MUX_uxn_opcodes_h_l2136_c2_e08d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2136_c2_e08d_cond,
tmp16_MUX_uxn_opcodes_h_l2136_c2_e08d_iftrue,
tmp16_MUX_uxn_opcodes_h_l2136_c2_e08d_iffalse,
tmp16_MUX_uxn_opcodes_h_l2136_c2_e08d_return_output);

-- printf_uxn_opcodes_h_l2137_c3_bd4c_uxn_opcodes_h_l2137_c3_bd4c
printf_uxn_opcodes_h_l2137_c3_bd4c_uxn_opcodes_h_l2137_c3_bd4c : entity work.printf_uxn_opcodes_h_l2137_c3_bd4c_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2137_c3_bd4c_uxn_opcodes_h_l2137_c3_bd4c_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2142_c11_8ec3
BIN_OP_EQ_uxn_opcodes_h_l2142_c11_8ec3 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2142_c11_8ec3_left,
BIN_OP_EQ_uxn_opcodes_h_l2142_c11_8ec3_right,
BIN_OP_EQ_uxn_opcodes_h_l2142_c11_8ec3_return_output);

-- n16_MUX_uxn_opcodes_h_l2142_c7_d746
n16_MUX_uxn_opcodes_h_l2142_c7_d746 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2142_c7_d746_cond,
n16_MUX_uxn_opcodes_h_l2142_c7_d746_iftrue,
n16_MUX_uxn_opcodes_h_l2142_c7_d746_iffalse,
n16_MUX_uxn_opcodes_h_l2142_c7_d746_return_output);

-- t8_MUX_uxn_opcodes_h_l2142_c7_d746
t8_MUX_uxn_opcodes_h_l2142_c7_d746 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2142_c7_d746_cond,
t8_MUX_uxn_opcodes_h_l2142_c7_d746_iftrue,
t8_MUX_uxn_opcodes_h_l2142_c7_d746_iffalse,
t8_MUX_uxn_opcodes_h_l2142_c7_d746_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2142_c7_d746
result_stack_value_MUX_uxn_opcodes_h_l2142_c7_d746 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2142_c7_d746_cond,
result_stack_value_MUX_uxn_opcodes_h_l2142_c7_d746_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2142_c7_d746_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2142_c7_d746_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c7_d746
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c7_d746 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c7_d746_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c7_d746_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c7_d746_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c7_d746_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2142_c7_d746
result_is_sp_shift_MUX_uxn_opcodes_h_l2142_c7_d746 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2142_c7_d746_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2142_c7_d746_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2142_c7_d746_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2142_c7_d746_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2142_c7_d746
result_is_stack_read_MUX_uxn_opcodes_h_l2142_c7_d746 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2142_c7_d746_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2142_c7_d746_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2142_c7_d746_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2142_c7_d746_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c7_d746
result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c7_d746 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c7_d746_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c7_d746_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c7_d746_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c7_d746_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2142_c7_d746
result_is_stack_write_MUX_uxn_opcodes_h_l2142_c7_d746 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2142_c7_d746_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2142_c7_d746_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2142_c7_d746_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2142_c7_d746_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_d746
result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_d746 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_d746_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_d746_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_d746_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_d746_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2142_c7_d746
tmp16_MUX_uxn_opcodes_h_l2142_c7_d746 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2142_c7_d746_cond,
tmp16_MUX_uxn_opcodes_h_l2142_c7_d746_iftrue,
tmp16_MUX_uxn_opcodes_h_l2142_c7_d746_iffalse,
tmp16_MUX_uxn_opcodes_h_l2142_c7_d746_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2145_c11_0cb0
BIN_OP_EQ_uxn_opcodes_h_l2145_c11_0cb0 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2145_c11_0cb0_left,
BIN_OP_EQ_uxn_opcodes_h_l2145_c11_0cb0_right,
BIN_OP_EQ_uxn_opcodes_h_l2145_c11_0cb0_return_output);

-- n16_MUX_uxn_opcodes_h_l2145_c7_b2b7
n16_MUX_uxn_opcodes_h_l2145_c7_b2b7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2145_c7_b2b7_cond,
n16_MUX_uxn_opcodes_h_l2145_c7_b2b7_iftrue,
n16_MUX_uxn_opcodes_h_l2145_c7_b2b7_iffalse,
n16_MUX_uxn_opcodes_h_l2145_c7_b2b7_return_output);

-- t8_MUX_uxn_opcodes_h_l2145_c7_b2b7
t8_MUX_uxn_opcodes_h_l2145_c7_b2b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2145_c7_b2b7_cond,
t8_MUX_uxn_opcodes_h_l2145_c7_b2b7_iftrue,
t8_MUX_uxn_opcodes_h_l2145_c7_b2b7_iffalse,
t8_MUX_uxn_opcodes_h_l2145_c7_b2b7_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2145_c7_b2b7
result_stack_value_MUX_uxn_opcodes_h_l2145_c7_b2b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2145_c7_b2b7_cond,
result_stack_value_MUX_uxn_opcodes_h_l2145_c7_b2b7_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2145_c7_b2b7_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2145_c7_b2b7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_b2b7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_b2b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_b2b7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_b2b7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_b2b7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_b2b7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_b2b7
result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_b2b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_b2b7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_b2b7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_b2b7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_b2b7_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2145_c7_b2b7
result_is_stack_read_MUX_uxn_opcodes_h_l2145_c7_b2b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2145_c7_b2b7_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2145_c7_b2b7_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2145_c7_b2b7_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2145_c7_b2b7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_b2b7
result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_b2b7 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_b2b7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_b2b7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_b2b7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_b2b7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_b2b7
result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_b2b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_b2b7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_b2b7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_b2b7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_b2b7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_b2b7
result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_b2b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_b2b7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_b2b7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_b2b7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_b2b7_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2145_c7_b2b7
tmp16_MUX_uxn_opcodes_h_l2145_c7_b2b7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2145_c7_b2b7_cond,
tmp16_MUX_uxn_opcodes_h_l2145_c7_b2b7_iftrue,
tmp16_MUX_uxn_opcodes_h_l2145_c7_b2b7_iffalse,
tmp16_MUX_uxn_opcodes_h_l2145_c7_b2b7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2149_c11_93f4
BIN_OP_EQ_uxn_opcodes_h_l2149_c11_93f4 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2149_c11_93f4_left,
BIN_OP_EQ_uxn_opcodes_h_l2149_c11_93f4_right,
BIN_OP_EQ_uxn_opcodes_h_l2149_c11_93f4_return_output);

-- n16_MUX_uxn_opcodes_h_l2149_c7_304c
n16_MUX_uxn_opcodes_h_l2149_c7_304c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2149_c7_304c_cond,
n16_MUX_uxn_opcodes_h_l2149_c7_304c_iftrue,
n16_MUX_uxn_opcodes_h_l2149_c7_304c_iffalse,
n16_MUX_uxn_opcodes_h_l2149_c7_304c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2149_c7_304c
result_stack_value_MUX_uxn_opcodes_h_l2149_c7_304c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2149_c7_304c_cond,
result_stack_value_MUX_uxn_opcodes_h_l2149_c7_304c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2149_c7_304c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2149_c7_304c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_304c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_304c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_304c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_304c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_304c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_304c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_304c
result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_304c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_304c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_304c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_304c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_304c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2149_c7_304c
result_is_stack_read_MUX_uxn_opcodes_h_l2149_c7_304c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2149_c7_304c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2149_c7_304c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2149_c7_304c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2149_c7_304c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_304c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_304c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_304c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_304c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_304c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_304c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_304c
result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_304c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_304c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_304c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_304c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_304c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_304c
result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_304c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_304c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_304c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_304c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_304c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2149_c7_304c
tmp16_MUX_uxn_opcodes_h_l2149_c7_304c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2149_c7_304c_cond,
tmp16_MUX_uxn_opcodes_h_l2149_c7_304c_iftrue,
tmp16_MUX_uxn_opcodes_h_l2149_c7_304c_iffalse,
tmp16_MUX_uxn_opcodes_h_l2149_c7_304c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2152_c11_a822
BIN_OP_EQ_uxn_opcodes_h_l2152_c11_a822 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2152_c11_a822_left,
BIN_OP_EQ_uxn_opcodes_h_l2152_c11_a822_right,
BIN_OP_EQ_uxn_opcodes_h_l2152_c11_a822_return_output);

-- n16_MUX_uxn_opcodes_h_l2152_c7_a69d
n16_MUX_uxn_opcodes_h_l2152_c7_a69d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2152_c7_a69d_cond,
n16_MUX_uxn_opcodes_h_l2152_c7_a69d_iftrue,
n16_MUX_uxn_opcodes_h_l2152_c7_a69d_iffalse,
n16_MUX_uxn_opcodes_h_l2152_c7_a69d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2152_c7_a69d
result_stack_value_MUX_uxn_opcodes_h_l2152_c7_a69d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2152_c7_a69d_cond,
result_stack_value_MUX_uxn_opcodes_h_l2152_c7_a69d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2152_c7_a69d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2152_c7_a69d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2152_c7_a69d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2152_c7_a69d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2152_c7_a69d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2152_c7_a69d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2152_c7_a69d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2152_c7_a69d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2152_c7_a69d
result_is_sp_shift_MUX_uxn_opcodes_h_l2152_c7_a69d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2152_c7_a69d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2152_c7_a69d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2152_c7_a69d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2152_c7_a69d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2152_c7_a69d
result_is_stack_read_MUX_uxn_opcodes_h_l2152_c7_a69d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2152_c7_a69d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2152_c7_a69d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2152_c7_a69d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2152_c7_a69d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2152_c7_a69d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2152_c7_a69d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2152_c7_a69d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2152_c7_a69d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2152_c7_a69d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2152_c7_a69d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2152_c7_a69d
result_is_stack_write_MUX_uxn_opcodes_h_l2152_c7_a69d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2152_c7_a69d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2152_c7_a69d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2152_c7_a69d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2152_c7_a69d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2152_c7_a69d
result_is_opc_done_MUX_uxn_opcodes_h_l2152_c7_a69d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2152_c7_a69d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2152_c7_a69d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2152_c7_a69d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2152_c7_a69d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2152_c7_a69d
tmp16_MUX_uxn_opcodes_h_l2152_c7_a69d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2152_c7_a69d_cond,
tmp16_MUX_uxn_opcodes_h_l2152_c7_a69d_iftrue,
tmp16_MUX_uxn_opcodes_h_l2152_c7_a69d_iffalse,
tmp16_MUX_uxn_opcodes_h_l2152_c7_a69d_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2154_c3_df46
CONST_SL_8_uxn_opcodes_h_l2154_c3_df46 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2154_c3_df46_x,
CONST_SL_8_uxn_opcodes_h_l2154_c3_df46_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2157_c11_a2fc
BIN_OP_EQ_uxn_opcodes_h_l2157_c11_a2fc : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2157_c11_a2fc_left,
BIN_OP_EQ_uxn_opcodes_h_l2157_c11_a2fc_right,
BIN_OP_EQ_uxn_opcodes_h_l2157_c11_a2fc_return_output);

-- n16_MUX_uxn_opcodes_h_l2157_c7_130c
n16_MUX_uxn_opcodes_h_l2157_c7_130c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2157_c7_130c_cond,
n16_MUX_uxn_opcodes_h_l2157_c7_130c_iftrue,
n16_MUX_uxn_opcodes_h_l2157_c7_130c_iffalse,
n16_MUX_uxn_opcodes_h_l2157_c7_130c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2157_c7_130c
result_stack_value_MUX_uxn_opcodes_h_l2157_c7_130c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2157_c7_130c_cond,
result_stack_value_MUX_uxn_opcodes_h_l2157_c7_130c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2157_c7_130c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2157_c7_130c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2157_c7_130c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2157_c7_130c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2157_c7_130c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2157_c7_130c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2157_c7_130c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2157_c7_130c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2157_c7_130c
result_is_sp_shift_MUX_uxn_opcodes_h_l2157_c7_130c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2157_c7_130c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2157_c7_130c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2157_c7_130c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2157_c7_130c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2157_c7_130c
result_is_stack_read_MUX_uxn_opcodes_h_l2157_c7_130c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2157_c7_130c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2157_c7_130c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2157_c7_130c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2157_c7_130c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2157_c7_130c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2157_c7_130c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2157_c7_130c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2157_c7_130c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2157_c7_130c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2157_c7_130c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2157_c7_130c
result_is_stack_write_MUX_uxn_opcodes_h_l2157_c7_130c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2157_c7_130c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2157_c7_130c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2157_c7_130c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2157_c7_130c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2157_c7_130c
result_is_opc_done_MUX_uxn_opcodes_h_l2157_c7_130c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2157_c7_130c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2157_c7_130c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2157_c7_130c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2157_c7_130c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2157_c7_130c
tmp16_MUX_uxn_opcodes_h_l2157_c7_130c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2157_c7_130c_cond,
tmp16_MUX_uxn_opcodes_h_l2157_c7_130c_iftrue,
tmp16_MUX_uxn_opcodes_h_l2157_c7_130c_iffalse,
tmp16_MUX_uxn_opcodes_h_l2157_c7_130c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2160_c11_e244
BIN_OP_EQ_uxn_opcodes_h_l2160_c11_e244 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2160_c11_e244_left,
BIN_OP_EQ_uxn_opcodes_h_l2160_c11_e244_right,
BIN_OP_EQ_uxn_opcodes_h_l2160_c11_e244_return_output);

-- n16_MUX_uxn_opcodes_h_l2160_c7_72ba
n16_MUX_uxn_opcodes_h_l2160_c7_72ba : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2160_c7_72ba_cond,
n16_MUX_uxn_opcodes_h_l2160_c7_72ba_iftrue,
n16_MUX_uxn_opcodes_h_l2160_c7_72ba_iffalse,
n16_MUX_uxn_opcodes_h_l2160_c7_72ba_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2160_c7_72ba
result_stack_value_MUX_uxn_opcodes_h_l2160_c7_72ba : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2160_c7_72ba_cond,
result_stack_value_MUX_uxn_opcodes_h_l2160_c7_72ba_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2160_c7_72ba_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2160_c7_72ba_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2160_c7_72ba
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2160_c7_72ba : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2160_c7_72ba_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2160_c7_72ba_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2160_c7_72ba_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2160_c7_72ba_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2160_c7_72ba
result_is_sp_shift_MUX_uxn_opcodes_h_l2160_c7_72ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2160_c7_72ba_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2160_c7_72ba_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2160_c7_72ba_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2160_c7_72ba_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2160_c7_72ba
result_is_stack_read_MUX_uxn_opcodes_h_l2160_c7_72ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2160_c7_72ba_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2160_c7_72ba_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2160_c7_72ba_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2160_c7_72ba_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2160_c7_72ba
result_sp_relative_shift_MUX_uxn_opcodes_h_l2160_c7_72ba : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2160_c7_72ba_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2160_c7_72ba_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2160_c7_72ba_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2160_c7_72ba_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2160_c7_72ba
result_is_stack_write_MUX_uxn_opcodes_h_l2160_c7_72ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2160_c7_72ba_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2160_c7_72ba_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2160_c7_72ba_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2160_c7_72ba_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2160_c7_72ba
result_is_opc_done_MUX_uxn_opcodes_h_l2160_c7_72ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2160_c7_72ba_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2160_c7_72ba_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2160_c7_72ba_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2160_c7_72ba_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2160_c7_72ba
tmp16_MUX_uxn_opcodes_h_l2160_c7_72ba : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2160_c7_72ba_cond,
tmp16_MUX_uxn_opcodes_h_l2160_c7_72ba_iftrue,
tmp16_MUX_uxn_opcodes_h_l2160_c7_72ba_iffalse,
tmp16_MUX_uxn_opcodes_h_l2160_c7_72ba_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2161_c3_ae8b
BIN_OP_OR_uxn_opcodes_h_l2161_c3_ae8b : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2161_c3_ae8b_left,
BIN_OP_OR_uxn_opcodes_h_l2161_c3_ae8b_right,
BIN_OP_OR_uxn_opcodes_h_l2161_c3_ae8b_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2164_c32_4f61
BIN_OP_AND_uxn_opcodes_h_l2164_c32_4f61 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2164_c32_4f61_left,
BIN_OP_AND_uxn_opcodes_h_l2164_c32_4f61_right,
BIN_OP_AND_uxn_opcodes_h_l2164_c32_4f61_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2164_c32_d61d
BIN_OP_GT_uxn_opcodes_h_l2164_c32_d61d : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2164_c32_d61d_left,
BIN_OP_GT_uxn_opcodes_h_l2164_c32_d61d_right,
BIN_OP_GT_uxn_opcodes_h_l2164_c32_d61d_return_output);

-- MUX_uxn_opcodes_h_l2164_c32_6268
MUX_uxn_opcodes_h_l2164_c32_6268 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2164_c32_6268_cond,
MUX_uxn_opcodes_h_l2164_c32_6268_iftrue,
MUX_uxn_opcodes_h_l2164_c32_6268_iffalse,
MUX_uxn_opcodes_h_l2164_c32_6268_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2166_c11_fb19
BIN_OP_EQ_uxn_opcodes_h_l2166_c11_fb19 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2166_c11_fb19_left,
BIN_OP_EQ_uxn_opcodes_h_l2166_c11_fb19_right,
BIN_OP_EQ_uxn_opcodes_h_l2166_c11_fb19_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2166_c7_8aae
result_stack_value_MUX_uxn_opcodes_h_l2166_c7_8aae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2166_c7_8aae_cond,
result_stack_value_MUX_uxn_opcodes_h_l2166_c7_8aae_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2166_c7_8aae_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2166_c7_8aae_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2166_c7_8aae
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2166_c7_8aae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2166_c7_8aae_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2166_c7_8aae_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2166_c7_8aae_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2166_c7_8aae_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2166_c7_8aae
result_is_sp_shift_MUX_uxn_opcodes_h_l2166_c7_8aae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2166_c7_8aae_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2166_c7_8aae_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2166_c7_8aae_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2166_c7_8aae_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2166_c7_8aae
result_is_stack_write_MUX_uxn_opcodes_h_l2166_c7_8aae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2166_c7_8aae_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2166_c7_8aae_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2166_c7_8aae_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2166_c7_8aae_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2166_c7_8aae
result_is_opc_done_MUX_uxn_opcodes_h_l2166_c7_8aae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2166_c7_8aae_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2166_c7_8aae_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2166_c7_8aae_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2166_c7_8aae_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2166_c7_8aae
tmp16_MUX_uxn_opcodes_h_l2166_c7_8aae : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2166_c7_8aae_cond,
tmp16_MUX_uxn_opcodes_h_l2166_c7_8aae_iftrue,
tmp16_MUX_uxn_opcodes_h_l2166_c7_8aae_iffalse,
tmp16_MUX_uxn_opcodes_h_l2166_c7_8aae_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2167_c20_1a27
BIN_OP_AND_uxn_opcodes_h_l2167_c20_1a27 : entity work.BIN_OP_AND_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2167_c20_1a27_left,
BIN_OP_AND_uxn_opcodes_h_l2167_c20_1a27_right,
BIN_OP_AND_uxn_opcodes_h_l2167_c20_1a27_return_output);

-- BIN_OP_SR_uxn_opcodes_h_l2167_c12_85b2
BIN_OP_SR_uxn_opcodes_h_l2167_c12_85b2 : entity work.BIN_OP_SR_uint16_t_uint8_t_0CLK_295015b8 port map (
BIN_OP_SR_uxn_opcodes_h_l2167_c12_85b2_left,
BIN_OP_SR_uxn_opcodes_h_l2167_c12_85b2_right,
BIN_OP_SR_uxn_opcodes_h_l2167_c12_85b2_return_output);

-- CONST_SR_4_uxn_opcodes_h_l2167_c36_696f
CONST_SR_4_uxn_opcodes_h_l2167_c36_696f : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_opcodes_h_l2167_c36_696f_x,
CONST_SR_4_uxn_opcodes_h_l2167_c36_696f_return_output);

-- BIN_OP_SL_uxn_opcodes_h_l2167_c12_384f
BIN_OP_SL_uxn_opcodes_h_l2167_c12_384f : entity work.BIN_OP_SL_uint16_t_uint8_t_0CLK_b6546dec port map (
BIN_OP_SL_uxn_opcodes_h_l2167_c12_384f_left,
BIN_OP_SL_uxn_opcodes_h_l2167_c12_384f_right,
BIN_OP_SL_uxn_opcodes_h_l2167_c12_384f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2173_c11_d06e
BIN_OP_EQ_uxn_opcodes_h_l2173_c11_d06e : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2173_c11_d06e_left,
BIN_OP_EQ_uxn_opcodes_h_l2173_c11_d06e_right,
BIN_OP_EQ_uxn_opcodes_h_l2173_c11_d06e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2173_c7_0e4f
result_stack_value_MUX_uxn_opcodes_h_l2173_c7_0e4f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2173_c7_0e4f_cond,
result_stack_value_MUX_uxn_opcodes_h_l2173_c7_0e4f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2173_c7_0e4f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2173_c7_0e4f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_0e4f
result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_0e4f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_0e4f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_0e4f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_0e4f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_0e4f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_0e4f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_0e4f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_0e4f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_0e4f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_0e4f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_0e4f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_0e4f
result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_0e4f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_0e4f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_0e4f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_0e4f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_0e4f_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2175_c34_3481
CONST_SR_8_uxn_opcodes_h_l2175_c34_3481 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2175_c34_3481_x,
CONST_SR_8_uxn_opcodes_h_l2175_c34_3481_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2177_c11_3681
BIN_OP_EQ_uxn_opcodes_h_l2177_c11_3681 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2177_c11_3681_left,
BIN_OP_EQ_uxn_opcodes_h_l2177_c11_3681_right,
BIN_OP_EQ_uxn_opcodes_h_l2177_c11_3681_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2177_c7_28f7
result_is_stack_write_MUX_uxn_opcodes_h_l2177_c7_28f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2177_c7_28f7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2177_c7_28f7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2177_c7_28f7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2177_c7_28f7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2177_c7_28f7
result_is_opc_done_MUX_uxn_opcodes_h_l2177_c7_28f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2177_c7_28f7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2177_c7_28f7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2177_c7_28f7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2177_c7_28f7_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2136_c6_7876_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2136_c1_261d_return_output,
 n16_MUX_uxn_opcodes_h_l2136_c2_e08d_return_output,
 t8_MUX_uxn_opcodes_h_l2136_c2_e08d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2136_c2_e08d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c2_e08d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c2_e08d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2136_c2_e08d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c2_e08d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2136_c2_e08d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2136_c2_e08d_return_output,
 tmp16_MUX_uxn_opcodes_h_l2136_c2_e08d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2142_c11_8ec3_return_output,
 n16_MUX_uxn_opcodes_h_l2142_c7_d746_return_output,
 t8_MUX_uxn_opcodes_h_l2142_c7_d746_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2142_c7_d746_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c7_d746_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2142_c7_d746_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2142_c7_d746_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c7_d746_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2142_c7_d746_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_d746_return_output,
 tmp16_MUX_uxn_opcodes_h_l2142_c7_d746_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2145_c11_0cb0_return_output,
 n16_MUX_uxn_opcodes_h_l2145_c7_b2b7_return_output,
 t8_MUX_uxn_opcodes_h_l2145_c7_b2b7_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2145_c7_b2b7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_b2b7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_b2b7_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2145_c7_b2b7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_b2b7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_b2b7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_b2b7_return_output,
 tmp16_MUX_uxn_opcodes_h_l2145_c7_b2b7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2149_c11_93f4_return_output,
 n16_MUX_uxn_opcodes_h_l2149_c7_304c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2149_c7_304c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_304c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_304c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2149_c7_304c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_304c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_304c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_304c_return_output,
 tmp16_MUX_uxn_opcodes_h_l2149_c7_304c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2152_c11_a822_return_output,
 n16_MUX_uxn_opcodes_h_l2152_c7_a69d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2152_c7_a69d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2152_c7_a69d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2152_c7_a69d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2152_c7_a69d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2152_c7_a69d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2152_c7_a69d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2152_c7_a69d_return_output,
 tmp16_MUX_uxn_opcodes_h_l2152_c7_a69d_return_output,
 CONST_SL_8_uxn_opcodes_h_l2154_c3_df46_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2157_c11_a2fc_return_output,
 n16_MUX_uxn_opcodes_h_l2157_c7_130c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2157_c7_130c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2157_c7_130c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2157_c7_130c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2157_c7_130c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2157_c7_130c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2157_c7_130c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2157_c7_130c_return_output,
 tmp16_MUX_uxn_opcodes_h_l2157_c7_130c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2160_c11_e244_return_output,
 n16_MUX_uxn_opcodes_h_l2160_c7_72ba_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2160_c7_72ba_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2160_c7_72ba_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2160_c7_72ba_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2160_c7_72ba_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2160_c7_72ba_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2160_c7_72ba_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2160_c7_72ba_return_output,
 tmp16_MUX_uxn_opcodes_h_l2160_c7_72ba_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2161_c3_ae8b_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2164_c32_4f61_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2164_c32_d61d_return_output,
 MUX_uxn_opcodes_h_l2164_c32_6268_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2166_c11_fb19_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2166_c7_8aae_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2166_c7_8aae_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2166_c7_8aae_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2166_c7_8aae_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2166_c7_8aae_return_output,
 tmp16_MUX_uxn_opcodes_h_l2166_c7_8aae_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2167_c20_1a27_return_output,
 BIN_OP_SR_uxn_opcodes_h_l2167_c12_85b2_return_output,
 CONST_SR_4_uxn_opcodes_h_l2167_c36_696f_return_output,
 BIN_OP_SL_uxn_opcodes_h_l2167_c12_384f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2173_c11_d06e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2173_c7_0e4f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_0e4f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_0e4f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_0e4f_return_output,
 CONST_SR_8_uxn_opcodes_h_l2175_c34_3481_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2177_c11_3681_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2177_c7_28f7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2177_c7_28f7_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c6_7876_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c6_7876_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c6_7876_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2136_c1_261d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2136_c1_261d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2136_c1_261d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2136_c1_261d_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2136_c2_e08d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2136_c2_e08d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2142_c7_d746_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2136_c2_e08d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2136_c2_e08d_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2136_c2_e08d_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2136_c2_e08d_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2142_c7_d746_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2136_c2_e08d_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2136_c2_e08d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2136_c2_e08d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2136_c2_e08d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2142_c7_d746_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2136_c2_e08d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2136_c2_e08d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c2_e08d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2139_c3_bf05 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c2_e08d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c7_d746_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c2_e08d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c2_e08d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c2_e08d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c2_e08d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2142_c7_d746_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c2_e08d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c2_e08d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2136_c2_e08d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2136_c2_e08d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2142_c7_d746_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2136_c2_e08d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2136_c2_e08d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c2_e08d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c2_e08d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c7_d746_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c2_e08d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c2_e08d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2136_c2_e08d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2136_c2_e08d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2142_c7_d746_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2136_c2_e08d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2136_c2_e08d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2136_c2_e08d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2136_c2_e08d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_d746_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2136_c2_e08d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2136_c2_e08d_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2136_c2_e08d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2136_c2_e08d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2142_c7_d746_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2136_c2_e08d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2136_c2_e08d_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2137_c3_bd4c_uxn_opcodes_h_l2137_c3_bd4c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2142_c11_8ec3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2142_c11_8ec3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2142_c11_8ec3_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2142_c7_d746_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2142_c7_d746_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2145_c7_b2b7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2142_c7_d746_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2142_c7_d746_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2142_c7_d746_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2145_c7_b2b7_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2142_c7_d746_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2142_c7_d746_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2142_c7_d746_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2145_c7_b2b7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2142_c7_d746_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c7_d746_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2143_c3_e268 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c7_d746_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_b2b7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c7_d746_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2142_c7_d746_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2142_c7_d746_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_b2b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2142_c7_d746_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2142_c7_d746_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2142_c7_d746_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2145_c7_b2b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2142_c7_d746_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c7_d746_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c7_d746_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_b2b7_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c7_d746_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2142_c7_d746_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2142_c7_d746_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_b2b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2142_c7_d746_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_d746_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_d746_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_b2b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_d746_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2142_c7_d746_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2142_c7_d746_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2145_c7_b2b7_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2142_c7_d746_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_0cb0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_0cb0_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_0cb0_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2145_c7_b2b7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2145_c7_b2b7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2149_c7_304c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2145_c7_b2b7_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2145_c7_b2b7_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2145_c7_b2b7_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2145_c7_b2b7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2145_c7_b2b7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2145_c7_b2b7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2149_c7_304c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2145_c7_b2b7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_b2b7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2147_c3_f5fd : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_b2b7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_304c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_b2b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_b2b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_b2b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_304c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_b2b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2145_c7_b2b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2145_c7_b2b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2149_c7_304c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2145_c7_b2b7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_b2b7_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_b2b7_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_304c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_b2b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_b2b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_b2b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_304c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_b2b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_b2b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_b2b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_304c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_b2b7_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2145_c7_b2b7_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2145_c7_b2b7_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2149_c7_304c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2145_c7_b2b7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_93f4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_93f4_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_93f4_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2149_c7_304c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2149_c7_304c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2152_c7_a69d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2149_c7_304c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2149_c7_304c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2149_c7_304c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2152_c7_a69d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2149_c7_304c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_304c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2150_c3_f669 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_304c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2152_c7_a69d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_304c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_304c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_304c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2152_c7_a69d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_304c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2149_c7_304c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2149_c7_304c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2152_c7_a69d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2149_c7_304c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_304c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_304c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2152_c7_a69d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_304c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_304c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_304c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2152_c7_a69d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_304c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_304c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_304c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2152_c7_a69d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_304c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2149_c7_304c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2149_c7_304c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2152_c7_a69d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2149_c7_304c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2152_c11_a822_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2152_c11_a822_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2152_c11_a822_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2152_c7_a69d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2152_c7_a69d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2157_c7_130c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2152_c7_a69d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2152_c7_a69d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2152_c7_a69d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2157_c7_130c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2152_c7_a69d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2152_c7_a69d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2155_c3_eeb3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2152_c7_a69d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2157_c7_130c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2152_c7_a69d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2152_c7_a69d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2152_c7_a69d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2157_c7_130c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2152_c7_a69d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2152_c7_a69d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2152_c7_a69d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2157_c7_130c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2152_c7_a69d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2152_c7_a69d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2152_c7_a69d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2157_c7_130c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2152_c7_a69d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2152_c7_a69d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2152_c7_a69d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2157_c7_130c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2152_c7_a69d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2152_c7_a69d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2152_c7_a69d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2157_c7_130c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2152_c7_a69d_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2152_c7_a69d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2152_c7_a69d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2157_c7_130c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2152_c7_a69d_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2154_c3_df46_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2154_c3_df46_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2157_c11_a2fc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2157_c11_a2fc_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2157_c11_a2fc_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2157_c7_130c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2157_c7_130c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2160_c7_72ba_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2157_c7_130c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2157_c7_130c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2157_c7_130c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2160_c7_72ba_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2157_c7_130c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2157_c7_130c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2158_c3_8491 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2157_c7_130c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2160_c7_72ba_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2157_c7_130c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2157_c7_130c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2157_c7_130c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2160_c7_72ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2157_c7_130c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2157_c7_130c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2157_c7_130c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2160_c7_72ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2157_c7_130c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2157_c7_130c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2157_c7_130c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2160_c7_72ba_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2157_c7_130c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2157_c7_130c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2157_c7_130c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2160_c7_72ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2157_c7_130c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2157_c7_130c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2157_c7_130c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2160_c7_72ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2157_c7_130c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2157_c7_130c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2157_c7_130c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2160_c7_72ba_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2157_c7_130c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2160_c11_e244_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2160_c11_e244_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2160_c11_e244_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2160_c7_72ba_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2160_c7_72ba_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2160_c7_72ba_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2160_c7_72ba_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2160_c7_72ba_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2166_c7_8aae_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2160_c7_72ba_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2160_c7_72ba_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2160_c7_72ba_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2166_c7_8aae_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2160_c7_72ba_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2160_c7_72ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2160_c7_72ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2166_c7_8aae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2160_c7_72ba_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2160_c7_72ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2160_c7_72ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2160_c7_72ba_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2160_c7_72ba_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2160_c7_72ba_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2160_c7_72ba_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2160_c7_72ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2160_c7_72ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2166_c7_8aae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2160_c7_72ba_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2160_c7_72ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2160_c7_72ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2166_c7_8aae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2160_c7_72ba_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2160_c7_72ba_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2160_c7_72ba_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2166_c7_8aae_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2160_c7_72ba_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2161_c3_ae8b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2161_c3_ae8b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2161_c3_ae8b_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2164_c32_6268_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2164_c32_6268_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2164_c32_6268_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2164_c32_4f61_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2164_c32_4f61_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2164_c32_4f61_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2164_c32_d61d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2164_c32_d61d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2164_c32_d61d_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2164_c32_6268_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2166_c11_fb19_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2166_c11_fb19_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2166_c11_fb19_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2166_c7_8aae_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2166_c7_8aae_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2173_c7_0e4f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2166_c7_8aae_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2166_c7_8aae_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2170_c3_af78 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2166_c7_8aae_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_0e4f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2166_c7_8aae_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2166_c7_8aae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2166_c7_8aae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2166_c7_8aae_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2166_c7_8aae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2166_c7_8aae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_0e4f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2166_c7_8aae_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2166_c7_8aae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2166_c7_8aae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_0e4f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2166_c7_8aae_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2166_c7_8aae_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2166_c7_8aae_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2166_c7_8aae_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2167_c12_85b2_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2167_c20_1a27_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2167_c20_1a27_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2167_c20_1a27_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2167_c12_85b2_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2167_c12_85b2_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2167_c12_384f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2167_c12_384f_right : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2167_c36_696f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2167_c36_696f_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2167_c12_384f_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2171_c24_2ae6_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_d06e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_d06e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_d06e_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2173_c7_0e4f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2173_c7_0e4f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2173_c7_0e4f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_0e4f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_0e4f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2177_c7_28f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_0e4f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_0e4f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2174_c3_3451 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_0e4f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_0e4f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_0e4f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_0e4f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2177_c7_28f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_0e4f_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2175_c34_3481_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2175_c34_3481_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2175_c24_6706_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2177_c11_3681_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2177_c11_3681_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2177_c11_3681_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2177_c7_28f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2177_c7_28f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2177_c7_28f7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2177_c7_28f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2177_c7_28f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2177_c7_28f7_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2149_l2145_l2173_l2142_l2136_l2160_l2157_l2152_DUPLICATE_d927_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2149_l2145_l2142_l2166_l2136_l2157_l2152_DUPLICATE_89fa_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2149_l2145_l2142_l2136_l2160_l2157_l2152_DUPLICATE_ff4e_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2149_l2177_l2145_l2173_l2142_l2136_l2160_l2157_l2152_DUPLICATE_2d67_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2149_l2145_l2142_l2160_l2157_l2152_DUPLICATE_02af_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2149_l2177_l2145_l2173_l2142_l2166_l2160_l2157_l2152_DUPLICATE_4cb6_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2153_l2161_DUPLICATE_5e4e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2173_l2160_DUPLICATE_85ff_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l2131_l2182_DUPLICATE_ff29_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2177_c7_28f7_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2136_c1_261d_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2166_c7_8aae_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2164_c32_d61d_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2147_c3_f5fd := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_b2b7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2147_c3_f5fd;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2150_c3_f669 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_304c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2150_c3_f669;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2174_c3_3451 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_0e4f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2174_c3_3451;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2177_c7_28f7_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2139_c3_bf05 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c2_e08d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2139_c3_bf05;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2166_c7_8aae_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2177_c11_3681_right := to_unsigned(9, 4);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2136_c2_e08d_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2143_c3_e268 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c7_d746_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2143_c3_e268;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_93f4_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2142_c11_8ec3_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_0cb0_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2160_c11_e244_right := to_unsigned(6, 3);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2167_c20_1a27_right := to_unsigned(15, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2160_c7_72ba_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2158_c3_8491 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2157_c7_130c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2158_c3_8491;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2152_c11_a822_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2170_c3_af78 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2166_c7_8aae_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2170_c3_af78;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2160_c7_72ba_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2164_c32_6268_iffalse := resize(to_signed(-1, 2), 8);
     VAR_MUX_uxn_opcodes_h_l2164_c32_6268_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_d06e_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2155_c3_eeb3 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2152_c7_a69d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2155_c3_eeb3;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2166_c11_fb19_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c6_7876_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2157_c11_a2fc_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2136_c2_e08d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2164_c32_4f61_right := to_unsigned(128, 8);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2136_c1_261d_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2164_c32_4f61_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2161_c3_ae8b_left := n16;
     VAR_BIN_OP_SR_uxn_opcodes_h_l2167_c12_85b2_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2136_c2_e08d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2142_c7_d746_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2145_c7_b2b7_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2149_c7_304c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2157_c7_130c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2160_c7_72ba_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c6_7876_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2142_c11_8ec3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_0cb0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_93f4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2152_c11_a822_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2157_c11_a2fc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2160_c11_e244_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2166_c11_fb19_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_d06e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2177_c11_3681_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l2145_c7_b2b7_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2167_c20_1a27_left := t8;
     VAR_CONST_SR_4_uxn_opcodes_h_l2167_c36_696f_x := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2136_c2_e08d_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2142_c7_d746_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2145_c7_b2b7_iffalse := t8;
     VAR_CONST_SR_8_uxn_opcodes_h_l2175_c34_3481_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2136_c2_e08d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2142_c7_d746_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2145_c7_b2b7_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2149_c7_304c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2152_c7_a69d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2157_c7_130c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2160_c7_72ba_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2166_c7_8aae_iffalse := tmp16;
     -- CONST_SR_4[uxn_opcodes_h_l2167_c36_696f] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_opcodes_h_l2167_c36_696f_x <= VAR_CONST_SR_4_uxn_opcodes_h_l2167_c36_696f_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_opcodes_h_l2167_c36_696f_return_output := CONST_SR_4_uxn_opcodes_h_l2167_c36_696f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2177_c11_3681] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2177_c11_3681_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2177_c11_3681_left;
     BIN_OP_EQ_uxn_opcodes_h_l2177_c11_3681_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2177_c11_3681_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2177_c11_3681_return_output := BIN_OP_EQ_uxn_opcodes_h_l2177_c11_3681_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2164_c32_4f61] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2164_c32_4f61_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2164_c32_4f61_left;
     BIN_OP_AND_uxn_opcodes_h_l2164_c32_4f61_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2164_c32_4f61_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2164_c32_4f61_return_output := BIN_OP_AND_uxn_opcodes_h_l2164_c32_4f61_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2149_l2145_l2173_l2142_l2136_l2160_l2157_l2152_DUPLICATE_d927 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2149_l2145_l2173_l2142_l2136_l2160_l2157_l2152_DUPLICATE_d927_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2145_c11_0cb0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2145_c11_0cb0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_0cb0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2145_c11_0cb0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_0cb0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_0cb0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2145_c11_0cb0_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2149_l2177_l2145_l2173_l2142_l2166_l2160_l2157_l2152_DUPLICATE_4cb6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2149_l2177_l2145_l2173_l2142_l2166_l2160_l2157_l2152_DUPLICATE_4cb6_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2160_c11_e244] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2160_c11_e244_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2160_c11_e244_left;
     BIN_OP_EQ_uxn_opcodes_h_l2160_c11_e244_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2160_c11_e244_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2160_c11_e244_return_output := BIN_OP_EQ_uxn_opcodes_h_l2160_c11_e244_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2149_l2145_l2142_l2160_l2157_l2152_DUPLICATE_02af LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2149_l2145_l2142_l2160_l2157_l2152_DUPLICATE_02af_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l2173_c11_d06e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2173_c11_d06e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_d06e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2173_c11_d06e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_d06e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_d06e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2173_c11_d06e_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2167_c20_1a27] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2167_c20_1a27_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2167_c20_1a27_left;
     BIN_OP_AND_uxn_opcodes_h_l2167_c20_1a27_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2167_c20_1a27_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2167_c20_1a27_return_output := BIN_OP_AND_uxn_opcodes_h_l2167_c20_1a27_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2136_c6_7876] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2136_c6_7876_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c6_7876_left;
     BIN_OP_EQ_uxn_opcodes_h_l2136_c6_7876_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c6_7876_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c6_7876_return_output := BIN_OP_EQ_uxn_opcodes_h_l2136_c6_7876_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2157_c11_a2fc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2157_c11_a2fc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2157_c11_a2fc_left;
     BIN_OP_EQ_uxn_opcodes_h_l2157_c11_a2fc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2157_c11_a2fc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2157_c11_a2fc_return_output := BIN_OP_EQ_uxn_opcodes_h_l2157_c11_a2fc_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2173_l2160_DUPLICATE_85ff LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2173_l2160_DUPLICATE_85ff_return_output := result.stack_address_sp_offset;

     -- CONST_SR_8[uxn_opcodes_h_l2175_c34_3481] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2175_c34_3481_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2175_c34_3481_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2175_c34_3481_return_output := CONST_SR_8_uxn_opcodes_h_l2175_c34_3481_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2153_l2161_DUPLICATE_5e4e LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2153_l2161_DUPLICATE_5e4e_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2166_c11_fb19] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2166_c11_fb19_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2166_c11_fb19_left;
     BIN_OP_EQ_uxn_opcodes_h_l2166_c11_fb19_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2166_c11_fb19_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2166_c11_fb19_return_output := BIN_OP_EQ_uxn_opcodes_h_l2166_c11_fb19_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2142_c11_8ec3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2142_c11_8ec3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2142_c11_8ec3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2142_c11_8ec3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2142_c11_8ec3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2142_c11_8ec3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2142_c11_8ec3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2152_c11_a822] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2152_c11_a822_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2152_c11_a822_left;
     BIN_OP_EQ_uxn_opcodes_h_l2152_c11_a822_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2152_c11_a822_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2152_c11_a822_return_output := BIN_OP_EQ_uxn_opcodes_h_l2152_c11_a822_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2149_c11_93f4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2149_c11_93f4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_93f4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2149_c11_93f4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_93f4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_93f4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2149_c11_93f4_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2149_l2145_l2142_l2166_l2136_l2157_l2152_DUPLICATE_89fa LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2149_l2145_l2142_l2166_l2136_l2157_l2152_DUPLICATE_89fa_return_output := result.is_sp_shift;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2149_l2145_l2142_l2136_l2160_l2157_l2152_DUPLICATE_ff4e LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2149_l2145_l2142_l2136_l2160_l2157_l2152_DUPLICATE_ff4e_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2149_l2177_l2145_l2173_l2142_l2136_l2160_l2157_l2152_DUPLICATE_2d67 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2149_l2177_l2145_l2173_l2142_l2136_l2160_l2157_l2152_DUPLICATE_2d67_return_output := result.is_stack_write;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2164_c32_d61d_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2164_c32_4f61_return_output;
     VAR_BIN_OP_SR_uxn_opcodes_h_l2167_c12_85b2_right := VAR_BIN_OP_AND_uxn_opcodes_h_l2167_c20_1a27_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2136_c1_261d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c6_7876_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2136_c2_e08d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c6_7876_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2136_c2_e08d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c6_7876_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c2_e08d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c6_7876_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2136_c2_e08d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c6_7876_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2136_c2_e08d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c6_7876_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c2_e08d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c6_7876_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c2_e08d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c6_7876_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2136_c2_e08d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c6_7876_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2136_c2_e08d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c6_7876_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2136_c2_e08d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c6_7876_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2142_c7_d746_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2142_c11_8ec3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_d746_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2142_c11_8ec3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2142_c7_d746_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2142_c11_8ec3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2142_c7_d746_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2142_c11_8ec3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2142_c7_d746_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2142_c11_8ec3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c7_d746_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2142_c11_8ec3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c7_d746_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2142_c11_8ec3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2142_c7_d746_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2142_c11_8ec3_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2142_c7_d746_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2142_c11_8ec3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2142_c7_d746_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2142_c11_8ec3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2145_c7_b2b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_0cb0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_b2b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_0cb0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_b2b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_0cb0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2145_c7_b2b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_0cb0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_b2b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_0cb0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_b2b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_0cb0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_b2b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_0cb0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2145_c7_b2b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_0cb0_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2145_c7_b2b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_0cb0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2145_c7_b2b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_0cb0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2149_c7_304c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_93f4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_304c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_93f4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_304c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_93f4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2149_c7_304c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_93f4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_304c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_93f4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_304c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_93f4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_304c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_93f4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2149_c7_304c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_93f4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2149_c7_304c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_93f4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2152_c7_a69d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2152_c11_a822_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2152_c7_a69d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2152_c11_a822_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2152_c7_a69d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2152_c11_a822_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2152_c7_a69d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2152_c11_a822_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2152_c7_a69d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2152_c11_a822_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2152_c7_a69d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2152_c11_a822_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2152_c7_a69d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2152_c11_a822_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2152_c7_a69d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2152_c11_a822_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2152_c7_a69d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2152_c11_a822_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2157_c7_130c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2157_c11_a2fc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2157_c7_130c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2157_c11_a2fc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2157_c7_130c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2157_c11_a2fc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2157_c7_130c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2157_c11_a2fc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2157_c7_130c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2157_c11_a2fc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2157_c7_130c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2157_c11_a2fc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2157_c7_130c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2157_c11_a2fc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2157_c7_130c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2157_c11_a2fc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2157_c7_130c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2157_c11_a2fc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2160_c7_72ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2160_c11_e244_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2160_c7_72ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2160_c11_e244_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2160_c7_72ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2160_c11_e244_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2160_c7_72ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2160_c11_e244_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2160_c7_72ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2160_c11_e244_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2160_c7_72ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2160_c11_e244_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2160_c7_72ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2160_c11_e244_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2160_c7_72ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2160_c11_e244_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2160_c7_72ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2160_c11_e244_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2166_c7_8aae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2166_c11_fb19_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2166_c7_8aae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2166_c11_fb19_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2166_c7_8aae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2166_c11_fb19_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2166_c7_8aae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2166_c11_fb19_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2166_c7_8aae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2166_c11_fb19_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2166_c7_8aae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2166_c11_fb19_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_0e4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_d06e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_0e4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_d06e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_0e4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_d06e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2173_c7_0e4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_d06e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2177_c7_28f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2177_c11_3681_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2177_c7_28f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2177_c11_3681_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2161_c3_ae8b_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2153_l2161_DUPLICATE_5e4e_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2154_c3_df46_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2153_l2161_DUPLICATE_5e4e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c2_e08d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2149_l2145_l2142_l2136_l2160_l2157_l2152_DUPLICATE_ff4e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c7_d746_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2149_l2145_l2142_l2136_l2160_l2157_l2152_DUPLICATE_ff4e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_b2b7_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2149_l2145_l2142_l2136_l2160_l2157_l2152_DUPLICATE_ff4e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_304c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2149_l2145_l2142_l2136_l2160_l2157_l2152_DUPLICATE_ff4e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2152_c7_a69d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2149_l2145_l2142_l2136_l2160_l2157_l2152_DUPLICATE_ff4e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2157_c7_130c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2149_l2145_l2142_l2136_l2160_l2157_l2152_DUPLICATE_ff4e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2160_c7_72ba_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2149_l2145_l2142_l2136_l2160_l2157_l2152_DUPLICATE_ff4e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_d746_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2149_l2177_l2145_l2173_l2142_l2166_l2160_l2157_l2152_DUPLICATE_4cb6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_b2b7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2149_l2177_l2145_l2173_l2142_l2166_l2160_l2157_l2152_DUPLICATE_4cb6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_304c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2149_l2177_l2145_l2173_l2142_l2166_l2160_l2157_l2152_DUPLICATE_4cb6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2152_c7_a69d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2149_l2177_l2145_l2173_l2142_l2166_l2160_l2157_l2152_DUPLICATE_4cb6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2157_c7_130c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2149_l2177_l2145_l2173_l2142_l2166_l2160_l2157_l2152_DUPLICATE_4cb6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2160_c7_72ba_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2149_l2177_l2145_l2173_l2142_l2166_l2160_l2157_l2152_DUPLICATE_4cb6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2166_c7_8aae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2149_l2177_l2145_l2173_l2142_l2166_l2160_l2157_l2152_DUPLICATE_4cb6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_0e4f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2149_l2177_l2145_l2173_l2142_l2166_l2160_l2157_l2152_DUPLICATE_4cb6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2177_c7_28f7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2149_l2177_l2145_l2173_l2142_l2166_l2160_l2157_l2152_DUPLICATE_4cb6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c2_e08d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2149_l2145_l2142_l2166_l2136_l2157_l2152_DUPLICATE_89fa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2142_c7_d746_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2149_l2145_l2142_l2166_l2136_l2157_l2152_DUPLICATE_89fa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_b2b7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2149_l2145_l2142_l2166_l2136_l2157_l2152_DUPLICATE_89fa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_304c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2149_l2145_l2142_l2166_l2136_l2157_l2152_DUPLICATE_89fa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2152_c7_a69d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2149_l2145_l2142_l2166_l2136_l2157_l2152_DUPLICATE_89fa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2157_c7_130c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2149_l2145_l2142_l2166_l2136_l2157_l2152_DUPLICATE_89fa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2166_c7_8aae_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2149_l2145_l2142_l2166_l2136_l2157_l2152_DUPLICATE_89fa_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2142_c7_d746_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2149_l2145_l2142_l2160_l2157_l2152_DUPLICATE_02af_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2145_c7_b2b7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2149_l2145_l2142_l2160_l2157_l2152_DUPLICATE_02af_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2149_c7_304c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2149_l2145_l2142_l2160_l2157_l2152_DUPLICATE_02af_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2152_c7_a69d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2149_l2145_l2142_l2160_l2157_l2152_DUPLICATE_02af_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2157_c7_130c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2149_l2145_l2142_l2160_l2157_l2152_DUPLICATE_02af_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2160_c7_72ba_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2149_l2145_l2142_l2160_l2157_l2152_DUPLICATE_02af_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2136_c2_e08d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2149_l2177_l2145_l2173_l2142_l2136_l2160_l2157_l2152_DUPLICATE_2d67_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2142_c7_d746_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2149_l2177_l2145_l2173_l2142_l2136_l2160_l2157_l2152_DUPLICATE_2d67_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_b2b7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2149_l2177_l2145_l2173_l2142_l2136_l2160_l2157_l2152_DUPLICATE_2d67_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_304c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2149_l2177_l2145_l2173_l2142_l2136_l2160_l2157_l2152_DUPLICATE_2d67_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2152_c7_a69d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2149_l2177_l2145_l2173_l2142_l2136_l2160_l2157_l2152_DUPLICATE_2d67_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2157_c7_130c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2149_l2177_l2145_l2173_l2142_l2136_l2160_l2157_l2152_DUPLICATE_2d67_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2160_c7_72ba_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2149_l2177_l2145_l2173_l2142_l2136_l2160_l2157_l2152_DUPLICATE_2d67_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_0e4f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2149_l2177_l2145_l2173_l2142_l2136_l2160_l2157_l2152_DUPLICATE_2d67_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2177_c7_28f7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2149_l2177_l2145_l2173_l2142_l2136_l2160_l2157_l2152_DUPLICATE_2d67_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2160_c7_72ba_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2173_l2160_DUPLICATE_85ff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_0e4f_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2173_l2160_DUPLICATE_85ff_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2136_c2_e08d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2149_l2145_l2173_l2142_l2136_l2160_l2157_l2152_DUPLICATE_d927_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2142_c7_d746_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2149_l2145_l2173_l2142_l2136_l2160_l2157_l2152_DUPLICATE_d927_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2145_c7_b2b7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2149_l2145_l2173_l2142_l2136_l2160_l2157_l2152_DUPLICATE_d927_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2149_c7_304c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2149_l2145_l2173_l2142_l2136_l2160_l2157_l2152_DUPLICATE_d927_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2152_c7_a69d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2149_l2145_l2173_l2142_l2136_l2160_l2157_l2152_DUPLICATE_d927_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2157_c7_130c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2149_l2145_l2173_l2142_l2136_l2160_l2157_l2152_DUPLICATE_d927_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2160_c7_72ba_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2149_l2145_l2173_l2142_l2136_l2160_l2157_l2152_DUPLICATE_d927_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2173_c7_0e4f_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2149_l2145_l2173_l2142_l2136_l2160_l2157_l2152_DUPLICATE_d927_return_output;
     VAR_BIN_OP_SL_uxn_opcodes_h_l2167_c12_384f_right := VAR_CONST_SR_4_uxn_opcodes_h_l2167_c36_696f_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2173_c7_0e4f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_0e4f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_0e4f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_0e4f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_0e4f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_0e4f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_0e4f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_0e4f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_0e4f_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2164_c32_d61d] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2164_c32_d61d_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2164_c32_d61d_left;
     BIN_OP_GT_uxn_opcodes_h_l2164_c32_d61d_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2164_c32_d61d_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2164_c32_d61d_return_output := BIN_OP_GT_uxn_opcodes_h_l2164_c32_d61d_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2161_c3_ae8b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2161_c3_ae8b_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2161_c3_ae8b_left;
     BIN_OP_OR_uxn_opcodes_h_l2161_c3_ae8b_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2161_c3_ae8b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2161_c3_ae8b_return_output := BIN_OP_OR_uxn_opcodes_h_l2161_c3_ae8b_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2160_c7_72ba] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2160_c7_72ba_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2160_c7_72ba_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2160_c7_72ba_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2160_c7_72ba_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2160_c7_72ba_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2160_c7_72ba_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2160_c7_72ba_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2160_c7_72ba_return_output;

     -- t8_MUX[uxn_opcodes_h_l2145_c7_b2b7] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2145_c7_b2b7_cond <= VAR_t8_MUX_uxn_opcodes_h_l2145_c7_b2b7_cond;
     t8_MUX_uxn_opcodes_h_l2145_c7_b2b7_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2145_c7_b2b7_iftrue;
     t8_MUX_uxn_opcodes_h_l2145_c7_b2b7_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2145_c7_b2b7_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2145_c7_b2b7_return_output := t8_MUX_uxn_opcodes_h_l2145_c7_b2b7_return_output;

     -- BIN_OP_SR[uxn_opcodes_h_l2167_c12_85b2] LATENCY=0
     -- Inputs
     BIN_OP_SR_uxn_opcodes_h_l2167_c12_85b2_left <= VAR_BIN_OP_SR_uxn_opcodes_h_l2167_c12_85b2_left;
     BIN_OP_SR_uxn_opcodes_h_l2167_c12_85b2_right <= VAR_BIN_OP_SR_uxn_opcodes_h_l2167_c12_85b2_right;
     -- Outputs
     VAR_BIN_OP_SR_uxn_opcodes_h_l2167_c12_85b2_return_output := BIN_OP_SR_uxn_opcodes_h_l2167_c12_85b2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2177_c7_28f7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2177_c7_28f7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2177_c7_28f7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2177_c7_28f7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2177_c7_28f7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2177_c7_28f7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2177_c7_28f7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2177_c7_28f7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2177_c7_28f7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2177_c7_28f7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2177_c7_28f7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2177_c7_28f7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2177_c7_28f7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2177_c7_28f7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2177_c7_28f7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2177_c7_28f7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2177_c7_28f7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2177_c7_28f7_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2175_c24_6706] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2175_c24_6706_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2175_c34_3481_return_output);

     -- CONST_SL_8[uxn_opcodes_h_l2154_c3_df46] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2154_c3_df46_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2154_c3_df46_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2154_c3_df46_return_output := CONST_SL_8_uxn_opcodes_h_l2154_c3_df46_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2166_c7_8aae] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2166_c7_8aae_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2166_c7_8aae_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2166_c7_8aae_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2166_c7_8aae_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2166_c7_8aae_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2166_c7_8aae_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2166_c7_8aae_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2166_c7_8aae_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2136_c1_261d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2136_c1_261d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2136_c1_261d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2136_c1_261d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2136_c1_261d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2136_c1_261d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2136_c1_261d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2136_c1_261d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2136_c1_261d_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2164_c32_6268_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2164_c32_d61d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2160_c7_72ba_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2161_c3_ae8b_return_output;
     VAR_BIN_OP_SL_uxn_opcodes_h_l2167_c12_384f_left := VAR_BIN_OP_SR_uxn_opcodes_h_l2167_c12_85b2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2173_c7_0e4f_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2175_c24_6706_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2152_c7_a69d_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2154_c3_df46_return_output;
     VAR_printf_uxn_opcodes_h_l2137_c3_bd4c_uxn_opcodes_h_l2137_c3_bd4c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2136_c1_261d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_0e4f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2177_c7_28f7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2160_c7_72ba_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2166_c7_8aae_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2157_c7_130c_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2160_c7_72ba_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_0e4f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2177_c7_28f7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2166_c7_8aae_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_0e4f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2142_c7_d746_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2145_c7_b2b7_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l2157_c7_130c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2157_c7_130c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2157_c7_130c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2157_c7_130c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2157_c7_130c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2157_c7_130c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2157_c7_130c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2157_c7_130c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2157_c7_130c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2173_c7_0e4f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_0e4f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_0e4f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_0e4f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_0e4f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_0e4f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_0e4f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_0e4f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_0e4f_return_output;

     -- BIN_OP_SL[uxn_opcodes_h_l2167_c12_384f] LATENCY=0
     -- Inputs
     BIN_OP_SL_uxn_opcodes_h_l2167_c12_384f_left <= VAR_BIN_OP_SL_uxn_opcodes_h_l2167_c12_384f_left;
     BIN_OP_SL_uxn_opcodes_h_l2167_c12_384f_right <= VAR_BIN_OP_SL_uxn_opcodes_h_l2167_c12_384f_right;
     -- Outputs
     VAR_BIN_OP_SL_uxn_opcodes_h_l2167_c12_384f_return_output := BIN_OP_SL_uxn_opcodes_h_l2167_c12_384f_return_output;

     -- t8_MUX[uxn_opcodes_h_l2142_c7_d746] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2142_c7_d746_cond <= VAR_t8_MUX_uxn_opcodes_h_l2142_c7_d746_cond;
     t8_MUX_uxn_opcodes_h_l2142_c7_d746_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2142_c7_d746_iftrue;
     t8_MUX_uxn_opcodes_h_l2142_c7_d746_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2142_c7_d746_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2142_c7_d746_return_output := t8_MUX_uxn_opcodes_h_l2142_c7_d746_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2173_c7_0e4f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2173_c7_0e4f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2173_c7_0e4f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2173_c7_0e4f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2173_c7_0e4f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2173_c7_0e4f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2173_c7_0e4f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2173_c7_0e4f_return_output := result_stack_value_MUX_uxn_opcodes_h_l2173_c7_0e4f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2173_c7_0e4f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_0e4f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_0e4f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_0e4f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_0e4f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_0e4f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_0e4f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_0e4f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_0e4f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2160_c7_72ba] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2160_c7_72ba_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2160_c7_72ba_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2160_c7_72ba_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2160_c7_72ba_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2160_c7_72ba_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2160_c7_72ba_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2160_c7_72ba_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2160_c7_72ba_return_output;

     -- n16_MUX[uxn_opcodes_h_l2160_c7_72ba] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2160_c7_72ba_cond <= VAR_n16_MUX_uxn_opcodes_h_l2160_c7_72ba_cond;
     n16_MUX_uxn_opcodes_h_l2160_c7_72ba_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2160_c7_72ba_iftrue;
     n16_MUX_uxn_opcodes_h_l2160_c7_72ba_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2160_c7_72ba_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2160_c7_72ba_return_output := n16_MUX_uxn_opcodes_h_l2160_c7_72ba_return_output;

     -- printf_uxn_opcodes_h_l2137_c3_bd4c[uxn_opcodes_h_l2137_c3_bd4c] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2137_c3_bd4c_uxn_opcodes_h_l2137_c3_bd4c_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2137_c3_bd4c_uxn_opcodes_h_l2137_c3_bd4c_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2166_c7_8aae] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2166_c7_8aae_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2166_c7_8aae_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2166_c7_8aae_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2166_c7_8aae_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2166_c7_8aae_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2166_c7_8aae_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2166_c7_8aae_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2166_c7_8aae_return_output;

     -- MUX[uxn_opcodes_h_l2164_c32_6268] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2164_c32_6268_cond <= VAR_MUX_uxn_opcodes_h_l2164_c32_6268_cond;
     MUX_uxn_opcodes_h_l2164_c32_6268_iftrue <= VAR_MUX_uxn_opcodes_h_l2164_c32_6268_iftrue;
     MUX_uxn_opcodes_h_l2164_c32_6268_iffalse <= VAR_MUX_uxn_opcodes_h_l2164_c32_6268_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2164_c32_6268_return_output := MUX_uxn_opcodes_h_l2164_c32_6268_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l2166_c7_8aae_iftrue := VAR_BIN_OP_SL_uxn_opcodes_h_l2167_c12_384f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2160_c7_72ba_iftrue := VAR_MUX_uxn_opcodes_h_l2164_c32_6268_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2157_c7_130c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2160_c7_72ba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2166_c7_8aae_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_0e4f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2157_c7_130c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2160_c7_72ba_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2152_c7_a69d_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2157_c7_130c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2166_c7_8aae_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_0e4f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2160_c7_72ba_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2166_c7_8aae_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2166_c7_8aae_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2173_c7_0e4f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2136_c2_e08d_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2142_c7_d746_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2160_c7_72ba] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2160_c7_72ba_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2160_c7_72ba_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2160_c7_72ba_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2160_c7_72ba_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2160_c7_72ba_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2160_c7_72ba_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2160_c7_72ba_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2160_c7_72ba_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2157_c7_130c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2157_c7_130c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2157_c7_130c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2157_c7_130c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2157_c7_130c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2157_c7_130c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2157_c7_130c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2157_c7_130c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2157_c7_130c_return_output;

     -- t8_MUX[uxn_opcodes_h_l2136_c2_e08d] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2136_c2_e08d_cond <= VAR_t8_MUX_uxn_opcodes_h_l2136_c2_e08d_cond;
     t8_MUX_uxn_opcodes_h_l2136_c2_e08d_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2136_c2_e08d_iftrue;
     t8_MUX_uxn_opcodes_h_l2136_c2_e08d_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2136_c2_e08d_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2136_c2_e08d_return_output := t8_MUX_uxn_opcodes_h_l2136_c2_e08d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2152_c7_a69d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2152_c7_a69d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2152_c7_a69d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2152_c7_a69d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2152_c7_a69d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2152_c7_a69d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2152_c7_a69d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2152_c7_a69d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2152_c7_a69d_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2171_c24_2ae6] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2171_c24_2ae6_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_SL_uxn_opcodes_h_l2167_c12_384f_return_output);

     -- tmp16_MUX[uxn_opcodes_h_l2166_c7_8aae] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2166_c7_8aae_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2166_c7_8aae_cond;
     tmp16_MUX_uxn_opcodes_h_l2166_c7_8aae_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2166_c7_8aae_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2166_c7_8aae_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2166_c7_8aae_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2166_c7_8aae_return_output := tmp16_MUX_uxn_opcodes_h_l2166_c7_8aae_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2166_c7_8aae] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2166_c7_8aae_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2166_c7_8aae_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2166_c7_8aae_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2166_c7_8aae_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2166_c7_8aae_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2166_c7_8aae_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2166_c7_8aae_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2166_c7_8aae_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2166_c7_8aae] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2166_c7_8aae_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2166_c7_8aae_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2166_c7_8aae_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2166_c7_8aae_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2166_c7_8aae_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2166_c7_8aae_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2166_c7_8aae_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2166_c7_8aae_return_output;

     -- n16_MUX[uxn_opcodes_h_l2157_c7_130c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2157_c7_130c_cond <= VAR_n16_MUX_uxn_opcodes_h_l2157_c7_130c_cond;
     n16_MUX_uxn_opcodes_h_l2157_c7_130c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2157_c7_130c_iftrue;
     n16_MUX_uxn_opcodes_h_l2157_c7_130c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2157_c7_130c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2157_c7_130c_return_output := n16_MUX_uxn_opcodes_h_l2157_c7_130c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2160_c7_72ba] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2160_c7_72ba_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2160_c7_72ba_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2160_c7_72ba_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2160_c7_72ba_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2160_c7_72ba_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2160_c7_72ba_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2160_c7_72ba_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2160_c7_72ba_return_output;

     -- Submodule level 4
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2166_c7_8aae_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2171_c24_2ae6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2152_c7_a69d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2157_c7_130c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2160_c7_72ba_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2166_c7_8aae_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2152_c7_a69d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2157_c7_130c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2149_c7_304c_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2152_c7_a69d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2160_c7_72ba_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2166_c7_8aae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2157_c7_130c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2160_c7_72ba_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2157_c7_130c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2160_c7_72ba_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2136_c2_e08d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2160_c7_72ba_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2166_c7_8aae_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2157_c7_130c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2157_c7_130c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2157_c7_130c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2157_c7_130c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2157_c7_130c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2157_c7_130c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2157_c7_130c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2157_c7_130c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2157_c7_130c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2160_c7_72ba] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2160_c7_72ba_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2160_c7_72ba_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2160_c7_72ba_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2160_c7_72ba_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2160_c7_72ba_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2160_c7_72ba_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2160_c7_72ba_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2160_c7_72ba_return_output;

     -- n16_MUX[uxn_opcodes_h_l2152_c7_a69d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2152_c7_a69d_cond <= VAR_n16_MUX_uxn_opcodes_h_l2152_c7_a69d_cond;
     n16_MUX_uxn_opcodes_h_l2152_c7_a69d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2152_c7_a69d_iftrue;
     n16_MUX_uxn_opcodes_h_l2152_c7_a69d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2152_c7_a69d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2152_c7_a69d_return_output := n16_MUX_uxn_opcodes_h_l2152_c7_a69d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2160_c7_72ba] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2160_c7_72ba_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2160_c7_72ba_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2160_c7_72ba_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2160_c7_72ba_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2160_c7_72ba_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2160_c7_72ba_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2160_c7_72ba_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2160_c7_72ba_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2157_c7_130c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2157_c7_130c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2157_c7_130c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2157_c7_130c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2157_c7_130c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2157_c7_130c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2157_c7_130c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2157_c7_130c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2157_c7_130c_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2149_c7_304c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2149_c7_304c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2149_c7_304c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2149_c7_304c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2149_c7_304c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2149_c7_304c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2149_c7_304c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2149_c7_304c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2149_c7_304c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2152_c7_a69d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2152_c7_a69d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2152_c7_a69d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2152_c7_a69d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2152_c7_a69d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2152_c7_a69d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2152_c7_a69d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2152_c7_a69d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2152_c7_a69d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2160_c7_72ba] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2160_c7_72ba_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2160_c7_72ba_cond;
     tmp16_MUX_uxn_opcodes_h_l2160_c7_72ba_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2160_c7_72ba_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2160_c7_72ba_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2160_c7_72ba_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2160_c7_72ba_return_output := tmp16_MUX_uxn_opcodes_h_l2160_c7_72ba_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2166_c7_8aae] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2166_c7_8aae_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2166_c7_8aae_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2166_c7_8aae_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2166_c7_8aae_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2166_c7_8aae_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2166_c7_8aae_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2166_c7_8aae_return_output := result_stack_value_MUX_uxn_opcodes_h_l2166_c7_8aae_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2149_c7_304c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2152_c7_a69d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2157_c7_130c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2160_c7_72ba_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_304c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2152_c7_a69d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2145_c7_b2b7_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2149_c7_304c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2157_c7_130c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2160_c7_72ba_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2152_c7_a69d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2157_c7_130c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2152_c7_a69d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2157_c7_130c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2160_c7_72ba_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2166_c7_8aae_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2157_c7_130c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2160_c7_72ba_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2157_c7_130c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2157_c7_130c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2157_c7_130c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2157_c7_130c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2157_c7_130c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2157_c7_130c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2157_c7_130c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2157_c7_130c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2157_c7_130c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2152_c7_a69d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2152_c7_a69d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2152_c7_a69d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2152_c7_a69d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2152_c7_a69d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2152_c7_a69d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2152_c7_a69d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2152_c7_a69d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2152_c7_a69d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2157_c7_130c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2157_c7_130c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2157_c7_130c_cond;
     tmp16_MUX_uxn_opcodes_h_l2157_c7_130c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2157_c7_130c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2157_c7_130c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2157_c7_130c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2157_c7_130c_return_output := tmp16_MUX_uxn_opcodes_h_l2157_c7_130c_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2145_c7_b2b7] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2145_c7_b2b7_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2145_c7_b2b7_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2145_c7_b2b7_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2145_c7_b2b7_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2145_c7_b2b7_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2145_c7_b2b7_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2145_c7_b2b7_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2145_c7_b2b7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2149_c7_304c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_304c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_304c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_304c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_304c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_304c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_304c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_304c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_304c_return_output;

     -- n16_MUX[uxn_opcodes_h_l2149_c7_304c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2149_c7_304c_cond <= VAR_n16_MUX_uxn_opcodes_h_l2149_c7_304c_cond;
     n16_MUX_uxn_opcodes_h_l2149_c7_304c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2149_c7_304c_iftrue;
     n16_MUX_uxn_opcodes_h_l2149_c7_304c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2149_c7_304c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2149_c7_304c_return_output := n16_MUX_uxn_opcodes_h_l2149_c7_304c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2152_c7_a69d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2152_c7_a69d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2152_c7_a69d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2152_c7_a69d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2152_c7_a69d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2152_c7_a69d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2152_c7_a69d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2152_c7_a69d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2152_c7_a69d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2160_c7_72ba] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2160_c7_72ba_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2160_c7_72ba_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2160_c7_72ba_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2160_c7_72ba_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2160_c7_72ba_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2160_c7_72ba_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2160_c7_72ba_return_output := result_stack_value_MUX_uxn_opcodes_h_l2160_c7_72ba_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2157_c7_130c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2157_c7_130c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2157_c7_130c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2157_c7_130c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2157_c7_130c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2157_c7_130c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2157_c7_130c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2157_c7_130c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2157_c7_130c_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2145_c7_b2b7_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2149_c7_304c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2152_c7_a69d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2157_c7_130c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_b2b7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_304c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2142_c7_d746_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2145_c7_b2b7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2152_c7_a69d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2157_c7_130c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_304c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2152_c7_a69d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_304c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2152_c7_a69d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2157_c7_130c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2160_c7_72ba_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2152_c7_a69d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2157_c7_130c_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l2142_c7_d746] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2142_c7_d746_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2142_c7_d746_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2142_c7_d746_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2142_c7_d746_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2142_c7_d746_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2142_c7_d746_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2142_c7_d746_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2142_c7_d746_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2152_c7_a69d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2152_c7_a69d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2152_c7_a69d_cond;
     tmp16_MUX_uxn_opcodes_h_l2152_c7_a69d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2152_c7_a69d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2152_c7_a69d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2152_c7_a69d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2152_c7_a69d_return_output := tmp16_MUX_uxn_opcodes_h_l2152_c7_a69d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2149_c7_304c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_304c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_304c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_304c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_304c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_304c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_304c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_304c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_304c_return_output;

     -- n16_MUX[uxn_opcodes_h_l2145_c7_b2b7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2145_c7_b2b7_cond <= VAR_n16_MUX_uxn_opcodes_h_l2145_c7_b2b7_cond;
     n16_MUX_uxn_opcodes_h_l2145_c7_b2b7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2145_c7_b2b7_iftrue;
     n16_MUX_uxn_opcodes_h_l2145_c7_b2b7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2145_c7_b2b7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2145_c7_b2b7_return_output := n16_MUX_uxn_opcodes_h_l2145_c7_b2b7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2152_c7_a69d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2152_c7_a69d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2152_c7_a69d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2152_c7_a69d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2152_c7_a69d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2152_c7_a69d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2152_c7_a69d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2152_c7_a69d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2152_c7_a69d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2145_c7_b2b7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_b2b7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_b2b7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_b2b7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_b2b7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_b2b7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_b2b7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_b2b7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_b2b7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2149_c7_304c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_304c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_304c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_304c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_304c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_304c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_304c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_304c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_304c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2157_c7_130c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2157_c7_130c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2157_c7_130c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2157_c7_130c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2157_c7_130c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2157_c7_130c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2157_c7_130c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2157_c7_130c_return_output := result_stack_value_MUX_uxn_opcodes_h_l2157_c7_130c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2152_c7_a69d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2152_c7_a69d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2152_c7_a69d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2152_c7_a69d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2152_c7_a69d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2152_c7_a69d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2152_c7_a69d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2152_c7_a69d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2152_c7_a69d_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2142_c7_d746_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2145_c7_b2b7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_304c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2152_c7_a69d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2142_c7_d746_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_b2b7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2136_c2_e08d_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2142_c7_d746_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_304c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2152_c7_a69d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_b2b7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_304c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_b2b7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_304c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2152_c7_a69d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2157_c7_130c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2149_c7_304c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2152_c7_a69d_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2145_c7_b2b7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_b2b7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_b2b7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_b2b7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_b2b7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_b2b7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_b2b7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_b2b7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_b2b7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2145_c7_b2b7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_b2b7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_b2b7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_b2b7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_b2b7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_b2b7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_b2b7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_b2b7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_b2b7_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2136_c2_e08d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2136_c2_e08d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2136_c2_e08d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2136_c2_e08d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2136_c2_e08d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2136_c2_e08d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2136_c2_e08d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2136_c2_e08d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2136_c2_e08d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2152_c7_a69d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2152_c7_a69d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2152_c7_a69d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2152_c7_a69d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2152_c7_a69d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2152_c7_a69d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2152_c7_a69d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2152_c7_a69d_return_output := result_stack_value_MUX_uxn_opcodes_h_l2152_c7_a69d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2142_c7_d746] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2142_c7_d746_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2142_c7_d746_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2142_c7_d746_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2142_c7_d746_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2142_c7_d746_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2142_c7_d746_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2142_c7_d746_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2142_c7_d746_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2149_c7_304c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2149_c7_304c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2149_c7_304c_cond;
     tmp16_MUX_uxn_opcodes_h_l2149_c7_304c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2149_c7_304c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2149_c7_304c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2149_c7_304c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2149_c7_304c_return_output := tmp16_MUX_uxn_opcodes_h_l2149_c7_304c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2149_c7_304c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_304c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_304c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_304c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_304c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_304c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_304c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_304c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_304c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2149_c7_304c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_304c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_304c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_304c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_304c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_304c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_304c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_304c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_304c_return_output;

     -- n16_MUX[uxn_opcodes_h_l2142_c7_d746] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2142_c7_d746_cond <= VAR_n16_MUX_uxn_opcodes_h_l2142_c7_d746_cond;
     n16_MUX_uxn_opcodes_h_l2142_c7_d746_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2142_c7_d746_iftrue;
     n16_MUX_uxn_opcodes_h_l2142_c7_d746_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2142_c7_d746_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2142_c7_d746_return_output := n16_MUX_uxn_opcodes_h_l2142_c7_d746_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l2136_c2_e08d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2142_c7_d746_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_b2b7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_304c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c2_e08d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2142_c7_d746_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_b2b7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_304c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c7_d746_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_b2b7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c7_d746_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_b2b7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2149_c7_304c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2152_c7_a69d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2145_c7_b2b7_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2149_c7_304c_return_output;
     -- n16_MUX[uxn_opcodes_h_l2136_c2_e08d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2136_c2_e08d_cond <= VAR_n16_MUX_uxn_opcodes_h_l2136_c2_e08d_cond;
     n16_MUX_uxn_opcodes_h_l2136_c2_e08d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2136_c2_e08d_iftrue;
     n16_MUX_uxn_opcodes_h_l2136_c2_e08d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2136_c2_e08d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2136_c2_e08d_return_output := n16_MUX_uxn_opcodes_h_l2136_c2_e08d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2142_c7_d746] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c7_d746_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c7_d746_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c7_d746_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c7_d746_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c7_d746_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c7_d746_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c7_d746_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c7_d746_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2145_c7_b2b7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_b2b7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_b2b7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_b2b7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_b2b7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_b2b7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_b2b7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_b2b7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_b2b7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2142_c7_d746] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c7_d746_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c7_d746_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c7_d746_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c7_d746_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c7_d746_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c7_d746_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c7_d746_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c7_d746_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2145_c7_b2b7] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2145_c7_b2b7_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2145_c7_b2b7_cond;
     tmp16_MUX_uxn_opcodes_h_l2145_c7_b2b7_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2145_c7_b2b7_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2145_c7_b2b7_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2145_c7_b2b7_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2145_c7_b2b7_return_output := tmp16_MUX_uxn_opcodes_h_l2145_c7_b2b7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2145_c7_b2b7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_b2b7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_b2b7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_b2b7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_b2b7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_b2b7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_b2b7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_b2b7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_b2b7_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2149_c7_304c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2149_c7_304c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2149_c7_304c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2149_c7_304c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2149_c7_304c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2149_c7_304c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2149_c7_304c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2149_c7_304c_return_output := result_stack_value_MUX_uxn_opcodes_h_l2149_c7_304c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2136_c2_e08d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c2_e08d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c2_e08d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c2_e08d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c2_e08d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c2_e08d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c2_e08d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c2_e08d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c2_e08d_return_output;

     -- Submodule level 9
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2136_c2_e08d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_d746_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_b2b7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2142_c7_d746_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_b2b7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c2_e08d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c7_d746_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c2_e08d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c7_d746_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2145_c7_b2b7_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2149_c7_304c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2142_c7_d746_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2145_c7_b2b7_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2136_c2_e08d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c2_e08d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c2_e08d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c2_e08d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c2_e08d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c2_e08d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c2_e08d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c2_e08d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c2_e08d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2136_c2_e08d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c2_e08d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c2_e08d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c2_e08d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c2_e08d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c2_e08d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c2_e08d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c2_e08d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c2_e08d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2142_c7_d746] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_d746_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_d746_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_d746_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_d746_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_d746_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_d746_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_d746_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_d746_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2145_c7_b2b7] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2145_c7_b2b7_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2145_c7_b2b7_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2145_c7_b2b7_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2145_c7_b2b7_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2145_c7_b2b7_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2145_c7_b2b7_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2145_c7_b2b7_return_output := result_stack_value_MUX_uxn_opcodes_h_l2145_c7_b2b7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2142_c7_d746] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2142_c7_d746_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2142_c7_d746_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2142_c7_d746_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2142_c7_d746_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2142_c7_d746_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2142_c7_d746_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2142_c7_d746_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2142_c7_d746_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2142_c7_d746] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2142_c7_d746_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2142_c7_d746_cond;
     tmp16_MUX_uxn_opcodes_h_l2142_c7_d746_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2142_c7_d746_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2142_c7_d746_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2142_c7_d746_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2142_c7_d746_return_output := tmp16_MUX_uxn_opcodes_h_l2142_c7_d746_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2136_c2_e08d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_d746_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2136_c2_e08d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2142_c7_d746_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2142_c7_d746_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2145_c7_b2b7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2136_c2_e08d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2142_c7_d746_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2136_c2_e08d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2136_c2_e08d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2136_c2_e08d_cond;
     tmp16_MUX_uxn_opcodes_h_l2136_c2_e08d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2136_c2_e08d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2136_c2_e08d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2136_c2_e08d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2136_c2_e08d_return_output := tmp16_MUX_uxn_opcodes_h_l2136_c2_e08d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2136_c2_e08d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2136_c2_e08d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2136_c2_e08d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2136_c2_e08d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2136_c2_e08d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2136_c2_e08d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2136_c2_e08d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2136_c2_e08d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2136_c2_e08d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2136_c2_e08d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2136_c2_e08d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2136_c2_e08d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2136_c2_e08d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2136_c2_e08d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2136_c2_e08d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2136_c2_e08d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2136_c2_e08d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2136_c2_e08d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2142_c7_d746] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2142_c7_d746_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2142_c7_d746_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2142_c7_d746_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2142_c7_d746_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2142_c7_d746_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2142_c7_d746_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2142_c7_d746_return_output := result_stack_value_MUX_uxn_opcodes_h_l2142_c7_d746_return_output;

     -- Submodule level 11
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2136_c2_e08d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2142_c7_d746_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2136_c2_e08d_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2136_c2_e08d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2136_c2_e08d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2136_c2_e08d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2136_c2_e08d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2136_c2_e08d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2136_c2_e08d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2136_c2_e08d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2136_c2_e08d_return_output := result_stack_value_MUX_uxn_opcodes_h_l2136_c2_e08d_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l2131_l2182_DUPLICATE_ff29 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l2131_l2182_DUPLICATE_ff29_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_df93(
     result,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2136_c2_e08d_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c2_e08d_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c2_e08d_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2136_c2_e08d_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c2_e08d_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2136_c2_e08d_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2136_c2_e08d_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l2131_l2182_DUPLICATE_ff29_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l2131_l2182_DUPLICATE_ff29_return_output;
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
