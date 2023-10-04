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
-- Submodules: 73
entity ovr_0CLK_cf70ec0f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ovr_0CLK_cf70ec0f;
architecture arch of ovr_0CLK_cf70ec0f is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l330_c6_9a6b]
signal BIN_OP_EQ_uxn_opcodes_h_l330_c6_9a6b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l330_c6_9a6b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l330_c6_9a6b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l330_c1_995e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_995e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_995e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_995e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_995e_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l330_c2_01a5]
signal t8_MUX_uxn_opcodes_h_l330_c2_01a5_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l330_c2_01a5_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l330_c2_01a5_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l330_c2_01a5_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l330_c2_01a5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_01a5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_01a5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_01a5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_01a5_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l330_c2_01a5]
signal result_stack_value_MUX_uxn_opcodes_h_l330_c2_01a5_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l330_c2_01a5_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l330_c2_01a5_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l330_c2_01a5_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l330_c2_01a5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_01a5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_01a5_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_01a5_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_01a5_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l330_c2_01a5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_01a5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_01a5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_01a5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_01a5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l330_c2_01a5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_01a5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_01a5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_01a5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_01a5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l330_c2_01a5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_01a5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_01a5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_01a5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_01a5_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l330_c2_01a5]
signal result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_01a5_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_01a5_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_01a5_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_01a5_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l330_c2_01a5]
signal n8_MUX_uxn_opcodes_h_l330_c2_01a5_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l330_c2_01a5_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l330_c2_01a5_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l330_c2_01a5_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l331_c3_0f94[uxn_opcodes_h_l331_c3_0f94]
signal printf_uxn_opcodes_h_l331_c3_0f94_uxn_opcodes_h_l331_c3_0f94_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l336_c11_9782]
signal BIN_OP_EQ_uxn_opcodes_h_l336_c11_9782_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l336_c11_9782_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l336_c11_9782_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l336_c7_3191]
signal t8_MUX_uxn_opcodes_h_l336_c7_3191_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l336_c7_3191_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l336_c7_3191_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l336_c7_3191_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l336_c7_3191]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_3191_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_3191_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_3191_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_3191_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l336_c7_3191]
signal result_stack_value_MUX_uxn_opcodes_h_l336_c7_3191_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l336_c7_3191_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l336_c7_3191_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l336_c7_3191_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l336_c7_3191]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_3191_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_3191_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_3191_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_3191_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l336_c7_3191]
signal result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_3191_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_3191_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_3191_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_3191_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l336_c7_3191]
signal result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_3191_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_3191_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_3191_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_3191_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l336_c7_3191]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_3191_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_3191_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_3191_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_3191_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l336_c7_3191]
signal result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_3191_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_3191_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_3191_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_3191_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l336_c7_3191]
signal n8_MUX_uxn_opcodes_h_l336_c7_3191_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l336_c7_3191_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l336_c7_3191_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l336_c7_3191_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l339_c11_39d6]
signal BIN_OP_EQ_uxn_opcodes_h_l339_c11_39d6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l339_c11_39d6_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l339_c11_39d6_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l339_c7_959e]
signal t8_MUX_uxn_opcodes_h_l339_c7_959e_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l339_c7_959e_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l339_c7_959e_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l339_c7_959e_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l339_c7_959e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_959e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_959e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_959e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_959e_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l339_c7_959e]
signal result_stack_value_MUX_uxn_opcodes_h_l339_c7_959e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l339_c7_959e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l339_c7_959e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l339_c7_959e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l339_c7_959e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_959e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_959e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_959e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_959e_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l339_c7_959e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_959e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_959e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_959e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_959e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l339_c7_959e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_959e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_959e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_959e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_959e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l339_c7_959e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_959e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_959e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_959e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_959e_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l339_c7_959e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_959e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_959e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_959e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_959e_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l339_c7_959e]
signal n8_MUX_uxn_opcodes_h_l339_c7_959e_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l339_c7_959e_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l339_c7_959e_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l339_c7_959e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l343_c11_5081]
signal BIN_OP_EQ_uxn_opcodes_h_l343_c11_5081_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l343_c11_5081_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l343_c11_5081_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l343_c7_7ea8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l343_c7_7ea8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l343_c7_7ea8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l343_c7_7ea8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l343_c7_7ea8_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l343_c7_7ea8]
signal result_stack_value_MUX_uxn_opcodes_h_l343_c7_7ea8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l343_c7_7ea8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l343_c7_7ea8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l343_c7_7ea8_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l343_c7_7ea8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l343_c7_7ea8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l343_c7_7ea8_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l343_c7_7ea8_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l343_c7_7ea8_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l343_c7_7ea8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_7ea8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_7ea8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_7ea8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_7ea8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l343_c7_7ea8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_7ea8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_7ea8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_7ea8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_7ea8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l343_c7_7ea8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l343_c7_7ea8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l343_c7_7ea8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l343_c7_7ea8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l343_c7_7ea8_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l343_c7_7ea8]
signal result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_7ea8_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_7ea8_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_7ea8_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_7ea8_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l343_c7_7ea8]
signal n8_MUX_uxn_opcodes_h_l343_c7_7ea8_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l343_c7_7ea8_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l343_c7_7ea8_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l343_c7_7ea8_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l346_c11_9f50]
signal BIN_OP_EQ_uxn_opcodes_h_l346_c11_9f50_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l346_c11_9f50_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l346_c11_9f50_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l346_c7_17a8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l346_c7_17a8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l346_c7_17a8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l346_c7_17a8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l346_c7_17a8_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l346_c7_17a8]
signal result_stack_value_MUX_uxn_opcodes_h_l346_c7_17a8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l346_c7_17a8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l346_c7_17a8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l346_c7_17a8_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l346_c7_17a8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c7_17a8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c7_17a8_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c7_17a8_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c7_17a8_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l346_c7_17a8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l346_c7_17a8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l346_c7_17a8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l346_c7_17a8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l346_c7_17a8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l346_c7_17a8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l346_c7_17a8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l346_c7_17a8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l346_c7_17a8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l346_c7_17a8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l346_c7_17a8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c7_17a8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c7_17a8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c7_17a8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c7_17a8_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l346_c7_17a8]
signal result_is_stack_read_MUX_uxn_opcodes_h_l346_c7_17a8_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l346_c7_17a8_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l346_c7_17a8_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l346_c7_17a8_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l346_c7_17a8]
signal n8_MUX_uxn_opcodes_h_l346_c7_17a8_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l346_c7_17a8_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l346_c7_17a8_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l346_c7_17a8_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l350_c32_fa90]
signal BIN_OP_AND_uxn_opcodes_h_l350_c32_fa90_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l350_c32_fa90_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l350_c32_fa90_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l350_c32_97e5]
signal BIN_OP_GT_uxn_opcodes_h_l350_c32_97e5_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l350_c32_97e5_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l350_c32_97e5_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l350_c32_7d91]
signal MUX_uxn_opcodes_h_l350_c32_7d91_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l350_c32_7d91_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l350_c32_7d91_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l350_c32_7d91_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l352_c11_4ff3]
signal BIN_OP_EQ_uxn_opcodes_h_l352_c11_4ff3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l352_c11_4ff3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l352_c11_4ff3_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l352_c7_8d22]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l352_c7_8d22_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l352_c7_8d22_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l352_c7_8d22_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l352_c7_8d22_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l352_c7_8d22]
signal result_stack_value_MUX_uxn_opcodes_h_l352_c7_8d22_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l352_c7_8d22_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l352_c7_8d22_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l352_c7_8d22_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l352_c7_8d22]
signal result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_8d22_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_8d22_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_8d22_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_8d22_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l352_c7_8d22]
signal result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_8d22_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_8d22_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_8d22_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_8d22_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l352_c7_8d22]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_8d22_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_8d22_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_8d22_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_8d22_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l358_c11_c4d6]
signal BIN_OP_EQ_uxn_opcodes_h_l358_c11_c4d6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l358_c11_c4d6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l358_c11_c4d6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l358_c7_92bf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_92bf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_92bf_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_92bf_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_92bf_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l358_c7_92bf]
signal result_stack_value_MUX_uxn_opcodes_h_l358_c7_92bf_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l358_c7_92bf_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l358_c7_92bf_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l358_c7_92bf_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l358_c7_92bf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_92bf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_92bf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_92bf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_92bf_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l358_c7_92bf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_92bf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_92bf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_92bf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_92bf_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l362_c11_6607]
signal BIN_OP_EQ_uxn_opcodes_h_l362_c11_6607_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l362_c11_6607_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l362_c11_6607_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l362_c7_f2a3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_f2a3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_f2a3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_f2a3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_f2a3_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l362_c7_f2a3]
signal result_stack_value_MUX_uxn_opcodes_h_l362_c7_f2a3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l362_c7_f2a3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l362_c7_f2a3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l362_c7_f2a3_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l362_c7_f2a3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_f2a3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_f2a3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_f2a3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_f2a3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l362_c7_f2a3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_f2a3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_f2a3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_f2a3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_f2a3_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l366_c11_7ad7]
signal BIN_OP_EQ_uxn_opcodes_h_l366_c11_7ad7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l366_c11_7ad7_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l366_c11_7ad7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l366_c7_2a46]
signal result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_2a46_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_2a46_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_2a46_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_2a46_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l366_c7_2a46]
signal result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_2a46_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_2a46_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_2a46_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_2a46_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_e56b( ref_toks_0 : opcode_result_t;
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
      base.stack_value := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.is_stack_read := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l330_c6_9a6b
BIN_OP_EQ_uxn_opcodes_h_l330_c6_9a6b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l330_c6_9a6b_left,
BIN_OP_EQ_uxn_opcodes_h_l330_c6_9a6b_right,
BIN_OP_EQ_uxn_opcodes_h_l330_c6_9a6b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_995e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_995e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_995e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_995e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_995e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_995e_return_output);

