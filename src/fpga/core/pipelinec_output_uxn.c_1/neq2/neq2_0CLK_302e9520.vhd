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
-- Submodules: 66
entity neq2_0CLK_302e9520 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end neq2_0CLK_302e9520;
architecture arch of neq2_0CLK_302e9520 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1220_c6_6955]
signal BIN_OP_EQ_uxn_opcodes_h_l1220_c6_6955_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1220_c6_6955_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1220_c6_6955_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1220_c1_5cfa]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_5cfa_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_5cfa_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_5cfa_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_5cfa_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1220_c2_b495]
signal n16_MUX_uxn_opcodes_h_l1220_c2_b495_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1220_c2_b495_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1220_c2_b495_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1220_c2_b495_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1220_c2_b495]
signal t16_MUX_uxn_opcodes_h_l1220_c2_b495_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1220_c2_b495_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1220_c2_b495_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1220_c2_b495_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1220_c2_b495]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_b495_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_b495_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_b495_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_b495_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1220_c2_b495]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_b495_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_b495_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_b495_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_b495_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1220_c2_b495]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_b495_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_b495_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_b495_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_b495_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1220_c2_b495]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_b495_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_b495_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_b495_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_b495_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1220_c2_b495]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_b495_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_b495_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_b495_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_b495_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1220_c2_b495]
signal result_u8_value_MUX_uxn_opcodes_h_l1220_c2_b495_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1220_c2_b495_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1220_c2_b495_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1220_c2_b495_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l1221_c3_8f52[uxn_opcodes_h_l1221_c3_8f52]
signal printf_uxn_opcodes_h_l1221_c3_8f52_uxn_opcodes_h_l1221_c3_8f52_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1225_c11_e6ff]
signal BIN_OP_EQ_uxn_opcodes_h_l1225_c11_e6ff_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1225_c11_e6ff_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1225_c11_e6ff_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1225_c7_a33e]
signal n16_MUX_uxn_opcodes_h_l1225_c7_a33e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1225_c7_a33e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1225_c7_a33e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1225_c7_a33e_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1225_c7_a33e]
signal t16_MUX_uxn_opcodes_h_l1225_c7_a33e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1225_c7_a33e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1225_c7_a33e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1225_c7_a33e_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1225_c7_a33e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_a33e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_a33e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_a33e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_a33e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1225_c7_a33e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_a33e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_a33e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_a33e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_a33e_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1225_c7_a33e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_a33e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_a33e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_a33e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_a33e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1225_c7_a33e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_a33e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_a33e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_a33e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_a33e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1225_c7_a33e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_a33e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_a33e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_a33e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_a33e_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1225_c7_a33e]
signal result_u8_value_MUX_uxn_opcodes_h_l1225_c7_a33e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1225_c7_a33e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1225_c7_a33e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1225_c7_a33e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1228_c11_a613]
signal BIN_OP_EQ_uxn_opcodes_h_l1228_c11_a613_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1228_c11_a613_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1228_c11_a613_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1228_c7_5852]
signal n16_MUX_uxn_opcodes_h_l1228_c7_5852_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1228_c7_5852_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1228_c7_5852_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1228_c7_5852_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1228_c7_5852]
signal t16_MUX_uxn_opcodes_h_l1228_c7_5852_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1228_c7_5852_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1228_c7_5852_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1228_c7_5852_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1228_c7_5852]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_5852_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_5852_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_5852_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_5852_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1228_c7_5852]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_5852_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_5852_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_5852_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_5852_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1228_c7_5852]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_5852_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_5852_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_5852_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_5852_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1228_c7_5852]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_5852_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_5852_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_5852_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_5852_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1228_c7_5852]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_5852_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_5852_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_5852_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_5852_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1228_c7_5852]
signal result_u8_value_MUX_uxn_opcodes_h_l1228_c7_5852_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1228_c7_5852_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1228_c7_5852_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1228_c7_5852_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1233_c11_8b17]
signal BIN_OP_EQ_uxn_opcodes_h_l1233_c11_8b17_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1233_c11_8b17_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1233_c11_8b17_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1233_c7_6e35]
signal n16_MUX_uxn_opcodes_h_l1233_c7_6e35_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1233_c7_6e35_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1233_c7_6e35_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1233_c7_6e35_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1233_c7_6e35]
signal t16_MUX_uxn_opcodes_h_l1233_c7_6e35_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1233_c7_6e35_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1233_c7_6e35_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1233_c7_6e35_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1233_c7_6e35]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_6e35_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_6e35_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_6e35_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_6e35_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1233_c7_6e35]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_6e35_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_6e35_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_6e35_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_6e35_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1233_c7_6e35]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_6e35_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_6e35_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_6e35_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_6e35_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1233_c7_6e35]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_6e35_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_6e35_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_6e35_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_6e35_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1233_c7_6e35]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_6e35_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_6e35_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_6e35_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_6e35_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1233_c7_6e35]
signal result_u8_value_MUX_uxn_opcodes_h_l1233_c7_6e35_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1233_c7_6e35_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1233_c7_6e35_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1233_c7_6e35_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1234_c3_51e9]
signal BIN_OP_OR_uxn_opcodes_h_l1234_c3_51e9_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1234_c3_51e9_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1234_c3_51e9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1237_c11_eaa7]
signal BIN_OP_EQ_uxn_opcodes_h_l1237_c11_eaa7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1237_c11_eaa7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1237_c11_eaa7_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1237_c7_ce99]
signal n16_MUX_uxn_opcodes_h_l1237_c7_ce99_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1237_c7_ce99_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1237_c7_ce99_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1237_c7_ce99_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1237_c7_ce99]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_ce99_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_ce99_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_ce99_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_ce99_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1237_c7_ce99]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_ce99_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_ce99_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_ce99_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_ce99_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1237_c7_ce99]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_ce99_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_ce99_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_ce99_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_ce99_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1237_c7_ce99]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_ce99_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_ce99_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_ce99_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_ce99_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1237_c7_ce99]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_ce99_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_ce99_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_ce99_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_ce99_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1237_c7_ce99]
signal result_u8_value_MUX_uxn_opcodes_h_l1237_c7_ce99_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1237_c7_ce99_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1237_c7_ce99_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1237_c7_ce99_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1241_c11_f602]
signal BIN_OP_EQ_uxn_opcodes_h_l1241_c11_f602_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1241_c11_f602_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1241_c11_f602_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1241_c7_1931]
signal n16_MUX_uxn_opcodes_h_l1241_c7_1931_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1241_c7_1931_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1241_c7_1931_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1241_c7_1931_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1241_c7_1931]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_1931_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_1931_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_1931_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_1931_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1241_c7_1931]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_1931_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_1931_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_1931_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_1931_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1241_c7_1931]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_1931_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_1931_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_1931_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_1931_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1241_c7_1931]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_1931_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_1931_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_1931_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_1931_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1241_c7_1931]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_1931_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_1931_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_1931_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_1931_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1241_c7_1931]
signal result_u8_value_MUX_uxn_opcodes_h_l1241_c7_1931_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1241_c7_1931_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1241_c7_1931_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1241_c7_1931_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1242_c3_0608]
signal BIN_OP_OR_uxn_opcodes_h_l1242_c3_0608_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1242_c3_0608_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1242_c3_0608_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1244_c30_0cb8]
signal sp_relative_shift_uxn_opcodes_h_l1244_c30_0cb8_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1244_c30_0cb8_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1244_c30_0cb8_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1244_c30_0cb8_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1247_c21_dbed]
signal BIN_OP_EQ_uxn_opcodes_h_l1247_c21_dbed_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1247_c21_dbed_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1247_c21_dbed_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1247_c21_b41b]
signal MUX_uxn_opcodes_h_l1247_c21_b41b_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1247_c21_b41b_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1247_c21_b41b_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1247_c21_b41b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1249_c11_a1e0]
signal BIN_OP_EQ_uxn_opcodes_h_l1249_c11_a1e0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1249_c11_a1e0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1249_c11_a1e0_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1249_c7_0e54]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_0e54_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_0e54_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_0e54_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_0e54_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1249_c7_0e54]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_0e54_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_0e54_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_0e54_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_0e54_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1249_c7_0e54]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_0e54_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_0e54_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_0e54_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_0e54_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1239_l1230_DUPLICATE_5f3d
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1239_l1230_DUPLICATE_5f3d_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1239_l1230_DUPLICATE_5f3d_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1220_c6_6955
BIN_OP_EQ_uxn_opcodes_h_l1220_c6_6955 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1220_c6_6955_left,
BIN_OP_EQ_uxn_opcodes_h_l1220_c6_6955_right,
BIN_OP_EQ_uxn_opcodes_h_l1220_c6_6955_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_5cfa
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_5cfa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_5cfa_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_5cfa_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_5cfa_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_5cfa_return_output);

