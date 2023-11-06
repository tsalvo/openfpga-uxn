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
entity equ2_0CLK_302e9520 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end equ2_0CLK_302e9520;
architecture arch of equ2_0CLK_302e9520 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1146_c6_ebd6]
signal BIN_OP_EQ_uxn_opcodes_h_l1146_c6_ebd6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1146_c6_ebd6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1146_c6_ebd6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1146_c1_446a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_446a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_446a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_446a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_446a_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1146_c2_92d2]
signal n16_MUX_uxn_opcodes_h_l1146_c2_92d2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1146_c2_92d2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1146_c2_92d2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1146_c2_92d2_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1146_c2_92d2]
signal result_u8_value_MUX_uxn_opcodes_h_l1146_c2_92d2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1146_c2_92d2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1146_c2_92d2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1146_c2_92d2_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1146_c2_92d2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_92d2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_92d2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_92d2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_92d2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1146_c2_92d2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_92d2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_92d2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_92d2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_92d2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1146_c2_92d2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_92d2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_92d2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_92d2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_92d2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1146_c2_92d2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_92d2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_92d2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_92d2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_92d2_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1146_c2_92d2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_92d2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_92d2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_92d2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_92d2_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1146_c2_92d2]
signal t16_MUX_uxn_opcodes_h_l1146_c2_92d2_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1146_c2_92d2_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1146_c2_92d2_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1146_c2_92d2_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1147_c3_2777[uxn_opcodes_h_l1147_c3_2777]
signal printf_uxn_opcodes_h_l1147_c3_2777_uxn_opcodes_h_l1147_c3_2777_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1151_c11_8858]
signal BIN_OP_EQ_uxn_opcodes_h_l1151_c11_8858_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1151_c11_8858_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1151_c11_8858_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1151_c7_e09d]
signal n16_MUX_uxn_opcodes_h_l1151_c7_e09d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1151_c7_e09d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1151_c7_e09d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1151_c7_e09d_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1151_c7_e09d]
signal result_u8_value_MUX_uxn_opcodes_h_l1151_c7_e09d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1151_c7_e09d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1151_c7_e09d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1151_c7_e09d_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1151_c7_e09d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_e09d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_e09d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_e09d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_e09d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1151_c7_e09d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_e09d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_e09d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_e09d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_e09d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1151_c7_e09d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_e09d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_e09d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_e09d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_e09d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1151_c7_e09d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_e09d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_e09d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_e09d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_e09d_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1151_c7_e09d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_e09d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_e09d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_e09d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_e09d_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1151_c7_e09d]
signal t16_MUX_uxn_opcodes_h_l1151_c7_e09d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1151_c7_e09d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1151_c7_e09d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1151_c7_e09d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1154_c11_8d33]
signal BIN_OP_EQ_uxn_opcodes_h_l1154_c11_8d33_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1154_c11_8d33_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1154_c11_8d33_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1154_c7_89a6]
signal n16_MUX_uxn_opcodes_h_l1154_c7_89a6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1154_c7_89a6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1154_c7_89a6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1154_c7_89a6_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1154_c7_89a6]
signal result_u8_value_MUX_uxn_opcodes_h_l1154_c7_89a6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1154_c7_89a6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1154_c7_89a6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1154_c7_89a6_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1154_c7_89a6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_89a6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_89a6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_89a6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_89a6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1154_c7_89a6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_89a6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_89a6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_89a6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_89a6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1154_c7_89a6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_89a6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_89a6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_89a6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_89a6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1154_c7_89a6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_89a6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_89a6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_89a6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_89a6_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1154_c7_89a6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_89a6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_89a6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_89a6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_89a6_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1154_c7_89a6]
signal t16_MUX_uxn_opcodes_h_l1154_c7_89a6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1154_c7_89a6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1154_c7_89a6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1154_c7_89a6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1159_c11_a811]
signal BIN_OP_EQ_uxn_opcodes_h_l1159_c11_a811_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1159_c11_a811_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1159_c11_a811_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1159_c7_66b4]
signal n16_MUX_uxn_opcodes_h_l1159_c7_66b4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1159_c7_66b4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1159_c7_66b4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1159_c7_66b4_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1159_c7_66b4]
signal result_u8_value_MUX_uxn_opcodes_h_l1159_c7_66b4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1159_c7_66b4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1159_c7_66b4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1159_c7_66b4_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1159_c7_66b4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_66b4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_66b4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_66b4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_66b4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1159_c7_66b4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_66b4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_66b4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_66b4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_66b4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1159_c7_66b4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_66b4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_66b4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_66b4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_66b4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1159_c7_66b4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_66b4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_66b4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_66b4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_66b4_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1159_c7_66b4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_66b4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_66b4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_66b4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_66b4_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1159_c7_66b4]
signal t16_MUX_uxn_opcodes_h_l1159_c7_66b4_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1159_c7_66b4_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1159_c7_66b4_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1159_c7_66b4_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1160_c3_93e3]
signal BIN_OP_OR_uxn_opcodes_h_l1160_c3_93e3_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1160_c3_93e3_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1160_c3_93e3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1163_c11_406d]
signal BIN_OP_EQ_uxn_opcodes_h_l1163_c11_406d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1163_c11_406d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1163_c11_406d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1163_c7_4e06]
signal n16_MUX_uxn_opcodes_h_l1163_c7_4e06_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1163_c7_4e06_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1163_c7_4e06_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1163_c7_4e06_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1163_c7_4e06]
signal result_u8_value_MUX_uxn_opcodes_h_l1163_c7_4e06_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1163_c7_4e06_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1163_c7_4e06_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1163_c7_4e06_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1163_c7_4e06]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_4e06_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_4e06_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_4e06_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_4e06_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1163_c7_4e06]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_4e06_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_4e06_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_4e06_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_4e06_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1163_c7_4e06]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_4e06_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_4e06_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_4e06_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_4e06_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1163_c7_4e06]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_4e06_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_4e06_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_4e06_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_4e06_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1163_c7_4e06]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_4e06_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_4e06_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_4e06_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_4e06_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1167_c11_5512]
signal BIN_OP_EQ_uxn_opcodes_h_l1167_c11_5512_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1167_c11_5512_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1167_c11_5512_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1167_c7_515a]
signal n16_MUX_uxn_opcodes_h_l1167_c7_515a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1167_c7_515a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1167_c7_515a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1167_c7_515a_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1167_c7_515a]
signal result_u8_value_MUX_uxn_opcodes_h_l1167_c7_515a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1167_c7_515a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1167_c7_515a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1167_c7_515a_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1167_c7_515a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_515a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_515a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_515a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_515a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1167_c7_515a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_515a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_515a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_515a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_515a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1167_c7_515a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_515a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_515a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_515a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_515a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1167_c7_515a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_515a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_515a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_515a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_515a_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1167_c7_515a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_515a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_515a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_515a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_515a_return_output : signed(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1168_c3_b5ed]
signal BIN_OP_OR_uxn_opcodes_h_l1168_c3_b5ed_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1168_c3_b5ed_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1168_c3_b5ed_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1170_c30_baeb]
signal sp_relative_shift_uxn_opcodes_h_l1170_c30_baeb_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1170_c30_baeb_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1170_c30_baeb_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1170_c30_baeb_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1173_c21_1431]
signal BIN_OP_EQ_uxn_opcodes_h_l1173_c21_1431_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1173_c21_1431_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1173_c21_1431_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1173_c21_026a]
signal MUX_uxn_opcodes_h_l1173_c21_026a_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1173_c21_026a_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1173_c21_026a_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1173_c21_026a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1175_c11_d15c]
signal BIN_OP_EQ_uxn_opcodes_h_l1175_c11_d15c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1175_c11_d15c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1175_c11_d15c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1175_c7_92bb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_92bb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_92bb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_92bb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_92bb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1175_c7_92bb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_92bb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_92bb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_92bb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_92bb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1175_c7_92bb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_92bb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_92bb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_92bb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_92bb_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1156_l1165_DUPLICATE_d5af
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1156_l1165_DUPLICATE_d5af_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1156_l1165_DUPLICATE_d5af_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1146_c6_ebd6
BIN_OP_EQ_uxn_opcodes_h_l1146_c6_ebd6 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1146_c6_ebd6_left,
BIN_OP_EQ_uxn_opcodes_h_l1146_c6_ebd6_right,
BIN_OP_EQ_uxn_opcodes_h_l1146_c6_ebd6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_446a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_446a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_446a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_446a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_446a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_446a_return_output);

