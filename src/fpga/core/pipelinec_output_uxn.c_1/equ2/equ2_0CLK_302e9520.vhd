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
-- BIN_OP_EQ[uxn_opcodes_h_l1146_c6_1819]
signal BIN_OP_EQ_uxn_opcodes_h_l1146_c6_1819_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1146_c6_1819_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1146_c6_1819_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1146_c1_09d2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_09d2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_09d2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_09d2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_09d2_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1146_c2_0776]
signal n16_MUX_uxn_opcodes_h_l1146_c2_0776_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1146_c2_0776_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1146_c2_0776_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1146_c2_0776_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1146_c2_0776]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_0776_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_0776_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_0776_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_0776_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1146_c2_0776]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_0776_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_0776_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_0776_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_0776_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1146_c2_0776]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_0776_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_0776_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_0776_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_0776_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1146_c2_0776]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_0776_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_0776_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_0776_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_0776_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1146_c2_0776]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_0776_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_0776_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_0776_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_0776_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1146_c2_0776]
signal result_u8_value_MUX_uxn_opcodes_h_l1146_c2_0776_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1146_c2_0776_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1146_c2_0776_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1146_c2_0776_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1146_c2_0776]
signal t16_MUX_uxn_opcodes_h_l1146_c2_0776_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1146_c2_0776_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1146_c2_0776_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1146_c2_0776_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1147_c3_86dd[uxn_opcodes_h_l1147_c3_86dd]
signal printf_uxn_opcodes_h_l1147_c3_86dd_uxn_opcodes_h_l1147_c3_86dd_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1151_c11_a4cb]
signal BIN_OP_EQ_uxn_opcodes_h_l1151_c11_a4cb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1151_c11_a4cb_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1151_c11_a4cb_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1151_c7_31d8]
signal n16_MUX_uxn_opcodes_h_l1151_c7_31d8_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1151_c7_31d8_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1151_c7_31d8_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1151_c7_31d8_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1151_c7_31d8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_31d8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_31d8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_31d8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_31d8_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1151_c7_31d8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_31d8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_31d8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_31d8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_31d8_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1151_c7_31d8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_31d8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_31d8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_31d8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_31d8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1151_c7_31d8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_31d8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_31d8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_31d8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_31d8_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1151_c7_31d8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_31d8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_31d8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_31d8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_31d8_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1151_c7_31d8]
signal result_u8_value_MUX_uxn_opcodes_h_l1151_c7_31d8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1151_c7_31d8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1151_c7_31d8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1151_c7_31d8_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1151_c7_31d8]
signal t16_MUX_uxn_opcodes_h_l1151_c7_31d8_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1151_c7_31d8_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1151_c7_31d8_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1151_c7_31d8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1154_c11_1921]
signal BIN_OP_EQ_uxn_opcodes_h_l1154_c11_1921_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1154_c11_1921_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1154_c11_1921_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1154_c7_3981]
signal n16_MUX_uxn_opcodes_h_l1154_c7_3981_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1154_c7_3981_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1154_c7_3981_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1154_c7_3981_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1154_c7_3981]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_3981_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_3981_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_3981_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_3981_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1154_c7_3981]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_3981_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_3981_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_3981_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_3981_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1154_c7_3981]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_3981_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_3981_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_3981_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_3981_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1154_c7_3981]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_3981_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_3981_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_3981_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_3981_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1154_c7_3981]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_3981_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_3981_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_3981_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_3981_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1154_c7_3981]
signal result_u8_value_MUX_uxn_opcodes_h_l1154_c7_3981_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1154_c7_3981_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1154_c7_3981_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1154_c7_3981_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1154_c7_3981]
signal t16_MUX_uxn_opcodes_h_l1154_c7_3981_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1154_c7_3981_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1154_c7_3981_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1154_c7_3981_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1159_c11_72d5]
signal BIN_OP_EQ_uxn_opcodes_h_l1159_c11_72d5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1159_c11_72d5_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1159_c11_72d5_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1159_c7_f6f6]
signal n16_MUX_uxn_opcodes_h_l1159_c7_f6f6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1159_c7_f6f6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1159_c7_f6f6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1159_c7_f6f6_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1159_c7_f6f6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_f6f6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_f6f6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_f6f6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_f6f6_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1159_c7_f6f6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_f6f6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_f6f6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_f6f6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_f6f6_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1159_c7_f6f6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_f6f6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_f6f6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_f6f6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_f6f6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1159_c7_f6f6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_f6f6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_f6f6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_f6f6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_f6f6_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1159_c7_f6f6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_f6f6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_f6f6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_f6f6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_f6f6_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1159_c7_f6f6]
signal result_u8_value_MUX_uxn_opcodes_h_l1159_c7_f6f6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1159_c7_f6f6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1159_c7_f6f6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1159_c7_f6f6_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1159_c7_f6f6]
signal t16_MUX_uxn_opcodes_h_l1159_c7_f6f6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1159_c7_f6f6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1159_c7_f6f6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1159_c7_f6f6_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1160_c3_92f5]
signal BIN_OP_OR_uxn_opcodes_h_l1160_c3_92f5_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1160_c3_92f5_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1160_c3_92f5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1163_c11_125f]
signal BIN_OP_EQ_uxn_opcodes_h_l1163_c11_125f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1163_c11_125f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1163_c11_125f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1163_c7_0531]
signal n16_MUX_uxn_opcodes_h_l1163_c7_0531_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1163_c7_0531_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1163_c7_0531_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1163_c7_0531_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1163_c7_0531]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_0531_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_0531_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_0531_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_0531_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1163_c7_0531]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_0531_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_0531_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_0531_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_0531_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1163_c7_0531]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_0531_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_0531_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_0531_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_0531_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1163_c7_0531]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_0531_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_0531_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_0531_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_0531_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1163_c7_0531]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_0531_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_0531_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_0531_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_0531_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1163_c7_0531]
signal result_u8_value_MUX_uxn_opcodes_h_l1163_c7_0531_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1163_c7_0531_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1163_c7_0531_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1163_c7_0531_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1167_c11_cca5]
signal BIN_OP_EQ_uxn_opcodes_h_l1167_c11_cca5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1167_c11_cca5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1167_c11_cca5_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1167_c7_1eaf]
signal n16_MUX_uxn_opcodes_h_l1167_c7_1eaf_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1167_c7_1eaf_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1167_c7_1eaf_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1167_c7_1eaf_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1167_c7_1eaf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_1eaf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_1eaf_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_1eaf_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_1eaf_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1167_c7_1eaf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_1eaf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_1eaf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_1eaf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_1eaf_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1167_c7_1eaf]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_1eaf_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_1eaf_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_1eaf_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_1eaf_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1167_c7_1eaf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_1eaf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_1eaf_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_1eaf_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_1eaf_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1167_c7_1eaf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_1eaf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_1eaf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_1eaf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_1eaf_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1167_c7_1eaf]
signal result_u8_value_MUX_uxn_opcodes_h_l1167_c7_1eaf_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1167_c7_1eaf_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1167_c7_1eaf_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1167_c7_1eaf_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1168_c3_02a6]
signal BIN_OP_OR_uxn_opcodes_h_l1168_c3_02a6_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1168_c3_02a6_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1168_c3_02a6_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1170_c30_03be]
signal sp_relative_shift_uxn_opcodes_h_l1170_c30_03be_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1170_c30_03be_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1170_c30_03be_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1170_c30_03be_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1173_c21_0742]
signal BIN_OP_EQ_uxn_opcodes_h_l1173_c21_0742_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1173_c21_0742_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1173_c21_0742_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1173_c21_a7eb]
signal MUX_uxn_opcodes_h_l1173_c21_a7eb_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1173_c21_a7eb_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1173_c21_a7eb_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1173_c21_a7eb_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1175_c11_7cb7]
signal BIN_OP_EQ_uxn_opcodes_h_l1175_c11_7cb7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1175_c11_7cb7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1175_c11_7cb7_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1175_c7_047c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_047c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_047c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_047c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_047c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1175_c7_047c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_047c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_047c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_047c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_047c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1175_c7_047c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_047c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_047c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_047c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_047c_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1156_l1165_DUPLICATE_50d9
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1156_l1165_DUPLICATE_50d9_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1156_l1165_DUPLICATE_50d9_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_4e73( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : signed;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.u8_value := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1146_c6_1819
BIN_OP_EQ_uxn_opcodes_h_l1146_c6_1819 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1146_c6_1819_left,
BIN_OP_EQ_uxn_opcodes_h_l1146_c6_1819_right,
BIN_OP_EQ_uxn_opcodes_h_l1146_c6_1819_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_09d2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_09d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_09d2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_09d2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_09d2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_09d2_return_output);

