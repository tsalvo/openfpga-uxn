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
-- Submodules: 98
entity lth2_0CLK_5ccafc54 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lth2_0CLK_5ccafc54;
architecture arch of lth2_0CLK_5ccafc54 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2081_c6_8078]
signal BIN_OP_EQ_uxn_opcodes_h_l2081_c6_8078_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2081_c6_8078_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2081_c6_8078_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2081_c1_f8b0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2081_c1_f8b0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2081_c1_f8b0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2081_c1_f8b0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2081_c1_f8b0_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2081_c2_d31c]
signal n16_MUX_uxn_opcodes_h_l2081_c2_d31c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2081_c2_d31c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2081_c2_d31c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2081_c2_d31c_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2081_c2_d31c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2081_c2_d31c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2081_c2_d31c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2081_c2_d31c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2081_c2_d31c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2081_c2_d31c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2081_c2_d31c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2081_c2_d31c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2081_c2_d31c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2081_c2_d31c_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2081_c2_d31c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2081_c2_d31c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2081_c2_d31c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2081_c2_d31c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2081_c2_d31c_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2081_c2_d31c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2081_c2_d31c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2081_c2_d31c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2081_c2_d31c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2081_c2_d31c_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2081_c2_d31c]
signal result_stack_value_MUX_uxn_opcodes_h_l2081_c2_d31c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2081_c2_d31c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2081_c2_d31c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2081_c2_d31c_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2081_c2_d31c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2081_c2_d31c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2081_c2_d31c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2081_c2_d31c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2081_c2_d31c_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2081_c2_d31c]
signal t16_MUX_uxn_opcodes_h_l2081_c2_d31c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2081_c2_d31c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2081_c2_d31c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2081_c2_d31c_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2082_c3_1b2f[uxn_opcodes_h_l2082_c3_1b2f]
signal printf_uxn_opcodes_h_l2082_c3_1b2f_uxn_opcodes_h_l2082_c3_1b2f_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2086_c11_b070]
signal BIN_OP_EQ_uxn_opcodes_h_l2086_c11_b070_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2086_c11_b070_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2086_c11_b070_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2086_c7_91c6]
signal n16_MUX_uxn_opcodes_h_l2086_c7_91c6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2086_c7_91c6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2086_c7_91c6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2086_c7_91c6_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2086_c7_91c6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2086_c7_91c6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2086_c7_91c6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2086_c7_91c6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2086_c7_91c6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2086_c7_91c6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2086_c7_91c6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2086_c7_91c6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2086_c7_91c6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2086_c7_91c6_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2086_c7_91c6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2086_c7_91c6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2086_c7_91c6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2086_c7_91c6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2086_c7_91c6_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2086_c7_91c6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2086_c7_91c6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2086_c7_91c6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2086_c7_91c6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2086_c7_91c6_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2086_c7_91c6]
signal result_stack_value_MUX_uxn_opcodes_h_l2086_c7_91c6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2086_c7_91c6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2086_c7_91c6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2086_c7_91c6_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2086_c7_91c6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2086_c7_91c6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2086_c7_91c6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2086_c7_91c6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2086_c7_91c6_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2086_c7_91c6]
signal t16_MUX_uxn_opcodes_h_l2086_c7_91c6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2086_c7_91c6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2086_c7_91c6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2086_c7_91c6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2089_c11_6cc5]
signal BIN_OP_EQ_uxn_opcodes_h_l2089_c11_6cc5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2089_c11_6cc5_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2089_c11_6cc5_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2089_c7_c1c3]
signal n16_MUX_uxn_opcodes_h_l2089_c7_c1c3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2089_c7_c1c3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2089_c7_c1c3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2089_c7_c1c3_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2089_c7_c1c3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2089_c7_c1c3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2089_c7_c1c3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2089_c7_c1c3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2089_c7_c1c3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2089_c7_c1c3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2089_c7_c1c3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2089_c7_c1c3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2089_c7_c1c3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2089_c7_c1c3_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2089_c7_c1c3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2089_c7_c1c3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2089_c7_c1c3_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2089_c7_c1c3_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2089_c7_c1c3_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2089_c7_c1c3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2089_c7_c1c3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2089_c7_c1c3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2089_c7_c1c3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2089_c7_c1c3_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2089_c7_c1c3]
signal result_stack_value_MUX_uxn_opcodes_h_l2089_c7_c1c3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2089_c7_c1c3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2089_c7_c1c3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2089_c7_c1c3_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2089_c7_c1c3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2089_c7_c1c3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2089_c7_c1c3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2089_c7_c1c3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2089_c7_c1c3_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2089_c7_c1c3]
signal t16_MUX_uxn_opcodes_h_l2089_c7_c1c3_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2089_c7_c1c3_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2089_c7_c1c3_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2089_c7_c1c3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2094_c11_35f0]
signal BIN_OP_EQ_uxn_opcodes_h_l2094_c11_35f0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2094_c11_35f0_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2094_c11_35f0_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2094_c7_7816]
signal n16_MUX_uxn_opcodes_h_l2094_c7_7816_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2094_c7_7816_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2094_c7_7816_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2094_c7_7816_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2094_c7_7816]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2094_c7_7816_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2094_c7_7816_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2094_c7_7816_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2094_c7_7816_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2094_c7_7816]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2094_c7_7816_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2094_c7_7816_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2094_c7_7816_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2094_c7_7816_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2094_c7_7816]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2094_c7_7816_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2094_c7_7816_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2094_c7_7816_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2094_c7_7816_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2094_c7_7816]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2094_c7_7816_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2094_c7_7816_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2094_c7_7816_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2094_c7_7816_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2094_c7_7816]
signal result_stack_value_MUX_uxn_opcodes_h_l2094_c7_7816_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2094_c7_7816_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2094_c7_7816_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2094_c7_7816_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2094_c7_7816]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2094_c7_7816_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2094_c7_7816_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2094_c7_7816_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2094_c7_7816_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2094_c7_7816]
signal t16_MUX_uxn_opcodes_h_l2094_c7_7816_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2094_c7_7816_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2094_c7_7816_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2094_c7_7816_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2097_c11_5e9c]
signal BIN_OP_EQ_uxn_opcodes_h_l2097_c11_5e9c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2097_c11_5e9c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2097_c11_5e9c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2097_c7_e2ab]
signal n16_MUX_uxn_opcodes_h_l2097_c7_e2ab_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2097_c7_e2ab_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2097_c7_e2ab_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2097_c7_e2ab_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2097_c7_e2ab]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2097_c7_e2ab_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2097_c7_e2ab_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2097_c7_e2ab_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2097_c7_e2ab_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2097_c7_e2ab]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2097_c7_e2ab_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2097_c7_e2ab_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2097_c7_e2ab_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2097_c7_e2ab_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2097_c7_e2ab]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2097_c7_e2ab_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2097_c7_e2ab_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2097_c7_e2ab_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2097_c7_e2ab_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2097_c7_e2ab]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2097_c7_e2ab_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2097_c7_e2ab_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2097_c7_e2ab_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2097_c7_e2ab_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2097_c7_e2ab]
signal result_stack_value_MUX_uxn_opcodes_h_l2097_c7_e2ab_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2097_c7_e2ab_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2097_c7_e2ab_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2097_c7_e2ab_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2097_c7_e2ab]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2097_c7_e2ab_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2097_c7_e2ab_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2097_c7_e2ab_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2097_c7_e2ab_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2097_c7_e2ab]
signal t16_MUX_uxn_opcodes_h_l2097_c7_e2ab_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2097_c7_e2ab_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2097_c7_e2ab_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2097_c7_e2ab_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2098_c3_4b1c]
signal BIN_OP_OR_uxn_opcodes_h_l2098_c3_4b1c_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2098_c3_4b1c_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2098_c3_4b1c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2101_c11_49e6]
signal BIN_OP_EQ_uxn_opcodes_h_l2101_c11_49e6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2101_c11_49e6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2101_c11_49e6_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2101_c7_0889]
signal n16_MUX_uxn_opcodes_h_l2101_c7_0889_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2101_c7_0889_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2101_c7_0889_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2101_c7_0889_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2101_c7_0889]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_0889_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_0889_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_0889_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_0889_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2101_c7_0889]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_0889_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_0889_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_0889_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_0889_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2101_c7_0889]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_0889_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_0889_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_0889_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_0889_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2101_c7_0889]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_0889_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_0889_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_0889_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_0889_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2101_c7_0889]
signal result_stack_value_MUX_uxn_opcodes_h_l2101_c7_0889_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2101_c7_0889_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2101_c7_0889_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2101_c7_0889_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2101_c7_0889]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_0889_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_0889_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_0889_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_0889_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2104_c11_a7ee]
signal BIN_OP_EQ_uxn_opcodes_h_l2104_c11_a7ee_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2104_c11_a7ee_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2104_c11_a7ee_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2104_c7_41de]
signal n16_MUX_uxn_opcodes_h_l2104_c7_41de_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2104_c7_41de_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2104_c7_41de_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2104_c7_41de_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2104_c7_41de]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_41de_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_41de_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_41de_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_41de_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2104_c7_41de]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_41de_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_41de_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_41de_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_41de_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2104_c7_41de]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_41de_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_41de_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_41de_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_41de_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2104_c7_41de]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_41de_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_41de_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_41de_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_41de_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2104_c7_41de]
signal result_stack_value_MUX_uxn_opcodes_h_l2104_c7_41de_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2104_c7_41de_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2104_c7_41de_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2104_c7_41de_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2104_c7_41de]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2104_c7_41de_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2104_c7_41de_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2104_c7_41de_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2104_c7_41de_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2109_c11_6c06]
signal BIN_OP_EQ_uxn_opcodes_h_l2109_c11_6c06_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2109_c11_6c06_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2109_c11_6c06_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2109_c7_c1aa]
signal n16_MUX_uxn_opcodes_h_l2109_c7_c1aa_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2109_c7_c1aa_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2109_c7_c1aa_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2109_c7_c1aa_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2109_c7_c1aa]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_c1aa_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_c1aa_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_c1aa_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_c1aa_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2109_c7_c1aa]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_c1aa_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_c1aa_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_c1aa_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_c1aa_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2109_c7_c1aa]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2109_c7_c1aa_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2109_c7_c1aa_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2109_c7_c1aa_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2109_c7_c1aa_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2109_c7_c1aa]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_c1aa_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_c1aa_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_c1aa_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_c1aa_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2109_c7_c1aa]
signal result_stack_value_MUX_uxn_opcodes_h_l2109_c7_c1aa_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2109_c7_c1aa_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2109_c7_c1aa_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2109_c7_c1aa_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2109_c7_c1aa]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_c1aa_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_c1aa_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_c1aa_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_c1aa_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2112_c11_cc20]
signal BIN_OP_EQ_uxn_opcodes_h_l2112_c11_cc20_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2112_c11_cc20_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2112_c11_cc20_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2112_c7_3b2c]
signal n16_MUX_uxn_opcodes_h_l2112_c7_3b2c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2112_c7_3b2c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2112_c7_3b2c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2112_c7_3b2c_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2112_c7_3b2c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_3b2c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_3b2c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_3b2c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_3b2c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2112_c7_3b2c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_3b2c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_3b2c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_3b2c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_3b2c_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2112_c7_3b2c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_3b2c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_3b2c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_3b2c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_3b2c_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2112_c7_3b2c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_3b2c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_3b2c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_3b2c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_3b2c_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2112_c7_3b2c]
signal result_stack_value_MUX_uxn_opcodes_h_l2112_c7_3b2c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2112_c7_3b2c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2112_c7_3b2c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2112_c7_3b2c_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2112_c7_3b2c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2112_c7_3b2c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2112_c7_3b2c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2112_c7_3b2c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2112_c7_3b2c_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2113_c3_0538]
signal BIN_OP_OR_uxn_opcodes_h_l2113_c3_0538_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2113_c3_0538_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2113_c3_0538_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2115_c32_2e5f]
signal BIN_OP_AND_uxn_opcodes_h_l2115_c32_2e5f_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2115_c32_2e5f_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2115_c32_2e5f_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2115_c32_8a49]
signal BIN_OP_GT_uxn_opcodes_h_l2115_c32_8a49_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2115_c32_8a49_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2115_c32_8a49_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2115_c32_e8d0]
signal MUX_uxn_opcodes_h_l2115_c32_e8d0_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2115_c32_e8d0_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2115_c32_e8d0_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2115_c32_e8d0_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2117_c11_a2b7]
signal BIN_OP_EQ_uxn_opcodes_h_l2117_c11_a2b7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2117_c11_a2b7_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2117_c11_a2b7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2117_c7_0176]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2117_c7_0176_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2117_c7_0176_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2117_c7_0176_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2117_c7_0176_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2117_c7_0176]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2117_c7_0176_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2117_c7_0176_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2117_c7_0176_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2117_c7_0176_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2117_c7_0176]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2117_c7_0176_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2117_c7_0176_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2117_c7_0176_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2117_c7_0176_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2117_c7_0176]
signal result_stack_value_MUX_uxn_opcodes_h_l2117_c7_0176_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2117_c7_0176_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2117_c7_0176_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2117_c7_0176_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2117_c7_0176]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2117_c7_0176_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2117_c7_0176_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2117_c7_0176_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2117_c7_0176_return_output : unsigned(0 downto 0);