-- n16_MUX_uxn_opcodes_h_l1146_c2_92d2
n16_MUX_uxn_opcodes_h_l1146_c2_92d2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1146_c2_92d2_cond,
n16_MUX_uxn_opcodes_h_l1146_c2_92d2_iftrue,
n16_MUX_uxn_opcodes_h_l1146_c2_92d2_iffalse,
n16_MUX_uxn_opcodes_h_l1146_c2_92d2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1146_c2_92d2
result_u8_value_MUX_uxn_opcodes_h_l1146_c2_92d2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1146_c2_92d2_cond,
result_u8_value_MUX_uxn_opcodes_h_l1146_c2_92d2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1146_c2_92d2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1146_c2_92d2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_92d2
result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_92d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_92d2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_92d2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_92d2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_92d2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_92d2
result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_92d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_92d2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_92d2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_92d2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_92d2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_92d2
result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_92d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_92d2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_92d2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_92d2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_92d2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_92d2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_92d2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_92d2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_92d2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_92d2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_92d2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_92d2
result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_92d2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_92d2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_92d2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_92d2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_92d2_return_output);

-- t16_MUX_uxn_opcodes_h_l1146_c2_92d2
t16_MUX_uxn_opcodes_h_l1146_c2_92d2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1146_c2_92d2_cond,
t16_MUX_uxn_opcodes_h_l1146_c2_92d2_iftrue,
t16_MUX_uxn_opcodes_h_l1146_c2_92d2_iffalse,
t16_MUX_uxn_opcodes_h_l1146_c2_92d2_return_output);

-- printf_uxn_opcodes_h_l1147_c3_2777_uxn_opcodes_h_l1147_c3_2777
printf_uxn_opcodes_h_l1147_c3_2777_uxn_opcodes_h_l1147_c3_2777 : entity work.printf_uxn_opcodes_h_l1147_c3_2777_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1147_c3_2777_uxn_opcodes_h_l1147_c3_2777_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1151_c11_8858
BIN_OP_EQ_uxn_opcodes_h_l1151_c11_8858 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1151_c11_8858_left,
BIN_OP_EQ_uxn_opcodes_h_l1151_c11_8858_right,
BIN_OP_EQ_uxn_opcodes_h_l1151_c11_8858_return_output);

-- n16_MUX_uxn_opcodes_h_l1151_c7_e09d
n16_MUX_uxn_opcodes_h_l1151_c7_e09d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1151_c7_e09d_cond,
n16_MUX_uxn_opcodes_h_l1151_c7_e09d_iftrue,
n16_MUX_uxn_opcodes_h_l1151_c7_e09d_iffalse,
n16_MUX_uxn_opcodes_h_l1151_c7_e09d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1151_c7_e09d
result_u8_value_MUX_uxn_opcodes_h_l1151_c7_e09d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1151_c7_e09d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1151_c7_e09d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1151_c7_e09d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1151_c7_e09d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_e09d
result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_e09d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_e09d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_e09d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_e09d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_e09d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_e09d
result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_e09d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_e09d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_e09d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_e09d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_e09d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_e09d
result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_e09d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_e09d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_e09d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_e09d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_e09d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_e09d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_e09d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_e09d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_e09d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_e09d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_e09d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_e09d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_e09d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_e09d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_e09d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_e09d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_e09d_return_output);

-- t16_MUX_uxn_opcodes_h_l1151_c7_e09d
t16_MUX_uxn_opcodes_h_l1151_c7_e09d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1151_c7_e09d_cond,
t16_MUX_uxn_opcodes_h_l1151_c7_e09d_iftrue,
t16_MUX_uxn_opcodes_h_l1151_c7_e09d_iffalse,
t16_MUX_uxn_opcodes_h_l1151_c7_e09d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1154_c11_8d33
BIN_OP_EQ_uxn_opcodes_h_l1154_c11_8d33 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1154_c11_8d33_left,
BIN_OP_EQ_uxn_opcodes_h_l1154_c11_8d33_right,
BIN_OP_EQ_uxn_opcodes_h_l1154_c11_8d33_return_output);

-- n16_MUX_uxn_opcodes_h_l1154_c7_89a6
n16_MUX_uxn_opcodes_h_l1154_c7_89a6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1154_c7_89a6_cond,
n16_MUX_uxn_opcodes_h_l1154_c7_89a6_iftrue,
n16_MUX_uxn_opcodes_h_l1154_c7_89a6_iffalse,
n16_MUX_uxn_opcodes_h_l1154_c7_89a6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1154_c7_89a6
result_u8_value_MUX_uxn_opcodes_h_l1154_c7_89a6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1154_c7_89a6_cond,
result_u8_value_MUX_uxn_opcodes_h_l1154_c7_89a6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1154_c7_89a6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1154_c7_89a6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_89a6
result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_89a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_89a6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_89a6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_89a6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_89a6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_89a6
result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_89a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_89a6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_89a6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_89a6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_89a6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_89a6
result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_89a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_89a6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_89a6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_89a6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_89a6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_89a6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_89a6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_89a6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_89a6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_89a6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_89a6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_89a6
result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_89a6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_89a6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_89a6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_89a6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_89a6_return_output);

