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
-- BIN_OP_EQ[uxn_opcodes_h_l3062_c6_d47c]
signal BIN_OP_EQ_uxn_opcodes_h_l3062_c6_d47c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3062_c6_d47c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3062_c6_d47c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3062_c1_d798]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_d798_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_d798_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_d798_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_d798_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l3062_c2_8cc9]
signal n16_MUX_uxn_opcodes_h_l3062_c2_8cc9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l3062_c2_8cc9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l3062_c2_8cc9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l3062_c2_8cc9_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3062_c2_8cc9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3062_c2_8cc9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3062_c2_8cc9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3062_c2_8cc9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3062_c2_8cc9_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l3062_c2_8cc9]
signal result_is_stack_read_MUX_uxn_opcodes_h_l3062_c2_8cc9_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3062_c2_8cc9_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3062_c2_8cc9_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3062_c2_8cc9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3062_c2_8cc9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3062_c2_8cc9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3062_c2_8cc9_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3062_c2_8cc9_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3062_c2_8cc9_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3062_c2_8cc9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3062_c2_8cc9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3062_c2_8cc9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3062_c2_8cc9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3062_c2_8cc9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3062_c2_8cc9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3062_c2_8cc9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3062_c2_8cc9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3062_c2_8cc9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3062_c2_8cc9_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3062_c2_8cc9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3062_c2_8cc9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3062_c2_8cc9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3062_c2_8cc9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3062_c2_8cc9_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3062_c2_8cc9]
signal result_stack_value_MUX_uxn_opcodes_h_l3062_c2_8cc9_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3062_c2_8cc9_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3062_c2_8cc9_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3062_c2_8cc9_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l3062_c2_8cc9]
signal t16_MUX_uxn_opcodes_h_l3062_c2_8cc9_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l3062_c2_8cc9_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3062_c2_8cc9_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3062_c2_8cc9_return_output : unsigned(15 downto 0);

-- l16_MUX[uxn_opcodes_h_l3062_c2_8cc9]
signal l16_MUX_uxn_opcodes_h_l3062_c2_8cc9_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l3062_c2_8cc9_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l3062_c2_8cc9_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l3062_c2_8cc9_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l3063_c3_da29[uxn_opcodes_h_l3063_c3_da29]
signal printf_uxn_opcodes_h_l3063_c3_da29_uxn_opcodes_h_l3063_c3_da29_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3068_c11_7a05]
signal BIN_OP_EQ_uxn_opcodes_h_l3068_c11_7a05_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3068_c11_7a05_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3068_c11_7a05_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l3068_c7_7c53]
signal n16_MUX_uxn_opcodes_h_l3068_c7_7c53_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l3068_c7_7c53_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l3068_c7_7c53_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l3068_c7_7c53_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3068_c7_7c53]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3068_c7_7c53_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3068_c7_7c53_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3068_c7_7c53_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3068_c7_7c53_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l3068_c7_7c53]
signal result_is_stack_read_MUX_uxn_opcodes_h_l3068_c7_7c53_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3068_c7_7c53_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3068_c7_7c53_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3068_c7_7c53_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3068_c7_7c53]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3068_c7_7c53_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3068_c7_7c53_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3068_c7_7c53_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3068_c7_7c53_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3068_c7_7c53]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3068_c7_7c53_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3068_c7_7c53_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3068_c7_7c53_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3068_c7_7c53_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3068_c7_7c53]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3068_c7_7c53_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3068_c7_7c53_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3068_c7_7c53_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3068_c7_7c53_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3068_c7_7c53]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3068_c7_7c53_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3068_c7_7c53_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3068_c7_7c53_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3068_c7_7c53_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3068_c7_7c53]
signal result_stack_value_MUX_uxn_opcodes_h_l3068_c7_7c53_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3068_c7_7c53_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3068_c7_7c53_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3068_c7_7c53_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l3068_c7_7c53]
signal t16_MUX_uxn_opcodes_h_l3068_c7_7c53_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l3068_c7_7c53_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3068_c7_7c53_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3068_c7_7c53_return_output : unsigned(15 downto 0);

-- l16_MUX[uxn_opcodes_h_l3068_c7_7c53]
signal l16_MUX_uxn_opcodes_h_l3068_c7_7c53_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l3068_c7_7c53_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l3068_c7_7c53_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l3068_c7_7c53_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3071_c11_6639]
signal BIN_OP_EQ_uxn_opcodes_h_l3071_c11_6639_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3071_c11_6639_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3071_c11_6639_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l3071_c7_94c5]
signal n16_MUX_uxn_opcodes_h_l3071_c7_94c5_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l3071_c7_94c5_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l3071_c7_94c5_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l3071_c7_94c5_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3071_c7_94c5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3071_c7_94c5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3071_c7_94c5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3071_c7_94c5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3071_c7_94c5_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l3071_c7_94c5]
signal result_is_stack_read_MUX_uxn_opcodes_h_l3071_c7_94c5_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3071_c7_94c5_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3071_c7_94c5_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3071_c7_94c5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3071_c7_94c5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3071_c7_94c5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3071_c7_94c5_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3071_c7_94c5_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3071_c7_94c5_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3071_c7_94c5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3071_c7_94c5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3071_c7_94c5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3071_c7_94c5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3071_c7_94c5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3071_c7_94c5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3071_c7_94c5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3071_c7_94c5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3071_c7_94c5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3071_c7_94c5_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3071_c7_94c5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3071_c7_94c5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3071_c7_94c5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3071_c7_94c5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3071_c7_94c5_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3071_c7_94c5]
signal result_stack_value_MUX_uxn_opcodes_h_l3071_c7_94c5_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3071_c7_94c5_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3071_c7_94c5_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3071_c7_94c5_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l3071_c7_94c5]
signal t16_MUX_uxn_opcodes_h_l3071_c7_94c5_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l3071_c7_94c5_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3071_c7_94c5_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3071_c7_94c5_return_output : unsigned(15 downto 0);

-- l16_MUX[uxn_opcodes_h_l3071_c7_94c5]
signal l16_MUX_uxn_opcodes_h_l3071_c7_94c5_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l3071_c7_94c5_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l3071_c7_94c5_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l3071_c7_94c5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3076_c11_982e]
signal BIN_OP_EQ_uxn_opcodes_h_l3076_c11_982e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3076_c11_982e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3076_c11_982e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l3076_c7_6a3f]
signal n16_MUX_uxn_opcodes_h_l3076_c7_6a3f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l3076_c7_6a3f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l3076_c7_6a3f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l3076_c7_6a3f_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3076_c7_6a3f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3076_c7_6a3f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3076_c7_6a3f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3076_c7_6a3f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3076_c7_6a3f_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l3076_c7_6a3f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l3076_c7_6a3f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3076_c7_6a3f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3076_c7_6a3f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3076_c7_6a3f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3076_c7_6a3f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3076_c7_6a3f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3076_c7_6a3f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3076_c7_6a3f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3076_c7_6a3f_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3076_c7_6a3f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3076_c7_6a3f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3076_c7_6a3f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3076_c7_6a3f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3076_c7_6a3f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3076_c7_6a3f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3076_c7_6a3f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3076_c7_6a3f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3076_c7_6a3f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3076_c7_6a3f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3076_c7_6a3f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3076_c7_6a3f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3076_c7_6a3f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3076_c7_6a3f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3076_c7_6a3f_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3076_c7_6a3f]
signal result_stack_value_MUX_uxn_opcodes_h_l3076_c7_6a3f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3076_c7_6a3f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3076_c7_6a3f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3076_c7_6a3f_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l3076_c7_6a3f]
signal t16_MUX_uxn_opcodes_h_l3076_c7_6a3f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l3076_c7_6a3f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3076_c7_6a3f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3076_c7_6a3f_return_output : unsigned(15 downto 0);

-- l16_MUX[uxn_opcodes_h_l3076_c7_6a3f]
signal l16_MUX_uxn_opcodes_h_l3076_c7_6a3f_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l3076_c7_6a3f_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l3076_c7_6a3f_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l3076_c7_6a3f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3079_c11_0c7b]
signal BIN_OP_EQ_uxn_opcodes_h_l3079_c11_0c7b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3079_c11_0c7b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3079_c11_0c7b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l3079_c7_4155]
signal n16_MUX_uxn_opcodes_h_l3079_c7_4155_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l3079_c7_4155_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l3079_c7_4155_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l3079_c7_4155_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3079_c7_4155]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3079_c7_4155_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3079_c7_4155_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3079_c7_4155_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3079_c7_4155_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l3079_c7_4155]
signal result_is_stack_read_MUX_uxn_opcodes_h_l3079_c7_4155_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3079_c7_4155_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3079_c7_4155_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3079_c7_4155_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3079_c7_4155]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3079_c7_4155_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3079_c7_4155_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3079_c7_4155_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3079_c7_4155_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3079_c7_4155]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3079_c7_4155_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3079_c7_4155_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3079_c7_4155_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3079_c7_4155_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3079_c7_4155]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3079_c7_4155_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3079_c7_4155_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3079_c7_4155_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3079_c7_4155_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3079_c7_4155]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3079_c7_4155_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3079_c7_4155_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3079_c7_4155_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3079_c7_4155_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3079_c7_4155]
signal result_stack_value_MUX_uxn_opcodes_h_l3079_c7_4155_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3079_c7_4155_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3079_c7_4155_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3079_c7_4155_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l3079_c7_4155]
signal t16_MUX_uxn_opcodes_h_l3079_c7_4155_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l3079_c7_4155_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3079_c7_4155_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3079_c7_4155_return_output : unsigned(15 downto 0);

-- l16_MUX[uxn_opcodes_h_l3079_c7_4155]
signal l16_MUX_uxn_opcodes_h_l3079_c7_4155_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l3079_c7_4155_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l3079_c7_4155_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l3079_c7_4155_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l3080_c3_5ac0]
signal BIN_OP_OR_uxn_opcodes_h_l3080_c3_5ac0_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l3080_c3_5ac0_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l3080_c3_5ac0_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3083_c11_493f]
signal BIN_OP_EQ_uxn_opcodes_h_l3083_c11_493f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3083_c11_493f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3083_c11_493f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l3083_c7_bb56]
signal n16_MUX_uxn_opcodes_h_l3083_c7_bb56_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l3083_c7_bb56_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l3083_c7_bb56_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l3083_c7_bb56_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3083_c7_bb56]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3083_c7_bb56_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3083_c7_bb56_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3083_c7_bb56_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3083_c7_bb56_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l3083_c7_bb56]
signal result_is_stack_read_MUX_uxn_opcodes_h_l3083_c7_bb56_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3083_c7_bb56_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3083_c7_bb56_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3083_c7_bb56_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3083_c7_bb56]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3083_c7_bb56_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3083_c7_bb56_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3083_c7_bb56_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3083_c7_bb56_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3083_c7_bb56]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3083_c7_bb56_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3083_c7_bb56_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3083_c7_bb56_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3083_c7_bb56_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3083_c7_bb56]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3083_c7_bb56_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3083_c7_bb56_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3083_c7_bb56_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3083_c7_bb56_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3083_c7_bb56]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3083_c7_bb56_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3083_c7_bb56_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3083_c7_bb56_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3083_c7_bb56_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3083_c7_bb56]
signal result_stack_value_MUX_uxn_opcodes_h_l3083_c7_bb56_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3083_c7_bb56_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3083_c7_bb56_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3083_c7_bb56_return_output : unsigned(7 downto 0);

-- l16_MUX[uxn_opcodes_h_l3083_c7_bb56]
signal l16_MUX_uxn_opcodes_h_l3083_c7_bb56_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l3083_c7_bb56_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l3083_c7_bb56_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l3083_c7_bb56_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3086_c11_9370]
signal BIN_OP_EQ_uxn_opcodes_h_l3086_c11_9370_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3086_c11_9370_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3086_c11_9370_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l3086_c7_a1ba]
signal n16_MUX_uxn_opcodes_h_l3086_c7_a1ba_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l3086_c7_a1ba_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l3086_c7_a1ba_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l3086_c7_a1ba_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3086_c7_a1ba]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3086_c7_a1ba_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3086_c7_a1ba_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3086_c7_a1ba_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3086_c7_a1ba_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l3086_c7_a1ba]
signal result_is_stack_read_MUX_uxn_opcodes_h_l3086_c7_a1ba_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3086_c7_a1ba_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3086_c7_a1ba_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3086_c7_a1ba_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3086_c7_a1ba]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3086_c7_a1ba_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3086_c7_a1ba_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3086_c7_a1ba_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3086_c7_a1ba_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3086_c7_a1ba]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3086_c7_a1ba_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3086_c7_a1ba_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3086_c7_a1ba_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3086_c7_a1ba_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3086_c7_a1ba]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3086_c7_a1ba_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3086_c7_a1ba_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3086_c7_a1ba_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3086_c7_a1ba_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3086_c7_a1ba]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3086_c7_a1ba_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3086_c7_a1ba_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3086_c7_a1ba_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3086_c7_a1ba_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3086_c7_a1ba]
signal result_stack_value_MUX_uxn_opcodes_h_l3086_c7_a1ba_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3086_c7_a1ba_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3086_c7_a1ba_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3086_c7_a1ba_return_output : unsigned(7 downto 0);

-- l16_MUX[uxn_opcodes_h_l3086_c7_a1ba]
signal l16_MUX_uxn_opcodes_h_l3086_c7_a1ba_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l3086_c7_a1ba_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l3086_c7_a1ba_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l3086_c7_a1ba_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3091_c11_972f]
signal BIN_OP_EQ_uxn_opcodes_h_l3091_c11_972f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3091_c11_972f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3091_c11_972f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l3091_c7_0749]
signal n16_MUX_uxn_opcodes_h_l3091_c7_0749_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l3091_c7_0749_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l3091_c7_0749_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l3091_c7_0749_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3091_c7_0749]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3091_c7_0749_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3091_c7_0749_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3091_c7_0749_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3091_c7_0749_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l3091_c7_0749]
signal result_is_stack_read_MUX_uxn_opcodes_h_l3091_c7_0749_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3091_c7_0749_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3091_c7_0749_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3091_c7_0749_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3091_c7_0749]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3091_c7_0749_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3091_c7_0749_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3091_c7_0749_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3091_c7_0749_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3091_c7_0749]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3091_c7_0749_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3091_c7_0749_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3091_c7_0749_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3091_c7_0749_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3091_c7_0749]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3091_c7_0749_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3091_c7_0749_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3091_c7_0749_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3091_c7_0749_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3091_c7_0749]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3091_c7_0749_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3091_c7_0749_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3091_c7_0749_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3091_c7_0749_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3091_c7_0749]
signal result_stack_value_MUX_uxn_opcodes_h_l3091_c7_0749_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3091_c7_0749_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3091_c7_0749_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3091_c7_0749_return_output : unsigned(7 downto 0);

-- l16_MUX[uxn_opcodes_h_l3091_c7_0749]
signal l16_MUX_uxn_opcodes_h_l3091_c7_0749_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l3091_c7_0749_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l3091_c7_0749_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l3091_c7_0749_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3094_c11_21fc]
signal BIN_OP_EQ_uxn_opcodes_h_l3094_c11_21fc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3094_c11_21fc_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3094_c11_21fc_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l3094_c7_853c]
signal n16_MUX_uxn_opcodes_h_l3094_c7_853c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l3094_c7_853c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l3094_c7_853c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l3094_c7_853c_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3094_c7_853c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3094_c7_853c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3094_c7_853c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3094_c7_853c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3094_c7_853c_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l3094_c7_853c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l3094_c7_853c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3094_c7_853c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3094_c7_853c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3094_c7_853c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3094_c7_853c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3094_c7_853c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3094_c7_853c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3094_c7_853c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3094_c7_853c_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3094_c7_853c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3094_c7_853c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3094_c7_853c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3094_c7_853c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3094_c7_853c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3094_c7_853c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3094_c7_853c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3094_c7_853c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3094_c7_853c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3094_c7_853c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3094_c7_853c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3094_c7_853c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3094_c7_853c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3094_c7_853c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3094_c7_853c_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3094_c7_853c]
signal result_stack_value_MUX_uxn_opcodes_h_l3094_c7_853c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3094_c7_853c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3094_c7_853c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3094_c7_853c_return_output : unsigned(7 downto 0);

-- l16_MUX[uxn_opcodes_h_l3094_c7_853c]
signal l16_MUX_uxn_opcodes_h_l3094_c7_853c_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l3094_c7_853c_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l3094_c7_853c_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l3094_c7_853c_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l3095_c3_709c]
signal BIN_OP_OR_uxn_opcodes_h_l3095_c3_709c_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l3095_c3_709c_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l3095_c3_709c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3098_c11_1d96]
signal BIN_OP_EQ_uxn_opcodes_h_l3098_c11_1d96_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3098_c11_1d96_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3098_c11_1d96_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3098_c7_3a39]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3098_c7_3a39_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3098_c7_3a39_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3098_c7_3a39_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3098_c7_3a39_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l3098_c7_3a39]
signal result_is_stack_read_MUX_uxn_opcodes_h_l3098_c7_3a39_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3098_c7_3a39_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3098_c7_3a39_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3098_c7_3a39_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3098_c7_3a39]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3098_c7_3a39_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3098_c7_3a39_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3098_c7_3a39_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3098_c7_3a39_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3098_c7_3a39]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3098_c7_3a39_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3098_c7_3a39_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3098_c7_3a39_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3098_c7_3a39_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3098_c7_3a39]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3098_c7_3a39_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3098_c7_3a39_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3098_c7_3a39_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3098_c7_3a39_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3098_c7_3a39]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3098_c7_3a39_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3098_c7_3a39_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3098_c7_3a39_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3098_c7_3a39_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3098_c7_3a39]
signal result_stack_value_MUX_uxn_opcodes_h_l3098_c7_3a39_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3098_c7_3a39_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3098_c7_3a39_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3098_c7_3a39_return_output : unsigned(7 downto 0);

-- l16_MUX[uxn_opcodes_h_l3098_c7_3a39]
signal l16_MUX_uxn_opcodes_h_l3098_c7_3a39_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l3098_c7_3a39_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l3098_c7_3a39_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l3098_c7_3a39_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3101_c11_3d69]
signal BIN_OP_EQ_uxn_opcodes_h_l3101_c11_3d69_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3101_c11_3d69_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3101_c11_3d69_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3101_c7_6dee]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3101_c7_6dee_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3101_c7_6dee_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3101_c7_6dee_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3101_c7_6dee_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l3101_c7_6dee]
signal result_is_stack_read_MUX_uxn_opcodes_h_l3101_c7_6dee_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3101_c7_6dee_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3101_c7_6dee_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3101_c7_6dee_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3101_c7_6dee]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3101_c7_6dee_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3101_c7_6dee_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3101_c7_6dee_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3101_c7_6dee_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3101_c7_6dee]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3101_c7_6dee_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3101_c7_6dee_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3101_c7_6dee_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3101_c7_6dee_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3101_c7_6dee]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3101_c7_6dee_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3101_c7_6dee_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3101_c7_6dee_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3101_c7_6dee_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3101_c7_6dee]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3101_c7_6dee_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3101_c7_6dee_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3101_c7_6dee_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3101_c7_6dee_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3101_c7_6dee]
signal result_stack_value_MUX_uxn_opcodes_h_l3101_c7_6dee_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3101_c7_6dee_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3101_c7_6dee_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3101_c7_6dee_return_output : unsigned(7 downto 0);

-- l16_MUX[uxn_opcodes_h_l3101_c7_6dee]
signal l16_MUX_uxn_opcodes_h_l3101_c7_6dee_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l3101_c7_6dee_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l3101_c7_6dee_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l3101_c7_6dee_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3106_c11_2b9d]
signal BIN_OP_EQ_uxn_opcodes_h_l3106_c11_2b9d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3106_c11_2b9d_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3106_c11_2b9d_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3106_c7_72ed]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3106_c7_72ed_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3106_c7_72ed_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3106_c7_72ed_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3106_c7_72ed_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l3106_c7_72ed]
signal result_is_stack_read_MUX_uxn_opcodes_h_l3106_c7_72ed_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3106_c7_72ed_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3106_c7_72ed_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3106_c7_72ed_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3106_c7_72ed]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3106_c7_72ed_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3106_c7_72ed_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3106_c7_72ed_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3106_c7_72ed_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3106_c7_72ed]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3106_c7_72ed_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3106_c7_72ed_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3106_c7_72ed_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3106_c7_72ed_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3106_c7_72ed]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3106_c7_72ed_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3106_c7_72ed_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3106_c7_72ed_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3106_c7_72ed_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3106_c7_72ed]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3106_c7_72ed_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3106_c7_72ed_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3106_c7_72ed_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3106_c7_72ed_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3106_c7_72ed]
signal result_stack_value_MUX_uxn_opcodes_h_l3106_c7_72ed_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3106_c7_72ed_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3106_c7_72ed_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3106_c7_72ed_return_output : unsigned(7 downto 0);

-- l16_MUX[uxn_opcodes_h_l3106_c7_72ed]
signal l16_MUX_uxn_opcodes_h_l3106_c7_72ed_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l3106_c7_72ed_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l3106_c7_72ed_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l3106_c7_72ed_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3109_c11_9bf8]
signal BIN_OP_EQ_uxn_opcodes_h_l3109_c11_9bf8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3109_c11_9bf8_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3109_c11_9bf8_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3109_c7_c963]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3109_c7_c963_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3109_c7_c963_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3109_c7_c963_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3109_c7_c963_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l3109_c7_c963]
signal result_is_stack_read_MUX_uxn_opcodes_h_l3109_c7_c963_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3109_c7_c963_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3109_c7_c963_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3109_c7_c963_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3109_c7_c963]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3109_c7_c963_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3109_c7_c963_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3109_c7_c963_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3109_c7_c963_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3109_c7_c963]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3109_c7_c963_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3109_c7_c963_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3109_c7_c963_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3109_c7_c963_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3109_c7_c963]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3109_c7_c963_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3109_c7_c963_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3109_c7_c963_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3109_c7_c963_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3109_c7_c963]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3109_c7_c963_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3109_c7_c963_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3109_c7_c963_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3109_c7_c963_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3109_c7_c963]
signal result_stack_value_MUX_uxn_opcodes_h_l3109_c7_c963_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3109_c7_c963_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3109_c7_c963_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3109_c7_c963_return_output : unsigned(7 downto 0);

