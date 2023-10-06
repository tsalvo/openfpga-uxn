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
-- Submodules: 185
entity rot2_0CLK_79985188 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end rot2_0CLK_79985188;
architecture arch of rot2_0CLK_79985188 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal l16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_l16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l3134_c6_7f67]
signal BIN_OP_EQ_uxn_opcodes_h_l3134_c6_7f67_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3134_c6_7f67_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3134_c6_7f67_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3134_c1_8829]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3134_c1_8829_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3134_c1_8829_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3134_c1_8829_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3134_c1_8829_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l3134_c2_4d74]
signal n16_MUX_uxn_opcodes_h_l3134_c2_4d74_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l3134_c2_4d74_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l3134_c2_4d74_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l3134_c2_4d74_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l3134_c2_4d74]
signal t16_MUX_uxn_opcodes_h_l3134_c2_4d74_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l3134_c2_4d74_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3134_c2_4d74_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3134_c2_4d74_return_output : unsigned(15 downto 0);

-- l16_MUX[uxn_opcodes_h_l3134_c2_4d74]
signal l16_MUX_uxn_opcodes_h_l3134_c2_4d74_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l3134_c2_4d74_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l3134_c2_4d74_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l3134_c2_4d74_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3134_c2_4d74]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3134_c2_4d74_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3134_c2_4d74_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3134_c2_4d74_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3134_c2_4d74_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3134_c2_4d74]
signal result_stack_value_MUX_uxn_opcodes_h_l3134_c2_4d74_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3134_c2_4d74_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3134_c2_4d74_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3134_c2_4d74_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3134_c2_4d74]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3134_c2_4d74_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3134_c2_4d74_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3134_c2_4d74_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3134_c2_4d74_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3134_c2_4d74]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3134_c2_4d74_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3134_c2_4d74_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3134_c2_4d74_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3134_c2_4d74_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3134_c2_4d74]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3134_c2_4d74_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3134_c2_4d74_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3134_c2_4d74_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3134_c2_4d74_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3134_c2_4d74]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3134_c2_4d74_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3134_c2_4d74_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3134_c2_4d74_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3134_c2_4d74_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l3134_c2_4d74]
signal result_is_stack_read_MUX_uxn_opcodes_h_l3134_c2_4d74_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3134_c2_4d74_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3134_c2_4d74_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3134_c2_4d74_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l3135_c3_d843[uxn_opcodes_h_l3135_c3_d843]
signal printf_uxn_opcodes_h_l3135_c3_d843_uxn_opcodes_h_l3135_c3_d843_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3140_c11_e1f9]
signal BIN_OP_EQ_uxn_opcodes_h_l3140_c11_e1f9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3140_c11_e1f9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3140_c11_e1f9_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l3140_c7_c7d4]
signal n16_MUX_uxn_opcodes_h_l3140_c7_c7d4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l3140_c7_c7d4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l3140_c7_c7d4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l3140_c7_c7d4_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l3140_c7_c7d4]
signal t16_MUX_uxn_opcodes_h_l3140_c7_c7d4_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l3140_c7_c7d4_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3140_c7_c7d4_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3140_c7_c7d4_return_output : unsigned(15 downto 0);

-- l16_MUX[uxn_opcodes_h_l3140_c7_c7d4]
signal l16_MUX_uxn_opcodes_h_l3140_c7_c7d4_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l3140_c7_c7d4_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l3140_c7_c7d4_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l3140_c7_c7d4_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3140_c7_c7d4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3140_c7_c7d4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3140_c7_c7d4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3140_c7_c7d4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3140_c7_c7d4_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3140_c7_c7d4]
signal result_stack_value_MUX_uxn_opcodes_h_l3140_c7_c7d4_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3140_c7_c7d4_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3140_c7_c7d4_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3140_c7_c7d4_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3140_c7_c7d4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3140_c7_c7d4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3140_c7_c7d4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3140_c7_c7d4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3140_c7_c7d4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3140_c7_c7d4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3140_c7_c7d4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3140_c7_c7d4_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3140_c7_c7d4_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3140_c7_c7d4_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3140_c7_c7d4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3140_c7_c7d4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3140_c7_c7d4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3140_c7_c7d4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3140_c7_c7d4_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3140_c7_c7d4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3140_c7_c7d4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3140_c7_c7d4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3140_c7_c7d4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3140_c7_c7d4_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l3140_c7_c7d4]
signal result_is_stack_read_MUX_uxn_opcodes_h_l3140_c7_c7d4_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3140_c7_c7d4_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3140_c7_c7d4_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3140_c7_c7d4_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3143_c11_7de5]
signal BIN_OP_EQ_uxn_opcodes_h_l3143_c11_7de5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3143_c11_7de5_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3143_c11_7de5_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l3143_c7_d22e]
signal n16_MUX_uxn_opcodes_h_l3143_c7_d22e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l3143_c7_d22e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l3143_c7_d22e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l3143_c7_d22e_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l3143_c7_d22e]
signal t16_MUX_uxn_opcodes_h_l3143_c7_d22e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l3143_c7_d22e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3143_c7_d22e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3143_c7_d22e_return_output : unsigned(15 downto 0);

-- l16_MUX[uxn_opcodes_h_l3143_c7_d22e]
signal l16_MUX_uxn_opcodes_h_l3143_c7_d22e_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l3143_c7_d22e_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l3143_c7_d22e_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l3143_c7_d22e_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3143_c7_d22e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3143_c7_d22e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3143_c7_d22e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3143_c7_d22e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3143_c7_d22e_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3143_c7_d22e]
signal result_stack_value_MUX_uxn_opcodes_h_l3143_c7_d22e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3143_c7_d22e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3143_c7_d22e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3143_c7_d22e_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3143_c7_d22e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3143_c7_d22e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3143_c7_d22e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3143_c7_d22e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3143_c7_d22e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3143_c7_d22e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3143_c7_d22e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3143_c7_d22e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3143_c7_d22e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3143_c7_d22e_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3143_c7_d22e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3143_c7_d22e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3143_c7_d22e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3143_c7_d22e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3143_c7_d22e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3143_c7_d22e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3143_c7_d22e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3143_c7_d22e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3143_c7_d22e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3143_c7_d22e_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l3143_c7_d22e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l3143_c7_d22e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3143_c7_d22e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3143_c7_d22e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3143_c7_d22e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3148_c11_6f95]
signal BIN_OP_EQ_uxn_opcodes_h_l3148_c11_6f95_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3148_c11_6f95_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3148_c11_6f95_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l3148_c7_15d3]
signal n16_MUX_uxn_opcodes_h_l3148_c7_15d3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l3148_c7_15d3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l3148_c7_15d3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l3148_c7_15d3_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l3148_c7_15d3]
signal t16_MUX_uxn_opcodes_h_l3148_c7_15d3_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l3148_c7_15d3_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3148_c7_15d3_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3148_c7_15d3_return_output : unsigned(15 downto 0);

-- l16_MUX[uxn_opcodes_h_l3148_c7_15d3]
signal l16_MUX_uxn_opcodes_h_l3148_c7_15d3_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l3148_c7_15d3_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l3148_c7_15d3_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l3148_c7_15d3_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3148_c7_15d3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3148_c7_15d3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3148_c7_15d3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3148_c7_15d3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3148_c7_15d3_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3148_c7_15d3]
signal result_stack_value_MUX_uxn_opcodes_h_l3148_c7_15d3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3148_c7_15d3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3148_c7_15d3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3148_c7_15d3_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3148_c7_15d3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3148_c7_15d3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3148_c7_15d3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3148_c7_15d3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3148_c7_15d3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3148_c7_15d3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3148_c7_15d3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3148_c7_15d3_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3148_c7_15d3_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3148_c7_15d3_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3148_c7_15d3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3148_c7_15d3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3148_c7_15d3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3148_c7_15d3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3148_c7_15d3_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3148_c7_15d3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3148_c7_15d3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3148_c7_15d3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3148_c7_15d3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3148_c7_15d3_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l3148_c7_15d3]
signal result_is_stack_read_MUX_uxn_opcodes_h_l3148_c7_15d3_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3148_c7_15d3_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3148_c7_15d3_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3148_c7_15d3_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3151_c11_0191]
signal BIN_OP_EQ_uxn_opcodes_h_l3151_c11_0191_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3151_c11_0191_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3151_c11_0191_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l3151_c7_b003]
signal n16_MUX_uxn_opcodes_h_l3151_c7_b003_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l3151_c7_b003_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l3151_c7_b003_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l3151_c7_b003_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l3151_c7_b003]
signal t16_MUX_uxn_opcodes_h_l3151_c7_b003_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l3151_c7_b003_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3151_c7_b003_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3151_c7_b003_return_output : unsigned(15 downto 0);

-- l16_MUX[uxn_opcodes_h_l3151_c7_b003]
signal l16_MUX_uxn_opcodes_h_l3151_c7_b003_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l3151_c7_b003_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l3151_c7_b003_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l3151_c7_b003_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3151_c7_b003]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3151_c7_b003_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3151_c7_b003_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3151_c7_b003_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3151_c7_b003_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3151_c7_b003]
signal result_stack_value_MUX_uxn_opcodes_h_l3151_c7_b003_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3151_c7_b003_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3151_c7_b003_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3151_c7_b003_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3151_c7_b003]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3151_c7_b003_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3151_c7_b003_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3151_c7_b003_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3151_c7_b003_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3151_c7_b003]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3151_c7_b003_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3151_c7_b003_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3151_c7_b003_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3151_c7_b003_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3151_c7_b003]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3151_c7_b003_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3151_c7_b003_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3151_c7_b003_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3151_c7_b003_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3151_c7_b003]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3151_c7_b003_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3151_c7_b003_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3151_c7_b003_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3151_c7_b003_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l3151_c7_b003]
signal result_is_stack_read_MUX_uxn_opcodes_h_l3151_c7_b003_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3151_c7_b003_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3151_c7_b003_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3151_c7_b003_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l3152_c3_0bbe]
signal BIN_OP_OR_uxn_opcodes_h_l3152_c3_0bbe_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l3152_c3_0bbe_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l3152_c3_0bbe_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3155_c11_8547]
signal BIN_OP_EQ_uxn_opcodes_h_l3155_c11_8547_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3155_c11_8547_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3155_c11_8547_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l3155_c7_35c4]
signal n16_MUX_uxn_opcodes_h_l3155_c7_35c4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l3155_c7_35c4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l3155_c7_35c4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l3155_c7_35c4_return_output : unsigned(15 downto 0);

-- l16_MUX[uxn_opcodes_h_l3155_c7_35c4]
signal l16_MUX_uxn_opcodes_h_l3155_c7_35c4_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l3155_c7_35c4_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l3155_c7_35c4_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l3155_c7_35c4_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3155_c7_35c4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3155_c7_35c4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3155_c7_35c4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3155_c7_35c4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3155_c7_35c4_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3155_c7_35c4]
signal result_stack_value_MUX_uxn_opcodes_h_l3155_c7_35c4_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3155_c7_35c4_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3155_c7_35c4_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3155_c7_35c4_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3155_c7_35c4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3155_c7_35c4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3155_c7_35c4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3155_c7_35c4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3155_c7_35c4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3155_c7_35c4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3155_c7_35c4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3155_c7_35c4_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3155_c7_35c4_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3155_c7_35c4_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3155_c7_35c4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3155_c7_35c4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3155_c7_35c4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3155_c7_35c4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3155_c7_35c4_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3155_c7_35c4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3155_c7_35c4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3155_c7_35c4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3155_c7_35c4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3155_c7_35c4_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l3155_c7_35c4]
signal result_is_stack_read_MUX_uxn_opcodes_h_l3155_c7_35c4_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3155_c7_35c4_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3155_c7_35c4_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3155_c7_35c4_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3158_c11_5e9b]
signal BIN_OP_EQ_uxn_opcodes_h_l3158_c11_5e9b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3158_c11_5e9b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3158_c11_5e9b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l3158_c7_b019]
signal n16_MUX_uxn_opcodes_h_l3158_c7_b019_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l3158_c7_b019_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l3158_c7_b019_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l3158_c7_b019_return_output : unsigned(15 downto 0);

-- l16_MUX[uxn_opcodes_h_l3158_c7_b019]
signal l16_MUX_uxn_opcodes_h_l3158_c7_b019_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l3158_c7_b019_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l3158_c7_b019_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l3158_c7_b019_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3158_c7_b019]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3158_c7_b019_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3158_c7_b019_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3158_c7_b019_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3158_c7_b019_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3158_c7_b019]
signal result_stack_value_MUX_uxn_opcodes_h_l3158_c7_b019_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3158_c7_b019_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3158_c7_b019_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3158_c7_b019_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3158_c7_b019]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3158_c7_b019_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3158_c7_b019_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3158_c7_b019_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3158_c7_b019_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3158_c7_b019]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3158_c7_b019_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3158_c7_b019_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3158_c7_b019_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3158_c7_b019_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3158_c7_b019]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3158_c7_b019_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3158_c7_b019_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3158_c7_b019_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3158_c7_b019_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3158_c7_b019]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3158_c7_b019_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3158_c7_b019_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3158_c7_b019_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3158_c7_b019_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l3158_c7_b019]
signal result_is_stack_read_MUX_uxn_opcodes_h_l3158_c7_b019_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3158_c7_b019_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3158_c7_b019_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3158_c7_b019_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3163_c11_141a]
signal BIN_OP_EQ_uxn_opcodes_h_l3163_c11_141a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3163_c11_141a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3163_c11_141a_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l3163_c7_4fee]
signal n16_MUX_uxn_opcodes_h_l3163_c7_4fee_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l3163_c7_4fee_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l3163_c7_4fee_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l3163_c7_4fee_return_output : unsigned(15 downto 0);

-- l16_MUX[uxn_opcodes_h_l3163_c7_4fee]
signal l16_MUX_uxn_opcodes_h_l3163_c7_4fee_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l3163_c7_4fee_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l3163_c7_4fee_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l3163_c7_4fee_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3163_c7_4fee]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3163_c7_4fee_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3163_c7_4fee_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3163_c7_4fee_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3163_c7_4fee_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3163_c7_4fee]
signal result_stack_value_MUX_uxn_opcodes_h_l3163_c7_4fee_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3163_c7_4fee_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3163_c7_4fee_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3163_c7_4fee_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3163_c7_4fee]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3163_c7_4fee_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3163_c7_4fee_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3163_c7_4fee_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3163_c7_4fee_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3163_c7_4fee]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3163_c7_4fee_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3163_c7_4fee_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3163_c7_4fee_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3163_c7_4fee_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3163_c7_4fee]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3163_c7_4fee_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3163_c7_4fee_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3163_c7_4fee_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3163_c7_4fee_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3163_c7_4fee]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3163_c7_4fee_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3163_c7_4fee_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3163_c7_4fee_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3163_c7_4fee_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l3163_c7_4fee]
signal result_is_stack_read_MUX_uxn_opcodes_h_l3163_c7_4fee_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3163_c7_4fee_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3163_c7_4fee_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3163_c7_4fee_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3166_c11_d7b6]
signal BIN_OP_EQ_uxn_opcodes_h_l3166_c11_d7b6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3166_c11_d7b6_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3166_c11_d7b6_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l3166_c7_d0bf]
signal n16_MUX_uxn_opcodes_h_l3166_c7_d0bf_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l3166_c7_d0bf_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l3166_c7_d0bf_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l3166_c7_d0bf_return_output : unsigned(15 downto 0);

-- l16_MUX[uxn_opcodes_h_l3166_c7_d0bf]
signal l16_MUX_uxn_opcodes_h_l3166_c7_d0bf_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l3166_c7_d0bf_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l3166_c7_d0bf_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l3166_c7_d0bf_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3166_c7_d0bf]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3166_c7_d0bf_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3166_c7_d0bf_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3166_c7_d0bf_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3166_c7_d0bf_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3166_c7_d0bf]
signal result_stack_value_MUX_uxn_opcodes_h_l3166_c7_d0bf_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3166_c7_d0bf_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3166_c7_d0bf_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3166_c7_d0bf_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3166_c7_d0bf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3166_c7_d0bf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3166_c7_d0bf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3166_c7_d0bf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3166_c7_d0bf_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3166_c7_d0bf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3166_c7_d0bf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3166_c7_d0bf_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3166_c7_d0bf_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3166_c7_d0bf_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3166_c7_d0bf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3166_c7_d0bf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3166_c7_d0bf_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3166_c7_d0bf_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3166_c7_d0bf_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3166_c7_d0bf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3166_c7_d0bf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3166_c7_d0bf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3166_c7_d0bf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3166_c7_d0bf_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l3166_c7_d0bf]
signal result_is_stack_read_MUX_uxn_opcodes_h_l3166_c7_d0bf_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3166_c7_d0bf_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3166_c7_d0bf_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3166_c7_d0bf_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l3167_c3_359d]
signal BIN_OP_OR_uxn_opcodes_h_l3167_c3_359d_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l3167_c3_359d_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l3167_c3_359d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3170_c11_cf37]
signal BIN_OP_EQ_uxn_opcodes_h_l3170_c11_cf37_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3170_c11_cf37_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3170_c11_cf37_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l3170_c7_68c6]
signal l16_MUX_uxn_opcodes_h_l3170_c7_68c6_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l3170_c7_68c6_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l3170_c7_68c6_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l3170_c7_68c6_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3170_c7_68c6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3170_c7_68c6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3170_c7_68c6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3170_c7_68c6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3170_c7_68c6_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3170_c7_68c6]
signal result_stack_value_MUX_uxn_opcodes_h_l3170_c7_68c6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3170_c7_68c6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3170_c7_68c6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3170_c7_68c6_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3170_c7_68c6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3170_c7_68c6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3170_c7_68c6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3170_c7_68c6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3170_c7_68c6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3170_c7_68c6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3170_c7_68c6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3170_c7_68c6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3170_c7_68c6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3170_c7_68c6_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3170_c7_68c6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3170_c7_68c6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3170_c7_68c6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3170_c7_68c6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3170_c7_68c6_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3170_c7_68c6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3170_c7_68c6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3170_c7_68c6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3170_c7_68c6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3170_c7_68c6_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l3170_c7_68c6]
signal result_is_stack_read_MUX_uxn_opcodes_h_l3170_c7_68c6_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3170_c7_68c6_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3170_c7_68c6_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3170_c7_68c6_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3173_c11_4e02]
signal BIN_OP_EQ_uxn_opcodes_h_l3173_c11_4e02_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3173_c11_4e02_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3173_c11_4e02_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l3173_c7_11b4]
signal l16_MUX_uxn_opcodes_h_l3173_c7_11b4_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l3173_c7_11b4_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l3173_c7_11b4_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l3173_c7_11b4_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3173_c7_11b4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3173_c7_11b4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3173_c7_11b4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3173_c7_11b4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3173_c7_11b4_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3173_c7_11b4]
signal result_stack_value_MUX_uxn_opcodes_h_l3173_c7_11b4_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3173_c7_11b4_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3173_c7_11b4_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3173_c7_11b4_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3173_c7_11b4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3173_c7_11b4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3173_c7_11b4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3173_c7_11b4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3173_c7_11b4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3173_c7_11b4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3173_c7_11b4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3173_c7_11b4_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3173_c7_11b4_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3173_c7_11b4_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3173_c7_11b4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3173_c7_11b4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3173_c7_11b4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3173_c7_11b4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3173_c7_11b4_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3173_c7_11b4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3173_c7_11b4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3173_c7_11b4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3173_c7_11b4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3173_c7_11b4_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l3173_c7_11b4]
signal result_is_stack_read_MUX_uxn_opcodes_h_l3173_c7_11b4_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3173_c7_11b4_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3173_c7_11b4_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3173_c7_11b4_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3178_c11_ff07]
signal BIN_OP_EQ_uxn_opcodes_h_l3178_c11_ff07_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3178_c11_ff07_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3178_c11_ff07_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l3178_c7_eeb0]
signal l16_MUX_uxn_opcodes_h_l3178_c7_eeb0_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l3178_c7_eeb0_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l3178_c7_eeb0_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l3178_c7_eeb0_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3178_c7_eeb0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3178_c7_eeb0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3178_c7_eeb0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3178_c7_eeb0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3178_c7_eeb0_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3178_c7_eeb0]
signal result_stack_value_MUX_uxn_opcodes_h_l3178_c7_eeb0_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3178_c7_eeb0_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3178_c7_eeb0_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3178_c7_eeb0_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3178_c7_eeb0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3178_c7_eeb0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3178_c7_eeb0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3178_c7_eeb0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3178_c7_eeb0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3178_c7_eeb0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3178_c7_eeb0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3178_c7_eeb0_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3178_c7_eeb0_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3178_c7_eeb0_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3178_c7_eeb0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3178_c7_eeb0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3178_c7_eeb0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3178_c7_eeb0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3178_c7_eeb0_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3178_c7_eeb0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3178_c7_eeb0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3178_c7_eeb0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3178_c7_eeb0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3178_c7_eeb0_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l3178_c7_eeb0]
signal result_is_stack_read_MUX_uxn_opcodes_h_l3178_c7_eeb0_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3178_c7_eeb0_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3178_c7_eeb0_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3178_c7_eeb0_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3181_c11_7a66]
signal BIN_OP_EQ_uxn_opcodes_h_l3181_c11_7a66_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3181_c11_7a66_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3181_c11_7a66_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l3181_c7_557e]
signal l16_MUX_uxn_opcodes_h_l3181_c7_557e_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l3181_c7_557e_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l3181_c7_557e_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l3181_c7_557e_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3181_c7_557e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3181_c7_557e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3181_c7_557e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3181_c7_557e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3181_c7_557e_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3181_c7_557e]
signal result_stack_value_MUX_uxn_opcodes_h_l3181_c7_557e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3181_c7_557e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3181_c7_557e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3181_c7_557e_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3181_c7_557e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3181_c7_557e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3181_c7_557e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3181_c7_557e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3181_c7_557e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3181_c7_557e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3181_c7_557e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3181_c7_557e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3181_c7_557e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3181_c7_557e_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3181_c7_557e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3181_c7_557e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3181_c7_557e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3181_c7_557e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3181_c7_557e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3181_c7_557e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3181_c7_557e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3181_c7_557e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3181_c7_557e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3181_c7_557e_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l3181_c7_557e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l3181_c7_557e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3181_c7_557e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3181_c7_557e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3181_c7_557e_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l3182_c3_1d15]
signal BIN_OP_OR_uxn_opcodes_h_l3182_c3_1d15_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l3182_c3_1d15_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l3182_c3_1d15_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l3185_c32_0b85]
signal BIN_OP_AND_uxn_opcodes_h_l3185_c32_0b85_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l3185_c32_0b85_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l3185_c32_0b85_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l3185_c32_3b45]
signal BIN_OP_GT_uxn_opcodes_h_l3185_c32_3b45_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l3185_c32_3b45_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l3185_c32_3b45_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l3185_c32_2b70]
signal MUX_uxn_opcodes_h_l3185_c32_2b70_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l3185_c32_2b70_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l3185_c32_2b70_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l3185_c32_2b70_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3187_c11_c7a8]
signal BIN_OP_EQ_uxn_opcodes_h_l3187_c11_c7a8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3187_c11_c7a8_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3187_c11_c7a8_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3187_c7_dba2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3187_c7_dba2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3187_c7_dba2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3187_c7_dba2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3187_c7_dba2_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3187_c7_dba2]
signal result_stack_value_MUX_uxn_opcodes_h_l3187_c7_dba2_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3187_c7_dba2_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3187_c7_dba2_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3187_c7_dba2_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3187_c7_dba2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3187_c7_dba2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3187_c7_dba2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3187_c7_dba2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3187_c7_dba2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3187_c7_dba2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3187_c7_dba2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3187_c7_dba2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3187_c7_dba2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3187_c7_dba2_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3187_c7_dba2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3187_c7_dba2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3187_c7_dba2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3187_c7_dba2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3187_c7_dba2_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3193_c11_9474]
signal BIN_OP_EQ_uxn_opcodes_h_l3193_c11_9474_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3193_c11_9474_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3193_c11_9474_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3193_c7_e961]
signal result_stack_value_MUX_uxn_opcodes_h_l3193_c7_e961_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3193_c7_e961_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3193_c7_e961_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3193_c7_e961_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3193_c7_e961]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3193_c7_e961_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3193_c7_e961_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3193_c7_e961_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3193_c7_e961_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3193_c7_e961]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3193_c7_e961_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3193_c7_e961_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3193_c7_e961_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3193_c7_e961_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3193_c7_e961]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3193_c7_e961_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3193_c7_e961_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3193_c7_e961_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3193_c7_e961_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l3195_c34_6e27]
signal CONST_SR_8_uxn_opcodes_h_l3195_c34_6e27_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l3195_c34_6e27_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3197_c11_6d32]
signal BIN_OP_EQ_uxn_opcodes_h_l3197_c11_6d32_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3197_c11_6d32_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3197_c11_6d32_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3197_c7_d1e9]
signal result_stack_value_MUX_uxn_opcodes_h_l3197_c7_d1e9_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3197_c7_d1e9_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3197_c7_d1e9_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3197_c7_d1e9_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3197_c7_d1e9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3197_c7_d1e9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3197_c7_d1e9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3197_c7_d1e9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3197_c7_d1e9_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3197_c7_d1e9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3197_c7_d1e9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3197_c7_d1e9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3197_c7_d1e9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3197_c7_d1e9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3197_c7_d1e9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3197_c7_d1e9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3197_c7_d1e9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3197_c7_d1e9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3197_c7_d1e9_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3201_c11_6c26]
signal BIN_OP_EQ_uxn_opcodes_h_l3201_c11_6c26_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3201_c11_6c26_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3201_c11_6c26_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3201_c7_362d]
signal result_stack_value_MUX_uxn_opcodes_h_l3201_c7_362d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3201_c7_362d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3201_c7_362d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3201_c7_362d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3201_c7_362d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3201_c7_362d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3201_c7_362d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3201_c7_362d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3201_c7_362d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3201_c7_362d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3201_c7_362d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3201_c7_362d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3201_c7_362d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3201_c7_362d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3201_c7_362d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3201_c7_362d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3201_c7_362d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3201_c7_362d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3201_c7_362d_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l3203_c34_e600]
signal CONST_SR_8_uxn_opcodes_h_l3203_c34_e600_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l3203_c34_e600_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3205_c11_d10d]
signal BIN_OP_EQ_uxn_opcodes_h_l3205_c11_d10d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3205_c11_d10d_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3205_c11_d10d_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3205_c7_e28a]
signal result_stack_value_MUX_uxn_opcodes_h_l3205_c7_e28a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3205_c7_e28a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3205_c7_e28a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3205_c7_e28a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3205_c7_e28a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3205_c7_e28a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3205_c7_e28a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3205_c7_e28a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3205_c7_e28a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3205_c7_e28a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3205_c7_e28a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3205_c7_e28a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3205_c7_e28a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3205_c7_e28a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3205_c7_e28a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3205_c7_e28a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3205_c7_e28a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3205_c7_e28a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3205_c7_e28a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3209_c11_499e]
signal BIN_OP_EQ_uxn_opcodes_h_l3209_c11_499e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3209_c11_499e_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3209_c11_499e_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3209_c7_5101]
signal result_stack_value_MUX_uxn_opcodes_h_l3209_c7_5101_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3209_c7_5101_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3209_c7_5101_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3209_c7_5101_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3209_c7_5101]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3209_c7_5101_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3209_c7_5101_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3209_c7_5101_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3209_c7_5101_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3209_c7_5101]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3209_c7_5101_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3209_c7_5101_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3209_c7_5101_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3209_c7_5101_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3209_c7_5101]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3209_c7_5101_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3209_c7_5101_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3209_c7_5101_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3209_c7_5101_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l3211_c34_ba7f]
signal CONST_SR_8_uxn_opcodes_h_l3211_c34_ba7f_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l3211_c34_ba7f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3213_c11_627a]
signal BIN_OP_EQ_uxn_opcodes_h_l3213_c11_627a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3213_c11_627a_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3213_c11_627a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3213_c7_378a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3213_c7_378a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3213_c7_378a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3213_c7_378a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3213_c7_378a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3213_c7_378a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3213_c7_378a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3213_c7_378a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3213_c7_378a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3213_c7_378a_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l3145_l3175_l3160_DUPLICATE_73da
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l3145_l3175_l3160_DUPLICATE_73da_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l3145_l3175_l3160_DUPLICATE_73da_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_287e( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : signed;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_sp_shift := ref_toks_1;
      base.stack_value := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.is_stack_read := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l3134_c6_7f67
BIN_OP_EQ_uxn_opcodes_h_l3134_c6_7f67 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3134_c6_7f67_left,
BIN_OP_EQ_uxn_opcodes_h_l3134_c6_7f67_right,
BIN_OP_EQ_uxn_opcodes_h_l3134_c6_7f67_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3134_c1_8829
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3134_c1_8829 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3134_c1_8829_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3134_c1_8829_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3134_c1_8829_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3134_c1_8829_return_output);