-- BIN_OP_LT[uxn_opcodes_h_l2121_c24_16a4]
signal BIN_OP_LT_uxn_opcodes_h_l2121_c24_16a4_left : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l2121_c24_16a4_right : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l2121_c24_16a4_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2121_c24_af9e]
signal MUX_uxn_opcodes_h_l2121_c24_af9e_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2121_c24_af9e_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2121_c24_af9e_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2121_c24_af9e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2123_c11_8610]
signal BIN_OP_EQ_uxn_opcodes_h_l2123_c11_8610_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2123_c11_8610_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2123_c11_8610_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2123_c7_58e9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_58e9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_58e9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_58e9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_58e9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2123_c7_58e9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_58e9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_58e9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_58e9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_58e9_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2106_l2091_DUPLICATE_7557
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2106_l2091_DUPLICATE_7557_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2106_l2091_DUPLICATE_7557_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_53ff( ref_toks_0 : opcode_result_t;
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
      base.is_opc_done := ref_toks_4;
      base.stack_value := ref_toks_5;
      base.is_sp_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2081_c6_8078
BIN_OP_EQ_uxn_opcodes_h_l2081_c6_8078 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2081_c6_8078_left,
BIN_OP_EQ_uxn_opcodes_h_l2081_c6_8078_right,
BIN_OP_EQ_uxn_opcodes_h_l2081_c6_8078_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2081_c1_f8b0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2081_c1_f8b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2081_c1_f8b0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2081_c1_f8b0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2081_c1_f8b0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2081_c1_f8b0_return_output);

-- n16_MUX_uxn_opcodes_h_l2081_c2_d31c
n16_MUX_uxn_opcodes_h_l2081_c2_d31c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2081_c2_d31c_cond,
n16_MUX_uxn_opcodes_h_l2081_c2_d31c_iftrue,
n16_MUX_uxn_opcodes_h_l2081_c2_d31c_iffalse,
n16_MUX_uxn_opcodes_h_l2081_c2_d31c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2081_c2_d31c
result_is_stack_write_MUX_uxn_opcodes_h_l2081_c2_d31c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2081_c2_d31c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2081_c2_d31c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2081_c2_d31c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2081_c2_d31c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2081_c2_d31c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2081_c2_d31c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2081_c2_d31c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2081_c2_d31c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2081_c2_d31c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2081_c2_d31c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2081_c2_d31c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2081_c2_d31c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2081_c2_d31c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2081_c2_d31c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2081_c2_d31c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2081_c2_d31c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2081_c2_d31c
result_is_opc_done_MUX_uxn_opcodes_h_l2081_c2_d31c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2081_c2_d31c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2081_c2_d31c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2081_c2_d31c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2081_c2_d31c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2081_c2_d31c
result_stack_value_MUX_uxn_opcodes_h_l2081_c2_d31c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2081_c2_d31c_cond,
result_stack_value_MUX_uxn_opcodes_h_l2081_c2_d31c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2081_c2_d31c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2081_c2_d31c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2081_c2_d31c
result_is_sp_shift_MUX_uxn_opcodes_h_l2081_c2_d31c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2081_c2_d31c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2081_c2_d31c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2081_c2_d31c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2081_c2_d31c_return_output);

-- t16_MUX_uxn_opcodes_h_l2081_c2_d31c
t16_MUX_uxn_opcodes_h_l2081_c2_d31c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2081_c2_d31c_cond,
t16_MUX_uxn_opcodes_h_l2081_c2_d31c_iftrue,
t16_MUX_uxn_opcodes_h_l2081_c2_d31c_iffalse,
t16_MUX_uxn_opcodes_h_l2081_c2_d31c_return_output);

-- printf_uxn_opcodes_h_l2082_c3_1b2f_uxn_opcodes_h_l2082_c3_1b2f
printf_uxn_opcodes_h_l2082_c3_1b2f_uxn_opcodes_h_l2082_c3_1b2f : entity work.printf_uxn_opcodes_h_l2082_c3_1b2f_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2082_c3_1b2f_uxn_opcodes_h_l2082_c3_1b2f_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2086_c11_b070
BIN_OP_EQ_uxn_opcodes_h_l2086_c11_b070 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2086_c11_b070_left,
BIN_OP_EQ_uxn_opcodes_h_l2086_c11_b070_right,
BIN_OP_EQ_uxn_opcodes_h_l2086_c11_b070_return_output);

-- n16_MUX_uxn_opcodes_h_l2086_c7_91c6
n16_MUX_uxn_opcodes_h_l2086_c7_91c6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2086_c7_91c6_cond,
n16_MUX_uxn_opcodes_h_l2086_c7_91c6_iftrue,
n16_MUX_uxn_opcodes_h_l2086_c7_91c6_iffalse,
n16_MUX_uxn_opcodes_h_l2086_c7_91c6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2086_c7_91c6
result_is_stack_write_MUX_uxn_opcodes_h_l2086_c7_91c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2086_c7_91c6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2086_c7_91c6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2086_c7_91c6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2086_c7_91c6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2086_c7_91c6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2086_c7_91c6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2086_c7_91c6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2086_c7_91c6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2086_c7_91c6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2086_c7_91c6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2086_c7_91c6
result_sp_relative_shift_MUX_uxn_opcodes_h_l2086_c7_91c6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2086_c7_91c6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2086_c7_91c6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2086_c7_91c6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2086_c7_91c6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2086_c7_91c6
result_is_opc_done_MUX_uxn_opcodes_h_l2086_c7_91c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2086_c7_91c6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2086_c7_91c6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2086_c7_91c6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2086_c7_91c6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2086_c7_91c6
result_stack_value_MUX_uxn_opcodes_h_l2086_c7_91c6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2086_c7_91c6_cond,
result_stack_value_MUX_uxn_opcodes_h_l2086_c7_91c6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2086_c7_91c6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2086_c7_91c6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2086_c7_91c6
result_is_sp_shift_MUX_uxn_opcodes_h_l2086_c7_91c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2086_c7_91c6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2086_c7_91c6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2086_c7_91c6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2086_c7_91c6_return_output);

-- t16_MUX_uxn_opcodes_h_l2086_c7_91c6
t16_MUX_uxn_opcodes_h_l2086_c7_91c6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2086_c7_91c6_cond,
t16_MUX_uxn_opcodes_h_l2086_c7_91c6_iftrue,
t16_MUX_uxn_opcodes_h_l2086_c7_91c6_iffalse,
t16_MUX_uxn_opcodes_h_l2086_c7_91c6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2089_c11_6cc5
BIN_OP_EQ_uxn_opcodes_h_l2089_c11_6cc5 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2089_c11_6cc5_left,
BIN_OP_EQ_uxn_opcodes_h_l2089_c11_6cc5_right,
BIN_OP_EQ_uxn_opcodes_h_l2089_c11_6cc5_return_output);

-- n16_MUX_uxn_opcodes_h_l2089_c7_c1c3
n16_MUX_uxn_opcodes_h_l2089_c7_c1c3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2089_c7_c1c3_cond,
n16_MUX_uxn_opcodes_h_l2089_c7_c1c3_iftrue,
n16_MUX_uxn_opcodes_h_l2089_c7_c1c3_iffalse,
n16_MUX_uxn_opcodes_h_l2089_c7_c1c3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2089_c7_c1c3
result_is_stack_write_MUX_uxn_opcodes_h_l2089_c7_c1c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2089_c7_c1c3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2089_c7_c1c3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2089_c7_c1c3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2089_c7_c1c3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2089_c7_c1c3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2089_c7_c1c3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2089_c7_c1c3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2089_c7_c1c3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2089_c7_c1c3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2089_c7_c1c3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2089_c7_c1c3
result_sp_relative_shift_MUX_uxn_opcodes_h_l2089_c7_c1c3 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2089_c7_c1c3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2089_c7_c1c3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2089_c7_c1c3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2089_c7_c1c3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2089_c7_c1c3
result_is_opc_done_MUX_uxn_opcodes_h_l2089_c7_c1c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2089_c7_c1c3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2089_c7_c1c3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2089_c7_c1c3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2089_c7_c1c3_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2089_c7_c1c3
result_stack_value_MUX_uxn_opcodes_h_l2089_c7_c1c3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2089_c7_c1c3_cond,
result_stack_value_MUX_uxn_opcodes_h_l2089_c7_c1c3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2089_c7_c1c3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2089_c7_c1c3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2089_c7_c1c3
result_is_sp_shift_MUX_uxn_opcodes_h_l2089_c7_c1c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2089_c7_c1c3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2089_c7_c1c3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2089_c7_c1c3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2089_c7_c1c3_return_output);

-- t16_MUX_uxn_opcodes_h_l2089_c7_c1c3
t16_MUX_uxn_opcodes_h_l2089_c7_c1c3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2089_c7_c1c3_cond,
t16_MUX_uxn_opcodes_h_l2089_c7_c1c3_iftrue,
t16_MUX_uxn_opcodes_h_l2089_c7_c1c3_iffalse,
t16_MUX_uxn_opcodes_h_l2089_c7_c1c3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2094_c11_35f0
BIN_OP_EQ_uxn_opcodes_h_l2094_c11_35f0 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2094_c11_35f0_left,
BIN_OP_EQ_uxn_opcodes_h_l2094_c11_35f0_right,
BIN_OP_EQ_uxn_opcodes_h_l2094_c11_35f0_return_output);

-- n16_MUX_uxn_opcodes_h_l2094_c7_7816
n16_MUX_uxn_opcodes_h_l2094_c7_7816 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2094_c7_7816_cond,
n16_MUX_uxn_opcodes_h_l2094_c7_7816_iftrue,
n16_MUX_uxn_opcodes_h_l2094_c7_7816_iffalse,
n16_MUX_uxn_opcodes_h_l2094_c7_7816_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2094_c7_7816
result_is_stack_write_MUX_uxn_opcodes_h_l2094_c7_7816 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2094_c7_7816_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2094_c7_7816_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2094_c7_7816_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2094_c7_7816_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2094_c7_7816
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2094_c7_7816 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2094_c7_7816_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2094_c7_7816_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2094_c7_7816_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2094_c7_7816_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2094_c7_7816
result_sp_relative_shift_MUX_uxn_opcodes_h_l2094_c7_7816 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2094_c7_7816_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2094_c7_7816_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2094_c7_7816_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2094_c7_7816_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2094_c7_7816
result_is_opc_done_MUX_uxn_opcodes_h_l2094_c7_7816 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2094_c7_7816_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2094_c7_7816_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2094_c7_7816_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2094_c7_7816_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2094_c7_7816
result_stack_value_MUX_uxn_opcodes_h_l2094_c7_7816 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2094_c7_7816_cond,
result_stack_value_MUX_uxn_opcodes_h_l2094_c7_7816_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2094_c7_7816_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2094_c7_7816_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2094_c7_7816
result_is_sp_shift_MUX_uxn_opcodes_h_l2094_c7_7816 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2094_c7_7816_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2094_c7_7816_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2094_c7_7816_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2094_c7_7816_return_output);