-- n16_MUX_uxn_opcodes_h_l1220_c2_b495
n16_MUX_uxn_opcodes_h_l1220_c2_b495 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1220_c2_b495_cond,
n16_MUX_uxn_opcodes_h_l1220_c2_b495_iftrue,
n16_MUX_uxn_opcodes_h_l1220_c2_b495_iffalse,
n16_MUX_uxn_opcodes_h_l1220_c2_b495_return_output);

-- t16_MUX_uxn_opcodes_h_l1220_c2_b495
t16_MUX_uxn_opcodes_h_l1220_c2_b495 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1220_c2_b495_cond,
t16_MUX_uxn_opcodes_h_l1220_c2_b495_iftrue,
t16_MUX_uxn_opcodes_h_l1220_c2_b495_iffalse,
t16_MUX_uxn_opcodes_h_l1220_c2_b495_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_b495
result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_b495 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_b495_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_b495_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_b495_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_b495_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_b495
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_b495 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_b495_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_b495_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_b495_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_b495_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_b495
result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_b495 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_b495_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_b495_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_b495_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_b495_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_b495
result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_b495 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_b495_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_b495_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_b495_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_b495_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_b495
result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_b495 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_b495_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_b495_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_b495_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_b495_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1220_c2_b495
result_u8_value_MUX_uxn_opcodes_h_l1220_c2_b495 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1220_c2_b495_cond,
result_u8_value_MUX_uxn_opcodes_h_l1220_c2_b495_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1220_c2_b495_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1220_c2_b495_return_output);

-- printf_uxn_opcodes_h_l1221_c3_8f52_uxn_opcodes_h_l1221_c3_8f52
printf_uxn_opcodes_h_l1221_c3_8f52_uxn_opcodes_h_l1221_c3_8f52 : entity work.printf_uxn_opcodes_h_l1221_c3_8f52_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1221_c3_8f52_uxn_opcodes_h_l1221_c3_8f52_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1225_c11_e6ff
BIN_OP_EQ_uxn_opcodes_h_l1225_c11_e6ff : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1225_c11_e6ff_left,
BIN_OP_EQ_uxn_opcodes_h_l1225_c11_e6ff_right,
BIN_OP_EQ_uxn_opcodes_h_l1225_c11_e6ff_return_output);

-- n16_MUX_uxn_opcodes_h_l1225_c7_a33e
n16_MUX_uxn_opcodes_h_l1225_c7_a33e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1225_c7_a33e_cond,
n16_MUX_uxn_opcodes_h_l1225_c7_a33e_iftrue,
n16_MUX_uxn_opcodes_h_l1225_c7_a33e_iffalse,
n16_MUX_uxn_opcodes_h_l1225_c7_a33e_return_output);

-- t16_MUX_uxn_opcodes_h_l1225_c7_a33e
t16_MUX_uxn_opcodes_h_l1225_c7_a33e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1225_c7_a33e_cond,
t16_MUX_uxn_opcodes_h_l1225_c7_a33e_iftrue,
t16_MUX_uxn_opcodes_h_l1225_c7_a33e_iffalse,
t16_MUX_uxn_opcodes_h_l1225_c7_a33e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_a33e
result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_a33e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_a33e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_a33e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_a33e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_a33e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_a33e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_a33e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_a33e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_a33e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_a33e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_a33e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_a33e
result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_a33e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_a33e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_a33e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_a33e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_a33e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_a33e
result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_a33e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_a33e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_a33e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_a33e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_a33e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_a33e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_a33e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_a33e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_a33e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_a33e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_a33e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1225_c7_a33e
result_u8_value_MUX_uxn_opcodes_h_l1225_c7_a33e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1225_c7_a33e_cond,
result_u8_value_MUX_uxn_opcodes_h_l1225_c7_a33e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1225_c7_a33e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1225_c7_a33e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1228_c11_a613
BIN_OP_EQ_uxn_opcodes_h_l1228_c11_a613 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1228_c11_a613_left,
BIN_OP_EQ_uxn_opcodes_h_l1228_c11_a613_right,
BIN_OP_EQ_uxn_opcodes_h_l1228_c11_a613_return_output);

-- n16_MUX_uxn_opcodes_h_l1228_c7_5852
n16_MUX_uxn_opcodes_h_l1228_c7_5852 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1228_c7_5852_cond,
n16_MUX_uxn_opcodes_h_l1228_c7_5852_iftrue,
n16_MUX_uxn_opcodes_h_l1228_c7_5852_iffalse,
n16_MUX_uxn_opcodes_h_l1228_c7_5852_return_output);