-- n16_MUX_uxn_opcodes_h_l1146_c2_0776
n16_MUX_uxn_opcodes_h_l1146_c2_0776 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1146_c2_0776_cond,
n16_MUX_uxn_opcodes_h_l1146_c2_0776_iftrue,
n16_MUX_uxn_opcodes_h_l1146_c2_0776_iffalse,
n16_MUX_uxn_opcodes_h_l1146_c2_0776_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_0776
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_0776 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_0776_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_0776_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_0776_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_0776_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_0776
result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_0776 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_0776_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_0776_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_0776_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_0776_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_0776
result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_0776 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_0776_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_0776_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_0776_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_0776_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_0776
result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_0776 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_0776_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_0776_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_0776_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_0776_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_0776
result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_0776 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_0776_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_0776_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_0776_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_0776_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1146_c2_0776
result_u8_value_MUX_uxn_opcodes_h_l1146_c2_0776 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1146_c2_0776_cond,
result_u8_value_MUX_uxn_opcodes_h_l1146_c2_0776_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1146_c2_0776_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1146_c2_0776_return_output);

-- t16_MUX_uxn_opcodes_h_l1146_c2_0776
t16_MUX_uxn_opcodes_h_l1146_c2_0776 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1146_c2_0776_cond,
t16_MUX_uxn_opcodes_h_l1146_c2_0776_iftrue,
t16_MUX_uxn_opcodes_h_l1146_c2_0776_iffalse,
t16_MUX_uxn_opcodes_h_l1146_c2_0776_return_output);

-- printf_uxn_opcodes_h_l1147_c3_86dd_uxn_opcodes_h_l1147_c3_86dd
printf_uxn_opcodes_h_l1147_c3_86dd_uxn_opcodes_h_l1147_c3_86dd : entity work.printf_uxn_opcodes_h_l1147_c3_86dd_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1147_c3_86dd_uxn_opcodes_h_l1147_c3_86dd_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1151_c11_a4cb
BIN_OP_EQ_uxn_opcodes_h_l1151_c11_a4cb : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1151_c11_a4cb_left,
BIN_OP_EQ_uxn_opcodes_h_l1151_c11_a4cb_right,
BIN_OP_EQ_uxn_opcodes_h_l1151_c11_a4cb_return_output);

-- n16_MUX_uxn_opcodes_h_l1151_c7_31d8
n16_MUX_uxn_opcodes_h_l1151_c7_31d8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1151_c7_31d8_cond,
n16_MUX_uxn_opcodes_h_l1151_c7_31d8_iftrue,
n16_MUX_uxn_opcodes_h_l1151_c7_31d8_iffalse,
n16_MUX_uxn_opcodes_h_l1151_c7_31d8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_31d8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_31d8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_31d8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_31d8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_31d8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_31d8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_31d8
result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_31d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_31d8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_31d8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_31d8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_31d8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_31d8
result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_31d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_31d8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_31d8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_31d8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_31d8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_31d8
result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_31d8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_31d8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_31d8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_31d8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_31d8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_31d8
result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_31d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_31d8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_31d8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_31d8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_31d8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1151_c7_31d8
result_u8_value_MUX_uxn_opcodes_h_l1151_c7_31d8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1151_c7_31d8_cond,
result_u8_value_MUX_uxn_opcodes_h_l1151_c7_31d8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1151_c7_31d8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1151_c7_31d8_return_output);

-- t16_MUX_uxn_opcodes_h_l1151_c7_31d8
t16_MUX_uxn_opcodes_h_l1151_c7_31d8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1151_c7_31d8_cond,
t16_MUX_uxn_opcodes_h_l1151_c7_31d8_iftrue,
t16_MUX_uxn_opcodes_h_l1151_c7_31d8_iffalse,
t16_MUX_uxn_opcodes_h_l1151_c7_31d8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1154_c11_1921
BIN_OP_EQ_uxn_opcodes_h_l1154_c11_1921 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1154_c11_1921_left,
BIN_OP_EQ_uxn_opcodes_h_l1154_c11_1921_right,
BIN_OP_EQ_uxn_opcodes_h_l1154_c11_1921_return_output);

-- n16_MUX_uxn_opcodes_h_l1154_c7_3981
n16_MUX_uxn_opcodes_h_l1154_c7_3981 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1154_c7_3981_cond,
n16_MUX_uxn_opcodes_h_l1154_c7_3981_iftrue,
n16_MUX_uxn_opcodes_h_l1154_c7_3981_iffalse,
n16_MUX_uxn_opcodes_h_l1154_c7_3981_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_3981
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_3981 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_3981_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_3981_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_3981_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_3981_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_3981
result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_3981 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_3981_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_3981_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_3981_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_3981_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_3981
result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_3981 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_3981_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_3981_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_3981_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_3981_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_3981
result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_3981 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_3981_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_3981_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_3981_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_3981_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_3981
result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_3981 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_3981_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_3981_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_3981_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_3981_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1154_c7_3981
result_u8_value_MUX_uxn_opcodes_h_l1154_c7_3981 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1154_c7_3981_cond,
result_u8_value_MUX_uxn_opcodes_h_l1154_c7_3981_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1154_c7_3981_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1154_c7_3981_return_output);