-- l16_MUX[uxn_opcodes_h_l3109_c7_c963]
signal l16_MUX_uxn_opcodes_h_l3109_c7_c963_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l3109_c7_c963_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l3109_c7_c963_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l3109_c7_c963_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l3110_c3_443b]
signal BIN_OP_OR_uxn_opcodes_h_l3110_c3_443b_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l3110_c3_443b_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l3110_c3_443b_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l3113_c32_6a34]
signal BIN_OP_AND_uxn_opcodes_h_l3113_c32_6a34_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l3113_c32_6a34_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l3113_c32_6a34_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l3113_c32_90e9]
signal BIN_OP_GT_uxn_opcodes_h_l3113_c32_90e9_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l3113_c32_90e9_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l3113_c32_90e9_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l3113_c32_e4e4]
signal MUX_uxn_opcodes_h_l3113_c32_e4e4_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l3113_c32_e4e4_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l3113_c32_e4e4_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l3113_c32_e4e4_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3115_c11_e27c]
signal BIN_OP_EQ_uxn_opcodes_h_l3115_c11_e27c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3115_c11_e27c_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3115_c11_e27c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3115_c7_f4b0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3115_c7_f4b0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3115_c7_f4b0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3115_c7_f4b0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3115_c7_f4b0_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3115_c7_f4b0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3115_c7_f4b0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3115_c7_f4b0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3115_c7_f4b0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3115_c7_f4b0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3115_c7_f4b0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3115_c7_f4b0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3115_c7_f4b0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3115_c7_f4b0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3115_c7_f4b0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3115_c7_f4b0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3115_c7_f4b0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3115_c7_f4b0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3115_c7_f4b0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3115_c7_f4b0_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3115_c7_f4b0]
signal result_stack_value_MUX_uxn_opcodes_h_l3115_c7_f4b0_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3115_c7_f4b0_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3115_c7_f4b0_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3115_c7_f4b0_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3121_c11_4c3a]
signal BIN_OP_EQ_uxn_opcodes_h_l3121_c11_4c3a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3121_c11_4c3a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3121_c11_4c3a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3121_c7_5bc3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3121_c7_5bc3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3121_c7_5bc3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3121_c7_5bc3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3121_c7_5bc3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3121_c7_5bc3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3121_c7_5bc3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3121_c7_5bc3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3121_c7_5bc3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3121_c7_5bc3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3121_c7_5bc3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3121_c7_5bc3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3121_c7_5bc3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3121_c7_5bc3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3121_c7_5bc3_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3121_c7_5bc3]
signal result_stack_value_MUX_uxn_opcodes_h_l3121_c7_5bc3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3121_c7_5bc3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3121_c7_5bc3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3121_c7_5bc3_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l3123_c34_4bca]
signal CONST_SR_8_uxn_opcodes_h_l3123_c34_4bca_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l3123_c34_4bca_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3125_c11_ed85]
signal BIN_OP_EQ_uxn_opcodes_h_l3125_c11_ed85_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3125_c11_ed85_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3125_c11_ed85_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3125_c7_1d5e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3125_c7_1d5e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3125_c7_1d5e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3125_c7_1d5e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3125_c7_1d5e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3125_c7_1d5e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3125_c7_1d5e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3125_c7_1d5e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3125_c7_1d5e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3125_c7_1d5e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3125_c7_1d5e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3125_c7_1d5e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3125_c7_1d5e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3125_c7_1d5e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3125_c7_1d5e_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3125_c7_1d5e]
signal result_stack_value_MUX_uxn_opcodes_h_l3125_c7_1d5e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3125_c7_1d5e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3125_c7_1d5e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3125_c7_1d5e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3129_c11_977a]
signal BIN_OP_EQ_uxn_opcodes_h_l3129_c11_977a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3129_c11_977a_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3129_c11_977a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3129_c7_f70f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3129_c7_f70f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3129_c7_f70f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3129_c7_f70f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3129_c7_f70f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3129_c7_f70f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3129_c7_f70f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3129_c7_f70f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3129_c7_f70f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3129_c7_f70f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3129_c7_f70f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3129_c7_f70f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3129_c7_f70f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3129_c7_f70f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3129_c7_f70f_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3129_c7_f70f]
signal result_stack_value_MUX_uxn_opcodes_h_l3129_c7_f70f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3129_c7_f70f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3129_c7_f70f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3129_c7_f70f_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l3131_c34_d544]
signal CONST_SR_8_uxn_opcodes_h_l3131_c34_d544_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l3131_c34_d544_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3133_c11_aaec]
signal BIN_OP_EQ_uxn_opcodes_h_l3133_c11_aaec_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3133_c11_aaec_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3133_c11_aaec_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3133_c7_b584]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3133_c7_b584_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3133_c7_b584_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3133_c7_b584_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3133_c7_b584_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3133_c7_b584]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3133_c7_b584_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3133_c7_b584_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3133_c7_b584_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3133_c7_b584_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3133_c7_b584]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3133_c7_b584_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3133_c7_b584_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3133_c7_b584_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3133_c7_b584_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3133_c7_b584]
signal result_stack_value_MUX_uxn_opcodes_h_l3133_c7_b584_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3133_c7_b584_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3133_c7_b584_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3133_c7_b584_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3137_c11_2153]
signal BIN_OP_EQ_uxn_opcodes_h_l3137_c11_2153_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3137_c11_2153_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3137_c11_2153_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3137_c7_a254]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3137_c7_a254_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3137_c7_a254_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3137_c7_a254_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3137_c7_a254_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3137_c7_a254]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3137_c7_a254_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3137_c7_a254_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3137_c7_a254_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3137_c7_a254_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3137_c7_a254]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3137_c7_a254_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3137_c7_a254_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3137_c7_a254_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3137_c7_a254_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3137_c7_a254]
signal result_stack_value_MUX_uxn_opcodes_h_l3137_c7_a254_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3137_c7_a254_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3137_c7_a254_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3137_c7_a254_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l3139_c34_eaff]
signal CONST_SR_8_uxn_opcodes_h_l3139_c34_eaff_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l3139_c34_eaff_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3141_c11_7c77]
signal BIN_OP_EQ_uxn_opcodes_h_l3141_c11_7c77_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3141_c11_7c77_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3141_c11_7c77_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3141_c7_1959]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3141_c7_1959_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3141_c7_1959_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3141_c7_1959_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3141_c7_1959_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3141_c7_1959]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3141_c7_1959_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3141_c7_1959_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3141_c7_1959_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3141_c7_1959_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l3103_l3088_l3073_DUPLICATE_fa25
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l3103_l3088_l3073_DUPLICATE_fa25_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l3103_l3088_l3073_DUPLICATE_fa25_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_1ade( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_sp_shift := ref_toks_1;
      base.is_stack_read := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.stack_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l3062_c6_d47c
BIN_OP_EQ_uxn_opcodes_h_l3062_c6_d47c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3062_c6_d47c_left,
BIN_OP_EQ_uxn_opcodes_h_l3062_c6_d47c_right,
BIN_OP_EQ_uxn_opcodes_h_l3062_c6_d47c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_d798
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_d798 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_d798_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_d798_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_d798_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_d798_return_output);

-- n16_MUX_uxn_opcodes_h_l3062_c2_8cc9
n16_MUX_uxn_opcodes_h_l3062_c2_8cc9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l3062_c2_8cc9_cond,
n16_MUX_uxn_opcodes_h_l3062_c2_8cc9_iftrue,
n16_MUX_uxn_opcodes_h_l3062_c2_8cc9_iffalse,
n16_MUX_uxn_opcodes_h_l3062_c2_8cc9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3062_c2_8cc9
result_is_sp_shift_MUX_uxn_opcodes_h_l3062_c2_8cc9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3062_c2_8cc9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3062_c2_8cc9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3062_c2_8cc9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3062_c2_8cc9_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l3062_c2_8cc9
result_is_stack_read_MUX_uxn_opcodes_h_l3062_c2_8cc9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l3062_c2_8cc9_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l3062_c2_8cc9_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l3062_c2_8cc9_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l3062_c2_8cc9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3062_c2_8cc9
result_sp_relative_shift_MUX_uxn_opcodes_h_l3062_c2_8cc9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3062_c2_8cc9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3062_c2_8cc9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3062_c2_8cc9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3062_c2_8cc9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3062_c2_8cc9
result_is_stack_write_MUX_uxn_opcodes_h_l3062_c2_8cc9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3062_c2_8cc9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3062_c2_8cc9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3062_c2_8cc9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3062_c2_8cc9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3062_c2_8cc9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3062_c2_8cc9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3062_c2_8cc9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3062_c2_8cc9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3062_c2_8cc9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3062_c2_8cc9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3062_c2_8cc9
result_is_opc_done_MUX_uxn_opcodes_h_l3062_c2_8cc9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3062_c2_8cc9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3062_c2_8cc9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3062_c2_8cc9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3062_c2_8cc9_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3062_c2_8cc9
result_stack_value_MUX_uxn_opcodes_h_l3062_c2_8cc9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3062_c2_8cc9_cond,
result_stack_value_MUX_uxn_opcodes_h_l3062_c2_8cc9_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3062_c2_8cc9_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3062_c2_8cc9_return_output);

-- t16_MUX_uxn_opcodes_h_l3062_c2_8cc9
t16_MUX_uxn_opcodes_h_l3062_c2_8cc9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l3062_c2_8cc9_cond,
t16_MUX_uxn_opcodes_h_l3062_c2_8cc9_iftrue,
t16_MUX_uxn_opcodes_h_l3062_c2_8cc9_iffalse,
t16_MUX_uxn_opcodes_h_l3062_c2_8cc9_return_output);

-- l16_MUX_uxn_opcodes_h_l3062_c2_8cc9
l16_MUX_uxn_opcodes_h_l3062_c2_8cc9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l3062_c2_8cc9_cond,
l16_MUX_uxn_opcodes_h_l3062_c2_8cc9_iftrue,
l16_MUX_uxn_opcodes_h_l3062_c2_8cc9_iffalse,
l16_MUX_uxn_opcodes_h_l3062_c2_8cc9_return_output);

-- printf_uxn_opcodes_h_l3063_c3_da29_uxn_opcodes_h_l3063_c3_da29
printf_uxn_opcodes_h_l3063_c3_da29_uxn_opcodes_h_l3063_c3_da29 : entity work.printf_uxn_opcodes_h_l3063_c3_da29_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l3063_c3_da29_uxn_opcodes_h_l3063_c3_da29_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l3068_c11_7a05
BIN_OP_EQ_uxn_opcodes_h_l3068_c11_7a05 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3068_c11_7a05_left,
BIN_OP_EQ_uxn_opcodes_h_l3068_c11_7a05_right,
BIN_OP_EQ_uxn_opcodes_h_l3068_c11_7a05_return_output);

-- n16_MUX_uxn_opcodes_h_l3068_c7_7c53
n16_MUX_uxn_opcodes_h_l3068_c7_7c53 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l3068_c7_7c53_cond,
n16_MUX_uxn_opcodes_h_l3068_c7_7c53_iftrue,
n16_MUX_uxn_opcodes_h_l3068_c7_7c53_iffalse,
n16_MUX_uxn_opcodes_h_l3068_c7_7c53_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3068_c7_7c53
result_is_sp_shift_MUX_uxn_opcodes_h_l3068_c7_7c53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3068_c7_7c53_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3068_c7_7c53_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3068_c7_7c53_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3068_c7_7c53_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l3068_c7_7c53
result_is_stack_read_MUX_uxn_opcodes_h_l3068_c7_7c53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l3068_c7_7c53_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l3068_c7_7c53_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l3068_c7_7c53_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l3068_c7_7c53_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3068_c7_7c53
result_sp_relative_shift_MUX_uxn_opcodes_h_l3068_c7_7c53 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3068_c7_7c53_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3068_c7_7c53_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3068_c7_7c53_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3068_c7_7c53_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3068_c7_7c53
result_is_stack_write_MUX_uxn_opcodes_h_l3068_c7_7c53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3068_c7_7c53_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3068_c7_7c53_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3068_c7_7c53_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3068_c7_7c53_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3068_c7_7c53
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3068_c7_7c53 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3068_c7_7c53_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3068_c7_7c53_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3068_c7_7c53_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3068_c7_7c53_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3068_c7_7c53
result_is_opc_done_MUX_uxn_opcodes_h_l3068_c7_7c53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3068_c7_7c53_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3068_c7_7c53_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3068_c7_7c53_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3068_c7_7c53_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3068_c7_7c53
result_stack_value_MUX_uxn_opcodes_h_l3068_c7_7c53 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3068_c7_7c53_cond,
result_stack_value_MUX_uxn_opcodes_h_l3068_c7_7c53_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3068_c7_7c53_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3068_c7_7c53_return_output);

-- t16_MUX_uxn_opcodes_h_l3068_c7_7c53
t16_MUX_uxn_opcodes_h_l3068_c7_7c53 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l3068_c7_7c53_cond,
t16_MUX_uxn_opcodes_h_l3068_c7_7c53_iftrue,
t16_MUX_uxn_opcodes_h_l3068_c7_7c53_iffalse,
t16_MUX_uxn_opcodes_h_l3068_c7_7c53_return_output);

-- l16_MUX_uxn_opcodes_h_l3068_c7_7c53
l16_MUX_uxn_opcodes_h_l3068_c7_7c53 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l3068_c7_7c53_cond,
l16_MUX_uxn_opcodes_h_l3068_c7_7c53_iftrue,
l16_MUX_uxn_opcodes_h_l3068_c7_7c53_iffalse,
l16_MUX_uxn_opcodes_h_l3068_c7_7c53_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3071_c11_6639
BIN_OP_EQ_uxn_opcodes_h_l3071_c11_6639 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3071_c11_6639_left,
BIN_OP_EQ_uxn_opcodes_h_l3071_c11_6639_right,
BIN_OP_EQ_uxn_opcodes_h_l3071_c11_6639_return_output);

-- n16_MUX_uxn_opcodes_h_l3071_c7_94c5
n16_MUX_uxn_opcodes_h_l3071_c7_94c5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l3071_c7_94c5_cond,
n16_MUX_uxn_opcodes_h_l3071_c7_94c5_iftrue,
n16_MUX_uxn_opcodes_h_l3071_c7_94c5_iffalse,
n16_MUX_uxn_opcodes_h_l3071_c7_94c5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3071_c7_94c5
result_is_sp_shift_MUX_uxn_opcodes_h_l3071_c7_94c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3071_c7_94c5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3071_c7_94c5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3071_c7_94c5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3071_c7_94c5_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l3071_c7_94c5
result_is_stack_read_MUX_uxn_opcodes_h_l3071_c7_94c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l3071_c7_94c5_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l3071_c7_94c5_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l3071_c7_94c5_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l3071_c7_94c5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3071_c7_94c5
result_sp_relative_shift_MUX_uxn_opcodes_h_l3071_c7_94c5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3071_c7_94c5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3071_c7_94c5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3071_c7_94c5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3071_c7_94c5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3071_c7_94c5
result_is_stack_write_MUX_uxn_opcodes_h_l3071_c7_94c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3071_c7_94c5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3071_c7_94c5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3071_c7_94c5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3071_c7_94c5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3071_c7_94c5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3071_c7_94c5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3071_c7_94c5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3071_c7_94c5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3071_c7_94c5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3071_c7_94c5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3071_c7_94c5
result_is_opc_done_MUX_uxn_opcodes_h_l3071_c7_94c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3071_c7_94c5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3071_c7_94c5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3071_c7_94c5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3071_c7_94c5_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3071_c7_94c5
result_stack_value_MUX_uxn_opcodes_h_l3071_c7_94c5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3071_c7_94c5_cond,
result_stack_value_MUX_uxn_opcodes_h_l3071_c7_94c5_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3071_c7_94c5_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3071_c7_94c5_return_output);

-- t16_MUX_uxn_opcodes_h_l3071_c7_94c5
t16_MUX_uxn_opcodes_h_l3071_c7_94c5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l3071_c7_94c5_cond,
t16_MUX_uxn_opcodes_h_l3071_c7_94c5_iftrue,
t16_MUX_uxn_opcodes_h_l3071_c7_94c5_iffalse,
t16_MUX_uxn_opcodes_h_l3071_c7_94c5_return_output);

-- l16_MUX_uxn_opcodes_h_l3071_c7_94c5
l16_MUX_uxn_opcodes_h_l3071_c7_94c5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l3071_c7_94c5_cond,
l16_MUX_uxn_opcodes_h_l3071_c7_94c5_iftrue,
l16_MUX_uxn_opcodes_h_l3071_c7_94c5_iffalse,
l16_MUX_uxn_opcodes_h_l3071_c7_94c5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3076_c11_982e
BIN_OP_EQ_uxn_opcodes_h_l3076_c11_982e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3076_c11_982e_left,
BIN_OP_EQ_uxn_opcodes_h_l3076_c11_982e_right,
BIN_OP_EQ_uxn_opcodes_h_l3076_c11_982e_return_output);

-- n16_MUX_uxn_opcodes_h_l3076_c7_6a3f
n16_MUX_uxn_opcodes_h_l3076_c7_6a3f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l3076_c7_6a3f_cond,
n16_MUX_uxn_opcodes_h_l3076_c7_6a3f_iftrue,
n16_MUX_uxn_opcodes_h_l3076_c7_6a3f_iffalse,
n16_MUX_uxn_opcodes_h_l3076_c7_6a3f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3076_c7_6a3f
result_is_sp_shift_MUX_uxn_opcodes_h_l3076_c7_6a3f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3076_c7_6a3f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3076_c7_6a3f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3076_c7_6a3f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3076_c7_6a3f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l3076_c7_6a3f
result_is_stack_read_MUX_uxn_opcodes_h_l3076_c7_6a3f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l3076_c7_6a3f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l3076_c7_6a3f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l3076_c7_6a3f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l3076_c7_6a3f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3076_c7_6a3f
result_sp_relative_shift_MUX_uxn_opcodes_h_l3076_c7_6a3f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3076_c7_6a3f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3076_c7_6a3f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3076_c7_6a3f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3076_c7_6a3f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3076_c7_6a3f
result_is_stack_write_MUX_uxn_opcodes_h_l3076_c7_6a3f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3076_c7_6a3f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3076_c7_6a3f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3076_c7_6a3f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3076_c7_6a3f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3076_c7_6a3f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3076_c7_6a3f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3076_c7_6a3f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3076_c7_6a3f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3076_c7_6a3f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3076_c7_6a3f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3076_c7_6a3f
result_is_opc_done_MUX_uxn_opcodes_h_l3076_c7_6a3f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3076_c7_6a3f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3076_c7_6a3f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3076_c7_6a3f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3076_c7_6a3f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3076_c7_6a3f
result_stack_value_MUX_uxn_opcodes_h_l3076_c7_6a3f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3076_c7_6a3f_cond,
result_stack_value_MUX_uxn_opcodes_h_l3076_c7_6a3f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3076_c7_6a3f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3076_c7_6a3f_return_output);

-- t16_MUX_uxn_opcodes_h_l3076_c7_6a3f
t16_MUX_uxn_opcodes_h_l3076_c7_6a3f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l3076_c7_6a3f_cond,
t16_MUX_uxn_opcodes_h_l3076_c7_6a3f_iftrue,
t16_MUX_uxn_opcodes_h_l3076_c7_6a3f_iffalse,
t16_MUX_uxn_opcodes_h_l3076_c7_6a3f_return_output);

-- l16_MUX_uxn_opcodes_h_l3076_c7_6a3f
l16_MUX_uxn_opcodes_h_l3076_c7_6a3f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l3076_c7_6a3f_cond,
l16_MUX_uxn_opcodes_h_l3076_c7_6a3f_iftrue,
l16_MUX_uxn_opcodes_h_l3076_c7_6a3f_iffalse,
l16_MUX_uxn_opcodes_h_l3076_c7_6a3f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3079_c11_0c7b
BIN_OP_EQ_uxn_opcodes_h_l3079_c11_0c7b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3079_c11_0c7b_left,
BIN_OP_EQ_uxn_opcodes_h_l3079_c11_0c7b_right,
BIN_OP_EQ_uxn_opcodes_h_l3079_c11_0c7b_return_output);

-- n16_MUX_uxn_opcodes_h_l3079_c7_4155
n16_MUX_uxn_opcodes_h_l3079_c7_4155 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l3079_c7_4155_cond,
n16_MUX_uxn_opcodes_h_l3079_c7_4155_iftrue,
n16_MUX_uxn_opcodes_h_l3079_c7_4155_iffalse,
n16_MUX_uxn_opcodes_h_l3079_c7_4155_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3079_c7_4155
result_is_sp_shift_MUX_uxn_opcodes_h_l3079_c7_4155 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3079_c7_4155_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3079_c7_4155_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3079_c7_4155_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3079_c7_4155_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l3079_c7_4155
result_is_stack_read_MUX_uxn_opcodes_h_l3079_c7_4155 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l3079_c7_4155_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l3079_c7_4155_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l3079_c7_4155_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l3079_c7_4155_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3079_c7_4155
result_sp_relative_shift_MUX_uxn_opcodes_h_l3079_c7_4155 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3079_c7_4155_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3079_c7_4155_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3079_c7_4155_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3079_c7_4155_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3079_c7_4155
result_is_stack_write_MUX_uxn_opcodes_h_l3079_c7_4155 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3079_c7_4155_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3079_c7_4155_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3079_c7_4155_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3079_c7_4155_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3079_c7_4155
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3079_c7_4155 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3079_c7_4155_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3079_c7_4155_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3079_c7_4155_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3079_c7_4155_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3079_c7_4155
result_is_opc_done_MUX_uxn_opcodes_h_l3079_c7_4155 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3079_c7_4155_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3079_c7_4155_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3079_c7_4155_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3079_c7_4155_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3079_c7_4155
result_stack_value_MUX_uxn_opcodes_h_l3079_c7_4155 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3079_c7_4155_cond,
result_stack_value_MUX_uxn_opcodes_h_l3079_c7_4155_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3079_c7_4155_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3079_c7_4155_return_output);

-- t16_MUX_uxn_opcodes_h_l3079_c7_4155
t16_MUX_uxn_opcodes_h_l3079_c7_4155 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l3079_c7_4155_cond,
t16_MUX_uxn_opcodes_h_l3079_c7_4155_iftrue,
t16_MUX_uxn_opcodes_h_l3079_c7_4155_iffalse,
t16_MUX_uxn_opcodes_h_l3079_c7_4155_return_output);

-- l16_MUX_uxn_opcodes_h_l3079_c7_4155
l16_MUX_uxn_opcodes_h_l3079_c7_4155 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l3079_c7_4155_cond,
l16_MUX_uxn_opcodes_h_l3079_c7_4155_iftrue,
l16_MUX_uxn_opcodes_h_l3079_c7_4155_iffalse,
l16_MUX_uxn_opcodes_h_l3079_c7_4155_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l3080_c3_5ac0
BIN_OP_OR_uxn_opcodes_h_l3080_c3_5ac0 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l3080_c3_5ac0_left,
BIN_OP_OR_uxn_opcodes_h_l3080_c3_5ac0_right,
BIN_OP_OR_uxn_opcodes_h_l3080_c3_5ac0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3083_c11_493f
BIN_OP_EQ_uxn_opcodes_h_l3083_c11_493f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3083_c11_493f_left,
BIN_OP_EQ_uxn_opcodes_h_l3083_c11_493f_right,
BIN_OP_EQ_uxn_opcodes_h_l3083_c11_493f_return_output);

-- n16_MUX_uxn_opcodes_h_l3083_c7_bb56
n16_MUX_uxn_opcodes_h_l3083_c7_bb56 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l3083_c7_bb56_cond,
n16_MUX_uxn_opcodes_h_l3083_c7_bb56_iftrue,
n16_MUX_uxn_opcodes_h_l3083_c7_bb56_iffalse,
n16_MUX_uxn_opcodes_h_l3083_c7_bb56_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3083_c7_bb56
result_is_sp_shift_MUX_uxn_opcodes_h_l3083_c7_bb56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3083_c7_bb56_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3083_c7_bb56_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3083_c7_bb56_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3083_c7_bb56_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l3083_c7_bb56
result_is_stack_read_MUX_uxn_opcodes_h_l3083_c7_bb56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l3083_c7_bb56_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l3083_c7_bb56_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l3083_c7_bb56_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l3083_c7_bb56_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3083_c7_bb56
result_sp_relative_shift_MUX_uxn_opcodes_h_l3083_c7_bb56 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3083_c7_bb56_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3083_c7_bb56_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3083_c7_bb56_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3083_c7_bb56_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3083_c7_bb56
result_is_stack_write_MUX_uxn_opcodes_h_l3083_c7_bb56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3083_c7_bb56_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3083_c7_bb56_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3083_c7_bb56_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3083_c7_bb56_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3083_c7_bb56
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3083_c7_bb56 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3083_c7_bb56_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3083_c7_bb56_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3083_c7_bb56_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3083_c7_bb56_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3083_c7_bb56
result_is_opc_done_MUX_uxn_opcodes_h_l3083_c7_bb56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3083_c7_bb56_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3083_c7_bb56_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3083_c7_bb56_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3083_c7_bb56_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3083_c7_bb56
result_stack_value_MUX_uxn_opcodes_h_l3083_c7_bb56 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3083_c7_bb56_cond,
result_stack_value_MUX_uxn_opcodes_h_l3083_c7_bb56_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3083_c7_bb56_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3083_c7_bb56_return_output);

-- l16_MUX_uxn_opcodes_h_l3083_c7_bb56
l16_MUX_uxn_opcodes_h_l3083_c7_bb56 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l3083_c7_bb56_cond,
l16_MUX_uxn_opcodes_h_l3083_c7_bb56_iftrue,
l16_MUX_uxn_opcodes_h_l3083_c7_bb56_iffalse,
l16_MUX_uxn_opcodes_h_l3083_c7_bb56_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3086_c11_9370
BIN_OP_EQ_uxn_opcodes_h_l3086_c11_9370 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3086_c11_9370_left,
BIN_OP_EQ_uxn_opcodes_h_l3086_c11_9370_right,
BIN_OP_EQ_uxn_opcodes_h_l3086_c11_9370_return_output);

-- n16_MUX_uxn_opcodes_h_l3086_c7_a1ba
n16_MUX_uxn_opcodes_h_l3086_c7_a1ba : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l3086_c7_a1ba_cond,
n16_MUX_uxn_opcodes_h_l3086_c7_a1ba_iftrue,
n16_MUX_uxn_opcodes_h_l3086_c7_a1ba_iffalse,
n16_MUX_uxn_opcodes_h_l3086_c7_a1ba_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3086_c7_a1ba
result_is_sp_shift_MUX_uxn_opcodes_h_l3086_c7_a1ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3086_c7_a1ba_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3086_c7_a1ba_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3086_c7_a1ba_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3086_c7_a1ba_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l3086_c7_a1ba
result_is_stack_read_MUX_uxn_opcodes_h_l3086_c7_a1ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l3086_c7_a1ba_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l3086_c7_a1ba_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l3086_c7_a1ba_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l3086_c7_a1ba_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3086_c7_a1ba
result_sp_relative_shift_MUX_uxn_opcodes_h_l3086_c7_a1ba : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3086_c7_a1ba_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3086_c7_a1ba_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3086_c7_a1ba_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3086_c7_a1ba_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3086_c7_a1ba
result_is_stack_write_MUX_uxn_opcodes_h_l3086_c7_a1ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3086_c7_a1ba_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3086_c7_a1ba_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3086_c7_a1ba_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3086_c7_a1ba_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3086_c7_a1ba
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3086_c7_a1ba : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3086_c7_a1ba_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3086_c7_a1ba_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3086_c7_a1ba_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3086_c7_a1ba_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3086_c7_a1ba
result_is_opc_done_MUX_uxn_opcodes_h_l3086_c7_a1ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3086_c7_a1ba_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3086_c7_a1ba_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3086_c7_a1ba_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3086_c7_a1ba_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3086_c7_a1ba
result_stack_value_MUX_uxn_opcodes_h_l3086_c7_a1ba : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3086_c7_a1ba_cond,
result_stack_value_MUX_uxn_opcodes_h_l3086_c7_a1ba_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3086_c7_a1ba_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3086_c7_a1ba_return_output);

