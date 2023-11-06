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
-- BIN_OP_EQ[uxn_opcodes_h_l1220_c6_ef16]
signal BIN_OP_EQ_uxn_opcodes_h_l1220_c6_ef16_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1220_c6_ef16_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1220_c6_ef16_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1220_c1_2257]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_2257_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_2257_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_2257_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_2257_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1220_c2_cdb8]
signal n16_MUX_uxn_opcodes_h_l1220_c2_cdb8_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1220_c2_cdb8_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1220_c2_cdb8_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1220_c2_cdb8_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1220_c2_cdb8]
signal result_u8_value_MUX_uxn_opcodes_h_l1220_c2_cdb8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1220_c2_cdb8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1220_c2_cdb8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1220_c2_cdb8_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1220_c2_cdb8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_cdb8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_cdb8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_cdb8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_cdb8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1220_c2_cdb8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_cdb8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_cdb8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_cdb8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_cdb8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1220_c2_cdb8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_cdb8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_cdb8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_cdb8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_cdb8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1220_c2_cdb8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_cdb8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_cdb8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_cdb8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_cdb8_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1220_c2_cdb8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_cdb8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_cdb8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_cdb8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_cdb8_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1220_c2_cdb8]
signal t16_MUX_uxn_opcodes_h_l1220_c2_cdb8_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1220_c2_cdb8_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1220_c2_cdb8_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1220_c2_cdb8_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1221_c3_fceb[uxn_opcodes_h_l1221_c3_fceb]
signal printf_uxn_opcodes_h_l1221_c3_fceb_uxn_opcodes_h_l1221_c3_fceb_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1225_c11_0fad]
signal BIN_OP_EQ_uxn_opcodes_h_l1225_c11_0fad_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1225_c11_0fad_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1225_c11_0fad_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1225_c7_d8bf]
signal n16_MUX_uxn_opcodes_h_l1225_c7_d8bf_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1225_c7_d8bf_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1225_c7_d8bf_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1225_c7_d8bf_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1225_c7_d8bf]
signal result_u8_value_MUX_uxn_opcodes_h_l1225_c7_d8bf_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1225_c7_d8bf_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1225_c7_d8bf_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1225_c7_d8bf_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1225_c7_d8bf]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_d8bf_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_d8bf_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_d8bf_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_d8bf_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1225_c7_d8bf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_d8bf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_d8bf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_d8bf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_d8bf_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1225_c7_d8bf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_d8bf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_d8bf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_d8bf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_d8bf_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1225_c7_d8bf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_d8bf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_d8bf_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_d8bf_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_d8bf_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1225_c7_d8bf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_d8bf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_d8bf_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_d8bf_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_d8bf_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1225_c7_d8bf]
signal t16_MUX_uxn_opcodes_h_l1225_c7_d8bf_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1225_c7_d8bf_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1225_c7_d8bf_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1225_c7_d8bf_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1228_c11_aa3f]
signal BIN_OP_EQ_uxn_opcodes_h_l1228_c11_aa3f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1228_c11_aa3f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1228_c11_aa3f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1228_c7_7234]
signal n16_MUX_uxn_opcodes_h_l1228_c7_7234_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1228_c7_7234_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1228_c7_7234_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1228_c7_7234_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1228_c7_7234]
signal result_u8_value_MUX_uxn_opcodes_h_l1228_c7_7234_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1228_c7_7234_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1228_c7_7234_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1228_c7_7234_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1228_c7_7234]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_7234_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_7234_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_7234_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_7234_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1228_c7_7234]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_7234_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_7234_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_7234_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_7234_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1228_c7_7234]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_7234_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_7234_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_7234_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_7234_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1228_c7_7234]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_7234_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_7234_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_7234_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_7234_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1228_c7_7234]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_7234_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_7234_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_7234_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_7234_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1228_c7_7234]
signal t16_MUX_uxn_opcodes_h_l1228_c7_7234_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1228_c7_7234_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1228_c7_7234_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1228_c7_7234_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1233_c11_ceee]
signal BIN_OP_EQ_uxn_opcodes_h_l1233_c11_ceee_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1233_c11_ceee_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1233_c11_ceee_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1233_c7_275e]
signal n16_MUX_uxn_opcodes_h_l1233_c7_275e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1233_c7_275e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1233_c7_275e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1233_c7_275e_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1233_c7_275e]
signal result_u8_value_MUX_uxn_opcodes_h_l1233_c7_275e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1233_c7_275e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1233_c7_275e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1233_c7_275e_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1233_c7_275e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_275e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_275e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_275e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_275e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1233_c7_275e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_275e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_275e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_275e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_275e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1233_c7_275e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_275e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_275e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_275e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_275e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1233_c7_275e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_275e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_275e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_275e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_275e_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1233_c7_275e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_275e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_275e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_275e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_275e_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1233_c7_275e]
signal t16_MUX_uxn_opcodes_h_l1233_c7_275e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1233_c7_275e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1233_c7_275e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1233_c7_275e_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1234_c3_6cc9]
signal BIN_OP_OR_uxn_opcodes_h_l1234_c3_6cc9_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1234_c3_6cc9_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1234_c3_6cc9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1237_c11_9d79]
signal BIN_OP_EQ_uxn_opcodes_h_l1237_c11_9d79_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1237_c11_9d79_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1237_c11_9d79_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1237_c7_40c7]
signal n16_MUX_uxn_opcodes_h_l1237_c7_40c7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1237_c7_40c7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1237_c7_40c7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1237_c7_40c7_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1237_c7_40c7]
signal result_u8_value_MUX_uxn_opcodes_h_l1237_c7_40c7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1237_c7_40c7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1237_c7_40c7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1237_c7_40c7_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1237_c7_40c7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_40c7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_40c7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_40c7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_40c7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1237_c7_40c7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_40c7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_40c7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_40c7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_40c7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1237_c7_40c7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_40c7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_40c7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_40c7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_40c7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1237_c7_40c7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_40c7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_40c7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_40c7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_40c7_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1237_c7_40c7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_40c7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_40c7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_40c7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_40c7_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1241_c11_495c]
signal BIN_OP_EQ_uxn_opcodes_h_l1241_c11_495c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1241_c11_495c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1241_c11_495c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1241_c7_f3a7]
signal n16_MUX_uxn_opcodes_h_l1241_c7_f3a7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1241_c7_f3a7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1241_c7_f3a7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1241_c7_f3a7_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1241_c7_f3a7]
signal result_u8_value_MUX_uxn_opcodes_h_l1241_c7_f3a7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1241_c7_f3a7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1241_c7_f3a7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1241_c7_f3a7_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1241_c7_f3a7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_f3a7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_f3a7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_f3a7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_f3a7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1241_c7_f3a7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_f3a7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_f3a7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_f3a7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_f3a7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1241_c7_f3a7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_f3a7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_f3a7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_f3a7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_f3a7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1241_c7_f3a7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_f3a7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_f3a7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_f3a7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_f3a7_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1241_c7_f3a7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_f3a7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_f3a7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_f3a7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_f3a7_return_output : signed(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1242_c3_5c84]
signal BIN_OP_OR_uxn_opcodes_h_l1242_c3_5c84_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1242_c3_5c84_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1242_c3_5c84_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1244_c30_6b8f]
signal sp_relative_shift_uxn_opcodes_h_l1244_c30_6b8f_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1244_c30_6b8f_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1244_c30_6b8f_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1244_c30_6b8f_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1247_c21_2b2a]
signal BIN_OP_EQ_uxn_opcodes_h_l1247_c21_2b2a_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1247_c21_2b2a_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1247_c21_2b2a_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1247_c21_181e]
signal MUX_uxn_opcodes_h_l1247_c21_181e_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1247_c21_181e_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1247_c21_181e_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1247_c21_181e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1249_c11_0abc]
signal BIN_OP_EQ_uxn_opcodes_h_l1249_c11_0abc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1249_c11_0abc_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1249_c11_0abc_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1249_c7_0023]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_0023_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_0023_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_0023_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_0023_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1249_c7_0023]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_0023_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_0023_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_0023_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_0023_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1249_c7_0023]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_0023_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_0023_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_0023_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_0023_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1239_l1230_DUPLICATE_c71d
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1239_l1230_DUPLICATE_c71d_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1239_l1230_DUPLICATE_c71d_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1220_c6_ef16
BIN_OP_EQ_uxn_opcodes_h_l1220_c6_ef16 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1220_c6_ef16_left,
BIN_OP_EQ_uxn_opcodes_h_l1220_c6_ef16_right,
BIN_OP_EQ_uxn_opcodes_h_l1220_c6_ef16_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_2257
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_2257 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_2257_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_2257_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_2257_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_2257_return_output);