-- t16_MUX_uxn_opcodes_h_l1154_c7_89a6
t16_MUX_uxn_opcodes_h_l1154_c7_89a6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1154_c7_89a6_cond,
t16_MUX_uxn_opcodes_h_l1154_c7_89a6_iftrue,
t16_MUX_uxn_opcodes_h_l1154_c7_89a6_iffalse,
t16_MUX_uxn_opcodes_h_l1154_c7_89a6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1159_c11_a811
BIN_OP_EQ_uxn_opcodes_h_l1159_c11_a811 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1159_c11_a811_left,
BIN_OP_EQ_uxn_opcodes_h_l1159_c11_a811_right,
BIN_OP_EQ_uxn_opcodes_h_l1159_c11_a811_return_output);

-- n16_MUX_uxn_opcodes_h_l1159_c7_66b4
n16_MUX_uxn_opcodes_h_l1159_c7_66b4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1159_c7_66b4_cond,
n16_MUX_uxn_opcodes_h_l1159_c7_66b4_iftrue,
n16_MUX_uxn_opcodes_h_l1159_c7_66b4_iffalse,
n16_MUX_uxn_opcodes_h_l1159_c7_66b4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1159_c7_66b4
result_u8_value_MUX_uxn_opcodes_h_l1159_c7_66b4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1159_c7_66b4_cond,
result_u8_value_MUX_uxn_opcodes_h_l1159_c7_66b4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1159_c7_66b4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1159_c7_66b4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_66b4
result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_66b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_66b4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_66b4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_66b4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_66b4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_66b4
result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_66b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_66b4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_66b4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_66b4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_66b4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_66b4
result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_66b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_66b4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_66b4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_66b4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_66b4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_66b4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_66b4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_66b4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_66b4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_66b4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_66b4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_66b4
result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_66b4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_66b4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_66b4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_66b4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_66b4_return_output);

-- t16_MUX_uxn_opcodes_h_l1159_c7_66b4
t16_MUX_uxn_opcodes_h_l1159_c7_66b4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1159_c7_66b4_cond,
t16_MUX_uxn_opcodes_h_l1159_c7_66b4_iftrue,
t16_MUX_uxn_opcodes_h_l1159_c7_66b4_iffalse,
t16_MUX_uxn_opcodes_h_l1159_c7_66b4_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1160_c3_93e3
BIN_OP_OR_uxn_opcodes_h_l1160_c3_93e3 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1160_c3_93e3_left,
BIN_OP_OR_uxn_opcodes_h_l1160_c3_93e3_right,
BIN_OP_OR_uxn_opcodes_h_l1160_c3_93e3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1163_c11_406d
BIN_OP_EQ_uxn_opcodes_h_l1163_c11_406d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1163_c11_406d_left,
BIN_OP_EQ_uxn_opcodes_h_l1163_c11_406d_right,
BIN_OP_EQ_uxn_opcodes_h_l1163_c11_406d_return_output);

-- n16_MUX_uxn_opcodes_h_l1163_c7_4e06
n16_MUX_uxn_opcodes_h_l1163_c7_4e06 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1163_c7_4e06_cond,
n16_MUX_uxn_opcodes_h_l1163_c7_4e06_iftrue,
n16_MUX_uxn_opcodes_h_l1163_c7_4e06_iffalse,
n16_MUX_uxn_opcodes_h_l1163_c7_4e06_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1163_c7_4e06
result_u8_value_MUX_uxn_opcodes_h_l1163_c7_4e06 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1163_c7_4e06_cond,
result_u8_value_MUX_uxn_opcodes_h_l1163_c7_4e06_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1163_c7_4e06_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1163_c7_4e06_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_4e06
result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_4e06 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_4e06_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_4e06_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_4e06_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_4e06_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_4e06
result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_4e06 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_4e06_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_4e06_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_4e06_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_4e06_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_4e06
result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_4e06 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_4e06_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_4e06_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_4e06_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_4e06_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_4e06
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_4e06 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_4e06_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_4e06_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_4e06_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_4e06_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_4e06
result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_4e06 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_4e06_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_4e06_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_4e06_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_4e06_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1167_c11_5512
BIN_OP_EQ_uxn_opcodes_h_l1167_c11_5512 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1167_c11_5512_left,
BIN_OP_EQ_uxn_opcodes_h_l1167_c11_5512_right,
BIN_OP_EQ_uxn_opcodes_h_l1167_c11_5512_return_output);

-- n16_MUX_uxn_opcodes_h_l1167_c7_515a
n16_MUX_uxn_opcodes_h_l1167_c7_515a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1167_c7_515a_cond,
n16_MUX_uxn_opcodes_h_l1167_c7_515a_iftrue,
n16_MUX_uxn_opcodes_h_l1167_c7_515a_iffalse,
n16_MUX_uxn_opcodes_h_l1167_c7_515a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1167_c7_515a
result_u8_value_MUX_uxn_opcodes_h_l1167_c7_515a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1167_c7_515a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1167_c7_515a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1167_c7_515a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1167_c7_515a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_515a
result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_515a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_515a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_515a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_515a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_515a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_515a
result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_515a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_515a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_515a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_515a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_515a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_515a
result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_515a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_515a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_515a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_515a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_515a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_515a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_515a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_515a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_515a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_515a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_515a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_515a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_515a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_515a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_515a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_515a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_515a_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1168_c3_b5ed
BIN_OP_OR_uxn_opcodes_h_l1168_c3_b5ed : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1168_c3_b5ed_left,
BIN_OP_OR_uxn_opcodes_h_l1168_c3_b5ed_right,
BIN_OP_OR_uxn_opcodes_h_l1168_c3_b5ed_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1170_c30_baeb
sp_relative_shift_uxn_opcodes_h_l1170_c30_baeb : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1170_c30_baeb_ins,
sp_relative_shift_uxn_opcodes_h_l1170_c30_baeb_x,
sp_relative_shift_uxn_opcodes_h_l1170_c30_baeb_y,
sp_relative_shift_uxn_opcodes_h_l1170_c30_baeb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1173_c21_1431
BIN_OP_EQ_uxn_opcodes_h_l1173_c21_1431 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1173_c21_1431_left,
BIN_OP_EQ_uxn_opcodes_h_l1173_c21_1431_right,
BIN_OP_EQ_uxn_opcodes_h_l1173_c21_1431_return_output);