-- t16_MUX_uxn_opcodes_h_l1228_c7_5852
t16_MUX_uxn_opcodes_h_l1228_c7_5852 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1228_c7_5852_cond,
t16_MUX_uxn_opcodes_h_l1228_c7_5852_iftrue,
t16_MUX_uxn_opcodes_h_l1228_c7_5852_iffalse,
t16_MUX_uxn_opcodes_h_l1228_c7_5852_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_5852
result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_5852 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_5852_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_5852_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_5852_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_5852_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_5852
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_5852 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_5852_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_5852_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_5852_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_5852_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_5852
result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_5852 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_5852_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_5852_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_5852_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_5852_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_5852
result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_5852 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_5852_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_5852_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_5852_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_5852_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_5852
result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_5852 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_5852_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_5852_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_5852_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_5852_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1228_c7_5852
result_u8_value_MUX_uxn_opcodes_h_l1228_c7_5852 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1228_c7_5852_cond,
result_u8_value_MUX_uxn_opcodes_h_l1228_c7_5852_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1228_c7_5852_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1228_c7_5852_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1233_c11_8b17
BIN_OP_EQ_uxn_opcodes_h_l1233_c11_8b17 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1233_c11_8b17_left,
BIN_OP_EQ_uxn_opcodes_h_l1233_c11_8b17_right,
BIN_OP_EQ_uxn_opcodes_h_l1233_c11_8b17_return_output);

-- n16_MUX_uxn_opcodes_h_l1233_c7_6e35
n16_MUX_uxn_opcodes_h_l1233_c7_6e35 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1233_c7_6e35_cond,
n16_MUX_uxn_opcodes_h_l1233_c7_6e35_iftrue,
n16_MUX_uxn_opcodes_h_l1233_c7_6e35_iffalse,
n16_MUX_uxn_opcodes_h_l1233_c7_6e35_return_output);

-- t16_MUX_uxn_opcodes_h_l1233_c7_6e35
t16_MUX_uxn_opcodes_h_l1233_c7_6e35 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1233_c7_6e35_cond,
t16_MUX_uxn_opcodes_h_l1233_c7_6e35_iftrue,
t16_MUX_uxn_opcodes_h_l1233_c7_6e35_iffalse,
t16_MUX_uxn_opcodes_h_l1233_c7_6e35_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_6e35
result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_6e35 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_6e35_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_6e35_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_6e35_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_6e35_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_6e35
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_6e35 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_6e35_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_6e35_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_6e35_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_6e35_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_6e35
result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_6e35 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_6e35_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_6e35_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_6e35_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_6e35_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_6e35
result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_6e35 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_6e35_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_6e35_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_6e35_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_6e35_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_6e35
result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_6e35 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_6e35_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_6e35_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_6e35_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_6e35_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1233_c7_6e35
result_u8_value_MUX_uxn_opcodes_h_l1233_c7_6e35 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1233_c7_6e35_cond,
result_u8_value_MUX_uxn_opcodes_h_l1233_c7_6e35_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1233_c7_6e35_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1233_c7_6e35_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1234_c3_51e9
BIN_OP_OR_uxn_opcodes_h_l1234_c3_51e9 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1234_c3_51e9_left,
BIN_OP_OR_uxn_opcodes_h_l1234_c3_51e9_right,
BIN_OP_OR_uxn_opcodes_h_l1234_c3_51e9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1237_c11_eaa7
BIN_OP_EQ_uxn_opcodes_h_l1237_c11_eaa7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1237_c11_eaa7_left,
BIN_OP_EQ_uxn_opcodes_h_l1237_c11_eaa7_right,
BIN_OP_EQ_uxn_opcodes_h_l1237_c11_eaa7_return_output);

-- n16_MUX_uxn_opcodes_h_l1237_c7_ce99
n16_MUX_uxn_opcodes_h_l1237_c7_ce99 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1237_c7_ce99_cond,
n16_MUX_uxn_opcodes_h_l1237_c7_ce99_iftrue,
n16_MUX_uxn_opcodes_h_l1237_c7_ce99_iffalse,
n16_MUX_uxn_opcodes_h_l1237_c7_ce99_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_ce99
result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_ce99 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_ce99_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_ce99_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_ce99_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_ce99_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_ce99
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_ce99 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_ce99_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_ce99_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_ce99_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_ce99_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_ce99
result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_ce99 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_ce99_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_ce99_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_ce99_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_ce99_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_ce99
result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_ce99 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_ce99_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_ce99_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_ce99_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_ce99_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_ce99
result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_ce99 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_ce99_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_ce99_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_ce99_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_ce99_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1237_c7_ce99
result_u8_value_MUX_uxn_opcodes_h_l1237_c7_ce99 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1237_c7_ce99_cond,
result_u8_value_MUX_uxn_opcodes_h_l1237_c7_ce99_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1237_c7_ce99_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1237_c7_ce99_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1241_c11_f602
BIN_OP_EQ_uxn_opcodes_h_l1241_c11_f602 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1241_c11_f602_left,
BIN_OP_EQ_uxn_opcodes_h_l1241_c11_f602_right,
BIN_OP_EQ_uxn_opcodes_h_l1241_c11_f602_return_output);

-- n16_MUX_uxn_opcodes_h_l1241_c7_1931
n16_MUX_uxn_opcodes_h_l1241_c7_1931 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1241_c7_1931_cond,
n16_MUX_uxn_opcodes_h_l1241_c7_1931_iftrue,
n16_MUX_uxn_opcodes_h_l1241_c7_1931_iffalse,
n16_MUX_uxn_opcodes_h_l1241_c7_1931_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_1931
result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_1931 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_1931_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_1931_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_1931_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_1931_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_1931
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_1931 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_1931_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_1931_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_1931_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_1931_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_1931
result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_1931 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_1931_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_1931_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_1931_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_1931_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_1931
result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_1931 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_1931_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_1931_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_1931_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_1931_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_1931
result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_1931 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_1931_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_1931_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_1931_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_1931_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1241_c7_1931
result_u8_value_MUX_uxn_opcodes_h_l1241_c7_1931 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1241_c7_1931_cond,
result_u8_value_MUX_uxn_opcodes_h_l1241_c7_1931_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1241_c7_1931_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1241_c7_1931_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1242_c3_0608
BIN_OP_OR_uxn_opcodes_h_l1242_c3_0608 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1242_c3_0608_left,
BIN_OP_OR_uxn_opcodes_h_l1242_c3_0608_right,
BIN_OP_OR_uxn_opcodes_h_l1242_c3_0608_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1244_c30_0cb8
sp_relative_shift_uxn_opcodes_h_l1244_c30_0cb8 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1244_c30_0cb8_ins,
sp_relative_shift_uxn_opcodes_h_l1244_c30_0cb8_x,
sp_relative_shift_uxn_opcodes_h_l1244_c30_0cb8_y,
sp_relative_shift_uxn_opcodes_h_l1244_c30_0cb8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1247_c21_dbed
BIN_OP_EQ_uxn_opcodes_h_l1247_c21_dbed : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1247_c21_dbed_left,
BIN_OP_EQ_uxn_opcodes_h_l1247_c21_dbed_right,
BIN_OP_EQ_uxn_opcodes_h_l1247_c21_dbed_return_output);