-- n16_MUX_uxn_opcodes_h_l1220_c2_cdb8
n16_MUX_uxn_opcodes_h_l1220_c2_cdb8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1220_c2_cdb8_cond,
n16_MUX_uxn_opcodes_h_l1220_c2_cdb8_iftrue,
n16_MUX_uxn_opcodes_h_l1220_c2_cdb8_iffalse,
n16_MUX_uxn_opcodes_h_l1220_c2_cdb8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1220_c2_cdb8
result_u8_value_MUX_uxn_opcodes_h_l1220_c2_cdb8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1220_c2_cdb8_cond,
result_u8_value_MUX_uxn_opcodes_h_l1220_c2_cdb8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1220_c2_cdb8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1220_c2_cdb8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_cdb8
result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_cdb8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_cdb8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_cdb8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_cdb8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_cdb8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_cdb8
result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_cdb8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_cdb8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_cdb8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_cdb8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_cdb8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_cdb8
result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_cdb8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_cdb8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_cdb8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_cdb8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_cdb8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_cdb8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_cdb8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_cdb8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_cdb8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_cdb8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_cdb8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_cdb8
result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_cdb8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_cdb8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_cdb8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_cdb8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_cdb8_return_output);

-- t16_MUX_uxn_opcodes_h_l1220_c2_cdb8
t16_MUX_uxn_opcodes_h_l1220_c2_cdb8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1220_c2_cdb8_cond,
t16_MUX_uxn_opcodes_h_l1220_c2_cdb8_iftrue,
t16_MUX_uxn_opcodes_h_l1220_c2_cdb8_iffalse,
t16_MUX_uxn_opcodes_h_l1220_c2_cdb8_return_output);

-- printf_uxn_opcodes_h_l1221_c3_fceb_uxn_opcodes_h_l1221_c3_fceb
printf_uxn_opcodes_h_l1221_c3_fceb_uxn_opcodes_h_l1221_c3_fceb : entity work.printf_uxn_opcodes_h_l1221_c3_fceb_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1221_c3_fceb_uxn_opcodes_h_l1221_c3_fceb_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1225_c11_0fad
BIN_OP_EQ_uxn_opcodes_h_l1225_c11_0fad : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1225_c11_0fad_left,
BIN_OP_EQ_uxn_opcodes_h_l1225_c11_0fad_right,
BIN_OP_EQ_uxn_opcodes_h_l1225_c11_0fad_return_output);

-- n16_MUX_uxn_opcodes_h_l1225_c7_d8bf
n16_MUX_uxn_opcodes_h_l1225_c7_d8bf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1225_c7_d8bf_cond,
n16_MUX_uxn_opcodes_h_l1225_c7_d8bf_iftrue,
n16_MUX_uxn_opcodes_h_l1225_c7_d8bf_iffalse,
n16_MUX_uxn_opcodes_h_l1225_c7_d8bf_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1225_c7_d8bf
result_u8_value_MUX_uxn_opcodes_h_l1225_c7_d8bf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1225_c7_d8bf_cond,
result_u8_value_MUX_uxn_opcodes_h_l1225_c7_d8bf_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1225_c7_d8bf_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1225_c7_d8bf_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_d8bf
result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_d8bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_d8bf_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_d8bf_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_d8bf_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_d8bf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_d8bf
result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_d8bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_d8bf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_d8bf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_d8bf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_d8bf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_d8bf
result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_d8bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_d8bf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_d8bf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_d8bf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_d8bf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_d8bf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_d8bf : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_d8bf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_d8bf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_d8bf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_d8bf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_d8bf
result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_d8bf : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_d8bf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_d8bf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_d8bf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_d8bf_return_output);

-- t16_MUX_uxn_opcodes_h_l1225_c7_d8bf
t16_MUX_uxn_opcodes_h_l1225_c7_d8bf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1225_c7_d8bf_cond,
t16_MUX_uxn_opcodes_h_l1225_c7_d8bf_iftrue,
t16_MUX_uxn_opcodes_h_l1225_c7_d8bf_iffalse,
t16_MUX_uxn_opcodes_h_l1225_c7_d8bf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1228_c11_aa3f
BIN_OP_EQ_uxn_opcodes_h_l1228_c11_aa3f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1228_c11_aa3f_left,
BIN_OP_EQ_uxn_opcodes_h_l1228_c11_aa3f_right,
BIN_OP_EQ_uxn_opcodes_h_l1228_c11_aa3f_return_output);

-- n16_MUX_uxn_opcodes_h_l1228_c7_7234
n16_MUX_uxn_opcodes_h_l1228_c7_7234 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1228_c7_7234_cond,
n16_MUX_uxn_opcodes_h_l1228_c7_7234_iftrue,
n16_MUX_uxn_opcodes_h_l1228_c7_7234_iffalse,
n16_MUX_uxn_opcodes_h_l1228_c7_7234_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1228_c7_7234
result_u8_value_MUX_uxn_opcodes_h_l1228_c7_7234 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1228_c7_7234_cond,
result_u8_value_MUX_uxn_opcodes_h_l1228_c7_7234_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1228_c7_7234_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1228_c7_7234_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_7234
result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_7234 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_7234_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_7234_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_7234_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_7234_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_7234
result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_7234 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_7234_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_7234_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_7234_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_7234_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_7234
result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_7234 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_7234_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_7234_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_7234_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_7234_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_7234
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_7234 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_7234_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_7234_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_7234_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_7234_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_7234
result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_7234 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_7234_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_7234_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_7234_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_7234_return_output);