-- MUX_uxn_opcodes_h_l1173_c21_026a
MUX_uxn_opcodes_h_l1173_c21_026a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1173_c21_026a_cond,
MUX_uxn_opcodes_h_l1173_c21_026a_iftrue,
MUX_uxn_opcodes_h_l1173_c21_026a_iffalse,
MUX_uxn_opcodes_h_l1173_c21_026a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1175_c11_d15c
BIN_OP_EQ_uxn_opcodes_h_l1175_c11_d15c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1175_c11_d15c_left,
BIN_OP_EQ_uxn_opcodes_h_l1175_c11_d15c_right,
BIN_OP_EQ_uxn_opcodes_h_l1175_c11_d15c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_92bb
result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_92bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_92bb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_92bb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_92bb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_92bb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_92bb
result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_92bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_92bb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_92bb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_92bb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_92bb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_92bb
result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_92bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_92bb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_92bb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_92bb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_92bb_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1156_l1165_DUPLICATE_d5af
CONST_SL_8_uint16_t_uxn_opcodes_h_l1156_l1165_DUPLICATE_d5af : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1156_l1165_DUPLICATE_d5af_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1156_l1165_DUPLICATE_d5af_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1146_c6_ebd6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_446a_return_output,
 n16_MUX_uxn_opcodes_h_l1146_c2_92d2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1146_c2_92d2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_92d2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_92d2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_92d2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_92d2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_92d2_return_output,
 t16_MUX_uxn_opcodes_h_l1146_c2_92d2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1151_c11_8858_return_output,
 n16_MUX_uxn_opcodes_h_l1151_c7_e09d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1151_c7_e09d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_e09d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_e09d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_e09d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_e09d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_e09d_return_output,
 t16_MUX_uxn_opcodes_h_l1151_c7_e09d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1154_c11_8d33_return_output,
 n16_MUX_uxn_opcodes_h_l1154_c7_89a6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1154_c7_89a6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_89a6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_89a6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_89a6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_89a6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_89a6_return_output,
 t16_MUX_uxn_opcodes_h_l1154_c7_89a6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1159_c11_a811_return_output,
 n16_MUX_uxn_opcodes_h_l1159_c7_66b4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1159_c7_66b4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_66b4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_66b4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_66b4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_66b4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_66b4_return_output,
 t16_MUX_uxn_opcodes_h_l1159_c7_66b4_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1160_c3_93e3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1163_c11_406d_return_output,
 n16_MUX_uxn_opcodes_h_l1163_c7_4e06_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1163_c7_4e06_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_4e06_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_4e06_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_4e06_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_4e06_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_4e06_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1167_c11_5512_return_output,
 n16_MUX_uxn_opcodes_h_l1167_c7_515a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1167_c7_515a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_515a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_515a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_515a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_515a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_515a_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1168_c3_b5ed_return_output,
 sp_relative_shift_uxn_opcodes_h_l1170_c30_baeb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1173_c21_1431_return_output,
 MUX_uxn_opcodes_h_l1173_c21_026a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1175_c11_d15c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_92bb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_92bb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_92bb_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1156_l1165_DUPLICATE_d5af_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c6_ebd6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c6_ebd6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c6_ebd6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_446a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_446a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_446a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_446a_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1146_c2_92d2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1146_c2_92d2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1151_c7_e09d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1146_c2_92d2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1146_c2_92d2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1146_c2_92d2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1146_c2_92d2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1151_c7_e09d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1146_c2_92d2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1146_c2_92d2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_92d2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_92d2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_e09d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_92d2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_92d2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_92d2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_92d2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_e09d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_92d2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_92d2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_92d2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_92d2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_e09d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_92d2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_92d2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_92d2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1148_c3_820b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_92d2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_e09d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_92d2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_92d2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_92d2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_92d2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_e09d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_92d2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_92d2_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1146_c2_92d2_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1146_c2_92d2_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1151_c7_e09d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1146_c2_92d2_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1146_c2_92d2_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1147_c3_2777_uxn_opcodes_h_l1147_c3_2777_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_8858_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_8858_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_8858_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1151_c7_e09d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1151_c7_e09d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1154_c7_89a6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1151_c7_e09d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1151_c7_e09d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1151_c7_e09d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1154_c7_89a6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1151_c7_e09d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_e09d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_e09d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_89a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_e09d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_e09d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_e09d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_89a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_e09d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_e09d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_e09d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_89a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_e09d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_e09d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1152_c3_091d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_e09d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_89a6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_e09d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_e09d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_e09d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_89a6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_e09d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1151_c7_e09d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1151_c7_e09d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1154_c7_89a6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1151_c7_e09d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1154_c11_8d33_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1154_c11_8d33_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1154_c11_8d33_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1154_c7_89a6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1154_c7_89a6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1159_c7_66b4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1154_c7_89a6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1154_c7_89a6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1154_c7_89a6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1159_c7_66b4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1154_c7_89a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_89a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_89a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_66b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_89a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_89a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_89a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_66b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_89a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_89a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_89a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_66b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_89a6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_89a6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1157_c3_c989 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_89a6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_66b4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_89a6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_89a6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_89a6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_66b4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_89a6_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1154_c7_89a6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1154_c7_89a6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1159_c7_66b4_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1154_c7_89a6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_a811_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_a811_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_a811_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1159_c7_66b4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1159_c7_66b4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1163_c7_4e06_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1159_c7_66b4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1159_c7_66b4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1159_c7_66b4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1163_c7_4e06_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1159_c7_66b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_66b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_66b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_4e06_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_66b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_66b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_66b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_4e06_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_66b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_66b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_66b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_4e06_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_66b4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_66b4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1161_c3_74a0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_66b4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_4e06_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_66b4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_66b4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_66b4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_4e06_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_66b4_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1159_c7_66b4_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1159_c7_66b4_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1159_c7_66b4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1160_c3_93e3_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1160_c3_93e3_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1160_c3_93e3_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_406d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_406d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_406d_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1163_c7_4e06_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1163_c7_4e06_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1167_c7_515a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1163_c7_4e06_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1163_c7_4e06_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1163_c7_4e06_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1167_c7_515a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1163_c7_4e06_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_4e06_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_4e06_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_515a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_4e06_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_4e06_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_4e06_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_515a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_4e06_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_4e06_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_4e06_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_515a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_4e06_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_4e06_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_4e06_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_515a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_4e06_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_4e06_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_4e06_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_515a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_4e06_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_5512_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_5512_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_5512_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1167_c7_515a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1167_c7_515a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1167_c7_515a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1167_c7_515a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1167_c7_515a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1167_c7_515a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_515a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_515a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_92bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_515a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_515a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_515a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_92bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_515a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_515a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_515a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_92bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_515a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_515a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1172_c3_7516 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_515a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_515a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_515a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_515a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_515a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1168_c3_b5ed_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1168_c3_b5ed_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1168_c3_b5ed_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1170_c30_baeb_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1170_c30_baeb_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1170_c30_baeb_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1170_c30_baeb_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1173_c21_026a_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1173_c21_026a_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1173_c21_026a_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1173_c21_1431_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1173_c21_1431_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1173_c21_1431_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1173_c21_026a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1175_c11_d15c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1175_c11_d15c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1175_c11_d15c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_92bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_92bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_92bb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_92bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_92bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_92bb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_92bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_92bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_92bb_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1159_l1154_l1151_l1146_l1167_l1163_DUPLICATE_9935_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1159_l1154_l1151_l1146_l1175_l1163_DUPLICATE_024e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1159_l1154_l1151_l1146_l1175_l1163_DUPLICATE_1369_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1159_l1154_l1151_l1146_l1167_l1163_DUPLICATE_6722_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1159_l1154_l1151_l1175_l1167_l1163_DUPLICATE_da55_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1155_l1168_l1160_l1164_DUPLICATE_6e82_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1156_l1165_DUPLICATE_d5af_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1156_l1165_DUPLICATE_d5af_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1167_l1163_DUPLICATE_8dd7_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l1181_l1142_DUPLICATE_3641_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c6_ebd6_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1157_c3_c989 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_89a6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1157_c3_c989;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_446a_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1173_c21_026a_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_515a_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1175_c11_d15c_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_a811_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_5512_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_92d2_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1152_c3_091d := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_e09d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1152_c3_091d;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1172_c3_7516 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_515a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1172_c3_7516;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_8858_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_92bb_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1161_c3_74a0 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_66b4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1161_c3_74a0;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_92bb_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_406d_right := to_unsigned(4, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l1170_c30_baeb_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_92bb_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1173_c21_026a_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1148_c3_820b := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_92d2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1148_c3_820b;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_515a_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1154_c11_8d33_right := to_unsigned(2, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l1170_c30_baeb_y := resize(to_signed(-3, 3), 4);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_446a_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1170_c30_baeb_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1168_c3_b5ed_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1146_c2_92d2_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1151_c7_e09d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1154_c7_89a6_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1159_c7_66b4_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1167_c7_515a_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c6_ebd6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_8858_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1154_c11_8d33_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_a811_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_406d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_5512_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1175_c11_d15c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1173_c21_1431_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1160_c3_93e3_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1146_c2_92d2_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1151_c7_e09d_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1159_c7_66b4_iffalse := t16;
     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1155_l1168_l1160_l1164_DUPLICATE_6e82 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1155_l1168_l1160_l1164_DUPLICATE_6e82_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1175_c11_d15c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1175_c11_d15c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1175_c11_d15c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1175_c11_d15c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1175_c11_d15c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1175_c11_d15c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1175_c11_d15c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1146_c6_ebd6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1146_c6_ebd6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c6_ebd6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1146_c6_ebd6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c6_ebd6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c6_ebd6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1146_c6_ebd6_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1159_l1154_l1151_l1175_l1167_l1163_DUPLICATE_da55 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1159_l1154_l1151_l1175_l1167_l1163_DUPLICATE_da55_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1167_l1163_DUPLICATE_8dd7 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1167_l1163_DUPLICATE_8dd7_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1163_c11_406d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1163_c11_406d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_406d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1163_c11_406d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_406d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_406d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1163_c11_406d_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1159_l1154_l1151_l1146_l1167_l1163_DUPLICATE_9935 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1159_l1154_l1151_l1146_l1167_l1163_DUPLICATE_9935_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1151_c11_8858] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1151_c11_8858_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_8858_left;
     BIN_OP_EQ_uxn_opcodes_h_l1151_c11_8858_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_8858_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_8858_return_output := BIN_OP_EQ_uxn_opcodes_h_l1151_c11_8858_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1159_l1154_l1151_l1146_l1175_l1163_DUPLICATE_1369 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1159_l1154_l1151_l1146_l1175_l1163_DUPLICATE_1369_return_output := result.is_stack_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1159_l1154_l1151_l1146_l1167_l1163_DUPLICATE_6722 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1159_l1154_l1151_l1146_l1167_l1163_DUPLICATE_6722_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1167_c11_5512] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1167_c11_5512_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_5512_left;
     BIN_OP_EQ_uxn_opcodes_h_l1167_c11_5512_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_5512_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_5512_return_output := BIN_OP_EQ_uxn_opcodes_h_l1167_c11_5512_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1159_l1154_l1151_l1146_l1175_l1163_DUPLICATE_024e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1159_l1154_l1151_l1146_l1175_l1163_DUPLICATE_024e_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1159_c11_a811] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1159_c11_a811_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_a811_left;
     BIN_OP_EQ_uxn_opcodes_h_l1159_c11_a811_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_a811_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_a811_return_output := BIN_OP_EQ_uxn_opcodes_h_l1159_c11_a811_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1154_c11_8d33] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1154_c11_8d33_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1154_c11_8d33_left;
     BIN_OP_EQ_uxn_opcodes_h_l1154_c11_8d33_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1154_c11_8d33_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1154_c11_8d33_return_output := BIN_OP_EQ_uxn_opcodes_h_l1154_c11_8d33_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1170_c30_baeb] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1170_c30_baeb_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1170_c30_baeb_ins;
     sp_relative_shift_uxn_opcodes_h_l1170_c30_baeb_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1170_c30_baeb_x;
     sp_relative_shift_uxn_opcodes_h_l1170_c30_baeb_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1170_c30_baeb_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1170_c30_baeb_return_output := sp_relative_shift_uxn_opcodes_h_l1170_c30_baeb_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_446a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c6_ebd6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1146_c2_92d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c6_ebd6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_92d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c6_ebd6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_92d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c6_ebd6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_92d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c6_ebd6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_92d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c6_ebd6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_92d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c6_ebd6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1146_c2_92d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c6_ebd6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1146_c2_92d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c6_ebd6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1151_c7_e09d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_8858_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_e09d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_8858_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_e09d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_8858_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_e09d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_8858_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_e09d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_8858_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_e09d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_8858_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1151_c7_e09d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_8858_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1151_c7_e09d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_8858_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1154_c7_89a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1154_c11_8d33_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_89a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1154_c11_8d33_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_89a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1154_c11_8d33_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_89a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1154_c11_8d33_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_89a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1154_c11_8d33_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_89a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1154_c11_8d33_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1154_c7_89a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1154_c11_8d33_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1154_c7_89a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1154_c11_8d33_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1159_c7_66b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_a811_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_66b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_a811_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_66b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_a811_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_66b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_a811_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_66b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_a811_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_66b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_a811_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1159_c7_66b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_a811_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1159_c7_66b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_a811_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1163_c7_4e06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_406d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_4e06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_406d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_4e06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_406d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_4e06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_406d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_4e06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_406d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_4e06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_406d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1163_c7_4e06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_406d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1167_c7_515a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_5512_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_515a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_5512_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_515a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_5512_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_515a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_5512_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_515a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_5512_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_515a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_5512_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1167_c7_515a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_5512_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_92bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1175_c11_d15c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_92bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1175_c11_d15c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_92bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1175_c11_d15c_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1160_c3_93e3_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1155_l1168_l1160_l1164_DUPLICATE_6e82_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1168_c3_b5ed_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1155_l1168_l1160_l1164_DUPLICATE_6e82_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1156_l1165_DUPLICATE_d5af_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1155_l1168_l1160_l1164_DUPLICATE_6e82_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_92d2_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1159_l1154_l1151_l1146_l1167_l1163_DUPLICATE_6722_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_e09d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1159_l1154_l1151_l1146_l1167_l1163_DUPLICATE_6722_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_89a6_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1159_l1154_l1151_l1146_l1167_l1163_DUPLICATE_6722_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_66b4_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1159_l1154_l1151_l1146_l1167_l1163_DUPLICATE_6722_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_4e06_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1159_l1154_l1151_l1146_l1167_l1163_DUPLICATE_6722_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_515a_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1159_l1154_l1151_l1146_l1167_l1163_DUPLICATE_6722_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_e09d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1159_l1154_l1151_l1175_l1167_l1163_DUPLICATE_da55_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_89a6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1159_l1154_l1151_l1175_l1167_l1163_DUPLICATE_da55_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_66b4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1159_l1154_l1151_l1175_l1167_l1163_DUPLICATE_da55_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_4e06_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1159_l1154_l1151_l1175_l1167_l1163_DUPLICATE_da55_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_515a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1159_l1154_l1151_l1175_l1167_l1163_DUPLICATE_da55_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_92bb_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1159_l1154_l1151_l1175_l1167_l1163_DUPLICATE_da55_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_92d2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1159_l1154_l1151_l1146_l1175_l1163_DUPLICATE_024e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_e09d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1159_l1154_l1151_l1146_l1175_l1163_DUPLICATE_024e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_89a6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1159_l1154_l1151_l1146_l1175_l1163_DUPLICATE_024e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_66b4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1159_l1154_l1151_l1146_l1175_l1163_DUPLICATE_024e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_4e06_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1159_l1154_l1151_l1146_l1175_l1163_DUPLICATE_024e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_92bb_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1159_l1154_l1151_l1146_l1175_l1163_DUPLICATE_024e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_92d2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1159_l1154_l1151_l1146_l1175_l1163_DUPLICATE_1369_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_e09d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1159_l1154_l1151_l1146_l1175_l1163_DUPLICATE_1369_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_89a6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1159_l1154_l1151_l1146_l1175_l1163_DUPLICATE_1369_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_66b4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1159_l1154_l1151_l1146_l1175_l1163_DUPLICATE_1369_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_4e06_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1159_l1154_l1151_l1146_l1175_l1163_DUPLICATE_1369_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_92bb_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1159_l1154_l1151_l1146_l1175_l1163_DUPLICATE_1369_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_4e06_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1167_l1163_DUPLICATE_8dd7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_515a_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1167_l1163_DUPLICATE_8dd7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1146_c2_92d2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1159_l1154_l1151_l1146_l1167_l1163_DUPLICATE_9935_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1151_c7_e09d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1159_l1154_l1151_l1146_l1167_l1163_DUPLICATE_9935_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1154_c7_89a6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1159_l1154_l1151_l1146_l1167_l1163_DUPLICATE_9935_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1159_c7_66b4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1159_l1154_l1151_l1146_l1167_l1163_DUPLICATE_9935_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1163_c7_4e06_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1159_l1154_l1151_l1146_l1167_l1163_DUPLICATE_9935_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1167_c7_515a_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1159_l1154_l1151_l1146_l1167_l1163_DUPLICATE_9935_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_515a_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1170_c30_baeb_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1175_c7_92bb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_92bb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_92bb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_92bb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_92bb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_92bb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_92bb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_92bb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_92bb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1175_c7_92bb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_92bb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_92bb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_92bb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_92bb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_92bb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_92bb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_92bb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_92bb_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1160_c3_93e3] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1160_c3_93e3_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1160_c3_93e3_left;
     BIN_OP_OR_uxn_opcodes_h_l1160_c3_93e3_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1160_c3_93e3_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1160_c3_93e3_return_output := BIN_OP_OR_uxn_opcodes_h_l1160_c3_93e3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1175_c7_92bb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_92bb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_92bb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_92bb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_92bb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_92bb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_92bb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_92bb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_92bb_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1146_c1_446a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_446a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_446a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_446a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_446a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_446a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_446a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_446a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_446a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1167_c7_515a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_515a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_515a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_515a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_515a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_515a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_515a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_515a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_515a_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1168_c3_b5ed] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1168_c3_b5ed_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1168_c3_b5ed_left;
     BIN_OP_OR_uxn_opcodes_h_l1168_c3_b5ed_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1168_c3_b5ed_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1168_c3_b5ed_return_output := BIN_OP_OR_uxn_opcodes_h_l1168_c3_b5ed_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1156_l1165_DUPLICATE_d5af LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1156_l1165_DUPLICATE_d5af_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1156_l1165_DUPLICATE_d5af_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1156_l1165_DUPLICATE_d5af_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1156_l1165_DUPLICATE_d5af_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1167_c7_515a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_515a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_515a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_515a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_515a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_515a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_515a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_515a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_515a_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1159_c7_66b4_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1160_c3_93e3_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1173_c21_1431_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1168_c3_b5ed_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1167_c7_515a_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1168_c3_b5ed_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1163_c7_4e06_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1156_l1165_DUPLICATE_d5af_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1154_c7_89a6_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1156_l1165_DUPLICATE_d5af_return_output;
     VAR_printf_uxn_opcodes_h_l1147_c3_2777_uxn_opcodes_h_l1147_c3_2777_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_446a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_515a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_92bb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_515a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_92bb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_515a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_92bb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_4e06_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_515a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_4e06_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_515a_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1163_c7_4e06] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_4e06_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_4e06_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_4e06_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_4e06_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_4e06_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_4e06_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_4e06_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_4e06_return_output;

     -- n16_MUX[uxn_opcodes_h_l1167_c7_515a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1167_c7_515a_cond <= VAR_n16_MUX_uxn_opcodes_h_l1167_c7_515a_cond;
     n16_MUX_uxn_opcodes_h_l1167_c7_515a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1167_c7_515a_iftrue;
     n16_MUX_uxn_opcodes_h_l1167_c7_515a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1167_c7_515a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1167_c7_515a_return_output := n16_MUX_uxn_opcodes_h_l1167_c7_515a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1167_c7_515a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_515a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_515a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_515a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_515a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_515a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_515a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_515a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_515a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1167_c7_515a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_515a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_515a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_515a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_515a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_515a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_515a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_515a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_515a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1163_c7_4e06] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_4e06_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_4e06_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_4e06_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_4e06_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_4e06_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_4e06_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_4e06_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_4e06_return_output;

     -- printf_uxn_opcodes_h_l1147_c3_2777[uxn_opcodes_h_l1147_c3_2777] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1147_c3_2777_uxn_opcodes_h_l1147_c3_2777_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1147_c3_2777_uxn_opcodes_h_l1147_c3_2777_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- BIN_OP_EQ[uxn_opcodes_h_l1173_c21_1431] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1173_c21_1431_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1173_c21_1431_left;
     BIN_OP_EQ_uxn_opcodes_h_l1173_c21_1431_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1173_c21_1431_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1173_c21_1431_return_output := BIN_OP_EQ_uxn_opcodes_h_l1173_c21_1431_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1167_c7_515a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_515a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_515a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_515a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_515a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_515a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_515a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_515a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_515a_return_output;

     -- t16_MUX[uxn_opcodes_h_l1159_c7_66b4] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1159_c7_66b4_cond <= VAR_t16_MUX_uxn_opcodes_h_l1159_c7_66b4_cond;
     t16_MUX_uxn_opcodes_h_l1159_c7_66b4_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1159_c7_66b4_iftrue;
     t16_MUX_uxn_opcodes_h_l1159_c7_66b4_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1159_c7_66b4_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1159_c7_66b4_return_output := t16_MUX_uxn_opcodes_h_l1159_c7_66b4_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1173_c21_026a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1173_c21_1431_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1163_c7_4e06_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1167_c7_515a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_4e06_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_515a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_4e06_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_515a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_4e06_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_515a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_66b4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_4e06_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_66b4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_4e06_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1154_c7_89a6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1159_c7_66b4_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1163_c7_4e06] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_4e06_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_4e06_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_4e06_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_4e06_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_4e06_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_4e06_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_4e06_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_4e06_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1159_c7_66b4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_66b4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_66b4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_66b4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_66b4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_66b4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_66b4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_66b4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_66b4_return_output;

     -- n16_MUX[uxn_opcodes_h_l1163_c7_4e06] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1163_c7_4e06_cond <= VAR_n16_MUX_uxn_opcodes_h_l1163_c7_4e06_cond;
     n16_MUX_uxn_opcodes_h_l1163_c7_4e06_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1163_c7_4e06_iftrue;
     n16_MUX_uxn_opcodes_h_l1163_c7_4e06_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1163_c7_4e06_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1163_c7_4e06_return_output := n16_MUX_uxn_opcodes_h_l1163_c7_4e06_return_output;

     -- MUX[uxn_opcodes_h_l1173_c21_026a] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1173_c21_026a_cond <= VAR_MUX_uxn_opcodes_h_l1173_c21_026a_cond;
     MUX_uxn_opcodes_h_l1173_c21_026a_iftrue <= VAR_MUX_uxn_opcodes_h_l1173_c21_026a_iftrue;
     MUX_uxn_opcodes_h_l1173_c21_026a_iffalse <= VAR_MUX_uxn_opcodes_h_l1173_c21_026a_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1173_c21_026a_return_output := MUX_uxn_opcodes_h_l1173_c21_026a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1163_c7_4e06] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_4e06_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_4e06_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_4e06_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_4e06_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_4e06_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_4e06_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_4e06_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_4e06_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1163_c7_4e06] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_4e06_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_4e06_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_4e06_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_4e06_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_4e06_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_4e06_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_4e06_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_4e06_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1159_c7_66b4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_66b4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_66b4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_66b4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_66b4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_66b4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_66b4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_66b4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_66b4_return_output;

     -- t16_MUX[uxn_opcodes_h_l1154_c7_89a6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1154_c7_89a6_cond <= VAR_t16_MUX_uxn_opcodes_h_l1154_c7_89a6_cond;
     t16_MUX_uxn_opcodes_h_l1154_c7_89a6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1154_c7_89a6_iftrue;
     t16_MUX_uxn_opcodes_h_l1154_c7_89a6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1154_c7_89a6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1154_c7_89a6_return_output := t16_MUX_uxn_opcodes_h_l1154_c7_89a6_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1167_c7_515a_iftrue := VAR_MUX_uxn_opcodes_h_l1173_c21_026a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1159_c7_66b4_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1163_c7_4e06_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_66b4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_4e06_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_66b4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_4e06_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_66b4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_4e06_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_89a6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_66b4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_89a6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_66b4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1151_c7_e09d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1154_c7_89a6_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1159_c7_66b4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_66b4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_66b4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_66b4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_66b4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_66b4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_66b4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_66b4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_66b4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1154_c7_89a6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_89a6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_89a6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_89a6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_89a6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_89a6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_89a6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_89a6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_89a6_return_output;

     -- n16_MUX[uxn_opcodes_h_l1159_c7_66b4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1159_c7_66b4_cond <= VAR_n16_MUX_uxn_opcodes_h_l1159_c7_66b4_cond;
     n16_MUX_uxn_opcodes_h_l1159_c7_66b4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1159_c7_66b4_iftrue;
     n16_MUX_uxn_opcodes_h_l1159_c7_66b4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1159_c7_66b4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1159_c7_66b4_return_output := n16_MUX_uxn_opcodes_h_l1159_c7_66b4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1159_c7_66b4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_66b4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_66b4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_66b4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_66b4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_66b4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_66b4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_66b4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_66b4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1159_c7_66b4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_66b4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_66b4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_66b4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_66b4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_66b4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_66b4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_66b4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_66b4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1167_c7_515a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1167_c7_515a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1167_c7_515a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1167_c7_515a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1167_c7_515a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1167_c7_515a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1167_c7_515a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1167_c7_515a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1167_c7_515a_return_output;

     -- t16_MUX[uxn_opcodes_h_l1151_c7_e09d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1151_c7_e09d_cond <= VAR_t16_MUX_uxn_opcodes_h_l1151_c7_e09d_cond;
     t16_MUX_uxn_opcodes_h_l1151_c7_e09d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1151_c7_e09d_iftrue;
     t16_MUX_uxn_opcodes_h_l1151_c7_e09d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1151_c7_e09d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1151_c7_e09d_return_output := t16_MUX_uxn_opcodes_h_l1151_c7_e09d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1154_c7_89a6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_89a6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_89a6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_89a6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_89a6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_89a6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_89a6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_89a6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_89a6_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1154_c7_89a6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1159_c7_66b4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_89a6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_66b4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_89a6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_66b4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_89a6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_66b4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_e09d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_89a6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_e09d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_89a6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1163_c7_4e06_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1167_c7_515a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1146_c2_92d2_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1151_c7_e09d_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1163_c7_4e06] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1163_c7_4e06_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1163_c7_4e06_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1163_c7_4e06_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1163_c7_4e06_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1163_c7_4e06_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1163_c7_4e06_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1163_c7_4e06_return_output := result_u8_value_MUX_uxn_opcodes_h_l1163_c7_4e06_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1154_c7_89a6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_89a6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_89a6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_89a6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_89a6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_89a6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_89a6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_89a6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_89a6_return_output;

     -- n16_MUX[uxn_opcodes_h_l1154_c7_89a6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1154_c7_89a6_cond <= VAR_n16_MUX_uxn_opcodes_h_l1154_c7_89a6_cond;
     n16_MUX_uxn_opcodes_h_l1154_c7_89a6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1154_c7_89a6_iftrue;
     n16_MUX_uxn_opcodes_h_l1154_c7_89a6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1154_c7_89a6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1154_c7_89a6_return_output := n16_MUX_uxn_opcodes_h_l1154_c7_89a6_return_output;

     -- t16_MUX[uxn_opcodes_h_l1146_c2_92d2] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1146_c2_92d2_cond <= VAR_t16_MUX_uxn_opcodes_h_l1146_c2_92d2_cond;
     t16_MUX_uxn_opcodes_h_l1146_c2_92d2_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1146_c2_92d2_iftrue;
     t16_MUX_uxn_opcodes_h_l1146_c2_92d2_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1146_c2_92d2_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1146_c2_92d2_return_output := t16_MUX_uxn_opcodes_h_l1146_c2_92d2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1154_c7_89a6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_89a6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_89a6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_89a6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_89a6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_89a6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_89a6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_89a6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_89a6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1151_c7_e09d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_e09d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_e09d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_e09d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_e09d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_e09d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_e09d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_e09d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_e09d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1151_c7_e09d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_e09d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_e09d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_e09d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_e09d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_e09d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_e09d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_e09d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_e09d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1154_c7_89a6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_89a6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_89a6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_89a6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_89a6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_89a6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_89a6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_89a6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_89a6_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1151_c7_e09d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1154_c7_89a6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_e09d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_89a6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_e09d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_89a6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_e09d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_89a6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_92d2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_e09d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_92d2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_e09d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1159_c7_66b4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1163_c7_4e06_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1146_c2_92d2_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1151_c7_e09d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_e09d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_e09d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_e09d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_e09d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_e09d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_e09d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_e09d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_e09d_return_output;

     -- n16_MUX[uxn_opcodes_h_l1151_c7_e09d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1151_c7_e09d_cond <= VAR_n16_MUX_uxn_opcodes_h_l1151_c7_e09d_cond;
     n16_MUX_uxn_opcodes_h_l1151_c7_e09d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1151_c7_e09d_iftrue;
     n16_MUX_uxn_opcodes_h_l1151_c7_e09d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1151_c7_e09d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1151_c7_e09d_return_output := n16_MUX_uxn_opcodes_h_l1151_c7_e09d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1151_c7_e09d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_e09d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_e09d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_e09d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_e09d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_e09d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_e09d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_e09d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_e09d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1146_c2_92d2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_92d2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_92d2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_92d2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_92d2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_92d2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_92d2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_92d2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_92d2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1151_c7_e09d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_e09d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_e09d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_e09d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_e09d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_e09d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_e09d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_e09d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_e09d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1146_c2_92d2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_92d2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_92d2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_92d2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_92d2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_92d2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_92d2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_92d2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_92d2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1159_c7_66b4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1159_c7_66b4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1159_c7_66b4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1159_c7_66b4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1159_c7_66b4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1159_c7_66b4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1159_c7_66b4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1159_c7_66b4_return_output := result_u8_value_MUX_uxn_opcodes_h_l1159_c7_66b4_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1146_c2_92d2_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1151_c7_e09d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_92d2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_e09d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_92d2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_e09d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_92d2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_e09d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1154_c7_89a6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1159_c7_66b4_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1146_c2_92d2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_92d2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_92d2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_92d2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_92d2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_92d2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_92d2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_92d2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_92d2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1146_c2_92d2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_92d2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_92d2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_92d2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_92d2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_92d2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_92d2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_92d2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_92d2_return_output;

     -- n16_MUX[uxn_opcodes_h_l1146_c2_92d2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1146_c2_92d2_cond <= VAR_n16_MUX_uxn_opcodes_h_l1146_c2_92d2_cond;
     n16_MUX_uxn_opcodes_h_l1146_c2_92d2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1146_c2_92d2_iftrue;
     n16_MUX_uxn_opcodes_h_l1146_c2_92d2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1146_c2_92d2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1146_c2_92d2_return_output := n16_MUX_uxn_opcodes_h_l1146_c2_92d2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1146_c2_92d2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_92d2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_92d2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_92d2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_92d2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_92d2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_92d2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_92d2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_92d2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1154_c7_89a6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1154_c7_89a6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1154_c7_89a6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1154_c7_89a6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1154_c7_89a6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1154_c7_89a6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1154_c7_89a6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1154_c7_89a6_return_output := result_u8_value_MUX_uxn_opcodes_h_l1154_c7_89a6_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1146_c2_92d2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1151_c7_e09d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1154_c7_89a6_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1151_c7_e09d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1151_c7_e09d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1151_c7_e09d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1151_c7_e09d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1151_c7_e09d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1151_c7_e09d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1151_c7_e09d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1151_c7_e09d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1151_c7_e09d_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1146_c2_92d2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1151_c7_e09d_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1146_c2_92d2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1146_c2_92d2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1146_c2_92d2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1146_c2_92d2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1146_c2_92d2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1146_c2_92d2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1146_c2_92d2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1146_c2_92d2_return_output := result_u8_value_MUX_uxn_opcodes_h_l1146_c2_92d2_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l1181_l1142_DUPLICATE_3641 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l1181_l1142_DUPLICATE_3641_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1146_c2_92d2_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_92d2_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_92d2_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_92d2_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_92d2_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_92d2_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l1181_l1142_DUPLICATE_3641_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l1181_l1142_DUPLICATE_3641_return_output;
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