-- t8_MUX_uxn_opcodes_h_l330_c2_01a5
t8_MUX_uxn_opcodes_h_l330_c2_01a5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l330_c2_01a5_cond,
t8_MUX_uxn_opcodes_h_l330_c2_01a5_iftrue,
t8_MUX_uxn_opcodes_h_l330_c2_01a5_iffalse,
t8_MUX_uxn_opcodes_h_l330_c2_01a5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_01a5
result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_01a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_01a5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_01a5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_01a5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_01a5_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l330_c2_01a5
result_stack_value_MUX_uxn_opcodes_h_l330_c2_01a5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l330_c2_01a5_cond,
result_stack_value_MUX_uxn_opcodes_h_l330_c2_01a5_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l330_c2_01a5_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l330_c2_01a5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_01a5
result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_01a5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_01a5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_01a5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_01a5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_01a5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_01a5
result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_01a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_01a5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_01a5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_01a5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_01a5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_01a5
result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_01a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_01a5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_01a5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_01a5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_01a5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_01a5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_01a5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_01a5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_01a5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_01a5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_01a5_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_01a5
result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_01a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_01a5_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_01a5_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_01a5_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_01a5_return_output);

-- n8_MUX_uxn_opcodes_h_l330_c2_01a5
n8_MUX_uxn_opcodes_h_l330_c2_01a5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l330_c2_01a5_cond,
n8_MUX_uxn_opcodes_h_l330_c2_01a5_iftrue,
n8_MUX_uxn_opcodes_h_l330_c2_01a5_iffalse,
n8_MUX_uxn_opcodes_h_l330_c2_01a5_return_output);

-- printf_uxn_opcodes_h_l331_c3_0f94_uxn_opcodes_h_l331_c3_0f94
printf_uxn_opcodes_h_l331_c3_0f94_uxn_opcodes_h_l331_c3_0f94 : entity work.printf_uxn_opcodes_h_l331_c3_0f94_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l331_c3_0f94_uxn_opcodes_h_l331_c3_0f94_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l336_c11_9782
BIN_OP_EQ_uxn_opcodes_h_l336_c11_9782 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l336_c11_9782_left,
BIN_OP_EQ_uxn_opcodes_h_l336_c11_9782_right,
BIN_OP_EQ_uxn_opcodes_h_l336_c11_9782_return_output);

-- t8_MUX_uxn_opcodes_h_l336_c7_3191
t8_MUX_uxn_opcodes_h_l336_c7_3191 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l336_c7_3191_cond,
t8_MUX_uxn_opcodes_h_l336_c7_3191_iftrue,
t8_MUX_uxn_opcodes_h_l336_c7_3191_iffalse,
t8_MUX_uxn_opcodes_h_l336_c7_3191_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_3191
result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_3191 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_3191_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_3191_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_3191_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_3191_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l336_c7_3191
result_stack_value_MUX_uxn_opcodes_h_l336_c7_3191 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l336_c7_3191_cond,
result_stack_value_MUX_uxn_opcodes_h_l336_c7_3191_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l336_c7_3191_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l336_c7_3191_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_3191
result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_3191 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_3191_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_3191_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_3191_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_3191_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_3191
result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_3191 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_3191_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_3191_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_3191_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_3191_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_3191
result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_3191 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_3191_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_3191_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_3191_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_3191_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_3191
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_3191 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_3191_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_3191_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_3191_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_3191_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_3191
result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_3191 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_3191_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_3191_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_3191_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_3191_return_output);

-- n8_MUX_uxn_opcodes_h_l336_c7_3191
n8_MUX_uxn_opcodes_h_l336_c7_3191 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l336_c7_3191_cond,
n8_MUX_uxn_opcodes_h_l336_c7_3191_iftrue,
n8_MUX_uxn_opcodes_h_l336_c7_3191_iffalse,
n8_MUX_uxn_opcodes_h_l336_c7_3191_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l339_c11_39d6
BIN_OP_EQ_uxn_opcodes_h_l339_c11_39d6 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l339_c11_39d6_left,
BIN_OP_EQ_uxn_opcodes_h_l339_c11_39d6_right,
BIN_OP_EQ_uxn_opcodes_h_l339_c11_39d6_return_output);

-- t8_MUX_uxn_opcodes_h_l339_c7_959e
t8_MUX_uxn_opcodes_h_l339_c7_959e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l339_c7_959e_cond,
t8_MUX_uxn_opcodes_h_l339_c7_959e_iftrue,
t8_MUX_uxn_opcodes_h_l339_c7_959e_iffalse,
t8_MUX_uxn_opcodes_h_l339_c7_959e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_959e
result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_959e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_959e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_959e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_959e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_959e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l339_c7_959e
result_stack_value_MUX_uxn_opcodes_h_l339_c7_959e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l339_c7_959e_cond,
result_stack_value_MUX_uxn_opcodes_h_l339_c7_959e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l339_c7_959e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l339_c7_959e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_959e
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_959e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_959e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_959e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_959e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_959e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_959e
result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_959e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_959e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_959e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_959e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_959e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_959e
result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_959e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_959e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_959e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_959e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_959e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_959e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_959e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_959e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_959e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_959e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_959e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_959e
result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_959e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_959e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_959e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_959e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_959e_return_output);