-- t16_MUX_uxn_opcodes_h_l1228_c7_7234
t16_MUX_uxn_opcodes_h_l1228_c7_7234 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1228_c7_7234_cond,
t16_MUX_uxn_opcodes_h_l1228_c7_7234_iftrue,
t16_MUX_uxn_opcodes_h_l1228_c7_7234_iffalse,
t16_MUX_uxn_opcodes_h_l1228_c7_7234_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1233_c11_ceee
BIN_OP_EQ_uxn_opcodes_h_l1233_c11_ceee : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1233_c11_ceee_left,
BIN_OP_EQ_uxn_opcodes_h_l1233_c11_ceee_right,
BIN_OP_EQ_uxn_opcodes_h_l1233_c11_ceee_return_output);

-- n16_MUX_uxn_opcodes_h_l1233_c7_275e
n16_MUX_uxn_opcodes_h_l1233_c7_275e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1233_c7_275e_cond,
n16_MUX_uxn_opcodes_h_l1233_c7_275e_iftrue,
n16_MUX_uxn_opcodes_h_l1233_c7_275e_iffalse,
n16_MUX_uxn_opcodes_h_l1233_c7_275e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1233_c7_275e
result_u8_value_MUX_uxn_opcodes_h_l1233_c7_275e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1233_c7_275e_cond,
result_u8_value_MUX_uxn_opcodes_h_l1233_c7_275e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1233_c7_275e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1233_c7_275e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_275e
result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_275e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_275e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_275e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_275e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_275e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_275e
result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_275e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_275e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_275e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_275e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_275e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_275e
result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_275e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_275e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_275e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_275e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_275e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_275e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_275e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_275e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_275e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_275e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_275e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_275e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_275e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_275e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_275e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_275e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_275e_return_output);

-- t16_MUX_uxn_opcodes_h_l1233_c7_275e
t16_MUX_uxn_opcodes_h_l1233_c7_275e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1233_c7_275e_cond,
t16_MUX_uxn_opcodes_h_l1233_c7_275e_iftrue,
t16_MUX_uxn_opcodes_h_l1233_c7_275e_iffalse,
t16_MUX_uxn_opcodes_h_l1233_c7_275e_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1234_c3_6cc9
BIN_OP_OR_uxn_opcodes_h_l1234_c3_6cc9 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1234_c3_6cc9_left,
BIN_OP_OR_uxn_opcodes_h_l1234_c3_6cc9_right,
BIN_OP_OR_uxn_opcodes_h_l1234_c3_6cc9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1237_c11_9d79
BIN_OP_EQ_uxn_opcodes_h_l1237_c11_9d79 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1237_c11_9d79_left,
BIN_OP_EQ_uxn_opcodes_h_l1237_c11_9d79_right,
BIN_OP_EQ_uxn_opcodes_h_l1237_c11_9d79_return_output);

-- n16_MUX_uxn_opcodes_h_l1237_c7_40c7
n16_MUX_uxn_opcodes_h_l1237_c7_40c7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1237_c7_40c7_cond,
n16_MUX_uxn_opcodes_h_l1237_c7_40c7_iftrue,
n16_MUX_uxn_opcodes_h_l1237_c7_40c7_iffalse,
n16_MUX_uxn_opcodes_h_l1237_c7_40c7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1237_c7_40c7
result_u8_value_MUX_uxn_opcodes_h_l1237_c7_40c7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1237_c7_40c7_cond,
result_u8_value_MUX_uxn_opcodes_h_l1237_c7_40c7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1237_c7_40c7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1237_c7_40c7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_40c7
result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_40c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_40c7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_40c7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_40c7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_40c7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_40c7
result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_40c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_40c7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_40c7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_40c7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_40c7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_40c7
result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_40c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_40c7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_40c7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_40c7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_40c7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_40c7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_40c7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_40c7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_40c7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_40c7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_40c7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_40c7
result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_40c7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_40c7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_40c7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_40c7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_40c7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1241_c11_495c
BIN_OP_EQ_uxn_opcodes_h_l1241_c11_495c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1241_c11_495c_left,
BIN_OP_EQ_uxn_opcodes_h_l1241_c11_495c_right,
BIN_OP_EQ_uxn_opcodes_h_l1241_c11_495c_return_output);

-- n16_MUX_uxn_opcodes_h_l1241_c7_f3a7
n16_MUX_uxn_opcodes_h_l1241_c7_f3a7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1241_c7_f3a7_cond,
n16_MUX_uxn_opcodes_h_l1241_c7_f3a7_iftrue,
n16_MUX_uxn_opcodes_h_l1241_c7_f3a7_iffalse,
n16_MUX_uxn_opcodes_h_l1241_c7_f3a7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1241_c7_f3a7
result_u8_value_MUX_uxn_opcodes_h_l1241_c7_f3a7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1241_c7_f3a7_cond,
result_u8_value_MUX_uxn_opcodes_h_l1241_c7_f3a7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1241_c7_f3a7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1241_c7_f3a7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_f3a7
result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_f3a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_f3a7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_f3a7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_f3a7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_f3a7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_f3a7
result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_f3a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_f3a7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_f3a7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_f3a7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_f3a7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_f3a7
result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_f3a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_f3a7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_f3a7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_f3a7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_f3a7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_f3a7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_f3a7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_f3a7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_f3a7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_f3a7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_f3a7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_f3a7
result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_f3a7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_f3a7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_f3a7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_f3a7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_f3a7_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1242_c3_5c84
BIN_OP_OR_uxn_opcodes_h_l1242_c3_5c84 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1242_c3_5c84_left,
BIN_OP_OR_uxn_opcodes_h_l1242_c3_5c84_right,
BIN_OP_OR_uxn_opcodes_h_l1242_c3_5c84_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1244_c30_6b8f
sp_relative_shift_uxn_opcodes_h_l1244_c30_6b8f : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1244_c30_6b8f_ins,
sp_relative_shift_uxn_opcodes_h_l1244_c30_6b8f_x,
sp_relative_shift_uxn_opcodes_h_l1244_c30_6b8f_y,
sp_relative_shift_uxn_opcodes_h_l1244_c30_6b8f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1247_c21_2b2a
BIN_OP_EQ_uxn_opcodes_h_l1247_c21_2b2a : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1247_c21_2b2a_left,
BIN_OP_EQ_uxn_opcodes_h_l1247_c21_2b2a_right,
BIN_OP_EQ_uxn_opcodes_h_l1247_c21_2b2a_return_output);