-- t16_MUX_uxn_opcodes_h_l2094_c7_7816
t16_MUX_uxn_opcodes_h_l2094_c7_7816 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2094_c7_7816_cond,
t16_MUX_uxn_opcodes_h_l2094_c7_7816_iftrue,
t16_MUX_uxn_opcodes_h_l2094_c7_7816_iffalse,
t16_MUX_uxn_opcodes_h_l2094_c7_7816_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2097_c11_5e9c
BIN_OP_EQ_uxn_opcodes_h_l2097_c11_5e9c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2097_c11_5e9c_left,
BIN_OP_EQ_uxn_opcodes_h_l2097_c11_5e9c_right,
BIN_OP_EQ_uxn_opcodes_h_l2097_c11_5e9c_return_output);

-- n16_MUX_uxn_opcodes_h_l2097_c7_e2ab
n16_MUX_uxn_opcodes_h_l2097_c7_e2ab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2097_c7_e2ab_cond,
n16_MUX_uxn_opcodes_h_l2097_c7_e2ab_iftrue,
n16_MUX_uxn_opcodes_h_l2097_c7_e2ab_iffalse,
n16_MUX_uxn_opcodes_h_l2097_c7_e2ab_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2097_c7_e2ab
result_is_stack_write_MUX_uxn_opcodes_h_l2097_c7_e2ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2097_c7_e2ab_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2097_c7_e2ab_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2097_c7_e2ab_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2097_c7_e2ab_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2097_c7_e2ab
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2097_c7_e2ab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2097_c7_e2ab_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2097_c7_e2ab_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2097_c7_e2ab_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2097_c7_e2ab_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2097_c7_e2ab
result_sp_relative_shift_MUX_uxn_opcodes_h_l2097_c7_e2ab : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2097_c7_e2ab_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2097_c7_e2ab_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2097_c7_e2ab_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2097_c7_e2ab_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2097_c7_e2ab
result_is_opc_done_MUX_uxn_opcodes_h_l2097_c7_e2ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2097_c7_e2ab_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2097_c7_e2ab_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2097_c7_e2ab_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2097_c7_e2ab_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2097_c7_e2ab
result_stack_value_MUX_uxn_opcodes_h_l2097_c7_e2ab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2097_c7_e2ab_cond,
result_stack_value_MUX_uxn_opcodes_h_l2097_c7_e2ab_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2097_c7_e2ab_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2097_c7_e2ab_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2097_c7_e2ab
result_is_sp_shift_MUX_uxn_opcodes_h_l2097_c7_e2ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2097_c7_e2ab_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2097_c7_e2ab_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2097_c7_e2ab_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2097_c7_e2ab_return_output);

-- t16_MUX_uxn_opcodes_h_l2097_c7_e2ab
t16_MUX_uxn_opcodes_h_l2097_c7_e2ab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2097_c7_e2ab_cond,
t16_MUX_uxn_opcodes_h_l2097_c7_e2ab_iftrue,
t16_MUX_uxn_opcodes_h_l2097_c7_e2ab_iffalse,
t16_MUX_uxn_opcodes_h_l2097_c7_e2ab_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2098_c3_4b1c
BIN_OP_OR_uxn_opcodes_h_l2098_c3_4b1c : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2098_c3_4b1c_left,
BIN_OP_OR_uxn_opcodes_h_l2098_c3_4b1c_right,
BIN_OP_OR_uxn_opcodes_h_l2098_c3_4b1c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2101_c11_49e6
BIN_OP_EQ_uxn_opcodes_h_l2101_c11_49e6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2101_c11_49e6_left,
BIN_OP_EQ_uxn_opcodes_h_l2101_c11_49e6_right,
BIN_OP_EQ_uxn_opcodes_h_l2101_c11_49e6_return_output);

-- n16_MUX_uxn_opcodes_h_l2101_c7_0889
n16_MUX_uxn_opcodes_h_l2101_c7_0889 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2101_c7_0889_cond,
n16_MUX_uxn_opcodes_h_l2101_c7_0889_iftrue,
n16_MUX_uxn_opcodes_h_l2101_c7_0889_iffalse,
n16_MUX_uxn_opcodes_h_l2101_c7_0889_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_0889
result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_0889 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_0889_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_0889_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_0889_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_0889_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_0889
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_0889 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_0889_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_0889_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_0889_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_0889_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_0889
result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_0889 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_0889_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_0889_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_0889_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_0889_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_0889
result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_0889 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_0889_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_0889_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_0889_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_0889_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2101_c7_0889
result_stack_value_MUX_uxn_opcodes_h_l2101_c7_0889 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2101_c7_0889_cond,
result_stack_value_MUX_uxn_opcodes_h_l2101_c7_0889_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2101_c7_0889_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2101_c7_0889_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_0889
result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_0889 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_0889_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_0889_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_0889_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_0889_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2104_c11_a7ee
BIN_OP_EQ_uxn_opcodes_h_l2104_c11_a7ee : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2104_c11_a7ee_left,
BIN_OP_EQ_uxn_opcodes_h_l2104_c11_a7ee_right,
BIN_OP_EQ_uxn_opcodes_h_l2104_c11_a7ee_return_output);

-- n16_MUX_uxn_opcodes_h_l2104_c7_41de
n16_MUX_uxn_opcodes_h_l2104_c7_41de : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2104_c7_41de_cond,
n16_MUX_uxn_opcodes_h_l2104_c7_41de_iftrue,
n16_MUX_uxn_opcodes_h_l2104_c7_41de_iffalse,
n16_MUX_uxn_opcodes_h_l2104_c7_41de_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_41de
result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_41de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_41de_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_41de_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_41de_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_41de_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_41de
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_41de : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_41de_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_41de_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_41de_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_41de_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_41de
result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_41de : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_41de_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_41de_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_41de_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_41de_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_41de
result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_41de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_41de_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_41de_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_41de_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_41de_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2104_c7_41de
result_stack_value_MUX_uxn_opcodes_h_l2104_c7_41de : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2104_c7_41de_cond,
result_stack_value_MUX_uxn_opcodes_h_l2104_c7_41de_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2104_c7_41de_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2104_c7_41de_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2104_c7_41de
result_is_sp_shift_MUX_uxn_opcodes_h_l2104_c7_41de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2104_c7_41de_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2104_c7_41de_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2104_c7_41de_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2104_c7_41de_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2109_c11_6c06
BIN_OP_EQ_uxn_opcodes_h_l2109_c11_6c06 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2109_c11_6c06_left,
BIN_OP_EQ_uxn_opcodes_h_l2109_c11_6c06_right,
BIN_OP_EQ_uxn_opcodes_h_l2109_c11_6c06_return_output);

-- n16_MUX_uxn_opcodes_h_l2109_c7_c1aa
n16_MUX_uxn_opcodes_h_l2109_c7_c1aa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2109_c7_c1aa_cond,
n16_MUX_uxn_opcodes_h_l2109_c7_c1aa_iftrue,
n16_MUX_uxn_opcodes_h_l2109_c7_c1aa_iffalse,
n16_MUX_uxn_opcodes_h_l2109_c7_c1aa_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_c1aa
result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_c1aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_c1aa_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_c1aa_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_c1aa_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_c1aa_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_c1aa
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_c1aa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_c1aa_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_c1aa_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_c1aa_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_c1aa_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2109_c7_c1aa
result_sp_relative_shift_MUX_uxn_opcodes_h_l2109_c7_c1aa : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2109_c7_c1aa_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2109_c7_c1aa_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2109_c7_c1aa_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2109_c7_c1aa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_c1aa
result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_c1aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_c1aa_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_c1aa_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_c1aa_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_c1aa_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2109_c7_c1aa
result_stack_value_MUX_uxn_opcodes_h_l2109_c7_c1aa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2109_c7_c1aa_cond,
result_stack_value_MUX_uxn_opcodes_h_l2109_c7_c1aa_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2109_c7_c1aa_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2109_c7_c1aa_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_c1aa
result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_c1aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_c1aa_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_c1aa_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_c1aa_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_c1aa_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2112_c11_cc20
BIN_OP_EQ_uxn_opcodes_h_l2112_c11_cc20 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2112_c11_cc20_left,
BIN_OP_EQ_uxn_opcodes_h_l2112_c11_cc20_right,
BIN_OP_EQ_uxn_opcodes_h_l2112_c11_cc20_return_output);

-- n16_MUX_uxn_opcodes_h_l2112_c7_3b2c
n16_MUX_uxn_opcodes_h_l2112_c7_3b2c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2112_c7_3b2c_cond,
n16_MUX_uxn_opcodes_h_l2112_c7_3b2c_iftrue,
n16_MUX_uxn_opcodes_h_l2112_c7_3b2c_iffalse,
n16_MUX_uxn_opcodes_h_l2112_c7_3b2c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_3b2c
result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_3b2c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_3b2c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_3b2c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_3b2c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_3b2c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_3b2c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_3b2c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_3b2c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_3b2c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_3b2c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_3b2c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_3b2c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_3b2c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_3b2c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_3b2c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_3b2c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_3b2c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_3b2c
result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_3b2c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_3b2c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_3b2c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_3b2c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_3b2c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2112_c7_3b2c
result_stack_value_MUX_uxn_opcodes_h_l2112_c7_3b2c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2112_c7_3b2c_cond,
result_stack_value_MUX_uxn_opcodes_h_l2112_c7_3b2c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2112_c7_3b2c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2112_c7_3b2c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2112_c7_3b2c
result_is_sp_shift_MUX_uxn_opcodes_h_l2112_c7_3b2c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2112_c7_3b2c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2112_c7_3b2c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2112_c7_3b2c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2112_c7_3b2c_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2113_c3_0538
BIN_OP_OR_uxn_opcodes_h_l2113_c3_0538 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2113_c3_0538_left,
BIN_OP_OR_uxn_opcodes_h_l2113_c3_0538_right,
BIN_OP_OR_uxn_opcodes_h_l2113_c3_0538_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2115_c32_2e5f
BIN_OP_AND_uxn_opcodes_h_l2115_c32_2e5f : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2115_c32_2e5f_left,
BIN_OP_AND_uxn_opcodes_h_l2115_c32_2e5f_right,
BIN_OP_AND_uxn_opcodes_h_l2115_c32_2e5f_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2115_c32_8a49
BIN_OP_GT_uxn_opcodes_h_l2115_c32_8a49 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2115_c32_8a49_left,
BIN_OP_GT_uxn_opcodes_h_l2115_c32_8a49_right,
BIN_OP_GT_uxn_opcodes_h_l2115_c32_8a49_return_output);

-- MUX_uxn_opcodes_h_l2115_c32_e8d0
MUX_uxn_opcodes_h_l2115_c32_e8d0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2115_c32_e8d0_cond,
MUX_uxn_opcodes_h_l2115_c32_e8d0_iftrue,
MUX_uxn_opcodes_h_l2115_c32_e8d0_iffalse,
MUX_uxn_opcodes_h_l2115_c32_e8d0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2117_c11_a2b7
BIN_OP_EQ_uxn_opcodes_h_l2117_c11_a2b7 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2117_c11_a2b7_left,
BIN_OP_EQ_uxn_opcodes_h_l2117_c11_a2b7_right,
BIN_OP_EQ_uxn_opcodes_h_l2117_c11_a2b7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2117_c7_0176
result_is_stack_write_MUX_uxn_opcodes_h_l2117_c7_0176 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2117_c7_0176_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2117_c7_0176_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2117_c7_0176_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2117_c7_0176_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2117_c7_0176
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2117_c7_0176 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2117_c7_0176_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2117_c7_0176_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2117_c7_0176_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2117_c7_0176_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2117_c7_0176
result_is_opc_done_MUX_uxn_opcodes_h_l2117_c7_0176 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2117_c7_0176_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2117_c7_0176_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2117_c7_0176_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2117_c7_0176_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2117_c7_0176
result_stack_value_MUX_uxn_opcodes_h_l2117_c7_0176 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2117_c7_0176_cond,
result_stack_value_MUX_uxn_opcodes_h_l2117_c7_0176_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2117_c7_0176_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2117_c7_0176_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2117_c7_0176
result_is_sp_shift_MUX_uxn_opcodes_h_l2117_c7_0176 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2117_c7_0176_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2117_c7_0176_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2117_c7_0176_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2117_c7_0176_return_output);