-- MUX_uxn_opcodes_h_l1247_c21_b41b
MUX_uxn_opcodes_h_l1247_c21_b41b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1247_c21_b41b_cond,
MUX_uxn_opcodes_h_l1247_c21_b41b_iftrue,
MUX_uxn_opcodes_h_l1247_c21_b41b_iffalse,
MUX_uxn_opcodes_h_l1247_c21_b41b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1249_c11_a1e0
BIN_OP_EQ_uxn_opcodes_h_l1249_c11_a1e0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1249_c11_a1e0_left,
BIN_OP_EQ_uxn_opcodes_h_l1249_c11_a1e0_right,
BIN_OP_EQ_uxn_opcodes_h_l1249_c11_a1e0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_0e54
result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_0e54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_0e54_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_0e54_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_0e54_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_0e54_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_0e54
result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_0e54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_0e54_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_0e54_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_0e54_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_0e54_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_0e54
result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_0e54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_0e54_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_0e54_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_0e54_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_0e54_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1239_l1230_DUPLICATE_5f3d
CONST_SL_8_uint16_t_uxn_opcodes_h_l1239_l1230_DUPLICATE_5f3d : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1239_l1230_DUPLICATE_5f3d_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1239_l1230_DUPLICATE_5f3d_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1220_c6_6955_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_5cfa_return_output,
 n16_MUX_uxn_opcodes_h_l1220_c2_b495_return_output,
 t16_MUX_uxn_opcodes_h_l1220_c2_b495_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_b495_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_b495_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_b495_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_b495_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_b495_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1220_c2_b495_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1225_c11_e6ff_return_output,
 n16_MUX_uxn_opcodes_h_l1225_c7_a33e_return_output,
 t16_MUX_uxn_opcodes_h_l1225_c7_a33e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_a33e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_a33e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_a33e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_a33e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_a33e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1225_c7_a33e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1228_c11_a613_return_output,
 n16_MUX_uxn_opcodes_h_l1228_c7_5852_return_output,
 t16_MUX_uxn_opcodes_h_l1228_c7_5852_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_5852_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_5852_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_5852_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_5852_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_5852_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1228_c7_5852_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1233_c11_8b17_return_output,
 n16_MUX_uxn_opcodes_h_l1233_c7_6e35_return_output,
 t16_MUX_uxn_opcodes_h_l1233_c7_6e35_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_6e35_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_6e35_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_6e35_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_6e35_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_6e35_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1233_c7_6e35_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1234_c3_51e9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1237_c11_eaa7_return_output,
 n16_MUX_uxn_opcodes_h_l1237_c7_ce99_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_ce99_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_ce99_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_ce99_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_ce99_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_ce99_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1237_c7_ce99_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1241_c11_f602_return_output,
 n16_MUX_uxn_opcodes_h_l1241_c7_1931_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_1931_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_1931_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_1931_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_1931_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_1931_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1241_c7_1931_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1242_c3_0608_return_output,
 sp_relative_shift_uxn_opcodes_h_l1244_c30_0cb8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1247_c21_dbed_return_output,
 MUX_uxn_opcodes_h_l1247_c21_b41b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1249_c11_a1e0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_0e54_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_0e54_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_0e54_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1239_l1230_DUPLICATE_5f3d_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_6955_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_6955_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_6955_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_5cfa_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_5cfa_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_5cfa_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_5cfa_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1220_c2_b495_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1220_c2_b495_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1225_c7_a33e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1220_c2_b495_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1220_c2_b495_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1220_c2_b495_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1220_c2_b495_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1225_c7_a33e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1220_c2_b495_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1220_c2_b495_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_b495_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_b495_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_a33e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_b495_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_b495_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_b495_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1222_c3_4b61 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_b495_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_a33e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_b495_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_b495_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_b495_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_b495_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_a33e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_b495_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_b495_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_b495_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_b495_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_a33e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_b495_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_b495_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_b495_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_b495_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_a33e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_b495_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_b495_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1220_c2_b495_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1220_c2_b495_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1225_c7_a33e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1220_c2_b495_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1220_c2_b495_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1221_c3_8f52_uxn_opcodes_h_l1221_c3_8f52_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_e6ff_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_e6ff_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_e6ff_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1225_c7_a33e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1225_c7_a33e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1228_c7_5852_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1225_c7_a33e_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1225_c7_a33e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1225_c7_a33e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1228_c7_5852_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1225_c7_a33e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_a33e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_a33e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_5852_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_a33e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_a33e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1226_c3_e74f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_a33e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_5852_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_a33e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_a33e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_a33e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_5852_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_a33e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_a33e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_a33e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_5852_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_a33e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_a33e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_a33e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_5852_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_a33e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1225_c7_a33e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1225_c7_a33e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1228_c7_5852_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1225_c7_a33e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c11_a613_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c11_a613_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c11_a613_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1228_c7_5852_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1228_c7_5852_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1233_c7_6e35_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1228_c7_5852_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1228_c7_5852_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1228_c7_5852_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1233_c7_6e35_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1228_c7_5852_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_5852_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_5852_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_6e35_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_5852_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_5852_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1231_c3_0168 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_5852_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_6e35_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_5852_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_5852_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_5852_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_6e35_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_5852_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_5852_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_5852_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_6e35_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_5852_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_5852_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_5852_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_6e35_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_5852_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1228_c7_5852_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1228_c7_5852_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1233_c7_6e35_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1228_c7_5852_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_8b17_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_8b17_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_8b17_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1233_c7_6e35_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1233_c7_6e35_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1237_c7_ce99_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1233_c7_6e35_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1233_c7_6e35_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1233_c7_6e35_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1233_c7_6e35_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_6e35_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_6e35_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_ce99_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_6e35_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_6e35_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1235_c3_2db9 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_6e35_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_ce99_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_6e35_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_6e35_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_6e35_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_ce99_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_6e35_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_6e35_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_6e35_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_ce99_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_6e35_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_6e35_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_6e35_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_ce99_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_6e35_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1233_c7_6e35_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1233_c7_6e35_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1237_c7_ce99_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1233_c7_6e35_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1234_c3_51e9_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1234_c3_51e9_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1234_c3_51e9_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_eaa7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_eaa7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_eaa7_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1237_c7_ce99_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1237_c7_ce99_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1241_c7_1931_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1237_c7_ce99_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_ce99_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_ce99_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_1931_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_ce99_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_ce99_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_ce99_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_1931_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_ce99_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_ce99_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_ce99_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_1931_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_ce99_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_ce99_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_ce99_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_1931_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_ce99_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_ce99_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_ce99_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_1931_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_ce99_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1237_c7_ce99_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1237_c7_ce99_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1241_c7_1931_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1237_c7_ce99_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_f602_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_f602_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_f602_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1241_c7_1931_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1241_c7_1931_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1241_c7_1931_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_1931_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_1931_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_0e54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_1931_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_1931_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1246_c3_e77f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_1931_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_1931_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_1931_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_1931_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_0e54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_1931_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_1931_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_1931_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_0e54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_1931_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_1931_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_1931_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_1931_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1241_c7_1931_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1241_c7_1931_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1241_c7_1931_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1242_c3_0608_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1242_c3_0608_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1242_c3_0608_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1244_c30_0cb8_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1244_c30_0cb8_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1244_c30_0cb8_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1244_c30_0cb8_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1247_c21_b41b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1247_c21_b41b_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1247_c21_b41b_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1247_c21_dbed_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1247_c21_dbed_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1247_c21_dbed_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1247_c21_b41b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_a1e0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_a1e0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_a1e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_0e54_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_0e54_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_0e54_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_0e54_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_0e54_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_0e54_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_0e54_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_0e54_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_0e54_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1220_l1249_l1237_DUPLICATE_0e45_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1220_l1249_l1237_DUPLICATE_fa35_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1220_l1241_l1237_DUPLICATE_ae8b_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1220_l1241_l1237_DUPLICATE_cfc4_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1249_l1241_l1237_DUPLICATE_16dd_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1238_l1242_l1229_l1234_DUPLICATE_5ec4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1239_l1230_DUPLICATE_5f3d_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1239_l1230_DUPLICATE_5f3d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1241_l1237_DUPLICATE_4e68_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l1255_l1216_DUPLICATE_8e55_return_output : opcode_result_t;
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
     VAR_MUX_uxn_opcodes_h_l1247_c21_b41b_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_a1e0_right := to_unsigned(6, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l1244_c30_0cb8_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1222_c3_4b61 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_b495_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1222_c3_4b61;
     VAR_sp_relative_shift_uxn_opcodes_h_l1244_c30_0cb8_y := resize(to_signed(-3, 3), 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_1931_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_0e54_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_1931_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_e6ff_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_8b17_right := to_unsigned(3, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_0e54_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1231_c3_0168 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_5852_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1231_c3_0168;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_b495_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_eaa7_right := to_unsigned(4, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_0e54_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1247_c21_b41b_iffalse := resize(to_unsigned(1, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_f602_right := to_unsigned(5, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_5cfa_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c11_a613_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1246_c3_e77f := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_1931_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1246_c3_e77f;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1235_c3_2db9 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_6e35_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1235_c3_2db9;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1226_c3_e74f := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_a33e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1226_c3_e74f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_6955_right := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_5cfa_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1244_c30_0cb8_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1242_c3_0608_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1220_c2_b495_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1225_c7_a33e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1228_c7_5852_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1233_c7_6e35_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1241_c7_1931_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_6955_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_e6ff_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c11_a613_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_8b17_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_eaa7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_f602_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_a1e0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1247_c21_dbed_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1234_c3_51e9_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1220_c2_b495_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1225_c7_a33e_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1233_c7_6e35_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1249_c11_a1e0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1249_c11_a1e0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_a1e0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1249_c11_a1e0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_a1e0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_a1e0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1249_c11_a1e0_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1220_l1241_l1237_DUPLICATE_ae8b LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1220_l1241_l1237_DUPLICATE_ae8b_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1237_c11_eaa7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1237_c11_eaa7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_eaa7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1237_c11_eaa7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_eaa7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_eaa7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1237_c11_eaa7_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1220_l1241_l1237_DUPLICATE_cfc4 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1220_l1241_l1237_DUPLICATE_cfc4_return_output := result.u8_value;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1238_l1242_l1229_l1234_DUPLICATE_5ec4 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1238_l1242_l1229_l1234_DUPLICATE_5ec4_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1241_l1237_DUPLICATE_4e68 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1241_l1237_DUPLICATE_4e68_return_output := result.stack_address_sp_offset;

     -- sp_relative_shift[uxn_opcodes_h_l1244_c30_0cb8] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1244_c30_0cb8_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1244_c30_0cb8_ins;
     sp_relative_shift_uxn_opcodes_h_l1244_c30_0cb8_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1244_c30_0cb8_x;
     sp_relative_shift_uxn_opcodes_h_l1244_c30_0cb8_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1244_c30_0cb8_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1244_c30_0cb8_return_output := sp_relative_shift_uxn_opcodes_h_l1244_c30_0cb8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1228_c11_a613] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1228_c11_a613_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c11_a613_left;
     BIN_OP_EQ_uxn_opcodes_h_l1228_c11_a613_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c11_a613_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c11_a613_return_output := BIN_OP_EQ_uxn_opcodes_h_l1228_c11_a613_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1220_l1249_l1237_DUPLICATE_fa35 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1220_l1249_l1237_DUPLICATE_fa35_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1225_c11_e6ff] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1225_c11_e6ff_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_e6ff_left;
     BIN_OP_EQ_uxn_opcodes_h_l1225_c11_e6ff_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_e6ff_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_e6ff_return_output := BIN_OP_EQ_uxn_opcodes_h_l1225_c11_e6ff_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1241_c11_f602] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1241_c11_f602_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_f602_left;
     BIN_OP_EQ_uxn_opcodes_h_l1241_c11_f602_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_f602_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_f602_return_output := BIN_OP_EQ_uxn_opcodes_h_l1241_c11_f602_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1233_c11_8b17] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1233_c11_8b17_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_8b17_left;
     BIN_OP_EQ_uxn_opcodes_h_l1233_c11_8b17_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_8b17_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_8b17_return_output := BIN_OP_EQ_uxn_opcodes_h_l1233_c11_8b17_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1220_l1249_l1237_DUPLICATE_0e45 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1220_l1249_l1237_DUPLICATE_0e45_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1220_c6_6955] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1220_c6_6955_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_6955_left;
     BIN_OP_EQ_uxn_opcodes_h_l1220_c6_6955_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_6955_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_6955_return_output := BIN_OP_EQ_uxn_opcodes_h_l1220_c6_6955_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1249_l1241_l1237_DUPLICATE_16dd LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1249_l1241_l1237_DUPLICATE_16dd_return_output := result.is_opc_done;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_5cfa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_6955_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1220_c2_b495_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_6955_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_b495_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_6955_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_b495_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_6955_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_b495_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_6955_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_b495_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_6955_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_b495_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_6955_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1220_c2_b495_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_6955_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1220_c2_b495_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_6955_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1225_c7_a33e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_e6ff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_a33e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_e6ff_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_a33e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_e6ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_a33e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_e6ff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_a33e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_e6ff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_a33e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_e6ff_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1225_c7_a33e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_e6ff_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1225_c7_a33e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_e6ff_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1228_c7_5852_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c11_a613_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_5852_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c11_a613_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_5852_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c11_a613_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_5852_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c11_a613_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_5852_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c11_a613_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_5852_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c11_a613_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1228_c7_5852_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c11_a613_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1228_c7_5852_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c11_a613_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1233_c7_6e35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_8b17_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_6e35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_8b17_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_6e35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_8b17_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_6e35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_8b17_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_6e35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_8b17_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_6e35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_8b17_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1233_c7_6e35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_8b17_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1233_c7_6e35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_8b17_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1237_c7_ce99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_eaa7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_ce99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_eaa7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_ce99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_eaa7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_ce99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_eaa7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_ce99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_eaa7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_ce99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_eaa7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1237_c7_ce99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_eaa7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1241_c7_1931_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_f602_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_1931_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_f602_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_1931_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_f602_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_1931_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_f602_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_1931_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_f602_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_1931_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_f602_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1241_c7_1931_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_f602_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_0e54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_a1e0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_0e54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_a1e0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_0e54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_a1e0_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1234_c3_51e9_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1238_l1242_l1229_l1234_DUPLICATE_5ec4_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1242_c3_0608_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1238_l1242_l1229_l1234_DUPLICATE_5ec4_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1239_l1230_DUPLICATE_5f3d_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1238_l1242_l1229_l1234_DUPLICATE_5ec4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_b495_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1220_l1241_l1237_DUPLICATE_ae8b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_a33e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1220_l1241_l1237_DUPLICATE_ae8b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_5852_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1220_l1241_l1237_DUPLICATE_ae8b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_6e35_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1220_l1241_l1237_DUPLICATE_ae8b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_ce99_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1220_l1241_l1237_DUPLICATE_ae8b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_1931_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1220_l1241_l1237_DUPLICATE_ae8b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_a33e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1249_l1241_l1237_DUPLICATE_16dd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_5852_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1249_l1241_l1237_DUPLICATE_16dd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_6e35_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1249_l1241_l1237_DUPLICATE_16dd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_ce99_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1249_l1241_l1237_DUPLICATE_16dd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_1931_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1249_l1241_l1237_DUPLICATE_16dd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_0e54_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1249_l1241_l1237_DUPLICATE_16dd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_b495_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1220_l1249_l1237_DUPLICATE_fa35_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_a33e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1220_l1249_l1237_DUPLICATE_fa35_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_5852_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1220_l1249_l1237_DUPLICATE_fa35_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_6e35_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1220_l1249_l1237_DUPLICATE_fa35_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_ce99_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1220_l1249_l1237_DUPLICATE_fa35_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_0e54_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1220_l1249_l1237_DUPLICATE_fa35_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_b495_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1220_l1249_l1237_DUPLICATE_0e45_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_a33e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1220_l1249_l1237_DUPLICATE_0e45_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_5852_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1220_l1249_l1237_DUPLICATE_0e45_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_6e35_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1220_l1249_l1237_DUPLICATE_0e45_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_ce99_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1220_l1249_l1237_DUPLICATE_0e45_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_0e54_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1220_l1249_l1237_DUPLICATE_0e45_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_ce99_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1241_l1237_DUPLICATE_4e68_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_1931_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1241_l1237_DUPLICATE_4e68_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1220_c2_b495_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1220_l1241_l1237_DUPLICATE_cfc4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1225_c7_a33e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1220_l1241_l1237_DUPLICATE_cfc4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1228_c7_5852_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1220_l1241_l1237_DUPLICATE_cfc4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1233_c7_6e35_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1220_l1241_l1237_DUPLICATE_cfc4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1237_c7_ce99_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1220_l1241_l1237_DUPLICATE_cfc4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1241_c7_1931_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1233_l1228_l1225_l1220_l1241_l1237_DUPLICATE_cfc4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_1931_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1244_c30_0cb8_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1241_c7_1931] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_1931_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_1931_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_1931_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_1931_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_1931_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_1931_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_1931_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_1931_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1242_c3_0608] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1242_c3_0608_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1242_c3_0608_left;
     BIN_OP_OR_uxn_opcodes_h_l1242_c3_0608_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1242_c3_0608_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1242_c3_0608_return_output := BIN_OP_OR_uxn_opcodes_h_l1242_c3_0608_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1241_c7_1931] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_1931_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_1931_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_1931_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_1931_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_1931_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_1931_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_1931_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_1931_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1249_c7_0e54] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_0e54_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_0e54_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_0e54_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_0e54_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_0e54_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_0e54_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_0e54_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_0e54_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1220_c1_5cfa] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_5cfa_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_5cfa_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_5cfa_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_5cfa_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_5cfa_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_5cfa_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_5cfa_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_5cfa_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1234_c3_51e9] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1234_c3_51e9_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1234_c3_51e9_left;
     BIN_OP_OR_uxn_opcodes_h_l1234_c3_51e9_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1234_c3_51e9_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1234_c3_51e9_return_output := BIN_OP_OR_uxn_opcodes_h_l1234_c3_51e9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1249_c7_0e54] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_0e54_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_0e54_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_0e54_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_0e54_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_0e54_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_0e54_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_0e54_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_0e54_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1239_l1230_DUPLICATE_5f3d LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1239_l1230_DUPLICATE_5f3d_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1239_l1230_DUPLICATE_5f3d_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1239_l1230_DUPLICATE_5f3d_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1239_l1230_DUPLICATE_5f3d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1249_c7_0e54] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_0e54_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_0e54_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_0e54_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_0e54_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_0e54_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_0e54_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_0e54_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_0e54_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1233_c7_6e35_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1234_c3_51e9_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1247_c21_dbed_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1242_c3_0608_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1241_c7_1931_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1242_c3_0608_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1237_c7_ce99_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1239_l1230_DUPLICATE_5f3d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1228_c7_5852_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1239_l1230_DUPLICATE_5f3d_return_output;
     VAR_printf_uxn_opcodes_h_l1221_c3_8f52_uxn_opcodes_h_l1221_c3_8f52_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_5cfa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_1931_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_0e54_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_1931_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_0e54_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_1931_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_0e54_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_ce99_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_1931_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_ce99_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_1931_return_output;
     -- t16_MUX[uxn_opcodes_h_l1233_c7_6e35] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1233_c7_6e35_cond <= VAR_t16_MUX_uxn_opcodes_h_l1233_c7_6e35_cond;
     t16_MUX_uxn_opcodes_h_l1233_c7_6e35_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1233_c7_6e35_iftrue;
     t16_MUX_uxn_opcodes_h_l1233_c7_6e35_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1233_c7_6e35_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1233_c7_6e35_return_output := t16_MUX_uxn_opcodes_h_l1233_c7_6e35_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1237_c7_ce99] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_ce99_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_ce99_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_ce99_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_ce99_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_ce99_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_ce99_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_ce99_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_ce99_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1241_c7_1931] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_1931_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_1931_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_1931_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_1931_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_1931_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_1931_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_1931_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_1931_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1241_c7_1931] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_1931_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_1931_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_1931_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_1931_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_1931_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_1931_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_1931_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_1931_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1241_c7_1931] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_1931_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_1931_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_1931_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_1931_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_1931_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_1931_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_1931_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_1931_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1237_c7_ce99] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_ce99_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_ce99_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_ce99_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_ce99_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_ce99_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_ce99_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_ce99_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_ce99_return_output;

     -- printf_uxn_opcodes_h_l1221_c3_8f52[uxn_opcodes_h_l1221_c3_8f52] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1221_c3_8f52_uxn_opcodes_h_l1221_c3_8f52_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1221_c3_8f52_uxn_opcodes_h_l1221_c3_8f52_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- BIN_OP_EQ[uxn_opcodes_h_l1247_c21_dbed] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1247_c21_dbed_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1247_c21_dbed_left;
     BIN_OP_EQ_uxn_opcodes_h_l1247_c21_dbed_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1247_c21_dbed_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1247_c21_dbed_return_output := BIN_OP_EQ_uxn_opcodes_h_l1247_c21_dbed_return_output;

     -- n16_MUX[uxn_opcodes_h_l1241_c7_1931] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1241_c7_1931_cond <= VAR_n16_MUX_uxn_opcodes_h_l1241_c7_1931_cond;
     n16_MUX_uxn_opcodes_h_l1241_c7_1931_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1241_c7_1931_iftrue;
     n16_MUX_uxn_opcodes_h_l1241_c7_1931_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1241_c7_1931_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1241_c7_1931_return_output := n16_MUX_uxn_opcodes_h_l1241_c7_1931_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1247_c21_b41b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1247_c21_dbed_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1237_c7_ce99_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1241_c7_1931_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_ce99_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_1931_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_ce99_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_1931_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_ce99_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_1931_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_6e35_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_ce99_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_6e35_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_ce99_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1228_c7_5852_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1233_c7_6e35_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1233_c7_6e35] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_6e35_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_6e35_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_6e35_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_6e35_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_6e35_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_6e35_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_6e35_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_6e35_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1233_c7_6e35] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_6e35_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_6e35_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_6e35_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_6e35_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_6e35_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_6e35_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_6e35_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_6e35_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1237_c7_ce99] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_ce99_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_ce99_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_ce99_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_ce99_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_ce99_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_ce99_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_ce99_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_ce99_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1237_c7_ce99] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_ce99_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_ce99_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_ce99_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_ce99_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_ce99_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_ce99_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_ce99_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_ce99_return_output;

     -- t16_MUX[uxn_opcodes_h_l1228_c7_5852] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1228_c7_5852_cond <= VAR_t16_MUX_uxn_opcodes_h_l1228_c7_5852_cond;
     t16_MUX_uxn_opcodes_h_l1228_c7_5852_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1228_c7_5852_iftrue;
     t16_MUX_uxn_opcodes_h_l1228_c7_5852_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1228_c7_5852_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1228_c7_5852_return_output := t16_MUX_uxn_opcodes_h_l1228_c7_5852_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1237_c7_ce99] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_ce99_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_ce99_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_ce99_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_ce99_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_ce99_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_ce99_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_ce99_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_ce99_return_output;

     -- n16_MUX[uxn_opcodes_h_l1237_c7_ce99] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1237_c7_ce99_cond <= VAR_n16_MUX_uxn_opcodes_h_l1237_c7_ce99_cond;
     n16_MUX_uxn_opcodes_h_l1237_c7_ce99_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1237_c7_ce99_iftrue;
     n16_MUX_uxn_opcodes_h_l1237_c7_ce99_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1237_c7_ce99_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1237_c7_ce99_return_output := n16_MUX_uxn_opcodes_h_l1237_c7_ce99_return_output;

     -- MUX[uxn_opcodes_h_l1247_c21_b41b] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1247_c21_b41b_cond <= VAR_MUX_uxn_opcodes_h_l1247_c21_b41b_cond;
     MUX_uxn_opcodes_h_l1247_c21_b41b_iftrue <= VAR_MUX_uxn_opcodes_h_l1247_c21_b41b_iftrue;
     MUX_uxn_opcodes_h_l1247_c21_b41b_iffalse <= VAR_MUX_uxn_opcodes_h_l1247_c21_b41b_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1247_c21_b41b_return_output := MUX_uxn_opcodes_h_l1247_c21_b41b_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1241_c7_1931_iftrue := VAR_MUX_uxn_opcodes_h_l1247_c21_b41b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1233_c7_6e35_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1237_c7_ce99_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_6e35_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_ce99_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_6e35_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_ce99_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_6e35_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_ce99_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_5852_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_6e35_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_5852_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_6e35_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1225_c7_a33e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1228_c7_5852_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1233_c7_6e35] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_6e35_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_6e35_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_6e35_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_6e35_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_6e35_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_6e35_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_6e35_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_6e35_return_output;

     -- n16_MUX[uxn_opcodes_h_l1233_c7_6e35] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1233_c7_6e35_cond <= VAR_n16_MUX_uxn_opcodes_h_l1233_c7_6e35_cond;
     n16_MUX_uxn_opcodes_h_l1233_c7_6e35_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1233_c7_6e35_iftrue;
     n16_MUX_uxn_opcodes_h_l1233_c7_6e35_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1233_c7_6e35_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1233_c7_6e35_return_output := n16_MUX_uxn_opcodes_h_l1233_c7_6e35_return_output;

     -- t16_MUX[uxn_opcodes_h_l1225_c7_a33e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1225_c7_a33e_cond <= VAR_t16_MUX_uxn_opcodes_h_l1225_c7_a33e_cond;
     t16_MUX_uxn_opcodes_h_l1225_c7_a33e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1225_c7_a33e_iftrue;
     t16_MUX_uxn_opcodes_h_l1225_c7_a33e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1225_c7_a33e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1225_c7_a33e_return_output := t16_MUX_uxn_opcodes_h_l1225_c7_a33e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1241_c7_1931] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1241_c7_1931_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1241_c7_1931_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1241_c7_1931_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1241_c7_1931_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1241_c7_1931_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1241_c7_1931_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1241_c7_1931_return_output := result_u8_value_MUX_uxn_opcodes_h_l1241_c7_1931_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1228_c7_5852] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_5852_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_5852_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_5852_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_5852_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_5852_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_5852_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_5852_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_5852_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1228_c7_5852] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_5852_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_5852_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_5852_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_5852_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_5852_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_5852_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_5852_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_5852_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1233_c7_6e35] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_6e35_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_6e35_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_6e35_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_6e35_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_6e35_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_6e35_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_6e35_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_6e35_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1233_c7_6e35] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_6e35_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_6e35_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_6e35_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_6e35_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_6e35_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_6e35_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_6e35_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_6e35_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1228_c7_5852_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1233_c7_6e35_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_5852_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_6e35_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_5852_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_6e35_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_5852_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_6e35_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_a33e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_5852_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_a33e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_5852_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1237_c7_ce99_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1241_c7_1931_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1220_c2_b495_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1225_c7_a33e_return_output;
     -- n16_MUX[uxn_opcodes_h_l1228_c7_5852] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1228_c7_5852_cond <= VAR_n16_MUX_uxn_opcodes_h_l1228_c7_5852_cond;
     n16_MUX_uxn_opcodes_h_l1228_c7_5852_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1228_c7_5852_iftrue;
     n16_MUX_uxn_opcodes_h_l1228_c7_5852_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1228_c7_5852_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1228_c7_5852_return_output := n16_MUX_uxn_opcodes_h_l1228_c7_5852_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1228_c7_5852] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_5852_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_5852_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_5852_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_5852_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_5852_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_5852_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_5852_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_5852_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1237_c7_ce99] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1237_c7_ce99_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1237_c7_ce99_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1237_c7_ce99_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1237_c7_ce99_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1237_c7_ce99_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1237_c7_ce99_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1237_c7_ce99_return_output := result_u8_value_MUX_uxn_opcodes_h_l1237_c7_ce99_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1228_c7_5852] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_5852_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_5852_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_5852_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_5852_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_5852_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_5852_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_5852_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_5852_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1225_c7_a33e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_a33e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_a33e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_a33e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_a33e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_a33e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_a33e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_a33e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_a33e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1228_c7_5852] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_5852_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_5852_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_5852_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_5852_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_5852_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_5852_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_5852_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_5852_return_output;

     -- t16_MUX[uxn_opcodes_h_l1220_c2_b495] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1220_c2_b495_cond <= VAR_t16_MUX_uxn_opcodes_h_l1220_c2_b495_cond;
     t16_MUX_uxn_opcodes_h_l1220_c2_b495_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1220_c2_b495_iftrue;
     t16_MUX_uxn_opcodes_h_l1220_c2_b495_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1220_c2_b495_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1220_c2_b495_return_output := t16_MUX_uxn_opcodes_h_l1220_c2_b495_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1225_c7_a33e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_a33e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_a33e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_a33e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_a33e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_a33e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_a33e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_a33e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_a33e_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1225_c7_a33e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1228_c7_5852_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_a33e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_5852_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_a33e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_5852_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_a33e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_5852_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_b495_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_a33e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_b495_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_a33e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1233_c7_6e35_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1237_c7_ce99_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1220_c2_b495_return_output;
     -- n16_MUX[uxn_opcodes_h_l1225_c7_a33e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1225_c7_a33e_cond <= VAR_n16_MUX_uxn_opcodes_h_l1225_c7_a33e_cond;
     n16_MUX_uxn_opcodes_h_l1225_c7_a33e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1225_c7_a33e_iftrue;
     n16_MUX_uxn_opcodes_h_l1225_c7_a33e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1225_c7_a33e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1225_c7_a33e_return_output := n16_MUX_uxn_opcodes_h_l1225_c7_a33e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1220_c2_b495] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_b495_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_b495_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_b495_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_b495_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_b495_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_b495_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_b495_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_b495_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1220_c2_b495] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_b495_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_b495_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_b495_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_b495_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_b495_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_b495_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_b495_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_b495_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1233_c7_6e35] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1233_c7_6e35_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1233_c7_6e35_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1233_c7_6e35_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1233_c7_6e35_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1233_c7_6e35_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1233_c7_6e35_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1233_c7_6e35_return_output := result_u8_value_MUX_uxn_opcodes_h_l1233_c7_6e35_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1225_c7_a33e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_a33e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_a33e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_a33e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_a33e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_a33e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_a33e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_a33e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_a33e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1225_c7_a33e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_a33e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_a33e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_a33e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_a33e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_a33e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_a33e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_a33e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_a33e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1225_c7_a33e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_a33e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_a33e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_a33e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_a33e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_a33e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_a33e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_a33e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_a33e_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1220_c2_b495_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1225_c7_a33e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_b495_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_a33e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_b495_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_a33e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_b495_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_a33e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1228_c7_5852_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1233_c7_6e35_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1220_c2_b495] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_b495_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_b495_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_b495_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_b495_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_b495_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_b495_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_b495_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_b495_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1220_c2_b495] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_b495_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_b495_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_b495_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_b495_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_b495_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_b495_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_b495_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_b495_return_output;

     -- n16_MUX[uxn_opcodes_h_l1220_c2_b495] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1220_c2_b495_cond <= VAR_n16_MUX_uxn_opcodes_h_l1220_c2_b495_cond;
     n16_MUX_uxn_opcodes_h_l1220_c2_b495_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1220_c2_b495_iftrue;
     n16_MUX_uxn_opcodes_h_l1220_c2_b495_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1220_c2_b495_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1220_c2_b495_return_output := n16_MUX_uxn_opcodes_h_l1220_c2_b495_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1228_c7_5852] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1228_c7_5852_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1228_c7_5852_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1228_c7_5852_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1228_c7_5852_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1228_c7_5852_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1228_c7_5852_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1228_c7_5852_return_output := result_u8_value_MUX_uxn_opcodes_h_l1228_c7_5852_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1220_c2_b495] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_b495_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_b495_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_b495_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_b495_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_b495_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_b495_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_b495_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_b495_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1220_c2_b495_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1225_c7_a33e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1228_c7_5852_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1225_c7_a33e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1225_c7_a33e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1225_c7_a33e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1225_c7_a33e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1225_c7_a33e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1225_c7_a33e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1225_c7_a33e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1225_c7_a33e_return_output := result_u8_value_MUX_uxn_opcodes_h_l1225_c7_a33e_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1220_c2_b495_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1225_c7_a33e_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1220_c2_b495] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1220_c2_b495_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1220_c2_b495_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1220_c2_b495_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1220_c2_b495_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1220_c2_b495_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1220_c2_b495_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1220_c2_b495_return_output := result_u8_value_MUX_uxn_opcodes_h_l1220_c2_b495_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l1255_l1216_DUPLICATE_8e55 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l1255_l1216_DUPLICATE_8e55_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_5b93(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_b495_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_b495_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_b495_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_b495_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_b495_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1220_c2_b495_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l1255_l1216_DUPLICATE_8e55_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l1255_l1216_DUPLICATE_8e55_return_output;
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