-- n8_MUX_uxn_opcodes_h_l339_c7_959e
n8_MUX_uxn_opcodes_h_l339_c7_959e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l339_c7_959e_cond,
n8_MUX_uxn_opcodes_h_l339_c7_959e_iftrue,
n8_MUX_uxn_opcodes_h_l339_c7_959e_iffalse,
n8_MUX_uxn_opcodes_h_l339_c7_959e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l343_c11_5081
BIN_OP_EQ_uxn_opcodes_h_l343_c11_5081 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l343_c11_5081_left,
BIN_OP_EQ_uxn_opcodes_h_l343_c11_5081_right,
BIN_OP_EQ_uxn_opcodes_h_l343_c11_5081_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l343_c7_7ea8
result_is_sp_shift_MUX_uxn_opcodes_h_l343_c7_7ea8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l343_c7_7ea8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l343_c7_7ea8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l343_c7_7ea8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l343_c7_7ea8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l343_c7_7ea8
result_stack_value_MUX_uxn_opcodes_h_l343_c7_7ea8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l343_c7_7ea8_cond,
result_stack_value_MUX_uxn_opcodes_h_l343_c7_7ea8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l343_c7_7ea8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l343_c7_7ea8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l343_c7_7ea8
result_sp_relative_shift_MUX_uxn_opcodes_h_l343_c7_7ea8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l343_c7_7ea8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l343_c7_7ea8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l343_c7_7ea8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l343_c7_7ea8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_7ea8
result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_7ea8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_7ea8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_7ea8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_7ea8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_7ea8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_7ea8
result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_7ea8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_7ea8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_7ea8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_7ea8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_7ea8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l343_c7_7ea8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l343_c7_7ea8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l343_c7_7ea8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l343_c7_7ea8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l343_c7_7ea8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l343_c7_7ea8_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_7ea8
result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_7ea8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_7ea8_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_7ea8_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_7ea8_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_7ea8_return_output);

-- n8_MUX_uxn_opcodes_h_l343_c7_7ea8
n8_MUX_uxn_opcodes_h_l343_c7_7ea8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l343_c7_7ea8_cond,
n8_MUX_uxn_opcodes_h_l343_c7_7ea8_iftrue,
n8_MUX_uxn_opcodes_h_l343_c7_7ea8_iffalse,
n8_MUX_uxn_opcodes_h_l343_c7_7ea8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l346_c11_9f50
BIN_OP_EQ_uxn_opcodes_h_l346_c11_9f50 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l346_c11_9f50_left,
BIN_OP_EQ_uxn_opcodes_h_l346_c11_9f50_right,
BIN_OP_EQ_uxn_opcodes_h_l346_c11_9f50_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l346_c7_17a8
result_is_sp_shift_MUX_uxn_opcodes_h_l346_c7_17a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l346_c7_17a8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l346_c7_17a8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l346_c7_17a8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l346_c7_17a8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l346_c7_17a8
result_stack_value_MUX_uxn_opcodes_h_l346_c7_17a8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l346_c7_17a8_cond,
result_stack_value_MUX_uxn_opcodes_h_l346_c7_17a8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l346_c7_17a8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l346_c7_17a8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c7_17a8
result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c7_17a8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c7_17a8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c7_17a8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c7_17a8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c7_17a8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l346_c7_17a8
result_is_stack_write_MUX_uxn_opcodes_h_l346_c7_17a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l346_c7_17a8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l346_c7_17a8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l346_c7_17a8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l346_c7_17a8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l346_c7_17a8
result_is_opc_done_MUX_uxn_opcodes_h_l346_c7_17a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l346_c7_17a8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l346_c7_17a8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l346_c7_17a8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l346_c7_17a8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c7_17a8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c7_17a8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c7_17a8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c7_17a8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c7_17a8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c7_17a8_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l346_c7_17a8
result_is_stack_read_MUX_uxn_opcodes_h_l346_c7_17a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l346_c7_17a8_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l346_c7_17a8_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l346_c7_17a8_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l346_c7_17a8_return_output);

-- n8_MUX_uxn_opcodes_h_l346_c7_17a8
n8_MUX_uxn_opcodes_h_l346_c7_17a8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l346_c7_17a8_cond,
n8_MUX_uxn_opcodes_h_l346_c7_17a8_iftrue,
n8_MUX_uxn_opcodes_h_l346_c7_17a8_iffalse,
n8_MUX_uxn_opcodes_h_l346_c7_17a8_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l350_c32_fa90
BIN_OP_AND_uxn_opcodes_h_l350_c32_fa90 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l350_c32_fa90_left,
BIN_OP_AND_uxn_opcodes_h_l350_c32_fa90_right,
BIN_OP_AND_uxn_opcodes_h_l350_c32_fa90_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l350_c32_97e5
BIN_OP_GT_uxn_opcodes_h_l350_c32_97e5 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l350_c32_97e5_left,
BIN_OP_GT_uxn_opcodes_h_l350_c32_97e5_right,
BIN_OP_GT_uxn_opcodes_h_l350_c32_97e5_return_output);