-- BIN_OP_LT_uxn_opcodes_h_l2121_c24_16a4
BIN_OP_LT_uxn_opcodes_h_l2121_c24_16a4 : entity work.BIN_OP_LT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_LT_uxn_opcodes_h_l2121_c24_16a4_left,
BIN_OP_LT_uxn_opcodes_h_l2121_c24_16a4_right,
BIN_OP_LT_uxn_opcodes_h_l2121_c24_16a4_return_output);

-- MUX_uxn_opcodes_h_l2121_c24_af9e
MUX_uxn_opcodes_h_l2121_c24_af9e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2121_c24_af9e_cond,
MUX_uxn_opcodes_h_l2121_c24_af9e_iftrue,
MUX_uxn_opcodes_h_l2121_c24_af9e_iffalse,
MUX_uxn_opcodes_h_l2121_c24_af9e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2123_c11_8610
BIN_OP_EQ_uxn_opcodes_h_l2123_c11_8610 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2123_c11_8610_left,
BIN_OP_EQ_uxn_opcodes_h_l2123_c11_8610_right,
BIN_OP_EQ_uxn_opcodes_h_l2123_c11_8610_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_58e9
result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_58e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_58e9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_58e9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_58e9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_58e9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_58e9
result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_58e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_58e9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_58e9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_58e9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_58e9_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2106_l2091_DUPLICATE_7557
CONST_SL_8_uint16_t_uxn_opcodes_h_l2106_l2091_DUPLICATE_7557 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2106_l2091_DUPLICATE_7557_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2106_l2091_DUPLICATE_7557_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2081_c6_8078_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2081_c1_f8b0_return_output,
 n16_MUX_uxn_opcodes_h_l2081_c2_d31c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2081_c2_d31c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2081_c2_d31c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2081_c2_d31c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2081_c2_d31c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2081_c2_d31c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2081_c2_d31c_return_output,
 t16_MUX_uxn_opcodes_h_l2081_c2_d31c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2086_c11_b070_return_output,
 n16_MUX_uxn_opcodes_h_l2086_c7_91c6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2086_c7_91c6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2086_c7_91c6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2086_c7_91c6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2086_c7_91c6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2086_c7_91c6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2086_c7_91c6_return_output,
 t16_MUX_uxn_opcodes_h_l2086_c7_91c6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2089_c11_6cc5_return_output,
 n16_MUX_uxn_opcodes_h_l2089_c7_c1c3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2089_c7_c1c3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2089_c7_c1c3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2089_c7_c1c3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2089_c7_c1c3_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2089_c7_c1c3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2089_c7_c1c3_return_output,
 t16_MUX_uxn_opcodes_h_l2089_c7_c1c3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2094_c11_35f0_return_output,
 n16_MUX_uxn_opcodes_h_l2094_c7_7816_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2094_c7_7816_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2094_c7_7816_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2094_c7_7816_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2094_c7_7816_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2094_c7_7816_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2094_c7_7816_return_output,
 t16_MUX_uxn_opcodes_h_l2094_c7_7816_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2097_c11_5e9c_return_output,
 n16_MUX_uxn_opcodes_h_l2097_c7_e2ab_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2097_c7_e2ab_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2097_c7_e2ab_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2097_c7_e2ab_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2097_c7_e2ab_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2097_c7_e2ab_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2097_c7_e2ab_return_output,
 t16_MUX_uxn_opcodes_h_l2097_c7_e2ab_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2098_c3_4b1c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2101_c11_49e6_return_output,
 n16_MUX_uxn_opcodes_h_l2101_c7_0889_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_0889_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_0889_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_0889_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_0889_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2101_c7_0889_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_0889_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2104_c11_a7ee_return_output,
 n16_MUX_uxn_opcodes_h_l2104_c7_41de_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_41de_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_41de_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_41de_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_41de_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2104_c7_41de_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2104_c7_41de_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2109_c11_6c06_return_output,
 n16_MUX_uxn_opcodes_h_l2109_c7_c1aa_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_c1aa_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_c1aa_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2109_c7_c1aa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_c1aa_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2109_c7_c1aa_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_c1aa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2112_c11_cc20_return_output,
 n16_MUX_uxn_opcodes_h_l2112_c7_3b2c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_3b2c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_3b2c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_3b2c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_3b2c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2112_c7_3b2c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2112_c7_3b2c_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2113_c3_0538_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2115_c32_2e5f_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2115_c32_8a49_return_output,
 MUX_uxn_opcodes_h_l2115_c32_e8d0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2117_c11_a2b7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2117_c7_0176_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2117_c7_0176_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2117_c7_0176_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2117_c7_0176_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2117_c7_0176_return_output,
 BIN_OP_LT_uxn_opcodes_h_l2121_c24_16a4_return_output,
 MUX_uxn_opcodes_h_l2121_c24_af9e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2123_c11_8610_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_58e9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_58e9_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2106_l2091_DUPLICATE_7557_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2081_c6_8078_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2081_c6_8078_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2081_c6_8078_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2081_c1_f8b0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2081_c1_f8b0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2081_c1_f8b0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2081_c1_f8b0_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2081_c2_d31c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2081_c2_d31c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2086_c7_91c6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2081_c2_d31c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2081_c2_d31c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2081_c2_d31c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2081_c2_d31c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2086_c7_91c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2081_c2_d31c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2081_c2_d31c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2081_c2_d31c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2083_c3_267f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2081_c2_d31c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2086_c7_91c6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2081_c2_d31c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2081_c2_d31c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2081_c2_d31c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2081_c2_d31c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2086_c7_91c6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2081_c2_d31c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2081_c2_d31c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2081_c2_d31c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2081_c2_d31c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2086_c7_91c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2081_c2_d31c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2081_c2_d31c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2081_c2_d31c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2081_c2_d31c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2086_c7_91c6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2081_c2_d31c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2081_c2_d31c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2081_c2_d31c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2081_c2_d31c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2086_c7_91c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2081_c2_d31c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2081_c2_d31c_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2081_c2_d31c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2081_c2_d31c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2086_c7_91c6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2081_c2_d31c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2081_c2_d31c_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2082_c3_1b2f_uxn_opcodes_h_l2082_c3_1b2f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2086_c11_b070_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2086_c11_b070_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2086_c11_b070_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2086_c7_91c6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2086_c7_91c6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2089_c7_c1c3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2086_c7_91c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2086_c7_91c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2086_c7_91c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2089_c7_c1c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2086_c7_91c6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2086_c7_91c6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2087_c3_ed9a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2086_c7_91c6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2089_c7_c1c3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2086_c7_91c6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2086_c7_91c6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2086_c7_91c6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2089_c7_c1c3_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2086_c7_91c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2086_c7_91c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2086_c7_91c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2089_c7_c1c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2086_c7_91c6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2086_c7_91c6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2086_c7_91c6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2089_c7_c1c3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2086_c7_91c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2086_c7_91c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2086_c7_91c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2089_c7_c1c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2086_c7_91c6_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2086_c7_91c6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2086_c7_91c6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2089_c7_c1c3_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2086_c7_91c6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2089_c11_6cc5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2089_c11_6cc5_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2089_c11_6cc5_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2089_c7_c1c3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2089_c7_c1c3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2094_c7_7816_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2089_c7_c1c3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2089_c7_c1c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2089_c7_c1c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2094_c7_7816_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2089_c7_c1c3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2089_c7_c1c3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2092_c3_3be8 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2089_c7_c1c3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2094_c7_7816_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2089_c7_c1c3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2089_c7_c1c3_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2089_c7_c1c3_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2094_c7_7816_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2089_c7_c1c3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2089_c7_c1c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2089_c7_c1c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2094_c7_7816_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2089_c7_c1c3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2089_c7_c1c3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2089_c7_c1c3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2094_c7_7816_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2089_c7_c1c3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2089_c7_c1c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2089_c7_c1c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2094_c7_7816_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2089_c7_c1c3_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2089_c7_c1c3_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2089_c7_c1c3_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2094_c7_7816_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2089_c7_c1c3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2094_c11_35f0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2094_c11_35f0_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2094_c11_35f0_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2094_c7_7816_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2094_c7_7816_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2097_c7_e2ab_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2094_c7_7816_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2094_c7_7816_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2094_c7_7816_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2097_c7_e2ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2094_c7_7816_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2094_c7_7816_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2095_c3_35c0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2094_c7_7816_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2097_c7_e2ab_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2094_c7_7816_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2094_c7_7816_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2094_c7_7816_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2097_c7_e2ab_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2094_c7_7816_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2094_c7_7816_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2094_c7_7816_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2097_c7_e2ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2094_c7_7816_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2094_c7_7816_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2094_c7_7816_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2097_c7_e2ab_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2094_c7_7816_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2094_c7_7816_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2094_c7_7816_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2097_c7_e2ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2094_c7_7816_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2094_c7_7816_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2094_c7_7816_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2097_c7_e2ab_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2094_c7_7816_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2097_c11_5e9c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2097_c11_5e9c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2097_c11_5e9c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2097_c7_e2ab_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2097_c7_e2ab_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2101_c7_0889_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2097_c7_e2ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2097_c7_e2ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2097_c7_e2ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_0889_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2097_c7_e2ab_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2097_c7_e2ab_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2099_c3_43d3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2097_c7_e2ab_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_0889_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2097_c7_e2ab_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2097_c7_e2ab_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2097_c7_e2ab_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_0889_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2097_c7_e2ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2097_c7_e2ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2097_c7_e2ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_0889_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2097_c7_e2ab_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2097_c7_e2ab_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2097_c7_e2ab_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2101_c7_0889_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2097_c7_e2ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2097_c7_e2ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2097_c7_e2ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_0889_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2097_c7_e2ab_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2097_c7_e2ab_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2097_c7_e2ab_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2097_c7_e2ab_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2098_c3_4b1c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2098_c3_4b1c_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2098_c3_4b1c_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2101_c11_49e6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2101_c11_49e6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2101_c11_49e6_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2101_c7_0889_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2101_c7_0889_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2104_c7_41de_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2101_c7_0889_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_0889_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_0889_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_41de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_0889_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_0889_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2102_c3_8bd7 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_0889_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_41de_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_0889_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_0889_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_0889_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_41de_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_0889_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_0889_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_0889_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_41de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_0889_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2101_c7_0889_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2101_c7_0889_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2104_c7_41de_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2101_c7_0889_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_0889_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_0889_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2104_c7_41de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_0889_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_a7ee_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_a7ee_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_a7ee_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2104_c7_41de_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2104_c7_41de_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2109_c7_c1aa_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2104_c7_41de_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_41de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_41de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_c1aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_41de_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_41de_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2107_c3_f482 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_41de_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_c1aa_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_41de_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_41de_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_41de_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2109_c7_c1aa_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_41de_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_41de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_41de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_c1aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_41de_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2104_c7_41de_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2104_c7_41de_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2109_c7_c1aa_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2104_c7_41de_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2104_c7_41de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2104_c7_41de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_c1aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2104_c7_41de_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2109_c11_6c06_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2109_c11_6c06_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2109_c11_6c06_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2109_c7_c1aa_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2109_c7_c1aa_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2112_c7_3b2c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2109_c7_c1aa_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_c1aa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_c1aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_3b2c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_c1aa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_c1aa_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2110_c3_bb46 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_c1aa_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_3b2c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_c1aa_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2109_c7_c1aa_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2109_c7_c1aa_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_3b2c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2109_c7_c1aa_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_c1aa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_c1aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_3b2c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_c1aa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2109_c7_c1aa_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2109_c7_c1aa_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2112_c7_3b2c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2109_c7_c1aa_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_c1aa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_c1aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2112_c7_3b2c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_c1aa_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_cc20_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_cc20_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_cc20_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2112_c7_3b2c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2112_c7_3b2c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2112_c7_3b2c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_3b2c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_3b2c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2117_c7_0176_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_3b2c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_3b2c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_3b2c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2117_c7_0176_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_3b2c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_3b2c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_3b2c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_3b2c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_3b2c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_3b2c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2117_c7_0176_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_3b2c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2112_c7_3b2c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2112_c7_3b2c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2117_c7_0176_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2112_c7_3b2c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2112_c7_3b2c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2112_c7_3b2c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2117_c7_0176_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2112_c7_3b2c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2113_c3_0538_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2113_c3_0538_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2113_c3_0538_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2115_c32_e8d0_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2115_c32_e8d0_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2115_c32_e8d0_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2115_c32_2e5f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2115_c32_2e5f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2115_c32_2e5f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2115_c32_8a49_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2115_c32_8a49_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2115_c32_8a49_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2115_c32_e8d0_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2117_c11_a2b7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2117_c11_a2b7_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2117_c11_a2b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2117_c7_0176_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2117_c7_0176_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_58e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2117_c7_0176_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2117_c7_0176_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2120_c3_4cb0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2117_c7_0176_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2117_c7_0176_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2117_c7_0176_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2117_c7_0176_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_58e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2117_c7_0176_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2117_c7_0176_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2117_c7_0176_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2117_c7_0176_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2117_c7_0176_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2117_c7_0176_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2117_c7_0176_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2121_c24_af9e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2121_c24_af9e_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2121_c24_af9e_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l2121_c24_16a4_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l2121_c24_16a4_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l2121_c24_16a4_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2121_c24_af9e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2123_c11_8610_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2123_c11_8610_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2123_c11_8610_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_58e9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_58e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_58e9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_58e9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_58e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_58e9_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2101_l2097_l2123_l2094_l2089_l2112_l2086_l2109_l2081_l2104_DUPLICATE_ac49_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2101_l2097_l2094_l2089_l2112_l2086_l2109_l2081_l2104_DUPLICATE_5960_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2101_l2097_l2094_l2117_l2089_l2112_l2086_l2109_l2081_l2104_DUPLICATE_2875_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2101_l2097_l2094_l2117_l2089_l2086_l2109_l2081_l2104_DUPLICATE_717a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2101_l2097_l2123_l2094_l2117_l2089_l2112_l2086_l2109_l2104_DUPLICATE_6abd_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2090_l2105_l2113_l2098_DUPLICATE_e83d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2106_l2091_DUPLICATE_7557_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2106_l2091_DUPLICATE_7557_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2112_l2117_DUPLICATE_3b2c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l2128_l2077_DUPLICATE_06ca_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2123_c11_8610_right := to_unsigned(10, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2102_c3_8bd7 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_0889_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2102_c3_8bd7;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_a7ee_right := to_unsigned(6, 3);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2115_c32_8a49_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_cc20_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2083_c3_267f := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2081_c2_d31c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2083_c3_267f;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2081_c2_d31c_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2087_c3_ed9a := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2086_c7_91c6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2087_c3_ed9a;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2117_c7_0176_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2101_c11_49e6_right := to_unsigned(5, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2117_c7_0176_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2115_c32_e8d0_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2094_c11_35f0_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2110_c3_bb46 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_c1aa_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2110_c3_bb46;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2086_c11_b070_right := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2115_c32_2e5f_right := to_unsigned(128, 8);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2112_c7_3b2c_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l2121_c24_af9e_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2117_c11_a2b7_right := to_unsigned(9, 4);
     VAR_MUX_uxn_opcodes_h_l2115_c32_e8d0_iffalse := resize(to_signed(-3, 3), 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2081_c1_f8b0_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2095_c3_35c0 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2094_c7_7816_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2095_c3_35c0;
     VAR_MUX_uxn_opcodes_h_l2121_c24_af9e_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_58e9_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_58e9_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2099_c3_43d3 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2097_c7_e2ab_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2099_c3_43d3;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2120_c3_4cb0 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2117_c7_0176_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2120_c3_4cb0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2097_c11_5e9c_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2107_c3_f482 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_41de_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2107_c3_f482;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2109_c11_6c06_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2081_c6_8078_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2089_c11_6cc5_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2092_c3_3be8 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2089_c7_c1c3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2092_c3_3be8;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2081_c1_f8b0_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2115_c32_2e5f_left := VAR_ins;
     VAR_BIN_OP_LT_uxn_opcodes_h_l2121_c24_16a4_left := n16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2113_c3_0538_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2081_c2_d31c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2086_c7_91c6_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2089_c7_c1c3_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2094_c7_7816_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2097_c7_e2ab_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2101_c7_0889_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2109_c7_c1aa_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2112_c7_3b2c_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2081_c6_8078_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2086_c11_b070_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2089_c11_6cc5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2094_c11_35f0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2097_c11_5e9c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2101_c11_49e6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_a7ee_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2109_c11_6c06_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_cc20_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2117_c11_a2b7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2123_c11_8610_left := VAR_phase;
     VAR_BIN_OP_LT_uxn_opcodes_h_l2121_c24_16a4_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2098_c3_4b1c_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2081_c2_d31c_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2086_c7_91c6_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2094_c7_7816_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2097_c7_e2ab_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2104_c11_a7ee] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2104_c11_a7ee_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_a7ee_left;
     BIN_OP_EQ_uxn_opcodes_h_l2104_c11_a7ee_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_a7ee_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_a7ee_return_output := BIN_OP_EQ_uxn_opcodes_h_l2104_c11_a7ee_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2101_c11_49e6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2101_c11_49e6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2101_c11_49e6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2101_c11_49e6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2101_c11_49e6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2101_c11_49e6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2101_c11_49e6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2109_c11_6c06] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2109_c11_6c06_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2109_c11_6c06_left;
     BIN_OP_EQ_uxn_opcodes_h_l2109_c11_6c06_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2109_c11_6c06_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2109_c11_6c06_return_output := BIN_OP_EQ_uxn_opcodes_h_l2109_c11_6c06_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2097_c11_5e9c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2097_c11_5e9c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2097_c11_5e9c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2097_c11_5e9c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2097_c11_5e9c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2097_c11_5e9c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2097_c11_5e9c_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2090_l2105_l2113_l2098_DUPLICATE_e83d LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2090_l2105_l2113_l2098_DUPLICATE_e83d_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2112_c11_cc20] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2112_c11_cc20_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_cc20_left;
     BIN_OP_EQ_uxn_opcodes_h_l2112_c11_cc20_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_cc20_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_cc20_return_output := BIN_OP_EQ_uxn_opcodes_h_l2112_c11_cc20_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2086_c11_b070] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2086_c11_b070_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2086_c11_b070_left;
     BIN_OP_EQ_uxn_opcodes_h_l2086_c11_b070_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2086_c11_b070_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2086_c11_b070_return_output := BIN_OP_EQ_uxn_opcodes_h_l2086_c11_b070_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2115_c32_2e5f] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2115_c32_2e5f_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2115_c32_2e5f_left;
     BIN_OP_AND_uxn_opcodes_h_l2115_c32_2e5f_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2115_c32_2e5f_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2115_c32_2e5f_return_output := BIN_OP_AND_uxn_opcodes_h_l2115_c32_2e5f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2094_c11_35f0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2094_c11_35f0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2094_c11_35f0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2094_c11_35f0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2094_c11_35f0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2094_c11_35f0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2094_c11_35f0_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2101_l2097_l2094_l2089_l2112_l2086_l2109_l2081_l2104_DUPLICATE_5960 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2101_l2097_l2094_l2089_l2112_l2086_l2109_l2081_l2104_DUPLICATE_5960_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2123_c11_8610] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2123_c11_8610_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2123_c11_8610_left;
     BIN_OP_EQ_uxn_opcodes_h_l2123_c11_8610_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2123_c11_8610_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2123_c11_8610_return_output := BIN_OP_EQ_uxn_opcodes_h_l2123_c11_8610_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2101_l2097_l2094_l2117_l2089_l2086_l2109_l2081_l2104_DUPLICATE_717a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2101_l2097_l2094_l2117_l2089_l2086_l2109_l2081_l2104_DUPLICATE_717a_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2117_c11_a2b7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2117_c11_a2b7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2117_c11_a2b7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2117_c11_a2b7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2117_c11_a2b7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2117_c11_a2b7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2117_c11_a2b7_return_output;

     -- BIN_OP_LT[uxn_opcodes_h_l2121_c24_16a4] LATENCY=0
     -- Inputs
     BIN_OP_LT_uxn_opcodes_h_l2121_c24_16a4_left <= VAR_BIN_OP_LT_uxn_opcodes_h_l2121_c24_16a4_left;
     BIN_OP_LT_uxn_opcodes_h_l2121_c24_16a4_right <= VAR_BIN_OP_LT_uxn_opcodes_h_l2121_c24_16a4_right;
     -- Outputs
     VAR_BIN_OP_LT_uxn_opcodes_h_l2121_c24_16a4_return_output := BIN_OP_LT_uxn_opcodes_h_l2121_c24_16a4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2081_c6_8078] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2081_c6_8078_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2081_c6_8078_left;
     BIN_OP_EQ_uxn_opcodes_h_l2081_c6_8078_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2081_c6_8078_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2081_c6_8078_return_output := BIN_OP_EQ_uxn_opcodes_h_l2081_c6_8078_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2112_l2117_DUPLICATE_3b2c LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2112_l2117_DUPLICATE_3b2c_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2101_l2097_l2123_l2094_l2089_l2112_l2086_l2109_l2081_l2104_DUPLICATE_ac49 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2101_l2097_l2123_l2094_l2089_l2112_l2086_l2109_l2081_l2104_DUPLICATE_ac49_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2089_c11_6cc5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2089_c11_6cc5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2089_c11_6cc5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2089_c11_6cc5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2089_c11_6cc5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2089_c11_6cc5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2089_c11_6cc5_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2101_l2097_l2094_l2117_l2089_l2112_l2086_l2109_l2081_l2104_DUPLICATE_2875 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2101_l2097_l2094_l2117_l2089_l2112_l2086_l2109_l2081_l2104_DUPLICATE_2875_return_output := result.stack_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2101_l2097_l2123_l2094_l2117_l2089_l2112_l2086_l2109_l2104_DUPLICATE_6abd LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2101_l2097_l2123_l2094_l2117_l2089_l2112_l2086_l2109_l2104_DUPLICATE_6abd_return_output := result.is_opc_done;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2115_c32_8a49_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2115_c32_2e5f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2081_c1_f8b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2081_c6_8078_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2081_c2_d31c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2081_c6_8078_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2081_c2_d31c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2081_c6_8078_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2081_c2_d31c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2081_c6_8078_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2081_c2_d31c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2081_c6_8078_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2081_c2_d31c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2081_c6_8078_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2081_c2_d31c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2081_c6_8078_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2081_c2_d31c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2081_c6_8078_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2081_c2_d31c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2081_c6_8078_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2086_c7_91c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2086_c11_b070_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2086_c7_91c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2086_c11_b070_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2086_c7_91c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2086_c11_b070_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2086_c7_91c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2086_c11_b070_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2086_c7_91c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2086_c11_b070_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2086_c7_91c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2086_c11_b070_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2086_c7_91c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2086_c11_b070_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2086_c7_91c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2086_c11_b070_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2089_c7_c1c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2089_c11_6cc5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2089_c7_c1c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2089_c11_6cc5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2089_c7_c1c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2089_c11_6cc5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2089_c7_c1c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2089_c11_6cc5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2089_c7_c1c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2089_c11_6cc5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2089_c7_c1c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2089_c11_6cc5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2089_c7_c1c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2089_c11_6cc5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2089_c7_c1c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2089_c11_6cc5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2094_c7_7816_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2094_c11_35f0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2094_c7_7816_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2094_c11_35f0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2094_c7_7816_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2094_c11_35f0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2094_c7_7816_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2094_c11_35f0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2094_c7_7816_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2094_c11_35f0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2094_c7_7816_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2094_c11_35f0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2094_c7_7816_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2094_c11_35f0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2094_c7_7816_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2094_c11_35f0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2097_c7_e2ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2097_c11_5e9c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2097_c7_e2ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2097_c11_5e9c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2097_c7_e2ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2097_c11_5e9c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2097_c7_e2ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2097_c11_5e9c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2097_c7_e2ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2097_c11_5e9c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2097_c7_e2ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2097_c11_5e9c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2097_c7_e2ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2097_c11_5e9c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2097_c7_e2ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2097_c11_5e9c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2101_c7_0889_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2101_c11_49e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_0889_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2101_c11_49e6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_0889_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2101_c11_49e6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_0889_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2101_c11_49e6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_0889_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2101_c11_49e6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_0889_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2101_c11_49e6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2101_c7_0889_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2101_c11_49e6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2104_c7_41de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_a7ee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_41de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_a7ee_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2104_c7_41de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_a7ee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_41de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_a7ee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_41de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_a7ee_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_41de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_a7ee_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2104_c7_41de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2104_c11_a7ee_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2109_c7_c1aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2109_c11_6c06_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_c1aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2109_c11_6c06_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_c1aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2109_c11_6c06_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_c1aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2109_c11_6c06_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2109_c7_c1aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2109_c11_6c06_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_c1aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2109_c11_6c06_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2109_c7_c1aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2109_c11_6c06_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2112_c7_3b2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_cc20_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_3b2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_cc20_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2112_c7_3b2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_cc20_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_3b2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_cc20_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_3b2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_cc20_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_3b2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_cc20_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2112_c7_3b2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2112_c11_cc20_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2117_c7_0176_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2117_c11_a2b7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2117_c7_0176_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2117_c11_a2b7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2117_c7_0176_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2117_c11_a2b7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2117_c7_0176_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2117_c11_a2b7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2117_c7_0176_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2117_c11_a2b7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_58e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2123_c11_8610_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_58e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2123_c11_8610_return_output;
     VAR_MUX_uxn_opcodes_h_l2121_c24_af9e_cond := VAR_BIN_OP_LT_uxn_opcodes_h_l2121_c24_16a4_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2098_c3_4b1c_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2090_l2105_l2113_l2098_DUPLICATE_e83d_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2113_c3_0538_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2090_l2105_l2113_l2098_DUPLICATE_e83d_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2106_l2091_DUPLICATE_7557_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2090_l2105_l2113_l2098_DUPLICATE_e83d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2081_c2_d31c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2101_l2097_l2094_l2089_l2112_l2086_l2109_l2081_l2104_DUPLICATE_5960_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2086_c7_91c6_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2101_l2097_l2094_l2089_l2112_l2086_l2109_l2081_l2104_DUPLICATE_5960_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2089_c7_c1c3_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2101_l2097_l2094_l2089_l2112_l2086_l2109_l2081_l2104_DUPLICATE_5960_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2094_c7_7816_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2101_l2097_l2094_l2089_l2112_l2086_l2109_l2081_l2104_DUPLICATE_5960_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2097_c7_e2ab_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2101_l2097_l2094_l2089_l2112_l2086_l2109_l2081_l2104_DUPLICATE_5960_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_0889_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2101_l2097_l2094_l2089_l2112_l2086_l2109_l2081_l2104_DUPLICATE_5960_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_41de_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2101_l2097_l2094_l2089_l2112_l2086_l2109_l2081_l2104_DUPLICATE_5960_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2109_c7_c1aa_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2101_l2097_l2094_l2089_l2112_l2086_l2109_l2081_l2104_DUPLICATE_5960_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_3b2c_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2101_l2097_l2094_l2089_l2112_l2086_l2109_l2081_l2104_DUPLICATE_5960_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2086_c7_91c6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2101_l2097_l2123_l2094_l2117_l2089_l2112_l2086_l2109_l2104_DUPLICATE_6abd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2089_c7_c1c3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2101_l2097_l2123_l2094_l2117_l2089_l2112_l2086_l2109_l2104_DUPLICATE_6abd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2094_c7_7816_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2101_l2097_l2123_l2094_l2117_l2089_l2112_l2086_l2109_l2104_DUPLICATE_6abd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2097_c7_e2ab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2101_l2097_l2123_l2094_l2117_l2089_l2112_l2086_l2109_l2104_DUPLICATE_6abd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_0889_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2101_l2097_l2123_l2094_l2117_l2089_l2112_l2086_l2109_l2104_DUPLICATE_6abd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_41de_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2101_l2097_l2123_l2094_l2117_l2089_l2112_l2086_l2109_l2104_DUPLICATE_6abd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_c1aa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2101_l2097_l2123_l2094_l2117_l2089_l2112_l2086_l2109_l2104_DUPLICATE_6abd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_3b2c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2101_l2097_l2123_l2094_l2117_l2089_l2112_l2086_l2109_l2104_DUPLICATE_6abd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2117_c7_0176_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2101_l2097_l2123_l2094_l2117_l2089_l2112_l2086_l2109_l2104_DUPLICATE_6abd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_58e9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2101_l2097_l2123_l2094_l2117_l2089_l2112_l2086_l2109_l2104_DUPLICATE_6abd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2081_c2_d31c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2101_l2097_l2094_l2117_l2089_l2086_l2109_l2081_l2104_DUPLICATE_717a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2086_c7_91c6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2101_l2097_l2094_l2117_l2089_l2086_l2109_l2081_l2104_DUPLICATE_717a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2089_c7_c1c3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2101_l2097_l2094_l2117_l2089_l2086_l2109_l2081_l2104_DUPLICATE_717a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2094_c7_7816_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2101_l2097_l2094_l2117_l2089_l2086_l2109_l2081_l2104_DUPLICATE_717a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2097_c7_e2ab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2101_l2097_l2094_l2117_l2089_l2086_l2109_l2081_l2104_DUPLICATE_717a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_0889_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2101_l2097_l2094_l2117_l2089_l2086_l2109_l2081_l2104_DUPLICATE_717a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2104_c7_41de_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2101_l2097_l2094_l2117_l2089_l2086_l2109_l2081_l2104_DUPLICATE_717a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_c1aa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2101_l2097_l2094_l2117_l2089_l2086_l2109_l2081_l2104_DUPLICATE_717a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2117_c7_0176_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2101_l2097_l2094_l2117_l2089_l2086_l2109_l2081_l2104_DUPLICATE_717a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2081_c2_d31c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2101_l2097_l2123_l2094_l2089_l2112_l2086_l2109_l2081_l2104_DUPLICATE_ac49_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2086_c7_91c6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2101_l2097_l2123_l2094_l2089_l2112_l2086_l2109_l2081_l2104_DUPLICATE_ac49_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2089_c7_c1c3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2101_l2097_l2123_l2094_l2089_l2112_l2086_l2109_l2081_l2104_DUPLICATE_ac49_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2094_c7_7816_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2101_l2097_l2123_l2094_l2089_l2112_l2086_l2109_l2081_l2104_DUPLICATE_ac49_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2097_c7_e2ab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2101_l2097_l2123_l2094_l2089_l2112_l2086_l2109_l2081_l2104_DUPLICATE_ac49_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_0889_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2101_l2097_l2123_l2094_l2089_l2112_l2086_l2109_l2081_l2104_DUPLICATE_ac49_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_41de_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2101_l2097_l2123_l2094_l2089_l2112_l2086_l2109_l2081_l2104_DUPLICATE_ac49_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_c1aa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2101_l2097_l2123_l2094_l2089_l2112_l2086_l2109_l2081_l2104_DUPLICATE_ac49_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_3b2c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2101_l2097_l2123_l2094_l2089_l2112_l2086_l2109_l2081_l2104_DUPLICATE_ac49_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_58e9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2101_l2097_l2123_l2094_l2089_l2112_l2086_l2109_l2081_l2104_DUPLICATE_ac49_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_3b2c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2112_l2117_DUPLICATE_3b2c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2117_c7_0176_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2112_l2117_DUPLICATE_3b2c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2081_c2_d31c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2101_l2097_l2094_l2117_l2089_l2112_l2086_l2109_l2081_l2104_DUPLICATE_2875_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2086_c7_91c6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2101_l2097_l2094_l2117_l2089_l2112_l2086_l2109_l2081_l2104_DUPLICATE_2875_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2089_c7_c1c3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2101_l2097_l2094_l2117_l2089_l2112_l2086_l2109_l2081_l2104_DUPLICATE_2875_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2094_c7_7816_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2101_l2097_l2094_l2117_l2089_l2112_l2086_l2109_l2081_l2104_DUPLICATE_2875_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2097_c7_e2ab_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2101_l2097_l2094_l2117_l2089_l2112_l2086_l2109_l2081_l2104_DUPLICATE_2875_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2101_c7_0889_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2101_l2097_l2094_l2117_l2089_l2112_l2086_l2109_l2081_l2104_DUPLICATE_2875_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2104_c7_41de_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2101_l2097_l2094_l2117_l2089_l2112_l2086_l2109_l2081_l2104_DUPLICATE_2875_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2109_c7_c1aa_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2101_l2097_l2094_l2117_l2089_l2112_l2086_l2109_l2081_l2104_DUPLICATE_2875_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2112_c7_3b2c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2101_l2097_l2094_l2117_l2089_l2112_l2086_l2109_l2081_l2104_DUPLICATE_2875_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2117_c7_0176_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2101_l2097_l2094_l2117_l2089_l2112_l2086_l2109_l2081_l2104_DUPLICATE_2875_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2123_c7_58e9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_58e9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_58e9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_58e9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_58e9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_58e9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_58e9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_58e9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_58e9_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2106_l2091_DUPLICATE_7557 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2106_l2091_DUPLICATE_7557_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2106_l2091_DUPLICATE_7557_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2106_l2091_DUPLICATE_7557_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2106_l2091_DUPLICATE_7557_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2115_c32_8a49] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2115_c32_8a49_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2115_c32_8a49_left;
     BIN_OP_GT_uxn_opcodes_h_l2115_c32_8a49_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2115_c32_8a49_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2115_c32_8a49_return_output := BIN_OP_GT_uxn_opcodes_h_l2115_c32_8a49_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2081_c1_f8b0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2081_c1_f8b0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2081_c1_f8b0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2081_c1_f8b0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2081_c1_f8b0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2081_c1_f8b0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2081_c1_f8b0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2081_c1_f8b0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2081_c1_f8b0_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2098_c3_4b1c] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2098_c3_4b1c_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2098_c3_4b1c_left;
     BIN_OP_OR_uxn_opcodes_h_l2098_c3_4b1c_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2098_c3_4b1c_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2098_c3_4b1c_return_output := BIN_OP_OR_uxn_opcodes_h_l2098_c3_4b1c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2117_c7_0176] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2117_c7_0176_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2117_c7_0176_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2117_c7_0176_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2117_c7_0176_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2117_c7_0176_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2117_c7_0176_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2117_c7_0176_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2117_c7_0176_return_output;

     -- MUX[uxn_opcodes_h_l2121_c24_af9e] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2121_c24_af9e_cond <= VAR_MUX_uxn_opcodes_h_l2121_c24_af9e_cond;
     MUX_uxn_opcodes_h_l2121_c24_af9e_iftrue <= VAR_MUX_uxn_opcodes_h_l2121_c24_af9e_iftrue;
     MUX_uxn_opcodes_h_l2121_c24_af9e_iffalse <= VAR_MUX_uxn_opcodes_h_l2121_c24_af9e_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2121_c24_af9e_return_output := MUX_uxn_opcodes_h_l2121_c24_af9e_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2113_c3_0538] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2113_c3_0538_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2113_c3_0538_left;
     BIN_OP_OR_uxn_opcodes_h_l2113_c3_0538_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2113_c3_0538_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2113_c3_0538_return_output := BIN_OP_OR_uxn_opcodes_h_l2113_c3_0538_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2117_c7_0176] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2117_c7_0176_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2117_c7_0176_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2117_c7_0176_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2117_c7_0176_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2117_c7_0176_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2117_c7_0176_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2117_c7_0176_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2117_c7_0176_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2123_c7_58e9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_58e9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_58e9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_58e9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_58e9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_58e9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_58e9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_58e9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_58e9_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2115_c32_e8d0_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2115_c32_8a49_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2097_c7_e2ab_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2098_c3_4b1c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2112_c7_3b2c_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2113_c3_0538_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2104_c7_41de_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2106_l2091_DUPLICATE_7557_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2089_c7_c1c3_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2106_l2091_DUPLICATE_7557_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2117_c7_0176_iftrue := VAR_MUX_uxn_opcodes_h_l2121_c24_af9e_return_output;
     VAR_printf_uxn_opcodes_h_l2082_c3_1b2f_uxn_opcodes_h_l2082_c3_1b2f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2081_c1_f8b0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2117_c7_0176_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_58e9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2112_c7_3b2c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2117_c7_0176_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2117_c7_0176_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_58e9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_3b2c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2117_c7_0176_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2117_c7_0176] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2117_c7_0176_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2117_c7_0176_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2117_c7_0176_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2117_c7_0176_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2117_c7_0176_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2117_c7_0176_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2117_c7_0176_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2117_c7_0176_return_output;

     -- MUX[uxn_opcodes_h_l2115_c32_e8d0] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2115_c32_e8d0_cond <= VAR_MUX_uxn_opcodes_h_l2115_c32_e8d0_cond;
     MUX_uxn_opcodes_h_l2115_c32_e8d0_iftrue <= VAR_MUX_uxn_opcodes_h_l2115_c32_e8d0_iftrue;
     MUX_uxn_opcodes_h_l2115_c32_e8d0_iffalse <= VAR_MUX_uxn_opcodes_h_l2115_c32_e8d0_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2115_c32_e8d0_return_output := MUX_uxn_opcodes_h_l2115_c32_e8d0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2112_c7_3b2c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2112_c7_3b2c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2112_c7_3b2c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2112_c7_3b2c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2112_c7_3b2c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2112_c7_3b2c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2112_c7_3b2c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2112_c7_3b2c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2112_c7_3b2c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2117_c7_0176] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2117_c7_0176_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2117_c7_0176_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2117_c7_0176_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2117_c7_0176_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2117_c7_0176_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2117_c7_0176_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2117_c7_0176_return_output := result_stack_value_MUX_uxn_opcodes_h_l2117_c7_0176_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2112_c7_3b2c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_3b2c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_3b2c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_3b2c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_3b2c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_3b2c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_3b2c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_3b2c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_3b2c_return_output;

     -- n16_MUX[uxn_opcodes_h_l2112_c7_3b2c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2112_c7_3b2c_cond <= VAR_n16_MUX_uxn_opcodes_h_l2112_c7_3b2c_cond;
     n16_MUX_uxn_opcodes_h_l2112_c7_3b2c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2112_c7_3b2c_iftrue;
     n16_MUX_uxn_opcodes_h_l2112_c7_3b2c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2112_c7_3b2c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2112_c7_3b2c_return_output := n16_MUX_uxn_opcodes_h_l2112_c7_3b2c_return_output;

     -- printf_uxn_opcodes_h_l2082_c3_1b2f[uxn_opcodes_h_l2082_c3_1b2f] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2082_c3_1b2f_uxn_opcodes_h_l2082_c3_1b2f_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2082_c3_1b2f_uxn_opcodes_h_l2082_c3_1b2f_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- t16_MUX[uxn_opcodes_h_l2097_c7_e2ab] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2097_c7_e2ab_cond <= VAR_t16_MUX_uxn_opcodes_h_l2097_c7_e2ab_cond;
     t16_MUX_uxn_opcodes_h_l2097_c7_e2ab_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2097_c7_e2ab_iftrue;
     t16_MUX_uxn_opcodes_h_l2097_c7_e2ab_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2097_c7_e2ab_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2097_c7_e2ab_return_output := t16_MUX_uxn_opcodes_h_l2097_c7_e2ab_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2117_c7_0176] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2117_c7_0176_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2117_c7_0176_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2117_c7_0176_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2117_c7_0176_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2117_c7_0176_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2117_c7_0176_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2117_c7_0176_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2117_c7_0176_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_3b2c_iftrue := VAR_MUX_uxn_opcodes_h_l2115_c32_e8d0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2109_c7_c1aa_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2112_c7_3b2c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_3b2c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2117_c7_0176_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_c1aa_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2112_c7_3b2c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_3b2c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2117_c7_0176_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_c1aa_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2112_c7_3b2c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2112_c7_3b2c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2117_c7_0176_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2094_c7_7816_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2097_c7_e2ab_return_output;
     -- t16_MUX[uxn_opcodes_h_l2094_c7_7816] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2094_c7_7816_cond <= VAR_t16_MUX_uxn_opcodes_h_l2094_c7_7816_cond;
     t16_MUX_uxn_opcodes_h_l2094_c7_7816_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2094_c7_7816_iftrue;
     t16_MUX_uxn_opcodes_h_l2094_c7_7816_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2094_c7_7816_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2094_c7_7816_return_output := t16_MUX_uxn_opcodes_h_l2094_c7_7816_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2112_c7_3b2c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2112_c7_3b2c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2112_c7_3b2c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2112_c7_3b2c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2112_c7_3b2c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2112_c7_3b2c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2112_c7_3b2c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2112_c7_3b2c_return_output := result_stack_value_MUX_uxn_opcodes_h_l2112_c7_3b2c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2112_c7_3b2c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_3b2c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_3b2c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_3b2c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_3b2c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_3b2c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_3b2c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_3b2c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_3b2c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2112_c7_3b2c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_3b2c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_3b2c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_3b2c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_3b2c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_3b2c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_3b2c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_3b2c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_3b2c_return_output;

     -- n16_MUX[uxn_opcodes_h_l2109_c7_c1aa] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2109_c7_c1aa_cond <= VAR_n16_MUX_uxn_opcodes_h_l2109_c7_c1aa_cond;
     n16_MUX_uxn_opcodes_h_l2109_c7_c1aa_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2109_c7_c1aa_iftrue;
     n16_MUX_uxn_opcodes_h_l2109_c7_c1aa_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2109_c7_c1aa_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2109_c7_c1aa_return_output := n16_MUX_uxn_opcodes_h_l2109_c7_c1aa_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2112_c7_3b2c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_3b2c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_3b2c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_3b2c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_3b2c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_3b2c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_3b2c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_3b2c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_3b2c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2109_c7_c1aa] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_c1aa_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_c1aa_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_c1aa_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_c1aa_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_c1aa_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_c1aa_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_c1aa_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_c1aa_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2109_c7_c1aa] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_c1aa_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_c1aa_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_c1aa_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_c1aa_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_c1aa_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_c1aa_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_c1aa_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_c1aa_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l2104_c7_41de_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2109_c7_c1aa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_c1aa_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2112_c7_3b2c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2104_c7_41de_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_c1aa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_c1aa_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2112_c7_3b2c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2109_c7_c1aa_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2112_c7_3b2c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_41de_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_c1aa_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2109_c7_c1aa_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2112_c7_3b2c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2089_c7_c1c3_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2094_c7_7816_return_output;
     -- t16_MUX[uxn_opcodes_h_l2089_c7_c1c3] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2089_c7_c1c3_cond <= VAR_t16_MUX_uxn_opcodes_h_l2089_c7_c1c3_cond;
     t16_MUX_uxn_opcodes_h_l2089_c7_c1c3_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2089_c7_c1c3_iftrue;
     t16_MUX_uxn_opcodes_h_l2089_c7_c1c3_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2089_c7_c1c3_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2089_c7_c1c3_return_output := t16_MUX_uxn_opcodes_h_l2089_c7_c1c3_return_output;

     -- n16_MUX[uxn_opcodes_h_l2104_c7_41de] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2104_c7_41de_cond <= VAR_n16_MUX_uxn_opcodes_h_l2104_c7_41de_cond;
     n16_MUX_uxn_opcodes_h_l2104_c7_41de_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2104_c7_41de_iftrue;
     n16_MUX_uxn_opcodes_h_l2104_c7_41de_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2104_c7_41de_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2104_c7_41de_return_output := n16_MUX_uxn_opcodes_h_l2104_c7_41de_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2109_c7_c1aa] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_c1aa_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_c1aa_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_c1aa_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_c1aa_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_c1aa_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_c1aa_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_c1aa_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_c1aa_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2104_c7_41de] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2104_c7_41de_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2104_c7_41de_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2104_c7_41de_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2104_c7_41de_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2104_c7_41de_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2104_c7_41de_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2104_c7_41de_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2104_c7_41de_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2104_c7_41de] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_41de_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_41de_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_41de_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_41de_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_41de_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_41de_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_41de_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_41de_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2109_c7_c1aa] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2109_c7_c1aa_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2109_c7_c1aa_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2109_c7_c1aa_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2109_c7_c1aa_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2109_c7_c1aa_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2109_c7_c1aa_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2109_c7_c1aa_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2109_c7_c1aa_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2109_c7_c1aa] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2109_c7_c1aa_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2109_c7_c1aa_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2109_c7_c1aa_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2109_c7_c1aa_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2109_c7_c1aa_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2109_c7_c1aa_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2109_c7_c1aa_return_output := result_stack_value_MUX_uxn_opcodes_h_l2109_c7_c1aa_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2109_c7_c1aa] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_c1aa_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_c1aa_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_c1aa_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_c1aa_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_c1aa_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_c1aa_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_c1aa_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_c1aa_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2101_c7_0889_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2104_c7_41de_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_41de_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_c1aa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_0889_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2104_c7_41de_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_41de_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_c1aa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_41de_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2109_c7_c1aa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_0889_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2104_c7_41de_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2104_c7_41de_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2109_c7_c1aa_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2086_c7_91c6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2089_c7_c1c3_return_output;
     -- n16_MUX[uxn_opcodes_h_l2101_c7_0889] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2101_c7_0889_cond <= VAR_n16_MUX_uxn_opcodes_h_l2101_c7_0889_cond;
     n16_MUX_uxn_opcodes_h_l2101_c7_0889_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2101_c7_0889_iftrue;
     n16_MUX_uxn_opcodes_h_l2101_c7_0889_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2101_c7_0889_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2101_c7_0889_return_output := n16_MUX_uxn_opcodes_h_l2101_c7_0889_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2101_c7_0889] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_0889_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_0889_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_0889_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_0889_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_0889_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_0889_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_0889_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_0889_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2104_c7_41de] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2104_c7_41de_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2104_c7_41de_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2104_c7_41de_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2104_c7_41de_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2104_c7_41de_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2104_c7_41de_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2104_c7_41de_return_output := result_stack_value_MUX_uxn_opcodes_h_l2104_c7_41de_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2104_c7_41de] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_41de_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_41de_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_41de_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_41de_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_41de_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_41de_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_41de_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_41de_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2104_c7_41de] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_41de_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_41de_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_41de_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_41de_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_41de_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_41de_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_41de_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_41de_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2101_c7_0889] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_0889_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_0889_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_0889_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_0889_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_0889_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_0889_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_0889_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_0889_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2104_c7_41de] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_41de_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_41de_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_41de_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_41de_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_41de_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_41de_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_41de_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_41de_return_output;

     -- t16_MUX[uxn_opcodes_h_l2086_c7_91c6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2086_c7_91c6_cond <= VAR_t16_MUX_uxn_opcodes_h_l2086_c7_91c6_cond;
     t16_MUX_uxn_opcodes_h_l2086_c7_91c6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2086_c7_91c6_iftrue;
     t16_MUX_uxn_opcodes_h_l2086_c7_91c6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2086_c7_91c6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2086_c7_91c6_return_output := t16_MUX_uxn_opcodes_h_l2086_c7_91c6_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2097_c7_e2ab_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2101_c7_0889_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_0889_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2104_c7_41de_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2097_c7_e2ab_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_0889_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_0889_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2104_c7_41de_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_0889_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2104_c7_41de_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2097_c7_e2ab_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_0889_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2101_c7_0889_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2104_c7_41de_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2081_c2_d31c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2086_c7_91c6_return_output;
     -- t16_MUX[uxn_opcodes_h_l2081_c2_d31c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2081_c2_d31c_cond <= VAR_t16_MUX_uxn_opcodes_h_l2081_c2_d31c_cond;
     t16_MUX_uxn_opcodes_h_l2081_c2_d31c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2081_c2_d31c_iftrue;
     t16_MUX_uxn_opcodes_h_l2081_c2_d31c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2081_c2_d31c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2081_c2_d31c_return_output := t16_MUX_uxn_opcodes_h_l2081_c2_d31c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2101_c7_0889] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_0889_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_0889_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_0889_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_0889_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_0889_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_0889_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_0889_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_0889_return_output;

     -- n16_MUX[uxn_opcodes_h_l2097_c7_e2ab] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2097_c7_e2ab_cond <= VAR_n16_MUX_uxn_opcodes_h_l2097_c7_e2ab_cond;
     n16_MUX_uxn_opcodes_h_l2097_c7_e2ab_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2097_c7_e2ab_iftrue;
     n16_MUX_uxn_opcodes_h_l2097_c7_e2ab_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2097_c7_e2ab_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2097_c7_e2ab_return_output := n16_MUX_uxn_opcodes_h_l2097_c7_e2ab_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2101_c7_0889] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2101_c7_0889_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2101_c7_0889_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2101_c7_0889_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2101_c7_0889_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2101_c7_0889_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2101_c7_0889_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2101_c7_0889_return_output := result_stack_value_MUX_uxn_opcodes_h_l2101_c7_0889_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2097_c7_e2ab] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2097_c7_e2ab_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2097_c7_e2ab_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2097_c7_e2ab_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2097_c7_e2ab_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2097_c7_e2ab_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2097_c7_e2ab_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2097_c7_e2ab_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2097_c7_e2ab_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2101_c7_0889] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_0889_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_0889_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_0889_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_0889_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_0889_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_0889_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_0889_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_0889_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2097_c7_e2ab] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2097_c7_e2ab_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2097_c7_e2ab_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2097_c7_e2ab_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2097_c7_e2ab_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2097_c7_e2ab_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2097_c7_e2ab_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2097_c7_e2ab_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2097_c7_e2ab_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2101_c7_0889] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_0889_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_0889_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_0889_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_0889_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_0889_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_0889_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_0889_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_0889_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2094_c7_7816_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2097_c7_e2ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2097_c7_e2ab_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_0889_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2094_c7_7816_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2097_c7_e2ab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2097_c7_e2ab_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_0889_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2097_c7_e2ab_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_0889_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2094_c7_7816_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2097_c7_e2ab_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2097_c7_e2ab_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2101_c7_0889_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2081_c2_d31c_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2094_c7_7816] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2094_c7_7816_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2094_c7_7816_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2094_c7_7816_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2094_c7_7816_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2094_c7_7816_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2094_c7_7816_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2094_c7_7816_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2094_c7_7816_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2097_c7_e2ab] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2097_c7_e2ab_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2097_c7_e2ab_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2097_c7_e2ab_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2097_c7_e2ab_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2097_c7_e2ab_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2097_c7_e2ab_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2097_c7_e2ab_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2097_c7_e2ab_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2094_c7_7816] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2094_c7_7816_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2094_c7_7816_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2094_c7_7816_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2094_c7_7816_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2094_c7_7816_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2094_c7_7816_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2094_c7_7816_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2094_c7_7816_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2097_c7_e2ab] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2097_c7_e2ab_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2097_c7_e2ab_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2097_c7_e2ab_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2097_c7_e2ab_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2097_c7_e2ab_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2097_c7_e2ab_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2097_c7_e2ab_return_output := result_stack_value_MUX_uxn_opcodes_h_l2097_c7_e2ab_return_output;

     -- n16_MUX[uxn_opcodes_h_l2094_c7_7816] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2094_c7_7816_cond <= VAR_n16_MUX_uxn_opcodes_h_l2094_c7_7816_cond;
     n16_MUX_uxn_opcodes_h_l2094_c7_7816_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2094_c7_7816_iftrue;
     n16_MUX_uxn_opcodes_h_l2094_c7_7816_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2094_c7_7816_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2094_c7_7816_return_output := n16_MUX_uxn_opcodes_h_l2094_c7_7816_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2097_c7_e2ab] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2097_c7_e2ab_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2097_c7_e2ab_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2097_c7_e2ab_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2097_c7_e2ab_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2097_c7_e2ab_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2097_c7_e2ab_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2097_c7_e2ab_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2097_c7_e2ab_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2097_c7_e2ab] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2097_c7_e2ab_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2097_c7_e2ab_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2097_c7_e2ab_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2097_c7_e2ab_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2097_c7_e2ab_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2097_c7_e2ab_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2097_c7_e2ab_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2097_c7_e2ab_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l2089_c7_c1c3_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2094_c7_7816_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2094_c7_7816_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2097_c7_e2ab_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2089_c7_c1c3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2094_c7_7816_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2094_c7_7816_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2097_c7_e2ab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2094_c7_7816_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2097_c7_e2ab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2089_c7_c1c3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2094_c7_7816_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2094_c7_7816_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2097_c7_e2ab_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2089_c7_c1c3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2089_c7_c1c3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2089_c7_c1c3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2089_c7_c1c3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2089_c7_c1c3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2089_c7_c1c3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2089_c7_c1c3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2089_c7_c1c3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2089_c7_c1c3_return_output;

     -- n16_MUX[uxn_opcodes_h_l2089_c7_c1c3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2089_c7_c1c3_cond <= VAR_n16_MUX_uxn_opcodes_h_l2089_c7_c1c3_cond;
     n16_MUX_uxn_opcodes_h_l2089_c7_c1c3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2089_c7_c1c3_iftrue;
     n16_MUX_uxn_opcodes_h_l2089_c7_c1c3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2089_c7_c1c3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2089_c7_c1c3_return_output := n16_MUX_uxn_opcodes_h_l2089_c7_c1c3_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2094_c7_7816] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2094_c7_7816_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2094_c7_7816_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2094_c7_7816_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2094_c7_7816_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2094_c7_7816_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2094_c7_7816_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2094_c7_7816_return_output := result_stack_value_MUX_uxn_opcodes_h_l2094_c7_7816_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2094_c7_7816] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2094_c7_7816_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2094_c7_7816_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2094_c7_7816_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2094_c7_7816_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2094_c7_7816_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2094_c7_7816_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2094_c7_7816_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2094_c7_7816_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2089_c7_c1c3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2089_c7_c1c3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2089_c7_c1c3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2089_c7_c1c3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2089_c7_c1c3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2089_c7_c1c3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2089_c7_c1c3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2089_c7_c1c3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2089_c7_c1c3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2094_c7_7816] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2094_c7_7816_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2094_c7_7816_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2094_c7_7816_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2094_c7_7816_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2094_c7_7816_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2094_c7_7816_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2094_c7_7816_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2094_c7_7816_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2094_c7_7816] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2094_c7_7816_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2094_c7_7816_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2094_c7_7816_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2094_c7_7816_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2094_c7_7816_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2094_c7_7816_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2094_c7_7816_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2094_c7_7816_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l2086_c7_91c6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2089_c7_c1c3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2089_c7_c1c3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2094_c7_7816_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2086_c7_91c6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2089_c7_c1c3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2089_c7_c1c3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2094_c7_7816_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2089_c7_c1c3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2094_c7_7816_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2086_c7_91c6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2089_c7_c1c3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2089_c7_c1c3_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2094_c7_7816_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2089_c7_c1c3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2089_c7_c1c3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2089_c7_c1c3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2089_c7_c1c3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2089_c7_c1c3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2089_c7_c1c3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2089_c7_c1c3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2089_c7_c1c3_return_output := result_stack_value_MUX_uxn_opcodes_h_l2089_c7_c1c3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2086_c7_91c6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2086_c7_91c6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2086_c7_91c6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2086_c7_91c6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2086_c7_91c6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2086_c7_91c6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2086_c7_91c6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2086_c7_91c6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2086_c7_91c6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2089_c7_c1c3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2089_c7_c1c3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2089_c7_c1c3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2089_c7_c1c3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2089_c7_c1c3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2089_c7_c1c3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2089_c7_c1c3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2089_c7_c1c3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2089_c7_c1c3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2086_c7_91c6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2086_c7_91c6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2086_c7_91c6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2086_c7_91c6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2086_c7_91c6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2086_c7_91c6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2086_c7_91c6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2086_c7_91c6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2086_c7_91c6_return_output;

     -- n16_MUX[uxn_opcodes_h_l2086_c7_91c6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2086_c7_91c6_cond <= VAR_n16_MUX_uxn_opcodes_h_l2086_c7_91c6_cond;
     n16_MUX_uxn_opcodes_h_l2086_c7_91c6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2086_c7_91c6_iftrue;
     n16_MUX_uxn_opcodes_h_l2086_c7_91c6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2086_c7_91c6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2086_c7_91c6_return_output := n16_MUX_uxn_opcodes_h_l2086_c7_91c6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2089_c7_c1c3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2089_c7_c1c3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2089_c7_c1c3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2089_c7_c1c3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2089_c7_c1c3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2089_c7_c1c3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2089_c7_c1c3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2089_c7_c1c3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2089_c7_c1c3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2089_c7_c1c3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2089_c7_c1c3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2089_c7_c1c3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2089_c7_c1c3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2089_c7_c1c3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2089_c7_c1c3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2089_c7_c1c3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2089_c7_c1c3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2089_c7_c1c3_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l2081_c2_d31c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2086_c7_91c6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2086_c7_91c6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2089_c7_c1c3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2081_c2_d31c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2086_c7_91c6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2086_c7_91c6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2089_c7_c1c3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2086_c7_91c6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2089_c7_c1c3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2081_c2_d31c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2086_c7_91c6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2086_c7_91c6_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2089_c7_c1c3_return_output;
     -- n16_MUX[uxn_opcodes_h_l2081_c2_d31c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2081_c2_d31c_cond <= VAR_n16_MUX_uxn_opcodes_h_l2081_c2_d31c_cond;
     n16_MUX_uxn_opcodes_h_l2081_c2_d31c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2081_c2_d31c_iftrue;
     n16_MUX_uxn_opcodes_h_l2081_c2_d31c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2081_c2_d31c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2081_c2_d31c_return_output := n16_MUX_uxn_opcodes_h_l2081_c2_d31c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2081_c2_d31c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2081_c2_d31c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2081_c2_d31c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2081_c2_d31c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2081_c2_d31c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2081_c2_d31c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2081_c2_d31c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2081_c2_d31c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2081_c2_d31c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2086_c7_91c6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2086_c7_91c6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2086_c7_91c6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2086_c7_91c6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2086_c7_91c6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2086_c7_91c6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2086_c7_91c6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2086_c7_91c6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2086_c7_91c6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2086_c7_91c6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2086_c7_91c6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2086_c7_91c6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2086_c7_91c6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2086_c7_91c6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2086_c7_91c6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2086_c7_91c6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2086_c7_91c6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2086_c7_91c6_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2086_c7_91c6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2086_c7_91c6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2086_c7_91c6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2086_c7_91c6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2086_c7_91c6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2086_c7_91c6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2086_c7_91c6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2086_c7_91c6_return_output := result_stack_value_MUX_uxn_opcodes_h_l2086_c7_91c6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2086_c7_91c6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2086_c7_91c6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2086_c7_91c6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2086_c7_91c6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2086_c7_91c6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2086_c7_91c6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2086_c7_91c6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2086_c7_91c6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2086_c7_91c6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2081_c2_d31c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2081_c2_d31c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2081_c2_d31c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2081_c2_d31c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2081_c2_d31c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2081_c2_d31c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2081_c2_d31c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2081_c2_d31c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2081_c2_d31c_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2081_c2_d31c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2081_c2_d31c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2086_c7_91c6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2081_c2_d31c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2086_c7_91c6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2081_c2_d31c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2086_c7_91c6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2081_c2_d31c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2086_c7_91c6_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2081_c2_d31c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2081_c2_d31c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2081_c2_d31c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2081_c2_d31c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2081_c2_d31c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2081_c2_d31c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2081_c2_d31c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2081_c2_d31c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2081_c2_d31c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2081_c2_d31c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2081_c2_d31c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2081_c2_d31c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2081_c2_d31c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2081_c2_d31c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2081_c2_d31c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2081_c2_d31c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2081_c2_d31c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2081_c2_d31c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2081_c2_d31c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2081_c2_d31c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2081_c2_d31c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2081_c2_d31c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2081_c2_d31c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2081_c2_d31c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2081_c2_d31c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2081_c2_d31c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2081_c2_d31c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2081_c2_d31c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2081_c2_d31c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2081_c2_d31c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2081_c2_d31c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2081_c2_d31c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2081_c2_d31c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2081_c2_d31c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2081_c2_d31c_return_output := result_stack_value_MUX_uxn_opcodes_h_l2081_c2_d31c_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l2128_l2077_DUPLICATE_06ca LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l2128_l2077_DUPLICATE_06ca_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_53ff(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2081_c2_d31c_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2081_c2_d31c_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2081_c2_d31c_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2081_c2_d31c_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2081_c2_d31c_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2081_c2_d31c_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l2128_l2077_DUPLICATE_06ca_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l2128_l2077_DUPLICATE_06ca_return_output;
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