-- MUX_uxn_opcodes_h_l1247_c21_181e
MUX_uxn_opcodes_h_l1247_c21_181e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1247_c21_181e_cond,
MUX_uxn_opcodes_h_l1247_c21_181e_iftrue,
MUX_uxn_opcodes_h_l1247_c21_181e_iffalse,
MUX_uxn_opcodes_h_l1247_c21_181e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1249_c11_0abc
BIN_OP_EQ_uxn_opcodes_h_l1249_c11_0abc : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1249_c11_0abc_left,
BIN_OP_EQ_uxn_opcodes_h_l1249_c11_0abc_right,
BIN_OP_EQ_uxn_opcodes_h_l1249_c11_0abc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_0023
result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_0023 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_0023_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_0023_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_0023_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_0023_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_0023
result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_0023 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_0023_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_0023_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_0023_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_0023_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_0023
result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_0023 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_0023_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_0023_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_0023_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_0023_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1239_l1230_DUPLICATE_c71d
CONST_SL_8_uint16_t_uxn_opcodes_h_l1239_l1230_DUPLICATE_c71d : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1239_l1230_DUPLICATE_c71d_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1239_l1230_DUPLICATE_c71d_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1220_c6_ef16_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_2257_return_output,
 n16_MUX_uxn_opcodes_h_l1220_c2_cdb8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1220_c2_cdb8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_cdb8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_cdb8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_cdb8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_cdb8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_cdb8_return_output,
 t16_MUX_uxn_opcodes_h_l1220_c2_cdb8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1225_c11_0fad_return_output,
 n16_MUX_uxn_opcodes_h_l1225_c7_d8bf_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1225_c7_d8bf_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_d8bf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_d8bf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_d8bf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_d8bf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_d8bf_return_output,
 t16_MUX_uxn_opcodes_h_l1225_c7_d8bf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1228_c11_aa3f_return_output,
 n16_MUX_uxn_opcodes_h_l1228_c7_7234_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1228_c7_7234_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_7234_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_7234_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_7234_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_7234_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_7234_return_output,
 t16_MUX_uxn_opcodes_h_l1228_c7_7234_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1233_c11_ceee_return_output,
 n16_MUX_uxn_opcodes_h_l1233_c7_275e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1233_c7_275e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_275e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_275e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_275e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_275e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_275e_return_output,
 t16_MUX_uxn_opcodes_h_l1233_c7_275e_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1234_c3_6cc9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1237_c11_9d79_return_output,
 n16_MUX_uxn_opcodes_h_l1237_c7_40c7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1237_c7_40c7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_40c7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_40c7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_40c7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_40c7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_40c7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1241_c11_495c_return_output,
 n16_MUX_uxn_opcodes_h_l1241_c7_f3a7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1241_c7_f3a7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_f3a7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_f3a7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_f3a7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_f3a7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_f3a7_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1242_c3_5c84_return_output,
 sp_relative_shift_uxn_opcodes_h_l1244_c30_6b8f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1247_c21_2b2a_return_output,
 MUX_uxn_opcodes_h_l1247_c21_181e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1249_c11_0abc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_0023_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_0023_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_0023_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1239_l1230_DUPLICATE_c71d_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_ef16_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_ef16_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_ef16_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_2257_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_2257_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_2257_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_2257_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1220_c2_cdb8_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1220_c2_cdb8_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1225_c7_d8bf_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1220_c2_cdb8_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1220_c2_cdb8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1220_c2_cdb8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1220_c2_cdb8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1225_c7_d8bf_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1220_c2_cdb8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1220_c2_cdb8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_cdb8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_cdb8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_d8bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_cdb8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_cdb8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_cdb8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_cdb8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_d8bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_cdb8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_cdb8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_cdb8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_cdb8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_d8bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_cdb8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_cdb8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_cdb8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1222_c3_487c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_cdb8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_d8bf_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_cdb8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_cdb8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_cdb8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_cdb8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_d8bf_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_cdb8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_cdb8_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1220_c2_cdb8_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1220_c2_cdb8_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1225_c7_d8bf_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1220_c2_cdb8_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1220_c2_cdb8_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1221_c3_fceb_uxn_opcodes_h_l1221_c3_fceb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_0fad_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_0fad_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_0fad_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1225_c7_d8bf_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1225_c7_d8bf_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1228_c7_7234_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1225_c7_d8bf_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1225_c7_d8bf_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1225_c7_d8bf_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1228_c7_7234_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1225_c7_d8bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_d8bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_d8bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_7234_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_d8bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_d8bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_d8bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_7234_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_d8bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_d8bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_d8bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_7234_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_d8bf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_d8bf_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1226_c3_4a63 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_d8bf_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_7234_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_d8bf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_d8bf_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_d8bf_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_7234_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_d8bf_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1225_c7_d8bf_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1225_c7_d8bf_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1228_c7_7234_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1225_c7_d8bf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c11_aa3f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c11_aa3f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c11_aa3f_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1228_c7_7234_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1228_c7_7234_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1233_c7_275e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1228_c7_7234_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1228_c7_7234_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1228_c7_7234_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1233_c7_275e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1228_c7_7234_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_7234_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_7234_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_275e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_7234_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_7234_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_7234_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_275e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_7234_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_7234_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_7234_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_275e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_7234_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_7234_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1231_c3_2210 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_7234_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_275e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_7234_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_7234_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_7234_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_275e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_7234_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1228_c7_7234_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1228_c7_7234_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1233_c7_275e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1228_c7_7234_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_ceee_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_ceee_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_ceee_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1233_c7_275e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1233_c7_275e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1237_c7_40c7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1233_c7_275e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1233_c7_275e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1233_c7_275e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1237_c7_40c7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1233_c7_275e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_275e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_275e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_40c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_275e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_275e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_275e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_40c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_275e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_275e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_275e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_40c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_275e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_275e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1235_c3_8df9 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_275e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_40c7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_275e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_275e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_275e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_40c7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_275e_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1233_c7_275e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1233_c7_275e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1233_c7_275e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1234_c3_6cc9_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1234_c3_6cc9_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1234_c3_6cc9_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_9d79_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_9d79_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_9d79_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1237_c7_40c7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1237_c7_40c7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1241_c7_f3a7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1237_c7_40c7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1237_c7_40c7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1237_c7_40c7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1241_c7_f3a7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1237_c7_40c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_40c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_40c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_f3a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_40c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_40c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_40c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_f3a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_40c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_40c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_40c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_f3a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_40c7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_40c7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_40c7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_f3a7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_40c7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_40c7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_40c7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_f3a7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_40c7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_495c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_495c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_495c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1241_c7_f3a7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1241_c7_f3a7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1241_c7_f3a7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1241_c7_f3a7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1241_c7_f3a7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1241_c7_f3a7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_f3a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_f3a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_0023_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_f3a7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_f3a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_f3a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_0023_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_f3a7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_f3a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_f3a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_0023_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_f3a7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_f3a7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1246_c3_8d4e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_f3a7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_f3a7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_f3a7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_f3a7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_f3a7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1242_c3_5c84_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1242_c3_5c84_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1242_c3_5c84_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1244_c30_6b8f_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1244_c30_6b8f_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1244_c30_6b8f_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1244_c30_6b8f_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1247_c21_181e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1247_c21_181e_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1247_c21_181e_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1247_c21_2b2a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1247_c21_2b2a_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1247_c21_2b2a_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1247_c21_181e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_0abc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_0abc_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_0abc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_0023_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_0023_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_0023_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_0023_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_0023_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_0023_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_0023_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_0023_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_0023_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1237_l1233_l1228_l1225_l1220_l1241_DUPLICATE_c441_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1237_l1233_l1228_l1225_l1220_l1249_DUPLICATE_b71c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1237_l1233_l1228_l1225_l1220_l1249_DUPLICATE_c116_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1237_l1233_l1228_l1225_l1220_l1241_DUPLICATE_1714_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1237_l1233_l1228_l1225_l1249_l1241_DUPLICATE_5473_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1234_l1238_l1229_l1242_DUPLICATE_e2f5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1239_l1230_DUPLICATE_c71d_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1239_l1230_DUPLICATE_c71d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1237_l1241_DUPLICATE_8511_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l1255_l1216_DUPLICATE_d903_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c11_aa3f_right := to_unsigned(2, 2);
     VAR_MUX_uxn_opcodes_h_l1247_c21_181e_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_sp_relative_shift_uxn_opcodes_h_l1244_c30_6b8f_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_0023_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_cdb8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_9d79_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_ceee_right := to_unsigned(3, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l1244_c30_6b8f_y := resize(to_signed(-3, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1246_c3_8d4e := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_f3a7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1246_c3_8d4e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_495c_right := to_unsigned(5, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_0023_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1222_c3_487c := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_cdb8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1222_c3_487c;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1235_c3_8df9 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_275e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1235_c3_8df9;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1226_c3_4a63 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_d8bf_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1226_c3_4a63;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_2257_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_0fad_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_0023_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_ef16_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1231_c3_2210 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_7234_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1231_c3_2210;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_0abc_right := to_unsigned(6, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_f3a7_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1247_c21_181e_iffalse := resize(to_unsigned(1, 1), 8);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_f3a7_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_2257_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1244_c30_6b8f_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1242_c3_5c84_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1220_c2_cdb8_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1225_c7_d8bf_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1228_c7_7234_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1233_c7_275e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1241_c7_f3a7_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_ef16_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_0fad_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c11_aa3f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_ceee_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_9d79_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_495c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_0abc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1247_c21_2b2a_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1234_c3_6cc9_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1220_c2_cdb8_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1225_c7_d8bf_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1233_c7_275e_iffalse := t16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1237_l1233_l1228_l1225_l1220_l1249_DUPLICATE_b71c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1237_l1233_l1228_l1225_l1220_l1249_DUPLICATE_b71c_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1237_l1233_l1228_l1225_l1249_l1241_DUPLICATE_5473 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1237_l1233_l1228_l1225_l1249_l1241_DUPLICATE_5473_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1225_c11_0fad] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1225_c11_0fad_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_0fad_left;
     BIN_OP_EQ_uxn_opcodes_h_l1225_c11_0fad_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_0fad_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_0fad_return_output := BIN_OP_EQ_uxn_opcodes_h_l1225_c11_0fad_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1249_c11_0abc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1249_c11_0abc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_0abc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1249_c11_0abc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_0abc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_0abc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1249_c11_0abc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1237_c11_9d79] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1237_c11_9d79_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_9d79_left;
     BIN_OP_EQ_uxn_opcodes_h_l1237_c11_9d79_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_9d79_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_9d79_return_output := BIN_OP_EQ_uxn_opcodes_h_l1237_c11_9d79_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1233_c11_ceee] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1233_c11_ceee_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_ceee_left;
     BIN_OP_EQ_uxn_opcodes_h_l1233_c11_ceee_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_ceee_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_ceee_return_output := BIN_OP_EQ_uxn_opcodes_h_l1233_c11_ceee_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1244_c30_6b8f] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1244_c30_6b8f_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1244_c30_6b8f_ins;
     sp_relative_shift_uxn_opcodes_h_l1244_c30_6b8f_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1244_c30_6b8f_x;
     sp_relative_shift_uxn_opcodes_h_l1244_c30_6b8f_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1244_c30_6b8f_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1244_c30_6b8f_return_output := sp_relative_shift_uxn_opcodes_h_l1244_c30_6b8f_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1237_l1233_l1228_l1225_l1220_l1241_DUPLICATE_c441 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1237_l1233_l1228_l1225_l1220_l1241_DUPLICATE_c441_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1241_c11_495c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1241_c11_495c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_495c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1241_c11_495c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_495c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_495c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1241_c11_495c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1237_l1233_l1228_l1225_l1220_l1249_DUPLICATE_c116 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1237_l1233_l1228_l1225_l1220_l1249_DUPLICATE_c116_return_output := result.is_stack_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1237_l1233_l1228_l1225_l1220_l1241_DUPLICATE_1714 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1237_l1233_l1228_l1225_l1220_l1241_DUPLICATE_1714_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1220_c6_ef16] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1220_c6_ef16_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_ef16_left;
     BIN_OP_EQ_uxn_opcodes_h_l1220_c6_ef16_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_ef16_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_ef16_return_output := BIN_OP_EQ_uxn_opcodes_h_l1220_c6_ef16_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1237_l1241_DUPLICATE_8511 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1237_l1241_DUPLICATE_8511_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1228_c11_aa3f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1228_c11_aa3f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c11_aa3f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1228_c11_aa3f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c11_aa3f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c11_aa3f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1228_c11_aa3f_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1234_l1238_l1229_l1242_DUPLICATE_e2f5 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1234_l1238_l1229_l1242_DUPLICATE_e2f5_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_2257_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_ef16_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1220_c2_cdb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_ef16_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_cdb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_ef16_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_cdb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_ef16_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_cdb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_ef16_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_cdb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_ef16_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_cdb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_ef16_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1220_c2_cdb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_ef16_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1220_c2_cdb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_ef16_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1225_c7_d8bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_0fad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_d8bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_0fad_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_d8bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_0fad_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_d8bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_0fad_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_d8bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_0fad_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_d8bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_0fad_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1225_c7_d8bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_0fad_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1225_c7_d8bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_0fad_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1228_c7_7234_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c11_aa3f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_7234_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c11_aa3f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_7234_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c11_aa3f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_7234_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c11_aa3f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_7234_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c11_aa3f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_7234_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c11_aa3f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1228_c7_7234_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c11_aa3f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1228_c7_7234_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c11_aa3f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1233_c7_275e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_ceee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_275e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_ceee_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_275e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_ceee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_275e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_ceee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_275e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_ceee_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_275e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_ceee_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1233_c7_275e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_ceee_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1233_c7_275e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_ceee_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1237_c7_40c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_9d79_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_40c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_9d79_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_40c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_9d79_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_40c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_9d79_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_40c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_9d79_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_40c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_9d79_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1237_c7_40c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_9d79_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1241_c7_f3a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_495c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_f3a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_495c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_f3a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_495c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_f3a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_495c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_f3a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_495c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_f3a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_495c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1241_c7_f3a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_495c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_0023_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_0abc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_0023_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_0abc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_0023_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_0abc_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1234_c3_6cc9_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1234_l1238_l1229_l1242_DUPLICATE_e2f5_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1242_c3_5c84_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1234_l1238_l1229_l1242_DUPLICATE_e2f5_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1239_l1230_DUPLICATE_c71d_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1234_l1238_l1229_l1242_DUPLICATE_e2f5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_cdb8_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1237_l1233_l1228_l1225_l1220_l1241_DUPLICATE_1714_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_d8bf_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1237_l1233_l1228_l1225_l1220_l1241_DUPLICATE_1714_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_7234_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1237_l1233_l1228_l1225_l1220_l1241_DUPLICATE_1714_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_275e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1237_l1233_l1228_l1225_l1220_l1241_DUPLICATE_1714_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_40c7_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1237_l1233_l1228_l1225_l1220_l1241_DUPLICATE_1714_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_f3a7_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1237_l1233_l1228_l1225_l1220_l1241_DUPLICATE_1714_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_d8bf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1237_l1233_l1228_l1225_l1249_l1241_DUPLICATE_5473_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_7234_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1237_l1233_l1228_l1225_l1249_l1241_DUPLICATE_5473_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_275e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1237_l1233_l1228_l1225_l1249_l1241_DUPLICATE_5473_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_40c7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1237_l1233_l1228_l1225_l1249_l1241_DUPLICATE_5473_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_f3a7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1237_l1233_l1228_l1225_l1249_l1241_DUPLICATE_5473_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_0023_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1237_l1233_l1228_l1225_l1249_l1241_DUPLICATE_5473_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_cdb8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1237_l1233_l1228_l1225_l1220_l1249_DUPLICATE_b71c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_d8bf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1237_l1233_l1228_l1225_l1220_l1249_DUPLICATE_b71c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_7234_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1237_l1233_l1228_l1225_l1220_l1249_DUPLICATE_b71c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_275e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1237_l1233_l1228_l1225_l1220_l1249_DUPLICATE_b71c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_40c7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1237_l1233_l1228_l1225_l1220_l1249_DUPLICATE_b71c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_0023_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1237_l1233_l1228_l1225_l1220_l1249_DUPLICATE_b71c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_cdb8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1237_l1233_l1228_l1225_l1220_l1249_DUPLICATE_c116_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_d8bf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1237_l1233_l1228_l1225_l1220_l1249_DUPLICATE_c116_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_7234_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1237_l1233_l1228_l1225_l1220_l1249_DUPLICATE_c116_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_275e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1237_l1233_l1228_l1225_l1220_l1249_DUPLICATE_c116_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_40c7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1237_l1233_l1228_l1225_l1220_l1249_DUPLICATE_c116_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_0023_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1237_l1233_l1228_l1225_l1220_l1249_DUPLICATE_c116_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_40c7_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1237_l1241_DUPLICATE_8511_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_f3a7_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1237_l1241_DUPLICATE_8511_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1220_c2_cdb8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1237_l1233_l1228_l1225_l1220_l1241_DUPLICATE_c441_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1225_c7_d8bf_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1237_l1233_l1228_l1225_l1220_l1241_DUPLICATE_c441_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1228_c7_7234_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1237_l1233_l1228_l1225_l1220_l1241_DUPLICATE_c441_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1233_c7_275e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1237_l1233_l1228_l1225_l1220_l1241_DUPLICATE_c441_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1237_c7_40c7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1237_l1233_l1228_l1225_l1220_l1241_DUPLICATE_c441_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1241_c7_f3a7_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1237_l1233_l1228_l1225_l1220_l1241_DUPLICATE_c441_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_f3a7_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1244_c30_6b8f_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l1242_c3_5c84] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1242_c3_5c84_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1242_c3_5c84_left;
     BIN_OP_OR_uxn_opcodes_h_l1242_c3_5c84_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1242_c3_5c84_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1242_c3_5c84_return_output := BIN_OP_OR_uxn_opcodes_h_l1242_c3_5c84_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1241_c7_f3a7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_f3a7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_f3a7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_f3a7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_f3a7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_f3a7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_f3a7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_f3a7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_f3a7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1249_c7_0023] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_0023_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_0023_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_0023_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_0023_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_0023_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_0023_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_0023_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_0023_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1234_c3_6cc9] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1234_c3_6cc9_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1234_c3_6cc9_left;
     BIN_OP_OR_uxn_opcodes_h_l1234_c3_6cc9_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1234_c3_6cc9_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1234_c3_6cc9_return_output := BIN_OP_OR_uxn_opcodes_h_l1234_c3_6cc9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1241_c7_f3a7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_f3a7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_f3a7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_f3a7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_f3a7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_f3a7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_f3a7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_f3a7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_f3a7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1249_c7_0023] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_0023_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_0023_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_0023_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_0023_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_0023_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_0023_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_0023_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_0023_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1239_l1230_DUPLICATE_c71d LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1239_l1230_DUPLICATE_c71d_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1239_l1230_DUPLICATE_c71d_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1239_l1230_DUPLICATE_c71d_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1239_l1230_DUPLICATE_c71d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1220_c1_2257] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_2257_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_2257_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_2257_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_2257_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_2257_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_2257_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_2257_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_2257_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1249_c7_0023] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_0023_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_0023_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_0023_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_0023_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_0023_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_0023_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_0023_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_0023_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1233_c7_275e_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1234_c3_6cc9_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1247_c21_2b2a_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1242_c3_5c84_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1241_c7_f3a7_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1242_c3_5c84_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1237_c7_40c7_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1239_l1230_DUPLICATE_c71d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1228_c7_7234_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1239_l1230_DUPLICATE_c71d_return_output;
     VAR_printf_uxn_opcodes_h_l1221_c3_fceb_uxn_opcodes_h_l1221_c3_fceb_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_2257_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_f3a7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_0023_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_f3a7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_0023_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_f3a7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_0023_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_40c7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_f3a7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_40c7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_f3a7_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1241_c7_f3a7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_f3a7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_f3a7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_f3a7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_f3a7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_f3a7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_f3a7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_f3a7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_f3a7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1241_c7_f3a7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_f3a7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_f3a7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_f3a7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_f3a7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_f3a7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_f3a7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_f3a7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_f3a7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1241_c7_f3a7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_f3a7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_f3a7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_f3a7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_f3a7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_f3a7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_f3a7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_f3a7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_f3a7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1247_c21_2b2a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1247_c21_2b2a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1247_c21_2b2a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1247_c21_2b2a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1247_c21_2b2a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1247_c21_2b2a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1247_c21_2b2a_return_output;

     -- n16_MUX[uxn_opcodes_h_l1241_c7_f3a7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1241_c7_f3a7_cond <= VAR_n16_MUX_uxn_opcodes_h_l1241_c7_f3a7_cond;
     n16_MUX_uxn_opcodes_h_l1241_c7_f3a7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1241_c7_f3a7_iftrue;
     n16_MUX_uxn_opcodes_h_l1241_c7_f3a7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1241_c7_f3a7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1241_c7_f3a7_return_output := n16_MUX_uxn_opcodes_h_l1241_c7_f3a7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1237_c7_40c7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_40c7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_40c7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_40c7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_40c7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_40c7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_40c7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_40c7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_40c7_return_output;

     -- printf_uxn_opcodes_h_l1221_c3_fceb[uxn_opcodes_h_l1221_c3_fceb] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1221_c3_fceb_uxn_opcodes_h_l1221_c3_fceb_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1221_c3_fceb_uxn_opcodes_h_l1221_c3_fceb_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1237_c7_40c7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_40c7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_40c7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_40c7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_40c7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_40c7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_40c7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_40c7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_40c7_return_output;

     -- t16_MUX[uxn_opcodes_h_l1233_c7_275e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1233_c7_275e_cond <= VAR_t16_MUX_uxn_opcodes_h_l1233_c7_275e_cond;
     t16_MUX_uxn_opcodes_h_l1233_c7_275e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1233_c7_275e_iftrue;
     t16_MUX_uxn_opcodes_h_l1233_c7_275e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1233_c7_275e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1233_c7_275e_return_output := t16_MUX_uxn_opcodes_h_l1233_c7_275e_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1247_c21_181e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1247_c21_2b2a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1237_c7_40c7_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1241_c7_f3a7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_40c7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_f3a7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_40c7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_f3a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_40c7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_f3a7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_275e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_40c7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_275e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_40c7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1228_c7_7234_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1233_c7_275e_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1237_c7_40c7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_40c7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_40c7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_40c7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_40c7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_40c7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_40c7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_40c7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_40c7_return_output;

     -- t16_MUX[uxn_opcodes_h_l1228_c7_7234] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1228_c7_7234_cond <= VAR_t16_MUX_uxn_opcodes_h_l1228_c7_7234_cond;
     t16_MUX_uxn_opcodes_h_l1228_c7_7234_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1228_c7_7234_iftrue;
     t16_MUX_uxn_opcodes_h_l1228_c7_7234_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1228_c7_7234_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1228_c7_7234_return_output := t16_MUX_uxn_opcodes_h_l1228_c7_7234_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1233_c7_275e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_275e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_275e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_275e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_275e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_275e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_275e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_275e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_275e_return_output;

     -- n16_MUX[uxn_opcodes_h_l1237_c7_40c7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1237_c7_40c7_cond <= VAR_n16_MUX_uxn_opcodes_h_l1237_c7_40c7_cond;
     n16_MUX_uxn_opcodes_h_l1237_c7_40c7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1237_c7_40c7_iftrue;
     n16_MUX_uxn_opcodes_h_l1237_c7_40c7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1237_c7_40c7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1237_c7_40c7_return_output := n16_MUX_uxn_opcodes_h_l1237_c7_40c7_return_output;

     -- MUX[uxn_opcodes_h_l1247_c21_181e] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1247_c21_181e_cond <= VAR_MUX_uxn_opcodes_h_l1247_c21_181e_cond;
     MUX_uxn_opcodes_h_l1247_c21_181e_iftrue <= VAR_MUX_uxn_opcodes_h_l1247_c21_181e_iftrue;
     MUX_uxn_opcodes_h_l1247_c21_181e_iffalse <= VAR_MUX_uxn_opcodes_h_l1247_c21_181e_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1247_c21_181e_return_output := MUX_uxn_opcodes_h_l1247_c21_181e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1237_c7_40c7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_40c7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_40c7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_40c7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_40c7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_40c7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_40c7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_40c7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_40c7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1237_c7_40c7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_40c7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_40c7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_40c7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_40c7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_40c7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_40c7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_40c7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_40c7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1233_c7_275e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_275e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_275e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_275e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_275e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_275e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_275e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_275e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_275e_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1241_c7_f3a7_iftrue := VAR_MUX_uxn_opcodes_h_l1247_c21_181e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1233_c7_275e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1237_c7_40c7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_275e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_40c7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_275e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_40c7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_275e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_40c7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_7234_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_275e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_7234_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_275e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1225_c7_d8bf_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1228_c7_7234_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1241_c7_f3a7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1241_c7_f3a7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1241_c7_f3a7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1241_c7_f3a7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1241_c7_f3a7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1241_c7_f3a7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1241_c7_f3a7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1241_c7_f3a7_return_output := result_u8_value_MUX_uxn_opcodes_h_l1241_c7_f3a7_return_output;

     -- n16_MUX[uxn_opcodes_h_l1233_c7_275e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1233_c7_275e_cond <= VAR_n16_MUX_uxn_opcodes_h_l1233_c7_275e_cond;
     n16_MUX_uxn_opcodes_h_l1233_c7_275e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1233_c7_275e_iftrue;
     n16_MUX_uxn_opcodes_h_l1233_c7_275e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1233_c7_275e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1233_c7_275e_return_output := n16_MUX_uxn_opcodes_h_l1233_c7_275e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1233_c7_275e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_275e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_275e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_275e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_275e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_275e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_275e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_275e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_275e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1233_c7_275e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_275e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_275e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_275e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_275e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_275e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_275e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_275e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_275e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1228_c7_7234] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_7234_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_7234_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_7234_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_7234_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_7234_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_7234_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_7234_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_7234_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1228_c7_7234] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_7234_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_7234_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_7234_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_7234_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_7234_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_7234_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_7234_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_7234_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1233_c7_275e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_275e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_275e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_275e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_275e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_275e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_275e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_275e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_275e_return_output;

     -- t16_MUX[uxn_opcodes_h_l1225_c7_d8bf] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1225_c7_d8bf_cond <= VAR_t16_MUX_uxn_opcodes_h_l1225_c7_d8bf_cond;
     t16_MUX_uxn_opcodes_h_l1225_c7_d8bf_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1225_c7_d8bf_iftrue;
     t16_MUX_uxn_opcodes_h_l1225_c7_d8bf_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1225_c7_d8bf_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1225_c7_d8bf_return_output := t16_MUX_uxn_opcodes_h_l1225_c7_d8bf_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1228_c7_7234_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1233_c7_275e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_7234_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_275e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_7234_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_275e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_7234_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_275e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_d8bf_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_7234_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_d8bf_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_7234_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1237_c7_40c7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1241_c7_f3a7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1220_c2_cdb8_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1225_c7_d8bf_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1225_c7_d8bf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_d8bf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_d8bf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_d8bf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_d8bf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_d8bf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_d8bf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_d8bf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_d8bf_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1228_c7_7234] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_7234_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_7234_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_7234_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_7234_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_7234_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_7234_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_7234_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_7234_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1228_c7_7234] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_7234_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_7234_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_7234_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_7234_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_7234_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_7234_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_7234_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_7234_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1225_c7_d8bf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_d8bf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_d8bf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_d8bf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_d8bf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_d8bf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_d8bf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_d8bf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_d8bf_return_output;

     -- t16_MUX[uxn_opcodes_h_l1220_c2_cdb8] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1220_c2_cdb8_cond <= VAR_t16_MUX_uxn_opcodes_h_l1220_c2_cdb8_cond;
     t16_MUX_uxn_opcodes_h_l1220_c2_cdb8_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1220_c2_cdb8_iftrue;
     t16_MUX_uxn_opcodes_h_l1220_c2_cdb8_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1220_c2_cdb8_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1220_c2_cdb8_return_output := t16_MUX_uxn_opcodes_h_l1220_c2_cdb8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1237_c7_40c7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1237_c7_40c7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1237_c7_40c7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1237_c7_40c7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1237_c7_40c7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1237_c7_40c7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1237_c7_40c7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1237_c7_40c7_return_output := result_u8_value_MUX_uxn_opcodes_h_l1237_c7_40c7_return_output;

     -- n16_MUX[uxn_opcodes_h_l1228_c7_7234] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1228_c7_7234_cond <= VAR_n16_MUX_uxn_opcodes_h_l1228_c7_7234_cond;
     n16_MUX_uxn_opcodes_h_l1228_c7_7234_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1228_c7_7234_iftrue;
     n16_MUX_uxn_opcodes_h_l1228_c7_7234_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1228_c7_7234_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1228_c7_7234_return_output := n16_MUX_uxn_opcodes_h_l1228_c7_7234_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1228_c7_7234] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_7234_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_7234_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_7234_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_7234_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_7234_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_7234_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_7234_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_7234_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1225_c7_d8bf_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1228_c7_7234_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_d8bf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_7234_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_d8bf_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_7234_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_d8bf_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_7234_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_cdb8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_d8bf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_cdb8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_d8bf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1233_c7_275e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1237_c7_40c7_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1220_c2_cdb8_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1225_c7_d8bf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_d8bf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_d8bf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_d8bf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_d8bf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_d8bf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_d8bf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_d8bf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_d8bf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1225_c7_d8bf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_d8bf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_d8bf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_d8bf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_d8bf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_d8bf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_d8bf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_d8bf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_d8bf_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1220_c2_cdb8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_cdb8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_cdb8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_cdb8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_cdb8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_cdb8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_cdb8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_cdb8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_cdb8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1225_c7_d8bf] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_d8bf_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_d8bf_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_d8bf_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_d8bf_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_d8bf_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_d8bf_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_d8bf_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_d8bf_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1233_c7_275e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1233_c7_275e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1233_c7_275e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1233_c7_275e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1233_c7_275e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1233_c7_275e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1233_c7_275e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1233_c7_275e_return_output := result_u8_value_MUX_uxn_opcodes_h_l1233_c7_275e_return_output;

     -- n16_MUX[uxn_opcodes_h_l1225_c7_d8bf] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1225_c7_d8bf_cond <= VAR_n16_MUX_uxn_opcodes_h_l1225_c7_d8bf_cond;
     n16_MUX_uxn_opcodes_h_l1225_c7_d8bf_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1225_c7_d8bf_iftrue;
     n16_MUX_uxn_opcodes_h_l1225_c7_d8bf_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1225_c7_d8bf_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1225_c7_d8bf_return_output := n16_MUX_uxn_opcodes_h_l1225_c7_d8bf_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1220_c2_cdb8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_cdb8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_cdb8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_cdb8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_cdb8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_cdb8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_cdb8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_cdb8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_cdb8_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1220_c2_cdb8_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1225_c7_d8bf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_cdb8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_d8bf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_cdb8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_d8bf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_cdb8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_d8bf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1228_c7_7234_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1233_c7_275e_return_output;
     -- n16_MUX[uxn_opcodes_h_l1220_c2_cdb8] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1220_c2_cdb8_cond <= VAR_n16_MUX_uxn_opcodes_h_l1220_c2_cdb8_cond;
     n16_MUX_uxn_opcodes_h_l1220_c2_cdb8_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1220_c2_cdb8_iftrue;
     n16_MUX_uxn_opcodes_h_l1220_c2_cdb8_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1220_c2_cdb8_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1220_c2_cdb8_return_output := n16_MUX_uxn_opcodes_h_l1220_c2_cdb8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1228_c7_7234] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1228_c7_7234_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1228_c7_7234_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1228_c7_7234_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1228_c7_7234_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1228_c7_7234_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1228_c7_7234_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1228_c7_7234_return_output := result_u8_value_MUX_uxn_opcodes_h_l1228_c7_7234_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1220_c2_cdb8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_cdb8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_cdb8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_cdb8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_cdb8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_cdb8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_cdb8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_cdb8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_cdb8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1220_c2_cdb8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_cdb8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_cdb8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_cdb8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_cdb8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_cdb8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_cdb8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_cdb8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_cdb8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1220_c2_cdb8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_cdb8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_cdb8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_cdb8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_cdb8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_cdb8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_cdb8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_cdb8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_cdb8_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1220_c2_cdb8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1225_c7_d8bf_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1228_c7_7234_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1225_c7_d8bf] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1225_c7_d8bf_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1225_c7_d8bf_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1225_c7_d8bf_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1225_c7_d8bf_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1225_c7_d8bf_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1225_c7_d8bf_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1225_c7_d8bf_return_output := result_u8_value_MUX_uxn_opcodes_h_l1225_c7_d8bf_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1220_c2_cdb8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1225_c7_d8bf_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1220_c2_cdb8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1220_c2_cdb8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1220_c2_cdb8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1220_c2_cdb8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1220_c2_cdb8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1220_c2_cdb8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1220_c2_cdb8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1220_c2_cdb8_return_output := result_u8_value_MUX_uxn_opcodes_h_l1220_c2_cdb8_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l1255_l1216_DUPLICATE_d903 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l1255_l1216_DUPLICATE_d903_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1220_c2_cdb8_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_cdb8_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_cdb8_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_cdb8_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_cdb8_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_cdb8_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l1255_l1216_DUPLICATE_d903_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l1255_l1216_DUPLICATE_d903_return_output;
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