-- MUX_uxn_opcodes_h_l350_c32_7d91
MUX_uxn_opcodes_h_l350_c32_7d91 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l350_c32_7d91_cond,
MUX_uxn_opcodes_h_l350_c32_7d91_iftrue,
MUX_uxn_opcodes_h_l350_c32_7d91_iffalse,
MUX_uxn_opcodes_h_l350_c32_7d91_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l352_c11_4ff3
BIN_OP_EQ_uxn_opcodes_h_l352_c11_4ff3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l352_c11_4ff3_left,
BIN_OP_EQ_uxn_opcodes_h_l352_c11_4ff3_right,
BIN_OP_EQ_uxn_opcodes_h_l352_c11_4ff3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l352_c7_8d22
result_is_sp_shift_MUX_uxn_opcodes_h_l352_c7_8d22 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l352_c7_8d22_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l352_c7_8d22_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l352_c7_8d22_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l352_c7_8d22_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l352_c7_8d22
result_stack_value_MUX_uxn_opcodes_h_l352_c7_8d22 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l352_c7_8d22_cond,
result_stack_value_MUX_uxn_opcodes_h_l352_c7_8d22_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l352_c7_8d22_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l352_c7_8d22_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_8d22
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_8d22 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_8d22_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_8d22_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_8d22_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_8d22_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_8d22
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_8d22 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_8d22_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_8d22_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_8d22_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_8d22_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_8d22
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_8d22 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_8d22_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_8d22_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_8d22_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_8d22_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l358_c11_c4d6
BIN_OP_EQ_uxn_opcodes_h_l358_c11_c4d6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l358_c11_c4d6_left,
BIN_OP_EQ_uxn_opcodes_h_l358_c11_c4d6_right,
BIN_OP_EQ_uxn_opcodes_h_l358_c11_c4d6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_92bf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_92bf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_92bf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_92bf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_92bf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_92bf_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l358_c7_92bf
result_stack_value_MUX_uxn_opcodes_h_l358_c7_92bf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l358_c7_92bf_cond,
result_stack_value_MUX_uxn_opcodes_h_l358_c7_92bf_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l358_c7_92bf_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l358_c7_92bf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_92bf
result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_92bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_92bf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_92bf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_92bf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_92bf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_92bf
result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_92bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_92bf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_92bf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_92bf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_92bf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l362_c11_6607
BIN_OP_EQ_uxn_opcodes_h_l362_c11_6607 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l362_c11_6607_left,
BIN_OP_EQ_uxn_opcodes_h_l362_c11_6607_right,
BIN_OP_EQ_uxn_opcodes_h_l362_c11_6607_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_f2a3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_f2a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_f2a3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_f2a3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_f2a3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_f2a3_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l362_c7_f2a3
result_stack_value_MUX_uxn_opcodes_h_l362_c7_f2a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l362_c7_f2a3_cond,
result_stack_value_MUX_uxn_opcodes_h_l362_c7_f2a3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l362_c7_f2a3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l362_c7_f2a3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_f2a3
result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_f2a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_f2a3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_f2a3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_f2a3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_f2a3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_f2a3
result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_f2a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_f2a3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_f2a3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_f2a3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_f2a3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l366_c11_7ad7
BIN_OP_EQ_uxn_opcodes_h_l366_c11_7ad7 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l366_c11_7ad7_left,
BIN_OP_EQ_uxn_opcodes_h_l366_c11_7ad7_right,
BIN_OP_EQ_uxn_opcodes_h_l366_c11_7ad7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_2a46
result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_2a46 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_2a46_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_2a46_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_2a46_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_2a46_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_2a46
result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_2a46 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_2a46_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_2a46_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_2a46_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_2a46_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t8,
 n8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l330_c6_9a6b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_995e_return_output,
 t8_MUX_uxn_opcodes_h_l330_c2_01a5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_01a5_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l330_c2_01a5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_01a5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_01a5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_01a5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_01a5_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_01a5_return_output,
 n8_MUX_uxn_opcodes_h_l330_c2_01a5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l336_c11_9782_return_output,
 t8_MUX_uxn_opcodes_h_l336_c7_3191_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_3191_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l336_c7_3191_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_3191_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_3191_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_3191_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_3191_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_3191_return_output,
 n8_MUX_uxn_opcodes_h_l336_c7_3191_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l339_c11_39d6_return_output,
 t8_MUX_uxn_opcodes_h_l339_c7_959e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_959e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l339_c7_959e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_959e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_959e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_959e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_959e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_959e_return_output,
 n8_MUX_uxn_opcodes_h_l339_c7_959e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l343_c11_5081_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l343_c7_7ea8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l343_c7_7ea8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l343_c7_7ea8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_7ea8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_7ea8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l343_c7_7ea8_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_7ea8_return_output,
 n8_MUX_uxn_opcodes_h_l343_c7_7ea8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l346_c11_9f50_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l346_c7_17a8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l346_c7_17a8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c7_17a8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l346_c7_17a8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l346_c7_17a8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c7_17a8_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l346_c7_17a8_return_output,
 n8_MUX_uxn_opcodes_h_l346_c7_17a8_return_output,
 BIN_OP_AND_uxn_opcodes_h_l350_c32_fa90_return_output,
 BIN_OP_GT_uxn_opcodes_h_l350_c32_97e5_return_output,
 MUX_uxn_opcodes_h_l350_c32_7d91_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l352_c11_4ff3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l352_c7_8d22_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l352_c7_8d22_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_8d22_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_8d22_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_8d22_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l358_c11_c4d6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_92bf_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l358_c7_92bf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_92bf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_92bf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l362_c11_6607_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_f2a3_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l362_c7_f2a3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_f2a3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_f2a3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l366_c11_7ad7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_2a46_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_2a46_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c6_9a6b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c6_9a6b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c6_9a6b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_995e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_995e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_995e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_995e_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l330_c2_01a5_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l330_c2_01a5_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l336_c7_3191_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l330_c2_01a5_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l330_c2_01a5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_01a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_01a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_3191_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_01a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_01a5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l330_c2_01a5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l330_c2_01a5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l336_c7_3191_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l330_c2_01a5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l330_c2_01a5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_01a5_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_01a5_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_3191_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_01a5_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_01a5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_01a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_01a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_3191_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_01a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_01a5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_01a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_01a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_3191_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_01a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_01a5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_01a5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l333_c3_9af6 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_01a5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_3191_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_01a5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_01a5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_01a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_01a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_3191_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_01a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_01a5_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l330_c2_01a5_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l330_c2_01a5_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l336_c7_3191_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l330_c2_01a5_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l330_c2_01a5_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l331_c3_0f94_uxn_opcodes_h_l331_c3_0f94_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_9782_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_9782_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_9782_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l336_c7_3191_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l336_c7_3191_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l339_c7_959e_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l336_c7_3191_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_3191_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_3191_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_959e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_3191_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l336_c7_3191_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l336_c7_3191_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l339_c7_959e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l336_c7_3191_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_3191_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_3191_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_959e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_3191_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_3191_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_3191_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_959e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_3191_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_3191_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_3191_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_959e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_3191_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_3191_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l337_c3_7fca : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_3191_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_959e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_3191_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_3191_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_3191_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_959e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_3191_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l336_c7_3191_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l336_c7_3191_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l339_c7_959e_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l336_c7_3191_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c11_39d6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c11_39d6_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c11_39d6_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l339_c7_959e_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l339_c7_959e_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l339_c7_959e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_959e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_959e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l343_c7_7ea8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_959e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l339_c7_959e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l339_c7_959e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l343_c7_7ea8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l339_c7_959e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_959e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_959e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l343_c7_7ea8_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_959e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_959e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_959e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_7ea8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_959e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_959e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_959e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_7ea8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_959e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_959e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l341_c3_be5d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_959e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l343_c7_7ea8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_959e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_959e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_959e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_7ea8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_959e_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l339_c7_959e_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l339_c7_959e_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l343_c7_7ea8_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l339_c7_959e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l343_c11_5081_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l343_c11_5081_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l343_c11_5081_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l343_c7_7ea8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l343_c7_7ea8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l346_c7_17a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l343_c7_7ea8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l343_c7_7ea8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l343_c7_7ea8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l346_c7_17a8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l343_c7_7ea8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l343_c7_7ea8_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l343_c7_7ea8_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c7_17a8_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l343_c7_7ea8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_7ea8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_7ea8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l346_c7_17a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_7ea8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_7ea8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_7ea8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l346_c7_17a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_7ea8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l343_c7_7ea8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l344_c3_608d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l343_c7_7ea8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c7_17a8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l343_c7_7ea8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_7ea8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_7ea8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l346_c7_17a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_7ea8_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l343_c7_7ea8_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l343_c7_7ea8_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l346_c7_17a8_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l343_c7_7ea8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l346_c11_9f50_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l346_c11_9f50_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l346_c11_9f50_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l346_c7_17a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l346_c7_17a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l352_c7_8d22_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l346_c7_17a8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l346_c7_17a8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l346_c7_17a8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l352_c7_8d22_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l346_c7_17a8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c7_17a8_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c7_17a8_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c7_17a8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l346_c7_17a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l346_c7_17a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_8d22_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l346_c7_17a8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l346_c7_17a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l346_c7_17a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_8d22_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l346_c7_17a8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c7_17a8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c7_17a8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_8d22_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c7_17a8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l346_c7_17a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l346_c7_17a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l346_c7_17a8_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l346_c7_17a8_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l346_c7_17a8_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l346_c7_17a8_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l350_c32_7d91_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l350_c32_7d91_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l350_c32_7d91_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l350_c32_fa90_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l350_c32_fa90_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l350_c32_fa90_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l350_c32_97e5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l350_c32_97e5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l350_c32_97e5_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l350_c32_7d91_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_4ff3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_4ff3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_4ff3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l352_c7_8d22_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l352_c7_8d22_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l352_c7_8d22_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l352_c7_8d22_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l352_c7_8d22_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l358_c7_92bf_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l352_c7_8d22_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_8d22_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_8d22_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_92bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_8d22_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_8d22_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_8d22_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_92bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_8d22_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_8d22_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l355_c3_f0ec : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_8d22_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_92bf_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_8d22_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l358_c11_c4d6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l358_c11_c4d6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l358_c11_c4d6_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_92bf_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l359_c3_5a62 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_92bf_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_f2a3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_92bf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l358_c7_92bf_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l358_c7_92bf_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l362_c7_f2a3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l358_c7_92bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_92bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_92bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_f2a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_92bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_92bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_92bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_f2a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_92bf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_6607_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_6607_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_6607_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_f2a3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l363_c3_bbbb : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_f2a3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_f2a3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l362_c7_f2a3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l362_c7_f2a3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l362_c7_f2a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_f2a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_f2a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_2a46_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_f2a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_f2a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_f2a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_2a46_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_f2a3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_7ad7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_7ad7_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_7ad7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_2a46_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_2a46_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_2a46_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_2a46_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_2a46_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_2a46_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l343_l339_l336_l330_l352_DUPLICATE_3f55_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l343_l339_l336_l362_l330_l346_DUPLICATE_6b7a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l343_l339_l336_l330_l346_DUPLICATE_ea7a_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l343_l339_l366_l336_l362_l330_l358_l346_DUPLICATE_69ff_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l343_l339_l366_l336_l362_l358_l352_l346_DUPLICATE_db6f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l343_l336_l346_l339_DUPLICATE_37ac_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l346_l362_DUPLICATE_9aec_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l371_l326_DUPLICATE_7634_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_4ff3_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l344_c3_608d := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l343_c7_7ea8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l344_c3_608d;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_01a5_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_8d22_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l333_c3_9af6 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_01a5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l333_c3_9af6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c11_39d6_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l346_c7_17a8_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l350_c32_fa90_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l358_c11_c4d6_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l337_c3_7fca := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_3191_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l337_c3_7fca;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_2a46_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_9782_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l341_c3_be5d := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_959e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l341_c3_be5d;
     VAR_MUX_uxn_opcodes_h_l350_c32_7d91_iftrue := signed(std_logic_vector(resize(to_unsigned(3, 2), 8)));
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_995e_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l355_c3_f0ec := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_8d22_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l355_c3_f0ec;
     VAR_MUX_uxn_opcodes_h_l350_c32_7d91_iffalse := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c6_9a6b_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l343_c11_5081_right := to_unsigned(3, 2);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l346_c7_17a8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l346_c11_9f50_right := to_unsigned(4, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_2a46_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_6607_right := to_unsigned(7, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_01a5_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l352_c7_8d22_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l350_c32_97e5_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l359_c3_5a62 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_92bf_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l359_c3_5a62;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_7ad7_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l363_c3_bbbb := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_f2a3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l363_c3_bbbb;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_995e_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l350_c32_fa90_left := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l330_c2_01a5_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l336_c7_3191_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l339_c7_959e_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l343_c7_7ea8_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l346_c7_17a8_iffalse := n8;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l352_c7_8d22_iftrue := n8;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l362_c7_f2a3_iftrue := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c6_9a6b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_9782_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c11_39d6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l343_c11_5081_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l346_c11_9f50_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_4ff3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l358_c11_c4d6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_6607_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_7ad7_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l346_c7_17a8_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l339_c7_959e_iftrue := VAR_previous_stack_read;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l358_c7_92bf_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l330_c2_01a5_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l336_c7_3191_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l339_c7_959e_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l358_c11_c4d6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l358_c11_c4d6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l358_c11_c4d6_left;
     BIN_OP_EQ_uxn_opcodes_h_l358_c11_c4d6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l358_c11_c4d6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l358_c11_c4d6_return_output := BIN_OP_EQ_uxn_opcodes_h_l358_c11_c4d6_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l343_l339_l336_l330_l352_DUPLICATE_3f55 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l343_l339_l336_l330_l352_DUPLICATE_3f55_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l343_l339_l336_l362_l330_l346_DUPLICATE_6b7a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l343_l339_l336_l362_l330_l346_DUPLICATE_6b7a_return_output := result.stack_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l343_l336_l346_l339_DUPLICATE_37ac LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l343_l336_l346_l339_DUPLICATE_37ac_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l339_c11_39d6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l339_c11_39d6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c11_39d6_left;
     BIN_OP_EQ_uxn_opcodes_h_l339_c11_39d6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c11_39d6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c11_39d6_return_output := BIN_OP_EQ_uxn_opcodes_h_l339_c11_39d6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l366_c11_7ad7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l366_c11_7ad7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_7ad7_left;
     BIN_OP_EQ_uxn_opcodes_h_l366_c11_7ad7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_7ad7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_7ad7_return_output := BIN_OP_EQ_uxn_opcodes_h_l366_c11_7ad7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l362_c11_6607] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l362_c11_6607_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_6607_left;
     BIN_OP_EQ_uxn_opcodes_h_l362_c11_6607_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_6607_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_6607_return_output := BIN_OP_EQ_uxn_opcodes_h_l362_c11_6607_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l343_l339_l366_l336_l362_l358_l352_l346_DUPLICATE_db6f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l343_l339_l366_l336_l362_l358_l352_l346_DUPLICATE_db6f_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l330_c6_9a6b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l330_c6_9a6b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c6_9a6b_left;
     BIN_OP_EQ_uxn_opcodes_h_l330_c6_9a6b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c6_9a6b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c6_9a6b_return_output := BIN_OP_EQ_uxn_opcodes_h_l330_c6_9a6b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l346_c11_9f50] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l346_c11_9f50_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l346_c11_9f50_left;
     BIN_OP_EQ_uxn_opcodes_h_l346_c11_9f50_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l346_c11_9f50_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l346_c11_9f50_return_output := BIN_OP_EQ_uxn_opcodes_h_l346_c11_9f50_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l346_l362_DUPLICATE_9aec LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l346_l362_DUPLICATE_9aec_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l352_c11_4ff3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l352_c11_4ff3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_4ff3_left;
     BIN_OP_EQ_uxn_opcodes_h_l352_c11_4ff3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_4ff3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_4ff3_return_output := BIN_OP_EQ_uxn_opcodes_h_l352_c11_4ff3_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l343_l339_l336_l330_l346_DUPLICATE_ea7a LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l343_l339_l336_l330_l346_DUPLICATE_ea7a_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l343_c11_5081] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l343_c11_5081_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l343_c11_5081_left;
     BIN_OP_EQ_uxn_opcodes_h_l343_c11_5081_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l343_c11_5081_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l343_c11_5081_return_output := BIN_OP_EQ_uxn_opcodes_h_l343_c11_5081_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l336_c11_9782] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l336_c11_9782_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_9782_left;
     BIN_OP_EQ_uxn_opcodes_h_l336_c11_9782_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_9782_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_9782_return_output := BIN_OP_EQ_uxn_opcodes_h_l336_c11_9782_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l343_l339_l366_l336_l362_l330_l358_l346_DUPLICATE_69ff LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l343_l339_l366_l336_l362_l330_l358_l346_DUPLICATE_69ff_return_output := result.is_stack_write;

     -- BIN_OP_AND[uxn_opcodes_h_l350_c32_fa90] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l350_c32_fa90_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l350_c32_fa90_left;
     BIN_OP_AND_uxn_opcodes_h_l350_c32_fa90_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l350_c32_fa90_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l350_c32_fa90_return_output := BIN_OP_AND_uxn_opcodes_h_l350_c32_fa90_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l350_c32_97e5_left := VAR_BIN_OP_AND_uxn_opcodes_h_l350_c32_fa90_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_995e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c6_9a6b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l330_c2_01a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c6_9a6b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_01a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c6_9a6b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_01a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c6_9a6b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_01a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c6_9a6b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_01a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c6_9a6b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_01a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c6_9a6b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_01a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c6_9a6b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l330_c2_01a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c6_9a6b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l330_c2_01a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c6_9a6b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l336_c7_3191_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_9782_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_3191_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_9782_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_3191_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_9782_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_3191_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_9782_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_3191_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_9782_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_3191_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_9782_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_3191_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_9782_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l336_c7_3191_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_9782_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l336_c7_3191_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_9782_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l339_c7_959e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c11_39d6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_959e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c11_39d6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_959e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c11_39d6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_959e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c11_39d6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_959e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c11_39d6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_959e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c11_39d6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_959e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c11_39d6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l339_c7_959e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c11_39d6_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l339_c7_959e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c11_39d6_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l343_c7_7ea8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l343_c11_5081_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_7ea8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l343_c11_5081_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l343_c7_7ea8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l343_c11_5081_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_7ea8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l343_c11_5081_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_7ea8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l343_c11_5081_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l343_c7_7ea8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l343_c11_5081_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l343_c7_7ea8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l343_c11_5081_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l343_c7_7ea8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l343_c11_5081_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l346_c7_17a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l346_c11_9f50_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l346_c7_17a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l346_c11_9f50_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l346_c7_17a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l346_c11_9f50_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l346_c7_17a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l346_c11_9f50_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l346_c7_17a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l346_c11_9f50_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c7_17a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l346_c11_9f50_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c7_17a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l346_c11_9f50_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l346_c7_17a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l346_c11_9f50_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_8d22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_4ff3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l352_c7_8d22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_4ff3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_8d22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_4ff3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_8d22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_4ff3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l352_c7_8d22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_4ff3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_92bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l358_c11_c4d6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_92bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l358_c11_c4d6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_92bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l358_c11_c4d6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l358_c7_92bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l358_c11_c4d6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_f2a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_6607_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_f2a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_6607_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_f2a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_6607_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l362_c7_f2a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_6607_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_2a46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_7ad7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_2a46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_7ad7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_01a5_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l343_l339_l336_l330_l346_DUPLICATE_ea7a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_3191_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l343_l339_l336_l330_l346_DUPLICATE_ea7a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_959e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l343_l339_l336_l330_l346_DUPLICATE_ea7a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l343_c7_7ea8_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l343_l339_l336_l330_l346_DUPLICATE_ea7a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c7_17a8_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l343_l339_l336_l330_l346_DUPLICATE_ea7a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_3191_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l343_l339_l366_l336_l362_l358_l352_l346_DUPLICATE_db6f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_959e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l343_l339_l366_l336_l362_l358_l352_l346_DUPLICATE_db6f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_7ea8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l343_l339_l366_l336_l362_l358_l352_l346_DUPLICATE_db6f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l346_c7_17a8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l343_l339_l366_l336_l362_l358_l352_l346_DUPLICATE_db6f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_8d22_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l343_l339_l366_l336_l362_l358_l352_l346_DUPLICATE_db6f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_92bf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l343_l339_l366_l336_l362_l358_l352_l346_DUPLICATE_db6f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_f2a3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l343_l339_l366_l336_l362_l358_l352_l346_DUPLICATE_db6f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_2a46_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l343_l339_l366_l336_l362_l358_l352_l346_DUPLICATE_db6f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_01a5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l343_l339_l336_l330_l352_DUPLICATE_3f55_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_3191_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l343_l339_l336_l330_l352_DUPLICATE_3f55_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_959e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l343_l339_l336_l330_l352_DUPLICATE_3f55_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l343_c7_7ea8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l343_l339_l336_l330_l352_DUPLICATE_3f55_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l352_c7_8d22_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l343_l339_l336_l330_l352_DUPLICATE_3f55_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_3191_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l343_l336_l346_l339_DUPLICATE_37ac_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_959e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l343_l336_l346_l339_DUPLICATE_37ac_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_7ea8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l343_l336_l346_l339_DUPLICATE_37ac_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l346_c7_17a8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l343_l336_l346_l339_DUPLICATE_37ac_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_01a5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l343_l339_l366_l336_l362_l330_l358_l346_DUPLICATE_69ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_3191_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l343_l339_l366_l336_l362_l330_l358_l346_DUPLICATE_69ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_959e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l343_l339_l366_l336_l362_l330_l358_l346_DUPLICATE_69ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_7ea8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l343_l339_l366_l336_l362_l330_l358_l346_DUPLICATE_69ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l346_c7_17a8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l343_l339_l366_l336_l362_l330_l358_l346_DUPLICATE_69ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_92bf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l343_l339_l366_l336_l362_l330_l358_l346_DUPLICATE_69ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_f2a3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l343_l339_l366_l336_l362_l330_l358_l346_DUPLICATE_69ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_2a46_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l343_l339_l366_l336_l362_l330_l358_l346_DUPLICATE_69ff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c7_17a8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l346_l362_DUPLICATE_9aec_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_f2a3_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l346_l362_DUPLICATE_9aec_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l330_c2_01a5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l343_l339_l336_l362_l330_l346_DUPLICATE_6b7a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l336_c7_3191_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l343_l339_l336_l362_l330_l346_DUPLICATE_6b7a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l339_c7_959e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l343_l339_l336_l362_l330_l346_DUPLICATE_6b7a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l343_c7_7ea8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l343_l339_l336_l362_l330_l346_DUPLICATE_6b7a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l346_c7_17a8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l343_l339_l336_l362_l330_l346_DUPLICATE_6b7a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l362_c7_f2a3_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l343_l339_l336_l362_l330_l346_DUPLICATE_6b7a_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l352_c7_8d22] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l352_c7_8d22_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l352_c7_8d22_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l352_c7_8d22_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l352_c7_8d22_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l352_c7_8d22_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l352_c7_8d22_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l352_c7_8d22_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l352_c7_8d22_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l366_c7_2a46] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_2a46_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_2a46_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_2a46_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_2a46_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_2a46_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_2a46_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_2a46_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_2a46_return_output;

     -- t8_MUX[uxn_opcodes_h_l339_c7_959e] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l339_c7_959e_cond <= VAR_t8_MUX_uxn_opcodes_h_l339_c7_959e_cond;
     t8_MUX_uxn_opcodes_h_l339_c7_959e_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l339_c7_959e_iftrue;
     t8_MUX_uxn_opcodes_h_l339_c7_959e_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l339_c7_959e_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l339_c7_959e_return_output := t8_MUX_uxn_opcodes_h_l339_c7_959e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l330_c1_995e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_995e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_995e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_995e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_995e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_995e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_995e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_995e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_995e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l366_c7_2a46] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_2a46_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_2a46_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_2a46_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_2a46_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_2a46_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_2a46_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_2a46_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_2a46_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l362_c7_f2a3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l362_c7_f2a3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l362_c7_f2a3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l362_c7_f2a3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l362_c7_f2a3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l362_c7_f2a3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l362_c7_f2a3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l362_c7_f2a3_return_output := result_stack_value_MUX_uxn_opcodes_h_l362_c7_f2a3_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l350_c32_97e5] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l350_c32_97e5_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l350_c32_97e5_left;
     BIN_OP_GT_uxn_opcodes_h_l350_c32_97e5_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l350_c32_97e5_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l350_c32_97e5_return_output := BIN_OP_GT_uxn_opcodes_h_l350_c32_97e5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l362_c7_f2a3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_f2a3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_f2a3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_f2a3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_f2a3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_f2a3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_f2a3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_f2a3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_f2a3_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l346_c7_17a8] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l346_c7_17a8_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l346_c7_17a8_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l346_c7_17a8_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l346_c7_17a8_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l346_c7_17a8_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l346_c7_17a8_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l346_c7_17a8_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l346_c7_17a8_return_output;

     -- n8_MUX[uxn_opcodes_h_l346_c7_17a8] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l346_c7_17a8_cond <= VAR_n8_MUX_uxn_opcodes_h_l346_c7_17a8_cond;
     n8_MUX_uxn_opcodes_h_l346_c7_17a8_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l346_c7_17a8_iftrue;
     n8_MUX_uxn_opcodes_h_l346_c7_17a8_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l346_c7_17a8_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l346_c7_17a8_return_output := n8_MUX_uxn_opcodes_h_l346_c7_17a8_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l350_c32_7d91_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l350_c32_97e5_return_output;
     VAR_printf_uxn_opcodes_h_l331_c3_0f94_uxn_opcodes_h_l331_c3_0f94_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_995e_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l343_c7_7ea8_iffalse := VAR_n8_MUX_uxn_opcodes_h_l346_c7_17a8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_f2a3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_2a46_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l346_c7_17a8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l352_c7_8d22_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_7ea8_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l346_c7_17a8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_f2a3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_2a46_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_92bf_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_f2a3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l358_c7_92bf_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l362_c7_f2a3_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l336_c7_3191_iffalse := VAR_t8_MUX_uxn_opcodes_h_l339_c7_959e_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l346_c7_17a8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l346_c7_17a8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l346_c7_17a8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l346_c7_17a8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l346_c7_17a8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l346_c7_17a8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l346_c7_17a8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l346_c7_17a8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l346_c7_17a8_return_output;

     -- n8_MUX[uxn_opcodes_h_l343_c7_7ea8] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l343_c7_7ea8_cond <= VAR_n8_MUX_uxn_opcodes_h_l343_c7_7ea8_cond;
     n8_MUX_uxn_opcodes_h_l343_c7_7ea8_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l343_c7_7ea8_iftrue;
     n8_MUX_uxn_opcodes_h_l343_c7_7ea8_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l343_c7_7ea8_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l343_c7_7ea8_return_output := n8_MUX_uxn_opcodes_h_l343_c7_7ea8_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l358_c7_92bf] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l358_c7_92bf_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l358_c7_92bf_cond;
     result_stack_value_MUX_uxn_opcodes_h_l358_c7_92bf_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l358_c7_92bf_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l358_c7_92bf_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l358_c7_92bf_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l358_c7_92bf_return_output := result_stack_value_MUX_uxn_opcodes_h_l358_c7_92bf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l362_c7_f2a3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_f2a3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_f2a3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_f2a3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_f2a3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_f2a3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_f2a3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_f2a3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_f2a3_return_output;

     -- printf_uxn_opcodes_h_l331_c3_0f94[uxn_opcodes_h_l331_c3_0f94] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l331_c3_0f94_uxn_opcodes_h_l331_c3_0f94_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l331_c3_0f94_uxn_opcodes_h_l331_c3_0f94_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- t8_MUX[uxn_opcodes_h_l336_c7_3191] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l336_c7_3191_cond <= VAR_t8_MUX_uxn_opcodes_h_l336_c7_3191_cond;
     t8_MUX_uxn_opcodes_h_l336_c7_3191_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l336_c7_3191_iftrue;
     t8_MUX_uxn_opcodes_h_l336_c7_3191_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l336_c7_3191_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l336_c7_3191_return_output := t8_MUX_uxn_opcodes_h_l336_c7_3191_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l358_c7_92bf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_92bf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_92bf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_92bf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_92bf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_92bf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_92bf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_92bf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_92bf_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l343_c7_7ea8] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_7ea8_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_7ea8_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_7ea8_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_7ea8_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_7ea8_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_7ea8_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_7ea8_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_7ea8_return_output;

     -- MUX[uxn_opcodes_h_l350_c32_7d91] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l350_c32_7d91_cond <= VAR_MUX_uxn_opcodes_h_l350_c32_7d91_cond;
     MUX_uxn_opcodes_h_l350_c32_7d91_iftrue <= VAR_MUX_uxn_opcodes_h_l350_c32_7d91_iftrue;
     MUX_uxn_opcodes_h_l350_c32_7d91_iffalse <= VAR_MUX_uxn_opcodes_h_l350_c32_7d91_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l350_c32_7d91_return_output := MUX_uxn_opcodes_h_l350_c32_7d91_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l362_c7_f2a3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_f2a3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_f2a3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_f2a3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_f2a3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_f2a3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_f2a3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_f2a3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_f2a3_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c7_17a8_iftrue := VAR_MUX_uxn_opcodes_h_l350_c32_7d91_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l339_c7_959e_iffalse := VAR_n8_MUX_uxn_opcodes_h_l343_c7_7ea8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_92bf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_f2a3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l343_c7_7ea8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l346_c7_17a8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_959e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_7ea8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_92bf_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_f2a3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_8d22_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_92bf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l352_c7_8d22_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l358_c7_92bf_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l330_c2_01a5_iffalse := VAR_t8_MUX_uxn_opcodes_h_l336_c7_3191_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l339_c7_959e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_959e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_959e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_959e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_959e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_959e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_959e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_959e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_959e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l358_c7_92bf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_92bf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_92bf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_92bf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_92bf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_92bf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_92bf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_92bf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_92bf_return_output;

     -- n8_MUX[uxn_opcodes_h_l339_c7_959e] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l339_c7_959e_cond <= VAR_n8_MUX_uxn_opcodes_h_l339_c7_959e_cond;
     n8_MUX_uxn_opcodes_h_l339_c7_959e_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l339_c7_959e_iftrue;
     n8_MUX_uxn_opcodes_h_l339_c7_959e_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l339_c7_959e_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l339_c7_959e_return_output := n8_MUX_uxn_opcodes_h_l339_c7_959e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l346_c7_17a8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c7_17a8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c7_17a8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c7_17a8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c7_17a8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c7_17a8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c7_17a8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c7_17a8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c7_17a8_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l352_c7_8d22] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l352_c7_8d22_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l352_c7_8d22_cond;
     result_stack_value_MUX_uxn_opcodes_h_l352_c7_8d22_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l352_c7_8d22_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l352_c7_8d22_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l352_c7_8d22_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l352_c7_8d22_return_output := result_stack_value_MUX_uxn_opcodes_h_l352_c7_8d22_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l352_c7_8d22] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_8d22_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_8d22_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_8d22_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_8d22_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_8d22_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_8d22_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_8d22_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_8d22_return_output;

     -- t8_MUX[uxn_opcodes_h_l330_c2_01a5] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l330_c2_01a5_cond <= VAR_t8_MUX_uxn_opcodes_h_l330_c2_01a5_cond;
     t8_MUX_uxn_opcodes_h_l330_c2_01a5_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l330_c2_01a5_iftrue;
     t8_MUX_uxn_opcodes_h_l330_c2_01a5_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l330_c2_01a5_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l330_c2_01a5_return_output := t8_MUX_uxn_opcodes_h_l330_c2_01a5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l358_c7_92bf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_92bf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_92bf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_92bf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_92bf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_92bf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_92bf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_92bf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_92bf_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l343_c7_7ea8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l343_c7_7ea8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l343_c7_7ea8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l343_c7_7ea8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l343_c7_7ea8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l343_c7_7ea8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l343_c7_7ea8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l343_c7_7ea8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l343_c7_7ea8_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l336_c7_3191_iffalse := VAR_n8_MUX_uxn_opcodes_h_l339_c7_959e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_8d22_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_92bf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_959e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l343_c7_7ea8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_3191_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_959e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_8d22_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_92bf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l343_c7_7ea8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c7_17a8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c7_17a8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_8d22_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l346_c7_17a8_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l352_c7_8d22_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l330_c2_01a5_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l352_c7_8d22] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_8d22_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_8d22_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_8d22_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_8d22_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_8d22_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_8d22_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_8d22_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_8d22_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l352_c7_8d22] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_8d22_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_8d22_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_8d22_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_8d22_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_8d22_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_8d22_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_8d22_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_8d22_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l343_c7_7ea8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l343_c7_7ea8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l343_c7_7ea8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l343_c7_7ea8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l343_c7_7ea8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l343_c7_7ea8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l343_c7_7ea8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l343_c7_7ea8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l343_c7_7ea8_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l346_c7_17a8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l346_c7_17a8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l346_c7_17a8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l346_c7_17a8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l346_c7_17a8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l346_c7_17a8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l346_c7_17a8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l346_c7_17a8_return_output := result_stack_value_MUX_uxn_opcodes_h_l346_c7_17a8_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l336_c7_3191] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_3191_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_3191_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_3191_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_3191_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_3191_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_3191_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_3191_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_3191_return_output;

     -- n8_MUX[uxn_opcodes_h_l336_c7_3191] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l336_c7_3191_cond <= VAR_n8_MUX_uxn_opcodes_h_l336_c7_3191_cond;
     n8_MUX_uxn_opcodes_h_l336_c7_3191_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l336_c7_3191_iftrue;
     n8_MUX_uxn_opcodes_h_l336_c7_3191_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l336_c7_3191_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l336_c7_3191_return_output := n8_MUX_uxn_opcodes_h_l336_c7_3191_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l346_c7_17a8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c7_17a8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c7_17a8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c7_17a8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c7_17a8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c7_17a8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c7_17a8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c7_17a8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c7_17a8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l339_c7_959e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_959e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_959e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_959e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_959e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_959e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_959e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_959e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_959e_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l330_c2_01a5_iffalse := VAR_n8_MUX_uxn_opcodes_h_l336_c7_3191_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l346_c7_17a8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_8d22_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_3191_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_959e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_01a5_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_3191_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l346_c7_17a8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_8d22_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_959e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l343_c7_7ea8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l343_c7_7ea8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c7_17a8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l343_c7_7ea8_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l346_c7_17a8_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l343_c7_7ea8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l343_c7_7ea8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l343_c7_7ea8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l343_c7_7ea8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l343_c7_7ea8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l343_c7_7ea8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l343_c7_7ea8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l343_c7_7ea8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l343_c7_7ea8_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l343_c7_7ea8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l343_c7_7ea8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l343_c7_7ea8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l343_c7_7ea8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l343_c7_7ea8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l343_c7_7ea8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l343_c7_7ea8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l343_c7_7ea8_return_output := result_stack_value_MUX_uxn_opcodes_h_l343_c7_7ea8_return_output;

     -- n8_MUX[uxn_opcodes_h_l330_c2_01a5] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l330_c2_01a5_cond <= VAR_n8_MUX_uxn_opcodes_h_l330_c2_01a5_cond;
     n8_MUX_uxn_opcodes_h_l330_c2_01a5_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l330_c2_01a5_iftrue;
     n8_MUX_uxn_opcodes_h_l330_c2_01a5_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l330_c2_01a5_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l330_c2_01a5_return_output := n8_MUX_uxn_opcodes_h_l330_c2_01a5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l339_c7_959e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_959e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_959e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_959e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_959e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_959e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_959e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_959e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_959e_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l330_c2_01a5] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_01a5_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_01a5_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_01a5_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_01a5_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_01a5_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_01a5_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_01a5_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_01a5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l346_c7_17a8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l346_c7_17a8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l346_c7_17a8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l346_c7_17a8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l346_c7_17a8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l346_c7_17a8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l346_c7_17a8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l346_c7_17a8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l346_c7_17a8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l346_c7_17a8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l346_c7_17a8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l346_c7_17a8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l346_c7_17a8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l346_c7_17a8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l346_c7_17a8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l346_c7_17a8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l346_c7_17a8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l346_c7_17a8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l336_c7_3191] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_3191_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_3191_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_3191_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_3191_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_3191_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_3191_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_3191_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_3191_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l330_c2_01a5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_7ea8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l346_c7_17a8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_01a5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_3191_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_7ea8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l346_c7_17a8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_3191_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_959e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_959e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l343_c7_7ea8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l339_c7_959e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l343_c7_7ea8_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l343_c7_7ea8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_7ea8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_7ea8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_7ea8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_7ea8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_7ea8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_7ea8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_7ea8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_7ea8_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l339_c7_959e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l339_c7_959e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l339_c7_959e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l339_c7_959e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l339_c7_959e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l339_c7_959e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l339_c7_959e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l339_c7_959e_return_output := result_stack_value_MUX_uxn_opcodes_h_l339_c7_959e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l336_c7_3191] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_3191_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_3191_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_3191_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_3191_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_3191_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_3191_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_3191_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_3191_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l330_c2_01a5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_01a5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_01a5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_01a5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_01a5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_01a5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_01a5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_01a5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_01a5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l339_c7_959e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_959e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_959e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_959e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_959e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_959e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_959e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_959e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_959e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l343_c7_7ea8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_7ea8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_7ea8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_7ea8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_7ea8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_7ea8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_7ea8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_7ea8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_7ea8_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_959e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_7ea8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_959e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_7ea8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_01a5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_3191_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_3191_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_959e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l336_c7_3191_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l339_c7_959e_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l339_c7_959e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_959e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_959e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_959e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_959e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_959e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_959e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_959e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_959e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l336_c7_3191] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l336_c7_3191_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l336_c7_3191_cond;
     result_stack_value_MUX_uxn_opcodes_h_l336_c7_3191_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l336_c7_3191_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l336_c7_3191_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l336_c7_3191_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l336_c7_3191_return_output := result_stack_value_MUX_uxn_opcodes_h_l336_c7_3191_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l336_c7_3191] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_3191_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_3191_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_3191_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_3191_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_3191_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_3191_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_3191_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_3191_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l330_c2_01a5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_01a5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_01a5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_01a5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_01a5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_01a5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_01a5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_01a5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_01a5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l339_c7_959e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_959e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_959e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_959e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_959e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_959e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_959e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_959e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_959e_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_3191_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_959e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_3191_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_959e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_01a5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_3191_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l330_c2_01a5_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l336_c7_3191_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l336_c7_3191] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_3191_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_3191_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_3191_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_3191_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_3191_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_3191_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_3191_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_3191_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l330_c2_01a5] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l330_c2_01a5_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l330_c2_01a5_cond;
     result_stack_value_MUX_uxn_opcodes_h_l330_c2_01a5_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l330_c2_01a5_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l330_c2_01a5_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l330_c2_01a5_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l330_c2_01a5_return_output := result_stack_value_MUX_uxn_opcodes_h_l330_c2_01a5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l330_c2_01a5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_01a5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_01a5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_01a5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_01a5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_01a5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_01a5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_01a5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_01a5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l336_c7_3191] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_3191_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_3191_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_3191_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_3191_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_3191_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_3191_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_3191_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_3191_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_01a5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_3191_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_01a5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_3191_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l330_c2_01a5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_01a5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_01a5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_01a5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_01a5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_01a5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_01a5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_01a5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_01a5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l330_c2_01a5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_01a5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_01a5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_01a5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_01a5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_01a5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_01a5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_01a5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_01a5_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l371_l326_DUPLICATE_7634 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l371_l326_DUPLICATE_7634_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e56b(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_01a5_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l330_c2_01a5_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_01a5_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_01a5_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_01a5_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_01a5_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_01a5_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l371_l326_DUPLICATE_7634_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l371_l326_DUPLICATE_7634_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n8 <= REG_COMB_n8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