-- l16_MUX_uxn_opcodes_h_l3086_c7_a1ba
l16_MUX_uxn_opcodes_h_l3086_c7_a1ba : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l3086_c7_a1ba_cond,
l16_MUX_uxn_opcodes_h_l3086_c7_a1ba_iftrue,
l16_MUX_uxn_opcodes_h_l3086_c7_a1ba_iffalse,
l16_MUX_uxn_opcodes_h_l3086_c7_a1ba_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3091_c11_972f
BIN_OP_EQ_uxn_opcodes_h_l3091_c11_972f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3091_c11_972f_left,
BIN_OP_EQ_uxn_opcodes_h_l3091_c11_972f_right,
BIN_OP_EQ_uxn_opcodes_h_l3091_c11_972f_return_output);

-- n16_MUX_uxn_opcodes_h_l3091_c7_0749
n16_MUX_uxn_opcodes_h_l3091_c7_0749 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l3091_c7_0749_cond,
n16_MUX_uxn_opcodes_h_l3091_c7_0749_iftrue,
n16_MUX_uxn_opcodes_h_l3091_c7_0749_iffalse,
n16_MUX_uxn_opcodes_h_l3091_c7_0749_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3091_c7_0749
result_is_sp_shift_MUX_uxn_opcodes_h_l3091_c7_0749 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3091_c7_0749_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3091_c7_0749_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3091_c7_0749_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3091_c7_0749_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l3091_c7_0749
result_is_stack_read_MUX_uxn_opcodes_h_l3091_c7_0749 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l3091_c7_0749_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l3091_c7_0749_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l3091_c7_0749_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l3091_c7_0749_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3091_c7_0749
result_sp_relative_shift_MUX_uxn_opcodes_h_l3091_c7_0749 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3091_c7_0749_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3091_c7_0749_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3091_c7_0749_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3091_c7_0749_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3091_c7_0749
result_is_stack_write_MUX_uxn_opcodes_h_l3091_c7_0749 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3091_c7_0749_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3091_c7_0749_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3091_c7_0749_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3091_c7_0749_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3091_c7_0749
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3091_c7_0749 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3091_c7_0749_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3091_c7_0749_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3091_c7_0749_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3091_c7_0749_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3091_c7_0749
result_is_opc_done_MUX_uxn_opcodes_h_l3091_c7_0749 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3091_c7_0749_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3091_c7_0749_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3091_c7_0749_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3091_c7_0749_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3091_c7_0749
result_stack_value_MUX_uxn_opcodes_h_l3091_c7_0749 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3091_c7_0749_cond,
result_stack_value_MUX_uxn_opcodes_h_l3091_c7_0749_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3091_c7_0749_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3091_c7_0749_return_output);

-- l16_MUX_uxn_opcodes_h_l3091_c7_0749
l16_MUX_uxn_opcodes_h_l3091_c7_0749 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l3091_c7_0749_cond,
l16_MUX_uxn_opcodes_h_l3091_c7_0749_iftrue,
l16_MUX_uxn_opcodes_h_l3091_c7_0749_iffalse,
l16_MUX_uxn_opcodes_h_l3091_c7_0749_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3094_c11_21fc
BIN_OP_EQ_uxn_opcodes_h_l3094_c11_21fc : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3094_c11_21fc_left,
BIN_OP_EQ_uxn_opcodes_h_l3094_c11_21fc_right,
BIN_OP_EQ_uxn_opcodes_h_l3094_c11_21fc_return_output);

-- n16_MUX_uxn_opcodes_h_l3094_c7_853c
n16_MUX_uxn_opcodes_h_l3094_c7_853c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l3094_c7_853c_cond,
n16_MUX_uxn_opcodes_h_l3094_c7_853c_iftrue,
n16_MUX_uxn_opcodes_h_l3094_c7_853c_iffalse,
n16_MUX_uxn_opcodes_h_l3094_c7_853c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3094_c7_853c
result_is_sp_shift_MUX_uxn_opcodes_h_l3094_c7_853c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3094_c7_853c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3094_c7_853c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3094_c7_853c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3094_c7_853c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l3094_c7_853c
result_is_stack_read_MUX_uxn_opcodes_h_l3094_c7_853c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l3094_c7_853c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l3094_c7_853c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l3094_c7_853c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l3094_c7_853c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3094_c7_853c
result_sp_relative_shift_MUX_uxn_opcodes_h_l3094_c7_853c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3094_c7_853c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3094_c7_853c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3094_c7_853c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3094_c7_853c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3094_c7_853c
result_is_stack_write_MUX_uxn_opcodes_h_l3094_c7_853c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3094_c7_853c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3094_c7_853c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3094_c7_853c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3094_c7_853c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3094_c7_853c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3094_c7_853c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3094_c7_853c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3094_c7_853c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3094_c7_853c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3094_c7_853c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3094_c7_853c
result_is_opc_done_MUX_uxn_opcodes_h_l3094_c7_853c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3094_c7_853c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3094_c7_853c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3094_c7_853c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3094_c7_853c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3094_c7_853c
result_stack_value_MUX_uxn_opcodes_h_l3094_c7_853c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3094_c7_853c_cond,
result_stack_value_MUX_uxn_opcodes_h_l3094_c7_853c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3094_c7_853c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3094_c7_853c_return_output);

-- l16_MUX_uxn_opcodes_h_l3094_c7_853c
l16_MUX_uxn_opcodes_h_l3094_c7_853c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l3094_c7_853c_cond,
l16_MUX_uxn_opcodes_h_l3094_c7_853c_iftrue,
l16_MUX_uxn_opcodes_h_l3094_c7_853c_iffalse,
l16_MUX_uxn_opcodes_h_l3094_c7_853c_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l3095_c3_709c
BIN_OP_OR_uxn_opcodes_h_l3095_c3_709c : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l3095_c3_709c_left,
BIN_OP_OR_uxn_opcodes_h_l3095_c3_709c_right,
BIN_OP_OR_uxn_opcodes_h_l3095_c3_709c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3098_c11_1d96
BIN_OP_EQ_uxn_opcodes_h_l3098_c11_1d96 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3098_c11_1d96_left,
BIN_OP_EQ_uxn_opcodes_h_l3098_c11_1d96_right,
BIN_OP_EQ_uxn_opcodes_h_l3098_c11_1d96_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3098_c7_3a39
result_is_sp_shift_MUX_uxn_opcodes_h_l3098_c7_3a39 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3098_c7_3a39_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3098_c7_3a39_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3098_c7_3a39_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3098_c7_3a39_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l3098_c7_3a39
result_is_stack_read_MUX_uxn_opcodes_h_l3098_c7_3a39 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l3098_c7_3a39_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l3098_c7_3a39_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l3098_c7_3a39_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l3098_c7_3a39_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3098_c7_3a39
result_sp_relative_shift_MUX_uxn_opcodes_h_l3098_c7_3a39 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3098_c7_3a39_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3098_c7_3a39_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3098_c7_3a39_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3098_c7_3a39_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3098_c7_3a39
result_is_stack_write_MUX_uxn_opcodes_h_l3098_c7_3a39 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3098_c7_3a39_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3098_c7_3a39_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3098_c7_3a39_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3098_c7_3a39_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3098_c7_3a39
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3098_c7_3a39 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3098_c7_3a39_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3098_c7_3a39_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3098_c7_3a39_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3098_c7_3a39_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3098_c7_3a39
result_is_opc_done_MUX_uxn_opcodes_h_l3098_c7_3a39 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3098_c7_3a39_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3098_c7_3a39_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3098_c7_3a39_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3098_c7_3a39_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3098_c7_3a39
result_stack_value_MUX_uxn_opcodes_h_l3098_c7_3a39 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3098_c7_3a39_cond,
result_stack_value_MUX_uxn_opcodes_h_l3098_c7_3a39_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3098_c7_3a39_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3098_c7_3a39_return_output);

-- l16_MUX_uxn_opcodes_h_l3098_c7_3a39
l16_MUX_uxn_opcodes_h_l3098_c7_3a39 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l3098_c7_3a39_cond,
l16_MUX_uxn_opcodes_h_l3098_c7_3a39_iftrue,
l16_MUX_uxn_opcodes_h_l3098_c7_3a39_iffalse,
l16_MUX_uxn_opcodes_h_l3098_c7_3a39_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3101_c11_3d69
BIN_OP_EQ_uxn_opcodes_h_l3101_c11_3d69 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3101_c11_3d69_left,
BIN_OP_EQ_uxn_opcodes_h_l3101_c11_3d69_right,
BIN_OP_EQ_uxn_opcodes_h_l3101_c11_3d69_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3101_c7_6dee
result_is_sp_shift_MUX_uxn_opcodes_h_l3101_c7_6dee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3101_c7_6dee_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3101_c7_6dee_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3101_c7_6dee_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3101_c7_6dee_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l3101_c7_6dee
result_is_stack_read_MUX_uxn_opcodes_h_l3101_c7_6dee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l3101_c7_6dee_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l3101_c7_6dee_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l3101_c7_6dee_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l3101_c7_6dee_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3101_c7_6dee
result_sp_relative_shift_MUX_uxn_opcodes_h_l3101_c7_6dee : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3101_c7_6dee_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3101_c7_6dee_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3101_c7_6dee_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3101_c7_6dee_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3101_c7_6dee
result_is_stack_write_MUX_uxn_opcodes_h_l3101_c7_6dee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3101_c7_6dee_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3101_c7_6dee_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3101_c7_6dee_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3101_c7_6dee_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3101_c7_6dee
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3101_c7_6dee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3101_c7_6dee_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3101_c7_6dee_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3101_c7_6dee_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3101_c7_6dee_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3101_c7_6dee
result_is_opc_done_MUX_uxn_opcodes_h_l3101_c7_6dee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3101_c7_6dee_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3101_c7_6dee_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3101_c7_6dee_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3101_c7_6dee_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3101_c7_6dee
result_stack_value_MUX_uxn_opcodes_h_l3101_c7_6dee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3101_c7_6dee_cond,
result_stack_value_MUX_uxn_opcodes_h_l3101_c7_6dee_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3101_c7_6dee_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3101_c7_6dee_return_output);

-- l16_MUX_uxn_opcodes_h_l3101_c7_6dee
l16_MUX_uxn_opcodes_h_l3101_c7_6dee : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l3101_c7_6dee_cond,
l16_MUX_uxn_opcodes_h_l3101_c7_6dee_iftrue,
l16_MUX_uxn_opcodes_h_l3101_c7_6dee_iffalse,
l16_MUX_uxn_opcodes_h_l3101_c7_6dee_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3106_c11_2b9d
BIN_OP_EQ_uxn_opcodes_h_l3106_c11_2b9d : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3106_c11_2b9d_left,
BIN_OP_EQ_uxn_opcodes_h_l3106_c11_2b9d_right,
BIN_OP_EQ_uxn_opcodes_h_l3106_c11_2b9d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3106_c7_72ed
result_is_sp_shift_MUX_uxn_opcodes_h_l3106_c7_72ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3106_c7_72ed_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3106_c7_72ed_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3106_c7_72ed_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3106_c7_72ed_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l3106_c7_72ed
result_is_stack_read_MUX_uxn_opcodes_h_l3106_c7_72ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l3106_c7_72ed_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l3106_c7_72ed_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l3106_c7_72ed_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l3106_c7_72ed_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3106_c7_72ed
result_sp_relative_shift_MUX_uxn_opcodes_h_l3106_c7_72ed : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3106_c7_72ed_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3106_c7_72ed_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3106_c7_72ed_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3106_c7_72ed_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3106_c7_72ed
result_is_stack_write_MUX_uxn_opcodes_h_l3106_c7_72ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3106_c7_72ed_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3106_c7_72ed_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3106_c7_72ed_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3106_c7_72ed_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3106_c7_72ed
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3106_c7_72ed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3106_c7_72ed_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3106_c7_72ed_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3106_c7_72ed_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3106_c7_72ed_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3106_c7_72ed
result_is_opc_done_MUX_uxn_opcodes_h_l3106_c7_72ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3106_c7_72ed_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3106_c7_72ed_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3106_c7_72ed_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3106_c7_72ed_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3106_c7_72ed
result_stack_value_MUX_uxn_opcodes_h_l3106_c7_72ed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3106_c7_72ed_cond,
result_stack_value_MUX_uxn_opcodes_h_l3106_c7_72ed_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3106_c7_72ed_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3106_c7_72ed_return_output);

-- l16_MUX_uxn_opcodes_h_l3106_c7_72ed
l16_MUX_uxn_opcodes_h_l3106_c7_72ed : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l3106_c7_72ed_cond,
l16_MUX_uxn_opcodes_h_l3106_c7_72ed_iftrue,
l16_MUX_uxn_opcodes_h_l3106_c7_72ed_iffalse,
l16_MUX_uxn_opcodes_h_l3106_c7_72ed_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3109_c11_9bf8
BIN_OP_EQ_uxn_opcodes_h_l3109_c11_9bf8 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3109_c11_9bf8_left,
BIN_OP_EQ_uxn_opcodes_h_l3109_c11_9bf8_right,
BIN_OP_EQ_uxn_opcodes_h_l3109_c11_9bf8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3109_c7_c963
result_is_sp_shift_MUX_uxn_opcodes_h_l3109_c7_c963 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3109_c7_c963_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3109_c7_c963_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3109_c7_c963_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3109_c7_c963_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l3109_c7_c963
result_is_stack_read_MUX_uxn_opcodes_h_l3109_c7_c963 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l3109_c7_c963_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l3109_c7_c963_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l3109_c7_c963_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l3109_c7_c963_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3109_c7_c963
result_sp_relative_shift_MUX_uxn_opcodes_h_l3109_c7_c963 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3109_c7_c963_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3109_c7_c963_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3109_c7_c963_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3109_c7_c963_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3109_c7_c963
result_is_stack_write_MUX_uxn_opcodes_h_l3109_c7_c963 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3109_c7_c963_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3109_c7_c963_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3109_c7_c963_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3109_c7_c963_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3109_c7_c963
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3109_c7_c963 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3109_c7_c963_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3109_c7_c963_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3109_c7_c963_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3109_c7_c963_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3109_c7_c963
result_is_opc_done_MUX_uxn_opcodes_h_l3109_c7_c963 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3109_c7_c963_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3109_c7_c963_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3109_c7_c963_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3109_c7_c963_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3109_c7_c963
result_stack_value_MUX_uxn_opcodes_h_l3109_c7_c963 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3109_c7_c963_cond,
result_stack_value_MUX_uxn_opcodes_h_l3109_c7_c963_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3109_c7_c963_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3109_c7_c963_return_output);

-- l16_MUX_uxn_opcodes_h_l3109_c7_c963
l16_MUX_uxn_opcodes_h_l3109_c7_c963 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l3109_c7_c963_cond,
l16_MUX_uxn_opcodes_h_l3109_c7_c963_iftrue,
l16_MUX_uxn_opcodes_h_l3109_c7_c963_iffalse,
l16_MUX_uxn_opcodes_h_l3109_c7_c963_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l3110_c3_443b
BIN_OP_OR_uxn_opcodes_h_l3110_c3_443b : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l3110_c3_443b_left,
BIN_OP_OR_uxn_opcodes_h_l3110_c3_443b_right,
BIN_OP_OR_uxn_opcodes_h_l3110_c3_443b_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l3113_c32_6a34
BIN_OP_AND_uxn_opcodes_h_l3113_c32_6a34 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l3113_c32_6a34_left,
BIN_OP_AND_uxn_opcodes_h_l3113_c32_6a34_right,
BIN_OP_AND_uxn_opcodes_h_l3113_c32_6a34_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l3113_c32_90e9
BIN_OP_GT_uxn_opcodes_h_l3113_c32_90e9 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l3113_c32_90e9_left,
BIN_OP_GT_uxn_opcodes_h_l3113_c32_90e9_right,
BIN_OP_GT_uxn_opcodes_h_l3113_c32_90e9_return_output);

-- MUX_uxn_opcodes_h_l3113_c32_e4e4
MUX_uxn_opcodes_h_l3113_c32_e4e4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l3113_c32_e4e4_cond,
MUX_uxn_opcodes_h_l3113_c32_e4e4_iftrue,
MUX_uxn_opcodes_h_l3113_c32_e4e4_iffalse,
MUX_uxn_opcodes_h_l3113_c32_e4e4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3115_c11_e27c
BIN_OP_EQ_uxn_opcodes_h_l3115_c11_e27c : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3115_c11_e27c_left,
BIN_OP_EQ_uxn_opcodes_h_l3115_c11_e27c_right,
BIN_OP_EQ_uxn_opcodes_h_l3115_c11_e27c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3115_c7_f4b0
result_is_sp_shift_MUX_uxn_opcodes_h_l3115_c7_f4b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3115_c7_f4b0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3115_c7_f4b0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3115_c7_f4b0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3115_c7_f4b0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3115_c7_f4b0
result_is_stack_write_MUX_uxn_opcodes_h_l3115_c7_f4b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3115_c7_f4b0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3115_c7_f4b0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3115_c7_f4b0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3115_c7_f4b0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3115_c7_f4b0
result_is_opc_done_MUX_uxn_opcodes_h_l3115_c7_f4b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3115_c7_f4b0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3115_c7_f4b0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3115_c7_f4b0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3115_c7_f4b0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3115_c7_f4b0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3115_c7_f4b0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3115_c7_f4b0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3115_c7_f4b0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3115_c7_f4b0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3115_c7_f4b0_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3115_c7_f4b0
result_stack_value_MUX_uxn_opcodes_h_l3115_c7_f4b0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3115_c7_f4b0_cond,
result_stack_value_MUX_uxn_opcodes_h_l3115_c7_f4b0_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3115_c7_f4b0_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3115_c7_f4b0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3121_c11_4c3a
BIN_OP_EQ_uxn_opcodes_h_l3121_c11_4c3a : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3121_c11_4c3a_left,
BIN_OP_EQ_uxn_opcodes_h_l3121_c11_4c3a_right,
BIN_OP_EQ_uxn_opcodes_h_l3121_c11_4c3a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3121_c7_5bc3
result_is_stack_write_MUX_uxn_opcodes_h_l3121_c7_5bc3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3121_c7_5bc3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3121_c7_5bc3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3121_c7_5bc3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3121_c7_5bc3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3121_c7_5bc3
result_is_opc_done_MUX_uxn_opcodes_h_l3121_c7_5bc3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3121_c7_5bc3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3121_c7_5bc3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3121_c7_5bc3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3121_c7_5bc3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3121_c7_5bc3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3121_c7_5bc3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3121_c7_5bc3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3121_c7_5bc3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3121_c7_5bc3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3121_c7_5bc3_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3121_c7_5bc3
result_stack_value_MUX_uxn_opcodes_h_l3121_c7_5bc3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3121_c7_5bc3_cond,
result_stack_value_MUX_uxn_opcodes_h_l3121_c7_5bc3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3121_c7_5bc3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3121_c7_5bc3_return_output);

-- CONST_SR_8_uxn_opcodes_h_l3123_c34_4bca
CONST_SR_8_uxn_opcodes_h_l3123_c34_4bca : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l3123_c34_4bca_x,
CONST_SR_8_uxn_opcodes_h_l3123_c34_4bca_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3125_c11_ed85
BIN_OP_EQ_uxn_opcodes_h_l3125_c11_ed85 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3125_c11_ed85_left,
BIN_OP_EQ_uxn_opcodes_h_l3125_c11_ed85_right,
BIN_OP_EQ_uxn_opcodes_h_l3125_c11_ed85_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3125_c7_1d5e
result_is_stack_write_MUX_uxn_opcodes_h_l3125_c7_1d5e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3125_c7_1d5e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3125_c7_1d5e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3125_c7_1d5e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3125_c7_1d5e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3125_c7_1d5e
result_is_opc_done_MUX_uxn_opcodes_h_l3125_c7_1d5e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3125_c7_1d5e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3125_c7_1d5e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3125_c7_1d5e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3125_c7_1d5e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3125_c7_1d5e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3125_c7_1d5e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3125_c7_1d5e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3125_c7_1d5e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3125_c7_1d5e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3125_c7_1d5e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3125_c7_1d5e
result_stack_value_MUX_uxn_opcodes_h_l3125_c7_1d5e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3125_c7_1d5e_cond,
result_stack_value_MUX_uxn_opcodes_h_l3125_c7_1d5e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3125_c7_1d5e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3125_c7_1d5e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3129_c11_977a
BIN_OP_EQ_uxn_opcodes_h_l3129_c11_977a : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3129_c11_977a_left,
BIN_OP_EQ_uxn_opcodes_h_l3129_c11_977a_right,
BIN_OP_EQ_uxn_opcodes_h_l3129_c11_977a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3129_c7_f70f
result_is_stack_write_MUX_uxn_opcodes_h_l3129_c7_f70f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3129_c7_f70f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3129_c7_f70f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3129_c7_f70f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3129_c7_f70f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3129_c7_f70f
result_is_opc_done_MUX_uxn_opcodes_h_l3129_c7_f70f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3129_c7_f70f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3129_c7_f70f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3129_c7_f70f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3129_c7_f70f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3129_c7_f70f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3129_c7_f70f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3129_c7_f70f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3129_c7_f70f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3129_c7_f70f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3129_c7_f70f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3129_c7_f70f
result_stack_value_MUX_uxn_opcodes_h_l3129_c7_f70f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3129_c7_f70f_cond,
result_stack_value_MUX_uxn_opcodes_h_l3129_c7_f70f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3129_c7_f70f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3129_c7_f70f_return_output);

-- CONST_SR_8_uxn_opcodes_h_l3131_c34_d544
CONST_SR_8_uxn_opcodes_h_l3131_c34_d544 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l3131_c34_d544_x,
CONST_SR_8_uxn_opcodes_h_l3131_c34_d544_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3133_c11_aaec
BIN_OP_EQ_uxn_opcodes_h_l3133_c11_aaec : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3133_c11_aaec_left,
BIN_OP_EQ_uxn_opcodes_h_l3133_c11_aaec_right,
BIN_OP_EQ_uxn_opcodes_h_l3133_c11_aaec_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3133_c7_b584
result_is_stack_write_MUX_uxn_opcodes_h_l3133_c7_b584 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3133_c7_b584_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3133_c7_b584_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3133_c7_b584_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3133_c7_b584_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3133_c7_b584
result_is_opc_done_MUX_uxn_opcodes_h_l3133_c7_b584 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3133_c7_b584_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3133_c7_b584_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3133_c7_b584_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3133_c7_b584_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3133_c7_b584
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3133_c7_b584 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3133_c7_b584_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3133_c7_b584_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3133_c7_b584_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3133_c7_b584_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3133_c7_b584
result_stack_value_MUX_uxn_opcodes_h_l3133_c7_b584 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3133_c7_b584_cond,
result_stack_value_MUX_uxn_opcodes_h_l3133_c7_b584_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3133_c7_b584_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3133_c7_b584_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3137_c11_2153
BIN_OP_EQ_uxn_opcodes_h_l3137_c11_2153 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3137_c11_2153_left,
BIN_OP_EQ_uxn_opcodes_h_l3137_c11_2153_right,
BIN_OP_EQ_uxn_opcodes_h_l3137_c11_2153_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3137_c7_a254
result_is_stack_write_MUX_uxn_opcodes_h_l3137_c7_a254 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3137_c7_a254_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3137_c7_a254_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3137_c7_a254_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3137_c7_a254_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3137_c7_a254
result_is_opc_done_MUX_uxn_opcodes_h_l3137_c7_a254 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3137_c7_a254_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3137_c7_a254_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3137_c7_a254_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3137_c7_a254_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3137_c7_a254
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3137_c7_a254 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3137_c7_a254_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3137_c7_a254_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3137_c7_a254_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3137_c7_a254_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3137_c7_a254
result_stack_value_MUX_uxn_opcodes_h_l3137_c7_a254 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3137_c7_a254_cond,
result_stack_value_MUX_uxn_opcodes_h_l3137_c7_a254_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3137_c7_a254_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3137_c7_a254_return_output);