-- n16_MUX_uxn_opcodes_h_l3134_c2_4d74
n16_MUX_uxn_opcodes_h_l3134_c2_4d74 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l3134_c2_4d74_cond,
n16_MUX_uxn_opcodes_h_l3134_c2_4d74_iftrue,
n16_MUX_uxn_opcodes_h_l3134_c2_4d74_iffalse,
n16_MUX_uxn_opcodes_h_l3134_c2_4d74_return_output);

-- t16_MUX_uxn_opcodes_h_l3134_c2_4d74
t16_MUX_uxn_opcodes_h_l3134_c2_4d74 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l3134_c2_4d74_cond,
t16_MUX_uxn_opcodes_h_l3134_c2_4d74_iftrue,
t16_MUX_uxn_opcodes_h_l3134_c2_4d74_iffalse,
t16_MUX_uxn_opcodes_h_l3134_c2_4d74_return_output);

-- l16_MUX_uxn_opcodes_h_l3134_c2_4d74
l16_MUX_uxn_opcodes_h_l3134_c2_4d74 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l3134_c2_4d74_cond,
l16_MUX_uxn_opcodes_h_l3134_c2_4d74_iftrue,
l16_MUX_uxn_opcodes_h_l3134_c2_4d74_iffalse,
l16_MUX_uxn_opcodes_h_l3134_c2_4d74_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3134_c2_4d74
result_is_sp_shift_MUX_uxn_opcodes_h_l3134_c2_4d74 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3134_c2_4d74_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3134_c2_4d74_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3134_c2_4d74_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3134_c2_4d74_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3134_c2_4d74
result_stack_value_MUX_uxn_opcodes_h_l3134_c2_4d74 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3134_c2_4d74_cond,
result_stack_value_MUX_uxn_opcodes_h_l3134_c2_4d74_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3134_c2_4d74_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3134_c2_4d74_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3134_c2_4d74
result_is_stack_write_MUX_uxn_opcodes_h_l3134_c2_4d74 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3134_c2_4d74_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3134_c2_4d74_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3134_c2_4d74_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3134_c2_4d74_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3134_c2_4d74
result_sp_relative_shift_MUX_uxn_opcodes_h_l3134_c2_4d74 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3134_c2_4d74_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3134_c2_4d74_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3134_c2_4d74_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3134_c2_4d74_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3134_c2_4d74
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3134_c2_4d74 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3134_c2_4d74_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3134_c2_4d74_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3134_c2_4d74_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3134_c2_4d74_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3134_c2_4d74
result_is_opc_done_MUX_uxn_opcodes_h_l3134_c2_4d74 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3134_c2_4d74_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3134_c2_4d74_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3134_c2_4d74_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3134_c2_4d74_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l3134_c2_4d74
result_is_stack_read_MUX_uxn_opcodes_h_l3134_c2_4d74 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l3134_c2_4d74_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l3134_c2_4d74_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l3134_c2_4d74_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l3134_c2_4d74_return_output);

-- printf_uxn_opcodes_h_l3135_c3_d843_uxn_opcodes_h_l3135_c3_d843
printf_uxn_opcodes_h_l3135_c3_d843_uxn_opcodes_h_l3135_c3_d843 : entity work.printf_uxn_opcodes_h_l3135_c3_d843_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l3135_c3_d843_uxn_opcodes_h_l3135_c3_d843_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l3140_c11_e1f9
BIN_OP_EQ_uxn_opcodes_h_l3140_c11_e1f9 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3140_c11_e1f9_left,
BIN_OP_EQ_uxn_opcodes_h_l3140_c11_e1f9_right,
BIN_OP_EQ_uxn_opcodes_h_l3140_c11_e1f9_return_output);

-- n16_MUX_uxn_opcodes_h_l3140_c7_c7d4
n16_MUX_uxn_opcodes_h_l3140_c7_c7d4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l3140_c7_c7d4_cond,
n16_MUX_uxn_opcodes_h_l3140_c7_c7d4_iftrue,
n16_MUX_uxn_opcodes_h_l3140_c7_c7d4_iffalse,
n16_MUX_uxn_opcodes_h_l3140_c7_c7d4_return_output);

-- t16_MUX_uxn_opcodes_h_l3140_c7_c7d4
t16_MUX_uxn_opcodes_h_l3140_c7_c7d4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l3140_c7_c7d4_cond,
t16_MUX_uxn_opcodes_h_l3140_c7_c7d4_iftrue,
t16_MUX_uxn_opcodes_h_l3140_c7_c7d4_iffalse,
t16_MUX_uxn_opcodes_h_l3140_c7_c7d4_return_output);

-- l16_MUX_uxn_opcodes_h_l3140_c7_c7d4
l16_MUX_uxn_opcodes_h_l3140_c7_c7d4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l3140_c7_c7d4_cond,
l16_MUX_uxn_opcodes_h_l3140_c7_c7d4_iftrue,
l16_MUX_uxn_opcodes_h_l3140_c7_c7d4_iffalse,
l16_MUX_uxn_opcodes_h_l3140_c7_c7d4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3140_c7_c7d4
result_is_sp_shift_MUX_uxn_opcodes_h_l3140_c7_c7d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3140_c7_c7d4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3140_c7_c7d4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3140_c7_c7d4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3140_c7_c7d4_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3140_c7_c7d4
result_stack_value_MUX_uxn_opcodes_h_l3140_c7_c7d4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3140_c7_c7d4_cond,
result_stack_value_MUX_uxn_opcodes_h_l3140_c7_c7d4_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3140_c7_c7d4_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3140_c7_c7d4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3140_c7_c7d4
result_is_stack_write_MUX_uxn_opcodes_h_l3140_c7_c7d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3140_c7_c7d4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3140_c7_c7d4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3140_c7_c7d4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3140_c7_c7d4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3140_c7_c7d4
result_sp_relative_shift_MUX_uxn_opcodes_h_l3140_c7_c7d4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3140_c7_c7d4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3140_c7_c7d4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3140_c7_c7d4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3140_c7_c7d4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3140_c7_c7d4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3140_c7_c7d4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3140_c7_c7d4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3140_c7_c7d4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3140_c7_c7d4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3140_c7_c7d4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3140_c7_c7d4
result_is_opc_done_MUX_uxn_opcodes_h_l3140_c7_c7d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3140_c7_c7d4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3140_c7_c7d4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3140_c7_c7d4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3140_c7_c7d4_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l3140_c7_c7d4
result_is_stack_read_MUX_uxn_opcodes_h_l3140_c7_c7d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l3140_c7_c7d4_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l3140_c7_c7d4_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l3140_c7_c7d4_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l3140_c7_c7d4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3143_c11_7de5
BIN_OP_EQ_uxn_opcodes_h_l3143_c11_7de5 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3143_c11_7de5_left,
BIN_OP_EQ_uxn_opcodes_h_l3143_c11_7de5_right,
BIN_OP_EQ_uxn_opcodes_h_l3143_c11_7de5_return_output);

-- n16_MUX_uxn_opcodes_h_l3143_c7_d22e
n16_MUX_uxn_opcodes_h_l3143_c7_d22e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l3143_c7_d22e_cond,
n16_MUX_uxn_opcodes_h_l3143_c7_d22e_iftrue,
n16_MUX_uxn_opcodes_h_l3143_c7_d22e_iffalse,
n16_MUX_uxn_opcodes_h_l3143_c7_d22e_return_output);

-- t16_MUX_uxn_opcodes_h_l3143_c7_d22e
t16_MUX_uxn_opcodes_h_l3143_c7_d22e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l3143_c7_d22e_cond,
t16_MUX_uxn_opcodes_h_l3143_c7_d22e_iftrue,
t16_MUX_uxn_opcodes_h_l3143_c7_d22e_iffalse,
t16_MUX_uxn_opcodes_h_l3143_c7_d22e_return_output);

-- l16_MUX_uxn_opcodes_h_l3143_c7_d22e
l16_MUX_uxn_opcodes_h_l3143_c7_d22e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l3143_c7_d22e_cond,
l16_MUX_uxn_opcodes_h_l3143_c7_d22e_iftrue,
l16_MUX_uxn_opcodes_h_l3143_c7_d22e_iffalse,
l16_MUX_uxn_opcodes_h_l3143_c7_d22e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3143_c7_d22e
result_is_sp_shift_MUX_uxn_opcodes_h_l3143_c7_d22e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3143_c7_d22e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3143_c7_d22e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3143_c7_d22e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3143_c7_d22e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3143_c7_d22e
result_stack_value_MUX_uxn_opcodes_h_l3143_c7_d22e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3143_c7_d22e_cond,
result_stack_value_MUX_uxn_opcodes_h_l3143_c7_d22e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3143_c7_d22e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3143_c7_d22e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3143_c7_d22e
result_is_stack_write_MUX_uxn_opcodes_h_l3143_c7_d22e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3143_c7_d22e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3143_c7_d22e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3143_c7_d22e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3143_c7_d22e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3143_c7_d22e
result_sp_relative_shift_MUX_uxn_opcodes_h_l3143_c7_d22e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3143_c7_d22e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3143_c7_d22e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3143_c7_d22e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3143_c7_d22e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3143_c7_d22e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3143_c7_d22e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3143_c7_d22e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3143_c7_d22e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3143_c7_d22e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3143_c7_d22e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3143_c7_d22e
result_is_opc_done_MUX_uxn_opcodes_h_l3143_c7_d22e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3143_c7_d22e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3143_c7_d22e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3143_c7_d22e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3143_c7_d22e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l3143_c7_d22e
result_is_stack_read_MUX_uxn_opcodes_h_l3143_c7_d22e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l3143_c7_d22e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l3143_c7_d22e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l3143_c7_d22e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l3143_c7_d22e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3148_c11_6f95
BIN_OP_EQ_uxn_opcodes_h_l3148_c11_6f95 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3148_c11_6f95_left,
BIN_OP_EQ_uxn_opcodes_h_l3148_c11_6f95_right,
BIN_OP_EQ_uxn_opcodes_h_l3148_c11_6f95_return_output);

-- n16_MUX_uxn_opcodes_h_l3148_c7_15d3
n16_MUX_uxn_opcodes_h_l3148_c7_15d3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l3148_c7_15d3_cond,
n16_MUX_uxn_opcodes_h_l3148_c7_15d3_iftrue,
n16_MUX_uxn_opcodes_h_l3148_c7_15d3_iffalse,
n16_MUX_uxn_opcodes_h_l3148_c7_15d3_return_output);

-- t16_MUX_uxn_opcodes_h_l3148_c7_15d3
t16_MUX_uxn_opcodes_h_l3148_c7_15d3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l3148_c7_15d3_cond,
t16_MUX_uxn_opcodes_h_l3148_c7_15d3_iftrue,
t16_MUX_uxn_opcodes_h_l3148_c7_15d3_iffalse,
t16_MUX_uxn_opcodes_h_l3148_c7_15d3_return_output);

-- l16_MUX_uxn_opcodes_h_l3148_c7_15d3
l16_MUX_uxn_opcodes_h_l3148_c7_15d3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l3148_c7_15d3_cond,
l16_MUX_uxn_opcodes_h_l3148_c7_15d3_iftrue,
l16_MUX_uxn_opcodes_h_l3148_c7_15d3_iffalse,
l16_MUX_uxn_opcodes_h_l3148_c7_15d3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3148_c7_15d3
result_is_sp_shift_MUX_uxn_opcodes_h_l3148_c7_15d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3148_c7_15d3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3148_c7_15d3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3148_c7_15d3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3148_c7_15d3_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3148_c7_15d3
result_stack_value_MUX_uxn_opcodes_h_l3148_c7_15d3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3148_c7_15d3_cond,
result_stack_value_MUX_uxn_opcodes_h_l3148_c7_15d3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3148_c7_15d3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3148_c7_15d3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3148_c7_15d3
result_is_stack_write_MUX_uxn_opcodes_h_l3148_c7_15d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3148_c7_15d3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3148_c7_15d3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3148_c7_15d3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3148_c7_15d3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3148_c7_15d3
result_sp_relative_shift_MUX_uxn_opcodes_h_l3148_c7_15d3 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3148_c7_15d3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3148_c7_15d3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3148_c7_15d3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3148_c7_15d3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3148_c7_15d3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3148_c7_15d3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3148_c7_15d3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3148_c7_15d3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3148_c7_15d3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3148_c7_15d3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3148_c7_15d3
result_is_opc_done_MUX_uxn_opcodes_h_l3148_c7_15d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3148_c7_15d3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3148_c7_15d3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3148_c7_15d3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3148_c7_15d3_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l3148_c7_15d3
result_is_stack_read_MUX_uxn_opcodes_h_l3148_c7_15d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l3148_c7_15d3_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l3148_c7_15d3_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l3148_c7_15d3_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l3148_c7_15d3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3151_c11_0191
BIN_OP_EQ_uxn_opcodes_h_l3151_c11_0191 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3151_c11_0191_left,
BIN_OP_EQ_uxn_opcodes_h_l3151_c11_0191_right,
BIN_OP_EQ_uxn_opcodes_h_l3151_c11_0191_return_output);

-- n16_MUX_uxn_opcodes_h_l3151_c7_b003
n16_MUX_uxn_opcodes_h_l3151_c7_b003 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l3151_c7_b003_cond,
n16_MUX_uxn_opcodes_h_l3151_c7_b003_iftrue,
n16_MUX_uxn_opcodes_h_l3151_c7_b003_iffalse,
n16_MUX_uxn_opcodes_h_l3151_c7_b003_return_output);

-- t16_MUX_uxn_opcodes_h_l3151_c7_b003
t16_MUX_uxn_opcodes_h_l3151_c7_b003 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l3151_c7_b003_cond,
t16_MUX_uxn_opcodes_h_l3151_c7_b003_iftrue,
t16_MUX_uxn_opcodes_h_l3151_c7_b003_iffalse,
t16_MUX_uxn_opcodes_h_l3151_c7_b003_return_output);

-- l16_MUX_uxn_opcodes_h_l3151_c7_b003
l16_MUX_uxn_opcodes_h_l3151_c7_b003 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l3151_c7_b003_cond,
l16_MUX_uxn_opcodes_h_l3151_c7_b003_iftrue,
l16_MUX_uxn_opcodes_h_l3151_c7_b003_iffalse,
l16_MUX_uxn_opcodes_h_l3151_c7_b003_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3151_c7_b003
result_is_sp_shift_MUX_uxn_opcodes_h_l3151_c7_b003 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3151_c7_b003_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3151_c7_b003_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3151_c7_b003_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3151_c7_b003_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3151_c7_b003
result_stack_value_MUX_uxn_opcodes_h_l3151_c7_b003 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3151_c7_b003_cond,
result_stack_value_MUX_uxn_opcodes_h_l3151_c7_b003_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3151_c7_b003_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3151_c7_b003_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3151_c7_b003
result_is_stack_write_MUX_uxn_opcodes_h_l3151_c7_b003 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3151_c7_b003_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3151_c7_b003_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3151_c7_b003_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3151_c7_b003_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3151_c7_b003
result_sp_relative_shift_MUX_uxn_opcodes_h_l3151_c7_b003 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3151_c7_b003_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3151_c7_b003_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3151_c7_b003_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3151_c7_b003_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3151_c7_b003
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3151_c7_b003 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3151_c7_b003_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3151_c7_b003_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3151_c7_b003_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3151_c7_b003_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3151_c7_b003
result_is_opc_done_MUX_uxn_opcodes_h_l3151_c7_b003 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3151_c7_b003_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3151_c7_b003_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3151_c7_b003_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3151_c7_b003_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l3151_c7_b003
result_is_stack_read_MUX_uxn_opcodes_h_l3151_c7_b003 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l3151_c7_b003_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l3151_c7_b003_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l3151_c7_b003_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l3151_c7_b003_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l3152_c3_0bbe
BIN_OP_OR_uxn_opcodes_h_l3152_c3_0bbe : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l3152_c3_0bbe_left,
BIN_OP_OR_uxn_opcodes_h_l3152_c3_0bbe_right,
BIN_OP_OR_uxn_opcodes_h_l3152_c3_0bbe_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3155_c11_8547
BIN_OP_EQ_uxn_opcodes_h_l3155_c11_8547 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3155_c11_8547_left,
BIN_OP_EQ_uxn_opcodes_h_l3155_c11_8547_right,
BIN_OP_EQ_uxn_opcodes_h_l3155_c11_8547_return_output);

-- n16_MUX_uxn_opcodes_h_l3155_c7_35c4
n16_MUX_uxn_opcodes_h_l3155_c7_35c4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l3155_c7_35c4_cond,
n16_MUX_uxn_opcodes_h_l3155_c7_35c4_iftrue,
n16_MUX_uxn_opcodes_h_l3155_c7_35c4_iffalse,
n16_MUX_uxn_opcodes_h_l3155_c7_35c4_return_output);

-- l16_MUX_uxn_opcodes_h_l3155_c7_35c4
l16_MUX_uxn_opcodes_h_l3155_c7_35c4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l3155_c7_35c4_cond,
l16_MUX_uxn_opcodes_h_l3155_c7_35c4_iftrue,
l16_MUX_uxn_opcodes_h_l3155_c7_35c4_iffalse,
l16_MUX_uxn_opcodes_h_l3155_c7_35c4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3155_c7_35c4
result_is_sp_shift_MUX_uxn_opcodes_h_l3155_c7_35c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3155_c7_35c4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3155_c7_35c4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3155_c7_35c4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3155_c7_35c4_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3155_c7_35c4
result_stack_value_MUX_uxn_opcodes_h_l3155_c7_35c4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3155_c7_35c4_cond,
result_stack_value_MUX_uxn_opcodes_h_l3155_c7_35c4_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3155_c7_35c4_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3155_c7_35c4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3155_c7_35c4
result_is_stack_write_MUX_uxn_opcodes_h_l3155_c7_35c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3155_c7_35c4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3155_c7_35c4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3155_c7_35c4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3155_c7_35c4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3155_c7_35c4
result_sp_relative_shift_MUX_uxn_opcodes_h_l3155_c7_35c4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3155_c7_35c4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3155_c7_35c4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3155_c7_35c4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3155_c7_35c4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3155_c7_35c4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3155_c7_35c4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3155_c7_35c4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3155_c7_35c4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3155_c7_35c4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3155_c7_35c4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3155_c7_35c4
result_is_opc_done_MUX_uxn_opcodes_h_l3155_c7_35c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3155_c7_35c4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3155_c7_35c4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3155_c7_35c4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3155_c7_35c4_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l3155_c7_35c4
result_is_stack_read_MUX_uxn_opcodes_h_l3155_c7_35c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l3155_c7_35c4_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l3155_c7_35c4_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l3155_c7_35c4_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l3155_c7_35c4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3158_c11_5e9b
BIN_OP_EQ_uxn_opcodes_h_l3158_c11_5e9b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3158_c11_5e9b_left,
BIN_OP_EQ_uxn_opcodes_h_l3158_c11_5e9b_right,
BIN_OP_EQ_uxn_opcodes_h_l3158_c11_5e9b_return_output);

-- n16_MUX_uxn_opcodes_h_l3158_c7_b019
n16_MUX_uxn_opcodes_h_l3158_c7_b019 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l3158_c7_b019_cond,
n16_MUX_uxn_opcodes_h_l3158_c7_b019_iftrue,
n16_MUX_uxn_opcodes_h_l3158_c7_b019_iffalse,
n16_MUX_uxn_opcodes_h_l3158_c7_b019_return_output);

-- l16_MUX_uxn_opcodes_h_l3158_c7_b019
l16_MUX_uxn_opcodes_h_l3158_c7_b019 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l3158_c7_b019_cond,
l16_MUX_uxn_opcodes_h_l3158_c7_b019_iftrue,
l16_MUX_uxn_opcodes_h_l3158_c7_b019_iffalse,
l16_MUX_uxn_opcodes_h_l3158_c7_b019_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3158_c7_b019
result_is_sp_shift_MUX_uxn_opcodes_h_l3158_c7_b019 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3158_c7_b019_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3158_c7_b019_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3158_c7_b019_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3158_c7_b019_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3158_c7_b019
result_stack_value_MUX_uxn_opcodes_h_l3158_c7_b019 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3158_c7_b019_cond,
result_stack_value_MUX_uxn_opcodes_h_l3158_c7_b019_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3158_c7_b019_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3158_c7_b019_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3158_c7_b019
result_is_stack_write_MUX_uxn_opcodes_h_l3158_c7_b019 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3158_c7_b019_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3158_c7_b019_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3158_c7_b019_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3158_c7_b019_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3158_c7_b019
result_sp_relative_shift_MUX_uxn_opcodes_h_l3158_c7_b019 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3158_c7_b019_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3158_c7_b019_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3158_c7_b019_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3158_c7_b019_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3158_c7_b019
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3158_c7_b019 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3158_c7_b019_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3158_c7_b019_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3158_c7_b019_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3158_c7_b019_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3158_c7_b019
result_is_opc_done_MUX_uxn_opcodes_h_l3158_c7_b019 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3158_c7_b019_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3158_c7_b019_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3158_c7_b019_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3158_c7_b019_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l3158_c7_b019
result_is_stack_read_MUX_uxn_opcodes_h_l3158_c7_b019 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l3158_c7_b019_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l3158_c7_b019_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l3158_c7_b019_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l3158_c7_b019_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3163_c11_141a
BIN_OP_EQ_uxn_opcodes_h_l3163_c11_141a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3163_c11_141a_left,
BIN_OP_EQ_uxn_opcodes_h_l3163_c11_141a_right,
BIN_OP_EQ_uxn_opcodes_h_l3163_c11_141a_return_output);