-- t16_MUX_uxn_opcodes_h_l1154_c7_3981
t16_MUX_uxn_opcodes_h_l1154_c7_3981 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1154_c7_3981_cond,
t16_MUX_uxn_opcodes_h_l1154_c7_3981_iftrue,
t16_MUX_uxn_opcodes_h_l1154_c7_3981_iffalse,
t16_MUX_uxn_opcodes_h_l1154_c7_3981_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1159_c11_72d5
BIN_OP_EQ_uxn_opcodes_h_l1159_c11_72d5 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1159_c11_72d5_left,
BIN_OP_EQ_uxn_opcodes_h_l1159_c11_72d5_right,
BIN_OP_EQ_uxn_opcodes_h_l1159_c11_72d5_return_output);

-- n16_MUX_uxn_opcodes_h_l1159_c7_f6f6
n16_MUX_uxn_opcodes_h_l1159_c7_f6f6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1159_c7_f6f6_cond,
n16_MUX_uxn_opcodes_h_l1159_c7_f6f6_iftrue,
n16_MUX_uxn_opcodes_h_l1159_c7_f6f6_iffalse,
n16_MUX_uxn_opcodes_h_l1159_c7_f6f6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_f6f6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_f6f6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_f6f6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_f6f6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_f6f6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_f6f6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_f6f6
result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_f6f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_f6f6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_f6f6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_f6f6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_f6f6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_f6f6
result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_f6f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_f6f6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_f6f6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_f6f6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_f6f6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_f6f6
result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_f6f6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_f6f6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_f6f6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_f6f6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_f6f6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_f6f6
result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_f6f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_f6f6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_f6f6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_f6f6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_f6f6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1159_c7_f6f6
result_u8_value_MUX_uxn_opcodes_h_l1159_c7_f6f6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1159_c7_f6f6_cond,
result_u8_value_MUX_uxn_opcodes_h_l1159_c7_f6f6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1159_c7_f6f6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1159_c7_f6f6_return_output);

-- t16_MUX_uxn_opcodes_h_l1159_c7_f6f6
t16_MUX_uxn_opcodes_h_l1159_c7_f6f6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1159_c7_f6f6_cond,
t16_MUX_uxn_opcodes_h_l1159_c7_f6f6_iftrue,
t16_MUX_uxn_opcodes_h_l1159_c7_f6f6_iffalse,
t16_MUX_uxn_opcodes_h_l1159_c7_f6f6_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1160_c3_92f5
BIN_OP_OR_uxn_opcodes_h_l1160_c3_92f5 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1160_c3_92f5_left,
BIN_OP_OR_uxn_opcodes_h_l1160_c3_92f5_right,
BIN_OP_OR_uxn_opcodes_h_l1160_c3_92f5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1163_c11_125f
BIN_OP_EQ_uxn_opcodes_h_l1163_c11_125f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1163_c11_125f_left,
BIN_OP_EQ_uxn_opcodes_h_l1163_c11_125f_right,
BIN_OP_EQ_uxn_opcodes_h_l1163_c11_125f_return_output);

-- n16_MUX_uxn_opcodes_h_l1163_c7_0531
n16_MUX_uxn_opcodes_h_l1163_c7_0531 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1163_c7_0531_cond,
n16_MUX_uxn_opcodes_h_l1163_c7_0531_iftrue,
n16_MUX_uxn_opcodes_h_l1163_c7_0531_iffalse,
n16_MUX_uxn_opcodes_h_l1163_c7_0531_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_0531
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_0531 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_0531_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_0531_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_0531_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_0531_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_0531
result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_0531 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_0531_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_0531_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_0531_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_0531_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_0531
result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_0531 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_0531_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_0531_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_0531_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_0531_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_0531
result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_0531 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_0531_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_0531_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_0531_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_0531_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_0531
result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_0531 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_0531_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_0531_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_0531_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_0531_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1163_c7_0531
result_u8_value_MUX_uxn_opcodes_h_l1163_c7_0531 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1163_c7_0531_cond,
result_u8_value_MUX_uxn_opcodes_h_l1163_c7_0531_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1163_c7_0531_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1163_c7_0531_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1167_c11_cca5
BIN_OP_EQ_uxn_opcodes_h_l1167_c11_cca5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1167_c11_cca5_left,
BIN_OP_EQ_uxn_opcodes_h_l1167_c11_cca5_right,
BIN_OP_EQ_uxn_opcodes_h_l1167_c11_cca5_return_output);

-- n16_MUX_uxn_opcodes_h_l1167_c7_1eaf
n16_MUX_uxn_opcodes_h_l1167_c7_1eaf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1167_c7_1eaf_cond,
n16_MUX_uxn_opcodes_h_l1167_c7_1eaf_iftrue,
n16_MUX_uxn_opcodes_h_l1167_c7_1eaf_iffalse,
n16_MUX_uxn_opcodes_h_l1167_c7_1eaf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_1eaf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_1eaf : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_1eaf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_1eaf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_1eaf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_1eaf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_1eaf
result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_1eaf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_1eaf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_1eaf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_1eaf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_1eaf_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_1eaf
result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_1eaf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_1eaf_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_1eaf_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_1eaf_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_1eaf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_1eaf
result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_1eaf : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_1eaf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_1eaf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_1eaf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_1eaf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_1eaf
result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_1eaf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_1eaf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_1eaf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_1eaf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_1eaf_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1167_c7_1eaf
result_u8_value_MUX_uxn_opcodes_h_l1167_c7_1eaf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1167_c7_1eaf_cond,
result_u8_value_MUX_uxn_opcodes_h_l1167_c7_1eaf_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1167_c7_1eaf_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1167_c7_1eaf_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1168_c3_02a6
BIN_OP_OR_uxn_opcodes_h_l1168_c3_02a6 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1168_c3_02a6_left,
BIN_OP_OR_uxn_opcodes_h_l1168_c3_02a6_right,
BIN_OP_OR_uxn_opcodes_h_l1168_c3_02a6_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1170_c30_03be
sp_relative_shift_uxn_opcodes_h_l1170_c30_03be : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1170_c30_03be_ins,
sp_relative_shift_uxn_opcodes_h_l1170_c30_03be_x,
sp_relative_shift_uxn_opcodes_h_l1170_c30_03be_y,
sp_relative_shift_uxn_opcodes_h_l1170_c30_03be_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1173_c21_0742
BIN_OP_EQ_uxn_opcodes_h_l1173_c21_0742 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1173_c21_0742_left,
BIN_OP_EQ_uxn_opcodes_h_l1173_c21_0742_right,
BIN_OP_EQ_uxn_opcodes_h_l1173_c21_0742_return_output);