-- CONST_SR_8_uxn_opcodes_h_l3139_c34_eaff
CONST_SR_8_uxn_opcodes_h_l3139_c34_eaff : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l3139_c34_eaff_x,
CONST_SR_8_uxn_opcodes_h_l3139_c34_eaff_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3141_c11_7c77
BIN_OP_EQ_uxn_opcodes_h_l3141_c11_7c77 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3141_c11_7c77_left,
BIN_OP_EQ_uxn_opcodes_h_l3141_c11_7c77_right,
BIN_OP_EQ_uxn_opcodes_h_l3141_c11_7c77_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3141_c7_1959
result_is_stack_write_MUX_uxn_opcodes_h_l3141_c7_1959 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3141_c7_1959_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3141_c7_1959_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3141_c7_1959_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3141_c7_1959_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3141_c7_1959
result_is_opc_done_MUX_uxn_opcodes_h_l3141_c7_1959 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3141_c7_1959_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3141_c7_1959_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3141_c7_1959_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3141_c7_1959_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l3103_l3088_l3073_DUPLICATE_fa25
CONST_SL_8_uint16_t_uxn_opcodes_h_l3103_l3088_l3073_DUPLICATE_fa25 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l3103_l3088_l3073_DUPLICATE_fa25_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l3103_l3088_l3073_DUPLICATE_fa25_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l3062_c6_d47c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_d798_return_output,
 n16_MUX_uxn_opcodes_h_l3062_c2_8cc9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3062_c2_8cc9_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l3062_c2_8cc9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3062_c2_8cc9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3062_c2_8cc9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3062_c2_8cc9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3062_c2_8cc9_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3062_c2_8cc9_return_output,
 t16_MUX_uxn_opcodes_h_l3062_c2_8cc9_return_output,
 l16_MUX_uxn_opcodes_h_l3062_c2_8cc9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3068_c11_7a05_return_output,
 n16_MUX_uxn_opcodes_h_l3068_c7_7c53_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3068_c7_7c53_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l3068_c7_7c53_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3068_c7_7c53_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3068_c7_7c53_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3068_c7_7c53_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3068_c7_7c53_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3068_c7_7c53_return_output,
 t16_MUX_uxn_opcodes_h_l3068_c7_7c53_return_output,
 l16_MUX_uxn_opcodes_h_l3068_c7_7c53_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3071_c11_6639_return_output,
 n16_MUX_uxn_opcodes_h_l3071_c7_94c5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3071_c7_94c5_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l3071_c7_94c5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3071_c7_94c5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3071_c7_94c5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3071_c7_94c5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3071_c7_94c5_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3071_c7_94c5_return_output,
 t16_MUX_uxn_opcodes_h_l3071_c7_94c5_return_output,
 l16_MUX_uxn_opcodes_h_l3071_c7_94c5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3076_c11_982e_return_output,
 n16_MUX_uxn_opcodes_h_l3076_c7_6a3f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3076_c7_6a3f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l3076_c7_6a3f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3076_c7_6a3f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3076_c7_6a3f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3076_c7_6a3f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3076_c7_6a3f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3076_c7_6a3f_return_output,
 t16_MUX_uxn_opcodes_h_l3076_c7_6a3f_return_output,
 l16_MUX_uxn_opcodes_h_l3076_c7_6a3f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3079_c11_0c7b_return_output,
 n16_MUX_uxn_opcodes_h_l3079_c7_4155_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3079_c7_4155_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l3079_c7_4155_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3079_c7_4155_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3079_c7_4155_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3079_c7_4155_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3079_c7_4155_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3079_c7_4155_return_output,
 t16_MUX_uxn_opcodes_h_l3079_c7_4155_return_output,
 l16_MUX_uxn_opcodes_h_l3079_c7_4155_return_output,
 BIN_OP_OR_uxn_opcodes_h_l3080_c3_5ac0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3083_c11_493f_return_output,
 n16_MUX_uxn_opcodes_h_l3083_c7_bb56_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3083_c7_bb56_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l3083_c7_bb56_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3083_c7_bb56_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3083_c7_bb56_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3083_c7_bb56_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3083_c7_bb56_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3083_c7_bb56_return_output,
 l16_MUX_uxn_opcodes_h_l3083_c7_bb56_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3086_c11_9370_return_output,
 n16_MUX_uxn_opcodes_h_l3086_c7_a1ba_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3086_c7_a1ba_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l3086_c7_a1ba_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3086_c7_a1ba_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3086_c7_a1ba_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3086_c7_a1ba_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3086_c7_a1ba_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3086_c7_a1ba_return_output,
 l16_MUX_uxn_opcodes_h_l3086_c7_a1ba_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3091_c11_972f_return_output,
 n16_MUX_uxn_opcodes_h_l3091_c7_0749_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3091_c7_0749_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l3091_c7_0749_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3091_c7_0749_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3091_c7_0749_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3091_c7_0749_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3091_c7_0749_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3091_c7_0749_return_output,
 l16_MUX_uxn_opcodes_h_l3091_c7_0749_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3094_c11_21fc_return_output,
 n16_MUX_uxn_opcodes_h_l3094_c7_853c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3094_c7_853c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l3094_c7_853c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3094_c7_853c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3094_c7_853c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3094_c7_853c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3094_c7_853c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3094_c7_853c_return_output,
 l16_MUX_uxn_opcodes_h_l3094_c7_853c_return_output,
 BIN_OP_OR_uxn_opcodes_h_l3095_c3_709c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3098_c11_1d96_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3098_c7_3a39_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l3098_c7_3a39_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3098_c7_3a39_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3098_c7_3a39_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3098_c7_3a39_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3098_c7_3a39_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3098_c7_3a39_return_output,
 l16_MUX_uxn_opcodes_h_l3098_c7_3a39_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3101_c11_3d69_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3101_c7_6dee_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l3101_c7_6dee_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3101_c7_6dee_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3101_c7_6dee_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3101_c7_6dee_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3101_c7_6dee_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3101_c7_6dee_return_output,
 l16_MUX_uxn_opcodes_h_l3101_c7_6dee_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3106_c11_2b9d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3106_c7_72ed_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l3106_c7_72ed_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3106_c7_72ed_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3106_c7_72ed_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3106_c7_72ed_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3106_c7_72ed_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3106_c7_72ed_return_output,
 l16_MUX_uxn_opcodes_h_l3106_c7_72ed_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3109_c11_9bf8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3109_c7_c963_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l3109_c7_c963_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3109_c7_c963_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3109_c7_c963_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3109_c7_c963_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3109_c7_c963_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3109_c7_c963_return_output,
 l16_MUX_uxn_opcodes_h_l3109_c7_c963_return_output,
 BIN_OP_OR_uxn_opcodes_h_l3110_c3_443b_return_output,
 BIN_OP_AND_uxn_opcodes_h_l3113_c32_6a34_return_output,
 BIN_OP_GT_uxn_opcodes_h_l3113_c32_90e9_return_output,
 MUX_uxn_opcodes_h_l3113_c32_e4e4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3115_c11_e27c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3115_c7_f4b0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3115_c7_f4b0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3115_c7_f4b0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3115_c7_f4b0_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3115_c7_f4b0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3121_c11_4c3a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3121_c7_5bc3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3121_c7_5bc3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3121_c7_5bc3_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3121_c7_5bc3_return_output,
 CONST_SR_8_uxn_opcodes_h_l3123_c34_4bca_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3125_c11_ed85_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3125_c7_1d5e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3125_c7_1d5e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3125_c7_1d5e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3125_c7_1d5e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3129_c11_977a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3129_c7_f70f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3129_c7_f70f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3129_c7_f70f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3129_c7_f70f_return_output,
 CONST_SR_8_uxn_opcodes_h_l3131_c34_d544_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3133_c11_aaec_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3133_c7_b584_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3133_c7_b584_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3133_c7_b584_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3133_c7_b584_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3137_c11_2153_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3137_c7_a254_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3137_c7_a254_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3137_c7_a254_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3137_c7_a254_return_output,
 CONST_SR_8_uxn_opcodes_h_l3139_c34_eaff_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3141_c11_7c77_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3141_c7_1959_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3141_c7_1959_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l3103_l3088_l3073_DUPLICATE_fa25_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3062_c6_d47c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3062_c6_d47c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3062_c6_d47c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_d798_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_d798_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_d798_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_d798_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3062_c2_8cc9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3062_c2_8cc9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3068_c7_7c53_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3062_c2_8cc9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3062_c2_8cc9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3062_c2_8cc9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3062_c2_8cc9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3068_c7_7c53_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3062_c2_8cc9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3062_c2_8cc9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3062_c2_8cc9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3062_c2_8cc9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3068_c7_7c53_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3062_c2_8cc9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3062_c2_8cc9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3062_c2_8cc9_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3062_c2_8cc9_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3068_c7_7c53_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3062_c2_8cc9_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3062_c2_8cc9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3062_c2_8cc9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3062_c2_8cc9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3068_c7_7c53_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3062_c2_8cc9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3062_c2_8cc9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3062_c2_8cc9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3065_c3_b6ee : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3062_c2_8cc9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3068_c7_7c53_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3062_c2_8cc9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3062_c2_8cc9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3062_c2_8cc9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3062_c2_8cc9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3068_c7_7c53_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3062_c2_8cc9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3062_c2_8cc9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3062_c2_8cc9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3062_c2_8cc9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3068_c7_7c53_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3062_c2_8cc9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3062_c2_8cc9_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3062_c2_8cc9_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3062_c2_8cc9_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3068_c7_7c53_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3062_c2_8cc9_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3062_c2_8cc9_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3062_c2_8cc9_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3062_c2_8cc9_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3068_c7_7c53_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3062_c2_8cc9_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3062_c2_8cc9_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l3063_c3_da29_uxn_opcodes_h_l3063_c3_da29_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c11_7a05_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c11_7a05_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c11_7a05_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3068_c7_7c53_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3068_c7_7c53_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3071_c7_94c5_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3068_c7_7c53_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3068_c7_7c53_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3068_c7_7c53_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3071_c7_94c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3068_c7_7c53_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3068_c7_7c53_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3068_c7_7c53_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3071_c7_94c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3068_c7_7c53_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3068_c7_7c53_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3068_c7_7c53_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3071_c7_94c5_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3068_c7_7c53_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3068_c7_7c53_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3068_c7_7c53_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3071_c7_94c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3068_c7_7c53_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3068_c7_7c53_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3069_c3_40b1 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3068_c7_7c53_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3071_c7_94c5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3068_c7_7c53_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3068_c7_7c53_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3068_c7_7c53_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3071_c7_94c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3068_c7_7c53_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3068_c7_7c53_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3068_c7_7c53_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3071_c7_94c5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3068_c7_7c53_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3068_c7_7c53_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3068_c7_7c53_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3071_c7_94c5_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3068_c7_7c53_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3068_c7_7c53_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3068_c7_7c53_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3071_c7_94c5_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3068_c7_7c53_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3071_c11_6639_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3071_c11_6639_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3071_c11_6639_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3071_c7_94c5_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3071_c7_94c5_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3076_c7_6a3f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3071_c7_94c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3071_c7_94c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3071_c7_94c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3076_c7_6a3f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3071_c7_94c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3071_c7_94c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3071_c7_94c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3076_c7_6a3f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3071_c7_94c5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3071_c7_94c5_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3071_c7_94c5_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3076_c7_6a3f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3071_c7_94c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3071_c7_94c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3071_c7_94c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3076_c7_6a3f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3071_c7_94c5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3071_c7_94c5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3074_c3_8045 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3071_c7_94c5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3076_c7_6a3f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3071_c7_94c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3071_c7_94c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3071_c7_94c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3076_c7_6a3f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3071_c7_94c5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3071_c7_94c5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3071_c7_94c5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3076_c7_6a3f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3071_c7_94c5_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3071_c7_94c5_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3071_c7_94c5_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3076_c7_6a3f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3071_c7_94c5_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3071_c7_94c5_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3071_c7_94c5_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3076_c7_6a3f_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3071_c7_94c5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_982e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_982e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_982e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3076_c7_6a3f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3076_c7_6a3f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3079_c7_4155_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3076_c7_6a3f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3076_c7_6a3f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3076_c7_6a3f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3079_c7_4155_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3076_c7_6a3f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3076_c7_6a3f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3076_c7_6a3f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3079_c7_4155_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3076_c7_6a3f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3076_c7_6a3f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3076_c7_6a3f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3079_c7_4155_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3076_c7_6a3f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3076_c7_6a3f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3076_c7_6a3f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3079_c7_4155_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3076_c7_6a3f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3076_c7_6a3f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3077_c3_c4c3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3076_c7_6a3f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3079_c7_4155_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3076_c7_6a3f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3076_c7_6a3f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3076_c7_6a3f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3079_c7_4155_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3076_c7_6a3f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3076_c7_6a3f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3076_c7_6a3f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3079_c7_4155_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3076_c7_6a3f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3076_c7_6a3f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3076_c7_6a3f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3079_c7_4155_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3076_c7_6a3f_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3076_c7_6a3f_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3076_c7_6a3f_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3079_c7_4155_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3076_c7_6a3f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3079_c11_0c7b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3079_c11_0c7b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3079_c11_0c7b_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3079_c7_4155_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3079_c7_4155_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3083_c7_bb56_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3079_c7_4155_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3079_c7_4155_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3079_c7_4155_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3083_c7_bb56_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3079_c7_4155_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3079_c7_4155_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3079_c7_4155_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3083_c7_bb56_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3079_c7_4155_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3079_c7_4155_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3079_c7_4155_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3083_c7_bb56_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3079_c7_4155_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3079_c7_4155_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3079_c7_4155_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3083_c7_bb56_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3079_c7_4155_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3079_c7_4155_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3081_c3_185e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3079_c7_4155_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3083_c7_bb56_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3079_c7_4155_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3079_c7_4155_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3079_c7_4155_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3083_c7_bb56_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3079_c7_4155_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3079_c7_4155_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3079_c7_4155_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3083_c7_bb56_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3079_c7_4155_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3079_c7_4155_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3079_c7_4155_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3079_c7_4155_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3079_c7_4155_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3079_c7_4155_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3083_c7_bb56_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3079_c7_4155_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l3080_c3_5ac0_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l3080_c3_5ac0_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l3080_c3_5ac0_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3083_c11_493f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3083_c11_493f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3083_c11_493f_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3083_c7_bb56_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3083_c7_bb56_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3086_c7_a1ba_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3083_c7_bb56_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3083_c7_bb56_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3083_c7_bb56_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3086_c7_a1ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3083_c7_bb56_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3083_c7_bb56_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3083_c7_bb56_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3086_c7_a1ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3083_c7_bb56_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3083_c7_bb56_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3083_c7_bb56_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3086_c7_a1ba_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3083_c7_bb56_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3083_c7_bb56_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3083_c7_bb56_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3086_c7_a1ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3083_c7_bb56_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3083_c7_bb56_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3084_c3_5b4a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3083_c7_bb56_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3086_c7_a1ba_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3083_c7_bb56_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3083_c7_bb56_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3083_c7_bb56_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3086_c7_a1ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3083_c7_bb56_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3083_c7_bb56_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3083_c7_bb56_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3086_c7_a1ba_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3083_c7_bb56_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3083_c7_bb56_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3083_c7_bb56_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3086_c7_a1ba_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3083_c7_bb56_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3086_c11_9370_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3086_c11_9370_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3086_c11_9370_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3086_c7_a1ba_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3086_c7_a1ba_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3091_c7_0749_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3086_c7_a1ba_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3086_c7_a1ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3086_c7_a1ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3091_c7_0749_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3086_c7_a1ba_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3086_c7_a1ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3086_c7_a1ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3091_c7_0749_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3086_c7_a1ba_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3086_c7_a1ba_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3086_c7_a1ba_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3091_c7_0749_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3086_c7_a1ba_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3086_c7_a1ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3086_c7_a1ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3091_c7_0749_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3086_c7_a1ba_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3086_c7_a1ba_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3089_c3_e32e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3086_c7_a1ba_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3091_c7_0749_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3086_c7_a1ba_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3086_c7_a1ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3086_c7_a1ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3091_c7_0749_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3086_c7_a1ba_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3086_c7_a1ba_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3086_c7_a1ba_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3091_c7_0749_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3086_c7_a1ba_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3086_c7_a1ba_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3086_c7_a1ba_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3091_c7_0749_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3086_c7_a1ba_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3091_c11_972f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3091_c11_972f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3091_c11_972f_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3091_c7_0749_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3091_c7_0749_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3094_c7_853c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3091_c7_0749_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3091_c7_0749_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3091_c7_0749_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3094_c7_853c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3091_c7_0749_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3091_c7_0749_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3091_c7_0749_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3094_c7_853c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3091_c7_0749_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3091_c7_0749_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3091_c7_0749_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3094_c7_853c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3091_c7_0749_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3091_c7_0749_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3091_c7_0749_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3094_c7_853c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3091_c7_0749_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3091_c7_0749_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3092_c3_f76d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3091_c7_0749_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3094_c7_853c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3091_c7_0749_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3091_c7_0749_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3091_c7_0749_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3094_c7_853c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3091_c7_0749_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3091_c7_0749_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3091_c7_0749_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3094_c7_853c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3091_c7_0749_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3091_c7_0749_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3091_c7_0749_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3094_c7_853c_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3091_c7_0749_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3094_c11_21fc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3094_c11_21fc_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3094_c11_21fc_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3094_c7_853c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3094_c7_853c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l3094_c7_853c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3094_c7_853c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3094_c7_853c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3098_c7_3a39_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3094_c7_853c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3094_c7_853c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3094_c7_853c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3098_c7_3a39_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3094_c7_853c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3094_c7_853c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3094_c7_853c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3098_c7_3a39_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3094_c7_853c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3094_c7_853c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3094_c7_853c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3098_c7_3a39_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3094_c7_853c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3094_c7_853c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3096_c3_2b2b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3094_c7_853c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3098_c7_3a39_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3094_c7_853c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3094_c7_853c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3094_c7_853c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3098_c7_3a39_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3094_c7_853c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3094_c7_853c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3094_c7_853c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3098_c7_3a39_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3094_c7_853c_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3094_c7_853c_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3094_c7_853c_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3098_c7_3a39_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3094_c7_853c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l3095_c3_709c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l3095_c3_709c_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l3095_c3_709c_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3098_c11_1d96_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3098_c11_1d96_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3098_c11_1d96_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3098_c7_3a39_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3098_c7_3a39_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3101_c7_6dee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3098_c7_3a39_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3098_c7_3a39_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3098_c7_3a39_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3101_c7_6dee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3098_c7_3a39_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3098_c7_3a39_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3098_c7_3a39_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3101_c7_6dee_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3098_c7_3a39_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3098_c7_3a39_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3098_c7_3a39_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3101_c7_6dee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3098_c7_3a39_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3098_c7_3a39_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3099_c3_62e0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3098_c7_3a39_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3101_c7_6dee_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3098_c7_3a39_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3098_c7_3a39_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3098_c7_3a39_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3101_c7_6dee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3098_c7_3a39_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3098_c7_3a39_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3098_c7_3a39_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3101_c7_6dee_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3098_c7_3a39_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3098_c7_3a39_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3098_c7_3a39_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3101_c7_6dee_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3098_c7_3a39_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3101_c11_3d69_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3101_c11_3d69_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3101_c11_3d69_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3101_c7_6dee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3101_c7_6dee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3106_c7_72ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3101_c7_6dee_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3101_c7_6dee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3101_c7_6dee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3106_c7_72ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3101_c7_6dee_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3101_c7_6dee_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3101_c7_6dee_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3106_c7_72ed_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3101_c7_6dee_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3101_c7_6dee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3101_c7_6dee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3106_c7_72ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3101_c7_6dee_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3101_c7_6dee_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3104_c3_4bac : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3101_c7_6dee_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3106_c7_72ed_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3101_c7_6dee_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3101_c7_6dee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3101_c7_6dee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3106_c7_72ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3101_c7_6dee_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3101_c7_6dee_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3101_c7_6dee_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3106_c7_72ed_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3101_c7_6dee_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3101_c7_6dee_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3101_c7_6dee_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3106_c7_72ed_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3101_c7_6dee_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3106_c11_2b9d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3106_c11_2b9d_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3106_c11_2b9d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3106_c7_72ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3106_c7_72ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3109_c7_c963_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3106_c7_72ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3106_c7_72ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3106_c7_72ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3109_c7_c963_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3106_c7_72ed_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3106_c7_72ed_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3106_c7_72ed_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3109_c7_c963_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3106_c7_72ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3106_c7_72ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3106_c7_72ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3109_c7_c963_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3106_c7_72ed_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3106_c7_72ed_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3107_c3_cc8a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3106_c7_72ed_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3109_c7_c963_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3106_c7_72ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3106_c7_72ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3106_c7_72ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3109_c7_c963_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3106_c7_72ed_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3106_c7_72ed_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3106_c7_72ed_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3109_c7_c963_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3106_c7_72ed_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3106_c7_72ed_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3106_c7_72ed_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3109_c7_c963_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3106_c7_72ed_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3109_c11_9bf8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3109_c11_9bf8_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3109_c11_9bf8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3109_c7_c963_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3109_c7_c963_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3115_c7_f4b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3109_c7_c963_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3109_c7_c963_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3109_c7_c963_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3109_c7_c963_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3109_c7_c963_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3109_c7_c963_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3109_c7_c963_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3109_c7_c963_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3109_c7_c963_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3115_c7_f4b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3109_c7_c963_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3109_c7_c963_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3109_c7_c963_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3115_c7_f4b0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3109_c7_c963_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3109_c7_c963_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3109_c7_c963_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3115_c7_f4b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3109_c7_c963_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3109_c7_c963_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3109_c7_c963_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3115_c7_f4b0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3109_c7_c963_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3109_c7_c963_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3109_c7_c963_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l3109_c7_c963_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l3110_c3_443b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l3110_c3_443b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l3110_c3_443b_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3113_c32_e4e4_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3113_c32_e4e4_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3113_c32_e4e4_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3113_c32_6a34_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3113_c32_6a34_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3113_c32_6a34_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3113_c32_90e9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3113_c32_90e9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3113_c32_90e9_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3113_c32_e4e4_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3115_c11_e27c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3115_c11_e27c_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3115_c11_e27c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3115_c7_f4b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3115_c7_f4b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3115_c7_f4b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3115_c7_f4b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3115_c7_f4b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3121_c7_5bc3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3115_c7_f4b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3115_c7_f4b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3115_c7_f4b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3121_c7_5bc3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3115_c7_f4b0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3115_c7_f4b0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3118_c3_9019 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3115_c7_f4b0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3121_c7_5bc3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3115_c7_f4b0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3115_c7_f4b0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3115_c7_f4b0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3121_c7_5bc3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3115_c7_f4b0_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3119_c24_f94c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3121_c11_4c3a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3121_c11_4c3a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3121_c11_4c3a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3121_c7_5bc3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3121_c7_5bc3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3125_c7_1d5e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3121_c7_5bc3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3121_c7_5bc3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3121_c7_5bc3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3125_c7_1d5e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3121_c7_5bc3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3121_c7_5bc3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3122_c3_ec6e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3121_c7_5bc3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3125_c7_1d5e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3121_c7_5bc3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3121_c7_5bc3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3121_c7_5bc3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3125_c7_1d5e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3121_c7_5bc3_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l3123_c34_4bca_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l3123_c34_4bca_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3123_c24_aa6a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3125_c11_ed85_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3125_c11_ed85_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3125_c11_ed85_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3125_c7_1d5e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3125_c7_1d5e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3129_c7_f70f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3125_c7_1d5e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3125_c7_1d5e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3125_c7_1d5e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3129_c7_f70f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3125_c7_1d5e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3125_c7_1d5e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3126_c3_972e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3125_c7_1d5e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3129_c7_f70f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3125_c7_1d5e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3125_c7_1d5e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3125_c7_1d5e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3129_c7_f70f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3125_c7_1d5e_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3127_c24_5f31_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3129_c11_977a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3129_c11_977a_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3129_c11_977a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3129_c7_f70f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3129_c7_f70f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3133_c7_b584_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3129_c7_f70f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3129_c7_f70f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3129_c7_f70f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3133_c7_b584_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3129_c7_f70f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3129_c7_f70f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3130_c3_20a3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3129_c7_f70f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3133_c7_b584_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3129_c7_f70f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3129_c7_f70f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3129_c7_f70f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3133_c7_b584_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3129_c7_f70f_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l3131_c34_d544_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l3131_c34_d544_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3131_c24_e621_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3133_c11_aaec_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3133_c11_aaec_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3133_c11_aaec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3133_c7_b584_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3133_c7_b584_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3137_c7_a254_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3133_c7_b584_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3133_c7_b584_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3133_c7_b584_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3137_c7_a254_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3133_c7_b584_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3133_c7_b584_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3134_c3_80c2 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3133_c7_b584_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3137_c7_a254_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3133_c7_b584_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3133_c7_b584_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3133_c7_b584_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3137_c7_a254_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3133_c7_b584_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3135_c24_2b14_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3137_c11_2153_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3137_c11_2153_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3137_c11_2153_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3137_c7_a254_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3137_c7_a254_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3141_c7_1959_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3137_c7_a254_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3137_c7_a254_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3137_c7_a254_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3141_c7_1959_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3137_c7_a254_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3137_c7_a254_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3138_c3_efdc : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3137_c7_a254_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3137_c7_a254_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3137_c7_a254_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3137_c7_a254_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3137_c7_a254_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l3139_c34_eaff_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l3139_c34_eaff_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3139_c24_a224_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3141_c11_7c77_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3141_c11_7c77_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3141_c11_7c77_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3141_c7_1959_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3141_c7_1959_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3141_c7_1959_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3141_c7_1959_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3141_c7_1959_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3141_c7_1959_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3106_l3079_l3101_l3076_l3098_l3071_l3094_l3068_l3091_l3115_l3062_l3086_l3083_DUPLICATE_581b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3106_l3079_l3101_l3076_l3098_l3071_l3094_l3068_l3091_l3062_l3086_l3109_l3083_DUPLICATE_f51a_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3141_l3137_l3133_l3129_l3125_l3121_l3109_l3106_l3101_l3098_l3094_l3091_l3086_l3083_l3079_l3076_l3071_l3068_l3062_DUPLICATE_4193_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3106_l3079_l3101_l3076_l3098_l3071_l3094_l3068_l3091_l3062_l3086_l3109_l3137_l3083_DUPLICATE_bb1a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3106_l3079_l3101_l3076_l3098_l3071_l3094_l3068_l3091_l3086_l3109_l3083_DUPLICATE_8984_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3141_l3137_l3133_l3129_l3125_l3121_l3115_l3109_l3106_l3101_l3098_l3094_l3091_l3086_l3083_l3079_l3076_l3071_l3068_DUPLICATE_451f_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l3087_l3072_l3080_l3110_l3102_l3095_DUPLICATE_4da0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l3103_l3088_l3073_DUPLICATE_fa25_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l3103_l3088_l3073_DUPLICATE_fa25_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3109_l3137_DUPLICATE_bc5a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l3146_l3058_DUPLICATE_a3a4_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3081_c3_185e := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3079_c7_4155_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3081_c3_185e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3071_c11_6639_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3077_c3_c4c3 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3076_c7_6a3f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3077_c3_c4c3;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_982e_right := to_unsigned(3, 2);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3109_c7_c963_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3086_c11_9370_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3106_c11_2b9d_right := to_unsigned(11, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3092_c3_f76d := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3091_c7_0749_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3092_c3_f76d;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3065_c3_b6ee := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3062_c2_8cc9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3065_c3_b6ee;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3115_c7_f4b0_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3109_c7_c963_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3107_c3_cc8a := resize(to_unsigned(5, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3106_c7_72ed_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3107_c3_cc8a;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3084_c3_5b4a := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3083_c7_bb56_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3084_c3_5b4a;
     VAR_BIN_OP_AND_uxn_opcodes_h_l3113_c32_6a34_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c11_7a05_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3122_c3_ec6e := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3121_c7_5bc3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3122_c3_ec6e;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3138_c3_efdc := resize(to_unsigned(6, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3137_c7_a254_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3138_c3_efdc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3121_c11_4c3a_right := to_unsigned(14, 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3062_c2_8cc9_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3089_c3_e32e := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3086_c7_a1ba_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3089_c3_e32e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3079_c11_0c7b_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3069_c3_40b1 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3068_c7_7c53_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3069_c3_40b1;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3126_c3_972e := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3125_c7_1d5e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3126_c3_972e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3109_c11_9bf8_right := to_unsigned(12, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3101_c11_3d69_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3083_c11_493f_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3096_c3_2b2b := resize(to_unsigned(6, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3094_c7_853c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3096_c3_2b2b;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3130_c3_20a3 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3129_c7_f70f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3130_c3_20a3;
     VAR_MUX_uxn_opcodes_h_l3113_c32_e4e4_iftrue := signed(std_logic_vector(resize(to_unsigned(6, 3), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3129_c11_977a_right := to_unsigned(16, 5);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3141_c7_1959_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3115_c7_f4b0_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3141_c7_1959_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3115_c11_e27c_right := to_unsigned(13, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3125_c11_ed85_right := to_unsigned(15, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3134_c3_80c2 := resize(to_unsigned(5, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3133_c7_b584_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3134_c3_80c2;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3091_c11_972f_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3118_c3_9019 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3115_c7_f4b0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3118_c3_9019;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3074_c3_8045 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3071_c7_94c5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3074_c3_8045;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3098_c11_1d96_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3133_c11_aaec_right := to_unsigned(17, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3062_c6_d47c_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3094_c11_21fc_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3141_c11_7c77_right := to_unsigned(19, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_d798_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3062_c2_8cc9_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3137_c11_2153_right := to_unsigned(18, 5);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3104_c3_4bac := resize(to_unsigned(5, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3101_c7_6dee_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3104_c3_4bac;
     VAR_MUX_uxn_opcodes_h_l3113_c32_e4e4_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_BIN_OP_GT_uxn_opcodes_h_l3113_c32_90e9_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3099_c3_62e0 := resize(to_unsigned(6, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3098_c7_3a39_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3099_c3_62e0;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_d798_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l3113_c32_6a34_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l3110_c3_443b_left := l16;
     VAR_CONST_SR_8_uxn_opcodes_h_l3123_c34_4bca_x := l16;
     VAR_l16_MUX_uxn_opcodes_h_l3062_c2_8cc9_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l3068_c7_7c53_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l3071_c7_94c5_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l3076_c7_6a3f_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l3079_c7_4155_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l3083_c7_bb56_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l3086_c7_a1ba_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l3091_c7_0749_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l3094_c7_853c_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l3098_c7_3a39_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l3106_c7_72ed_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l3109_c7_c963_iffalse := l16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l3095_c3_709c_left := n16;
     VAR_CONST_SR_8_uxn_opcodes_h_l3139_c34_eaff_x := n16;
     VAR_n16_MUX_uxn_opcodes_h_l3062_c2_8cc9_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l3068_c7_7c53_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l3071_c7_94c5_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l3076_c7_6a3f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l3079_c7_4155_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l3083_c7_bb56_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l3091_c7_0749_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l3094_c7_853c_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3062_c6_d47c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c11_7a05_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3071_c11_6639_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_982e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3079_c11_0c7b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3083_c11_493f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3086_c11_9370_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3091_c11_972f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3094_c11_21fc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3098_c11_1d96_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3101_c11_3d69_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3106_c11_2b9d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3109_c11_9bf8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3115_c11_e27c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3121_c11_4c3a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3125_c11_ed85_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3129_c11_977a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3133_c11_aaec_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3137_c11_2153_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3141_c11_7c77_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l3080_c3_5ac0_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l3131_c34_d544_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l3062_c2_8cc9_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l3068_c7_7c53_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l3076_c7_6a3f_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l3079_c7_4155_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l3109_c11_9bf8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3109_c11_9bf8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3109_c11_9bf8_left;
     BIN_OP_EQ_uxn_opcodes_h_l3109_c11_9bf8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3109_c11_9bf8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3109_c11_9bf8_return_output := BIN_OP_EQ_uxn_opcodes_h_l3109_c11_9bf8_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3106_l3079_l3101_l3076_l3098_l3071_l3094_l3068_l3091_l3062_l3086_l3109_l3083_DUPLICATE_f51a LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3106_l3079_l3101_l3076_l3098_l3071_l3094_l3068_l3091_l3062_l3086_l3109_l3083_DUPLICATE_f51a_return_output := result.sp_relative_shift;

     -- CONST_SR_8[uxn_opcodes_h_l3123_c34_4bca] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l3123_c34_4bca_x <= VAR_CONST_SR_8_uxn_opcodes_h_l3123_c34_4bca_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l3123_c34_4bca_return_output := CONST_SR_8_uxn_opcodes_h_l3123_c34_4bca_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3101_c11_3d69] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3101_c11_3d69_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3101_c11_3d69_left;
     BIN_OP_EQ_uxn_opcodes_h_l3101_c11_3d69_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3101_c11_3d69_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3101_c11_3d69_return_output := BIN_OP_EQ_uxn_opcodes_h_l3101_c11_3d69_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3141_l3137_l3133_l3129_l3125_l3121_l3109_l3106_l3101_l3098_l3094_l3091_l3086_l3083_l3079_l3076_l3071_l3068_l3062_DUPLICATE_4193 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3141_l3137_l3133_l3129_l3125_l3121_l3109_l3106_l3101_l3098_l3094_l3091_l3086_l3083_l3079_l3076_l3071_l3068_l3062_DUPLICATE_4193_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l3091_c11_972f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3091_c11_972f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3091_c11_972f_left;
     BIN_OP_EQ_uxn_opcodes_h_l3091_c11_972f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3091_c11_972f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3091_c11_972f_return_output := BIN_OP_EQ_uxn_opcodes_h_l3091_c11_972f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3106_l3079_l3101_l3076_l3098_l3071_l3094_l3068_l3091_l3086_l3109_l3083_DUPLICATE_8984 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3106_l3079_l3101_l3076_l3098_l3071_l3094_l3068_l3091_l3086_l3109_l3083_DUPLICATE_8984_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l3115_c11_e27c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3115_c11_e27c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3115_c11_e27c_left;
     BIN_OP_EQ_uxn_opcodes_h_l3115_c11_e27c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3115_c11_e27c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3115_c11_e27c_return_output := BIN_OP_EQ_uxn_opcodes_h_l3115_c11_e27c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3125_c11_ed85] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3125_c11_ed85_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3125_c11_ed85_left;
     BIN_OP_EQ_uxn_opcodes_h_l3125_c11_ed85_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3125_c11_ed85_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3125_c11_ed85_return_output := BIN_OP_EQ_uxn_opcodes_h_l3125_c11_ed85_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3076_c11_982e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3076_c11_982e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_982e_left;
     BIN_OP_EQ_uxn_opcodes_h_l3076_c11_982e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_982e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_982e_return_output := BIN_OP_EQ_uxn_opcodes_h_l3076_c11_982e_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3106_l3079_l3101_l3076_l3098_l3071_l3094_l3068_l3091_l3062_l3086_l3109_l3137_l3083_DUPLICATE_bb1a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3106_l3079_l3101_l3076_l3098_l3071_l3094_l3068_l3091_l3062_l3086_l3109_l3137_l3083_DUPLICATE_bb1a_return_output := result.stack_value;

     -- BIN_OP_AND[uxn_opcodes_h_l3113_c32_6a34] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l3113_c32_6a34_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l3113_c32_6a34_left;
     BIN_OP_AND_uxn_opcodes_h_l3113_c32_6a34_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l3113_c32_6a34_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l3113_c32_6a34_return_output := BIN_OP_AND_uxn_opcodes_h_l3113_c32_6a34_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3129_c11_977a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3129_c11_977a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3129_c11_977a_left;
     BIN_OP_EQ_uxn_opcodes_h_l3129_c11_977a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3129_c11_977a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3129_c11_977a_return_output := BIN_OP_EQ_uxn_opcodes_h_l3129_c11_977a_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l3119_c24_f94c] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3119_c24_f94c_return_output := CAST_TO_uint8_t_uint16_t(
     l16);

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3109_l3137_DUPLICATE_bc5a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3109_l3137_DUPLICATE_bc5a_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l3137_c11_2153] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3137_c11_2153_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3137_c11_2153_left;
     BIN_OP_EQ_uxn_opcodes_h_l3137_c11_2153_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3137_c11_2153_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3137_c11_2153_return_output := BIN_OP_EQ_uxn_opcodes_h_l3137_c11_2153_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3133_c11_aaec] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3133_c11_aaec_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3133_c11_aaec_left;
     BIN_OP_EQ_uxn_opcodes_h_l3133_c11_aaec_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3133_c11_aaec_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3133_c11_aaec_return_output := BIN_OP_EQ_uxn_opcodes_h_l3133_c11_aaec_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l3087_l3072_l3080_l3110_l3102_l3095_DUPLICATE_4da0 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l3087_l3072_l3080_l3110_l3102_l3095_DUPLICATE_4da0_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l3106_c11_2b9d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3106_c11_2b9d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3106_c11_2b9d_left;
     BIN_OP_EQ_uxn_opcodes_h_l3106_c11_2b9d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3106_c11_2b9d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3106_c11_2b9d_return_output := BIN_OP_EQ_uxn_opcodes_h_l3106_c11_2b9d_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l3139_c34_eaff] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l3139_c34_eaff_x <= VAR_CONST_SR_8_uxn_opcodes_h_l3139_c34_eaff_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l3139_c34_eaff_return_output := CONST_SR_8_uxn_opcodes_h_l3139_c34_eaff_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3071_c11_6639] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3071_c11_6639_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3071_c11_6639_left;
     BIN_OP_EQ_uxn_opcodes_h_l3071_c11_6639_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3071_c11_6639_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3071_c11_6639_return_output := BIN_OP_EQ_uxn_opcodes_h_l3071_c11_6639_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3141_c11_7c77] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3141_c11_7c77_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3141_c11_7c77_left;
     BIN_OP_EQ_uxn_opcodes_h_l3141_c11_7c77_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3141_c11_7c77_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3141_c11_7c77_return_output := BIN_OP_EQ_uxn_opcodes_h_l3141_c11_7c77_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3106_l3079_l3101_l3076_l3098_l3071_l3094_l3068_l3091_l3115_l3062_l3086_l3083_DUPLICATE_581b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3106_l3079_l3101_l3076_l3098_l3071_l3094_l3068_l3091_l3115_l3062_l3086_l3083_DUPLICATE_581b_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l3062_c6_d47c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3062_c6_d47c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3062_c6_d47c_left;
     BIN_OP_EQ_uxn_opcodes_h_l3062_c6_d47c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3062_c6_d47c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3062_c6_d47c_return_output := BIN_OP_EQ_uxn_opcodes_h_l3062_c6_d47c_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l3131_c34_d544] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l3131_c34_d544_x <= VAR_CONST_SR_8_uxn_opcodes_h_l3131_c34_d544_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l3131_c34_d544_return_output := CONST_SR_8_uxn_opcodes_h_l3131_c34_d544_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l3127_c24_5f31] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3127_c24_5f31_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- CAST_TO_uint8_t[uxn_opcodes_h_l3135_c24_2b14] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3135_c24_2b14_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- BIN_OP_EQ[uxn_opcodes_h_l3079_c11_0c7b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3079_c11_0c7b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3079_c11_0c7b_left;
     BIN_OP_EQ_uxn_opcodes_h_l3079_c11_0c7b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3079_c11_0c7b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3079_c11_0c7b_return_output := BIN_OP_EQ_uxn_opcodes_h_l3079_c11_0c7b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3094_c11_21fc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3094_c11_21fc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3094_c11_21fc_left;
     BIN_OP_EQ_uxn_opcodes_h_l3094_c11_21fc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3094_c11_21fc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3094_c11_21fc_return_output := BIN_OP_EQ_uxn_opcodes_h_l3094_c11_21fc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3086_c11_9370] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3086_c11_9370_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3086_c11_9370_left;
     BIN_OP_EQ_uxn_opcodes_h_l3086_c11_9370_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3086_c11_9370_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3086_c11_9370_return_output := BIN_OP_EQ_uxn_opcodes_h_l3086_c11_9370_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3098_c11_1d96] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3098_c11_1d96_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3098_c11_1d96_left;
     BIN_OP_EQ_uxn_opcodes_h_l3098_c11_1d96_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3098_c11_1d96_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3098_c11_1d96_return_output := BIN_OP_EQ_uxn_opcodes_h_l3098_c11_1d96_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3068_c11_7a05] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3068_c11_7a05_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c11_7a05_left;
     BIN_OP_EQ_uxn_opcodes_h_l3068_c11_7a05_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c11_7a05_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c11_7a05_return_output := BIN_OP_EQ_uxn_opcodes_h_l3068_c11_7a05_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3083_c11_493f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3083_c11_493f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3083_c11_493f_left;
     BIN_OP_EQ_uxn_opcodes_h_l3083_c11_493f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3083_c11_493f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3083_c11_493f_return_output := BIN_OP_EQ_uxn_opcodes_h_l3083_c11_493f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3121_c11_4c3a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3121_c11_4c3a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3121_c11_4c3a_left;
     BIN_OP_EQ_uxn_opcodes_h_l3121_c11_4c3a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3121_c11_4c3a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3121_c11_4c3a_return_output := BIN_OP_EQ_uxn_opcodes_h_l3121_c11_4c3a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3141_l3137_l3133_l3129_l3125_l3121_l3115_l3109_l3106_l3101_l3098_l3094_l3091_l3086_l3083_l3079_l3076_l3071_l3068_DUPLICATE_451f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3141_l3137_l3133_l3129_l3125_l3121_l3115_l3109_l3106_l3101_l3098_l3094_l3091_l3086_l3083_l3079_l3076_l3071_l3068_DUPLICATE_451f_return_output := result.is_opc_done;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l3113_c32_90e9_left := VAR_BIN_OP_AND_uxn_opcodes_h_l3113_c32_6a34_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_d798_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3062_c6_d47c_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l3062_c2_8cc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3062_c6_d47c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l3062_c2_8cc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3062_c6_d47c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3062_c2_8cc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3062_c6_d47c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3062_c2_8cc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3062_c6_d47c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3062_c2_8cc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3062_c6_d47c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3062_c2_8cc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3062_c6_d47c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3062_c2_8cc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3062_c6_d47c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3062_c2_8cc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3062_c6_d47c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3062_c2_8cc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3062_c6_d47c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3062_c2_8cc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3062_c6_d47c_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l3068_c7_7c53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c11_7a05_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l3068_c7_7c53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c11_7a05_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3068_c7_7c53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c11_7a05_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3068_c7_7c53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c11_7a05_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3068_c7_7c53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c11_7a05_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3068_c7_7c53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c11_7a05_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3068_c7_7c53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c11_7a05_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3068_c7_7c53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c11_7a05_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3068_c7_7c53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c11_7a05_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3068_c7_7c53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c11_7a05_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l3071_c7_94c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3071_c11_6639_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l3071_c7_94c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3071_c11_6639_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3071_c7_94c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3071_c11_6639_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3071_c7_94c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3071_c11_6639_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3071_c7_94c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3071_c11_6639_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3071_c7_94c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3071_c11_6639_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3071_c7_94c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3071_c11_6639_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3071_c7_94c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3071_c11_6639_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3071_c7_94c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3071_c11_6639_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3071_c7_94c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3071_c11_6639_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l3076_c7_6a3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_982e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l3076_c7_6a3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_982e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3076_c7_6a3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_982e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3076_c7_6a3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_982e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3076_c7_6a3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_982e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3076_c7_6a3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_982e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3076_c7_6a3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_982e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3076_c7_6a3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_982e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3076_c7_6a3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_982e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3076_c7_6a3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_982e_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l3079_c7_4155_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3079_c11_0c7b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l3079_c7_4155_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3079_c11_0c7b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3079_c7_4155_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3079_c11_0c7b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3079_c7_4155_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3079_c11_0c7b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3079_c7_4155_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3079_c11_0c7b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3079_c7_4155_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3079_c11_0c7b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3079_c7_4155_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3079_c11_0c7b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3079_c7_4155_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3079_c11_0c7b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3079_c7_4155_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3079_c11_0c7b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3079_c7_4155_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3079_c11_0c7b_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l3083_c7_bb56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3083_c11_493f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l3083_c7_bb56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3083_c11_493f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3083_c7_bb56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3083_c11_493f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3083_c7_bb56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3083_c11_493f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3083_c7_bb56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3083_c11_493f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3083_c7_bb56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3083_c11_493f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3083_c7_bb56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3083_c11_493f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3083_c7_bb56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3083_c11_493f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3083_c7_bb56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3083_c11_493f_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l3086_c7_a1ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3086_c11_9370_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l3086_c7_a1ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3086_c11_9370_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3086_c7_a1ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3086_c11_9370_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3086_c7_a1ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3086_c11_9370_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3086_c7_a1ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3086_c11_9370_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3086_c7_a1ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3086_c11_9370_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3086_c7_a1ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3086_c11_9370_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3086_c7_a1ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3086_c11_9370_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3086_c7_a1ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3086_c11_9370_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l3091_c7_0749_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3091_c11_972f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l3091_c7_0749_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3091_c11_972f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3091_c7_0749_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3091_c11_972f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3091_c7_0749_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3091_c11_972f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3091_c7_0749_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3091_c11_972f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3091_c7_0749_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3091_c11_972f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3091_c7_0749_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3091_c11_972f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3091_c7_0749_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3091_c11_972f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3091_c7_0749_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3091_c11_972f_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l3094_c7_853c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3094_c11_21fc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l3094_c7_853c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3094_c11_21fc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3094_c7_853c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3094_c11_21fc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3094_c7_853c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3094_c11_21fc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3094_c7_853c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3094_c11_21fc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3094_c7_853c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3094_c11_21fc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3094_c7_853c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3094_c11_21fc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3094_c7_853c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3094_c11_21fc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3094_c7_853c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3094_c11_21fc_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l3098_c7_3a39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3098_c11_1d96_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3098_c7_3a39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3098_c11_1d96_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3098_c7_3a39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3098_c11_1d96_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3098_c7_3a39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3098_c11_1d96_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3098_c7_3a39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3098_c11_1d96_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3098_c7_3a39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3098_c11_1d96_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3098_c7_3a39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3098_c11_1d96_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3098_c7_3a39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3098_c11_1d96_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l3101_c7_6dee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3101_c11_3d69_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3101_c7_6dee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3101_c11_3d69_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3101_c7_6dee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3101_c11_3d69_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3101_c7_6dee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3101_c11_3d69_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3101_c7_6dee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3101_c11_3d69_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3101_c7_6dee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3101_c11_3d69_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3101_c7_6dee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3101_c11_3d69_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3101_c7_6dee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3101_c11_3d69_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l3106_c7_72ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3106_c11_2b9d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3106_c7_72ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3106_c11_2b9d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3106_c7_72ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3106_c11_2b9d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3106_c7_72ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3106_c11_2b9d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3106_c7_72ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3106_c11_2b9d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3106_c7_72ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3106_c11_2b9d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3106_c7_72ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3106_c11_2b9d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3106_c7_72ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3106_c11_2b9d_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l3109_c7_c963_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3109_c11_9bf8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3109_c7_c963_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3109_c11_9bf8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3109_c7_c963_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3109_c11_9bf8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3109_c7_c963_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3109_c11_9bf8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3109_c7_c963_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3109_c11_9bf8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3109_c7_c963_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3109_c11_9bf8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3109_c7_c963_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3109_c11_9bf8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3109_c7_c963_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3109_c11_9bf8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3115_c7_f4b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3115_c11_e27c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3115_c7_f4b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3115_c11_e27c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3115_c7_f4b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3115_c11_e27c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3115_c7_f4b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3115_c11_e27c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3115_c7_f4b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3115_c11_e27c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3121_c7_5bc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3121_c11_4c3a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3121_c7_5bc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3121_c11_4c3a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3121_c7_5bc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3121_c11_4c3a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3121_c7_5bc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3121_c11_4c3a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3125_c7_1d5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3125_c11_ed85_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3125_c7_1d5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3125_c11_ed85_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3125_c7_1d5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3125_c11_ed85_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3125_c7_1d5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3125_c11_ed85_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3129_c7_f70f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3129_c11_977a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3129_c7_f70f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3129_c11_977a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3129_c7_f70f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3129_c11_977a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3129_c7_f70f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3129_c11_977a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3133_c7_b584_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3133_c11_aaec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3133_c7_b584_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3133_c11_aaec_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3133_c7_b584_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3133_c11_aaec_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3133_c7_b584_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3133_c11_aaec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3137_c7_a254_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3137_c11_2153_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3137_c7_a254_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3137_c11_2153_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3137_c7_a254_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3137_c11_2153_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3137_c7_a254_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3137_c11_2153_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3141_c7_1959_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3141_c11_7c77_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3141_c7_1959_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3141_c11_7c77_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l3080_c3_5ac0_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l3087_l3072_l3080_l3110_l3102_l3095_DUPLICATE_4da0_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l3095_c3_709c_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l3087_l3072_l3080_l3110_l3102_l3095_DUPLICATE_4da0_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l3110_c3_443b_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l3087_l3072_l3080_l3110_l3102_l3095_DUPLICATE_4da0_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l3103_l3088_l3073_DUPLICATE_fa25_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l3087_l3072_l3080_l3110_l3102_l3095_DUPLICATE_4da0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3115_c7_f4b0_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3119_c24_f94c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3125_c7_1d5e_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3127_c24_5f31_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3133_c7_b584_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3135_c24_2b14_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3062_c2_8cc9_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3106_l3079_l3101_l3076_l3098_l3071_l3094_l3068_l3091_l3062_l3086_l3109_l3083_DUPLICATE_f51a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3068_c7_7c53_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3106_l3079_l3101_l3076_l3098_l3071_l3094_l3068_l3091_l3062_l3086_l3109_l3083_DUPLICATE_f51a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3071_c7_94c5_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3106_l3079_l3101_l3076_l3098_l3071_l3094_l3068_l3091_l3062_l3086_l3109_l3083_DUPLICATE_f51a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3076_c7_6a3f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3106_l3079_l3101_l3076_l3098_l3071_l3094_l3068_l3091_l3062_l3086_l3109_l3083_DUPLICATE_f51a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3079_c7_4155_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3106_l3079_l3101_l3076_l3098_l3071_l3094_l3068_l3091_l3062_l3086_l3109_l3083_DUPLICATE_f51a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3083_c7_bb56_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3106_l3079_l3101_l3076_l3098_l3071_l3094_l3068_l3091_l3062_l3086_l3109_l3083_DUPLICATE_f51a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3086_c7_a1ba_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3106_l3079_l3101_l3076_l3098_l3071_l3094_l3068_l3091_l3062_l3086_l3109_l3083_DUPLICATE_f51a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3091_c7_0749_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3106_l3079_l3101_l3076_l3098_l3071_l3094_l3068_l3091_l3062_l3086_l3109_l3083_DUPLICATE_f51a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3094_c7_853c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3106_l3079_l3101_l3076_l3098_l3071_l3094_l3068_l3091_l3062_l3086_l3109_l3083_DUPLICATE_f51a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3098_c7_3a39_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3106_l3079_l3101_l3076_l3098_l3071_l3094_l3068_l3091_l3062_l3086_l3109_l3083_DUPLICATE_f51a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3101_c7_6dee_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3106_l3079_l3101_l3076_l3098_l3071_l3094_l3068_l3091_l3062_l3086_l3109_l3083_DUPLICATE_f51a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3106_c7_72ed_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3106_l3079_l3101_l3076_l3098_l3071_l3094_l3068_l3091_l3062_l3086_l3109_l3083_DUPLICATE_f51a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3109_c7_c963_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3106_l3079_l3101_l3076_l3098_l3071_l3094_l3068_l3091_l3062_l3086_l3109_l3083_DUPLICATE_f51a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3068_c7_7c53_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3141_l3137_l3133_l3129_l3125_l3121_l3115_l3109_l3106_l3101_l3098_l3094_l3091_l3086_l3083_l3079_l3076_l3071_l3068_DUPLICATE_451f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3071_c7_94c5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3141_l3137_l3133_l3129_l3125_l3121_l3115_l3109_l3106_l3101_l3098_l3094_l3091_l3086_l3083_l3079_l3076_l3071_l3068_DUPLICATE_451f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3076_c7_6a3f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3141_l3137_l3133_l3129_l3125_l3121_l3115_l3109_l3106_l3101_l3098_l3094_l3091_l3086_l3083_l3079_l3076_l3071_l3068_DUPLICATE_451f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3079_c7_4155_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3141_l3137_l3133_l3129_l3125_l3121_l3115_l3109_l3106_l3101_l3098_l3094_l3091_l3086_l3083_l3079_l3076_l3071_l3068_DUPLICATE_451f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3083_c7_bb56_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3141_l3137_l3133_l3129_l3125_l3121_l3115_l3109_l3106_l3101_l3098_l3094_l3091_l3086_l3083_l3079_l3076_l3071_l3068_DUPLICATE_451f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3086_c7_a1ba_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3141_l3137_l3133_l3129_l3125_l3121_l3115_l3109_l3106_l3101_l3098_l3094_l3091_l3086_l3083_l3079_l3076_l3071_l3068_DUPLICATE_451f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3091_c7_0749_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3141_l3137_l3133_l3129_l3125_l3121_l3115_l3109_l3106_l3101_l3098_l3094_l3091_l3086_l3083_l3079_l3076_l3071_l3068_DUPLICATE_451f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3094_c7_853c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3141_l3137_l3133_l3129_l3125_l3121_l3115_l3109_l3106_l3101_l3098_l3094_l3091_l3086_l3083_l3079_l3076_l3071_l3068_DUPLICATE_451f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3098_c7_3a39_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3141_l3137_l3133_l3129_l3125_l3121_l3115_l3109_l3106_l3101_l3098_l3094_l3091_l3086_l3083_l3079_l3076_l3071_l3068_DUPLICATE_451f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3101_c7_6dee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3141_l3137_l3133_l3129_l3125_l3121_l3115_l3109_l3106_l3101_l3098_l3094_l3091_l3086_l3083_l3079_l3076_l3071_l3068_DUPLICATE_451f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3106_c7_72ed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3141_l3137_l3133_l3129_l3125_l3121_l3115_l3109_l3106_l3101_l3098_l3094_l3091_l3086_l3083_l3079_l3076_l3071_l3068_DUPLICATE_451f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3109_c7_c963_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3141_l3137_l3133_l3129_l3125_l3121_l3115_l3109_l3106_l3101_l3098_l3094_l3091_l3086_l3083_l3079_l3076_l3071_l3068_DUPLICATE_451f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3115_c7_f4b0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3141_l3137_l3133_l3129_l3125_l3121_l3115_l3109_l3106_l3101_l3098_l3094_l3091_l3086_l3083_l3079_l3076_l3071_l3068_DUPLICATE_451f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3121_c7_5bc3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3141_l3137_l3133_l3129_l3125_l3121_l3115_l3109_l3106_l3101_l3098_l3094_l3091_l3086_l3083_l3079_l3076_l3071_l3068_DUPLICATE_451f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3125_c7_1d5e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3141_l3137_l3133_l3129_l3125_l3121_l3115_l3109_l3106_l3101_l3098_l3094_l3091_l3086_l3083_l3079_l3076_l3071_l3068_DUPLICATE_451f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3129_c7_f70f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3141_l3137_l3133_l3129_l3125_l3121_l3115_l3109_l3106_l3101_l3098_l3094_l3091_l3086_l3083_l3079_l3076_l3071_l3068_DUPLICATE_451f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3133_c7_b584_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3141_l3137_l3133_l3129_l3125_l3121_l3115_l3109_l3106_l3101_l3098_l3094_l3091_l3086_l3083_l3079_l3076_l3071_l3068_DUPLICATE_451f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3137_c7_a254_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3141_l3137_l3133_l3129_l3125_l3121_l3115_l3109_l3106_l3101_l3098_l3094_l3091_l3086_l3083_l3079_l3076_l3071_l3068_DUPLICATE_451f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3141_c7_1959_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3141_l3137_l3133_l3129_l3125_l3121_l3115_l3109_l3106_l3101_l3098_l3094_l3091_l3086_l3083_l3079_l3076_l3071_l3068_DUPLICATE_451f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3062_c2_8cc9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3106_l3079_l3101_l3076_l3098_l3071_l3094_l3068_l3091_l3115_l3062_l3086_l3083_DUPLICATE_581b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3068_c7_7c53_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3106_l3079_l3101_l3076_l3098_l3071_l3094_l3068_l3091_l3115_l3062_l3086_l3083_DUPLICATE_581b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3071_c7_94c5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3106_l3079_l3101_l3076_l3098_l3071_l3094_l3068_l3091_l3115_l3062_l3086_l3083_DUPLICATE_581b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3076_c7_6a3f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3106_l3079_l3101_l3076_l3098_l3071_l3094_l3068_l3091_l3115_l3062_l3086_l3083_DUPLICATE_581b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3079_c7_4155_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3106_l3079_l3101_l3076_l3098_l3071_l3094_l3068_l3091_l3115_l3062_l3086_l3083_DUPLICATE_581b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3083_c7_bb56_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3106_l3079_l3101_l3076_l3098_l3071_l3094_l3068_l3091_l3115_l3062_l3086_l3083_DUPLICATE_581b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3086_c7_a1ba_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3106_l3079_l3101_l3076_l3098_l3071_l3094_l3068_l3091_l3115_l3062_l3086_l3083_DUPLICATE_581b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3091_c7_0749_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3106_l3079_l3101_l3076_l3098_l3071_l3094_l3068_l3091_l3115_l3062_l3086_l3083_DUPLICATE_581b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3094_c7_853c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3106_l3079_l3101_l3076_l3098_l3071_l3094_l3068_l3091_l3115_l3062_l3086_l3083_DUPLICATE_581b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3098_c7_3a39_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3106_l3079_l3101_l3076_l3098_l3071_l3094_l3068_l3091_l3115_l3062_l3086_l3083_DUPLICATE_581b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3101_c7_6dee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3106_l3079_l3101_l3076_l3098_l3071_l3094_l3068_l3091_l3115_l3062_l3086_l3083_DUPLICATE_581b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3106_c7_72ed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3106_l3079_l3101_l3076_l3098_l3071_l3094_l3068_l3091_l3115_l3062_l3086_l3083_DUPLICATE_581b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3115_c7_f4b0_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3106_l3079_l3101_l3076_l3098_l3071_l3094_l3068_l3091_l3115_l3062_l3086_l3083_DUPLICATE_581b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3068_c7_7c53_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3106_l3079_l3101_l3076_l3098_l3071_l3094_l3068_l3091_l3086_l3109_l3083_DUPLICATE_8984_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3071_c7_94c5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3106_l3079_l3101_l3076_l3098_l3071_l3094_l3068_l3091_l3086_l3109_l3083_DUPLICATE_8984_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3076_c7_6a3f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3106_l3079_l3101_l3076_l3098_l3071_l3094_l3068_l3091_l3086_l3109_l3083_DUPLICATE_8984_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3079_c7_4155_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3106_l3079_l3101_l3076_l3098_l3071_l3094_l3068_l3091_l3086_l3109_l3083_DUPLICATE_8984_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3083_c7_bb56_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3106_l3079_l3101_l3076_l3098_l3071_l3094_l3068_l3091_l3086_l3109_l3083_DUPLICATE_8984_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3086_c7_a1ba_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3106_l3079_l3101_l3076_l3098_l3071_l3094_l3068_l3091_l3086_l3109_l3083_DUPLICATE_8984_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3091_c7_0749_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3106_l3079_l3101_l3076_l3098_l3071_l3094_l3068_l3091_l3086_l3109_l3083_DUPLICATE_8984_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3094_c7_853c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3106_l3079_l3101_l3076_l3098_l3071_l3094_l3068_l3091_l3086_l3109_l3083_DUPLICATE_8984_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3098_c7_3a39_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3106_l3079_l3101_l3076_l3098_l3071_l3094_l3068_l3091_l3086_l3109_l3083_DUPLICATE_8984_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3101_c7_6dee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3106_l3079_l3101_l3076_l3098_l3071_l3094_l3068_l3091_l3086_l3109_l3083_DUPLICATE_8984_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3106_c7_72ed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3106_l3079_l3101_l3076_l3098_l3071_l3094_l3068_l3091_l3086_l3109_l3083_DUPLICATE_8984_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3109_c7_c963_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3106_l3079_l3101_l3076_l3098_l3071_l3094_l3068_l3091_l3086_l3109_l3083_DUPLICATE_8984_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3062_c2_8cc9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3141_l3137_l3133_l3129_l3125_l3121_l3109_l3106_l3101_l3098_l3094_l3091_l3086_l3083_l3079_l3076_l3071_l3068_l3062_DUPLICATE_4193_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3068_c7_7c53_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3141_l3137_l3133_l3129_l3125_l3121_l3109_l3106_l3101_l3098_l3094_l3091_l3086_l3083_l3079_l3076_l3071_l3068_l3062_DUPLICATE_4193_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3071_c7_94c5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3141_l3137_l3133_l3129_l3125_l3121_l3109_l3106_l3101_l3098_l3094_l3091_l3086_l3083_l3079_l3076_l3071_l3068_l3062_DUPLICATE_4193_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3076_c7_6a3f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3141_l3137_l3133_l3129_l3125_l3121_l3109_l3106_l3101_l3098_l3094_l3091_l3086_l3083_l3079_l3076_l3071_l3068_l3062_DUPLICATE_4193_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3079_c7_4155_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3141_l3137_l3133_l3129_l3125_l3121_l3109_l3106_l3101_l3098_l3094_l3091_l3086_l3083_l3079_l3076_l3071_l3068_l3062_DUPLICATE_4193_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3083_c7_bb56_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3141_l3137_l3133_l3129_l3125_l3121_l3109_l3106_l3101_l3098_l3094_l3091_l3086_l3083_l3079_l3076_l3071_l3068_l3062_DUPLICATE_4193_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3086_c7_a1ba_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3141_l3137_l3133_l3129_l3125_l3121_l3109_l3106_l3101_l3098_l3094_l3091_l3086_l3083_l3079_l3076_l3071_l3068_l3062_DUPLICATE_4193_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3091_c7_0749_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3141_l3137_l3133_l3129_l3125_l3121_l3109_l3106_l3101_l3098_l3094_l3091_l3086_l3083_l3079_l3076_l3071_l3068_l3062_DUPLICATE_4193_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3094_c7_853c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3141_l3137_l3133_l3129_l3125_l3121_l3109_l3106_l3101_l3098_l3094_l3091_l3086_l3083_l3079_l3076_l3071_l3068_l3062_DUPLICATE_4193_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3098_c7_3a39_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3141_l3137_l3133_l3129_l3125_l3121_l3109_l3106_l3101_l3098_l3094_l3091_l3086_l3083_l3079_l3076_l3071_l3068_l3062_DUPLICATE_4193_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3101_c7_6dee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3141_l3137_l3133_l3129_l3125_l3121_l3109_l3106_l3101_l3098_l3094_l3091_l3086_l3083_l3079_l3076_l3071_l3068_l3062_DUPLICATE_4193_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3106_c7_72ed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3141_l3137_l3133_l3129_l3125_l3121_l3109_l3106_l3101_l3098_l3094_l3091_l3086_l3083_l3079_l3076_l3071_l3068_l3062_DUPLICATE_4193_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3109_c7_c963_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3141_l3137_l3133_l3129_l3125_l3121_l3109_l3106_l3101_l3098_l3094_l3091_l3086_l3083_l3079_l3076_l3071_l3068_l3062_DUPLICATE_4193_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3121_c7_5bc3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3141_l3137_l3133_l3129_l3125_l3121_l3109_l3106_l3101_l3098_l3094_l3091_l3086_l3083_l3079_l3076_l3071_l3068_l3062_DUPLICATE_4193_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3125_c7_1d5e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3141_l3137_l3133_l3129_l3125_l3121_l3109_l3106_l3101_l3098_l3094_l3091_l3086_l3083_l3079_l3076_l3071_l3068_l3062_DUPLICATE_4193_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3129_c7_f70f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3141_l3137_l3133_l3129_l3125_l3121_l3109_l3106_l3101_l3098_l3094_l3091_l3086_l3083_l3079_l3076_l3071_l3068_l3062_DUPLICATE_4193_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3133_c7_b584_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3141_l3137_l3133_l3129_l3125_l3121_l3109_l3106_l3101_l3098_l3094_l3091_l3086_l3083_l3079_l3076_l3071_l3068_l3062_DUPLICATE_4193_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3137_c7_a254_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3141_l3137_l3133_l3129_l3125_l3121_l3109_l3106_l3101_l3098_l3094_l3091_l3086_l3083_l3079_l3076_l3071_l3068_l3062_DUPLICATE_4193_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3141_c7_1959_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3141_l3137_l3133_l3129_l3125_l3121_l3109_l3106_l3101_l3098_l3094_l3091_l3086_l3083_l3079_l3076_l3071_l3068_l3062_DUPLICATE_4193_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3109_c7_c963_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3109_l3137_DUPLICATE_bc5a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3137_c7_a254_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3109_l3137_DUPLICATE_bc5a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3062_c2_8cc9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3106_l3079_l3101_l3076_l3098_l3071_l3094_l3068_l3091_l3062_l3086_l3109_l3137_l3083_DUPLICATE_bb1a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3068_c7_7c53_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3106_l3079_l3101_l3076_l3098_l3071_l3094_l3068_l3091_l3062_l3086_l3109_l3137_l3083_DUPLICATE_bb1a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3071_c7_94c5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3106_l3079_l3101_l3076_l3098_l3071_l3094_l3068_l3091_l3062_l3086_l3109_l3137_l3083_DUPLICATE_bb1a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3076_c7_6a3f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3106_l3079_l3101_l3076_l3098_l3071_l3094_l3068_l3091_l3062_l3086_l3109_l3137_l3083_DUPLICATE_bb1a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3079_c7_4155_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3106_l3079_l3101_l3076_l3098_l3071_l3094_l3068_l3091_l3062_l3086_l3109_l3137_l3083_DUPLICATE_bb1a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3083_c7_bb56_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3106_l3079_l3101_l3076_l3098_l3071_l3094_l3068_l3091_l3062_l3086_l3109_l3137_l3083_DUPLICATE_bb1a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3086_c7_a1ba_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3106_l3079_l3101_l3076_l3098_l3071_l3094_l3068_l3091_l3062_l3086_l3109_l3137_l3083_DUPLICATE_bb1a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3091_c7_0749_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3106_l3079_l3101_l3076_l3098_l3071_l3094_l3068_l3091_l3062_l3086_l3109_l3137_l3083_DUPLICATE_bb1a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3094_c7_853c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3106_l3079_l3101_l3076_l3098_l3071_l3094_l3068_l3091_l3062_l3086_l3109_l3137_l3083_DUPLICATE_bb1a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3098_c7_3a39_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3106_l3079_l3101_l3076_l3098_l3071_l3094_l3068_l3091_l3062_l3086_l3109_l3137_l3083_DUPLICATE_bb1a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3101_c7_6dee_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3106_l3079_l3101_l3076_l3098_l3071_l3094_l3068_l3091_l3062_l3086_l3109_l3137_l3083_DUPLICATE_bb1a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3106_c7_72ed_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3106_l3079_l3101_l3076_l3098_l3071_l3094_l3068_l3091_l3062_l3086_l3109_l3137_l3083_DUPLICATE_bb1a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3109_c7_c963_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3106_l3079_l3101_l3076_l3098_l3071_l3094_l3068_l3091_l3062_l3086_l3109_l3137_l3083_DUPLICATE_bb1a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3137_c7_a254_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3106_l3079_l3101_l3076_l3098_l3071_l3094_l3068_l3091_l3062_l3086_l3109_l3137_l3083_DUPLICATE_bb1a_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l3110_c3_443b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l3110_c3_443b_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l3110_c3_443b_left;
     BIN_OP_OR_uxn_opcodes_h_l3110_c3_443b_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l3110_c3_443b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l3110_c3_443b_return_output := BIN_OP_OR_uxn_opcodes_h_l3110_c3_443b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3115_c7_f4b0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3115_c7_f4b0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3115_c7_f4b0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3115_c7_f4b0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3115_c7_f4b0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3115_c7_f4b0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3115_c7_f4b0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3115_c7_f4b0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3115_c7_f4b0_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l3131_c24_e621] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3131_c24_e621_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l3131_c34_d544_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3141_c7_1959] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3141_c7_1959_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3141_c7_1959_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3141_c7_1959_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3141_c7_1959_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3141_c7_1959_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3141_c7_1959_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3141_c7_1959_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3141_c7_1959_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l3123_c24_aa6a] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3123_c24_aa6a_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l3123_c34_4bca_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l3080_c3_5ac0] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l3080_c3_5ac0_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l3080_c3_5ac0_left;
     BIN_OP_OR_uxn_opcodes_h_l3080_c3_5ac0_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l3080_c3_5ac0_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l3080_c3_5ac0_return_output := BIN_OP_OR_uxn_opcodes_h_l3080_c3_5ac0_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l3109_c7_c963] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l3109_c7_c963_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3109_c7_c963_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l3109_c7_c963_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3109_c7_c963_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l3109_c7_c963_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3109_c7_c963_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3109_c7_c963_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l3109_c7_c963_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l3103_l3088_l3073_DUPLICATE_fa25 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l3103_l3088_l3073_DUPLICATE_fa25_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l3103_l3088_l3073_DUPLICATE_fa25_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l3103_l3088_l3073_DUPLICATE_fa25_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l3103_l3088_l3073_DUPLICATE_fa25_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3062_c1_d798] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_d798_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_d798_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_d798_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_d798_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_d798_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_d798_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_d798_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_d798_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3137_c7_a254] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3137_c7_a254_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3137_c7_a254_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3137_c7_a254_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3137_c7_a254_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3137_c7_a254_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3137_c7_a254_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3137_c7_a254_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3137_c7_a254_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l3139_c24_a224] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3139_c24_a224_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l3139_c34_eaff_return_output);

     -- BIN_OP_GT[uxn_opcodes_h_l3113_c32_90e9] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l3113_c32_90e9_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l3113_c32_90e9_left;
     BIN_OP_GT_uxn_opcodes_h_l3113_c32_90e9_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l3113_c32_90e9_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l3113_c32_90e9_return_output := BIN_OP_GT_uxn_opcodes_h_l3113_c32_90e9_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l3095_c3_709c] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l3095_c3_709c_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l3095_c3_709c_left;
     BIN_OP_OR_uxn_opcodes_h_l3095_c3_709c_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l3095_c3_709c_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l3095_c3_709c_return_output := BIN_OP_OR_uxn_opcodes_h_l3095_c3_709c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3141_c7_1959] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3141_c7_1959_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3141_c7_1959_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3141_c7_1959_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3141_c7_1959_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3141_c7_1959_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3141_c7_1959_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3141_c7_1959_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3141_c7_1959_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l3113_c32_e4e4_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l3113_c32_90e9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3079_c7_4155_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l3080_c3_5ac0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l3094_c7_853c_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l3095_c3_709c_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l3109_c7_c963_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l3110_c3_443b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3121_c7_5bc3_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3123_c24_aa6a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3129_c7_f70f_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3131_c24_e621_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3137_c7_a254_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3139_c24_a224_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l3101_c7_6dee_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l3103_l3088_l3073_DUPLICATE_fa25_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l3086_c7_a1ba_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l3103_l3088_l3073_DUPLICATE_fa25_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3071_c7_94c5_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l3103_l3088_l3073_DUPLICATE_fa25_return_output;
     VAR_printf_uxn_opcodes_h_l3063_c3_da29_uxn_opcodes_h_l3063_c3_da29_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_d798_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3137_c7_a254_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3141_c7_1959_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3109_c7_c963_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3115_c7_f4b0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3106_c7_72ed_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3109_c7_c963_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3137_c7_a254_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3141_c7_1959_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3133_c7_b584_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3137_c7_a254_return_output;
     -- MUX[uxn_opcodes_h_l3113_c32_e4e4] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l3113_c32_e4e4_cond <= VAR_MUX_uxn_opcodes_h_l3113_c32_e4e4_cond;
     MUX_uxn_opcodes_h_l3113_c32_e4e4_iftrue <= VAR_MUX_uxn_opcodes_h_l3113_c32_e4e4_iftrue;
     MUX_uxn_opcodes_h_l3113_c32_e4e4_iffalse <= VAR_MUX_uxn_opcodes_h_l3113_c32_e4e4_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l3113_c32_e4e4_return_output := MUX_uxn_opcodes_h_l3113_c32_e4e4_return_output;

     -- n16_MUX[uxn_opcodes_h_l3094_c7_853c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l3094_c7_853c_cond <= VAR_n16_MUX_uxn_opcodes_h_l3094_c7_853c_cond;
     n16_MUX_uxn_opcodes_h_l3094_c7_853c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l3094_c7_853c_iftrue;
     n16_MUX_uxn_opcodes_h_l3094_c7_853c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l3094_c7_853c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l3094_c7_853c_return_output := n16_MUX_uxn_opcodes_h_l3094_c7_853c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3137_c7_a254] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3137_c7_a254_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3137_c7_a254_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3137_c7_a254_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3137_c7_a254_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3137_c7_a254_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3137_c7_a254_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3137_c7_a254_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3137_c7_a254_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3137_c7_a254] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3137_c7_a254_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3137_c7_a254_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3137_c7_a254_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3137_c7_a254_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3137_c7_a254_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3137_c7_a254_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3137_c7_a254_return_output := result_stack_value_MUX_uxn_opcodes_h_l3137_c7_a254_return_output;

     -- printf_uxn_opcodes_h_l3063_c3_da29[uxn_opcodes_h_l3063_c3_da29] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l3063_c3_da29_uxn_opcodes_h_l3063_c3_da29_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l3063_c3_da29_uxn_opcodes_h_l3063_c3_da29_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3137_c7_a254] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3137_c7_a254_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3137_c7_a254_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3137_c7_a254_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3137_c7_a254_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3137_c7_a254_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3137_c7_a254_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3137_c7_a254_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3137_c7_a254_return_output;

     -- t16_MUX[uxn_opcodes_h_l3079_c7_4155] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l3079_c7_4155_cond <= VAR_t16_MUX_uxn_opcodes_h_l3079_c7_4155_cond;
     t16_MUX_uxn_opcodes_h_l3079_c7_4155_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l3079_c7_4155_iftrue;
     t16_MUX_uxn_opcodes_h_l3079_c7_4155_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l3079_c7_4155_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l3079_c7_4155_return_output := t16_MUX_uxn_opcodes_h_l3079_c7_4155_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3109_c7_c963] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3109_c7_c963_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3109_c7_c963_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3109_c7_c963_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3109_c7_c963_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3109_c7_c963_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3109_c7_c963_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3109_c7_c963_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3109_c7_c963_return_output;

     -- l16_MUX[uxn_opcodes_h_l3109_c7_c963] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l3109_c7_c963_cond <= VAR_l16_MUX_uxn_opcodes_h_l3109_c7_c963_cond;
     l16_MUX_uxn_opcodes_h_l3109_c7_c963_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l3109_c7_c963_iftrue;
     l16_MUX_uxn_opcodes_h_l3109_c7_c963_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l3109_c7_c963_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l3109_c7_c963_return_output := l16_MUX_uxn_opcodes_h_l3109_c7_c963_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l3106_c7_72ed] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l3106_c7_72ed_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3106_c7_72ed_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l3106_c7_72ed_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3106_c7_72ed_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l3106_c7_72ed_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3106_c7_72ed_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3106_c7_72ed_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l3106_c7_72ed_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3133_c7_b584] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3133_c7_b584_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3133_c7_b584_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3133_c7_b584_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3133_c7_b584_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3133_c7_b584_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3133_c7_b584_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3133_c7_b584_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3133_c7_b584_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3109_c7_c963_iftrue := VAR_MUX_uxn_opcodes_h_l3113_c32_e4e4_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l3106_c7_72ed_iffalse := VAR_l16_MUX_uxn_opcodes_h_l3109_c7_c963_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l3091_c7_0749_iffalse := VAR_n16_MUX_uxn_opcodes_h_l3094_c7_853c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3133_c7_b584_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3137_c7_a254_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3106_c7_72ed_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3109_c7_c963_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3101_c7_6dee_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3106_c7_72ed_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3133_c7_b584_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3137_c7_a254_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3129_c7_f70f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3133_c7_b584_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3133_c7_b584_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3137_c7_a254_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3076_c7_6a3f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l3079_c7_4155_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3109_c7_c963] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3109_c7_c963_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3109_c7_c963_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3109_c7_c963_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3109_c7_c963_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3109_c7_c963_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3109_c7_c963_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3109_c7_c963_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3109_c7_c963_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3133_c7_b584] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3133_c7_b584_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3133_c7_b584_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3133_c7_b584_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3133_c7_b584_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3133_c7_b584_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3133_c7_b584_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3133_c7_b584_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3133_c7_b584_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l3101_c7_6dee] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l3101_c7_6dee_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3101_c7_6dee_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l3101_c7_6dee_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3101_c7_6dee_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l3101_c7_6dee_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3101_c7_6dee_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3101_c7_6dee_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l3101_c7_6dee_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3129_c7_f70f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3129_c7_f70f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3129_c7_f70f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3129_c7_f70f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3129_c7_f70f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3129_c7_f70f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3129_c7_f70f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3129_c7_f70f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3129_c7_f70f_return_output;

     -- n16_MUX[uxn_opcodes_h_l3091_c7_0749] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l3091_c7_0749_cond <= VAR_n16_MUX_uxn_opcodes_h_l3091_c7_0749_cond;
     n16_MUX_uxn_opcodes_h_l3091_c7_0749_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l3091_c7_0749_iftrue;
     n16_MUX_uxn_opcodes_h_l3091_c7_0749_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l3091_c7_0749_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l3091_c7_0749_return_output := n16_MUX_uxn_opcodes_h_l3091_c7_0749_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3133_c7_b584] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3133_c7_b584_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3133_c7_b584_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3133_c7_b584_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3133_c7_b584_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3133_c7_b584_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3133_c7_b584_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3133_c7_b584_return_output := result_stack_value_MUX_uxn_opcodes_h_l3133_c7_b584_return_output;

     -- l16_MUX[uxn_opcodes_h_l3106_c7_72ed] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l3106_c7_72ed_cond <= VAR_l16_MUX_uxn_opcodes_h_l3106_c7_72ed_cond;
     l16_MUX_uxn_opcodes_h_l3106_c7_72ed_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l3106_c7_72ed_iftrue;
     l16_MUX_uxn_opcodes_h_l3106_c7_72ed_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l3106_c7_72ed_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l3106_c7_72ed_return_output := l16_MUX_uxn_opcodes_h_l3106_c7_72ed_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3133_c7_b584] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3133_c7_b584_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3133_c7_b584_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3133_c7_b584_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3133_c7_b584_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3133_c7_b584_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3133_c7_b584_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3133_c7_b584_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3133_c7_b584_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3106_c7_72ed] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3106_c7_72ed_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3106_c7_72ed_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3106_c7_72ed_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3106_c7_72ed_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3106_c7_72ed_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3106_c7_72ed_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3106_c7_72ed_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3106_c7_72ed_return_output;

     -- t16_MUX[uxn_opcodes_h_l3076_c7_6a3f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l3076_c7_6a3f_cond <= VAR_t16_MUX_uxn_opcodes_h_l3076_c7_6a3f_cond;
     t16_MUX_uxn_opcodes_h_l3076_c7_6a3f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l3076_c7_6a3f_iftrue;
     t16_MUX_uxn_opcodes_h_l3076_c7_6a3f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l3076_c7_6a3f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l3076_c7_6a3f_return_output := t16_MUX_uxn_opcodes_h_l3076_c7_6a3f_return_output;

     -- Submodule level 4
     VAR_l16_MUX_uxn_opcodes_h_l3101_c7_6dee_iffalse := VAR_l16_MUX_uxn_opcodes_h_l3106_c7_72ed_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l3086_c7_a1ba_iffalse := VAR_n16_MUX_uxn_opcodes_h_l3091_c7_0749_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3129_c7_f70f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3133_c7_b584_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3101_c7_6dee_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3106_c7_72ed_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3098_c7_3a39_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3101_c7_6dee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3129_c7_f70f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3133_c7_b584_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3106_c7_72ed_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3109_c7_c963_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3125_c7_1d5e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3129_c7_f70f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3129_c7_f70f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3133_c7_b584_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3071_c7_94c5_iffalse := VAR_t16_MUX_uxn_opcodes_h_l3076_c7_6a3f_return_output;
     -- l16_MUX[uxn_opcodes_h_l3101_c7_6dee] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l3101_c7_6dee_cond <= VAR_l16_MUX_uxn_opcodes_h_l3101_c7_6dee_cond;
     l16_MUX_uxn_opcodes_h_l3101_c7_6dee_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l3101_c7_6dee_iftrue;
     l16_MUX_uxn_opcodes_h_l3101_c7_6dee_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l3101_c7_6dee_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l3101_c7_6dee_return_output := l16_MUX_uxn_opcodes_h_l3101_c7_6dee_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3106_c7_72ed] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3106_c7_72ed_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3106_c7_72ed_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3106_c7_72ed_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3106_c7_72ed_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3106_c7_72ed_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3106_c7_72ed_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3106_c7_72ed_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3106_c7_72ed_return_output;

     -- t16_MUX[uxn_opcodes_h_l3071_c7_94c5] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l3071_c7_94c5_cond <= VAR_t16_MUX_uxn_opcodes_h_l3071_c7_94c5_cond;
     t16_MUX_uxn_opcodes_h_l3071_c7_94c5_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l3071_c7_94c5_iftrue;
     t16_MUX_uxn_opcodes_h_l3071_c7_94c5_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l3071_c7_94c5_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l3071_c7_94c5_return_output := t16_MUX_uxn_opcodes_h_l3071_c7_94c5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3125_c7_1d5e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3125_c7_1d5e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3125_c7_1d5e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3125_c7_1d5e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3125_c7_1d5e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3125_c7_1d5e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3125_c7_1d5e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3125_c7_1d5e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3125_c7_1d5e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3129_c7_f70f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3129_c7_f70f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3129_c7_f70f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3129_c7_f70f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3129_c7_f70f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3129_c7_f70f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3129_c7_f70f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3129_c7_f70f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3129_c7_f70f_return_output;

     -- n16_MUX[uxn_opcodes_h_l3086_c7_a1ba] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l3086_c7_a1ba_cond <= VAR_n16_MUX_uxn_opcodes_h_l3086_c7_a1ba_cond;
     n16_MUX_uxn_opcodes_h_l3086_c7_a1ba_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l3086_c7_a1ba_iftrue;
     n16_MUX_uxn_opcodes_h_l3086_c7_a1ba_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l3086_c7_a1ba_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l3086_c7_a1ba_return_output := n16_MUX_uxn_opcodes_h_l3086_c7_a1ba_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3129_c7_f70f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3129_c7_f70f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3129_c7_f70f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3129_c7_f70f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3129_c7_f70f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3129_c7_f70f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3129_c7_f70f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3129_c7_f70f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3129_c7_f70f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3101_c7_6dee] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3101_c7_6dee_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3101_c7_6dee_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3101_c7_6dee_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3101_c7_6dee_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3101_c7_6dee_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3101_c7_6dee_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3101_c7_6dee_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3101_c7_6dee_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l3098_c7_3a39] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l3098_c7_3a39_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3098_c7_3a39_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l3098_c7_3a39_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3098_c7_3a39_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l3098_c7_3a39_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3098_c7_3a39_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3098_c7_3a39_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l3098_c7_3a39_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3129_c7_f70f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3129_c7_f70f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3129_c7_f70f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3129_c7_f70f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3129_c7_f70f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3129_c7_f70f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3129_c7_f70f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3129_c7_f70f_return_output := result_stack_value_MUX_uxn_opcodes_h_l3129_c7_f70f_return_output;

     -- Submodule level 5
     VAR_l16_MUX_uxn_opcodes_h_l3098_c7_3a39_iffalse := VAR_l16_MUX_uxn_opcodes_h_l3101_c7_6dee_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l3083_c7_bb56_iffalse := VAR_n16_MUX_uxn_opcodes_h_l3086_c7_a1ba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3125_c7_1d5e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3129_c7_f70f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3098_c7_3a39_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3101_c7_6dee_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3094_c7_853c_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3098_c7_3a39_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3125_c7_1d5e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3129_c7_f70f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3101_c7_6dee_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3106_c7_72ed_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3121_c7_5bc3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3125_c7_1d5e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3125_c7_1d5e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3129_c7_f70f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3068_c7_7c53_iffalse := VAR_t16_MUX_uxn_opcodes_h_l3071_c7_94c5_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l3094_c7_853c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l3094_c7_853c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3094_c7_853c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l3094_c7_853c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3094_c7_853c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l3094_c7_853c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3094_c7_853c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3094_c7_853c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l3094_c7_853c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3125_c7_1d5e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3125_c7_1d5e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3125_c7_1d5e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3125_c7_1d5e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3125_c7_1d5e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3125_c7_1d5e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3125_c7_1d5e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3125_c7_1d5e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3125_c7_1d5e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3101_c7_6dee] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3101_c7_6dee_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3101_c7_6dee_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3101_c7_6dee_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3101_c7_6dee_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3101_c7_6dee_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3101_c7_6dee_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3101_c7_6dee_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3101_c7_6dee_return_output;

     -- n16_MUX[uxn_opcodes_h_l3083_c7_bb56] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l3083_c7_bb56_cond <= VAR_n16_MUX_uxn_opcodes_h_l3083_c7_bb56_cond;
     n16_MUX_uxn_opcodes_h_l3083_c7_bb56_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l3083_c7_bb56_iftrue;
     n16_MUX_uxn_opcodes_h_l3083_c7_bb56_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l3083_c7_bb56_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l3083_c7_bb56_return_output := n16_MUX_uxn_opcodes_h_l3083_c7_bb56_return_output;

     -- t16_MUX[uxn_opcodes_h_l3068_c7_7c53] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l3068_c7_7c53_cond <= VAR_t16_MUX_uxn_opcodes_h_l3068_c7_7c53_cond;
     t16_MUX_uxn_opcodes_h_l3068_c7_7c53_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l3068_c7_7c53_iftrue;
     t16_MUX_uxn_opcodes_h_l3068_c7_7c53_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l3068_c7_7c53_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l3068_c7_7c53_return_output := t16_MUX_uxn_opcodes_h_l3068_c7_7c53_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3125_c7_1d5e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3125_c7_1d5e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3125_c7_1d5e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3125_c7_1d5e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3125_c7_1d5e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3125_c7_1d5e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3125_c7_1d5e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3125_c7_1d5e_return_output := result_stack_value_MUX_uxn_opcodes_h_l3125_c7_1d5e_return_output;

     -- l16_MUX[uxn_opcodes_h_l3098_c7_3a39] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l3098_c7_3a39_cond <= VAR_l16_MUX_uxn_opcodes_h_l3098_c7_3a39_cond;
     l16_MUX_uxn_opcodes_h_l3098_c7_3a39_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l3098_c7_3a39_iftrue;
     l16_MUX_uxn_opcodes_h_l3098_c7_3a39_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l3098_c7_3a39_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l3098_c7_3a39_return_output := l16_MUX_uxn_opcodes_h_l3098_c7_3a39_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3121_c7_5bc3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3121_c7_5bc3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3121_c7_5bc3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3121_c7_5bc3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3121_c7_5bc3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3121_c7_5bc3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3121_c7_5bc3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3121_c7_5bc3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3121_c7_5bc3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3125_c7_1d5e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3125_c7_1d5e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3125_c7_1d5e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3125_c7_1d5e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3125_c7_1d5e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3125_c7_1d5e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3125_c7_1d5e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3125_c7_1d5e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3125_c7_1d5e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3098_c7_3a39] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3098_c7_3a39_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3098_c7_3a39_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3098_c7_3a39_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3098_c7_3a39_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3098_c7_3a39_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3098_c7_3a39_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3098_c7_3a39_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3098_c7_3a39_return_output;

     -- Submodule level 6
     VAR_l16_MUX_uxn_opcodes_h_l3094_c7_853c_iffalse := VAR_l16_MUX_uxn_opcodes_h_l3098_c7_3a39_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l3079_c7_4155_iffalse := VAR_n16_MUX_uxn_opcodes_h_l3083_c7_bb56_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3121_c7_5bc3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3125_c7_1d5e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3094_c7_853c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3098_c7_3a39_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3091_c7_0749_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3094_c7_853c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3121_c7_5bc3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3125_c7_1d5e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3098_c7_3a39_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3101_c7_6dee_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3115_c7_f4b0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3121_c7_5bc3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3121_c7_5bc3_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3125_c7_1d5e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3062_c2_8cc9_iffalse := VAR_t16_MUX_uxn_opcodes_h_l3068_c7_7c53_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l3121_c7_5bc3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3121_c7_5bc3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3121_c7_5bc3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3121_c7_5bc3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3121_c7_5bc3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3121_c7_5bc3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3121_c7_5bc3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3121_c7_5bc3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3121_c7_5bc3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3094_c7_853c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3094_c7_853c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3094_c7_853c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3094_c7_853c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3094_c7_853c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3094_c7_853c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3094_c7_853c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3094_c7_853c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3094_c7_853c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3115_c7_f4b0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3115_c7_f4b0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3115_c7_f4b0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3115_c7_f4b0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3115_c7_f4b0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3115_c7_f4b0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3115_c7_f4b0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3115_c7_f4b0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3115_c7_f4b0_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l3091_c7_0749] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l3091_c7_0749_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3091_c7_0749_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l3091_c7_0749_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3091_c7_0749_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l3091_c7_0749_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3091_c7_0749_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3091_c7_0749_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l3091_c7_0749_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3098_c7_3a39] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3098_c7_3a39_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3098_c7_3a39_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3098_c7_3a39_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3098_c7_3a39_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3098_c7_3a39_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3098_c7_3a39_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3098_c7_3a39_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3098_c7_3a39_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3121_c7_5bc3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3121_c7_5bc3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3121_c7_5bc3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3121_c7_5bc3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3121_c7_5bc3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3121_c7_5bc3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3121_c7_5bc3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3121_c7_5bc3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3121_c7_5bc3_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3121_c7_5bc3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3121_c7_5bc3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3121_c7_5bc3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3121_c7_5bc3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3121_c7_5bc3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3121_c7_5bc3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3121_c7_5bc3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3121_c7_5bc3_return_output := result_stack_value_MUX_uxn_opcodes_h_l3121_c7_5bc3_return_output;

     -- l16_MUX[uxn_opcodes_h_l3094_c7_853c] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l3094_c7_853c_cond <= VAR_l16_MUX_uxn_opcodes_h_l3094_c7_853c_cond;
     l16_MUX_uxn_opcodes_h_l3094_c7_853c_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l3094_c7_853c_iftrue;
     l16_MUX_uxn_opcodes_h_l3094_c7_853c_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l3094_c7_853c_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l3094_c7_853c_return_output := l16_MUX_uxn_opcodes_h_l3094_c7_853c_return_output;

     -- n16_MUX[uxn_opcodes_h_l3079_c7_4155] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l3079_c7_4155_cond <= VAR_n16_MUX_uxn_opcodes_h_l3079_c7_4155_cond;
     n16_MUX_uxn_opcodes_h_l3079_c7_4155_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l3079_c7_4155_iftrue;
     n16_MUX_uxn_opcodes_h_l3079_c7_4155_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l3079_c7_4155_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l3079_c7_4155_return_output := n16_MUX_uxn_opcodes_h_l3079_c7_4155_return_output;

     -- t16_MUX[uxn_opcodes_h_l3062_c2_8cc9] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l3062_c2_8cc9_cond <= VAR_t16_MUX_uxn_opcodes_h_l3062_c2_8cc9_cond;
     t16_MUX_uxn_opcodes_h_l3062_c2_8cc9_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l3062_c2_8cc9_iftrue;
     t16_MUX_uxn_opcodes_h_l3062_c2_8cc9_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l3062_c2_8cc9_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l3062_c2_8cc9_return_output := t16_MUX_uxn_opcodes_h_l3062_c2_8cc9_return_output;

     -- Submodule level 7
     VAR_l16_MUX_uxn_opcodes_h_l3091_c7_0749_iffalse := VAR_l16_MUX_uxn_opcodes_h_l3094_c7_853c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l3076_c7_6a3f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l3079_c7_4155_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3115_c7_f4b0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3121_c7_5bc3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3091_c7_0749_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3094_c7_853c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3086_c7_a1ba_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3091_c7_0749_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3115_c7_f4b0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3121_c7_5bc3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3094_c7_853c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3098_c7_3a39_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3109_c7_c963_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3115_c7_f4b0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3115_c7_f4b0_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3121_c7_5bc3_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l3062_c2_8cc9_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l3115_c7_f4b0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3115_c7_f4b0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3115_c7_f4b0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3115_c7_f4b0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3115_c7_f4b0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3115_c7_f4b0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3115_c7_f4b0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3115_c7_f4b0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3115_c7_f4b0_return_output;

     -- n16_MUX[uxn_opcodes_h_l3076_c7_6a3f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l3076_c7_6a3f_cond <= VAR_n16_MUX_uxn_opcodes_h_l3076_c7_6a3f_cond;
     n16_MUX_uxn_opcodes_h_l3076_c7_6a3f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l3076_c7_6a3f_iftrue;
     n16_MUX_uxn_opcodes_h_l3076_c7_6a3f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l3076_c7_6a3f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l3076_c7_6a3f_return_output := n16_MUX_uxn_opcodes_h_l3076_c7_6a3f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3115_c7_f4b0] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3115_c7_f4b0_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3115_c7_f4b0_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3115_c7_f4b0_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3115_c7_f4b0_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3115_c7_f4b0_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3115_c7_f4b0_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3115_c7_f4b0_return_output := result_stack_value_MUX_uxn_opcodes_h_l3115_c7_f4b0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3094_c7_853c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3094_c7_853c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3094_c7_853c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3094_c7_853c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3094_c7_853c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3094_c7_853c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3094_c7_853c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3094_c7_853c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3094_c7_853c_return_output;

     -- l16_MUX[uxn_opcodes_h_l3091_c7_0749] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l3091_c7_0749_cond <= VAR_l16_MUX_uxn_opcodes_h_l3091_c7_0749_cond;
     l16_MUX_uxn_opcodes_h_l3091_c7_0749_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l3091_c7_0749_iftrue;
     l16_MUX_uxn_opcodes_h_l3091_c7_0749_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l3091_c7_0749_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l3091_c7_0749_return_output := l16_MUX_uxn_opcodes_h_l3091_c7_0749_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3115_c7_f4b0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3115_c7_f4b0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3115_c7_f4b0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3115_c7_f4b0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3115_c7_f4b0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3115_c7_f4b0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3115_c7_f4b0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3115_c7_f4b0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3115_c7_f4b0_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l3086_c7_a1ba] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l3086_c7_a1ba_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3086_c7_a1ba_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l3086_c7_a1ba_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3086_c7_a1ba_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l3086_c7_a1ba_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3086_c7_a1ba_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3086_c7_a1ba_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l3086_c7_a1ba_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3091_c7_0749] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3091_c7_0749_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3091_c7_0749_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3091_c7_0749_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3091_c7_0749_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3091_c7_0749_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3091_c7_0749_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3091_c7_0749_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3091_c7_0749_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3109_c7_c963] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3109_c7_c963_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3109_c7_c963_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3109_c7_c963_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3109_c7_c963_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3109_c7_c963_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3109_c7_c963_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3109_c7_c963_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3109_c7_c963_return_output;

     -- Submodule level 8
     VAR_l16_MUX_uxn_opcodes_h_l3086_c7_a1ba_iffalse := VAR_l16_MUX_uxn_opcodes_h_l3091_c7_0749_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l3071_c7_94c5_iffalse := VAR_n16_MUX_uxn_opcodes_h_l3076_c7_6a3f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3109_c7_c963_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3115_c7_f4b0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3086_c7_a1ba_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3091_c7_0749_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3083_c7_bb56_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3086_c7_a1ba_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3109_c7_c963_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3115_c7_f4b0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3091_c7_0749_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3094_c7_853c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3106_c7_72ed_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3109_c7_c963_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3109_c7_c963_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3115_c7_f4b0_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l3109_c7_c963] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3109_c7_c963_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3109_c7_c963_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3109_c7_c963_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3109_c7_c963_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3109_c7_c963_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3109_c7_c963_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3109_c7_c963_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3109_c7_c963_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3109_c7_c963] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3109_c7_c963_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3109_c7_c963_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3109_c7_c963_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3109_c7_c963_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3109_c7_c963_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3109_c7_c963_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3109_c7_c963_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3109_c7_c963_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3109_c7_c963] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3109_c7_c963_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3109_c7_c963_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3109_c7_c963_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3109_c7_c963_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3109_c7_c963_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3109_c7_c963_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3109_c7_c963_return_output := result_stack_value_MUX_uxn_opcodes_h_l3109_c7_c963_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3106_c7_72ed] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3106_c7_72ed_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3106_c7_72ed_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3106_c7_72ed_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3106_c7_72ed_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3106_c7_72ed_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3106_c7_72ed_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3106_c7_72ed_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3106_c7_72ed_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3086_c7_a1ba] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3086_c7_a1ba_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3086_c7_a1ba_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3086_c7_a1ba_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3086_c7_a1ba_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3086_c7_a1ba_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3086_c7_a1ba_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3086_c7_a1ba_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3086_c7_a1ba_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l3083_c7_bb56] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l3083_c7_bb56_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3083_c7_bb56_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l3083_c7_bb56_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3083_c7_bb56_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l3083_c7_bb56_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3083_c7_bb56_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3083_c7_bb56_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l3083_c7_bb56_return_output;

     -- n16_MUX[uxn_opcodes_h_l3071_c7_94c5] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l3071_c7_94c5_cond <= VAR_n16_MUX_uxn_opcodes_h_l3071_c7_94c5_cond;
     n16_MUX_uxn_opcodes_h_l3071_c7_94c5_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l3071_c7_94c5_iftrue;
     n16_MUX_uxn_opcodes_h_l3071_c7_94c5_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l3071_c7_94c5_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l3071_c7_94c5_return_output := n16_MUX_uxn_opcodes_h_l3071_c7_94c5_return_output;

     -- l16_MUX[uxn_opcodes_h_l3086_c7_a1ba] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l3086_c7_a1ba_cond <= VAR_l16_MUX_uxn_opcodes_h_l3086_c7_a1ba_cond;
     l16_MUX_uxn_opcodes_h_l3086_c7_a1ba_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l3086_c7_a1ba_iftrue;
     l16_MUX_uxn_opcodes_h_l3086_c7_a1ba_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l3086_c7_a1ba_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l3086_c7_a1ba_return_output := l16_MUX_uxn_opcodes_h_l3086_c7_a1ba_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3091_c7_0749] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3091_c7_0749_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3091_c7_0749_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3091_c7_0749_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3091_c7_0749_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3091_c7_0749_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3091_c7_0749_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3091_c7_0749_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3091_c7_0749_return_output;

     -- Submodule level 9
     VAR_l16_MUX_uxn_opcodes_h_l3083_c7_bb56_iffalse := VAR_l16_MUX_uxn_opcodes_h_l3086_c7_a1ba_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l3068_c7_7c53_iffalse := VAR_n16_MUX_uxn_opcodes_h_l3071_c7_94c5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3106_c7_72ed_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3109_c7_c963_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3083_c7_bb56_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3086_c7_a1ba_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3079_c7_4155_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3083_c7_bb56_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3106_c7_72ed_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3109_c7_c963_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3086_c7_a1ba_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3091_c7_0749_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3101_c7_6dee_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3106_c7_72ed_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3106_c7_72ed_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3109_c7_c963_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l3079_c7_4155] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l3079_c7_4155_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3079_c7_4155_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l3079_c7_4155_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3079_c7_4155_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l3079_c7_4155_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3079_c7_4155_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3079_c7_4155_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l3079_c7_4155_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3086_c7_a1ba] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3086_c7_a1ba_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3086_c7_a1ba_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3086_c7_a1ba_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3086_c7_a1ba_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3086_c7_a1ba_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3086_c7_a1ba_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3086_c7_a1ba_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3086_c7_a1ba_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3106_c7_72ed] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3106_c7_72ed_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3106_c7_72ed_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3106_c7_72ed_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3106_c7_72ed_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3106_c7_72ed_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3106_c7_72ed_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3106_c7_72ed_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3106_c7_72ed_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3106_c7_72ed] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3106_c7_72ed_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3106_c7_72ed_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3106_c7_72ed_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3106_c7_72ed_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3106_c7_72ed_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3106_c7_72ed_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3106_c7_72ed_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3106_c7_72ed_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3083_c7_bb56] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3083_c7_bb56_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3083_c7_bb56_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3083_c7_bb56_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3083_c7_bb56_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3083_c7_bb56_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3083_c7_bb56_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3083_c7_bb56_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3083_c7_bb56_return_output;

     -- l16_MUX[uxn_opcodes_h_l3083_c7_bb56] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l3083_c7_bb56_cond <= VAR_l16_MUX_uxn_opcodes_h_l3083_c7_bb56_cond;
     l16_MUX_uxn_opcodes_h_l3083_c7_bb56_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l3083_c7_bb56_iftrue;
     l16_MUX_uxn_opcodes_h_l3083_c7_bb56_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l3083_c7_bb56_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l3083_c7_bb56_return_output := l16_MUX_uxn_opcodes_h_l3083_c7_bb56_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3106_c7_72ed] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3106_c7_72ed_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3106_c7_72ed_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3106_c7_72ed_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3106_c7_72ed_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3106_c7_72ed_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3106_c7_72ed_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3106_c7_72ed_return_output := result_stack_value_MUX_uxn_opcodes_h_l3106_c7_72ed_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3101_c7_6dee] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3101_c7_6dee_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3101_c7_6dee_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3101_c7_6dee_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3101_c7_6dee_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3101_c7_6dee_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3101_c7_6dee_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3101_c7_6dee_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3101_c7_6dee_return_output;

     -- n16_MUX[uxn_opcodes_h_l3068_c7_7c53] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l3068_c7_7c53_cond <= VAR_n16_MUX_uxn_opcodes_h_l3068_c7_7c53_cond;
     n16_MUX_uxn_opcodes_h_l3068_c7_7c53_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l3068_c7_7c53_iftrue;
     n16_MUX_uxn_opcodes_h_l3068_c7_7c53_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l3068_c7_7c53_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l3068_c7_7c53_return_output := n16_MUX_uxn_opcodes_h_l3068_c7_7c53_return_output;

     -- Submodule level 10
     VAR_l16_MUX_uxn_opcodes_h_l3079_c7_4155_iffalse := VAR_l16_MUX_uxn_opcodes_h_l3083_c7_bb56_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l3062_c2_8cc9_iffalse := VAR_n16_MUX_uxn_opcodes_h_l3068_c7_7c53_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3101_c7_6dee_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3106_c7_72ed_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3079_c7_4155_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3083_c7_bb56_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3076_c7_6a3f_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3079_c7_4155_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3101_c7_6dee_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3106_c7_72ed_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3083_c7_bb56_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3086_c7_a1ba_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3098_c7_3a39_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3101_c7_6dee_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3101_c7_6dee_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3106_c7_72ed_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l3076_c7_6a3f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l3076_c7_6a3f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3076_c7_6a3f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l3076_c7_6a3f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3076_c7_6a3f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l3076_c7_6a3f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3076_c7_6a3f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3076_c7_6a3f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l3076_c7_6a3f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3079_c7_4155] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3079_c7_4155_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3079_c7_4155_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3079_c7_4155_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3079_c7_4155_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3079_c7_4155_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3079_c7_4155_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3079_c7_4155_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3079_c7_4155_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3083_c7_bb56] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3083_c7_bb56_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3083_c7_bb56_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3083_c7_bb56_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3083_c7_bb56_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3083_c7_bb56_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3083_c7_bb56_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3083_c7_bb56_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3083_c7_bb56_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3101_c7_6dee] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3101_c7_6dee_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3101_c7_6dee_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3101_c7_6dee_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3101_c7_6dee_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3101_c7_6dee_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3101_c7_6dee_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3101_c7_6dee_return_output := result_stack_value_MUX_uxn_opcodes_h_l3101_c7_6dee_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3101_c7_6dee] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3101_c7_6dee_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3101_c7_6dee_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3101_c7_6dee_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3101_c7_6dee_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3101_c7_6dee_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3101_c7_6dee_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3101_c7_6dee_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3101_c7_6dee_return_output;

     -- n16_MUX[uxn_opcodes_h_l3062_c2_8cc9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l3062_c2_8cc9_cond <= VAR_n16_MUX_uxn_opcodes_h_l3062_c2_8cc9_cond;
     n16_MUX_uxn_opcodes_h_l3062_c2_8cc9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l3062_c2_8cc9_iftrue;
     n16_MUX_uxn_opcodes_h_l3062_c2_8cc9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l3062_c2_8cc9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l3062_c2_8cc9_return_output := n16_MUX_uxn_opcodes_h_l3062_c2_8cc9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3098_c7_3a39] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3098_c7_3a39_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3098_c7_3a39_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3098_c7_3a39_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3098_c7_3a39_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3098_c7_3a39_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3098_c7_3a39_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3098_c7_3a39_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3098_c7_3a39_return_output;

     -- l16_MUX[uxn_opcodes_h_l3079_c7_4155] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l3079_c7_4155_cond <= VAR_l16_MUX_uxn_opcodes_h_l3079_c7_4155_cond;
     l16_MUX_uxn_opcodes_h_l3079_c7_4155_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l3079_c7_4155_iftrue;
     l16_MUX_uxn_opcodes_h_l3079_c7_4155_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l3079_c7_4155_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l3079_c7_4155_return_output := l16_MUX_uxn_opcodes_h_l3079_c7_4155_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3101_c7_6dee] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3101_c7_6dee_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3101_c7_6dee_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3101_c7_6dee_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3101_c7_6dee_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3101_c7_6dee_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3101_c7_6dee_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3101_c7_6dee_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3101_c7_6dee_return_output;

     -- Submodule level 11
     VAR_l16_MUX_uxn_opcodes_h_l3076_c7_6a3f_iffalse := VAR_l16_MUX_uxn_opcodes_h_l3079_c7_4155_return_output;
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l3062_c2_8cc9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3098_c7_3a39_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3101_c7_6dee_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3076_c7_6a3f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3079_c7_4155_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3071_c7_94c5_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3076_c7_6a3f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3098_c7_3a39_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3101_c7_6dee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3079_c7_4155_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3083_c7_bb56_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3094_c7_853c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3098_c7_3a39_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3098_c7_3a39_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3101_c7_6dee_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l3071_c7_94c5] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l3071_c7_94c5_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3071_c7_94c5_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l3071_c7_94c5_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3071_c7_94c5_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l3071_c7_94c5_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3071_c7_94c5_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3071_c7_94c5_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l3071_c7_94c5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3076_c7_6a3f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3076_c7_6a3f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3076_c7_6a3f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3076_c7_6a3f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3076_c7_6a3f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3076_c7_6a3f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3076_c7_6a3f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3076_c7_6a3f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3076_c7_6a3f_return_output;

     -- l16_MUX[uxn_opcodes_h_l3076_c7_6a3f] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l3076_c7_6a3f_cond <= VAR_l16_MUX_uxn_opcodes_h_l3076_c7_6a3f_cond;
     l16_MUX_uxn_opcodes_h_l3076_c7_6a3f_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l3076_c7_6a3f_iftrue;
     l16_MUX_uxn_opcodes_h_l3076_c7_6a3f_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l3076_c7_6a3f_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l3076_c7_6a3f_return_output := l16_MUX_uxn_opcodes_h_l3076_c7_6a3f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3098_c7_3a39] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3098_c7_3a39_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3098_c7_3a39_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3098_c7_3a39_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3098_c7_3a39_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3098_c7_3a39_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3098_c7_3a39_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3098_c7_3a39_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3098_c7_3a39_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3098_c7_3a39] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3098_c7_3a39_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3098_c7_3a39_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3098_c7_3a39_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3098_c7_3a39_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3098_c7_3a39_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3098_c7_3a39_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3098_c7_3a39_return_output := result_stack_value_MUX_uxn_opcodes_h_l3098_c7_3a39_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3079_c7_4155] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3079_c7_4155_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3079_c7_4155_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3079_c7_4155_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3079_c7_4155_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3079_c7_4155_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3079_c7_4155_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3079_c7_4155_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3079_c7_4155_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3098_c7_3a39] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3098_c7_3a39_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3098_c7_3a39_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3098_c7_3a39_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3098_c7_3a39_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3098_c7_3a39_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3098_c7_3a39_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3098_c7_3a39_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3098_c7_3a39_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3094_c7_853c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3094_c7_853c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3094_c7_853c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3094_c7_853c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3094_c7_853c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3094_c7_853c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3094_c7_853c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3094_c7_853c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3094_c7_853c_return_output;

     -- Submodule level 12
     VAR_l16_MUX_uxn_opcodes_h_l3071_c7_94c5_iffalse := VAR_l16_MUX_uxn_opcodes_h_l3076_c7_6a3f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3094_c7_853c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3098_c7_3a39_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3071_c7_94c5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3076_c7_6a3f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3068_c7_7c53_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3071_c7_94c5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3094_c7_853c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3098_c7_3a39_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3076_c7_6a3f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3079_c7_4155_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3091_c7_0749_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3094_c7_853c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3094_c7_853c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3098_c7_3a39_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3076_c7_6a3f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3076_c7_6a3f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3076_c7_6a3f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3076_c7_6a3f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3076_c7_6a3f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3076_c7_6a3f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3076_c7_6a3f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3076_c7_6a3f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3076_c7_6a3f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3094_c7_853c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3094_c7_853c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3094_c7_853c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3094_c7_853c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3094_c7_853c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3094_c7_853c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3094_c7_853c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3094_c7_853c_return_output := result_stack_value_MUX_uxn_opcodes_h_l3094_c7_853c_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l3068_c7_7c53] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l3068_c7_7c53_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3068_c7_7c53_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l3068_c7_7c53_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3068_c7_7c53_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l3068_c7_7c53_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3068_c7_7c53_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3068_c7_7c53_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l3068_c7_7c53_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3091_c7_0749] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3091_c7_0749_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3091_c7_0749_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3091_c7_0749_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3091_c7_0749_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3091_c7_0749_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3091_c7_0749_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3091_c7_0749_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3091_c7_0749_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3094_c7_853c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3094_c7_853c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3094_c7_853c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3094_c7_853c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3094_c7_853c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3094_c7_853c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3094_c7_853c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3094_c7_853c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3094_c7_853c_return_output;

     -- l16_MUX[uxn_opcodes_h_l3071_c7_94c5] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l3071_c7_94c5_cond <= VAR_l16_MUX_uxn_opcodes_h_l3071_c7_94c5_cond;
     l16_MUX_uxn_opcodes_h_l3071_c7_94c5_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l3071_c7_94c5_iftrue;
     l16_MUX_uxn_opcodes_h_l3071_c7_94c5_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l3071_c7_94c5_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l3071_c7_94c5_return_output := l16_MUX_uxn_opcodes_h_l3071_c7_94c5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3094_c7_853c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3094_c7_853c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3094_c7_853c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3094_c7_853c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3094_c7_853c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3094_c7_853c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3094_c7_853c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3094_c7_853c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3094_c7_853c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3071_c7_94c5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3071_c7_94c5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3071_c7_94c5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3071_c7_94c5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3071_c7_94c5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3071_c7_94c5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3071_c7_94c5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3071_c7_94c5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3071_c7_94c5_return_output;

     -- Submodule level 13
     VAR_l16_MUX_uxn_opcodes_h_l3068_c7_7c53_iffalse := VAR_l16_MUX_uxn_opcodes_h_l3071_c7_94c5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3091_c7_0749_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3094_c7_853c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3068_c7_7c53_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3071_c7_94c5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3062_c2_8cc9_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3068_c7_7c53_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3091_c7_0749_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3094_c7_853c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3071_c7_94c5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3076_c7_6a3f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3086_c7_a1ba_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3091_c7_0749_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3091_c7_0749_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3094_c7_853c_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3071_c7_94c5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3071_c7_94c5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3071_c7_94c5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3071_c7_94c5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3071_c7_94c5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3071_c7_94c5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3071_c7_94c5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3071_c7_94c5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3071_c7_94c5_return_output;

     -- l16_MUX[uxn_opcodes_h_l3068_c7_7c53] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l3068_c7_7c53_cond <= VAR_l16_MUX_uxn_opcodes_h_l3068_c7_7c53_cond;
     l16_MUX_uxn_opcodes_h_l3068_c7_7c53_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l3068_c7_7c53_iftrue;
     l16_MUX_uxn_opcodes_h_l3068_c7_7c53_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l3068_c7_7c53_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l3068_c7_7c53_return_output := l16_MUX_uxn_opcodes_h_l3068_c7_7c53_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3091_c7_0749] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3091_c7_0749_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3091_c7_0749_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3091_c7_0749_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3091_c7_0749_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3091_c7_0749_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3091_c7_0749_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3091_c7_0749_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3091_c7_0749_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3091_c7_0749] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3091_c7_0749_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3091_c7_0749_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3091_c7_0749_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3091_c7_0749_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3091_c7_0749_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3091_c7_0749_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3091_c7_0749_return_output := result_stack_value_MUX_uxn_opcodes_h_l3091_c7_0749_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l3062_c2_8cc9] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l3062_c2_8cc9_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3062_c2_8cc9_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l3062_c2_8cc9_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3062_c2_8cc9_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l3062_c2_8cc9_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3062_c2_8cc9_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3062_c2_8cc9_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l3062_c2_8cc9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3086_c7_a1ba] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3086_c7_a1ba_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3086_c7_a1ba_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3086_c7_a1ba_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3086_c7_a1ba_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3086_c7_a1ba_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3086_c7_a1ba_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3086_c7_a1ba_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3086_c7_a1ba_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3068_c7_7c53] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3068_c7_7c53_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3068_c7_7c53_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3068_c7_7c53_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3068_c7_7c53_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3068_c7_7c53_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3068_c7_7c53_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3068_c7_7c53_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3068_c7_7c53_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3091_c7_0749] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3091_c7_0749_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3091_c7_0749_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3091_c7_0749_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3091_c7_0749_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3091_c7_0749_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3091_c7_0749_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3091_c7_0749_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3091_c7_0749_return_output;

     -- Submodule level 14
     VAR_l16_MUX_uxn_opcodes_h_l3062_c2_8cc9_iffalse := VAR_l16_MUX_uxn_opcodes_h_l3068_c7_7c53_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3086_c7_a1ba_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3091_c7_0749_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3062_c2_8cc9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3068_c7_7c53_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3086_c7_a1ba_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3091_c7_0749_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3068_c7_7c53_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3071_c7_94c5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3083_c7_bb56_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3086_c7_a1ba_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3086_c7_a1ba_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3091_c7_0749_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3068_c7_7c53] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3068_c7_7c53_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3068_c7_7c53_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3068_c7_7c53_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3068_c7_7c53_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3068_c7_7c53_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3068_c7_7c53_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3068_c7_7c53_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3068_c7_7c53_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3083_c7_bb56] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3083_c7_bb56_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3083_c7_bb56_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3083_c7_bb56_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3083_c7_bb56_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3083_c7_bb56_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3083_c7_bb56_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3083_c7_bb56_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3083_c7_bb56_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3086_c7_a1ba] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3086_c7_a1ba_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3086_c7_a1ba_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3086_c7_a1ba_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3086_c7_a1ba_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3086_c7_a1ba_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3086_c7_a1ba_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3086_c7_a1ba_return_output := result_stack_value_MUX_uxn_opcodes_h_l3086_c7_a1ba_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3086_c7_a1ba] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3086_c7_a1ba_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3086_c7_a1ba_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3086_c7_a1ba_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3086_c7_a1ba_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3086_c7_a1ba_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3086_c7_a1ba_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3086_c7_a1ba_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3086_c7_a1ba_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3086_c7_a1ba] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3086_c7_a1ba_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3086_c7_a1ba_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3086_c7_a1ba_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3086_c7_a1ba_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3086_c7_a1ba_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3086_c7_a1ba_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3086_c7_a1ba_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3086_c7_a1ba_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3062_c2_8cc9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3062_c2_8cc9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3062_c2_8cc9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3062_c2_8cc9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3062_c2_8cc9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3062_c2_8cc9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3062_c2_8cc9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3062_c2_8cc9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3062_c2_8cc9_return_output;

     -- l16_MUX[uxn_opcodes_h_l3062_c2_8cc9] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l3062_c2_8cc9_cond <= VAR_l16_MUX_uxn_opcodes_h_l3062_c2_8cc9_cond;
     l16_MUX_uxn_opcodes_h_l3062_c2_8cc9_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l3062_c2_8cc9_iftrue;
     l16_MUX_uxn_opcodes_h_l3062_c2_8cc9_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l3062_c2_8cc9_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l3062_c2_8cc9_return_output := l16_MUX_uxn_opcodes_h_l3062_c2_8cc9_return_output;

     -- Submodule level 15
     REG_VAR_l16 := VAR_l16_MUX_uxn_opcodes_h_l3062_c2_8cc9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3083_c7_bb56_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3086_c7_a1ba_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3083_c7_bb56_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3086_c7_a1ba_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3062_c2_8cc9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3068_c7_7c53_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3079_c7_4155_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3083_c7_bb56_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3083_c7_bb56_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3086_c7_a1ba_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3062_c2_8cc9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3062_c2_8cc9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3062_c2_8cc9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3062_c2_8cc9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3062_c2_8cc9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3062_c2_8cc9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3062_c2_8cc9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3062_c2_8cc9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3062_c2_8cc9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3079_c7_4155] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3079_c7_4155_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3079_c7_4155_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3079_c7_4155_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3079_c7_4155_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3079_c7_4155_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3079_c7_4155_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3079_c7_4155_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3079_c7_4155_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3083_c7_bb56] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3083_c7_bb56_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3083_c7_bb56_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3083_c7_bb56_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3083_c7_bb56_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3083_c7_bb56_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3083_c7_bb56_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3083_c7_bb56_return_output := result_stack_value_MUX_uxn_opcodes_h_l3083_c7_bb56_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3083_c7_bb56] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3083_c7_bb56_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3083_c7_bb56_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3083_c7_bb56_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3083_c7_bb56_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3083_c7_bb56_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3083_c7_bb56_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3083_c7_bb56_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3083_c7_bb56_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3083_c7_bb56] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3083_c7_bb56_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3083_c7_bb56_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3083_c7_bb56_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3083_c7_bb56_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3083_c7_bb56_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3083_c7_bb56_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3083_c7_bb56_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3083_c7_bb56_return_output;

     -- Submodule level 16
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3079_c7_4155_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3083_c7_bb56_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3079_c7_4155_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3083_c7_bb56_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3076_c7_6a3f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3079_c7_4155_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3079_c7_4155_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3083_c7_bb56_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3076_c7_6a3f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3076_c7_6a3f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3076_c7_6a3f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3076_c7_6a3f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3076_c7_6a3f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3076_c7_6a3f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3076_c7_6a3f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3076_c7_6a3f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3076_c7_6a3f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3079_c7_4155] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3079_c7_4155_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3079_c7_4155_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3079_c7_4155_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3079_c7_4155_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3079_c7_4155_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3079_c7_4155_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3079_c7_4155_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3079_c7_4155_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3079_c7_4155] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3079_c7_4155_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3079_c7_4155_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3079_c7_4155_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3079_c7_4155_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3079_c7_4155_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3079_c7_4155_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3079_c7_4155_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3079_c7_4155_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3079_c7_4155] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3079_c7_4155_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3079_c7_4155_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3079_c7_4155_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3079_c7_4155_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3079_c7_4155_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3079_c7_4155_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3079_c7_4155_return_output := result_stack_value_MUX_uxn_opcodes_h_l3079_c7_4155_return_output;

     -- Submodule level 17
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3076_c7_6a3f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3079_c7_4155_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3076_c7_6a3f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3079_c7_4155_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3071_c7_94c5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3076_c7_6a3f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3076_c7_6a3f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3079_c7_4155_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3071_c7_94c5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3071_c7_94c5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3071_c7_94c5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3071_c7_94c5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3071_c7_94c5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3071_c7_94c5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3071_c7_94c5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3071_c7_94c5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3071_c7_94c5_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3076_c7_6a3f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3076_c7_6a3f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3076_c7_6a3f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3076_c7_6a3f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3076_c7_6a3f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3076_c7_6a3f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3076_c7_6a3f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3076_c7_6a3f_return_output := result_stack_value_MUX_uxn_opcodes_h_l3076_c7_6a3f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3076_c7_6a3f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3076_c7_6a3f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3076_c7_6a3f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3076_c7_6a3f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3076_c7_6a3f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3076_c7_6a3f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3076_c7_6a3f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3076_c7_6a3f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3076_c7_6a3f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3076_c7_6a3f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3076_c7_6a3f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3076_c7_6a3f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3076_c7_6a3f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3076_c7_6a3f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3076_c7_6a3f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3076_c7_6a3f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3076_c7_6a3f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3076_c7_6a3f_return_output;

     -- Submodule level 18
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3071_c7_94c5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3076_c7_6a3f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3071_c7_94c5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3076_c7_6a3f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3068_c7_7c53_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3071_c7_94c5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3071_c7_94c5_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3076_c7_6a3f_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l3071_c7_94c5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3071_c7_94c5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3071_c7_94c5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3071_c7_94c5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3071_c7_94c5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3071_c7_94c5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3071_c7_94c5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3071_c7_94c5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3071_c7_94c5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3068_c7_7c53] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3068_c7_7c53_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3068_c7_7c53_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3068_c7_7c53_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3068_c7_7c53_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3068_c7_7c53_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3068_c7_7c53_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3068_c7_7c53_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3068_c7_7c53_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3071_c7_94c5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3071_c7_94c5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3071_c7_94c5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3071_c7_94c5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3071_c7_94c5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3071_c7_94c5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3071_c7_94c5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3071_c7_94c5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3071_c7_94c5_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3071_c7_94c5] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3071_c7_94c5_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3071_c7_94c5_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3071_c7_94c5_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3071_c7_94c5_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3071_c7_94c5_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3071_c7_94c5_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3071_c7_94c5_return_output := result_stack_value_MUX_uxn_opcodes_h_l3071_c7_94c5_return_output;

     -- Submodule level 19
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3068_c7_7c53_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3071_c7_94c5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3068_c7_7c53_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3071_c7_94c5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3062_c2_8cc9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3068_c7_7c53_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3068_c7_7c53_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3071_c7_94c5_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3062_c2_8cc9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3062_c2_8cc9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3062_c2_8cc9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3062_c2_8cc9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3062_c2_8cc9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3062_c2_8cc9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3062_c2_8cc9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3062_c2_8cc9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3062_c2_8cc9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3068_c7_7c53] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3068_c7_7c53_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3068_c7_7c53_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3068_c7_7c53_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3068_c7_7c53_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3068_c7_7c53_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3068_c7_7c53_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3068_c7_7c53_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3068_c7_7c53_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3068_c7_7c53] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3068_c7_7c53_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3068_c7_7c53_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3068_c7_7c53_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3068_c7_7c53_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3068_c7_7c53_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3068_c7_7c53_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3068_c7_7c53_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3068_c7_7c53_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3068_c7_7c53] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3068_c7_7c53_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3068_c7_7c53_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3068_c7_7c53_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3068_c7_7c53_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3068_c7_7c53_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3068_c7_7c53_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3068_c7_7c53_return_output := result_stack_value_MUX_uxn_opcodes_h_l3068_c7_7c53_return_output;

     -- Submodule level 20
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3062_c2_8cc9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3068_c7_7c53_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3062_c2_8cc9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3068_c7_7c53_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3062_c2_8cc9_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3068_c7_7c53_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l3062_c2_8cc9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3062_c2_8cc9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3062_c2_8cc9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3062_c2_8cc9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3062_c2_8cc9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3062_c2_8cc9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3062_c2_8cc9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3062_c2_8cc9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3062_c2_8cc9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3062_c2_8cc9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3062_c2_8cc9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3062_c2_8cc9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3062_c2_8cc9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3062_c2_8cc9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3062_c2_8cc9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3062_c2_8cc9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3062_c2_8cc9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3062_c2_8cc9_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3062_c2_8cc9] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3062_c2_8cc9_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3062_c2_8cc9_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3062_c2_8cc9_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3062_c2_8cc9_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3062_c2_8cc9_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3062_c2_8cc9_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3062_c2_8cc9_return_output := result_stack_value_MUX_uxn_opcodes_h_l3062_c2_8cc9_return_output;

     -- Submodule level 21
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l3146_l3058_DUPLICATE_a3a4 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l3146_l3058_DUPLICATE_a3a4_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_1ade(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3062_c2_8cc9_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3062_c2_8cc9_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3062_c2_8cc9_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3062_c2_8cc9_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3062_c2_8cc9_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3062_c2_8cc9_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3062_c2_8cc9_return_output);

     -- Submodule level 22
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l3146_l3058_DUPLICATE_a3a4_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l3146_l3058_DUPLICATE_a3a4_return_output;
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