-- n16_MUX_uxn_opcodes_h_l3163_c7_4fee
n16_MUX_uxn_opcodes_h_l3163_c7_4fee : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l3163_c7_4fee_cond,
n16_MUX_uxn_opcodes_h_l3163_c7_4fee_iftrue,
n16_MUX_uxn_opcodes_h_l3163_c7_4fee_iffalse,
n16_MUX_uxn_opcodes_h_l3163_c7_4fee_return_output);

-- l16_MUX_uxn_opcodes_h_l3163_c7_4fee
l16_MUX_uxn_opcodes_h_l3163_c7_4fee : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l3163_c7_4fee_cond,
l16_MUX_uxn_opcodes_h_l3163_c7_4fee_iftrue,
l16_MUX_uxn_opcodes_h_l3163_c7_4fee_iffalse,
l16_MUX_uxn_opcodes_h_l3163_c7_4fee_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3163_c7_4fee
result_is_sp_shift_MUX_uxn_opcodes_h_l3163_c7_4fee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3163_c7_4fee_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3163_c7_4fee_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3163_c7_4fee_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3163_c7_4fee_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3163_c7_4fee
result_stack_value_MUX_uxn_opcodes_h_l3163_c7_4fee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3163_c7_4fee_cond,
result_stack_value_MUX_uxn_opcodes_h_l3163_c7_4fee_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3163_c7_4fee_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3163_c7_4fee_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3163_c7_4fee
result_is_stack_write_MUX_uxn_opcodes_h_l3163_c7_4fee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3163_c7_4fee_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3163_c7_4fee_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3163_c7_4fee_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3163_c7_4fee_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3163_c7_4fee
result_sp_relative_shift_MUX_uxn_opcodes_h_l3163_c7_4fee : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3163_c7_4fee_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3163_c7_4fee_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3163_c7_4fee_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3163_c7_4fee_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3163_c7_4fee
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3163_c7_4fee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3163_c7_4fee_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3163_c7_4fee_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3163_c7_4fee_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3163_c7_4fee_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3163_c7_4fee
result_is_opc_done_MUX_uxn_opcodes_h_l3163_c7_4fee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3163_c7_4fee_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3163_c7_4fee_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3163_c7_4fee_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3163_c7_4fee_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l3163_c7_4fee
result_is_stack_read_MUX_uxn_opcodes_h_l3163_c7_4fee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l3163_c7_4fee_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l3163_c7_4fee_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l3163_c7_4fee_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l3163_c7_4fee_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3166_c11_d7b6
BIN_OP_EQ_uxn_opcodes_h_l3166_c11_d7b6 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3166_c11_d7b6_left,
BIN_OP_EQ_uxn_opcodes_h_l3166_c11_d7b6_right,
BIN_OP_EQ_uxn_opcodes_h_l3166_c11_d7b6_return_output);

-- n16_MUX_uxn_opcodes_h_l3166_c7_d0bf
n16_MUX_uxn_opcodes_h_l3166_c7_d0bf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l3166_c7_d0bf_cond,
n16_MUX_uxn_opcodes_h_l3166_c7_d0bf_iftrue,
n16_MUX_uxn_opcodes_h_l3166_c7_d0bf_iffalse,
n16_MUX_uxn_opcodes_h_l3166_c7_d0bf_return_output);

-- l16_MUX_uxn_opcodes_h_l3166_c7_d0bf
l16_MUX_uxn_opcodes_h_l3166_c7_d0bf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l3166_c7_d0bf_cond,
l16_MUX_uxn_opcodes_h_l3166_c7_d0bf_iftrue,
l16_MUX_uxn_opcodes_h_l3166_c7_d0bf_iffalse,
l16_MUX_uxn_opcodes_h_l3166_c7_d0bf_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3166_c7_d0bf
result_is_sp_shift_MUX_uxn_opcodes_h_l3166_c7_d0bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3166_c7_d0bf_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3166_c7_d0bf_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3166_c7_d0bf_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3166_c7_d0bf_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3166_c7_d0bf
result_stack_value_MUX_uxn_opcodes_h_l3166_c7_d0bf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3166_c7_d0bf_cond,
result_stack_value_MUX_uxn_opcodes_h_l3166_c7_d0bf_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3166_c7_d0bf_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3166_c7_d0bf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3166_c7_d0bf
result_is_stack_write_MUX_uxn_opcodes_h_l3166_c7_d0bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3166_c7_d0bf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3166_c7_d0bf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3166_c7_d0bf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3166_c7_d0bf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3166_c7_d0bf
result_sp_relative_shift_MUX_uxn_opcodes_h_l3166_c7_d0bf : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3166_c7_d0bf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3166_c7_d0bf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3166_c7_d0bf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3166_c7_d0bf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3166_c7_d0bf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3166_c7_d0bf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3166_c7_d0bf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3166_c7_d0bf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3166_c7_d0bf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3166_c7_d0bf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3166_c7_d0bf
result_is_opc_done_MUX_uxn_opcodes_h_l3166_c7_d0bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3166_c7_d0bf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3166_c7_d0bf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3166_c7_d0bf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3166_c7_d0bf_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l3166_c7_d0bf
result_is_stack_read_MUX_uxn_opcodes_h_l3166_c7_d0bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l3166_c7_d0bf_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l3166_c7_d0bf_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l3166_c7_d0bf_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l3166_c7_d0bf_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l3167_c3_359d
BIN_OP_OR_uxn_opcodes_h_l3167_c3_359d : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l3167_c3_359d_left,
BIN_OP_OR_uxn_opcodes_h_l3167_c3_359d_right,
BIN_OP_OR_uxn_opcodes_h_l3167_c3_359d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3170_c11_cf37
BIN_OP_EQ_uxn_opcodes_h_l3170_c11_cf37 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3170_c11_cf37_left,
BIN_OP_EQ_uxn_opcodes_h_l3170_c11_cf37_right,
BIN_OP_EQ_uxn_opcodes_h_l3170_c11_cf37_return_output);

-- l16_MUX_uxn_opcodes_h_l3170_c7_68c6
l16_MUX_uxn_opcodes_h_l3170_c7_68c6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l3170_c7_68c6_cond,
l16_MUX_uxn_opcodes_h_l3170_c7_68c6_iftrue,
l16_MUX_uxn_opcodes_h_l3170_c7_68c6_iffalse,
l16_MUX_uxn_opcodes_h_l3170_c7_68c6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3170_c7_68c6
result_is_sp_shift_MUX_uxn_opcodes_h_l3170_c7_68c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3170_c7_68c6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3170_c7_68c6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3170_c7_68c6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3170_c7_68c6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3170_c7_68c6
result_stack_value_MUX_uxn_opcodes_h_l3170_c7_68c6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3170_c7_68c6_cond,
result_stack_value_MUX_uxn_opcodes_h_l3170_c7_68c6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3170_c7_68c6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3170_c7_68c6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3170_c7_68c6
result_is_stack_write_MUX_uxn_opcodes_h_l3170_c7_68c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3170_c7_68c6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3170_c7_68c6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3170_c7_68c6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3170_c7_68c6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3170_c7_68c6
result_sp_relative_shift_MUX_uxn_opcodes_h_l3170_c7_68c6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3170_c7_68c6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3170_c7_68c6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3170_c7_68c6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3170_c7_68c6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3170_c7_68c6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3170_c7_68c6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3170_c7_68c6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3170_c7_68c6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3170_c7_68c6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3170_c7_68c6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3170_c7_68c6
result_is_opc_done_MUX_uxn_opcodes_h_l3170_c7_68c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3170_c7_68c6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3170_c7_68c6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3170_c7_68c6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3170_c7_68c6_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l3170_c7_68c6
result_is_stack_read_MUX_uxn_opcodes_h_l3170_c7_68c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l3170_c7_68c6_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l3170_c7_68c6_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l3170_c7_68c6_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l3170_c7_68c6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3173_c11_4e02
BIN_OP_EQ_uxn_opcodes_h_l3173_c11_4e02 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3173_c11_4e02_left,
BIN_OP_EQ_uxn_opcodes_h_l3173_c11_4e02_right,
BIN_OP_EQ_uxn_opcodes_h_l3173_c11_4e02_return_output);

-- l16_MUX_uxn_opcodes_h_l3173_c7_11b4
l16_MUX_uxn_opcodes_h_l3173_c7_11b4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l3173_c7_11b4_cond,
l16_MUX_uxn_opcodes_h_l3173_c7_11b4_iftrue,
l16_MUX_uxn_opcodes_h_l3173_c7_11b4_iffalse,
l16_MUX_uxn_opcodes_h_l3173_c7_11b4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3173_c7_11b4
result_is_sp_shift_MUX_uxn_opcodes_h_l3173_c7_11b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3173_c7_11b4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3173_c7_11b4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3173_c7_11b4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3173_c7_11b4_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3173_c7_11b4
result_stack_value_MUX_uxn_opcodes_h_l3173_c7_11b4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3173_c7_11b4_cond,
result_stack_value_MUX_uxn_opcodes_h_l3173_c7_11b4_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3173_c7_11b4_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3173_c7_11b4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3173_c7_11b4
result_is_stack_write_MUX_uxn_opcodes_h_l3173_c7_11b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3173_c7_11b4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3173_c7_11b4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3173_c7_11b4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3173_c7_11b4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3173_c7_11b4
result_sp_relative_shift_MUX_uxn_opcodes_h_l3173_c7_11b4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3173_c7_11b4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3173_c7_11b4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3173_c7_11b4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3173_c7_11b4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3173_c7_11b4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3173_c7_11b4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3173_c7_11b4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3173_c7_11b4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3173_c7_11b4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3173_c7_11b4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3173_c7_11b4
result_is_opc_done_MUX_uxn_opcodes_h_l3173_c7_11b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3173_c7_11b4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3173_c7_11b4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3173_c7_11b4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3173_c7_11b4_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l3173_c7_11b4
result_is_stack_read_MUX_uxn_opcodes_h_l3173_c7_11b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l3173_c7_11b4_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l3173_c7_11b4_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l3173_c7_11b4_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l3173_c7_11b4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3178_c11_ff07
BIN_OP_EQ_uxn_opcodes_h_l3178_c11_ff07 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3178_c11_ff07_left,
BIN_OP_EQ_uxn_opcodes_h_l3178_c11_ff07_right,
BIN_OP_EQ_uxn_opcodes_h_l3178_c11_ff07_return_output);

-- l16_MUX_uxn_opcodes_h_l3178_c7_eeb0
l16_MUX_uxn_opcodes_h_l3178_c7_eeb0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l3178_c7_eeb0_cond,
l16_MUX_uxn_opcodes_h_l3178_c7_eeb0_iftrue,
l16_MUX_uxn_opcodes_h_l3178_c7_eeb0_iffalse,
l16_MUX_uxn_opcodes_h_l3178_c7_eeb0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3178_c7_eeb0
result_is_sp_shift_MUX_uxn_opcodes_h_l3178_c7_eeb0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3178_c7_eeb0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3178_c7_eeb0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3178_c7_eeb0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3178_c7_eeb0_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3178_c7_eeb0
result_stack_value_MUX_uxn_opcodes_h_l3178_c7_eeb0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3178_c7_eeb0_cond,
result_stack_value_MUX_uxn_opcodes_h_l3178_c7_eeb0_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3178_c7_eeb0_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3178_c7_eeb0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3178_c7_eeb0
result_is_stack_write_MUX_uxn_opcodes_h_l3178_c7_eeb0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3178_c7_eeb0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3178_c7_eeb0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3178_c7_eeb0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3178_c7_eeb0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3178_c7_eeb0
result_sp_relative_shift_MUX_uxn_opcodes_h_l3178_c7_eeb0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3178_c7_eeb0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3178_c7_eeb0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3178_c7_eeb0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3178_c7_eeb0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3178_c7_eeb0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3178_c7_eeb0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3178_c7_eeb0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3178_c7_eeb0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3178_c7_eeb0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3178_c7_eeb0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3178_c7_eeb0
result_is_opc_done_MUX_uxn_opcodes_h_l3178_c7_eeb0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3178_c7_eeb0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3178_c7_eeb0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3178_c7_eeb0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3178_c7_eeb0_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l3178_c7_eeb0
result_is_stack_read_MUX_uxn_opcodes_h_l3178_c7_eeb0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l3178_c7_eeb0_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l3178_c7_eeb0_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l3178_c7_eeb0_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l3178_c7_eeb0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3181_c11_7a66
BIN_OP_EQ_uxn_opcodes_h_l3181_c11_7a66 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3181_c11_7a66_left,
BIN_OP_EQ_uxn_opcodes_h_l3181_c11_7a66_right,
BIN_OP_EQ_uxn_opcodes_h_l3181_c11_7a66_return_output);

-- l16_MUX_uxn_opcodes_h_l3181_c7_557e
l16_MUX_uxn_opcodes_h_l3181_c7_557e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l3181_c7_557e_cond,
l16_MUX_uxn_opcodes_h_l3181_c7_557e_iftrue,
l16_MUX_uxn_opcodes_h_l3181_c7_557e_iffalse,
l16_MUX_uxn_opcodes_h_l3181_c7_557e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3181_c7_557e
result_is_sp_shift_MUX_uxn_opcodes_h_l3181_c7_557e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3181_c7_557e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3181_c7_557e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3181_c7_557e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3181_c7_557e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3181_c7_557e
result_stack_value_MUX_uxn_opcodes_h_l3181_c7_557e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3181_c7_557e_cond,
result_stack_value_MUX_uxn_opcodes_h_l3181_c7_557e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3181_c7_557e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3181_c7_557e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3181_c7_557e
result_is_stack_write_MUX_uxn_opcodes_h_l3181_c7_557e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3181_c7_557e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3181_c7_557e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3181_c7_557e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3181_c7_557e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3181_c7_557e
result_sp_relative_shift_MUX_uxn_opcodes_h_l3181_c7_557e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3181_c7_557e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3181_c7_557e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3181_c7_557e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3181_c7_557e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3181_c7_557e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3181_c7_557e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3181_c7_557e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3181_c7_557e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3181_c7_557e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3181_c7_557e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3181_c7_557e
result_is_opc_done_MUX_uxn_opcodes_h_l3181_c7_557e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3181_c7_557e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3181_c7_557e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3181_c7_557e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3181_c7_557e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l3181_c7_557e
result_is_stack_read_MUX_uxn_opcodes_h_l3181_c7_557e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l3181_c7_557e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l3181_c7_557e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l3181_c7_557e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l3181_c7_557e_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l3182_c3_1d15
BIN_OP_OR_uxn_opcodes_h_l3182_c3_1d15 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l3182_c3_1d15_left,
BIN_OP_OR_uxn_opcodes_h_l3182_c3_1d15_right,
BIN_OP_OR_uxn_opcodes_h_l3182_c3_1d15_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l3185_c32_0b85
BIN_OP_AND_uxn_opcodes_h_l3185_c32_0b85 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l3185_c32_0b85_left,
BIN_OP_AND_uxn_opcodes_h_l3185_c32_0b85_right,
BIN_OP_AND_uxn_opcodes_h_l3185_c32_0b85_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l3185_c32_3b45
BIN_OP_GT_uxn_opcodes_h_l3185_c32_3b45 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l3185_c32_3b45_left,
BIN_OP_GT_uxn_opcodes_h_l3185_c32_3b45_right,
BIN_OP_GT_uxn_opcodes_h_l3185_c32_3b45_return_output);

-- MUX_uxn_opcodes_h_l3185_c32_2b70
MUX_uxn_opcodes_h_l3185_c32_2b70 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l3185_c32_2b70_cond,
MUX_uxn_opcodes_h_l3185_c32_2b70_iftrue,
MUX_uxn_opcodes_h_l3185_c32_2b70_iffalse,
MUX_uxn_opcodes_h_l3185_c32_2b70_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3187_c11_c7a8
BIN_OP_EQ_uxn_opcodes_h_l3187_c11_c7a8 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3187_c11_c7a8_left,
BIN_OP_EQ_uxn_opcodes_h_l3187_c11_c7a8_right,
BIN_OP_EQ_uxn_opcodes_h_l3187_c11_c7a8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3187_c7_dba2
result_is_sp_shift_MUX_uxn_opcodes_h_l3187_c7_dba2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3187_c7_dba2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3187_c7_dba2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3187_c7_dba2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3187_c7_dba2_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3187_c7_dba2
result_stack_value_MUX_uxn_opcodes_h_l3187_c7_dba2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3187_c7_dba2_cond,
result_stack_value_MUX_uxn_opcodes_h_l3187_c7_dba2_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3187_c7_dba2_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3187_c7_dba2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3187_c7_dba2
result_is_stack_write_MUX_uxn_opcodes_h_l3187_c7_dba2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3187_c7_dba2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3187_c7_dba2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3187_c7_dba2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3187_c7_dba2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3187_c7_dba2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3187_c7_dba2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3187_c7_dba2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3187_c7_dba2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3187_c7_dba2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3187_c7_dba2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3187_c7_dba2
result_is_opc_done_MUX_uxn_opcodes_h_l3187_c7_dba2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3187_c7_dba2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3187_c7_dba2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3187_c7_dba2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3187_c7_dba2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3193_c11_9474
BIN_OP_EQ_uxn_opcodes_h_l3193_c11_9474 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3193_c11_9474_left,
BIN_OP_EQ_uxn_opcodes_h_l3193_c11_9474_right,
BIN_OP_EQ_uxn_opcodes_h_l3193_c11_9474_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3193_c7_e961
result_stack_value_MUX_uxn_opcodes_h_l3193_c7_e961 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3193_c7_e961_cond,
result_stack_value_MUX_uxn_opcodes_h_l3193_c7_e961_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3193_c7_e961_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3193_c7_e961_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3193_c7_e961
result_is_opc_done_MUX_uxn_opcodes_h_l3193_c7_e961 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3193_c7_e961_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3193_c7_e961_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3193_c7_e961_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3193_c7_e961_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3193_c7_e961
result_is_stack_write_MUX_uxn_opcodes_h_l3193_c7_e961 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3193_c7_e961_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3193_c7_e961_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3193_c7_e961_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3193_c7_e961_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3193_c7_e961
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3193_c7_e961 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3193_c7_e961_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3193_c7_e961_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3193_c7_e961_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3193_c7_e961_return_output);

-- CONST_SR_8_uxn_opcodes_h_l3195_c34_6e27
CONST_SR_8_uxn_opcodes_h_l3195_c34_6e27 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l3195_c34_6e27_x,
CONST_SR_8_uxn_opcodes_h_l3195_c34_6e27_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3197_c11_6d32
BIN_OP_EQ_uxn_opcodes_h_l3197_c11_6d32 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3197_c11_6d32_left,
BIN_OP_EQ_uxn_opcodes_h_l3197_c11_6d32_right,
BIN_OP_EQ_uxn_opcodes_h_l3197_c11_6d32_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3197_c7_d1e9
result_stack_value_MUX_uxn_opcodes_h_l3197_c7_d1e9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3197_c7_d1e9_cond,
result_stack_value_MUX_uxn_opcodes_h_l3197_c7_d1e9_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3197_c7_d1e9_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3197_c7_d1e9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3197_c7_d1e9
result_is_opc_done_MUX_uxn_opcodes_h_l3197_c7_d1e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3197_c7_d1e9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3197_c7_d1e9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3197_c7_d1e9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3197_c7_d1e9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3197_c7_d1e9
result_is_stack_write_MUX_uxn_opcodes_h_l3197_c7_d1e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3197_c7_d1e9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3197_c7_d1e9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3197_c7_d1e9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3197_c7_d1e9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3197_c7_d1e9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3197_c7_d1e9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3197_c7_d1e9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3197_c7_d1e9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3197_c7_d1e9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3197_c7_d1e9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3201_c11_6c26
BIN_OP_EQ_uxn_opcodes_h_l3201_c11_6c26 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3201_c11_6c26_left,
BIN_OP_EQ_uxn_opcodes_h_l3201_c11_6c26_right,
BIN_OP_EQ_uxn_opcodes_h_l3201_c11_6c26_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3201_c7_362d
result_stack_value_MUX_uxn_opcodes_h_l3201_c7_362d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3201_c7_362d_cond,
result_stack_value_MUX_uxn_opcodes_h_l3201_c7_362d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3201_c7_362d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3201_c7_362d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3201_c7_362d
result_is_opc_done_MUX_uxn_opcodes_h_l3201_c7_362d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3201_c7_362d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3201_c7_362d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3201_c7_362d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3201_c7_362d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3201_c7_362d
result_is_stack_write_MUX_uxn_opcodes_h_l3201_c7_362d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3201_c7_362d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3201_c7_362d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3201_c7_362d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3201_c7_362d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3201_c7_362d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3201_c7_362d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3201_c7_362d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3201_c7_362d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3201_c7_362d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3201_c7_362d_return_output);

-- CONST_SR_8_uxn_opcodes_h_l3203_c34_e600
CONST_SR_8_uxn_opcodes_h_l3203_c34_e600 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l3203_c34_e600_x,
CONST_SR_8_uxn_opcodes_h_l3203_c34_e600_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3205_c11_d10d
BIN_OP_EQ_uxn_opcodes_h_l3205_c11_d10d : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3205_c11_d10d_left,
BIN_OP_EQ_uxn_opcodes_h_l3205_c11_d10d_right,
BIN_OP_EQ_uxn_opcodes_h_l3205_c11_d10d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3205_c7_e28a
result_stack_value_MUX_uxn_opcodes_h_l3205_c7_e28a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3205_c7_e28a_cond,
result_stack_value_MUX_uxn_opcodes_h_l3205_c7_e28a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3205_c7_e28a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3205_c7_e28a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3205_c7_e28a
result_is_opc_done_MUX_uxn_opcodes_h_l3205_c7_e28a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3205_c7_e28a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3205_c7_e28a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3205_c7_e28a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3205_c7_e28a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3205_c7_e28a
result_is_stack_write_MUX_uxn_opcodes_h_l3205_c7_e28a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3205_c7_e28a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3205_c7_e28a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3205_c7_e28a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3205_c7_e28a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3205_c7_e28a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3205_c7_e28a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3205_c7_e28a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3205_c7_e28a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3205_c7_e28a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3205_c7_e28a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3209_c11_499e
BIN_OP_EQ_uxn_opcodes_h_l3209_c11_499e : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3209_c11_499e_left,
BIN_OP_EQ_uxn_opcodes_h_l3209_c11_499e_right,
BIN_OP_EQ_uxn_opcodes_h_l3209_c11_499e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3209_c7_5101
result_stack_value_MUX_uxn_opcodes_h_l3209_c7_5101 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3209_c7_5101_cond,
result_stack_value_MUX_uxn_opcodes_h_l3209_c7_5101_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3209_c7_5101_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3209_c7_5101_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3209_c7_5101
result_is_opc_done_MUX_uxn_opcodes_h_l3209_c7_5101 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3209_c7_5101_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3209_c7_5101_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3209_c7_5101_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3209_c7_5101_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3209_c7_5101
result_is_stack_write_MUX_uxn_opcodes_h_l3209_c7_5101 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3209_c7_5101_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3209_c7_5101_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3209_c7_5101_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3209_c7_5101_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3209_c7_5101
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3209_c7_5101 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3209_c7_5101_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3209_c7_5101_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3209_c7_5101_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3209_c7_5101_return_output);