-- MUX_uxn_opcodes_h_l1173_c21_a7eb
MUX_uxn_opcodes_h_l1173_c21_a7eb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1173_c21_a7eb_cond,
MUX_uxn_opcodes_h_l1173_c21_a7eb_iftrue,
MUX_uxn_opcodes_h_l1173_c21_a7eb_iffalse,
MUX_uxn_opcodes_h_l1173_c21_a7eb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1175_c11_7cb7
BIN_OP_EQ_uxn_opcodes_h_l1175_c11_7cb7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1175_c11_7cb7_left,
BIN_OP_EQ_uxn_opcodes_h_l1175_c11_7cb7_right,
BIN_OP_EQ_uxn_opcodes_h_l1175_c11_7cb7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_047c
result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_047c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_047c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_047c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_047c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_047c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_047c
result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_047c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_047c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_047c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_047c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_047c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_047c
result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_047c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_047c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_047c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_047c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_047c_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1156_l1165_DUPLICATE_50d9
CONST_SL_8_uint16_t_uxn_opcodes_h_l1156_l1165_DUPLICATE_50d9 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1156_l1165_DUPLICATE_50d9_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1156_l1165_DUPLICATE_50d9_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1146_c6_1819_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_09d2_return_output,
 n16_MUX_uxn_opcodes_h_l1146_c2_0776_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_0776_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_0776_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_0776_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_0776_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_0776_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1146_c2_0776_return_output,
 t16_MUX_uxn_opcodes_h_l1146_c2_0776_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1151_c11_a4cb_return_output,
 n16_MUX_uxn_opcodes_h_l1151_c7_31d8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_31d8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_31d8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_31d8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_31d8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_31d8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1151_c7_31d8_return_output,
 t16_MUX_uxn_opcodes_h_l1151_c7_31d8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1154_c11_1921_return_output,
 n16_MUX_uxn_opcodes_h_l1154_c7_3981_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_3981_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_3981_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_3981_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_3981_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_3981_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1154_c7_3981_return_output,
 t16_MUX_uxn_opcodes_h_l1154_c7_3981_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1159_c11_72d5_return_output,
 n16_MUX_uxn_opcodes_h_l1159_c7_f6f6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_f6f6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_f6f6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_f6f6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_f6f6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_f6f6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1159_c7_f6f6_return_output,
 t16_MUX_uxn_opcodes_h_l1159_c7_f6f6_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1160_c3_92f5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1163_c11_125f_return_output,
 n16_MUX_uxn_opcodes_h_l1163_c7_0531_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_0531_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_0531_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_0531_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_0531_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_0531_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1163_c7_0531_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1167_c11_cca5_return_output,
 n16_MUX_uxn_opcodes_h_l1167_c7_1eaf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_1eaf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_1eaf_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_1eaf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_1eaf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_1eaf_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1167_c7_1eaf_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1168_c3_02a6_return_output,
 sp_relative_shift_uxn_opcodes_h_l1170_c30_03be_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1173_c21_0742_return_output,
 MUX_uxn_opcodes_h_l1173_c21_a7eb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1175_c11_7cb7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_047c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_047c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_047c_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1156_l1165_DUPLICATE_50d9_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c6_1819_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c6_1819_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c6_1819_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_09d2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_09d2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_09d2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_09d2_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1146_c2_0776_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1146_c2_0776_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1151_c7_31d8_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1146_c2_0776_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1146_c2_0776_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_0776_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1148_c3_188f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_0776_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_31d8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_0776_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_0776_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_0776_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_0776_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_31d8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_0776_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_0776_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_0776_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_0776_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_31d8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_0776_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_0776_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_0776_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_0776_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_31d8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_0776_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_0776_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_0776_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_0776_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_31d8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_0776_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_0776_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1146_c2_0776_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1146_c2_0776_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1151_c7_31d8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1146_c2_0776_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1146_c2_0776_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1146_c2_0776_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1146_c2_0776_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1151_c7_31d8_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1146_c2_0776_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1146_c2_0776_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1147_c3_86dd_uxn_opcodes_h_l1147_c3_86dd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_a4cb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_a4cb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_a4cb_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1151_c7_31d8_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1151_c7_31d8_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1154_c7_3981_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1151_c7_31d8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_31d8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1152_c3_a944 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_31d8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_3981_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_31d8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_31d8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_31d8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_3981_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_31d8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_31d8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_31d8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_3981_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_31d8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_31d8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_31d8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_3981_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_31d8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_31d8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_31d8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_3981_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_31d8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1151_c7_31d8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1151_c7_31d8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1154_c7_3981_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1151_c7_31d8_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1151_c7_31d8_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1151_c7_31d8_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1154_c7_3981_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1151_c7_31d8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1154_c11_1921_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1154_c11_1921_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1154_c11_1921_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1154_c7_3981_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1154_c7_3981_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1159_c7_f6f6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1154_c7_3981_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_3981_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1157_c3_2088 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_3981_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_f6f6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_3981_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_3981_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_3981_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_f6f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_3981_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_3981_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_3981_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_f6f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_3981_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_3981_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_3981_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_f6f6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_3981_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_3981_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_3981_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_f6f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_3981_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1154_c7_3981_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1154_c7_3981_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1159_c7_f6f6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1154_c7_3981_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1154_c7_3981_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1154_c7_3981_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1159_c7_f6f6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1154_c7_3981_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_72d5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_72d5_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_72d5_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1159_c7_f6f6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1159_c7_f6f6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1163_c7_0531_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1159_c7_f6f6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_f6f6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1161_c3_61ba : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_f6f6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_0531_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_f6f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_f6f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_f6f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_0531_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_f6f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_f6f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_f6f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_0531_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_f6f6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_f6f6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_f6f6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_0531_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_f6f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_f6f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_f6f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_0531_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_f6f6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1159_c7_f6f6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1159_c7_f6f6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1163_c7_0531_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1159_c7_f6f6_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1159_c7_f6f6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1159_c7_f6f6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1159_c7_f6f6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1160_c3_92f5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1160_c3_92f5_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1160_c3_92f5_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_125f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_125f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_125f_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1163_c7_0531_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1163_c7_0531_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1167_c7_1eaf_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1163_c7_0531_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_0531_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_0531_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_1eaf_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_0531_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_0531_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_0531_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_1eaf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_0531_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_0531_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_0531_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_1eaf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_0531_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_0531_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_0531_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_1eaf_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_0531_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_0531_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_0531_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_1eaf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_0531_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1163_c7_0531_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1163_c7_0531_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1167_c7_1eaf_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1163_c7_0531_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_cca5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_cca5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_cca5_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1167_c7_1eaf_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1167_c7_1eaf_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1167_c7_1eaf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_1eaf_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1172_c3_a196 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_1eaf_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_1eaf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_1eaf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_1eaf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_047c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_1eaf_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_1eaf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_1eaf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_047c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_1eaf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_1eaf_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_1eaf_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_1eaf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_1eaf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_1eaf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_047c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_1eaf_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1167_c7_1eaf_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1167_c7_1eaf_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1167_c7_1eaf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1168_c3_02a6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1168_c3_02a6_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1168_c3_02a6_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1170_c30_03be_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1170_c30_03be_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1170_c30_03be_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1170_c30_03be_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1173_c21_a7eb_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1173_c21_a7eb_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1173_c21_a7eb_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1173_c21_0742_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1173_c21_0742_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1173_c21_0742_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1173_c21_a7eb_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1175_c11_7cb7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1175_c11_7cb7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1175_c11_7cb7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_047c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_047c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_047c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_047c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_047c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_047c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_047c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_047c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_047c_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1163_l1159_l1154_l1151_l1146_l1175_DUPLICATE_1fb7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1163_l1159_l1154_l1151_l1146_l1175_DUPLICATE_95c3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1163_l1159_l1154_l1151_l1146_l1167_DUPLICATE_ea02_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1163_l1159_l1154_l1151_l1146_l1167_DUPLICATE_9e3c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1163_l1159_l1154_l1151_l1175_l1167_DUPLICATE_9e49_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1155_l1160_l1164_l1168_DUPLICATE_4e3d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1156_l1165_DUPLICATE_50d9_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1156_l1165_DUPLICATE_50d9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1163_l1167_DUPLICATE_eeb7_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l1181_l1142_DUPLICATE_74df_return_output : opcode_result_t;
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
     VAR_MUX_uxn_opcodes_h_l1173_c21_a7eb_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1154_c11_1921_right := to_unsigned(2, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_09d2_iffalse := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_1eaf_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1157_c3_2088 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_3981_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1157_c3_2088;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_047c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_125f_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c6_1819_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1161_c3_61ba := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_f6f6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1161_c3_61ba;
     VAR_MUX_uxn_opcodes_h_l1173_c21_a7eb_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_sp_relative_shift_uxn_opcodes_h_l1170_c30_03be_y := resize(to_signed(-3, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1172_c3_a196 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_1eaf_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1172_c3_a196;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_047c_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_0776_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_cca5_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_047c_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_a4cb_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1175_c11_7cb7_right := to_unsigned(6, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_1eaf_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1152_c3_a944 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_31d8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1152_c3_a944;
     VAR_sp_relative_shift_uxn_opcodes_h_l1170_c30_03be_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_72d5_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1148_c3_188f := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_0776_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1148_c3_188f;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_09d2_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1170_c30_03be_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1168_c3_02a6_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1146_c2_0776_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1151_c7_31d8_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1154_c7_3981_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1159_c7_f6f6_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1167_c7_1eaf_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c6_1819_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_a4cb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1154_c11_1921_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_72d5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_125f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_cca5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1175_c11_7cb7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1173_c21_0742_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1160_c3_92f5_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1146_c2_0776_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1151_c7_31d8_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1159_c7_f6f6_iffalse := t16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1163_l1159_l1154_l1151_l1146_l1175_DUPLICATE_95c3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1163_l1159_l1154_l1151_l1146_l1175_DUPLICATE_95c3_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1167_c11_cca5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1167_c11_cca5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_cca5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1167_c11_cca5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_cca5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_cca5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1167_c11_cca5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1146_c6_1819] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1146_c6_1819_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c6_1819_left;
     BIN_OP_EQ_uxn_opcodes_h_l1146_c6_1819_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c6_1819_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c6_1819_return_output := BIN_OP_EQ_uxn_opcodes_h_l1146_c6_1819_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1151_c11_a4cb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1151_c11_a4cb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_a4cb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1151_c11_a4cb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_a4cb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_a4cb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1151_c11_a4cb_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1155_l1160_l1164_l1168_DUPLICATE_4e3d LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1155_l1160_l1164_l1168_DUPLICATE_4e3d_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1175_c11_7cb7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1175_c11_7cb7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1175_c11_7cb7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1175_c11_7cb7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1175_c11_7cb7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1175_c11_7cb7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1175_c11_7cb7_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1163_l1159_l1154_l1151_l1175_l1167_DUPLICATE_9e49 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1163_l1159_l1154_l1151_l1175_l1167_DUPLICATE_9e49_return_output := result.is_opc_done;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1163_l1159_l1154_l1151_l1146_l1167_DUPLICATE_ea02 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1163_l1159_l1154_l1151_l1146_l1167_DUPLICATE_ea02_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1159_c11_72d5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1159_c11_72d5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_72d5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1159_c11_72d5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_72d5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_72d5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1159_c11_72d5_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1163_l1159_l1154_l1151_l1146_l1167_DUPLICATE_9e3c LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1163_l1159_l1154_l1151_l1146_l1167_DUPLICATE_9e3c_return_output := result.u8_value;

     -- sp_relative_shift[uxn_opcodes_h_l1170_c30_03be] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1170_c30_03be_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1170_c30_03be_ins;
     sp_relative_shift_uxn_opcodes_h_l1170_c30_03be_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1170_c30_03be_x;
     sp_relative_shift_uxn_opcodes_h_l1170_c30_03be_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1170_c30_03be_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1170_c30_03be_return_output := sp_relative_shift_uxn_opcodes_h_l1170_c30_03be_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1163_l1167_DUPLICATE_eeb7 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1163_l1167_DUPLICATE_eeb7_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1154_c11_1921] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1154_c11_1921_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1154_c11_1921_left;
     BIN_OP_EQ_uxn_opcodes_h_l1154_c11_1921_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1154_c11_1921_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1154_c11_1921_return_output := BIN_OP_EQ_uxn_opcodes_h_l1154_c11_1921_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1163_c11_125f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1163_c11_125f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_125f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1163_c11_125f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_125f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_125f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1163_c11_125f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1163_l1159_l1154_l1151_l1146_l1175_DUPLICATE_1fb7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1163_l1159_l1154_l1151_l1146_l1175_DUPLICATE_1fb7_return_output := result.is_stack_write;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_09d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c6_1819_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1146_c2_0776_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c6_1819_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_0776_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c6_1819_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_0776_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c6_1819_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_0776_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c6_1819_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_0776_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c6_1819_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_0776_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c6_1819_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1146_c2_0776_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c6_1819_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1146_c2_0776_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c6_1819_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1151_c7_31d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_a4cb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_31d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_a4cb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_31d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_a4cb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_31d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_a4cb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_31d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_a4cb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_31d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_a4cb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1151_c7_31d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_a4cb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1151_c7_31d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1151_c11_a4cb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1154_c7_3981_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1154_c11_1921_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_3981_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1154_c11_1921_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_3981_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1154_c11_1921_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_3981_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1154_c11_1921_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_3981_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1154_c11_1921_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_3981_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1154_c11_1921_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1154_c7_3981_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1154_c11_1921_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1154_c7_3981_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1154_c11_1921_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1159_c7_f6f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_72d5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_f6f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_72d5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_f6f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_72d5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_f6f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_72d5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_f6f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_72d5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_f6f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_72d5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1159_c7_f6f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_72d5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1159_c7_f6f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_72d5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1163_c7_0531_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_125f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_0531_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_125f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_0531_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_125f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_0531_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_125f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_0531_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_125f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_0531_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_125f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1163_c7_0531_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1163_c11_125f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1167_c7_1eaf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_cca5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_1eaf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_cca5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_1eaf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_cca5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_1eaf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_cca5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_1eaf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_cca5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_1eaf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_cca5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1167_c7_1eaf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_cca5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_047c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1175_c11_7cb7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_047c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1175_c11_7cb7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_047c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1175_c11_7cb7_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1160_c3_92f5_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1155_l1160_l1164_l1168_DUPLICATE_4e3d_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1168_c3_02a6_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1155_l1160_l1164_l1168_DUPLICATE_4e3d_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1156_l1165_DUPLICATE_50d9_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1155_l1160_l1164_l1168_DUPLICATE_4e3d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_0776_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1163_l1159_l1154_l1151_l1146_l1167_DUPLICATE_ea02_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_31d8_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1163_l1159_l1154_l1151_l1146_l1167_DUPLICATE_ea02_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_3981_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1163_l1159_l1154_l1151_l1146_l1167_DUPLICATE_ea02_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_f6f6_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1163_l1159_l1154_l1151_l1146_l1167_DUPLICATE_ea02_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_0531_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1163_l1159_l1154_l1151_l1146_l1167_DUPLICATE_ea02_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_1eaf_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1163_l1159_l1154_l1151_l1146_l1167_DUPLICATE_ea02_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_31d8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1163_l1159_l1154_l1151_l1175_l1167_DUPLICATE_9e49_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_3981_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1163_l1159_l1154_l1151_l1175_l1167_DUPLICATE_9e49_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_f6f6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1163_l1159_l1154_l1151_l1175_l1167_DUPLICATE_9e49_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_0531_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1163_l1159_l1154_l1151_l1175_l1167_DUPLICATE_9e49_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_1eaf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1163_l1159_l1154_l1151_l1175_l1167_DUPLICATE_9e49_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_047c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1163_l1159_l1154_l1151_l1175_l1167_DUPLICATE_9e49_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_0776_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1163_l1159_l1154_l1151_l1146_l1175_DUPLICATE_95c3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_31d8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1163_l1159_l1154_l1151_l1146_l1175_DUPLICATE_95c3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_3981_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1163_l1159_l1154_l1151_l1146_l1175_DUPLICATE_95c3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_f6f6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1163_l1159_l1154_l1151_l1146_l1175_DUPLICATE_95c3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_0531_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1163_l1159_l1154_l1151_l1146_l1175_DUPLICATE_95c3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_047c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1163_l1159_l1154_l1151_l1146_l1175_DUPLICATE_95c3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_0776_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1163_l1159_l1154_l1151_l1146_l1175_DUPLICATE_1fb7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_31d8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1163_l1159_l1154_l1151_l1146_l1175_DUPLICATE_1fb7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_3981_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1163_l1159_l1154_l1151_l1146_l1175_DUPLICATE_1fb7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_f6f6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1163_l1159_l1154_l1151_l1146_l1175_DUPLICATE_1fb7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_0531_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1163_l1159_l1154_l1151_l1146_l1175_DUPLICATE_1fb7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_047c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1163_l1159_l1154_l1151_l1146_l1175_DUPLICATE_1fb7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_0531_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1163_l1167_DUPLICATE_eeb7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_1eaf_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1163_l1167_DUPLICATE_eeb7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1146_c2_0776_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1163_l1159_l1154_l1151_l1146_l1167_DUPLICATE_9e3c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1151_c7_31d8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1163_l1159_l1154_l1151_l1146_l1167_DUPLICATE_9e3c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1154_c7_3981_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1163_l1159_l1154_l1151_l1146_l1167_DUPLICATE_9e3c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1159_c7_f6f6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1163_l1159_l1154_l1151_l1146_l1167_DUPLICATE_9e3c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1163_c7_0531_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1163_l1159_l1154_l1151_l1146_l1167_DUPLICATE_9e3c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1167_c7_1eaf_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1163_l1159_l1154_l1151_l1146_l1167_DUPLICATE_9e3c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_1eaf_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1170_c30_03be_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1146_c1_09d2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_09d2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_09d2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_09d2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_09d2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_09d2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_09d2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_09d2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_09d2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1175_c7_047c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_047c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_047c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_047c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_047c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_047c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_047c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_047c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_047c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1175_c7_047c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_047c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_047c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_047c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_047c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_047c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_047c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_047c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_047c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1175_c7_047c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_047c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_047c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_047c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_047c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_047c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_047c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_047c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_047c_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1160_c3_92f5] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1160_c3_92f5_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1160_c3_92f5_left;
     BIN_OP_OR_uxn_opcodes_h_l1160_c3_92f5_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1160_c3_92f5_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1160_c3_92f5_return_output := BIN_OP_OR_uxn_opcodes_h_l1160_c3_92f5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1167_c7_1eaf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_1eaf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_1eaf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_1eaf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_1eaf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_1eaf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_1eaf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_1eaf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_1eaf_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1167_c7_1eaf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_1eaf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_1eaf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_1eaf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_1eaf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_1eaf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_1eaf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_1eaf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_1eaf_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1168_c3_02a6] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1168_c3_02a6_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1168_c3_02a6_left;
     BIN_OP_OR_uxn_opcodes_h_l1168_c3_02a6_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1168_c3_02a6_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1168_c3_02a6_return_output := BIN_OP_OR_uxn_opcodes_h_l1168_c3_02a6_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1156_l1165_DUPLICATE_50d9 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1156_l1165_DUPLICATE_50d9_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1156_l1165_DUPLICATE_50d9_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1156_l1165_DUPLICATE_50d9_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1156_l1165_DUPLICATE_50d9_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1159_c7_f6f6_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1160_c3_92f5_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1173_c21_0742_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1168_c3_02a6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1167_c7_1eaf_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1168_c3_02a6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1163_c7_0531_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1156_l1165_DUPLICATE_50d9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1154_c7_3981_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1156_l1165_DUPLICATE_50d9_return_output;
     VAR_printf_uxn_opcodes_h_l1147_c3_86dd_uxn_opcodes_h_l1147_c3_86dd_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1146_c1_09d2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_1eaf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1175_c7_047c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_1eaf_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1175_c7_047c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_1eaf_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1175_c7_047c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_0531_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_1eaf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_0531_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_1eaf_return_output;
     -- t16_MUX[uxn_opcodes_h_l1159_c7_f6f6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1159_c7_f6f6_cond <= VAR_t16_MUX_uxn_opcodes_h_l1159_c7_f6f6_cond;
     t16_MUX_uxn_opcodes_h_l1159_c7_f6f6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1159_c7_f6f6_iftrue;
     t16_MUX_uxn_opcodes_h_l1159_c7_f6f6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1159_c7_f6f6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1159_c7_f6f6_return_output := t16_MUX_uxn_opcodes_h_l1159_c7_f6f6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1167_c7_1eaf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_1eaf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_1eaf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_1eaf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_1eaf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_1eaf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_1eaf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_1eaf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_1eaf_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1167_c7_1eaf] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_1eaf_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_1eaf_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_1eaf_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_1eaf_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_1eaf_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_1eaf_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_1eaf_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_1eaf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1167_c7_1eaf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_1eaf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_1eaf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_1eaf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_1eaf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_1eaf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_1eaf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_1eaf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_1eaf_return_output;

     -- printf_uxn_opcodes_h_l1147_c3_86dd[uxn_opcodes_h_l1147_c3_86dd] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1147_c3_86dd_uxn_opcodes_h_l1147_c3_86dd_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1147_c3_86dd_uxn_opcodes_h_l1147_c3_86dd_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- n16_MUX[uxn_opcodes_h_l1167_c7_1eaf] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1167_c7_1eaf_cond <= VAR_n16_MUX_uxn_opcodes_h_l1167_c7_1eaf_cond;
     n16_MUX_uxn_opcodes_h_l1167_c7_1eaf_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1167_c7_1eaf_iftrue;
     n16_MUX_uxn_opcodes_h_l1167_c7_1eaf_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1167_c7_1eaf_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1167_c7_1eaf_return_output := n16_MUX_uxn_opcodes_h_l1167_c7_1eaf_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1163_c7_0531] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_0531_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_0531_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_0531_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_0531_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_0531_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_0531_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_0531_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_0531_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1163_c7_0531] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_0531_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_0531_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_0531_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_0531_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_0531_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_0531_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_0531_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_0531_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1173_c21_0742] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1173_c21_0742_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1173_c21_0742_left;
     BIN_OP_EQ_uxn_opcodes_h_l1173_c21_0742_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1173_c21_0742_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1173_c21_0742_return_output := BIN_OP_EQ_uxn_opcodes_h_l1173_c21_0742_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1173_c21_a7eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1173_c21_0742_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1163_c7_0531_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1167_c7_1eaf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_0531_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_1eaf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_0531_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_1eaf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_0531_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_1eaf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_f6f6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1163_c7_0531_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_f6f6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1163_c7_0531_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1154_c7_3981_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1159_c7_f6f6_return_output;
     -- n16_MUX[uxn_opcodes_h_l1163_c7_0531] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1163_c7_0531_cond <= VAR_n16_MUX_uxn_opcodes_h_l1163_c7_0531_cond;
     n16_MUX_uxn_opcodes_h_l1163_c7_0531_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1163_c7_0531_iftrue;
     n16_MUX_uxn_opcodes_h_l1163_c7_0531_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1163_c7_0531_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1163_c7_0531_return_output := n16_MUX_uxn_opcodes_h_l1163_c7_0531_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1163_c7_0531] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_0531_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_0531_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_0531_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_0531_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_0531_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_0531_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_0531_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_0531_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1163_c7_0531] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_0531_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_0531_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_0531_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_0531_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_0531_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_0531_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_0531_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_0531_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1159_c7_f6f6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_f6f6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_f6f6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_f6f6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_f6f6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_f6f6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_f6f6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_f6f6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_f6f6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1159_c7_f6f6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_f6f6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_f6f6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_f6f6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_f6f6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_f6f6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_f6f6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_f6f6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_f6f6_return_output;

     -- MUX[uxn_opcodes_h_l1173_c21_a7eb] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1173_c21_a7eb_cond <= VAR_MUX_uxn_opcodes_h_l1173_c21_a7eb_cond;
     MUX_uxn_opcodes_h_l1173_c21_a7eb_iftrue <= VAR_MUX_uxn_opcodes_h_l1173_c21_a7eb_iftrue;
     MUX_uxn_opcodes_h_l1173_c21_a7eb_iffalse <= VAR_MUX_uxn_opcodes_h_l1173_c21_a7eb_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1173_c21_a7eb_return_output := MUX_uxn_opcodes_h_l1173_c21_a7eb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1163_c7_0531] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_0531_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_0531_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_0531_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_0531_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_0531_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_0531_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_0531_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_0531_return_output;

     -- t16_MUX[uxn_opcodes_h_l1154_c7_3981] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1154_c7_3981_cond <= VAR_t16_MUX_uxn_opcodes_h_l1154_c7_3981_cond;
     t16_MUX_uxn_opcodes_h_l1154_c7_3981_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1154_c7_3981_iftrue;
     t16_MUX_uxn_opcodes_h_l1154_c7_3981_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1154_c7_3981_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1154_c7_3981_return_output := t16_MUX_uxn_opcodes_h_l1154_c7_3981_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1167_c7_1eaf_iftrue := VAR_MUX_uxn_opcodes_h_l1173_c21_a7eb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1159_c7_f6f6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1163_c7_0531_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_f6f6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1163_c7_0531_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_f6f6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1163_c7_0531_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_f6f6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1163_c7_0531_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_3981_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1159_c7_f6f6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_3981_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1159_c7_f6f6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1151_c7_31d8_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1154_c7_3981_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1167_c7_1eaf] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1167_c7_1eaf_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1167_c7_1eaf_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1167_c7_1eaf_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1167_c7_1eaf_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1167_c7_1eaf_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1167_c7_1eaf_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1167_c7_1eaf_return_output := result_u8_value_MUX_uxn_opcodes_h_l1167_c7_1eaf_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1159_c7_f6f6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_f6f6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_f6f6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_f6f6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_f6f6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_f6f6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_f6f6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_f6f6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_f6f6_return_output;

     -- n16_MUX[uxn_opcodes_h_l1159_c7_f6f6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1159_c7_f6f6_cond <= VAR_n16_MUX_uxn_opcodes_h_l1159_c7_f6f6_cond;
     n16_MUX_uxn_opcodes_h_l1159_c7_f6f6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1159_c7_f6f6_iftrue;
     n16_MUX_uxn_opcodes_h_l1159_c7_f6f6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1159_c7_f6f6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1159_c7_f6f6_return_output := n16_MUX_uxn_opcodes_h_l1159_c7_f6f6_return_output;

     -- t16_MUX[uxn_opcodes_h_l1151_c7_31d8] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1151_c7_31d8_cond <= VAR_t16_MUX_uxn_opcodes_h_l1151_c7_31d8_cond;
     t16_MUX_uxn_opcodes_h_l1151_c7_31d8_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1151_c7_31d8_iftrue;
     t16_MUX_uxn_opcodes_h_l1151_c7_31d8_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1151_c7_31d8_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1151_c7_31d8_return_output := t16_MUX_uxn_opcodes_h_l1151_c7_31d8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1154_c7_3981] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_3981_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_3981_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_3981_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_3981_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_3981_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_3981_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_3981_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_3981_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1154_c7_3981] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_3981_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_3981_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_3981_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_3981_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_3981_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_3981_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_3981_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_3981_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1159_c7_f6f6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_f6f6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_f6f6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_f6f6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_f6f6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_f6f6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_f6f6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_f6f6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_f6f6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1159_c7_f6f6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_f6f6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_f6f6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_f6f6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_f6f6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_f6f6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_f6f6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_f6f6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_f6f6_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1154_c7_3981_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1159_c7_f6f6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_3981_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_f6f6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_3981_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1159_c7_f6f6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_3981_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_f6f6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_31d8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1154_c7_3981_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_31d8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1154_c7_3981_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1163_c7_0531_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1167_c7_1eaf_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1146_c2_0776_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1151_c7_31d8_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1154_c7_3981] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_3981_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_3981_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_3981_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_3981_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_3981_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_3981_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_3981_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_3981_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1154_c7_3981] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_3981_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_3981_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_3981_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_3981_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_3981_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_3981_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_3981_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_3981_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1151_c7_31d8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_31d8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_31d8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_31d8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_31d8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_31d8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_31d8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_31d8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_31d8_return_output;

     -- t16_MUX[uxn_opcodes_h_l1146_c2_0776] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1146_c2_0776_cond <= VAR_t16_MUX_uxn_opcodes_h_l1146_c2_0776_cond;
     t16_MUX_uxn_opcodes_h_l1146_c2_0776_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1146_c2_0776_iftrue;
     t16_MUX_uxn_opcodes_h_l1146_c2_0776_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1146_c2_0776_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1146_c2_0776_return_output := t16_MUX_uxn_opcodes_h_l1146_c2_0776_return_output;

     -- n16_MUX[uxn_opcodes_h_l1154_c7_3981] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1154_c7_3981_cond <= VAR_n16_MUX_uxn_opcodes_h_l1154_c7_3981_cond;
     n16_MUX_uxn_opcodes_h_l1154_c7_3981_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1154_c7_3981_iftrue;
     n16_MUX_uxn_opcodes_h_l1154_c7_3981_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1154_c7_3981_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1154_c7_3981_return_output := n16_MUX_uxn_opcodes_h_l1154_c7_3981_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1151_c7_31d8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_31d8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_31d8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_31d8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_31d8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_31d8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_31d8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_31d8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_31d8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1154_c7_3981] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_3981_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_3981_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_3981_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_3981_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_3981_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_3981_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_3981_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_3981_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1163_c7_0531] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1163_c7_0531_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1163_c7_0531_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1163_c7_0531_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1163_c7_0531_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1163_c7_0531_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1163_c7_0531_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1163_c7_0531_return_output := result_u8_value_MUX_uxn_opcodes_h_l1163_c7_0531_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1151_c7_31d8_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1154_c7_3981_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_31d8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1154_c7_3981_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_31d8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1154_c7_3981_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_31d8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1154_c7_3981_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_0776_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1151_c7_31d8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_0776_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1151_c7_31d8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1159_c7_f6f6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1163_c7_0531_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1146_c2_0776_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1151_c7_31d8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_31d8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_31d8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_31d8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_31d8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_31d8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_31d8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_31d8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_31d8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1151_c7_31d8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_31d8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_31d8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_31d8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_31d8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_31d8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_31d8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_31d8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_31d8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1146_c2_0776] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_0776_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_0776_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_0776_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_0776_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_0776_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_0776_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_0776_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_0776_return_output;

     -- n16_MUX[uxn_opcodes_h_l1151_c7_31d8] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1151_c7_31d8_cond <= VAR_n16_MUX_uxn_opcodes_h_l1151_c7_31d8_cond;
     n16_MUX_uxn_opcodes_h_l1151_c7_31d8_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1151_c7_31d8_iftrue;
     n16_MUX_uxn_opcodes_h_l1151_c7_31d8_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1151_c7_31d8_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1151_c7_31d8_return_output := n16_MUX_uxn_opcodes_h_l1151_c7_31d8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1159_c7_f6f6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1159_c7_f6f6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1159_c7_f6f6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1159_c7_f6f6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1159_c7_f6f6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1159_c7_f6f6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1159_c7_f6f6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1159_c7_f6f6_return_output := result_u8_value_MUX_uxn_opcodes_h_l1159_c7_f6f6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1151_c7_31d8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_31d8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_31d8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_31d8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_31d8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_31d8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_31d8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_31d8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_31d8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1146_c2_0776] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_0776_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_0776_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_0776_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_0776_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_0776_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_0776_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_0776_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_0776_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1146_c2_0776_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1151_c7_31d8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_0776_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1151_c7_31d8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_0776_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1151_c7_31d8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_0776_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1151_c7_31d8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1154_c7_3981_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1159_c7_f6f6_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1146_c2_0776] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_0776_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_0776_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_0776_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_0776_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_0776_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_0776_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_0776_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_0776_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1146_c2_0776] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_0776_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_0776_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_0776_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_0776_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_0776_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_0776_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_0776_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_0776_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1146_c2_0776] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_0776_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_0776_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_0776_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_0776_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_0776_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_0776_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_0776_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_0776_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1154_c7_3981] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1154_c7_3981_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1154_c7_3981_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1154_c7_3981_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1154_c7_3981_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1154_c7_3981_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1154_c7_3981_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1154_c7_3981_return_output := result_u8_value_MUX_uxn_opcodes_h_l1154_c7_3981_return_output;

     -- n16_MUX[uxn_opcodes_h_l1146_c2_0776] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1146_c2_0776_cond <= VAR_n16_MUX_uxn_opcodes_h_l1146_c2_0776_cond;
     n16_MUX_uxn_opcodes_h_l1146_c2_0776_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1146_c2_0776_iftrue;
     n16_MUX_uxn_opcodes_h_l1146_c2_0776_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1146_c2_0776_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1146_c2_0776_return_output := n16_MUX_uxn_opcodes_h_l1146_c2_0776_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1146_c2_0776_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1151_c7_31d8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1154_c7_3981_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1151_c7_31d8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1151_c7_31d8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1151_c7_31d8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1151_c7_31d8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1151_c7_31d8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1151_c7_31d8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1151_c7_31d8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1151_c7_31d8_return_output := result_u8_value_MUX_uxn_opcodes_h_l1151_c7_31d8_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1146_c2_0776_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1151_c7_31d8_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1146_c2_0776] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1146_c2_0776_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1146_c2_0776_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1146_c2_0776_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1146_c2_0776_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1146_c2_0776_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1146_c2_0776_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1146_c2_0776_return_output := result_u8_value_MUX_uxn_opcodes_h_l1146_c2_0776_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l1181_l1142_DUPLICATE_74df LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l1181_l1142_DUPLICATE_74df_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_4e73(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c2_0776_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c2_0776_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c2_0776_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c2_0776_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c2_0776_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1146_c2_0776_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l1181_l1142_DUPLICATE_74df_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l1181_l1142_DUPLICATE_74df_return_output;
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