-- CONST_SR_8_uxn_opcodes_h_l3211_c34_ba7f
CONST_SR_8_uxn_opcodes_h_l3211_c34_ba7f : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l3211_c34_ba7f_x,
CONST_SR_8_uxn_opcodes_h_l3211_c34_ba7f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3213_c11_627a
BIN_OP_EQ_uxn_opcodes_h_l3213_c11_627a : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3213_c11_627a_left,
BIN_OP_EQ_uxn_opcodes_h_l3213_c11_627a_right,
BIN_OP_EQ_uxn_opcodes_h_l3213_c11_627a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3213_c7_378a
result_is_opc_done_MUX_uxn_opcodes_h_l3213_c7_378a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3213_c7_378a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3213_c7_378a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3213_c7_378a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3213_c7_378a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3213_c7_378a
result_is_stack_write_MUX_uxn_opcodes_h_l3213_c7_378a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3213_c7_378a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3213_c7_378a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3213_c7_378a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3213_c7_378a_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l3145_l3175_l3160_DUPLICATE_73da
CONST_SL_8_uint16_t_uxn_opcodes_h_l3145_l3175_l3160_DUPLICATE_73da : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l3145_l3175_l3160_DUPLICATE_73da_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l3145_l3175_l3160_DUPLICATE_73da_return_output);



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
 l16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l3134_c6_7f67_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3134_c1_8829_return_output,
 n16_MUX_uxn_opcodes_h_l3134_c2_4d74_return_output,
 t16_MUX_uxn_opcodes_h_l3134_c2_4d74_return_output,
 l16_MUX_uxn_opcodes_h_l3134_c2_4d74_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3134_c2_4d74_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3134_c2_4d74_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3134_c2_4d74_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3134_c2_4d74_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3134_c2_4d74_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3134_c2_4d74_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l3134_c2_4d74_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3140_c11_e1f9_return_output,
 n16_MUX_uxn_opcodes_h_l3140_c7_c7d4_return_output,
 t16_MUX_uxn_opcodes_h_l3140_c7_c7d4_return_output,
 l16_MUX_uxn_opcodes_h_l3140_c7_c7d4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3140_c7_c7d4_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3140_c7_c7d4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3140_c7_c7d4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3140_c7_c7d4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3140_c7_c7d4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3140_c7_c7d4_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l3140_c7_c7d4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3143_c11_7de5_return_output,
 n16_MUX_uxn_opcodes_h_l3143_c7_d22e_return_output,
 t16_MUX_uxn_opcodes_h_l3143_c7_d22e_return_output,
 l16_MUX_uxn_opcodes_h_l3143_c7_d22e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3143_c7_d22e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3143_c7_d22e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3143_c7_d22e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3143_c7_d22e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3143_c7_d22e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3143_c7_d22e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l3143_c7_d22e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3148_c11_6f95_return_output,
 n16_MUX_uxn_opcodes_h_l3148_c7_15d3_return_output,
 t16_MUX_uxn_opcodes_h_l3148_c7_15d3_return_output,
 l16_MUX_uxn_opcodes_h_l3148_c7_15d3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3148_c7_15d3_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3148_c7_15d3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3148_c7_15d3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3148_c7_15d3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3148_c7_15d3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3148_c7_15d3_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l3148_c7_15d3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3151_c11_0191_return_output,
 n16_MUX_uxn_opcodes_h_l3151_c7_b003_return_output,
 t16_MUX_uxn_opcodes_h_l3151_c7_b003_return_output,
 l16_MUX_uxn_opcodes_h_l3151_c7_b003_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3151_c7_b003_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3151_c7_b003_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3151_c7_b003_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3151_c7_b003_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3151_c7_b003_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3151_c7_b003_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l3151_c7_b003_return_output,
 BIN_OP_OR_uxn_opcodes_h_l3152_c3_0bbe_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3155_c11_8547_return_output,
 n16_MUX_uxn_opcodes_h_l3155_c7_35c4_return_output,
 l16_MUX_uxn_opcodes_h_l3155_c7_35c4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3155_c7_35c4_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3155_c7_35c4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3155_c7_35c4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3155_c7_35c4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3155_c7_35c4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3155_c7_35c4_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l3155_c7_35c4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3158_c11_5e9b_return_output,
 n16_MUX_uxn_opcodes_h_l3158_c7_b019_return_output,
 l16_MUX_uxn_opcodes_h_l3158_c7_b019_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3158_c7_b019_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3158_c7_b019_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3158_c7_b019_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3158_c7_b019_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3158_c7_b019_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3158_c7_b019_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l3158_c7_b019_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3163_c11_141a_return_output,
 n16_MUX_uxn_opcodes_h_l3163_c7_4fee_return_output,
 l16_MUX_uxn_opcodes_h_l3163_c7_4fee_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3163_c7_4fee_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3163_c7_4fee_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3163_c7_4fee_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3163_c7_4fee_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3163_c7_4fee_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3163_c7_4fee_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l3163_c7_4fee_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3166_c11_d7b6_return_output,
 n16_MUX_uxn_opcodes_h_l3166_c7_d0bf_return_output,
 l16_MUX_uxn_opcodes_h_l3166_c7_d0bf_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3166_c7_d0bf_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3166_c7_d0bf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3166_c7_d0bf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3166_c7_d0bf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3166_c7_d0bf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3166_c7_d0bf_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l3166_c7_d0bf_return_output,
 BIN_OP_OR_uxn_opcodes_h_l3167_c3_359d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3170_c11_cf37_return_output,
 l16_MUX_uxn_opcodes_h_l3170_c7_68c6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3170_c7_68c6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3170_c7_68c6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3170_c7_68c6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3170_c7_68c6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3170_c7_68c6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3170_c7_68c6_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l3170_c7_68c6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3173_c11_4e02_return_output,
 l16_MUX_uxn_opcodes_h_l3173_c7_11b4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3173_c7_11b4_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3173_c7_11b4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3173_c7_11b4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3173_c7_11b4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3173_c7_11b4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3173_c7_11b4_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l3173_c7_11b4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3178_c11_ff07_return_output,
 l16_MUX_uxn_opcodes_h_l3178_c7_eeb0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3178_c7_eeb0_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3178_c7_eeb0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3178_c7_eeb0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3178_c7_eeb0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3178_c7_eeb0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3178_c7_eeb0_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l3178_c7_eeb0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3181_c11_7a66_return_output,
 l16_MUX_uxn_opcodes_h_l3181_c7_557e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3181_c7_557e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3181_c7_557e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3181_c7_557e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3181_c7_557e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3181_c7_557e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3181_c7_557e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l3181_c7_557e_return_output,
 BIN_OP_OR_uxn_opcodes_h_l3182_c3_1d15_return_output,
 BIN_OP_AND_uxn_opcodes_h_l3185_c32_0b85_return_output,
 BIN_OP_GT_uxn_opcodes_h_l3185_c32_3b45_return_output,
 MUX_uxn_opcodes_h_l3185_c32_2b70_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3187_c11_c7a8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3187_c7_dba2_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3187_c7_dba2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3187_c7_dba2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3187_c7_dba2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3187_c7_dba2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3193_c11_9474_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3193_c7_e961_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3193_c7_e961_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3193_c7_e961_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3193_c7_e961_return_output,
 CONST_SR_8_uxn_opcodes_h_l3195_c34_6e27_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3197_c11_6d32_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3197_c7_d1e9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3197_c7_d1e9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3197_c7_d1e9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3197_c7_d1e9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3201_c11_6c26_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3201_c7_362d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3201_c7_362d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3201_c7_362d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3201_c7_362d_return_output,
 CONST_SR_8_uxn_opcodes_h_l3203_c34_e600_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3205_c11_d10d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3205_c7_e28a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3205_c7_e28a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3205_c7_e28a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3205_c7_e28a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3209_c11_499e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3209_c7_5101_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3209_c7_5101_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3209_c7_5101_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3209_c7_5101_return_output,
 CONST_SR_8_uxn_opcodes_h_l3211_c34_ba7f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3213_c11_627a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3213_c7_378a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3213_c7_378a_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l3145_l3175_l3160_DUPLICATE_73da_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3134_c6_7f67_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3134_c6_7f67_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3134_c6_7f67_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3134_c1_8829_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3134_c1_8829_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3134_c1_8829_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3134_c1_8829_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3134_c2_4d74_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3134_c2_4d74_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3140_c7_c7d4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3134_c2_4d74_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3134_c2_4d74_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3134_c2_4d74_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3134_c2_4d74_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3140_c7_c7d4_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3134_c2_4d74_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3134_c2_4d74_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3134_c2_4d74_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3134_c2_4d74_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3140_c7_c7d4_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3134_c2_4d74_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3134_c2_4d74_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3134_c2_4d74_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3134_c2_4d74_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3140_c7_c7d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3134_c2_4d74_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3134_c2_4d74_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3134_c2_4d74_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3134_c2_4d74_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3140_c7_c7d4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3134_c2_4d74_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3134_c2_4d74_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3134_c2_4d74_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3134_c2_4d74_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3140_c7_c7d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3134_c2_4d74_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3134_c2_4d74_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3134_c2_4d74_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3134_c2_4d74_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3140_c7_c7d4_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3134_c2_4d74_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3134_c2_4d74_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3134_c2_4d74_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3137_c3_b7b0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3134_c2_4d74_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3140_c7_c7d4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3134_c2_4d74_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3134_c2_4d74_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3134_c2_4d74_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3134_c2_4d74_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3140_c7_c7d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3134_c2_4d74_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3134_c2_4d74_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3134_c2_4d74_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3134_c2_4d74_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3140_c7_c7d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3134_c2_4d74_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3134_c2_4d74_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l3135_c3_d843_uxn_opcodes_h_l3135_c3_d843_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3140_c11_e1f9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3140_c11_e1f9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3140_c11_e1f9_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3140_c7_c7d4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3140_c7_c7d4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3143_c7_d22e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3140_c7_c7d4_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3140_c7_c7d4_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3140_c7_c7d4_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3143_c7_d22e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3140_c7_c7d4_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3140_c7_c7d4_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3140_c7_c7d4_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3143_c7_d22e_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3140_c7_c7d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3140_c7_c7d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3140_c7_c7d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3143_c7_d22e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3140_c7_c7d4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3140_c7_c7d4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3140_c7_c7d4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3143_c7_d22e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3140_c7_c7d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3140_c7_c7d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3140_c7_c7d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3143_c7_d22e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3140_c7_c7d4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3140_c7_c7d4_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3140_c7_c7d4_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3143_c7_d22e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3140_c7_c7d4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3140_c7_c7d4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3141_c3_b1ee : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3140_c7_c7d4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3143_c7_d22e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3140_c7_c7d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3140_c7_c7d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3140_c7_c7d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3143_c7_d22e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3140_c7_c7d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3140_c7_c7d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3140_c7_c7d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3143_c7_d22e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3140_c7_c7d4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3143_c11_7de5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3143_c11_7de5_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3143_c11_7de5_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3143_c7_d22e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3143_c7_d22e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3148_c7_15d3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3143_c7_d22e_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3143_c7_d22e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3143_c7_d22e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3148_c7_15d3_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3143_c7_d22e_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3143_c7_d22e_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3143_c7_d22e_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3148_c7_15d3_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3143_c7_d22e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3143_c7_d22e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3143_c7_d22e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3148_c7_15d3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3143_c7_d22e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3143_c7_d22e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3143_c7_d22e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3148_c7_15d3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3143_c7_d22e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3143_c7_d22e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3143_c7_d22e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3148_c7_15d3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3143_c7_d22e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3143_c7_d22e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3143_c7_d22e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3148_c7_15d3_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3143_c7_d22e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3143_c7_d22e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3146_c3_d4ea : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3143_c7_d22e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3148_c7_15d3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3143_c7_d22e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3143_c7_d22e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3143_c7_d22e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3148_c7_15d3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3143_c7_d22e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3143_c7_d22e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3143_c7_d22e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3148_c7_15d3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3143_c7_d22e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3148_c11_6f95_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3148_c11_6f95_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3148_c11_6f95_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3148_c7_15d3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3148_c7_15d3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3151_c7_b003_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3148_c7_15d3_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3148_c7_15d3_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3148_c7_15d3_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3151_c7_b003_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3148_c7_15d3_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3148_c7_15d3_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3148_c7_15d3_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3151_c7_b003_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3148_c7_15d3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3148_c7_15d3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3148_c7_15d3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3151_c7_b003_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3148_c7_15d3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3148_c7_15d3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3148_c7_15d3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3151_c7_b003_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3148_c7_15d3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3148_c7_15d3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3148_c7_15d3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3151_c7_b003_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3148_c7_15d3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3148_c7_15d3_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3148_c7_15d3_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3151_c7_b003_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3148_c7_15d3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3148_c7_15d3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3149_c3_2afe : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3148_c7_15d3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3151_c7_b003_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3148_c7_15d3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3148_c7_15d3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3148_c7_15d3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3151_c7_b003_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3148_c7_15d3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3148_c7_15d3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3148_c7_15d3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3151_c7_b003_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3148_c7_15d3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3151_c11_0191_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3151_c11_0191_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3151_c11_0191_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3151_c7_b003_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3151_c7_b003_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3155_c7_35c4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3151_c7_b003_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3151_c7_b003_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3151_c7_b003_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3151_c7_b003_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3151_c7_b003_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3151_c7_b003_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3155_c7_35c4_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3151_c7_b003_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3151_c7_b003_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3151_c7_b003_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3155_c7_35c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3151_c7_b003_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3151_c7_b003_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3151_c7_b003_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3155_c7_35c4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3151_c7_b003_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3151_c7_b003_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3151_c7_b003_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3155_c7_35c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3151_c7_b003_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3151_c7_b003_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3151_c7_b003_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3155_c7_35c4_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3151_c7_b003_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3151_c7_b003_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3153_c3_ae6f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3151_c7_b003_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3155_c7_35c4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3151_c7_b003_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3151_c7_b003_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3151_c7_b003_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3155_c7_35c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3151_c7_b003_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3151_c7_b003_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3151_c7_b003_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3155_c7_35c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3151_c7_b003_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l3152_c3_0bbe_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l3152_c3_0bbe_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l3152_c3_0bbe_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3155_c11_8547_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3155_c11_8547_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3155_c11_8547_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3155_c7_35c4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3155_c7_35c4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3158_c7_b019_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3155_c7_35c4_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3155_c7_35c4_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3155_c7_35c4_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3158_c7_b019_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3155_c7_35c4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3155_c7_35c4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3155_c7_35c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3158_c7_b019_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3155_c7_35c4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3155_c7_35c4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3155_c7_35c4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3158_c7_b019_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3155_c7_35c4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3155_c7_35c4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3155_c7_35c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3158_c7_b019_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3155_c7_35c4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3155_c7_35c4_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3155_c7_35c4_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3158_c7_b019_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3155_c7_35c4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3155_c7_35c4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3156_c3_d545 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3155_c7_35c4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3158_c7_b019_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3155_c7_35c4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3155_c7_35c4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3155_c7_35c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3158_c7_b019_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3155_c7_35c4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3155_c7_35c4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3155_c7_35c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3158_c7_b019_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3155_c7_35c4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3158_c11_5e9b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3158_c11_5e9b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3158_c11_5e9b_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3158_c7_b019_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3158_c7_b019_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3163_c7_4fee_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3158_c7_b019_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3158_c7_b019_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3158_c7_b019_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3163_c7_4fee_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3158_c7_b019_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3158_c7_b019_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3158_c7_b019_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3163_c7_4fee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3158_c7_b019_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3158_c7_b019_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3158_c7_b019_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3163_c7_4fee_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3158_c7_b019_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3158_c7_b019_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3158_c7_b019_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3163_c7_4fee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3158_c7_b019_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3158_c7_b019_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3158_c7_b019_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3163_c7_4fee_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3158_c7_b019_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3158_c7_b019_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3161_c3_ac95 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3158_c7_b019_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3163_c7_4fee_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3158_c7_b019_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3158_c7_b019_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3158_c7_b019_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3163_c7_4fee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3158_c7_b019_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3158_c7_b019_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3158_c7_b019_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3163_c7_4fee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3158_c7_b019_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3163_c11_141a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3163_c11_141a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3163_c11_141a_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3163_c7_4fee_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3163_c7_4fee_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3166_c7_d0bf_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3163_c7_4fee_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3163_c7_4fee_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3163_c7_4fee_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3166_c7_d0bf_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3163_c7_4fee_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3163_c7_4fee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3163_c7_4fee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3166_c7_d0bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3163_c7_4fee_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3163_c7_4fee_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3163_c7_4fee_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3166_c7_d0bf_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3163_c7_4fee_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3163_c7_4fee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3163_c7_4fee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3166_c7_d0bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3163_c7_4fee_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3163_c7_4fee_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3163_c7_4fee_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3166_c7_d0bf_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3163_c7_4fee_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3163_c7_4fee_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3164_c3_fa65 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3163_c7_4fee_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3166_c7_d0bf_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3163_c7_4fee_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3163_c7_4fee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3163_c7_4fee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3166_c7_d0bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3163_c7_4fee_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3163_c7_4fee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3163_c7_4fee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3166_c7_d0bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3163_c7_4fee_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3166_c11_d7b6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3166_c11_d7b6_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3166_c11_d7b6_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3166_c7_d0bf_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3166_c7_d0bf_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3166_c7_d0bf_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3166_c7_d0bf_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3166_c7_d0bf_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3170_c7_68c6_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3166_c7_d0bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3166_c7_d0bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3166_c7_d0bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3170_c7_68c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3166_c7_d0bf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3166_c7_d0bf_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3166_c7_d0bf_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3170_c7_68c6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3166_c7_d0bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3166_c7_d0bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3166_c7_d0bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3170_c7_68c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3166_c7_d0bf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3166_c7_d0bf_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3166_c7_d0bf_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3170_c7_68c6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3166_c7_d0bf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3166_c7_d0bf_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3168_c3_22e7 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3166_c7_d0bf_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3170_c7_68c6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3166_c7_d0bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3166_c7_d0bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3166_c7_d0bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3170_c7_68c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3166_c7_d0bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3166_c7_d0bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3166_c7_d0bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3170_c7_68c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3166_c7_d0bf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l3167_c3_359d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l3167_c3_359d_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l3167_c3_359d_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3170_c11_cf37_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3170_c11_cf37_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3170_c11_cf37_return_output : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3170_c7_68c6_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3170_c7_68c6_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3173_c7_11b4_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3170_c7_68c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3170_c7_68c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3170_c7_68c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3173_c7_11b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3170_c7_68c6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3170_c7_68c6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3170_c7_68c6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3173_c7_11b4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3170_c7_68c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3170_c7_68c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3170_c7_68c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3173_c7_11b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3170_c7_68c6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3170_c7_68c6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3170_c7_68c6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3173_c7_11b4_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3170_c7_68c6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3170_c7_68c6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3171_c3_0427 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3170_c7_68c6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3173_c7_11b4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3170_c7_68c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3170_c7_68c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3170_c7_68c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3173_c7_11b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3170_c7_68c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3170_c7_68c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3170_c7_68c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3173_c7_11b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3170_c7_68c6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3173_c11_4e02_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3173_c11_4e02_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3173_c11_4e02_return_output : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3173_c7_11b4_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3173_c7_11b4_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3178_c7_eeb0_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3173_c7_11b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3173_c7_11b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3173_c7_11b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3178_c7_eeb0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3173_c7_11b4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3173_c7_11b4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3173_c7_11b4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3178_c7_eeb0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3173_c7_11b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3173_c7_11b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3173_c7_11b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3178_c7_eeb0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3173_c7_11b4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3173_c7_11b4_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3173_c7_11b4_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3178_c7_eeb0_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3173_c7_11b4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3173_c7_11b4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3176_c3_0cbf : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3173_c7_11b4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3178_c7_eeb0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3173_c7_11b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3173_c7_11b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3173_c7_11b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3178_c7_eeb0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3173_c7_11b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3173_c7_11b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3173_c7_11b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3178_c7_eeb0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3173_c7_11b4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3178_c11_ff07_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3178_c11_ff07_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3178_c11_ff07_return_output : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3178_c7_eeb0_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3178_c7_eeb0_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3181_c7_557e_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3178_c7_eeb0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3178_c7_eeb0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3178_c7_eeb0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3181_c7_557e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3178_c7_eeb0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3178_c7_eeb0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3178_c7_eeb0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3181_c7_557e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3178_c7_eeb0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3178_c7_eeb0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3178_c7_eeb0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3181_c7_557e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3178_c7_eeb0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3178_c7_eeb0_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3178_c7_eeb0_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3181_c7_557e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3178_c7_eeb0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3178_c7_eeb0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3179_c3_2c93 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3178_c7_eeb0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3181_c7_557e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3178_c7_eeb0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3178_c7_eeb0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3178_c7_eeb0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3181_c7_557e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3178_c7_eeb0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3178_c7_eeb0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3178_c7_eeb0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3181_c7_557e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3178_c7_eeb0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3181_c11_7a66_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3181_c11_7a66_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3181_c11_7a66_return_output : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3181_c7_557e_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3181_c7_557e_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3181_c7_557e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3181_c7_557e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3181_c7_557e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3187_c7_dba2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3181_c7_557e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3181_c7_557e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3181_c7_557e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3187_c7_dba2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3181_c7_557e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3181_c7_557e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3181_c7_557e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3187_c7_dba2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3181_c7_557e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3181_c7_557e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3181_c7_557e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3181_c7_557e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3181_c7_557e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3181_c7_557e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3187_c7_dba2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3181_c7_557e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3181_c7_557e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3181_c7_557e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3187_c7_dba2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3181_c7_557e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3181_c7_557e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3181_c7_557e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3181_c7_557e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l3182_c3_1d15_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l3182_c3_1d15_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l3182_c3_1d15_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3185_c32_2b70_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3185_c32_2b70_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3185_c32_2b70_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3185_c32_0b85_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3185_c32_0b85_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3185_c32_0b85_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3185_c32_3b45_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3185_c32_3b45_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3185_c32_3b45_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3185_c32_2b70_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3187_c11_c7a8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3187_c11_c7a8_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3187_c11_c7a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3187_c7_dba2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3187_c7_dba2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3187_c7_dba2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3187_c7_dba2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3187_c7_dba2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3193_c7_e961_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3187_c7_dba2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3187_c7_dba2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3187_c7_dba2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3193_c7_e961_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3187_c7_dba2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3187_c7_dba2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3190_c3_7531 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3187_c7_dba2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3193_c7_e961_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3187_c7_dba2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3187_c7_dba2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3187_c7_dba2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3193_c7_e961_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3187_c7_dba2_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3191_c24_4860_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3193_c11_9474_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3193_c11_9474_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3193_c11_9474_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3193_c7_e961_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3193_c7_e961_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3197_c7_d1e9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3193_c7_e961_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3193_c7_e961_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3193_c7_e961_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3197_c7_d1e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3193_c7_e961_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3193_c7_e961_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3193_c7_e961_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3197_c7_d1e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3193_c7_e961_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3193_c7_e961_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3194_c3_8d60 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3193_c7_e961_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3197_c7_d1e9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3193_c7_e961_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l3195_c34_6e27_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l3195_c34_6e27_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3195_c24_7486_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3197_c11_6d32_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3197_c11_6d32_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3197_c11_6d32_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3197_c7_d1e9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3197_c7_d1e9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3201_c7_362d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3197_c7_d1e9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3197_c7_d1e9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3197_c7_d1e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3201_c7_362d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3197_c7_d1e9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3197_c7_d1e9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3197_c7_d1e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3201_c7_362d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3197_c7_d1e9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3197_c7_d1e9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3198_c3_36d7 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3197_c7_d1e9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3201_c7_362d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3197_c7_d1e9_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3199_c24_33a0_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3201_c11_6c26_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3201_c11_6c26_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3201_c11_6c26_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3201_c7_362d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3201_c7_362d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3205_c7_e28a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3201_c7_362d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3201_c7_362d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3201_c7_362d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3205_c7_e28a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3201_c7_362d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3201_c7_362d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3201_c7_362d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3205_c7_e28a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3201_c7_362d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3201_c7_362d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3202_c3_c4bf : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3201_c7_362d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3205_c7_e28a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3201_c7_362d_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l3203_c34_e600_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l3203_c34_e600_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3203_c24_f2bc_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3205_c11_d10d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3205_c11_d10d_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3205_c11_d10d_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3205_c7_e28a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3205_c7_e28a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3209_c7_5101_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3205_c7_e28a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3205_c7_e28a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3205_c7_e28a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3209_c7_5101_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3205_c7_e28a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3205_c7_e28a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3205_c7_e28a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3209_c7_5101_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3205_c7_e28a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3205_c7_e28a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3206_c3_e21a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3205_c7_e28a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3209_c7_5101_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3205_c7_e28a_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3207_c24_1810_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3209_c11_499e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3209_c11_499e_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3209_c11_499e_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3209_c7_5101_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3209_c7_5101_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3209_c7_5101_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3209_c7_5101_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3209_c7_5101_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3213_c7_378a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3209_c7_5101_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3209_c7_5101_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3209_c7_5101_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3213_c7_378a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3209_c7_5101_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3209_c7_5101_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3210_c3_23c1 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3209_c7_5101_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3209_c7_5101_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l3211_c34_ba7f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l3211_c34_ba7f_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3211_c24_208f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3213_c11_627a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3213_c11_627a_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3213_c11_627a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3213_c7_378a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3213_c7_378a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3213_c7_378a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3213_c7_378a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3213_c7_378a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3213_c7_378a_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3166_l3140_l3163_l3187_l3134_l3158_l3155_l3178_l3151_l3173_l3148_l3170_l3143_DUPLICATE_e2b0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3166_l3140_l3163_l3134_l3158_l3181_l3209_l3155_l3178_l3151_l3173_l3148_l3170_l3143_DUPLICATE_9c1c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3166_l3163_l3158_l3155_l3151_l3148_l3143_l3140_l3134_l3213_l3209_l3205_l3201_l3197_l3193_l3181_l3178_l3173_l3170_DUPLICATE_f704_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3166_l3140_l3163_l3134_l3158_l3181_l3155_l3178_l3151_l3173_l3148_l3170_l3143_DUPLICATE_8248_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3166_l3163_l3158_l3155_l3151_l3148_l3143_l3140_l3213_l3209_l3205_l3201_l3197_l3193_l3187_l3181_l3178_l3173_l3170_DUPLICATE_9e04_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3166_l3140_l3163_l3158_l3181_l3155_l3178_l3151_l3173_l3148_l3170_l3143_DUPLICATE_c11d_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l3159_l3152_l3182_l3174_l3167_l3144_DUPLICATE_d1ac_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l3145_l3175_l3160_DUPLICATE_73da_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l3145_l3175_l3160_DUPLICATE_73da_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3181_l3209_DUPLICATE_f313_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l3218_l3130_DUPLICATE_ff30_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_l16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_l16 := l16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3155_c11_8547_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3213_c7_378a_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3193_c11_9474_right := to_unsigned(14, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3141_c3_b1ee := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3140_c7_c7d4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3141_c3_b1ee;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3197_c11_6d32_right := to_unsigned(15, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3161_c3_ac95 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3158_c7_b019_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3161_c3_ac95;
     VAR_MUX_uxn_opcodes_h_l3185_c32_2b70_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3137_c3_b7b0 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3134_c2_4d74_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3137_c3_b7b0;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3134_c1_8829_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3158_c11_5e9b_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3209_c11_499e_right := to_unsigned(18, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3151_c11_0191_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3202_c3_c4bf := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3201_c7_362d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3202_c3_c4bf;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3134_c2_4d74_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3149_c3_2afe := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3148_c7_15d3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3149_c3_2afe;
     VAR_MUX_uxn_opcodes_h_l3185_c32_2b70_iftrue := signed(std_logic_vector(resize(to_unsigned(6, 3), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3143_c11_7de5_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3206_c3_e21a := resize(to_unsigned(5, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3205_c7_e28a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3206_c3_e21a;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3156_c3_d545 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3155_c7_35c4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3156_c3_d545;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3179_c3_2c93 := resize(to_unsigned(5, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3178_c7_eeb0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3179_c3_2c93;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3176_c3_0cbf := resize(to_unsigned(5, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3173_c7_11b4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3176_c3_0cbf;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3201_c11_6c26_right := to_unsigned(16, 5);
     VAR_BIN_OP_GT_uxn_opcodes_h_l3185_c32_3b45_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3213_c11_627a_right := to_unsigned(19, 5);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3146_c3_d4ea := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3143_c7_d22e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3146_c3_d4ea;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3181_c11_7a66_right := to_unsigned(12, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3148_c11_6f95_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3170_c11_cf37_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3187_c11_c7a8_right := to_unsigned(13, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3187_c7_dba2_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3181_c7_557e_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3198_c3_36d7 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3197_c7_d1e9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3198_c3_36d7;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3168_c3_22e7 := resize(to_unsigned(6, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3166_c7_d0bf_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3168_c3_22e7;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3213_c7_378a_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3181_c7_557e_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3210_c3_23c1 := resize(to_unsigned(6, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3209_c7_5101_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3210_c3_23c1;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3134_c2_4d74_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3194_c3_8d60 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3193_c7_e961_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3194_c3_8d60;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3134_c6_7f67_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3166_c11_d7b6_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3171_c3_0427 := resize(to_unsigned(6, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3170_c7_68c6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3171_c3_0427;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3173_c11_4e02_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3163_c11_141a_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3140_c11_e1f9_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3190_c3_7531 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3187_c7_dba2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3190_c3_7531;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3187_c7_dba2_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3205_c11_d10d_right := to_unsigned(17, 5);
     VAR_BIN_OP_AND_uxn_opcodes_h_l3185_c32_0b85_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3178_c11_ff07_right := to_unsigned(11, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3153_c3_ae6f := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3151_c7_b003_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3153_c3_ae6f;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3164_c3_fa65 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3163_c7_4fee_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3164_c3_fa65;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3134_c1_8829_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l3185_c32_0b85_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l3182_c3_1d15_left := l16;
     VAR_CONST_SR_8_uxn_opcodes_h_l3195_c34_6e27_x := l16;
     VAR_l16_MUX_uxn_opcodes_h_l3134_c2_4d74_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l3140_c7_c7d4_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l3143_c7_d22e_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l3148_c7_15d3_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l3151_c7_b003_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l3155_c7_35c4_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l3158_c7_b019_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l3163_c7_4fee_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l3166_c7_d0bf_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l3170_c7_68c6_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l3178_c7_eeb0_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l3181_c7_557e_iffalse := l16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l3167_c3_359d_left := n16;
     VAR_CONST_SR_8_uxn_opcodes_h_l3211_c34_ba7f_x := n16;
     VAR_n16_MUX_uxn_opcodes_h_l3134_c2_4d74_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l3140_c7_c7d4_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l3143_c7_d22e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l3148_c7_15d3_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l3151_c7_b003_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l3155_c7_35c4_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l3163_c7_4fee_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l3166_c7_d0bf_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3134_c6_7f67_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3140_c11_e1f9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3143_c11_7de5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3148_c11_6f95_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3151_c11_0191_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3155_c11_8547_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3158_c11_5e9b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3163_c11_141a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3166_c11_d7b6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3170_c11_cf37_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3173_c11_4e02_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3178_c11_ff07_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3181_c11_7a66_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3187_c11_c7a8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3193_c11_9474_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3197_c11_6d32_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3201_c11_6c26_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3205_c11_d10d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3209_c11_499e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3213_c11_627a_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l3152_c3_0bbe_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l3203_c34_e600_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l3134_c2_4d74_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l3140_c7_c7d4_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l3148_c7_15d3_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l3151_c7_b003_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l3151_c11_0191] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3151_c11_0191_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3151_c11_0191_left;
     BIN_OP_EQ_uxn_opcodes_h_l3151_c11_0191_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3151_c11_0191_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3151_c11_0191_return_output := BIN_OP_EQ_uxn_opcodes_h_l3151_c11_0191_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3166_l3163_l3158_l3155_l3151_l3148_l3143_l3140_l3134_l3213_l3209_l3205_l3201_l3197_l3193_l3181_l3178_l3173_l3170_DUPLICATE_f704 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3166_l3163_l3158_l3155_l3151_l3148_l3143_l3140_l3134_l3213_l3209_l3205_l3201_l3197_l3193_l3181_l3178_l3173_l3170_DUPLICATE_f704_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l3134_c6_7f67] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3134_c6_7f67_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3134_c6_7f67_left;
     BIN_OP_EQ_uxn_opcodes_h_l3134_c6_7f67_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3134_c6_7f67_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3134_c6_7f67_return_output := BIN_OP_EQ_uxn_opcodes_h_l3134_c6_7f67_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3213_c11_627a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3213_c11_627a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3213_c11_627a_left;
     BIN_OP_EQ_uxn_opcodes_h_l3213_c11_627a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3213_c11_627a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3213_c11_627a_return_output := BIN_OP_EQ_uxn_opcodes_h_l3213_c11_627a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3166_l3140_l3163_l3158_l3181_l3155_l3178_l3151_l3173_l3148_l3170_l3143_DUPLICATE_c11d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3166_l3140_l3163_l3158_l3181_l3155_l3178_l3151_l3173_l3148_l3170_l3143_DUPLICATE_c11d_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l3170_c11_cf37] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3170_c11_cf37_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3170_c11_cf37_left;
     BIN_OP_EQ_uxn_opcodes_h_l3170_c11_cf37_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3170_c11_cf37_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3170_c11_cf37_return_output := BIN_OP_EQ_uxn_opcodes_h_l3170_c11_cf37_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3193_c11_9474] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3193_c11_9474_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3193_c11_9474_left;
     BIN_OP_EQ_uxn_opcodes_h_l3193_c11_9474_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3193_c11_9474_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3193_c11_9474_return_output := BIN_OP_EQ_uxn_opcodes_h_l3193_c11_9474_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3197_c11_6d32] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3197_c11_6d32_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3197_c11_6d32_left;
     BIN_OP_EQ_uxn_opcodes_h_l3197_c11_6d32_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3197_c11_6d32_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3197_c11_6d32_return_output := BIN_OP_EQ_uxn_opcodes_h_l3197_c11_6d32_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3178_c11_ff07] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3178_c11_ff07_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3178_c11_ff07_left;
     BIN_OP_EQ_uxn_opcodes_h_l3178_c11_ff07_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3178_c11_ff07_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3178_c11_ff07_return_output := BIN_OP_EQ_uxn_opcodes_h_l3178_c11_ff07_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3140_c11_e1f9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3140_c11_e1f9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3140_c11_e1f9_left;
     BIN_OP_EQ_uxn_opcodes_h_l3140_c11_e1f9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3140_c11_e1f9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3140_c11_e1f9_return_output := BIN_OP_EQ_uxn_opcodes_h_l3140_c11_e1f9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3166_c11_d7b6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3166_c11_d7b6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3166_c11_d7b6_left;
     BIN_OP_EQ_uxn_opcodes_h_l3166_c11_d7b6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3166_c11_d7b6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3166_c11_d7b6_return_output := BIN_OP_EQ_uxn_opcodes_h_l3166_c11_d7b6_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l3207_c24_1810] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3207_c24_1810_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- BIN_OP_EQ[uxn_opcodes_h_l3201_c11_6c26] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3201_c11_6c26_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3201_c11_6c26_left;
     BIN_OP_EQ_uxn_opcodes_h_l3201_c11_6c26_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3201_c11_6c26_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3201_c11_6c26_return_output := BIN_OP_EQ_uxn_opcodes_h_l3201_c11_6c26_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3158_c11_5e9b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3158_c11_5e9b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3158_c11_5e9b_left;
     BIN_OP_EQ_uxn_opcodes_h_l3158_c11_5e9b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3158_c11_5e9b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3158_c11_5e9b_return_output := BIN_OP_EQ_uxn_opcodes_h_l3158_c11_5e9b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3187_c11_c7a8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3187_c11_c7a8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3187_c11_c7a8_left;
     BIN_OP_EQ_uxn_opcodes_h_l3187_c11_c7a8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3187_c11_c7a8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3187_c11_c7a8_return_output := BIN_OP_EQ_uxn_opcodes_h_l3187_c11_c7a8_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l3185_c32_0b85] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l3185_c32_0b85_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l3185_c32_0b85_left;
     BIN_OP_AND_uxn_opcodes_h_l3185_c32_0b85_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l3185_c32_0b85_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l3185_c32_0b85_return_output := BIN_OP_AND_uxn_opcodes_h_l3185_c32_0b85_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3155_c11_8547] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3155_c11_8547_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3155_c11_8547_left;
     BIN_OP_EQ_uxn_opcodes_h_l3155_c11_8547_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3155_c11_8547_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3155_c11_8547_return_output := BIN_OP_EQ_uxn_opcodes_h_l3155_c11_8547_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l3195_c34_6e27] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l3195_c34_6e27_x <= VAR_CONST_SR_8_uxn_opcodes_h_l3195_c34_6e27_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l3195_c34_6e27_return_output := CONST_SR_8_uxn_opcodes_h_l3195_c34_6e27_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3209_c11_499e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3209_c11_499e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3209_c11_499e_left;
     BIN_OP_EQ_uxn_opcodes_h_l3209_c11_499e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3209_c11_499e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3209_c11_499e_return_output := BIN_OP_EQ_uxn_opcodes_h_l3209_c11_499e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3166_l3140_l3163_l3187_l3134_l3158_l3155_l3178_l3151_l3173_l3148_l3170_l3143_DUPLICATE_e2b0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3166_l3140_l3163_l3187_l3134_l3158_l3155_l3178_l3151_l3173_l3148_l3170_l3143_DUPLICATE_e2b0_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l3205_c11_d10d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3205_c11_d10d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3205_c11_d10d_left;
     BIN_OP_EQ_uxn_opcodes_h_l3205_c11_d10d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3205_c11_d10d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3205_c11_d10d_return_output := BIN_OP_EQ_uxn_opcodes_h_l3205_c11_d10d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3143_c11_7de5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3143_c11_7de5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3143_c11_7de5_left;
     BIN_OP_EQ_uxn_opcodes_h_l3143_c11_7de5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3143_c11_7de5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3143_c11_7de5_return_output := BIN_OP_EQ_uxn_opcodes_h_l3143_c11_7de5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3148_c11_6f95] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3148_c11_6f95_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3148_c11_6f95_left;
     BIN_OP_EQ_uxn_opcodes_h_l3148_c11_6f95_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3148_c11_6f95_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3148_c11_6f95_return_output := BIN_OP_EQ_uxn_opcodes_h_l3148_c11_6f95_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l3199_c24_33a0] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3199_c24_33a0_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- CAST_TO_uint8_t[uxn_opcodes_h_l3191_c24_4860] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3191_c24_4860_return_output := CAST_TO_uint8_t_uint16_t(
     l16);

     -- CONST_SR_8[uxn_opcodes_h_l3203_c34_e600] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l3203_c34_e600_x <= VAR_CONST_SR_8_uxn_opcodes_h_l3203_c34_e600_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l3203_c34_e600_return_output := CONST_SR_8_uxn_opcodes_h_l3203_c34_e600_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3166_l3140_l3163_l3134_l3158_l3181_l3155_l3178_l3151_l3173_l3148_l3170_l3143_DUPLICATE_8248 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3166_l3140_l3163_l3134_l3158_l3181_l3155_l3178_l3151_l3173_l3148_l3170_l3143_DUPLICATE_8248_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3166_l3140_l3163_l3134_l3158_l3181_l3209_l3155_l3178_l3151_l3173_l3148_l3170_l3143_DUPLICATE_9c1c LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3166_l3140_l3163_l3134_l3158_l3181_l3209_l3155_l3178_l3151_l3173_l3148_l3170_l3143_DUPLICATE_9c1c_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l3163_c11_141a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3163_c11_141a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3163_c11_141a_left;
     BIN_OP_EQ_uxn_opcodes_h_l3163_c11_141a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3163_c11_141a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3163_c11_141a_return_output := BIN_OP_EQ_uxn_opcodes_h_l3163_c11_141a_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l3211_c34_ba7f] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l3211_c34_ba7f_x <= VAR_CONST_SR_8_uxn_opcodes_h_l3211_c34_ba7f_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l3211_c34_ba7f_return_output := CONST_SR_8_uxn_opcodes_h_l3211_c34_ba7f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3181_c11_7a66] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3181_c11_7a66_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3181_c11_7a66_left;
     BIN_OP_EQ_uxn_opcodes_h_l3181_c11_7a66_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3181_c11_7a66_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3181_c11_7a66_return_output := BIN_OP_EQ_uxn_opcodes_h_l3181_c11_7a66_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3166_l3163_l3158_l3155_l3151_l3148_l3143_l3140_l3213_l3209_l3205_l3201_l3197_l3193_l3187_l3181_l3178_l3173_l3170_DUPLICATE_9e04 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3166_l3163_l3158_l3155_l3151_l3148_l3143_l3140_l3213_l3209_l3205_l3201_l3197_l3193_l3187_l3181_l3178_l3173_l3170_DUPLICATE_9e04_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l3173_c11_4e02] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3173_c11_4e02_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3173_c11_4e02_left;
     BIN_OP_EQ_uxn_opcodes_h_l3173_c11_4e02_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3173_c11_4e02_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3173_c11_4e02_return_output := BIN_OP_EQ_uxn_opcodes_h_l3173_c11_4e02_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3181_l3209_DUPLICATE_f313 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3181_l3209_DUPLICATE_f313_return_output := result.stack_address_sp_offset;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l3159_l3152_l3182_l3174_l3167_l3144_DUPLICATE_d1ac LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l3159_l3152_l3182_l3174_l3167_l3144_DUPLICATE_d1ac_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l3185_c32_3b45_left := VAR_BIN_OP_AND_uxn_opcodes_h_l3185_c32_0b85_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3134_c1_8829_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3134_c6_7f67_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l3134_c2_4d74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3134_c6_7f67_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l3134_c2_4d74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3134_c6_7f67_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3134_c2_4d74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3134_c6_7f67_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3134_c2_4d74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3134_c6_7f67_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3134_c2_4d74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3134_c6_7f67_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3134_c2_4d74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3134_c6_7f67_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3134_c2_4d74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3134_c6_7f67_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3134_c2_4d74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3134_c6_7f67_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3134_c2_4d74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3134_c6_7f67_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3134_c2_4d74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3134_c6_7f67_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l3140_c7_c7d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3140_c11_e1f9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l3140_c7_c7d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3140_c11_e1f9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3140_c7_c7d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3140_c11_e1f9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3140_c7_c7d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3140_c11_e1f9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3140_c7_c7d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3140_c11_e1f9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3140_c7_c7d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3140_c11_e1f9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3140_c7_c7d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3140_c11_e1f9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3140_c7_c7d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3140_c11_e1f9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3140_c7_c7d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3140_c11_e1f9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3140_c7_c7d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3140_c11_e1f9_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l3143_c7_d22e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3143_c11_7de5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l3143_c7_d22e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3143_c11_7de5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3143_c7_d22e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3143_c11_7de5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3143_c7_d22e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3143_c11_7de5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3143_c7_d22e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3143_c11_7de5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3143_c7_d22e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3143_c11_7de5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3143_c7_d22e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3143_c11_7de5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3143_c7_d22e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3143_c11_7de5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3143_c7_d22e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3143_c11_7de5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3143_c7_d22e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3143_c11_7de5_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l3148_c7_15d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3148_c11_6f95_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l3148_c7_15d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3148_c11_6f95_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3148_c7_15d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3148_c11_6f95_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3148_c7_15d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3148_c11_6f95_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3148_c7_15d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3148_c11_6f95_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3148_c7_15d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3148_c11_6f95_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3148_c7_15d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3148_c11_6f95_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3148_c7_15d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3148_c11_6f95_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3148_c7_15d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3148_c11_6f95_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3148_c7_15d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3148_c11_6f95_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l3151_c7_b003_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3151_c11_0191_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l3151_c7_b003_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3151_c11_0191_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3151_c7_b003_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3151_c11_0191_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3151_c7_b003_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3151_c11_0191_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3151_c7_b003_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3151_c11_0191_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3151_c7_b003_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3151_c11_0191_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3151_c7_b003_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3151_c11_0191_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3151_c7_b003_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3151_c11_0191_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3151_c7_b003_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3151_c11_0191_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3151_c7_b003_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3151_c11_0191_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l3155_c7_35c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3155_c11_8547_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l3155_c7_35c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3155_c11_8547_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3155_c7_35c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3155_c11_8547_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3155_c7_35c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3155_c11_8547_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3155_c7_35c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3155_c11_8547_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3155_c7_35c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3155_c11_8547_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3155_c7_35c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3155_c11_8547_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3155_c7_35c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3155_c11_8547_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3155_c7_35c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3155_c11_8547_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l3158_c7_b019_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3158_c11_5e9b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l3158_c7_b019_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3158_c11_5e9b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3158_c7_b019_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3158_c11_5e9b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3158_c7_b019_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3158_c11_5e9b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3158_c7_b019_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3158_c11_5e9b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3158_c7_b019_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3158_c11_5e9b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3158_c7_b019_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3158_c11_5e9b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3158_c7_b019_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3158_c11_5e9b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3158_c7_b019_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3158_c11_5e9b_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l3163_c7_4fee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3163_c11_141a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l3163_c7_4fee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3163_c11_141a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3163_c7_4fee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3163_c11_141a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3163_c7_4fee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3163_c11_141a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3163_c7_4fee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3163_c11_141a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3163_c7_4fee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3163_c11_141a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3163_c7_4fee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3163_c11_141a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3163_c7_4fee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3163_c11_141a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3163_c7_4fee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3163_c11_141a_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l3166_c7_d0bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3166_c11_d7b6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l3166_c7_d0bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3166_c11_d7b6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3166_c7_d0bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3166_c11_d7b6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3166_c7_d0bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3166_c11_d7b6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3166_c7_d0bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3166_c11_d7b6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3166_c7_d0bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3166_c11_d7b6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3166_c7_d0bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3166_c11_d7b6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3166_c7_d0bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3166_c11_d7b6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3166_c7_d0bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3166_c11_d7b6_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l3170_c7_68c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3170_c11_cf37_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3170_c7_68c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3170_c11_cf37_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3170_c7_68c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3170_c11_cf37_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3170_c7_68c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3170_c11_cf37_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3170_c7_68c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3170_c11_cf37_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3170_c7_68c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3170_c11_cf37_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3170_c7_68c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3170_c11_cf37_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3170_c7_68c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3170_c11_cf37_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l3173_c7_11b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3173_c11_4e02_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3173_c7_11b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3173_c11_4e02_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3173_c7_11b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3173_c11_4e02_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3173_c7_11b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3173_c11_4e02_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3173_c7_11b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3173_c11_4e02_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3173_c7_11b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3173_c11_4e02_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3173_c7_11b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3173_c11_4e02_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3173_c7_11b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3173_c11_4e02_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l3178_c7_eeb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3178_c11_ff07_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3178_c7_eeb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3178_c11_ff07_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3178_c7_eeb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3178_c11_ff07_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3178_c7_eeb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3178_c11_ff07_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3178_c7_eeb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3178_c11_ff07_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3178_c7_eeb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3178_c11_ff07_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3178_c7_eeb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3178_c11_ff07_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3178_c7_eeb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3178_c11_ff07_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l3181_c7_557e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3181_c11_7a66_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3181_c7_557e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3181_c11_7a66_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3181_c7_557e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3181_c11_7a66_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3181_c7_557e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3181_c11_7a66_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3181_c7_557e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3181_c11_7a66_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3181_c7_557e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3181_c11_7a66_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3181_c7_557e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3181_c11_7a66_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3181_c7_557e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3181_c11_7a66_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3187_c7_dba2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3187_c11_c7a8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3187_c7_dba2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3187_c11_c7a8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3187_c7_dba2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3187_c11_c7a8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3187_c7_dba2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3187_c11_c7a8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3187_c7_dba2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3187_c11_c7a8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3193_c7_e961_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3193_c11_9474_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3193_c7_e961_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3193_c11_9474_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3193_c7_e961_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3193_c11_9474_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3193_c7_e961_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3193_c11_9474_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3197_c7_d1e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3197_c11_6d32_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3197_c7_d1e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3197_c11_6d32_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3197_c7_d1e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3197_c11_6d32_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3197_c7_d1e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3197_c11_6d32_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3201_c7_362d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3201_c11_6c26_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3201_c7_362d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3201_c11_6c26_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3201_c7_362d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3201_c11_6c26_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3201_c7_362d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3201_c11_6c26_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3205_c7_e28a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3205_c11_d10d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3205_c7_e28a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3205_c11_d10d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3205_c7_e28a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3205_c11_d10d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3205_c7_e28a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3205_c11_d10d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3209_c7_5101_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3209_c11_499e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3209_c7_5101_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3209_c11_499e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3209_c7_5101_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3209_c11_499e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3209_c7_5101_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3209_c11_499e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3213_c7_378a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3213_c11_627a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3213_c7_378a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3213_c11_627a_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l3152_c3_0bbe_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l3159_l3152_l3182_l3174_l3167_l3144_DUPLICATE_d1ac_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l3167_c3_359d_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l3159_l3152_l3182_l3174_l3167_l3144_DUPLICATE_d1ac_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l3182_c3_1d15_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l3159_l3152_l3182_l3174_l3167_l3144_DUPLICATE_d1ac_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l3145_l3175_l3160_DUPLICATE_73da_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l3159_l3152_l3182_l3174_l3167_l3144_DUPLICATE_d1ac_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3187_c7_dba2_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3191_c24_4860_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3197_c7_d1e9_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3199_c24_33a0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3205_c7_e28a_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3207_c24_1810_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3134_c2_4d74_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3166_l3140_l3163_l3134_l3158_l3181_l3155_l3178_l3151_l3173_l3148_l3170_l3143_DUPLICATE_8248_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3140_c7_c7d4_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3166_l3140_l3163_l3134_l3158_l3181_l3155_l3178_l3151_l3173_l3148_l3170_l3143_DUPLICATE_8248_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3143_c7_d22e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3166_l3140_l3163_l3134_l3158_l3181_l3155_l3178_l3151_l3173_l3148_l3170_l3143_DUPLICATE_8248_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3148_c7_15d3_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3166_l3140_l3163_l3134_l3158_l3181_l3155_l3178_l3151_l3173_l3148_l3170_l3143_DUPLICATE_8248_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3151_c7_b003_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3166_l3140_l3163_l3134_l3158_l3181_l3155_l3178_l3151_l3173_l3148_l3170_l3143_DUPLICATE_8248_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3155_c7_35c4_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3166_l3140_l3163_l3134_l3158_l3181_l3155_l3178_l3151_l3173_l3148_l3170_l3143_DUPLICATE_8248_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3158_c7_b019_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3166_l3140_l3163_l3134_l3158_l3181_l3155_l3178_l3151_l3173_l3148_l3170_l3143_DUPLICATE_8248_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3163_c7_4fee_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3166_l3140_l3163_l3134_l3158_l3181_l3155_l3178_l3151_l3173_l3148_l3170_l3143_DUPLICATE_8248_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3166_c7_d0bf_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3166_l3140_l3163_l3134_l3158_l3181_l3155_l3178_l3151_l3173_l3148_l3170_l3143_DUPLICATE_8248_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3170_c7_68c6_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3166_l3140_l3163_l3134_l3158_l3181_l3155_l3178_l3151_l3173_l3148_l3170_l3143_DUPLICATE_8248_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3173_c7_11b4_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3166_l3140_l3163_l3134_l3158_l3181_l3155_l3178_l3151_l3173_l3148_l3170_l3143_DUPLICATE_8248_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3178_c7_eeb0_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3166_l3140_l3163_l3134_l3158_l3181_l3155_l3178_l3151_l3173_l3148_l3170_l3143_DUPLICATE_8248_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3181_c7_557e_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3166_l3140_l3163_l3134_l3158_l3181_l3155_l3178_l3151_l3173_l3148_l3170_l3143_DUPLICATE_8248_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3140_c7_c7d4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3166_l3163_l3158_l3155_l3151_l3148_l3143_l3140_l3213_l3209_l3205_l3201_l3197_l3193_l3187_l3181_l3178_l3173_l3170_DUPLICATE_9e04_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3143_c7_d22e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3166_l3163_l3158_l3155_l3151_l3148_l3143_l3140_l3213_l3209_l3205_l3201_l3197_l3193_l3187_l3181_l3178_l3173_l3170_DUPLICATE_9e04_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3148_c7_15d3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3166_l3163_l3158_l3155_l3151_l3148_l3143_l3140_l3213_l3209_l3205_l3201_l3197_l3193_l3187_l3181_l3178_l3173_l3170_DUPLICATE_9e04_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3151_c7_b003_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3166_l3163_l3158_l3155_l3151_l3148_l3143_l3140_l3213_l3209_l3205_l3201_l3197_l3193_l3187_l3181_l3178_l3173_l3170_DUPLICATE_9e04_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3155_c7_35c4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3166_l3163_l3158_l3155_l3151_l3148_l3143_l3140_l3213_l3209_l3205_l3201_l3197_l3193_l3187_l3181_l3178_l3173_l3170_DUPLICATE_9e04_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3158_c7_b019_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3166_l3163_l3158_l3155_l3151_l3148_l3143_l3140_l3213_l3209_l3205_l3201_l3197_l3193_l3187_l3181_l3178_l3173_l3170_DUPLICATE_9e04_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3163_c7_4fee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3166_l3163_l3158_l3155_l3151_l3148_l3143_l3140_l3213_l3209_l3205_l3201_l3197_l3193_l3187_l3181_l3178_l3173_l3170_DUPLICATE_9e04_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3166_c7_d0bf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3166_l3163_l3158_l3155_l3151_l3148_l3143_l3140_l3213_l3209_l3205_l3201_l3197_l3193_l3187_l3181_l3178_l3173_l3170_DUPLICATE_9e04_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3170_c7_68c6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3166_l3163_l3158_l3155_l3151_l3148_l3143_l3140_l3213_l3209_l3205_l3201_l3197_l3193_l3187_l3181_l3178_l3173_l3170_DUPLICATE_9e04_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3173_c7_11b4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3166_l3163_l3158_l3155_l3151_l3148_l3143_l3140_l3213_l3209_l3205_l3201_l3197_l3193_l3187_l3181_l3178_l3173_l3170_DUPLICATE_9e04_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3178_c7_eeb0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3166_l3163_l3158_l3155_l3151_l3148_l3143_l3140_l3213_l3209_l3205_l3201_l3197_l3193_l3187_l3181_l3178_l3173_l3170_DUPLICATE_9e04_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3181_c7_557e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3166_l3163_l3158_l3155_l3151_l3148_l3143_l3140_l3213_l3209_l3205_l3201_l3197_l3193_l3187_l3181_l3178_l3173_l3170_DUPLICATE_9e04_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3187_c7_dba2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3166_l3163_l3158_l3155_l3151_l3148_l3143_l3140_l3213_l3209_l3205_l3201_l3197_l3193_l3187_l3181_l3178_l3173_l3170_DUPLICATE_9e04_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3193_c7_e961_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3166_l3163_l3158_l3155_l3151_l3148_l3143_l3140_l3213_l3209_l3205_l3201_l3197_l3193_l3187_l3181_l3178_l3173_l3170_DUPLICATE_9e04_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3197_c7_d1e9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3166_l3163_l3158_l3155_l3151_l3148_l3143_l3140_l3213_l3209_l3205_l3201_l3197_l3193_l3187_l3181_l3178_l3173_l3170_DUPLICATE_9e04_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3201_c7_362d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3166_l3163_l3158_l3155_l3151_l3148_l3143_l3140_l3213_l3209_l3205_l3201_l3197_l3193_l3187_l3181_l3178_l3173_l3170_DUPLICATE_9e04_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3205_c7_e28a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3166_l3163_l3158_l3155_l3151_l3148_l3143_l3140_l3213_l3209_l3205_l3201_l3197_l3193_l3187_l3181_l3178_l3173_l3170_DUPLICATE_9e04_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3209_c7_5101_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3166_l3163_l3158_l3155_l3151_l3148_l3143_l3140_l3213_l3209_l3205_l3201_l3197_l3193_l3187_l3181_l3178_l3173_l3170_DUPLICATE_9e04_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3213_c7_378a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3166_l3163_l3158_l3155_l3151_l3148_l3143_l3140_l3213_l3209_l3205_l3201_l3197_l3193_l3187_l3181_l3178_l3173_l3170_DUPLICATE_9e04_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3134_c2_4d74_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3166_l3140_l3163_l3187_l3134_l3158_l3155_l3178_l3151_l3173_l3148_l3170_l3143_DUPLICATE_e2b0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3140_c7_c7d4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3166_l3140_l3163_l3187_l3134_l3158_l3155_l3178_l3151_l3173_l3148_l3170_l3143_DUPLICATE_e2b0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3143_c7_d22e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3166_l3140_l3163_l3187_l3134_l3158_l3155_l3178_l3151_l3173_l3148_l3170_l3143_DUPLICATE_e2b0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3148_c7_15d3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3166_l3140_l3163_l3187_l3134_l3158_l3155_l3178_l3151_l3173_l3148_l3170_l3143_DUPLICATE_e2b0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3151_c7_b003_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3166_l3140_l3163_l3187_l3134_l3158_l3155_l3178_l3151_l3173_l3148_l3170_l3143_DUPLICATE_e2b0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3155_c7_35c4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3166_l3140_l3163_l3187_l3134_l3158_l3155_l3178_l3151_l3173_l3148_l3170_l3143_DUPLICATE_e2b0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3158_c7_b019_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3166_l3140_l3163_l3187_l3134_l3158_l3155_l3178_l3151_l3173_l3148_l3170_l3143_DUPLICATE_e2b0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3163_c7_4fee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3166_l3140_l3163_l3187_l3134_l3158_l3155_l3178_l3151_l3173_l3148_l3170_l3143_DUPLICATE_e2b0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3166_c7_d0bf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3166_l3140_l3163_l3187_l3134_l3158_l3155_l3178_l3151_l3173_l3148_l3170_l3143_DUPLICATE_e2b0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3170_c7_68c6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3166_l3140_l3163_l3187_l3134_l3158_l3155_l3178_l3151_l3173_l3148_l3170_l3143_DUPLICATE_e2b0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3173_c7_11b4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3166_l3140_l3163_l3187_l3134_l3158_l3155_l3178_l3151_l3173_l3148_l3170_l3143_DUPLICATE_e2b0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3178_c7_eeb0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3166_l3140_l3163_l3187_l3134_l3158_l3155_l3178_l3151_l3173_l3148_l3170_l3143_DUPLICATE_e2b0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3187_c7_dba2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3166_l3140_l3163_l3187_l3134_l3158_l3155_l3178_l3151_l3173_l3148_l3170_l3143_DUPLICATE_e2b0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3140_c7_c7d4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3166_l3140_l3163_l3158_l3181_l3155_l3178_l3151_l3173_l3148_l3170_l3143_DUPLICATE_c11d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3143_c7_d22e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3166_l3140_l3163_l3158_l3181_l3155_l3178_l3151_l3173_l3148_l3170_l3143_DUPLICATE_c11d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3148_c7_15d3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3166_l3140_l3163_l3158_l3181_l3155_l3178_l3151_l3173_l3148_l3170_l3143_DUPLICATE_c11d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3151_c7_b003_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3166_l3140_l3163_l3158_l3181_l3155_l3178_l3151_l3173_l3148_l3170_l3143_DUPLICATE_c11d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3155_c7_35c4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3166_l3140_l3163_l3158_l3181_l3155_l3178_l3151_l3173_l3148_l3170_l3143_DUPLICATE_c11d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3158_c7_b019_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3166_l3140_l3163_l3158_l3181_l3155_l3178_l3151_l3173_l3148_l3170_l3143_DUPLICATE_c11d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3163_c7_4fee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3166_l3140_l3163_l3158_l3181_l3155_l3178_l3151_l3173_l3148_l3170_l3143_DUPLICATE_c11d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3166_c7_d0bf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3166_l3140_l3163_l3158_l3181_l3155_l3178_l3151_l3173_l3148_l3170_l3143_DUPLICATE_c11d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3170_c7_68c6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3166_l3140_l3163_l3158_l3181_l3155_l3178_l3151_l3173_l3148_l3170_l3143_DUPLICATE_c11d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3173_c7_11b4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3166_l3140_l3163_l3158_l3181_l3155_l3178_l3151_l3173_l3148_l3170_l3143_DUPLICATE_c11d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3178_c7_eeb0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3166_l3140_l3163_l3158_l3181_l3155_l3178_l3151_l3173_l3148_l3170_l3143_DUPLICATE_c11d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3181_c7_557e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3166_l3140_l3163_l3158_l3181_l3155_l3178_l3151_l3173_l3148_l3170_l3143_DUPLICATE_c11d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3134_c2_4d74_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3166_l3163_l3158_l3155_l3151_l3148_l3143_l3140_l3134_l3213_l3209_l3205_l3201_l3197_l3193_l3181_l3178_l3173_l3170_DUPLICATE_f704_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3140_c7_c7d4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3166_l3163_l3158_l3155_l3151_l3148_l3143_l3140_l3134_l3213_l3209_l3205_l3201_l3197_l3193_l3181_l3178_l3173_l3170_DUPLICATE_f704_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3143_c7_d22e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3166_l3163_l3158_l3155_l3151_l3148_l3143_l3140_l3134_l3213_l3209_l3205_l3201_l3197_l3193_l3181_l3178_l3173_l3170_DUPLICATE_f704_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3148_c7_15d3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3166_l3163_l3158_l3155_l3151_l3148_l3143_l3140_l3134_l3213_l3209_l3205_l3201_l3197_l3193_l3181_l3178_l3173_l3170_DUPLICATE_f704_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3151_c7_b003_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3166_l3163_l3158_l3155_l3151_l3148_l3143_l3140_l3134_l3213_l3209_l3205_l3201_l3197_l3193_l3181_l3178_l3173_l3170_DUPLICATE_f704_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3155_c7_35c4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3166_l3163_l3158_l3155_l3151_l3148_l3143_l3140_l3134_l3213_l3209_l3205_l3201_l3197_l3193_l3181_l3178_l3173_l3170_DUPLICATE_f704_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3158_c7_b019_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3166_l3163_l3158_l3155_l3151_l3148_l3143_l3140_l3134_l3213_l3209_l3205_l3201_l3197_l3193_l3181_l3178_l3173_l3170_DUPLICATE_f704_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3163_c7_4fee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3166_l3163_l3158_l3155_l3151_l3148_l3143_l3140_l3134_l3213_l3209_l3205_l3201_l3197_l3193_l3181_l3178_l3173_l3170_DUPLICATE_f704_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3166_c7_d0bf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3166_l3163_l3158_l3155_l3151_l3148_l3143_l3140_l3134_l3213_l3209_l3205_l3201_l3197_l3193_l3181_l3178_l3173_l3170_DUPLICATE_f704_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3170_c7_68c6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3166_l3163_l3158_l3155_l3151_l3148_l3143_l3140_l3134_l3213_l3209_l3205_l3201_l3197_l3193_l3181_l3178_l3173_l3170_DUPLICATE_f704_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3173_c7_11b4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3166_l3163_l3158_l3155_l3151_l3148_l3143_l3140_l3134_l3213_l3209_l3205_l3201_l3197_l3193_l3181_l3178_l3173_l3170_DUPLICATE_f704_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3178_c7_eeb0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3166_l3163_l3158_l3155_l3151_l3148_l3143_l3140_l3134_l3213_l3209_l3205_l3201_l3197_l3193_l3181_l3178_l3173_l3170_DUPLICATE_f704_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3181_c7_557e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3166_l3163_l3158_l3155_l3151_l3148_l3143_l3140_l3134_l3213_l3209_l3205_l3201_l3197_l3193_l3181_l3178_l3173_l3170_DUPLICATE_f704_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3193_c7_e961_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3166_l3163_l3158_l3155_l3151_l3148_l3143_l3140_l3134_l3213_l3209_l3205_l3201_l3197_l3193_l3181_l3178_l3173_l3170_DUPLICATE_f704_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3197_c7_d1e9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3166_l3163_l3158_l3155_l3151_l3148_l3143_l3140_l3134_l3213_l3209_l3205_l3201_l3197_l3193_l3181_l3178_l3173_l3170_DUPLICATE_f704_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3201_c7_362d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3166_l3163_l3158_l3155_l3151_l3148_l3143_l3140_l3134_l3213_l3209_l3205_l3201_l3197_l3193_l3181_l3178_l3173_l3170_DUPLICATE_f704_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3205_c7_e28a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3166_l3163_l3158_l3155_l3151_l3148_l3143_l3140_l3134_l3213_l3209_l3205_l3201_l3197_l3193_l3181_l3178_l3173_l3170_DUPLICATE_f704_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3209_c7_5101_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3166_l3163_l3158_l3155_l3151_l3148_l3143_l3140_l3134_l3213_l3209_l3205_l3201_l3197_l3193_l3181_l3178_l3173_l3170_DUPLICATE_f704_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3213_c7_378a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3166_l3163_l3158_l3155_l3151_l3148_l3143_l3140_l3134_l3213_l3209_l3205_l3201_l3197_l3193_l3181_l3178_l3173_l3170_DUPLICATE_f704_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3181_c7_557e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3181_l3209_DUPLICATE_f313_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3209_c7_5101_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3181_l3209_DUPLICATE_f313_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3134_c2_4d74_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3166_l3140_l3163_l3134_l3158_l3181_l3209_l3155_l3178_l3151_l3173_l3148_l3170_l3143_DUPLICATE_9c1c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3140_c7_c7d4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3166_l3140_l3163_l3134_l3158_l3181_l3209_l3155_l3178_l3151_l3173_l3148_l3170_l3143_DUPLICATE_9c1c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3143_c7_d22e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3166_l3140_l3163_l3134_l3158_l3181_l3209_l3155_l3178_l3151_l3173_l3148_l3170_l3143_DUPLICATE_9c1c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3148_c7_15d3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3166_l3140_l3163_l3134_l3158_l3181_l3209_l3155_l3178_l3151_l3173_l3148_l3170_l3143_DUPLICATE_9c1c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3151_c7_b003_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3166_l3140_l3163_l3134_l3158_l3181_l3209_l3155_l3178_l3151_l3173_l3148_l3170_l3143_DUPLICATE_9c1c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3155_c7_35c4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3166_l3140_l3163_l3134_l3158_l3181_l3209_l3155_l3178_l3151_l3173_l3148_l3170_l3143_DUPLICATE_9c1c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3158_c7_b019_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3166_l3140_l3163_l3134_l3158_l3181_l3209_l3155_l3178_l3151_l3173_l3148_l3170_l3143_DUPLICATE_9c1c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3163_c7_4fee_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3166_l3140_l3163_l3134_l3158_l3181_l3209_l3155_l3178_l3151_l3173_l3148_l3170_l3143_DUPLICATE_9c1c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3166_c7_d0bf_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3166_l3140_l3163_l3134_l3158_l3181_l3209_l3155_l3178_l3151_l3173_l3148_l3170_l3143_DUPLICATE_9c1c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3170_c7_68c6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3166_l3140_l3163_l3134_l3158_l3181_l3209_l3155_l3178_l3151_l3173_l3148_l3170_l3143_DUPLICATE_9c1c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3173_c7_11b4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3166_l3140_l3163_l3134_l3158_l3181_l3209_l3155_l3178_l3151_l3173_l3148_l3170_l3143_DUPLICATE_9c1c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3178_c7_eeb0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3166_l3140_l3163_l3134_l3158_l3181_l3209_l3155_l3178_l3151_l3173_l3148_l3170_l3143_DUPLICATE_9c1c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3181_c7_557e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3166_l3140_l3163_l3134_l3158_l3181_l3209_l3155_l3178_l3151_l3173_l3148_l3170_l3143_DUPLICATE_9c1c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3209_c7_5101_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3166_l3140_l3163_l3134_l3158_l3181_l3209_l3155_l3178_l3151_l3173_l3148_l3170_l3143_DUPLICATE_9c1c_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l3182_c3_1d15] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l3182_c3_1d15_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l3182_c3_1d15_left;
     BIN_OP_OR_uxn_opcodes_h_l3182_c3_1d15_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l3182_c3_1d15_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l3182_c3_1d15_return_output := BIN_OP_OR_uxn_opcodes_h_l3182_c3_1d15_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l3145_l3175_l3160_DUPLICATE_73da LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l3145_l3175_l3160_DUPLICATE_73da_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l3145_l3175_l3160_DUPLICATE_73da_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l3145_l3175_l3160_DUPLICATE_73da_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l3145_l3175_l3160_DUPLICATE_73da_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l3203_c24_f2bc] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3203_c24_f2bc_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l3203_c34_e600_return_output);

     -- CAST_TO_uint8_t[uxn_opcodes_h_l3195_c24_7486] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3195_c24_7486_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l3195_c34_6e27_return_output);

     -- result_is_stack_read_MUX[uxn_opcodes_h_l3181_c7_557e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l3181_c7_557e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3181_c7_557e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l3181_c7_557e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3181_c7_557e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l3181_c7_557e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3181_c7_557e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3181_c7_557e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l3181_c7_557e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3187_c7_dba2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3187_c7_dba2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3187_c7_dba2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3187_c7_dba2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3187_c7_dba2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3187_c7_dba2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3187_c7_dba2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3187_c7_dba2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3187_c7_dba2_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l3211_c24_208f] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3211_c24_208f_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l3211_c34_ba7f_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l3152_c3_0bbe] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l3152_c3_0bbe_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l3152_c3_0bbe_left;
     BIN_OP_OR_uxn_opcodes_h_l3152_c3_0bbe_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l3152_c3_0bbe_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l3152_c3_0bbe_return_output := BIN_OP_OR_uxn_opcodes_h_l3152_c3_0bbe_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l3185_c32_3b45] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l3185_c32_3b45_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l3185_c32_3b45_left;
     BIN_OP_GT_uxn_opcodes_h_l3185_c32_3b45_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l3185_c32_3b45_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l3185_c32_3b45_return_output := BIN_OP_GT_uxn_opcodes_h_l3185_c32_3b45_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3213_c7_378a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3213_c7_378a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3213_c7_378a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3213_c7_378a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3213_c7_378a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3213_c7_378a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3213_c7_378a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3213_c7_378a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3213_c7_378a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3134_c1_8829] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3134_c1_8829_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3134_c1_8829_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3134_c1_8829_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3134_c1_8829_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3134_c1_8829_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3134_c1_8829_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3134_c1_8829_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3134_c1_8829_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3209_c7_5101] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3209_c7_5101_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3209_c7_5101_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3209_c7_5101_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3209_c7_5101_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3209_c7_5101_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3209_c7_5101_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3209_c7_5101_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3209_c7_5101_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l3167_c3_359d] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l3167_c3_359d_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l3167_c3_359d_left;
     BIN_OP_OR_uxn_opcodes_h_l3167_c3_359d_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l3167_c3_359d_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l3167_c3_359d_return_output := BIN_OP_OR_uxn_opcodes_h_l3167_c3_359d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3213_c7_378a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3213_c7_378a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3213_c7_378a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3213_c7_378a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3213_c7_378a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3213_c7_378a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3213_c7_378a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3213_c7_378a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3213_c7_378a_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l3185_c32_2b70_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l3185_c32_3b45_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3151_c7_b003_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l3152_c3_0bbe_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l3166_c7_d0bf_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l3167_c3_359d_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l3181_c7_557e_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l3182_c3_1d15_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3193_c7_e961_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3195_c24_7486_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3201_c7_362d_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3203_c24_f2bc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3209_c7_5101_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3211_c24_208f_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l3173_c7_11b4_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l3145_l3175_l3160_DUPLICATE_73da_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l3158_c7_b019_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l3145_l3175_l3160_DUPLICATE_73da_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3143_c7_d22e_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l3145_l3175_l3160_DUPLICATE_73da_return_output;
     VAR_printf_uxn_opcodes_h_l3135_c3_d843_uxn_opcodes_h_l3135_c3_d843_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3134_c1_8829_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3209_c7_5101_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3213_c7_378a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3181_c7_557e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3187_c7_dba2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3178_c7_eeb0_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3181_c7_557e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3209_c7_5101_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3213_c7_378a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3205_c7_e28a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3209_c7_5101_return_output;
     -- l16_MUX[uxn_opcodes_h_l3181_c7_557e] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l3181_c7_557e_cond <= VAR_l16_MUX_uxn_opcodes_h_l3181_c7_557e_cond;
     l16_MUX_uxn_opcodes_h_l3181_c7_557e_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l3181_c7_557e_iftrue;
     l16_MUX_uxn_opcodes_h_l3181_c7_557e_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l3181_c7_557e_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l3181_c7_557e_return_output := l16_MUX_uxn_opcodes_h_l3181_c7_557e_return_output;

     -- n16_MUX[uxn_opcodes_h_l3166_c7_d0bf] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l3166_c7_d0bf_cond <= VAR_n16_MUX_uxn_opcodes_h_l3166_c7_d0bf_cond;
     n16_MUX_uxn_opcodes_h_l3166_c7_d0bf_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l3166_c7_d0bf_iftrue;
     n16_MUX_uxn_opcodes_h_l3166_c7_d0bf_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l3166_c7_d0bf_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l3166_c7_d0bf_return_output := n16_MUX_uxn_opcodes_h_l3166_c7_d0bf_return_output;

     -- MUX[uxn_opcodes_h_l3185_c32_2b70] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l3185_c32_2b70_cond <= VAR_MUX_uxn_opcodes_h_l3185_c32_2b70_cond;
     MUX_uxn_opcodes_h_l3185_c32_2b70_iftrue <= VAR_MUX_uxn_opcodes_h_l3185_c32_2b70_iftrue;
     MUX_uxn_opcodes_h_l3185_c32_2b70_iffalse <= VAR_MUX_uxn_opcodes_h_l3185_c32_2b70_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l3185_c32_2b70_return_output := MUX_uxn_opcodes_h_l3185_c32_2b70_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3205_c7_e28a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3205_c7_e28a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3205_c7_e28a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3205_c7_e28a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3205_c7_e28a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3205_c7_e28a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3205_c7_e28a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3205_c7_e28a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3205_c7_e28a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3209_c7_5101] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3209_c7_5101_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3209_c7_5101_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3209_c7_5101_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3209_c7_5101_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3209_c7_5101_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3209_c7_5101_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3209_c7_5101_return_output := result_stack_value_MUX_uxn_opcodes_h_l3209_c7_5101_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3209_c7_5101] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3209_c7_5101_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3209_c7_5101_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3209_c7_5101_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3209_c7_5101_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3209_c7_5101_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3209_c7_5101_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3209_c7_5101_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3209_c7_5101_return_output;

     -- t16_MUX[uxn_opcodes_h_l3151_c7_b003] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l3151_c7_b003_cond <= VAR_t16_MUX_uxn_opcodes_h_l3151_c7_b003_cond;
     t16_MUX_uxn_opcodes_h_l3151_c7_b003_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l3151_c7_b003_iftrue;
     t16_MUX_uxn_opcodes_h_l3151_c7_b003_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l3151_c7_b003_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l3151_c7_b003_return_output := t16_MUX_uxn_opcodes_h_l3151_c7_b003_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3209_c7_5101] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3209_c7_5101_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3209_c7_5101_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3209_c7_5101_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3209_c7_5101_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3209_c7_5101_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3209_c7_5101_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3209_c7_5101_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3209_c7_5101_return_output;

     -- printf_uxn_opcodes_h_l3135_c3_d843[uxn_opcodes_h_l3135_c3_d843] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l3135_c3_d843_uxn_opcodes_h_l3135_c3_d843_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l3135_c3_d843_uxn_opcodes_h_l3135_c3_d843_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3181_c7_557e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3181_c7_557e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3181_c7_557e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3181_c7_557e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3181_c7_557e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3181_c7_557e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3181_c7_557e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3181_c7_557e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3181_c7_557e_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l3178_c7_eeb0] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l3178_c7_eeb0_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3178_c7_eeb0_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l3178_c7_eeb0_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3178_c7_eeb0_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l3178_c7_eeb0_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3178_c7_eeb0_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3178_c7_eeb0_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l3178_c7_eeb0_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3181_c7_557e_iftrue := VAR_MUX_uxn_opcodes_h_l3185_c32_2b70_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l3178_c7_eeb0_iffalse := VAR_l16_MUX_uxn_opcodes_h_l3181_c7_557e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l3163_c7_4fee_iffalse := VAR_n16_MUX_uxn_opcodes_h_l3166_c7_d0bf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3205_c7_e28a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3209_c7_5101_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3178_c7_eeb0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3181_c7_557e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3173_c7_11b4_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3178_c7_eeb0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3205_c7_e28a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3209_c7_5101_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3201_c7_362d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3205_c7_e28a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3205_c7_e28a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3209_c7_5101_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3148_c7_15d3_iffalse := VAR_t16_MUX_uxn_opcodes_h_l3151_c7_b003_return_output;
     -- t16_MUX[uxn_opcodes_h_l3148_c7_15d3] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l3148_c7_15d3_cond <= VAR_t16_MUX_uxn_opcodes_h_l3148_c7_15d3_cond;
     t16_MUX_uxn_opcodes_h_l3148_c7_15d3_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l3148_c7_15d3_iftrue;
     t16_MUX_uxn_opcodes_h_l3148_c7_15d3_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l3148_c7_15d3_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l3148_c7_15d3_return_output := t16_MUX_uxn_opcodes_h_l3148_c7_15d3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3205_c7_e28a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3205_c7_e28a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3205_c7_e28a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3205_c7_e28a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3205_c7_e28a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3205_c7_e28a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3205_c7_e28a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3205_c7_e28a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3205_c7_e28a_return_output;

     -- l16_MUX[uxn_opcodes_h_l3178_c7_eeb0] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l3178_c7_eeb0_cond <= VAR_l16_MUX_uxn_opcodes_h_l3178_c7_eeb0_cond;
     l16_MUX_uxn_opcodes_h_l3178_c7_eeb0_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l3178_c7_eeb0_iftrue;
     l16_MUX_uxn_opcodes_h_l3178_c7_eeb0_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l3178_c7_eeb0_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l3178_c7_eeb0_return_output := l16_MUX_uxn_opcodes_h_l3178_c7_eeb0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3181_c7_557e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3181_c7_557e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3181_c7_557e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3181_c7_557e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3181_c7_557e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3181_c7_557e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3181_c7_557e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3181_c7_557e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3181_c7_557e_return_output;

     -- n16_MUX[uxn_opcodes_h_l3163_c7_4fee] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l3163_c7_4fee_cond <= VAR_n16_MUX_uxn_opcodes_h_l3163_c7_4fee_cond;
     n16_MUX_uxn_opcodes_h_l3163_c7_4fee_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l3163_c7_4fee_iftrue;
     n16_MUX_uxn_opcodes_h_l3163_c7_4fee_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l3163_c7_4fee_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l3163_c7_4fee_return_output := n16_MUX_uxn_opcodes_h_l3163_c7_4fee_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3201_c7_362d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3201_c7_362d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3201_c7_362d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3201_c7_362d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3201_c7_362d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3201_c7_362d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3201_c7_362d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3201_c7_362d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3201_c7_362d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l3173_c7_11b4] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l3173_c7_11b4_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3173_c7_11b4_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l3173_c7_11b4_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3173_c7_11b4_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l3173_c7_11b4_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3173_c7_11b4_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3173_c7_11b4_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l3173_c7_11b4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3178_c7_eeb0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3178_c7_eeb0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3178_c7_eeb0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3178_c7_eeb0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3178_c7_eeb0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3178_c7_eeb0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3178_c7_eeb0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3178_c7_eeb0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3178_c7_eeb0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3205_c7_e28a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3205_c7_e28a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3205_c7_e28a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3205_c7_e28a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3205_c7_e28a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3205_c7_e28a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3205_c7_e28a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3205_c7_e28a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3205_c7_e28a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3205_c7_e28a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3205_c7_e28a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3205_c7_e28a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3205_c7_e28a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3205_c7_e28a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3205_c7_e28a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3205_c7_e28a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3205_c7_e28a_return_output := result_stack_value_MUX_uxn_opcodes_h_l3205_c7_e28a_return_output;

     -- Submodule level 4
     VAR_l16_MUX_uxn_opcodes_h_l3173_c7_11b4_iffalse := VAR_l16_MUX_uxn_opcodes_h_l3178_c7_eeb0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l3158_c7_b019_iffalse := VAR_n16_MUX_uxn_opcodes_h_l3163_c7_4fee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3201_c7_362d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3205_c7_e28a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3173_c7_11b4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3178_c7_eeb0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3170_c7_68c6_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3173_c7_11b4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3201_c7_362d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3205_c7_e28a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3178_c7_eeb0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3181_c7_557e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3197_c7_d1e9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3201_c7_362d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3201_c7_362d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3205_c7_e28a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3143_c7_d22e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l3148_c7_15d3_return_output;
     -- l16_MUX[uxn_opcodes_h_l3173_c7_11b4] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l3173_c7_11b4_cond <= VAR_l16_MUX_uxn_opcodes_h_l3173_c7_11b4_cond;
     l16_MUX_uxn_opcodes_h_l3173_c7_11b4_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l3173_c7_11b4_iftrue;
     l16_MUX_uxn_opcodes_h_l3173_c7_11b4_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l3173_c7_11b4_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l3173_c7_11b4_return_output := l16_MUX_uxn_opcodes_h_l3173_c7_11b4_return_output;

     -- n16_MUX[uxn_opcodes_h_l3158_c7_b019] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l3158_c7_b019_cond <= VAR_n16_MUX_uxn_opcodes_h_l3158_c7_b019_cond;
     n16_MUX_uxn_opcodes_h_l3158_c7_b019_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l3158_c7_b019_iftrue;
     n16_MUX_uxn_opcodes_h_l3158_c7_b019_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l3158_c7_b019_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l3158_c7_b019_return_output := n16_MUX_uxn_opcodes_h_l3158_c7_b019_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3201_c7_362d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3201_c7_362d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3201_c7_362d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3201_c7_362d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3201_c7_362d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3201_c7_362d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3201_c7_362d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3201_c7_362d_return_output := result_stack_value_MUX_uxn_opcodes_h_l3201_c7_362d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3197_c7_d1e9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3197_c7_d1e9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3197_c7_d1e9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3197_c7_d1e9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3197_c7_d1e9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3197_c7_d1e9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3197_c7_d1e9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3197_c7_d1e9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3197_c7_d1e9_return_output;

     -- t16_MUX[uxn_opcodes_h_l3143_c7_d22e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l3143_c7_d22e_cond <= VAR_t16_MUX_uxn_opcodes_h_l3143_c7_d22e_cond;
     t16_MUX_uxn_opcodes_h_l3143_c7_d22e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l3143_c7_d22e_iftrue;
     t16_MUX_uxn_opcodes_h_l3143_c7_d22e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l3143_c7_d22e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l3143_c7_d22e_return_output := t16_MUX_uxn_opcodes_h_l3143_c7_d22e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3201_c7_362d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3201_c7_362d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3201_c7_362d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3201_c7_362d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3201_c7_362d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3201_c7_362d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3201_c7_362d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3201_c7_362d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3201_c7_362d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3201_c7_362d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3201_c7_362d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3201_c7_362d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3201_c7_362d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3201_c7_362d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3201_c7_362d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3201_c7_362d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3201_c7_362d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3201_c7_362d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3178_c7_eeb0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3178_c7_eeb0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3178_c7_eeb0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3178_c7_eeb0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3178_c7_eeb0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3178_c7_eeb0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3178_c7_eeb0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3178_c7_eeb0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3178_c7_eeb0_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l3170_c7_68c6] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l3170_c7_68c6_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3170_c7_68c6_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l3170_c7_68c6_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3170_c7_68c6_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l3170_c7_68c6_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3170_c7_68c6_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3170_c7_68c6_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l3170_c7_68c6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3173_c7_11b4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3173_c7_11b4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3173_c7_11b4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3173_c7_11b4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3173_c7_11b4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3173_c7_11b4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3173_c7_11b4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3173_c7_11b4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3173_c7_11b4_return_output;

     -- Submodule level 5
     VAR_l16_MUX_uxn_opcodes_h_l3170_c7_68c6_iffalse := VAR_l16_MUX_uxn_opcodes_h_l3173_c7_11b4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l3155_c7_35c4_iffalse := VAR_n16_MUX_uxn_opcodes_h_l3158_c7_b019_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3197_c7_d1e9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3201_c7_362d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3170_c7_68c6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3173_c7_11b4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3166_c7_d0bf_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3170_c7_68c6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3197_c7_d1e9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3201_c7_362d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3173_c7_11b4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3178_c7_eeb0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3193_c7_e961_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3197_c7_d1e9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3197_c7_d1e9_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3201_c7_362d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3140_c7_c7d4_iffalse := VAR_t16_MUX_uxn_opcodes_h_l3143_c7_d22e_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3173_c7_11b4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3173_c7_11b4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3173_c7_11b4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3173_c7_11b4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3173_c7_11b4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3173_c7_11b4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3173_c7_11b4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3173_c7_11b4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3173_c7_11b4_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l3166_c7_d0bf] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l3166_c7_d0bf_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3166_c7_d0bf_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l3166_c7_d0bf_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3166_c7_d0bf_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l3166_c7_d0bf_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3166_c7_d0bf_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3166_c7_d0bf_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l3166_c7_d0bf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3197_c7_d1e9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3197_c7_d1e9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3197_c7_d1e9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3197_c7_d1e9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3197_c7_d1e9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3197_c7_d1e9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3197_c7_d1e9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3197_c7_d1e9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3197_c7_d1e9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3170_c7_68c6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3170_c7_68c6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3170_c7_68c6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3170_c7_68c6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3170_c7_68c6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3170_c7_68c6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3170_c7_68c6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3170_c7_68c6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3170_c7_68c6_return_output;

     -- t16_MUX[uxn_opcodes_h_l3140_c7_c7d4] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l3140_c7_c7d4_cond <= VAR_t16_MUX_uxn_opcodes_h_l3140_c7_c7d4_cond;
     t16_MUX_uxn_opcodes_h_l3140_c7_c7d4_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l3140_c7_c7d4_iftrue;
     t16_MUX_uxn_opcodes_h_l3140_c7_c7d4_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l3140_c7_c7d4_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l3140_c7_c7d4_return_output := t16_MUX_uxn_opcodes_h_l3140_c7_c7d4_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3197_c7_d1e9] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3197_c7_d1e9_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3197_c7_d1e9_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3197_c7_d1e9_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3197_c7_d1e9_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3197_c7_d1e9_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3197_c7_d1e9_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3197_c7_d1e9_return_output := result_stack_value_MUX_uxn_opcodes_h_l3197_c7_d1e9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3197_c7_d1e9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3197_c7_d1e9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3197_c7_d1e9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3197_c7_d1e9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3197_c7_d1e9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3197_c7_d1e9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3197_c7_d1e9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3197_c7_d1e9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3197_c7_d1e9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3193_c7_e961] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3193_c7_e961_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3193_c7_e961_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3193_c7_e961_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3193_c7_e961_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3193_c7_e961_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3193_c7_e961_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3193_c7_e961_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3193_c7_e961_return_output;

     -- l16_MUX[uxn_opcodes_h_l3170_c7_68c6] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l3170_c7_68c6_cond <= VAR_l16_MUX_uxn_opcodes_h_l3170_c7_68c6_cond;
     l16_MUX_uxn_opcodes_h_l3170_c7_68c6_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l3170_c7_68c6_iftrue;
     l16_MUX_uxn_opcodes_h_l3170_c7_68c6_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l3170_c7_68c6_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l3170_c7_68c6_return_output := l16_MUX_uxn_opcodes_h_l3170_c7_68c6_return_output;

     -- n16_MUX[uxn_opcodes_h_l3155_c7_35c4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l3155_c7_35c4_cond <= VAR_n16_MUX_uxn_opcodes_h_l3155_c7_35c4_cond;
     n16_MUX_uxn_opcodes_h_l3155_c7_35c4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l3155_c7_35c4_iftrue;
     n16_MUX_uxn_opcodes_h_l3155_c7_35c4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l3155_c7_35c4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l3155_c7_35c4_return_output := n16_MUX_uxn_opcodes_h_l3155_c7_35c4_return_output;

     -- Submodule level 6
     VAR_l16_MUX_uxn_opcodes_h_l3166_c7_d0bf_iffalse := VAR_l16_MUX_uxn_opcodes_h_l3170_c7_68c6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l3151_c7_b003_iffalse := VAR_n16_MUX_uxn_opcodes_h_l3155_c7_35c4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3193_c7_e961_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3197_c7_d1e9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3166_c7_d0bf_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3170_c7_68c6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3163_c7_4fee_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3166_c7_d0bf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3193_c7_e961_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3197_c7_d1e9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3170_c7_68c6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3173_c7_11b4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3187_c7_dba2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3193_c7_e961_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3193_c7_e961_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3197_c7_d1e9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3134_c2_4d74_iffalse := VAR_t16_MUX_uxn_opcodes_h_l3140_c7_c7d4_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l3193_c7_e961] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3193_c7_e961_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3193_c7_e961_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3193_c7_e961_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3193_c7_e961_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3193_c7_e961_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3193_c7_e961_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3193_c7_e961_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3193_c7_e961_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3193_c7_e961] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3193_c7_e961_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3193_c7_e961_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3193_c7_e961_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3193_c7_e961_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3193_c7_e961_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3193_c7_e961_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3193_c7_e961_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3193_c7_e961_return_output;

     -- n16_MUX[uxn_opcodes_h_l3151_c7_b003] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l3151_c7_b003_cond <= VAR_n16_MUX_uxn_opcodes_h_l3151_c7_b003_cond;
     n16_MUX_uxn_opcodes_h_l3151_c7_b003_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l3151_c7_b003_iftrue;
     n16_MUX_uxn_opcodes_h_l3151_c7_b003_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l3151_c7_b003_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l3151_c7_b003_return_output := n16_MUX_uxn_opcodes_h_l3151_c7_b003_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3187_c7_dba2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3187_c7_dba2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3187_c7_dba2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3187_c7_dba2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3187_c7_dba2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3187_c7_dba2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3187_c7_dba2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3187_c7_dba2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3187_c7_dba2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3166_c7_d0bf] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3166_c7_d0bf_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3166_c7_d0bf_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3166_c7_d0bf_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3166_c7_d0bf_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3166_c7_d0bf_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3166_c7_d0bf_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3166_c7_d0bf_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3166_c7_d0bf_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3193_c7_e961] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3193_c7_e961_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3193_c7_e961_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3193_c7_e961_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3193_c7_e961_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3193_c7_e961_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3193_c7_e961_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3193_c7_e961_return_output := result_stack_value_MUX_uxn_opcodes_h_l3193_c7_e961_return_output;

     -- t16_MUX[uxn_opcodes_h_l3134_c2_4d74] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l3134_c2_4d74_cond <= VAR_t16_MUX_uxn_opcodes_h_l3134_c2_4d74_cond;
     t16_MUX_uxn_opcodes_h_l3134_c2_4d74_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l3134_c2_4d74_iftrue;
     t16_MUX_uxn_opcodes_h_l3134_c2_4d74_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l3134_c2_4d74_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l3134_c2_4d74_return_output := t16_MUX_uxn_opcodes_h_l3134_c2_4d74_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3170_c7_68c6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3170_c7_68c6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3170_c7_68c6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3170_c7_68c6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3170_c7_68c6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3170_c7_68c6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3170_c7_68c6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3170_c7_68c6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3170_c7_68c6_return_output;

     -- l16_MUX[uxn_opcodes_h_l3166_c7_d0bf] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l3166_c7_d0bf_cond <= VAR_l16_MUX_uxn_opcodes_h_l3166_c7_d0bf_cond;
     l16_MUX_uxn_opcodes_h_l3166_c7_d0bf_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l3166_c7_d0bf_iftrue;
     l16_MUX_uxn_opcodes_h_l3166_c7_d0bf_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l3166_c7_d0bf_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l3166_c7_d0bf_return_output := l16_MUX_uxn_opcodes_h_l3166_c7_d0bf_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l3163_c7_4fee] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l3163_c7_4fee_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3163_c7_4fee_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l3163_c7_4fee_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3163_c7_4fee_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l3163_c7_4fee_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3163_c7_4fee_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3163_c7_4fee_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l3163_c7_4fee_return_output;

     -- Submodule level 7
     VAR_l16_MUX_uxn_opcodes_h_l3163_c7_4fee_iffalse := VAR_l16_MUX_uxn_opcodes_h_l3166_c7_d0bf_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l3148_c7_15d3_iffalse := VAR_n16_MUX_uxn_opcodes_h_l3151_c7_b003_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3187_c7_dba2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3193_c7_e961_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3163_c7_4fee_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3166_c7_d0bf_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3158_c7_b019_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3163_c7_4fee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3187_c7_dba2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3193_c7_e961_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3166_c7_d0bf_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3170_c7_68c6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3181_c7_557e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3187_c7_dba2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3187_c7_dba2_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3193_c7_e961_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l3134_c2_4d74_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3163_c7_4fee] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3163_c7_4fee_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3163_c7_4fee_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3163_c7_4fee_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3163_c7_4fee_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3163_c7_4fee_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3163_c7_4fee_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3163_c7_4fee_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3163_c7_4fee_return_output;

     -- l16_MUX[uxn_opcodes_h_l3163_c7_4fee] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l3163_c7_4fee_cond <= VAR_l16_MUX_uxn_opcodes_h_l3163_c7_4fee_cond;
     l16_MUX_uxn_opcodes_h_l3163_c7_4fee_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l3163_c7_4fee_iftrue;
     l16_MUX_uxn_opcodes_h_l3163_c7_4fee_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l3163_c7_4fee_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l3163_c7_4fee_return_output := l16_MUX_uxn_opcodes_h_l3163_c7_4fee_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3187_c7_dba2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3187_c7_dba2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3187_c7_dba2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3187_c7_dba2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3187_c7_dba2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3187_c7_dba2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3187_c7_dba2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3187_c7_dba2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3187_c7_dba2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3166_c7_d0bf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3166_c7_d0bf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3166_c7_d0bf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3166_c7_d0bf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3166_c7_d0bf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3166_c7_d0bf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3166_c7_d0bf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3166_c7_d0bf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3166_c7_d0bf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3187_c7_dba2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3187_c7_dba2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3187_c7_dba2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3187_c7_dba2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3187_c7_dba2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3187_c7_dba2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3187_c7_dba2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3187_c7_dba2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3187_c7_dba2_return_output;

     -- n16_MUX[uxn_opcodes_h_l3148_c7_15d3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l3148_c7_15d3_cond <= VAR_n16_MUX_uxn_opcodes_h_l3148_c7_15d3_cond;
     n16_MUX_uxn_opcodes_h_l3148_c7_15d3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l3148_c7_15d3_iftrue;
     n16_MUX_uxn_opcodes_h_l3148_c7_15d3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l3148_c7_15d3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l3148_c7_15d3_return_output := n16_MUX_uxn_opcodes_h_l3148_c7_15d3_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l3158_c7_b019] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l3158_c7_b019_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3158_c7_b019_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l3158_c7_b019_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3158_c7_b019_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l3158_c7_b019_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3158_c7_b019_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3158_c7_b019_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l3158_c7_b019_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3181_c7_557e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3181_c7_557e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3181_c7_557e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3181_c7_557e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3181_c7_557e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3181_c7_557e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3181_c7_557e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3181_c7_557e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3181_c7_557e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3187_c7_dba2] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3187_c7_dba2_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3187_c7_dba2_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3187_c7_dba2_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3187_c7_dba2_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3187_c7_dba2_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3187_c7_dba2_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3187_c7_dba2_return_output := result_stack_value_MUX_uxn_opcodes_h_l3187_c7_dba2_return_output;

     -- Submodule level 8
     VAR_l16_MUX_uxn_opcodes_h_l3158_c7_b019_iffalse := VAR_l16_MUX_uxn_opcodes_h_l3163_c7_4fee_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l3143_c7_d22e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l3148_c7_15d3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3181_c7_557e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3187_c7_dba2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3158_c7_b019_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3163_c7_4fee_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3155_c7_35c4_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3158_c7_b019_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3181_c7_557e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3187_c7_dba2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3163_c7_4fee_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3166_c7_d0bf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3178_c7_eeb0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3181_c7_557e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3181_c7_557e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3187_c7_dba2_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l3181_c7_557e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3181_c7_557e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3181_c7_557e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3181_c7_557e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3181_c7_557e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3181_c7_557e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3181_c7_557e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3181_c7_557e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3181_c7_557e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3181_c7_557e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3181_c7_557e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3181_c7_557e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3181_c7_557e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3181_c7_557e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3181_c7_557e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3181_c7_557e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3181_c7_557e_return_output := result_stack_value_MUX_uxn_opcodes_h_l3181_c7_557e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3158_c7_b019] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3158_c7_b019_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3158_c7_b019_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3158_c7_b019_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3158_c7_b019_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3158_c7_b019_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3158_c7_b019_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3158_c7_b019_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3158_c7_b019_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l3155_c7_35c4] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l3155_c7_35c4_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3155_c7_35c4_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l3155_c7_35c4_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3155_c7_35c4_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l3155_c7_35c4_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3155_c7_35c4_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3155_c7_35c4_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l3155_c7_35c4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3181_c7_557e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3181_c7_557e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3181_c7_557e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3181_c7_557e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3181_c7_557e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3181_c7_557e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3181_c7_557e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3181_c7_557e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3181_c7_557e_return_output;

     -- n16_MUX[uxn_opcodes_h_l3143_c7_d22e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l3143_c7_d22e_cond <= VAR_n16_MUX_uxn_opcodes_h_l3143_c7_d22e_cond;
     n16_MUX_uxn_opcodes_h_l3143_c7_d22e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l3143_c7_d22e_iftrue;
     n16_MUX_uxn_opcodes_h_l3143_c7_d22e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l3143_c7_d22e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l3143_c7_d22e_return_output := n16_MUX_uxn_opcodes_h_l3143_c7_d22e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3178_c7_eeb0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3178_c7_eeb0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3178_c7_eeb0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3178_c7_eeb0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3178_c7_eeb0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3178_c7_eeb0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3178_c7_eeb0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3178_c7_eeb0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3178_c7_eeb0_return_output;

     -- l16_MUX[uxn_opcodes_h_l3158_c7_b019] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l3158_c7_b019_cond <= VAR_l16_MUX_uxn_opcodes_h_l3158_c7_b019_cond;
     l16_MUX_uxn_opcodes_h_l3158_c7_b019_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l3158_c7_b019_iftrue;
     l16_MUX_uxn_opcodes_h_l3158_c7_b019_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l3158_c7_b019_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l3158_c7_b019_return_output := l16_MUX_uxn_opcodes_h_l3158_c7_b019_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3163_c7_4fee] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3163_c7_4fee_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3163_c7_4fee_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3163_c7_4fee_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3163_c7_4fee_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3163_c7_4fee_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3163_c7_4fee_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3163_c7_4fee_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3163_c7_4fee_return_output;

     -- Submodule level 9
     VAR_l16_MUX_uxn_opcodes_h_l3155_c7_35c4_iffalse := VAR_l16_MUX_uxn_opcodes_h_l3158_c7_b019_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l3140_c7_c7d4_iffalse := VAR_n16_MUX_uxn_opcodes_h_l3143_c7_d22e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3178_c7_eeb0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3181_c7_557e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3155_c7_35c4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3158_c7_b019_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3151_c7_b003_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3155_c7_35c4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3178_c7_eeb0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3181_c7_557e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3158_c7_b019_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3163_c7_4fee_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3173_c7_11b4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3178_c7_eeb0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3178_c7_eeb0_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3181_c7_557e_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3173_c7_11b4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3173_c7_11b4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3173_c7_11b4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3173_c7_11b4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3173_c7_11b4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3173_c7_11b4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3173_c7_11b4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3173_c7_11b4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3173_c7_11b4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3158_c7_b019] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3158_c7_b019_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3158_c7_b019_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3158_c7_b019_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3158_c7_b019_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3158_c7_b019_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3158_c7_b019_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3158_c7_b019_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3158_c7_b019_return_output;

     -- l16_MUX[uxn_opcodes_h_l3155_c7_35c4] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l3155_c7_35c4_cond <= VAR_l16_MUX_uxn_opcodes_h_l3155_c7_35c4_cond;
     l16_MUX_uxn_opcodes_h_l3155_c7_35c4_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l3155_c7_35c4_iftrue;
     l16_MUX_uxn_opcodes_h_l3155_c7_35c4_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l3155_c7_35c4_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l3155_c7_35c4_return_output := l16_MUX_uxn_opcodes_h_l3155_c7_35c4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3155_c7_35c4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3155_c7_35c4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3155_c7_35c4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3155_c7_35c4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3155_c7_35c4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3155_c7_35c4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3155_c7_35c4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3155_c7_35c4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3155_c7_35c4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3178_c7_eeb0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3178_c7_eeb0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3178_c7_eeb0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3178_c7_eeb0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3178_c7_eeb0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3178_c7_eeb0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3178_c7_eeb0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3178_c7_eeb0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3178_c7_eeb0_return_output;

     -- n16_MUX[uxn_opcodes_h_l3140_c7_c7d4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l3140_c7_c7d4_cond <= VAR_n16_MUX_uxn_opcodes_h_l3140_c7_c7d4_cond;
     n16_MUX_uxn_opcodes_h_l3140_c7_c7d4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l3140_c7_c7d4_iftrue;
     n16_MUX_uxn_opcodes_h_l3140_c7_c7d4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l3140_c7_c7d4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l3140_c7_c7d4_return_output := n16_MUX_uxn_opcodes_h_l3140_c7_c7d4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3178_c7_eeb0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3178_c7_eeb0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3178_c7_eeb0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3178_c7_eeb0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3178_c7_eeb0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3178_c7_eeb0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3178_c7_eeb0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3178_c7_eeb0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3178_c7_eeb0_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l3151_c7_b003] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l3151_c7_b003_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3151_c7_b003_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l3151_c7_b003_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3151_c7_b003_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l3151_c7_b003_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3151_c7_b003_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3151_c7_b003_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l3151_c7_b003_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3178_c7_eeb0] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3178_c7_eeb0_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3178_c7_eeb0_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3178_c7_eeb0_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3178_c7_eeb0_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3178_c7_eeb0_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3178_c7_eeb0_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3178_c7_eeb0_return_output := result_stack_value_MUX_uxn_opcodes_h_l3178_c7_eeb0_return_output;

     -- Submodule level 10
     VAR_l16_MUX_uxn_opcodes_h_l3151_c7_b003_iffalse := VAR_l16_MUX_uxn_opcodes_h_l3155_c7_35c4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l3134_c2_4d74_iffalse := VAR_n16_MUX_uxn_opcodes_h_l3140_c7_c7d4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3173_c7_11b4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3178_c7_eeb0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3151_c7_b003_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3155_c7_35c4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3148_c7_15d3_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3151_c7_b003_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3173_c7_11b4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3178_c7_eeb0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3155_c7_35c4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3158_c7_b019_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3170_c7_68c6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3173_c7_11b4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3173_c7_11b4_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3178_c7_eeb0_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3170_c7_68c6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3170_c7_68c6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3170_c7_68c6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3170_c7_68c6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3170_c7_68c6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3170_c7_68c6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3170_c7_68c6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3170_c7_68c6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3170_c7_68c6_return_output;

     -- n16_MUX[uxn_opcodes_h_l3134_c2_4d74] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l3134_c2_4d74_cond <= VAR_n16_MUX_uxn_opcodes_h_l3134_c2_4d74_cond;
     n16_MUX_uxn_opcodes_h_l3134_c2_4d74_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l3134_c2_4d74_iftrue;
     n16_MUX_uxn_opcodes_h_l3134_c2_4d74_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l3134_c2_4d74_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l3134_c2_4d74_return_output := n16_MUX_uxn_opcodes_h_l3134_c2_4d74_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3173_c7_11b4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3173_c7_11b4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3173_c7_11b4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3173_c7_11b4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3173_c7_11b4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3173_c7_11b4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3173_c7_11b4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3173_c7_11b4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3173_c7_11b4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3155_c7_35c4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3155_c7_35c4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3155_c7_35c4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3155_c7_35c4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3155_c7_35c4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3155_c7_35c4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3155_c7_35c4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3155_c7_35c4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3155_c7_35c4_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l3148_c7_15d3] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l3148_c7_15d3_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3148_c7_15d3_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l3148_c7_15d3_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3148_c7_15d3_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l3148_c7_15d3_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3148_c7_15d3_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3148_c7_15d3_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l3148_c7_15d3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3151_c7_b003] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3151_c7_b003_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3151_c7_b003_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3151_c7_b003_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3151_c7_b003_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3151_c7_b003_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3151_c7_b003_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3151_c7_b003_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3151_c7_b003_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3173_c7_11b4] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3173_c7_11b4_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3173_c7_11b4_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3173_c7_11b4_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3173_c7_11b4_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3173_c7_11b4_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3173_c7_11b4_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3173_c7_11b4_return_output := result_stack_value_MUX_uxn_opcodes_h_l3173_c7_11b4_return_output;

     -- l16_MUX[uxn_opcodes_h_l3151_c7_b003] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l3151_c7_b003_cond <= VAR_l16_MUX_uxn_opcodes_h_l3151_c7_b003_cond;
     l16_MUX_uxn_opcodes_h_l3151_c7_b003_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l3151_c7_b003_iftrue;
     l16_MUX_uxn_opcodes_h_l3151_c7_b003_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l3151_c7_b003_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l3151_c7_b003_return_output := l16_MUX_uxn_opcodes_h_l3151_c7_b003_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3173_c7_11b4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3173_c7_11b4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3173_c7_11b4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3173_c7_11b4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3173_c7_11b4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3173_c7_11b4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3173_c7_11b4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3173_c7_11b4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3173_c7_11b4_return_output;

     -- Submodule level 11
     VAR_l16_MUX_uxn_opcodes_h_l3148_c7_15d3_iffalse := VAR_l16_MUX_uxn_opcodes_h_l3151_c7_b003_return_output;
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l3134_c2_4d74_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3170_c7_68c6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3173_c7_11b4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3148_c7_15d3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3151_c7_b003_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3143_c7_d22e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3148_c7_15d3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3170_c7_68c6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3173_c7_11b4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3151_c7_b003_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3155_c7_35c4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3166_c7_d0bf_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3170_c7_68c6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3170_c7_68c6_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3173_c7_11b4_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3148_c7_15d3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3148_c7_15d3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3148_c7_15d3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3148_c7_15d3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3148_c7_15d3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3148_c7_15d3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3148_c7_15d3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3148_c7_15d3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3148_c7_15d3_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l3143_c7_d22e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l3143_c7_d22e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3143_c7_d22e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l3143_c7_d22e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3143_c7_d22e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l3143_c7_d22e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3143_c7_d22e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3143_c7_d22e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l3143_c7_d22e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3151_c7_b003] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3151_c7_b003_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3151_c7_b003_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3151_c7_b003_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3151_c7_b003_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3151_c7_b003_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3151_c7_b003_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3151_c7_b003_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3151_c7_b003_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3170_c7_68c6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3170_c7_68c6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3170_c7_68c6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3170_c7_68c6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3170_c7_68c6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3170_c7_68c6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3170_c7_68c6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3170_c7_68c6_return_output := result_stack_value_MUX_uxn_opcodes_h_l3170_c7_68c6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3166_c7_d0bf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3166_c7_d0bf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3166_c7_d0bf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3166_c7_d0bf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3166_c7_d0bf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3166_c7_d0bf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3166_c7_d0bf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3166_c7_d0bf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3166_c7_d0bf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3170_c7_68c6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3170_c7_68c6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3170_c7_68c6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3170_c7_68c6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3170_c7_68c6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3170_c7_68c6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3170_c7_68c6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3170_c7_68c6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3170_c7_68c6_return_output;

     -- l16_MUX[uxn_opcodes_h_l3148_c7_15d3] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l3148_c7_15d3_cond <= VAR_l16_MUX_uxn_opcodes_h_l3148_c7_15d3_cond;
     l16_MUX_uxn_opcodes_h_l3148_c7_15d3_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l3148_c7_15d3_iftrue;
     l16_MUX_uxn_opcodes_h_l3148_c7_15d3_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l3148_c7_15d3_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l3148_c7_15d3_return_output := l16_MUX_uxn_opcodes_h_l3148_c7_15d3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3170_c7_68c6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3170_c7_68c6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3170_c7_68c6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3170_c7_68c6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3170_c7_68c6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3170_c7_68c6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3170_c7_68c6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3170_c7_68c6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3170_c7_68c6_return_output;

     -- Submodule level 12
     VAR_l16_MUX_uxn_opcodes_h_l3143_c7_d22e_iffalse := VAR_l16_MUX_uxn_opcodes_h_l3148_c7_15d3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3166_c7_d0bf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3170_c7_68c6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3143_c7_d22e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3148_c7_15d3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3140_c7_c7d4_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3143_c7_d22e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3166_c7_d0bf_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3170_c7_68c6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3148_c7_15d3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3151_c7_b003_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3163_c7_4fee_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3166_c7_d0bf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3166_c7_d0bf_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3170_c7_68c6_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3143_c7_d22e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3143_c7_d22e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3143_c7_d22e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3143_c7_d22e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3143_c7_d22e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3143_c7_d22e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3143_c7_d22e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3143_c7_d22e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3143_c7_d22e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3163_c7_4fee] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3163_c7_4fee_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3163_c7_4fee_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3163_c7_4fee_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3163_c7_4fee_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3163_c7_4fee_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3163_c7_4fee_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3163_c7_4fee_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3163_c7_4fee_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3148_c7_15d3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3148_c7_15d3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3148_c7_15d3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3148_c7_15d3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3148_c7_15d3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3148_c7_15d3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3148_c7_15d3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3148_c7_15d3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3148_c7_15d3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3166_c7_d0bf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3166_c7_d0bf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3166_c7_d0bf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3166_c7_d0bf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3166_c7_d0bf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3166_c7_d0bf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3166_c7_d0bf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3166_c7_d0bf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3166_c7_d0bf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3166_c7_d0bf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3166_c7_d0bf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3166_c7_d0bf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3166_c7_d0bf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3166_c7_d0bf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3166_c7_d0bf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3166_c7_d0bf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3166_c7_d0bf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3166_c7_d0bf_return_output;

     -- l16_MUX[uxn_opcodes_h_l3143_c7_d22e] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l3143_c7_d22e_cond <= VAR_l16_MUX_uxn_opcodes_h_l3143_c7_d22e_cond;
     l16_MUX_uxn_opcodes_h_l3143_c7_d22e_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l3143_c7_d22e_iftrue;
     l16_MUX_uxn_opcodes_h_l3143_c7_d22e_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l3143_c7_d22e_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l3143_c7_d22e_return_output := l16_MUX_uxn_opcodes_h_l3143_c7_d22e_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l3140_c7_c7d4] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l3140_c7_c7d4_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3140_c7_c7d4_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l3140_c7_c7d4_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3140_c7_c7d4_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l3140_c7_c7d4_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3140_c7_c7d4_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3140_c7_c7d4_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l3140_c7_c7d4_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3166_c7_d0bf] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3166_c7_d0bf_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3166_c7_d0bf_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3166_c7_d0bf_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3166_c7_d0bf_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3166_c7_d0bf_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3166_c7_d0bf_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3166_c7_d0bf_return_output := result_stack_value_MUX_uxn_opcodes_h_l3166_c7_d0bf_return_output;

     -- Submodule level 13
     VAR_l16_MUX_uxn_opcodes_h_l3140_c7_c7d4_iffalse := VAR_l16_MUX_uxn_opcodes_h_l3143_c7_d22e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3163_c7_4fee_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3166_c7_d0bf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3140_c7_c7d4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3143_c7_d22e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3134_c2_4d74_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3140_c7_c7d4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3163_c7_4fee_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3166_c7_d0bf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3143_c7_d22e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3148_c7_15d3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3158_c7_b019_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3163_c7_4fee_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3163_c7_4fee_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3166_c7_d0bf_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3140_c7_c7d4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3140_c7_c7d4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3140_c7_c7d4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3140_c7_c7d4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3140_c7_c7d4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3140_c7_c7d4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3140_c7_c7d4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3140_c7_c7d4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3140_c7_c7d4_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3163_c7_4fee] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3163_c7_4fee_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3163_c7_4fee_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3163_c7_4fee_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3163_c7_4fee_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3163_c7_4fee_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3163_c7_4fee_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3163_c7_4fee_return_output := result_stack_value_MUX_uxn_opcodes_h_l3163_c7_4fee_return_output;

     -- l16_MUX[uxn_opcodes_h_l3140_c7_c7d4] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l3140_c7_c7d4_cond <= VAR_l16_MUX_uxn_opcodes_h_l3140_c7_c7d4_cond;
     l16_MUX_uxn_opcodes_h_l3140_c7_c7d4_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l3140_c7_c7d4_iftrue;
     l16_MUX_uxn_opcodes_h_l3140_c7_c7d4_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l3140_c7_c7d4_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l3140_c7_c7d4_return_output := l16_MUX_uxn_opcodes_h_l3140_c7_c7d4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3158_c7_b019] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3158_c7_b019_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3158_c7_b019_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3158_c7_b019_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3158_c7_b019_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3158_c7_b019_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3158_c7_b019_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3158_c7_b019_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3158_c7_b019_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l3134_c2_4d74] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l3134_c2_4d74_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3134_c2_4d74_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l3134_c2_4d74_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3134_c2_4d74_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l3134_c2_4d74_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3134_c2_4d74_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3134_c2_4d74_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l3134_c2_4d74_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3163_c7_4fee] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3163_c7_4fee_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3163_c7_4fee_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3163_c7_4fee_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3163_c7_4fee_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3163_c7_4fee_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3163_c7_4fee_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3163_c7_4fee_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3163_c7_4fee_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3143_c7_d22e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3143_c7_d22e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3143_c7_d22e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3143_c7_d22e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3143_c7_d22e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3143_c7_d22e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3143_c7_d22e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3143_c7_d22e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3143_c7_d22e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3163_c7_4fee] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3163_c7_4fee_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3163_c7_4fee_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3163_c7_4fee_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3163_c7_4fee_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3163_c7_4fee_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3163_c7_4fee_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3163_c7_4fee_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3163_c7_4fee_return_output;

     -- Submodule level 14
     VAR_l16_MUX_uxn_opcodes_h_l3134_c2_4d74_iffalse := VAR_l16_MUX_uxn_opcodes_h_l3140_c7_c7d4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3158_c7_b019_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3163_c7_4fee_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3134_c2_4d74_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3140_c7_c7d4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3158_c7_b019_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3163_c7_4fee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3140_c7_c7d4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3143_c7_d22e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3155_c7_35c4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3158_c7_b019_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3158_c7_b019_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3163_c7_4fee_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l3158_c7_b019] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3158_c7_b019_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3158_c7_b019_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3158_c7_b019_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3158_c7_b019_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3158_c7_b019_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3158_c7_b019_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3158_c7_b019_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3158_c7_b019_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3155_c7_35c4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3155_c7_35c4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3155_c7_35c4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3155_c7_35c4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3155_c7_35c4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3155_c7_35c4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3155_c7_35c4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3155_c7_35c4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3155_c7_35c4_return_output;

     -- l16_MUX[uxn_opcodes_h_l3134_c2_4d74] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l3134_c2_4d74_cond <= VAR_l16_MUX_uxn_opcodes_h_l3134_c2_4d74_cond;
     l16_MUX_uxn_opcodes_h_l3134_c2_4d74_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l3134_c2_4d74_iftrue;
     l16_MUX_uxn_opcodes_h_l3134_c2_4d74_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l3134_c2_4d74_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l3134_c2_4d74_return_output := l16_MUX_uxn_opcodes_h_l3134_c2_4d74_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3134_c2_4d74] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3134_c2_4d74_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3134_c2_4d74_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3134_c2_4d74_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3134_c2_4d74_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3134_c2_4d74_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3134_c2_4d74_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3134_c2_4d74_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3134_c2_4d74_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3158_c7_b019] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3158_c7_b019_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3158_c7_b019_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3158_c7_b019_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3158_c7_b019_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3158_c7_b019_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3158_c7_b019_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3158_c7_b019_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3158_c7_b019_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3158_c7_b019] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3158_c7_b019_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3158_c7_b019_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3158_c7_b019_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3158_c7_b019_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3158_c7_b019_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3158_c7_b019_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3158_c7_b019_return_output := result_stack_value_MUX_uxn_opcodes_h_l3158_c7_b019_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3140_c7_c7d4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3140_c7_c7d4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3140_c7_c7d4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3140_c7_c7d4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3140_c7_c7d4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3140_c7_c7d4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3140_c7_c7d4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3140_c7_c7d4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3140_c7_c7d4_return_output;

     -- Submodule level 15
     REG_VAR_l16 := VAR_l16_MUX_uxn_opcodes_h_l3134_c2_4d74_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3155_c7_35c4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3158_c7_b019_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3155_c7_35c4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3158_c7_b019_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3134_c2_4d74_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3140_c7_c7d4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3151_c7_b003_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3155_c7_35c4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3155_c7_35c4_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3158_c7_b019_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l3155_c7_35c4] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3155_c7_35c4_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3155_c7_35c4_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3155_c7_35c4_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3155_c7_35c4_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3155_c7_35c4_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3155_c7_35c4_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3155_c7_35c4_return_output := result_stack_value_MUX_uxn_opcodes_h_l3155_c7_35c4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3155_c7_35c4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3155_c7_35c4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3155_c7_35c4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3155_c7_35c4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3155_c7_35c4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3155_c7_35c4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3155_c7_35c4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3155_c7_35c4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3155_c7_35c4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3151_c7_b003] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3151_c7_b003_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3151_c7_b003_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3151_c7_b003_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3151_c7_b003_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3151_c7_b003_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3151_c7_b003_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3151_c7_b003_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3151_c7_b003_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3134_c2_4d74] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3134_c2_4d74_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3134_c2_4d74_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3134_c2_4d74_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3134_c2_4d74_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3134_c2_4d74_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3134_c2_4d74_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3134_c2_4d74_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3134_c2_4d74_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3155_c7_35c4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3155_c7_35c4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3155_c7_35c4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3155_c7_35c4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3155_c7_35c4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3155_c7_35c4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3155_c7_35c4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3155_c7_35c4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3155_c7_35c4_return_output;

     -- Submodule level 16
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3151_c7_b003_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3155_c7_35c4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3151_c7_b003_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3155_c7_35c4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3148_c7_15d3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3151_c7_b003_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3151_c7_b003_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3155_c7_35c4_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3148_c7_15d3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3148_c7_15d3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3148_c7_15d3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3148_c7_15d3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3148_c7_15d3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3148_c7_15d3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3148_c7_15d3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3148_c7_15d3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3148_c7_15d3_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3151_c7_b003] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3151_c7_b003_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3151_c7_b003_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3151_c7_b003_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3151_c7_b003_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3151_c7_b003_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3151_c7_b003_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3151_c7_b003_return_output := result_stack_value_MUX_uxn_opcodes_h_l3151_c7_b003_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3151_c7_b003] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3151_c7_b003_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3151_c7_b003_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3151_c7_b003_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3151_c7_b003_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3151_c7_b003_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3151_c7_b003_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3151_c7_b003_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3151_c7_b003_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3151_c7_b003] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3151_c7_b003_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3151_c7_b003_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3151_c7_b003_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3151_c7_b003_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3151_c7_b003_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3151_c7_b003_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3151_c7_b003_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3151_c7_b003_return_output;

     -- Submodule level 17
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3148_c7_15d3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3151_c7_b003_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3148_c7_15d3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3151_c7_b003_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3143_c7_d22e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3148_c7_15d3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3148_c7_15d3_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3151_c7_b003_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l3148_c7_15d3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3148_c7_15d3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3148_c7_15d3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3148_c7_15d3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3148_c7_15d3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3148_c7_15d3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3148_c7_15d3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3148_c7_15d3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3148_c7_15d3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3148_c7_15d3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3148_c7_15d3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3148_c7_15d3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3148_c7_15d3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3148_c7_15d3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3148_c7_15d3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3148_c7_15d3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3148_c7_15d3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3148_c7_15d3_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3148_c7_15d3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3148_c7_15d3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3148_c7_15d3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3148_c7_15d3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3148_c7_15d3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3148_c7_15d3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3148_c7_15d3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3148_c7_15d3_return_output := result_stack_value_MUX_uxn_opcodes_h_l3148_c7_15d3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3143_c7_d22e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3143_c7_d22e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3143_c7_d22e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3143_c7_d22e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3143_c7_d22e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3143_c7_d22e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3143_c7_d22e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3143_c7_d22e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3143_c7_d22e_return_output;

     -- Submodule level 18
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3143_c7_d22e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3148_c7_15d3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3143_c7_d22e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3148_c7_15d3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3140_c7_c7d4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3143_c7_d22e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3143_c7_d22e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3148_c7_15d3_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l3143_c7_d22e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3143_c7_d22e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3143_c7_d22e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3143_c7_d22e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3143_c7_d22e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3143_c7_d22e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3143_c7_d22e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3143_c7_d22e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3143_c7_d22e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3140_c7_c7d4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3140_c7_c7d4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3140_c7_c7d4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3140_c7_c7d4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3140_c7_c7d4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3140_c7_c7d4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3140_c7_c7d4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3140_c7_c7d4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3140_c7_c7d4_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3143_c7_d22e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3143_c7_d22e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3143_c7_d22e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3143_c7_d22e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3143_c7_d22e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3143_c7_d22e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3143_c7_d22e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3143_c7_d22e_return_output := result_stack_value_MUX_uxn_opcodes_h_l3143_c7_d22e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3143_c7_d22e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3143_c7_d22e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3143_c7_d22e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3143_c7_d22e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3143_c7_d22e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3143_c7_d22e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3143_c7_d22e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3143_c7_d22e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3143_c7_d22e_return_output;

     -- Submodule level 19
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3140_c7_c7d4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3143_c7_d22e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3140_c7_c7d4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3143_c7_d22e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3134_c2_4d74_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3140_c7_c7d4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3140_c7_c7d4_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3143_c7_d22e_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3134_c2_4d74] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3134_c2_4d74_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3134_c2_4d74_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3134_c2_4d74_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3134_c2_4d74_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3134_c2_4d74_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3134_c2_4d74_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3134_c2_4d74_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3134_c2_4d74_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3140_c7_c7d4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3140_c7_c7d4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3140_c7_c7d4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3140_c7_c7d4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3140_c7_c7d4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3140_c7_c7d4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3140_c7_c7d4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3140_c7_c7d4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3140_c7_c7d4_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3140_c7_c7d4] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3140_c7_c7d4_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3140_c7_c7d4_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3140_c7_c7d4_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3140_c7_c7d4_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3140_c7_c7d4_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3140_c7_c7d4_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3140_c7_c7d4_return_output := result_stack_value_MUX_uxn_opcodes_h_l3140_c7_c7d4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3140_c7_c7d4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3140_c7_c7d4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3140_c7_c7d4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3140_c7_c7d4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3140_c7_c7d4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3140_c7_c7d4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3140_c7_c7d4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3140_c7_c7d4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3140_c7_c7d4_return_output;

     -- Submodule level 20
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3134_c2_4d74_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3140_c7_c7d4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3134_c2_4d74_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3140_c7_c7d4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3134_c2_4d74_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3140_c7_c7d4_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l3134_c2_4d74] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3134_c2_4d74_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3134_c2_4d74_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3134_c2_4d74_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3134_c2_4d74_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3134_c2_4d74_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3134_c2_4d74_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3134_c2_4d74_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3134_c2_4d74_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3134_c2_4d74] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3134_c2_4d74_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3134_c2_4d74_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3134_c2_4d74_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3134_c2_4d74_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3134_c2_4d74_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3134_c2_4d74_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3134_c2_4d74_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3134_c2_4d74_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3134_c2_4d74] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3134_c2_4d74_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3134_c2_4d74_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3134_c2_4d74_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3134_c2_4d74_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3134_c2_4d74_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3134_c2_4d74_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3134_c2_4d74_return_output := result_stack_value_MUX_uxn_opcodes_h_l3134_c2_4d74_return_output;

     -- Submodule level 21
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l3218_l3130_DUPLICATE_ff30 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l3218_l3130_DUPLICATE_ff30_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_287e(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3134_c2_4d74_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3134_c2_4d74_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3134_c2_4d74_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3134_c2_4d74_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3134_c2_4d74_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3134_c2_4d74_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3134_c2_4d74_return_output);

     -- Submodule level 22
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l3218_l3130_DUPLICATE_ff30_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l3218_l3130_DUPLICATE_ff30_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_l16 <= REG_VAR_l16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     l16 <= REG_COMB_l16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
