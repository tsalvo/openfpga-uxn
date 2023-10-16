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
-- Submodules: 111
entity swp2_0CLK_27acc40e is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end swp2_0CLK_27acc40e;
architecture arch of swp2_0CLK_27acc40e is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2750_c6_309a]
signal BIN_OP_EQ_uxn_opcodes_h_l2750_c6_309a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2750_c6_309a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2750_c6_309a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2750_c1_eb81]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_eb81_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_eb81_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_eb81_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_eb81_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2750_c2_a4cd]
signal n16_MUX_uxn_opcodes_h_l2750_c2_a4cd_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2750_c2_a4cd_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2750_c2_a4cd_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2750_c2_a4cd_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2750_c2_a4cd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2750_c2_a4cd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2750_c2_a4cd_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2750_c2_a4cd_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2750_c2_a4cd_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2750_c2_a4cd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2750_c2_a4cd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2750_c2_a4cd_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2750_c2_a4cd_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2750_c2_a4cd_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2750_c2_a4cd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2750_c2_a4cd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2750_c2_a4cd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2750_c2_a4cd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2750_c2_a4cd_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2750_c2_a4cd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2750_c2_a4cd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2750_c2_a4cd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2750_c2_a4cd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2750_c2_a4cd_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2750_c2_a4cd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2750_c2_a4cd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2750_c2_a4cd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2750_c2_a4cd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2750_c2_a4cd_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2750_c2_a4cd]
signal result_u8_value_MUX_uxn_opcodes_h_l2750_c2_a4cd_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2750_c2_a4cd_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2750_c2_a4cd_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2750_c2_a4cd_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2750_c2_a4cd]
signal t16_MUX_uxn_opcodes_h_l2750_c2_a4cd_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2750_c2_a4cd_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2750_c2_a4cd_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2750_c2_a4cd_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2751_c3_b420[uxn_opcodes_h_l2751_c3_b420]
signal printf_uxn_opcodes_h_l2751_c3_b420_uxn_opcodes_h_l2751_c3_b420_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2755_c11_4cef]
signal BIN_OP_EQ_uxn_opcodes_h_l2755_c11_4cef_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2755_c11_4cef_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2755_c11_4cef_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2755_c7_1250]
signal n16_MUX_uxn_opcodes_h_l2755_c7_1250_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2755_c7_1250_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2755_c7_1250_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2755_c7_1250_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2755_c7_1250]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c7_1250_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c7_1250_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c7_1250_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c7_1250_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2755_c7_1250]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_1250_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_1250_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_1250_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_1250_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2755_c7_1250]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c7_1250_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c7_1250_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c7_1250_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c7_1250_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2755_c7_1250]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_1250_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_1250_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_1250_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_1250_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2755_c7_1250]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2755_c7_1250_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2755_c7_1250_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2755_c7_1250_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2755_c7_1250_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2755_c7_1250]
signal result_u8_value_MUX_uxn_opcodes_h_l2755_c7_1250_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2755_c7_1250_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2755_c7_1250_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2755_c7_1250_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2755_c7_1250]
signal t16_MUX_uxn_opcodes_h_l2755_c7_1250_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2755_c7_1250_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2755_c7_1250_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2755_c7_1250_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2758_c11_8aab]
signal BIN_OP_EQ_uxn_opcodes_h_l2758_c11_8aab_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2758_c11_8aab_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2758_c11_8aab_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2758_c7_4ba1]
signal n16_MUX_uxn_opcodes_h_l2758_c7_4ba1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2758_c7_4ba1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2758_c7_4ba1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2758_c7_4ba1_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2758_c7_4ba1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2758_c7_4ba1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2758_c7_4ba1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2758_c7_4ba1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2758_c7_4ba1_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2758_c7_4ba1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2758_c7_4ba1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2758_c7_4ba1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2758_c7_4ba1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2758_c7_4ba1_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2758_c7_4ba1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2758_c7_4ba1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2758_c7_4ba1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2758_c7_4ba1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2758_c7_4ba1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2758_c7_4ba1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2758_c7_4ba1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2758_c7_4ba1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2758_c7_4ba1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2758_c7_4ba1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2758_c7_4ba1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2758_c7_4ba1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2758_c7_4ba1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2758_c7_4ba1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2758_c7_4ba1_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2758_c7_4ba1]
signal result_u8_value_MUX_uxn_opcodes_h_l2758_c7_4ba1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2758_c7_4ba1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2758_c7_4ba1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2758_c7_4ba1_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2758_c7_4ba1]
signal t16_MUX_uxn_opcodes_h_l2758_c7_4ba1_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2758_c7_4ba1_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2758_c7_4ba1_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2758_c7_4ba1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2763_c11_cf5c]
signal BIN_OP_EQ_uxn_opcodes_h_l2763_c11_cf5c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2763_c11_cf5c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2763_c11_cf5c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2763_c7_e959]
signal n16_MUX_uxn_opcodes_h_l2763_c7_e959_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2763_c7_e959_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2763_c7_e959_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2763_c7_e959_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2763_c7_e959]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2763_c7_e959_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2763_c7_e959_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2763_c7_e959_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2763_c7_e959_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2763_c7_e959]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_e959_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_e959_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_e959_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_e959_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2763_c7_e959]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2763_c7_e959_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2763_c7_e959_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2763_c7_e959_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2763_c7_e959_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2763_c7_e959]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_e959_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_e959_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_e959_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_e959_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2763_c7_e959]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2763_c7_e959_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2763_c7_e959_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2763_c7_e959_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2763_c7_e959_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2763_c7_e959]
signal result_u8_value_MUX_uxn_opcodes_h_l2763_c7_e959_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2763_c7_e959_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2763_c7_e959_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2763_c7_e959_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2763_c7_e959]
signal t16_MUX_uxn_opcodes_h_l2763_c7_e959_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2763_c7_e959_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2763_c7_e959_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2763_c7_e959_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2766_c11_ed19]
signal BIN_OP_EQ_uxn_opcodes_h_l2766_c11_ed19_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2766_c11_ed19_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2766_c11_ed19_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2766_c7_4fc2]
signal n16_MUX_uxn_opcodes_h_l2766_c7_4fc2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2766_c7_4fc2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2766_c7_4fc2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2766_c7_4fc2_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2766_c7_4fc2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_4fc2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_4fc2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_4fc2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_4fc2_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2766_c7_4fc2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_4fc2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_4fc2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_4fc2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_4fc2_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2766_c7_4fc2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_4fc2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_4fc2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_4fc2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_4fc2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2766_c7_4fc2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_4fc2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_4fc2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_4fc2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_4fc2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2766_c7_4fc2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_4fc2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_4fc2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_4fc2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_4fc2_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2766_c7_4fc2]
signal result_u8_value_MUX_uxn_opcodes_h_l2766_c7_4fc2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2766_c7_4fc2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2766_c7_4fc2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2766_c7_4fc2_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2766_c7_4fc2]
signal t16_MUX_uxn_opcodes_h_l2766_c7_4fc2_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2766_c7_4fc2_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2766_c7_4fc2_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2766_c7_4fc2_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2767_c3_011e]
signal BIN_OP_OR_uxn_opcodes_h_l2767_c3_011e_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2767_c3_011e_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2767_c3_011e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2770_c11_daf4]
signal BIN_OP_EQ_uxn_opcodes_h_l2770_c11_daf4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2770_c11_daf4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2770_c11_daf4_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2770_c7_97b8]
signal n16_MUX_uxn_opcodes_h_l2770_c7_97b8_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2770_c7_97b8_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2770_c7_97b8_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2770_c7_97b8_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2770_c7_97b8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2770_c7_97b8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2770_c7_97b8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2770_c7_97b8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2770_c7_97b8_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2770_c7_97b8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2770_c7_97b8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2770_c7_97b8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2770_c7_97b8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2770_c7_97b8_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2770_c7_97b8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2770_c7_97b8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2770_c7_97b8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2770_c7_97b8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2770_c7_97b8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2770_c7_97b8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_97b8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_97b8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_97b8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_97b8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2770_c7_97b8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_97b8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_97b8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_97b8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_97b8_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2770_c7_97b8]
signal result_u8_value_MUX_uxn_opcodes_h_l2770_c7_97b8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2770_c7_97b8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2770_c7_97b8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2770_c7_97b8_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2773_c11_de5a]
signal BIN_OP_EQ_uxn_opcodes_h_l2773_c11_de5a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2773_c11_de5a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2773_c11_de5a_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2773_c7_9fde]
signal n16_MUX_uxn_opcodes_h_l2773_c7_9fde_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2773_c7_9fde_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2773_c7_9fde_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2773_c7_9fde_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2773_c7_9fde]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_9fde_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_9fde_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_9fde_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_9fde_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2773_c7_9fde]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_9fde_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_9fde_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_9fde_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_9fde_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2773_c7_9fde]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_9fde_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_9fde_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_9fde_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_9fde_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2773_c7_9fde]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_9fde_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_9fde_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_9fde_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_9fde_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2773_c7_9fde]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_9fde_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_9fde_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_9fde_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_9fde_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2773_c7_9fde]
signal result_u8_value_MUX_uxn_opcodes_h_l2773_c7_9fde_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2773_c7_9fde_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2773_c7_9fde_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2773_c7_9fde_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2778_c11_74b2]
signal BIN_OP_EQ_uxn_opcodes_h_l2778_c11_74b2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2778_c11_74b2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2778_c11_74b2_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2778_c7_c30d]
signal n16_MUX_uxn_opcodes_h_l2778_c7_c30d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2778_c7_c30d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2778_c7_c30d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2778_c7_c30d_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2778_c7_c30d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c7_c30d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c7_c30d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c7_c30d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c7_c30d_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2778_c7_c30d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_c30d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_c30d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_c30d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_c30d_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2778_c7_c30d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c7_c30d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c7_c30d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c7_c30d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c7_c30d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2778_c7_c30d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_c30d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_c30d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_c30d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_c30d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2778_c7_c30d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2778_c7_c30d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2778_c7_c30d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2778_c7_c30d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2778_c7_c30d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2778_c7_c30d]
signal result_u8_value_MUX_uxn_opcodes_h_l2778_c7_c30d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2778_c7_c30d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2778_c7_c30d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2778_c7_c30d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2781_c11_902a]
signal BIN_OP_EQ_uxn_opcodes_h_l2781_c11_902a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2781_c11_902a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2781_c11_902a_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2781_c7_ae11]
signal n16_MUX_uxn_opcodes_h_l2781_c7_ae11_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2781_c7_ae11_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2781_c7_ae11_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2781_c7_ae11_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2781_c7_ae11]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_ae11_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_ae11_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_ae11_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_ae11_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2781_c7_ae11]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_ae11_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_ae11_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_ae11_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_ae11_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2781_c7_ae11]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_ae11_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_ae11_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_ae11_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_ae11_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2781_c7_ae11]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_ae11_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_ae11_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_ae11_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_ae11_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2781_c7_ae11]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_ae11_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_ae11_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_ae11_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_ae11_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2781_c7_ae11]
signal result_u8_value_MUX_uxn_opcodes_h_l2781_c7_ae11_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2781_c7_ae11_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2781_c7_ae11_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2781_c7_ae11_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2782_c3_f32d]
signal BIN_OP_OR_uxn_opcodes_h_l2782_c3_f32d_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2782_c3_f32d_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2782_c3_f32d_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2784_c30_4b7c]
signal sp_relative_shift_uxn_opcodes_h_l2784_c30_4b7c_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2784_c30_4b7c_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2784_c30_4b7c_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2784_c30_4b7c_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2789_c11_5b45]
signal BIN_OP_EQ_uxn_opcodes_h_l2789_c11_5b45_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2789_c11_5b45_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2789_c11_5b45_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2789_c7_a7a5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2789_c7_a7a5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2789_c7_a7a5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2789_c7_a7a5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2789_c7_a7a5_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2789_c7_a7a5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2789_c7_a7a5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2789_c7_a7a5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2789_c7_a7a5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2789_c7_a7a5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2789_c7_a7a5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_a7a5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_a7a5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_a7a5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_a7a5_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2789_c7_a7a5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_a7a5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_a7a5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_a7a5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_a7a5_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2789_c7_a7a5]
signal result_u8_value_MUX_uxn_opcodes_h_l2789_c7_a7a5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2789_c7_a7a5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2789_c7_a7a5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2789_c7_a7a5_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2792_c31_4b0c]
signal CONST_SR_8_uxn_opcodes_h_l2792_c31_4b0c_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2792_c31_4b0c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2794_c11_488b]
signal BIN_OP_EQ_uxn_opcodes_h_l2794_c11_488b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2794_c11_488b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2794_c11_488b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2794_c7_fbeb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_fbeb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_fbeb_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_fbeb_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_fbeb_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2794_c7_fbeb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_fbeb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_fbeb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_fbeb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_fbeb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2794_c7_fbeb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_fbeb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_fbeb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_fbeb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_fbeb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2794_c7_fbeb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_fbeb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_fbeb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_fbeb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_fbeb_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2794_c7_fbeb]
signal result_u8_value_MUX_uxn_opcodes_h_l2794_c7_fbeb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2794_c7_fbeb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2794_c7_fbeb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2794_c7_fbeb_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2799_c11_9526]
signal BIN_OP_EQ_uxn_opcodes_h_l2799_c11_9526_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2799_c11_9526_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2799_c11_9526_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2799_c7_325e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_325e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_325e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_325e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_325e_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2799_c7_325e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_325e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_325e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_325e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_325e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2799_c7_325e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_325e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_325e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_325e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_325e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2799_c7_325e]
signal result_u8_value_MUX_uxn_opcodes_h_l2799_c7_325e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2799_c7_325e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2799_c7_325e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2799_c7_325e_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2801_c31_cf33]
signal CONST_SR_8_uxn_opcodes_h_l2801_c31_cf33_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2801_c31_cf33_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2803_c11_db38]
signal BIN_OP_EQ_uxn_opcodes_h_l2803_c11_db38_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2803_c11_db38_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2803_c11_db38_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2803_c7_44c9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2803_c7_44c9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2803_c7_44c9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2803_c7_44c9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2803_c7_44c9_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2803_c7_44c9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2803_c7_44c9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2803_c7_44c9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2803_c7_44c9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2803_c7_44c9_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2775_l2760_DUPLICATE_a2fe
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2775_l2760_DUPLICATE_a2fe_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2775_l2760_DUPLICATE_a2fe_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_8cda( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.sp_relative_shift := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.u8_value := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2750_c6_309a
BIN_OP_EQ_uxn_opcodes_h_l2750_c6_309a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2750_c6_309a_left,
BIN_OP_EQ_uxn_opcodes_h_l2750_c6_309a_right,
BIN_OP_EQ_uxn_opcodes_h_l2750_c6_309a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_eb81
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_eb81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_eb81_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_eb81_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_eb81_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_eb81_return_output);

-- n16_MUX_uxn_opcodes_h_l2750_c2_a4cd
n16_MUX_uxn_opcodes_h_l2750_c2_a4cd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2750_c2_a4cd_cond,
n16_MUX_uxn_opcodes_h_l2750_c2_a4cd_iftrue,
n16_MUX_uxn_opcodes_h_l2750_c2_a4cd_iffalse,
n16_MUX_uxn_opcodes_h_l2750_c2_a4cd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2750_c2_a4cd
result_sp_relative_shift_MUX_uxn_opcodes_h_l2750_c2_a4cd : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2750_c2_a4cd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2750_c2_a4cd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2750_c2_a4cd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2750_c2_a4cd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2750_c2_a4cd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2750_c2_a4cd : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2750_c2_a4cd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2750_c2_a4cd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2750_c2_a4cd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2750_c2_a4cd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2750_c2_a4cd
result_is_sp_shift_MUX_uxn_opcodes_h_l2750_c2_a4cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2750_c2_a4cd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2750_c2_a4cd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2750_c2_a4cd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2750_c2_a4cd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2750_c2_a4cd
result_is_opc_done_MUX_uxn_opcodes_h_l2750_c2_a4cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2750_c2_a4cd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2750_c2_a4cd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2750_c2_a4cd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2750_c2_a4cd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2750_c2_a4cd
result_is_stack_write_MUX_uxn_opcodes_h_l2750_c2_a4cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2750_c2_a4cd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2750_c2_a4cd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2750_c2_a4cd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2750_c2_a4cd_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2750_c2_a4cd
result_u8_value_MUX_uxn_opcodes_h_l2750_c2_a4cd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2750_c2_a4cd_cond,
result_u8_value_MUX_uxn_opcodes_h_l2750_c2_a4cd_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2750_c2_a4cd_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2750_c2_a4cd_return_output);

-- t16_MUX_uxn_opcodes_h_l2750_c2_a4cd
t16_MUX_uxn_opcodes_h_l2750_c2_a4cd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2750_c2_a4cd_cond,
t16_MUX_uxn_opcodes_h_l2750_c2_a4cd_iftrue,
t16_MUX_uxn_opcodes_h_l2750_c2_a4cd_iffalse,
t16_MUX_uxn_opcodes_h_l2750_c2_a4cd_return_output);

-- printf_uxn_opcodes_h_l2751_c3_b420_uxn_opcodes_h_l2751_c3_b420
printf_uxn_opcodes_h_l2751_c3_b420_uxn_opcodes_h_l2751_c3_b420 : entity work.printf_uxn_opcodes_h_l2751_c3_b420_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2751_c3_b420_uxn_opcodes_h_l2751_c3_b420_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2755_c11_4cef
BIN_OP_EQ_uxn_opcodes_h_l2755_c11_4cef : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2755_c11_4cef_left,
BIN_OP_EQ_uxn_opcodes_h_l2755_c11_4cef_right,
BIN_OP_EQ_uxn_opcodes_h_l2755_c11_4cef_return_output);

-- n16_MUX_uxn_opcodes_h_l2755_c7_1250
n16_MUX_uxn_opcodes_h_l2755_c7_1250 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2755_c7_1250_cond,
n16_MUX_uxn_opcodes_h_l2755_c7_1250_iftrue,
n16_MUX_uxn_opcodes_h_l2755_c7_1250_iffalse,
n16_MUX_uxn_opcodes_h_l2755_c7_1250_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c7_1250
result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c7_1250 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c7_1250_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c7_1250_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c7_1250_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c7_1250_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_1250
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_1250 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_1250_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_1250_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_1250_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_1250_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c7_1250
result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c7_1250 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c7_1250_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c7_1250_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c7_1250_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c7_1250_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_1250
result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_1250 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_1250_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_1250_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_1250_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_1250_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2755_c7_1250
result_is_stack_write_MUX_uxn_opcodes_h_l2755_c7_1250 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2755_c7_1250_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2755_c7_1250_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2755_c7_1250_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2755_c7_1250_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2755_c7_1250
result_u8_value_MUX_uxn_opcodes_h_l2755_c7_1250 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2755_c7_1250_cond,
result_u8_value_MUX_uxn_opcodes_h_l2755_c7_1250_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2755_c7_1250_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2755_c7_1250_return_output);

-- t16_MUX_uxn_opcodes_h_l2755_c7_1250
t16_MUX_uxn_opcodes_h_l2755_c7_1250 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2755_c7_1250_cond,
t16_MUX_uxn_opcodes_h_l2755_c7_1250_iftrue,
t16_MUX_uxn_opcodes_h_l2755_c7_1250_iffalse,
t16_MUX_uxn_opcodes_h_l2755_c7_1250_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2758_c11_8aab
BIN_OP_EQ_uxn_opcodes_h_l2758_c11_8aab : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2758_c11_8aab_left,
BIN_OP_EQ_uxn_opcodes_h_l2758_c11_8aab_right,
BIN_OP_EQ_uxn_opcodes_h_l2758_c11_8aab_return_output);

-- n16_MUX_uxn_opcodes_h_l2758_c7_4ba1
n16_MUX_uxn_opcodes_h_l2758_c7_4ba1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2758_c7_4ba1_cond,
n16_MUX_uxn_opcodes_h_l2758_c7_4ba1_iftrue,
n16_MUX_uxn_opcodes_h_l2758_c7_4ba1_iffalse,
n16_MUX_uxn_opcodes_h_l2758_c7_4ba1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2758_c7_4ba1
result_sp_relative_shift_MUX_uxn_opcodes_h_l2758_c7_4ba1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2758_c7_4ba1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2758_c7_4ba1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2758_c7_4ba1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2758_c7_4ba1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2758_c7_4ba1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2758_c7_4ba1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2758_c7_4ba1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2758_c7_4ba1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2758_c7_4ba1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2758_c7_4ba1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2758_c7_4ba1
result_is_sp_shift_MUX_uxn_opcodes_h_l2758_c7_4ba1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2758_c7_4ba1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2758_c7_4ba1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2758_c7_4ba1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2758_c7_4ba1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2758_c7_4ba1
result_is_opc_done_MUX_uxn_opcodes_h_l2758_c7_4ba1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2758_c7_4ba1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2758_c7_4ba1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2758_c7_4ba1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2758_c7_4ba1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2758_c7_4ba1
result_is_stack_write_MUX_uxn_opcodes_h_l2758_c7_4ba1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2758_c7_4ba1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2758_c7_4ba1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2758_c7_4ba1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2758_c7_4ba1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2758_c7_4ba1
result_u8_value_MUX_uxn_opcodes_h_l2758_c7_4ba1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2758_c7_4ba1_cond,
result_u8_value_MUX_uxn_opcodes_h_l2758_c7_4ba1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2758_c7_4ba1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2758_c7_4ba1_return_output);

-- t16_MUX_uxn_opcodes_h_l2758_c7_4ba1
t16_MUX_uxn_opcodes_h_l2758_c7_4ba1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2758_c7_4ba1_cond,
t16_MUX_uxn_opcodes_h_l2758_c7_4ba1_iftrue,
t16_MUX_uxn_opcodes_h_l2758_c7_4ba1_iffalse,
t16_MUX_uxn_opcodes_h_l2758_c7_4ba1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2763_c11_cf5c
BIN_OP_EQ_uxn_opcodes_h_l2763_c11_cf5c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2763_c11_cf5c_left,
BIN_OP_EQ_uxn_opcodes_h_l2763_c11_cf5c_right,
BIN_OP_EQ_uxn_opcodes_h_l2763_c11_cf5c_return_output);

-- n16_MUX_uxn_opcodes_h_l2763_c7_e959
n16_MUX_uxn_opcodes_h_l2763_c7_e959 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2763_c7_e959_cond,
n16_MUX_uxn_opcodes_h_l2763_c7_e959_iftrue,
n16_MUX_uxn_opcodes_h_l2763_c7_e959_iffalse,
n16_MUX_uxn_opcodes_h_l2763_c7_e959_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2763_c7_e959
result_sp_relative_shift_MUX_uxn_opcodes_h_l2763_c7_e959 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2763_c7_e959_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2763_c7_e959_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2763_c7_e959_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2763_c7_e959_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_e959
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_e959 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_e959_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_e959_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_e959_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_e959_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2763_c7_e959
result_is_sp_shift_MUX_uxn_opcodes_h_l2763_c7_e959 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2763_c7_e959_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2763_c7_e959_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2763_c7_e959_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2763_c7_e959_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_e959
result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_e959 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_e959_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_e959_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_e959_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_e959_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2763_c7_e959
result_is_stack_write_MUX_uxn_opcodes_h_l2763_c7_e959 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2763_c7_e959_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2763_c7_e959_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2763_c7_e959_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2763_c7_e959_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2763_c7_e959
result_u8_value_MUX_uxn_opcodes_h_l2763_c7_e959 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2763_c7_e959_cond,
result_u8_value_MUX_uxn_opcodes_h_l2763_c7_e959_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2763_c7_e959_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2763_c7_e959_return_output);

-- t16_MUX_uxn_opcodes_h_l2763_c7_e959
t16_MUX_uxn_opcodes_h_l2763_c7_e959 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2763_c7_e959_cond,
t16_MUX_uxn_opcodes_h_l2763_c7_e959_iftrue,
t16_MUX_uxn_opcodes_h_l2763_c7_e959_iffalse,
t16_MUX_uxn_opcodes_h_l2763_c7_e959_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2766_c11_ed19
BIN_OP_EQ_uxn_opcodes_h_l2766_c11_ed19 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2766_c11_ed19_left,
BIN_OP_EQ_uxn_opcodes_h_l2766_c11_ed19_right,
BIN_OP_EQ_uxn_opcodes_h_l2766_c11_ed19_return_output);

-- n16_MUX_uxn_opcodes_h_l2766_c7_4fc2
n16_MUX_uxn_opcodes_h_l2766_c7_4fc2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2766_c7_4fc2_cond,
n16_MUX_uxn_opcodes_h_l2766_c7_4fc2_iftrue,
n16_MUX_uxn_opcodes_h_l2766_c7_4fc2_iffalse,
n16_MUX_uxn_opcodes_h_l2766_c7_4fc2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_4fc2
result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_4fc2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_4fc2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_4fc2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_4fc2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_4fc2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_4fc2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_4fc2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_4fc2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_4fc2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_4fc2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_4fc2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_4fc2
result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_4fc2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_4fc2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_4fc2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_4fc2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_4fc2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_4fc2
result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_4fc2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_4fc2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_4fc2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_4fc2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_4fc2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_4fc2
result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_4fc2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_4fc2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_4fc2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_4fc2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_4fc2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2766_c7_4fc2
result_u8_value_MUX_uxn_opcodes_h_l2766_c7_4fc2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2766_c7_4fc2_cond,
result_u8_value_MUX_uxn_opcodes_h_l2766_c7_4fc2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2766_c7_4fc2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2766_c7_4fc2_return_output);

-- t16_MUX_uxn_opcodes_h_l2766_c7_4fc2
t16_MUX_uxn_opcodes_h_l2766_c7_4fc2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2766_c7_4fc2_cond,
t16_MUX_uxn_opcodes_h_l2766_c7_4fc2_iftrue,
t16_MUX_uxn_opcodes_h_l2766_c7_4fc2_iffalse,
t16_MUX_uxn_opcodes_h_l2766_c7_4fc2_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2767_c3_011e
BIN_OP_OR_uxn_opcodes_h_l2767_c3_011e : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2767_c3_011e_left,
BIN_OP_OR_uxn_opcodes_h_l2767_c3_011e_right,
BIN_OP_OR_uxn_opcodes_h_l2767_c3_011e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2770_c11_daf4
BIN_OP_EQ_uxn_opcodes_h_l2770_c11_daf4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2770_c11_daf4_left,
BIN_OP_EQ_uxn_opcodes_h_l2770_c11_daf4_right,
BIN_OP_EQ_uxn_opcodes_h_l2770_c11_daf4_return_output);

-- n16_MUX_uxn_opcodes_h_l2770_c7_97b8
n16_MUX_uxn_opcodes_h_l2770_c7_97b8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2770_c7_97b8_cond,
n16_MUX_uxn_opcodes_h_l2770_c7_97b8_iftrue,
n16_MUX_uxn_opcodes_h_l2770_c7_97b8_iffalse,
n16_MUX_uxn_opcodes_h_l2770_c7_97b8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2770_c7_97b8
result_sp_relative_shift_MUX_uxn_opcodes_h_l2770_c7_97b8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2770_c7_97b8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2770_c7_97b8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2770_c7_97b8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2770_c7_97b8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2770_c7_97b8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2770_c7_97b8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2770_c7_97b8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2770_c7_97b8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2770_c7_97b8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2770_c7_97b8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2770_c7_97b8
result_is_sp_shift_MUX_uxn_opcodes_h_l2770_c7_97b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2770_c7_97b8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2770_c7_97b8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2770_c7_97b8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2770_c7_97b8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_97b8
result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_97b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_97b8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_97b8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_97b8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_97b8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_97b8
result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_97b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_97b8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_97b8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_97b8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_97b8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2770_c7_97b8
result_u8_value_MUX_uxn_opcodes_h_l2770_c7_97b8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2770_c7_97b8_cond,
result_u8_value_MUX_uxn_opcodes_h_l2770_c7_97b8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2770_c7_97b8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2770_c7_97b8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2773_c11_de5a
BIN_OP_EQ_uxn_opcodes_h_l2773_c11_de5a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2773_c11_de5a_left,
BIN_OP_EQ_uxn_opcodes_h_l2773_c11_de5a_right,
BIN_OP_EQ_uxn_opcodes_h_l2773_c11_de5a_return_output);

-- n16_MUX_uxn_opcodes_h_l2773_c7_9fde
n16_MUX_uxn_opcodes_h_l2773_c7_9fde : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2773_c7_9fde_cond,
n16_MUX_uxn_opcodes_h_l2773_c7_9fde_iftrue,
n16_MUX_uxn_opcodes_h_l2773_c7_9fde_iffalse,
n16_MUX_uxn_opcodes_h_l2773_c7_9fde_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_9fde
result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_9fde : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_9fde_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_9fde_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_9fde_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_9fde_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_9fde
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_9fde : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_9fde_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_9fde_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_9fde_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_9fde_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_9fde
result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_9fde : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_9fde_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_9fde_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_9fde_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_9fde_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_9fde
result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_9fde : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_9fde_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_9fde_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_9fde_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_9fde_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_9fde
result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_9fde : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_9fde_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_9fde_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_9fde_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_9fde_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2773_c7_9fde
result_u8_value_MUX_uxn_opcodes_h_l2773_c7_9fde : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2773_c7_9fde_cond,
result_u8_value_MUX_uxn_opcodes_h_l2773_c7_9fde_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2773_c7_9fde_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2773_c7_9fde_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2778_c11_74b2
BIN_OP_EQ_uxn_opcodes_h_l2778_c11_74b2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2778_c11_74b2_left,
BIN_OP_EQ_uxn_opcodes_h_l2778_c11_74b2_right,
BIN_OP_EQ_uxn_opcodes_h_l2778_c11_74b2_return_output);

-- n16_MUX_uxn_opcodes_h_l2778_c7_c30d
n16_MUX_uxn_opcodes_h_l2778_c7_c30d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2778_c7_c30d_cond,
n16_MUX_uxn_opcodes_h_l2778_c7_c30d_iftrue,
n16_MUX_uxn_opcodes_h_l2778_c7_c30d_iffalse,
n16_MUX_uxn_opcodes_h_l2778_c7_c30d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c7_c30d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c7_c30d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c7_c30d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c7_c30d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c7_c30d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c7_c30d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_c30d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_c30d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_c30d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_c30d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_c30d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_c30d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c7_c30d
result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c7_c30d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c7_c30d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c7_c30d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c7_c30d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c7_c30d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_c30d
result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_c30d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_c30d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_c30d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_c30d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_c30d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2778_c7_c30d
result_is_stack_write_MUX_uxn_opcodes_h_l2778_c7_c30d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2778_c7_c30d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2778_c7_c30d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2778_c7_c30d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2778_c7_c30d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2778_c7_c30d
result_u8_value_MUX_uxn_opcodes_h_l2778_c7_c30d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2778_c7_c30d_cond,
result_u8_value_MUX_uxn_opcodes_h_l2778_c7_c30d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2778_c7_c30d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2778_c7_c30d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2781_c11_902a
BIN_OP_EQ_uxn_opcodes_h_l2781_c11_902a : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2781_c11_902a_left,
BIN_OP_EQ_uxn_opcodes_h_l2781_c11_902a_right,
BIN_OP_EQ_uxn_opcodes_h_l2781_c11_902a_return_output);

-- n16_MUX_uxn_opcodes_h_l2781_c7_ae11
n16_MUX_uxn_opcodes_h_l2781_c7_ae11 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2781_c7_ae11_cond,
n16_MUX_uxn_opcodes_h_l2781_c7_ae11_iftrue,
n16_MUX_uxn_opcodes_h_l2781_c7_ae11_iffalse,
n16_MUX_uxn_opcodes_h_l2781_c7_ae11_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_ae11
result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_ae11 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_ae11_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_ae11_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_ae11_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_ae11_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_ae11
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_ae11 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_ae11_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_ae11_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_ae11_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_ae11_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_ae11
result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_ae11 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_ae11_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_ae11_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_ae11_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_ae11_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_ae11
result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_ae11 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_ae11_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_ae11_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_ae11_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_ae11_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_ae11
result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_ae11 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_ae11_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_ae11_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_ae11_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_ae11_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2781_c7_ae11
result_u8_value_MUX_uxn_opcodes_h_l2781_c7_ae11 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2781_c7_ae11_cond,
result_u8_value_MUX_uxn_opcodes_h_l2781_c7_ae11_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2781_c7_ae11_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2781_c7_ae11_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2782_c3_f32d
BIN_OP_OR_uxn_opcodes_h_l2782_c3_f32d : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2782_c3_f32d_left,
BIN_OP_OR_uxn_opcodes_h_l2782_c3_f32d_right,
BIN_OP_OR_uxn_opcodes_h_l2782_c3_f32d_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2784_c30_4b7c
sp_relative_shift_uxn_opcodes_h_l2784_c30_4b7c : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2784_c30_4b7c_ins,
sp_relative_shift_uxn_opcodes_h_l2784_c30_4b7c_x,
sp_relative_shift_uxn_opcodes_h_l2784_c30_4b7c_y,
sp_relative_shift_uxn_opcodes_h_l2784_c30_4b7c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2789_c11_5b45
BIN_OP_EQ_uxn_opcodes_h_l2789_c11_5b45 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2789_c11_5b45_left,
BIN_OP_EQ_uxn_opcodes_h_l2789_c11_5b45_right,
BIN_OP_EQ_uxn_opcodes_h_l2789_c11_5b45_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2789_c7_a7a5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2789_c7_a7a5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2789_c7_a7a5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2789_c7_a7a5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2789_c7_a7a5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2789_c7_a7a5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2789_c7_a7a5
result_is_sp_shift_MUX_uxn_opcodes_h_l2789_c7_a7a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2789_c7_a7a5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2789_c7_a7a5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2789_c7_a7a5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2789_c7_a7a5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_a7a5
result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_a7a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_a7a5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_a7a5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_a7a5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_a7a5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_a7a5
result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_a7a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_a7a5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_a7a5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_a7a5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_a7a5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2789_c7_a7a5
result_u8_value_MUX_uxn_opcodes_h_l2789_c7_a7a5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2789_c7_a7a5_cond,
result_u8_value_MUX_uxn_opcodes_h_l2789_c7_a7a5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2789_c7_a7a5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2789_c7_a7a5_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2792_c31_4b0c
CONST_SR_8_uxn_opcodes_h_l2792_c31_4b0c : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2792_c31_4b0c_x,
CONST_SR_8_uxn_opcodes_h_l2792_c31_4b0c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2794_c11_488b
BIN_OP_EQ_uxn_opcodes_h_l2794_c11_488b : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2794_c11_488b_left,
BIN_OP_EQ_uxn_opcodes_h_l2794_c11_488b_right,
BIN_OP_EQ_uxn_opcodes_h_l2794_c11_488b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_fbeb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_fbeb : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_fbeb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_fbeb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_fbeb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_fbeb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_fbeb
result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_fbeb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_fbeb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_fbeb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_fbeb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_fbeb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_fbeb
result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_fbeb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_fbeb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_fbeb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_fbeb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_fbeb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_fbeb
result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_fbeb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_fbeb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_fbeb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_fbeb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_fbeb_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2794_c7_fbeb
result_u8_value_MUX_uxn_opcodes_h_l2794_c7_fbeb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2794_c7_fbeb_cond,
result_u8_value_MUX_uxn_opcodes_h_l2794_c7_fbeb_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2794_c7_fbeb_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2794_c7_fbeb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2799_c11_9526
BIN_OP_EQ_uxn_opcodes_h_l2799_c11_9526 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2799_c11_9526_left,
BIN_OP_EQ_uxn_opcodes_h_l2799_c11_9526_right,
BIN_OP_EQ_uxn_opcodes_h_l2799_c11_9526_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_325e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_325e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_325e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_325e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_325e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_325e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_325e
result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_325e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_325e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_325e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_325e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_325e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_325e
result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_325e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_325e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_325e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_325e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_325e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2799_c7_325e
result_u8_value_MUX_uxn_opcodes_h_l2799_c7_325e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2799_c7_325e_cond,
result_u8_value_MUX_uxn_opcodes_h_l2799_c7_325e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2799_c7_325e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2799_c7_325e_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2801_c31_cf33
CONST_SR_8_uxn_opcodes_h_l2801_c31_cf33 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2801_c31_cf33_x,
CONST_SR_8_uxn_opcodes_h_l2801_c31_cf33_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2803_c11_db38
BIN_OP_EQ_uxn_opcodes_h_l2803_c11_db38 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2803_c11_db38_left,
BIN_OP_EQ_uxn_opcodes_h_l2803_c11_db38_right,
BIN_OP_EQ_uxn_opcodes_h_l2803_c11_db38_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2803_c7_44c9
result_is_opc_done_MUX_uxn_opcodes_h_l2803_c7_44c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2803_c7_44c9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2803_c7_44c9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2803_c7_44c9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2803_c7_44c9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2803_c7_44c9
result_is_stack_write_MUX_uxn_opcodes_h_l2803_c7_44c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2803_c7_44c9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2803_c7_44c9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2803_c7_44c9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2803_c7_44c9_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2775_l2760_DUPLICATE_a2fe
CONST_SL_8_uint16_t_uxn_opcodes_h_l2775_l2760_DUPLICATE_a2fe : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2775_l2760_DUPLICATE_a2fe_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2775_l2760_DUPLICATE_a2fe_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2750_c6_309a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_eb81_return_output,
 n16_MUX_uxn_opcodes_h_l2750_c2_a4cd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2750_c2_a4cd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2750_c2_a4cd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2750_c2_a4cd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2750_c2_a4cd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2750_c2_a4cd_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2750_c2_a4cd_return_output,
 t16_MUX_uxn_opcodes_h_l2750_c2_a4cd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2755_c11_4cef_return_output,
 n16_MUX_uxn_opcodes_h_l2755_c7_1250_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c7_1250_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_1250_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c7_1250_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_1250_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2755_c7_1250_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2755_c7_1250_return_output,
 t16_MUX_uxn_opcodes_h_l2755_c7_1250_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2758_c11_8aab_return_output,
 n16_MUX_uxn_opcodes_h_l2758_c7_4ba1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2758_c7_4ba1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2758_c7_4ba1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2758_c7_4ba1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2758_c7_4ba1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2758_c7_4ba1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2758_c7_4ba1_return_output,
 t16_MUX_uxn_opcodes_h_l2758_c7_4ba1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2763_c11_cf5c_return_output,
 n16_MUX_uxn_opcodes_h_l2763_c7_e959_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2763_c7_e959_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_e959_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2763_c7_e959_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_e959_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2763_c7_e959_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2763_c7_e959_return_output,
 t16_MUX_uxn_opcodes_h_l2763_c7_e959_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2766_c11_ed19_return_output,
 n16_MUX_uxn_opcodes_h_l2766_c7_4fc2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_4fc2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_4fc2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_4fc2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_4fc2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_4fc2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2766_c7_4fc2_return_output,
 t16_MUX_uxn_opcodes_h_l2766_c7_4fc2_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2767_c3_011e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2770_c11_daf4_return_output,
 n16_MUX_uxn_opcodes_h_l2770_c7_97b8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2770_c7_97b8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2770_c7_97b8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2770_c7_97b8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_97b8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_97b8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2770_c7_97b8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2773_c11_de5a_return_output,
 n16_MUX_uxn_opcodes_h_l2773_c7_9fde_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_9fde_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_9fde_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_9fde_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_9fde_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_9fde_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2773_c7_9fde_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2778_c11_74b2_return_output,
 n16_MUX_uxn_opcodes_h_l2778_c7_c30d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c7_c30d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_c30d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c7_c30d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_c30d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2778_c7_c30d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2778_c7_c30d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2781_c11_902a_return_output,
 n16_MUX_uxn_opcodes_h_l2781_c7_ae11_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_ae11_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_ae11_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_ae11_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_ae11_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_ae11_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2781_c7_ae11_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2782_c3_f32d_return_output,
 sp_relative_shift_uxn_opcodes_h_l2784_c30_4b7c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2789_c11_5b45_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2789_c7_a7a5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2789_c7_a7a5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_a7a5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_a7a5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2789_c7_a7a5_return_output,
 CONST_SR_8_uxn_opcodes_h_l2792_c31_4b0c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2794_c11_488b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_fbeb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_fbeb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_fbeb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_fbeb_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2794_c7_fbeb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2799_c11_9526_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_325e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_325e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_325e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2799_c7_325e_return_output,
 CONST_SR_8_uxn_opcodes_h_l2801_c31_cf33_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2803_c11_db38_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2803_c7_44c9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2803_c7_44c9_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2775_l2760_DUPLICATE_a2fe_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c6_309a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c6_309a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c6_309a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_eb81_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_eb81_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_eb81_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_eb81_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2750_c2_a4cd_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2750_c2_a4cd_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2755_c7_1250_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2750_c2_a4cd_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2750_c2_a4cd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2750_c2_a4cd_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2750_c2_a4cd_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c7_1250_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2750_c2_a4cd_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2750_c2_a4cd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2750_c2_a4cd_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2752_c3_a91a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2750_c2_a4cd_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_1250_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2750_c2_a4cd_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2750_c2_a4cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2750_c2_a4cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2750_c2_a4cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c7_1250_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2750_c2_a4cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2750_c2_a4cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2750_c2_a4cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2750_c2_a4cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_1250_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2750_c2_a4cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2750_c2_a4cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2750_c2_a4cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2750_c2_a4cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2755_c7_1250_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2750_c2_a4cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2750_c2_a4cd_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2750_c2_a4cd_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2750_c2_a4cd_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c7_1250_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2750_c2_a4cd_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2750_c2_a4cd_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2750_c2_a4cd_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2750_c2_a4cd_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2755_c7_1250_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2750_c2_a4cd_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2750_c2_a4cd_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2751_c3_b420_uxn_opcodes_h_l2751_c3_b420_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_4cef_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_4cef_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_4cef_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2755_c7_1250_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2755_c7_1250_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2758_c7_4ba1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2755_c7_1250_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c7_1250_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c7_1250_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2758_c7_4ba1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c7_1250_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_1250_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2756_c3_81bc : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_1250_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2758_c7_4ba1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_1250_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c7_1250_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c7_1250_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2758_c7_4ba1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c7_1250_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_1250_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_1250_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2758_c7_4ba1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_1250_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2755_c7_1250_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2755_c7_1250_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2758_c7_4ba1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2755_c7_1250_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c7_1250_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c7_1250_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2758_c7_4ba1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c7_1250_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2755_c7_1250_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2755_c7_1250_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2758_c7_4ba1_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2755_c7_1250_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_8aab_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_8aab_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_8aab_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2758_c7_4ba1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2758_c7_4ba1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2763_c7_e959_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2758_c7_4ba1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2758_c7_4ba1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2758_c7_4ba1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2763_c7_e959_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2758_c7_4ba1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2758_c7_4ba1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2761_c3_3223 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2758_c7_4ba1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_e959_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2758_c7_4ba1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2758_c7_4ba1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2758_c7_4ba1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2763_c7_e959_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2758_c7_4ba1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2758_c7_4ba1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2758_c7_4ba1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_e959_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2758_c7_4ba1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2758_c7_4ba1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2758_c7_4ba1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2763_c7_e959_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2758_c7_4ba1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2758_c7_4ba1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2758_c7_4ba1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2763_c7_e959_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2758_c7_4ba1_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2758_c7_4ba1_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2758_c7_4ba1_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2763_c7_e959_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2758_c7_4ba1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_cf5c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_cf5c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_cf5c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2763_c7_e959_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2763_c7_e959_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2766_c7_4fc2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2763_c7_e959_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2763_c7_e959_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2763_c7_e959_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_4fc2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2763_c7_e959_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_e959_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2764_c3_4869 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_e959_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_4fc2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_e959_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2763_c7_e959_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2763_c7_e959_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_4fc2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2763_c7_e959_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_e959_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_e959_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_4fc2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_e959_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2763_c7_e959_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2763_c7_e959_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_4fc2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2763_c7_e959_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2763_c7_e959_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2763_c7_e959_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2766_c7_4fc2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2763_c7_e959_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2763_c7_e959_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2763_c7_e959_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2766_c7_4fc2_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2763_c7_e959_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_ed19_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_ed19_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_ed19_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2766_c7_4fc2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2766_c7_4fc2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2770_c7_97b8_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2766_c7_4fc2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_4fc2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_4fc2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2770_c7_97b8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_4fc2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_4fc2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2768_c3_adda : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_4fc2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2770_c7_97b8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_4fc2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_4fc2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_4fc2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2770_c7_97b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_4fc2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_4fc2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_4fc2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_97b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_4fc2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_4fc2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_4fc2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_97b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_4fc2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2766_c7_4fc2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2766_c7_4fc2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2770_c7_97b8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2766_c7_4fc2_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2766_c7_4fc2_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2766_c7_4fc2_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2766_c7_4fc2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2767_c3_011e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2767_c3_011e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2767_c3_011e_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_daf4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_daf4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_daf4_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2770_c7_97b8_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2770_c7_97b8_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2773_c7_9fde_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2770_c7_97b8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2770_c7_97b8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2770_c7_97b8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_9fde_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2770_c7_97b8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2770_c7_97b8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2771_c3_9e78 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2770_c7_97b8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_9fde_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2770_c7_97b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2770_c7_97b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2770_c7_97b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_9fde_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2770_c7_97b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_97b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_97b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_9fde_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_97b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_97b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_97b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_9fde_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_97b8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2770_c7_97b8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2770_c7_97b8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2773_c7_9fde_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2770_c7_97b8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_de5a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_de5a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_de5a_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2773_c7_9fde_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2773_c7_9fde_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2778_c7_c30d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2773_c7_9fde_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_9fde_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_9fde_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c7_c30d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_9fde_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_9fde_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2776_c3_ca78 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_9fde_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_c30d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_9fde_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_9fde_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_9fde_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c7_c30d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_9fde_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_9fde_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_9fde_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_c30d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_9fde_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_9fde_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_9fde_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2778_c7_c30d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_9fde_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2773_c7_9fde_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2773_c7_9fde_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2778_c7_c30d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2773_c7_9fde_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c11_74b2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c11_74b2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c11_74b2_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2778_c7_c30d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2778_c7_c30d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2781_c7_ae11_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2778_c7_c30d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c7_c30d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c7_c30d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_ae11_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c7_c30d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_c30d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2779_c3_5195 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_c30d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_ae11_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_c30d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c7_c30d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c7_c30d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_ae11_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c7_c30d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_c30d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_c30d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_ae11_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_c30d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2778_c7_c30d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2778_c7_c30d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_ae11_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2778_c7_c30d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2778_c7_c30d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2778_c7_c30d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2781_c7_ae11_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2778_c7_c30d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_902a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_902a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_902a_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2781_c7_ae11_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2781_c7_ae11_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2781_c7_ae11_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_ae11_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_ae11_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_ae11_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_ae11_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2786_c3_d724 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_ae11_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2789_c7_a7a5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_ae11_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_ae11_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_ae11_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2789_c7_a7a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_ae11_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_ae11_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_ae11_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_a7a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_ae11_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_ae11_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_ae11_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_a7a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_ae11_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2781_c7_ae11_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2781_c7_ae11_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2789_c7_a7a5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2781_c7_ae11_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2782_c3_f32d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2782_c3_f32d_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2782_c3_f32d_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2784_c30_4b7c_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2784_c30_4b7c_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2784_c30_4b7c_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2784_c30_4b7c_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2787_c21_c85f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2789_c11_5b45_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2789_c11_5b45_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2789_c11_5b45_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2789_c7_a7a5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2791_c3_f1f2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2789_c7_a7a5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_fbeb_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2789_c7_a7a5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2789_c7_a7a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2789_c7_a7a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_fbeb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2789_c7_a7a5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_a7a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_a7a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_fbeb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_a7a5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_a7a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_a7a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_fbeb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_a7a5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2789_c7_a7a5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2789_c7_a7a5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2794_c7_fbeb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2789_c7_a7a5_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2792_c31_4b0c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2792_c31_4b0c_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2792_c21_e4e7_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2794_c11_488b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2794_c11_488b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2794_c11_488b_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_fbeb_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2796_c3_a283 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_fbeb_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_325e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_fbeb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_fbeb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_fbeb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_fbeb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_fbeb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_fbeb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_325e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_fbeb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_fbeb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_fbeb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_325e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_fbeb_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2794_c7_fbeb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2794_c7_fbeb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2799_c7_325e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2794_c7_fbeb_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2797_c21_bf52_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2799_c11_9526_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2799_c11_9526_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2799_c11_9526_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_325e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2800_c3_219e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_325e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2799_c7_325e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_325e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_325e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_325e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2803_c7_44c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_325e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_325e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_325e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2803_c7_44c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_325e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2799_c7_325e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2799_c7_325e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2799_c7_325e_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2801_c31_cf33_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2801_c31_cf33_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2801_c21_f844_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2803_c11_db38_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2803_c11_db38_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2803_c11_db38_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2803_c7_44c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2803_c7_44c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2803_c7_44c9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2803_c7_44c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2803_c7_44c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2803_c7_44c9_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2773_l2770_l2766_l2763_l2758_l2781_l2755_l2778_l2750_DUPLICATE_0405_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2773_l2770_l2766_l2794_l2763_l2758_l2755_l2778_l2750_DUPLICATE_2505_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2773_l2803_l2770_l2799_l2766_l2794_l2763_l2789_l2758_l2755_l2778_l2750_DUPLICATE_24bd_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2773_l2770_l2799_l2766_l2763_l2758_l2755_l2778_l2750_DUPLICATE_c702_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2773_l2803_l2770_l2799_l2766_l2794_l2763_l2789_l2758_l2781_l2755_l2778_DUPLICATE_b4ba_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2767_l2774_l2782_l2759_DUPLICATE_9361_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2775_l2760_DUPLICATE_a2fe_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2775_l2760_DUPLICATE_a2fe_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l2746_l2808_DUPLICATE_e969_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_8aab_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_cf5c_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2803_c7_44c9_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2800_c3_219e := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_325e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2800_c3_219e;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2761_c3_3223 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2758_c7_4ba1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2761_c3_3223;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_de5a_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_ed19_right := to_unsigned(4, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_ae11_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_ae11_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2776_c3_ca78 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_9fde_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2776_c3_ca78;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_4cef_right := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_eb81_iffalse := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2789_c7_a7a5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2789_c11_5b45_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_daf4_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c11_74b2_right := to_unsigned(7, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2803_c7_44c9_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2803_c11_db38_right := to_unsigned(12, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2796_c3_a283 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_fbeb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2796_c3_a283;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c6_309a_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2756_c3_81bc := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_1250_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2756_c3_81bc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_902a_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2786_c3_d724 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_ae11_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2786_c3_d724;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2771_c3_9e78 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2770_c7_97b8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2771_c3_9e78;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2779_c3_5195 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_c30d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2779_c3_5195;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2752_c3_a91a := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2750_c2_a4cd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2752_c3_a91a;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2791_c3_f1f2 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2789_c7_a7a5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2791_c3_f1f2;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2794_c11_488b_right := to_unsigned(10, 4);
     VAR_sp_relative_shift_uxn_opcodes_h_l2784_c30_4b7c_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_fbeb_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2768_c3_adda := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_4fc2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2768_c3_adda;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2764_c3_4869 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_e959_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2764_c3_4869;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2750_c2_a4cd_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2784_c30_4b7c_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2799_c11_9526_right := to_unsigned(11, 4);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_eb81_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2784_c30_4b7c_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2782_c3_f32d_left := n16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2792_c31_4b0c_x := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2750_c2_a4cd_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2755_c7_1250_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2758_c7_4ba1_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2763_c7_e959_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2766_c7_4fc2_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2770_c7_97b8_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2778_c7_c30d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2781_c7_ae11_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c6_309a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_4cef_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_8aab_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_cf5c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_ed19_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_daf4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_de5a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c11_74b2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_902a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2789_c11_5b45_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2794_c11_488b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2799_c11_9526_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2803_c11_db38_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2767_c3_011e_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2801_c31_cf33_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2750_c2_a4cd_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2755_c7_1250_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2763_c7_e959_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2766_c7_4fc2_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2763_c11_cf5c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2763_c11_cf5c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_cf5c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2763_c11_cf5c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_cf5c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_cf5c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2763_c11_cf5c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2773_l2803_l2770_l2799_l2766_l2794_l2763_l2789_l2758_l2781_l2755_l2778_DUPLICATE_b4ba LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2773_l2803_l2770_l2799_l2766_l2794_l2763_l2789_l2758_l2781_l2755_l2778_DUPLICATE_b4ba_return_output := result.is_opc_done;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2799_c7_325e] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2799_c7_325e_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2773_l2770_l2766_l2763_l2758_l2781_l2755_l2778_l2750_DUPLICATE_0405 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2773_l2770_l2766_l2763_l2758_l2781_l2755_l2778_l2750_DUPLICATE_0405_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2770_c11_daf4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2770_c11_daf4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_daf4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2770_c11_daf4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_daf4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_daf4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2770_c11_daf4_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2801_c31_cf33] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2801_c31_cf33_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2801_c31_cf33_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2801_c31_cf33_return_output := CONST_SR_8_uxn_opcodes_h_l2801_c31_cf33_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2799_c11_9526] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2799_c11_9526_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2799_c11_9526_left;
     BIN_OP_EQ_uxn_opcodes_h_l2799_c11_9526_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2799_c11_9526_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2799_c11_9526_return_output := BIN_OP_EQ_uxn_opcodes_h_l2799_c11_9526_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2794_c11_488b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2794_c11_488b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2794_c11_488b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2794_c11_488b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2794_c11_488b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2794_c11_488b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2794_c11_488b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2773_l2803_l2770_l2799_l2766_l2794_l2763_l2789_l2758_l2755_l2778_l2750_DUPLICATE_24bd LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2773_l2803_l2770_l2799_l2766_l2794_l2763_l2789_l2758_l2755_l2778_l2750_DUPLICATE_24bd_return_output := result.is_stack_write;

     -- CONST_SR_8[uxn_opcodes_h_l2792_c31_4b0c] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2792_c31_4b0c_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2792_c31_4b0c_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2792_c31_4b0c_return_output := CONST_SR_8_uxn_opcodes_h_l2792_c31_4b0c_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2797_c21_bf52] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2797_c21_bf52_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2773_l2770_l2766_l2794_l2763_l2758_l2755_l2778_l2750_DUPLICATE_2505 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2773_l2770_l2766_l2794_l2763_l2758_l2755_l2778_l2750_DUPLICATE_2505_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2755_c11_4cef] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2755_c11_4cef_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_4cef_left;
     BIN_OP_EQ_uxn_opcodes_h_l2755_c11_4cef_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_4cef_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_4cef_return_output := BIN_OP_EQ_uxn_opcodes_h_l2755_c11_4cef_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2781_c11_902a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2781_c11_902a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_902a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2781_c11_902a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_902a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_902a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2781_c11_902a_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2773_l2770_l2799_l2766_l2763_l2758_l2755_l2778_l2750_DUPLICATE_c702 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2773_l2770_l2799_l2766_l2763_l2758_l2755_l2778_l2750_DUPLICATE_c702_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2803_c11_db38] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2803_c11_db38_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2803_c11_db38_left;
     BIN_OP_EQ_uxn_opcodes_h_l2803_c11_db38_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2803_c11_db38_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2803_c11_db38_return_output := BIN_OP_EQ_uxn_opcodes_h_l2803_c11_db38_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2778_c11_74b2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2778_c11_74b2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c11_74b2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2778_c11_74b2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c11_74b2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c11_74b2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2778_c11_74b2_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2784_c30_4b7c] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2784_c30_4b7c_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2784_c30_4b7c_ins;
     sp_relative_shift_uxn_opcodes_h_l2784_c30_4b7c_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2784_c30_4b7c_x;
     sp_relative_shift_uxn_opcodes_h_l2784_c30_4b7c_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2784_c30_4b7c_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2784_c30_4b7c_return_output := sp_relative_shift_uxn_opcodes_h_l2784_c30_4b7c_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2767_l2774_l2782_l2759_DUPLICATE_9361 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2767_l2774_l2782_l2759_DUPLICATE_9361_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2766_c11_ed19] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2766_c11_ed19_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_ed19_left;
     BIN_OP_EQ_uxn_opcodes_h_l2766_c11_ed19_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_ed19_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_ed19_return_output := BIN_OP_EQ_uxn_opcodes_h_l2766_c11_ed19_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2789_c11_5b45] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2789_c11_5b45_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2789_c11_5b45_left;
     BIN_OP_EQ_uxn_opcodes_h_l2789_c11_5b45_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2789_c11_5b45_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2789_c11_5b45_return_output := BIN_OP_EQ_uxn_opcodes_h_l2789_c11_5b45_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2758_c11_8aab] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2758_c11_8aab_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_8aab_left;
     BIN_OP_EQ_uxn_opcodes_h_l2758_c11_8aab_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_8aab_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_8aab_return_output := BIN_OP_EQ_uxn_opcodes_h_l2758_c11_8aab_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2750_c6_309a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2750_c6_309a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c6_309a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2750_c6_309a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c6_309a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c6_309a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2750_c6_309a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2773_c11_de5a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2773_c11_de5a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_de5a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2773_c11_de5a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_de5a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_de5a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2773_c11_de5a_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_eb81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c6_309a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2750_c2_a4cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c6_309a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2750_c2_a4cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c6_309a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2750_c2_a4cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c6_309a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2750_c2_a4cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c6_309a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2750_c2_a4cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c6_309a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2750_c2_a4cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c6_309a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2750_c2_a4cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c6_309a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2750_c2_a4cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c6_309a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2755_c7_1250_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_4cef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_1250_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_4cef_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c7_1250_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_4cef_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2755_c7_1250_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_4cef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c7_1250_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_4cef_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_1250_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_4cef_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c7_1250_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_4cef_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2755_c7_1250_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_4cef_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2758_c7_4ba1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_8aab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2758_c7_4ba1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_8aab_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2758_c7_4ba1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_8aab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2758_c7_4ba1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_8aab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2758_c7_4ba1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_8aab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2758_c7_4ba1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_8aab_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2758_c7_4ba1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_8aab_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2758_c7_4ba1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_8aab_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2763_c7_e959_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_cf5c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_e959_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_cf5c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2763_c7_e959_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_cf5c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2763_c7_e959_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_cf5c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2763_c7_e959_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_cf5c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_e959_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_cf5c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2763_c7_e959_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_cf5c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2763_c7_e959_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_cf5c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2766_c7_4fc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_ed19_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_4fc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_ed19_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_4fc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_ed19_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_4fc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_ed19_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_4fc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_ed19_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_4fc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_ed19_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2766_c7_4fc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_ed19_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2766_c7_4fc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_ed19_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2770_c7_97b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_daf4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_97b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_daf4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2770_c7_97b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_daf4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_97b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_daf4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2770_c7_97b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_daf4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2770_c7_97b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_daf4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2770_c7_97b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_daf4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2773_c7_9fde_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_de5a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_9fde_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_de5a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_9fde_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_de5a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_9fde_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_de5a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_9fde_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_de5a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_9fde_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_de5a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2773_c7_9fde_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_de5a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2778_c7_c30d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c11_74b2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_c30d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c11_74b2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c7_c30d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c11_74b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2778_c7_c30d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c11_74b2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c7_c30d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c11_74b2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_c30d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c11_74b2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2778_c7_c30d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c11_74b2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2781_c7_ae11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_902a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_ae11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_902a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_ae11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_902a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_ae11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_902a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_ae11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_902a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_ae11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_902a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2781_c7_ae11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_902a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_a7a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2789_c11_5b45_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2789_c7_a7a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2789_c11_5b45_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_a7a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2789_c11_5b45_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2789_c7_a7a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2789_c11_5b45_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2789_c7_a7a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2789_c11_5b45_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_fbeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2794_c11_488b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_fbeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2794_c11_488b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_fbeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2794_c11_488b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_fbeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2794_c11_488b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2794_c7_fbeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2794_c11_488b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_325e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2799_c11_9526_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_325e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2799_c11_9526_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_325e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2799_c11_9526_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2799_c7_325e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2799_c11_9526_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2803_c7_44c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2803_c11_db38_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2803_c7_44c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2803_c11_db38_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2767_c3_011e_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2767_l2774_l2782_l2759_DUPLICATE_9361_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2782_c3_f32d_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2767_l2774_l2782_l2759_DUPLICATE_9361_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2775_l2760_DUPLICATE_a2fe_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2767_l2774_l2782_l2759_DUPLICATE_9361_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2794_c7_fbeb_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2797_c21_bf52_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2750_c2_a4cd_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2773_l2770_l2766_l2763_l2758_l2781_l2755_l2778_l2750_DUPLICATE_0405_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c7_1250_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2773_l2770_l2766_l2763_l2758_l2781_l2755_l2778_l2750_DUPLICATE_0405_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2758_c7_4ba1_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2773_l2770_l2766_l2763_l2758_l2781_l2755_l2778_l2750_DUPLICATE_0405_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2763_c7_e959_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2773_l2770_l2766_l2763_l2758_l2781_l2755_l2778_l2750_DUPLICATE_0405_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_4fc2_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2773_l2770_l2766_l2763_l2758_l2781_l2755_l2778_l2750_DUPLICATE_0405_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2770_c7_97b8_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2773_l2770_l2766_l2763_l2758_l2781_l2755_l2778_l2750_DUPLICATE_0405_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_9fde_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2773_l2770_l2766_l2763_l2758_l2781_l2755_l2778_l2750_DUPLICATE_0405_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c7_c30d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2773_l2770_l2766_l2763_l2758_l2781_l2755_l2778_l2750_DUPLICATE_0405_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_ae11_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2773_l2770_l2766_l2763_l2758_l2781_l2755_l2778_l2750_DUPLICATE_0405_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_1250_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2773_l2803_l2770_l2799_l2766_l2794_l2763_l2789_l2758_l2781_l2755_l2778_DUPLICATE_b4ba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2758_c7_4ba1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2773_l2803_l2770_l2799_l2766_l2794_l2763_l2789_l2758_l2781_l2755_l2778_DUPLICATE_b4ba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_e959_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2773_l2803_l2770_l2799_l2766_l2794_l2763_l2789_l2758_l2781_l2755_l2778_DUPLICATE_b4ba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_4fc2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2773_l2803_l2770_l2799_l2766_l2794_l2763_l2789_l2758_l2781_l2755_l2778_DUPLICATE_b4ba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_97b8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2773_l2803_l2770_l2799_l2766_l2794_l2763_l2789_l2758_l2781_l2755_l2778_DUPLICATE_b4ba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_9fde_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2773_l2803_l2770_l2799_l2766_l2794_l2763_l2789_l2758_l2781_l2755_l2778_DUPLICATE_b4ba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_c30d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2773_l2803_l2770_l2799_l2766_l2794_l2763_l2789_l2758_l2781_l2755_l2778_DUPLICATE_b4ba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_ae11_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2773_l2803_l2770_l2799_l2766_l2794_l2763_l2789_l2758_l2781_l2755_l2778_DUPLICATE_b4ba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_a7a5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2773_l2803_l2770_l2799_l2766_l2794_l2763_l2789_l2758_l2781_l2755_l2778_DUPLICATE_b4ba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_fbeb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2773_l2803_l2770_l2799_l2766_l2794_l2763_l2789_l2758_l2781_l2755_l2778_DUPLICATE_b4ba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_325e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2773_l2803_l2770_l2799_l2766_l2794_l2763_l2789_l2758_l2781_l2755_l2778_DUPLICATE_b4ba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2803_c7_44c9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2773_l2803_l2770_l2799_l2766_l2794_l2763_l2789_l2758_l2781_l2755_l2778_DUPLICATE_b4ba_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2750_c2_a4cd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2773_l2770_l2766_l2794_l2763_l2758_l2755_l2778_l2750_DUPLICATE_2505_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c7_1250_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2773_l2770_l2766_l2794_l2763_l2758_l2755_l2778_l2750_DUPLICATE_2505_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2758_c7_4ba1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2773_l2770_l2766_l2794_l2763_l2758_l2755_l2778_l2750_DUPLICATE_2505_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2763_c7_e959_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2773_l2770_l2766_l2794_l2763_l2758_l2755_l2778_l2750_DUPLICATE_2505_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_4fc2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2773_l2770_l2766_l2794_l2763_l2758_l2755_l2778_l2750_DUPLICATE_2505_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2770_c7_97b8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2773_l2770_l2766_l2794_l2763_l2758_l2755_l2778_l2750_DUPLICATE_2505_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_9fde_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2773_l2770_l2766_l2794_l2763_l2758_l2755_l2778_l2750_DUPLICATE_2505_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c7_c30d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2773_l2770_l2766_l2794_l2763_l2758_l2755_l2778_l2750_DUPLICATE_2505_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_fbeb_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2773_l2770_l2766_l2794_l2763_l2758_l2755_l2778_l2750_DUPLICATE_2505_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2750_c2_a4cd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2773_l2803_l2770_l2799_l2766_l2794_l2763_l2789_l2758_l2755_l2778_l2750_DUPLICATE_24bd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2755_c7_1250_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2773_l2803_l2770_l2799_l2766_l2794_l2763_l2789_l2758_l2755_l2778_l2750_DUPLICATE_24bd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2758_c7_4ba1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2773_l2803_l2770_l2799_l2766_l2794_l2763_l2789_l2758_l2755_l2778_l2750_DUPLICATE_24bd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2763_c7_e959_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2773_l2803_l2770_l2799_l2766_l2794_l2763_l2789_l2758_l2755_l2778_l2750_DUPLICATE_24bd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_4fc2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2773_l2803_l2770_l2799_l2766_l2794_l2763_l2789_l2758_l2755_l2778_l2750_DUPLICATE_24bd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_97b8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2773_l2803_l2770_l2799_l2766_l2794_l2763_l2789_l2758_l2755_l2778_l2750_DUPLICATE_24bd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_9fde_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2773_l2803_l2770_l2799_l2766_l2794_l2763_l2789_l2758_l2755_l2778_l2750_DUPLICATE_24bd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2778_c7_c30d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2773_l2803_l2770_l2799_l2766_l2794_l2763_l2789_l2758_l2755_l2778_l2750_DUPLICATE_24bd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_a7a5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2773_l2803_l2770_l2799_l2766_l2794_l2763_l2789_l2758_l2755_l2778_l2750_DUPLICATE_24bd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_fbeb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2773_l2803_l2770_l2799_l2766_l2794_l2763_l2789_l2758_l2755_l2778_l2750_DUPLICATE_24bd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_325e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2773_l2803_l2770_l2799_l2766_l2794_l2763_l2789_l2758_l2755_l2778_l2750_DUPLICATE_24bd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2803_c7_44c9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2773_l2803_l2770_l2799_l2766_l2794_l2763_l2789_l2758_l2755_l2778_l2750_DUPLICATE_24bd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2750_c2_a4cd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2773_l2770_l2799_l2766_l2763_l2758_l2755_l2778_l2750_DUPLICATE_c702_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c7_1250_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2773_l2770_l2799_l2766_l2763_l2758_l2755_l2778_l2750_DUPLICATE_c702_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2758_c7_4ba1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2773_l2770_l2799_l2766_l2763_l2758_l2755_l2778_l2750_DUPLICATE_c702_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2763_c7_e959_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2773_l2770_l2799_l2766_l2763_l2758_l2755_l2778_l2750_DUPLICATE_c702_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2766_c7_4fc2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2773_l2770_l2799_l2766_l2763_l2758_l2755_l2778_l2750_DUPLICATE_c702_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2770_c7_97b8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2773_l2770_l2799_l2766_l2763_l2758_l2755_l2778_l2750_DUPLICATE_c702_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2773_c7_9fde_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2773_l2770_l2799_l2766_l2763_l2758_l2755_l2778_l2750_DUPLICATE_c702_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2778_c7_c30d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2773_l2770_l2799_l2766_l2763_l2758_l2755_l2778_l2750_DUPLICATE_c702_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2799_c7_325e_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2773_l2770_l2799_l2766_l2763_l2758_l2755_l2778_l2750_DUPLICATE_c702_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_325e_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2799_c7_325e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_ae11_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2784_c30_4b7c_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2794_c7_fbeb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_fbeb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_fbeb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_fbeb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_fbeb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_fbeb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_fbeb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_fbeb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_fbeb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2803_c7_44c9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2803_c7_44c9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2803_c7_44c9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2803_c7_44c9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2803_c7_44c9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2803_c7_44c9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2803_c7_44c9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2803_c7_44c9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2803_c7_44c9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2803_c7_44c9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2803_c7_44c9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2803_c7_44c9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2803_c7_44c9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2803_c7_44c9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2803_c7_44c9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2803_c7_44c9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2803_c7_44c9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2803_c7_44c9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2799_c7_325e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_325e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_325e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_325e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_325e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_325e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_325e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_325e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_325e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2781_c7_ae11] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_ae11_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_ae11_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_ae11_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_ae11_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_ae11_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_ae11_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_ae11_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_ae11_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2767_c3_011e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2767_c3_011e_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2767_c3_011e_left;
     BIN_OP_OR_uxn_opcodes_h_l2767_c3_011e_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2767_c3_011e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2767_c3_011e_return_output := BIN_OP_OR_uxn_opcodes_h_l2767_c3_011e_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2792_c21_e4e7] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2792_c21_e4e7_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2792_c31_4b0c_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l2782_c3_f32d] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2782_c3_f32d_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2782_c3_f32d_left;
     BIN_OP_OR_uxn_opcodes_h_l2782_c3_f32d_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2782_c3_f32d_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2782_c3_f32d_return_output := BIN_OP_OR_uxn_opcodes_h_l2782_c3_f32d_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2801_c21_f844] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2801_c21_f844_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2801_c31_cf33_return_output);

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2750_c1_eb81] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_eb81_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_eb81_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_eb81_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_eb81_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_eb81_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_eb81_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_eb81_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_eb81_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2775_l2760_DUPLICATE_a2fe LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2775_l2760_DUPLICATE_a2fe_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2775_l2760_DUPLICATE_a2fe_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2775_l2760_DUPLICATE_a2fe_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2775_l2760_DUPLICATE_a2fe_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2766_c7_4fc2_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2767_c3_011e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2781_c7_ae11_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2782_c3_f32d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2789_c7_a7a5_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2792_c21_e4e7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2799_c7_325e_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2801_c21_f844_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2773_c7_9fde_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2775_l2760_DUPLICATE_a2fe_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2758_c7_4ba1_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2775_l2760_DUPLICATE_a2fe_return_output;
     VAR_printf_uxn_opcodes_h_l2751_c3_b420_uxn_opcodes_h_l2751_c3_b420_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_eb81_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_325e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2803_c7_44c9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2789_c7_a7a5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2794_c7_fbeb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_325e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2803_c7_44c9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c7_c30d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_ae11_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_fbeb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_325e_return_output;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l2787_c21_c85f] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2787_c21_c85f_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l2782_c3_f32d_return_output);

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2778_c7_c30d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c7_c30d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c7_c30d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c7_c30d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c7_c30d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c7_c30d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c7_c30d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c7_c30d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c7_c30d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2789_c7_a7a5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2789_c7_a7a5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2789_c7_a7a5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2789_c7_a7a5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2789_c7_a7a5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2789_c7_a7a5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2789_c7_a7a5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2789_c7_a7a5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2789_c7_a7a5_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2799_c7_325e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2799_c7_325e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2799_c7_325e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2799_c7_325e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2799_c7_325e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2799_c7_325e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2799_c7_325e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2799_c7_325e_return_output := result_u8_value_MUX_uxn_opcodes_h_l2799_c7_325e_return_output;

     -- t16_MUX[uxn_opcodes_h_l2766_c7_4fc2] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2766_c7_4fc2_cond <= VAR_t16_MUX_uxn_opcodes_h_l2766_c7_4fc2_cond;
     t16_MUX_uxn_opcodes_h_l2766_c7_4fc2_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2766_c7_4fc2_iftrue;
     t16_MUX_uxn_opcodes_h_l2766_c7_4fc2_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2766_c7_4fc2_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2766_c7_4fc2_return_output := t16_MUX_uxn_opcodes_h_l2766_c7_4fc2_return_output;

     -- printf_uxn_opcodes_h_l2751_c3_b420[uxn_opcodes_h_l2751_c3_b420] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2751_c3_b420_uxn_opcodes_h_l2751_c3_b420_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2751_c3_b420_uxn_opcodes_h_l2751_c3_b420_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2799_c7_325e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_325e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_325e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_325e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_325e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_325e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_325e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_325e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_325e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2794_c7_fbeb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_fbeb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_fbeb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_fbeb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_fbeb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_fbeb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_fbeb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_fbeb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_fbeb_return_output;

     -- n16_MUX[uxn_opcodes_h_l2781_c7_ae11] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2781_c7_ae11_cond <= VAR_n16_MUX_uxn_opcodes_h_l2781_c7_ae11_cond;
     n16_MUX_uxn_opcodes_h_l2781_c7_ae11_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2781_c7_ae11_iftrue;
     n16_MUX_uxn_opcodes_h_l2781_c7_ae11_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2781_c7_ae11_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2781_c7_ae11_return_output := n16_MUX_uxn_opcodes_h_l2781_c7_ae11_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2799_c7_325e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_325e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_325e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_325e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_325e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_325e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_325e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_325e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_325e_return_output;

     -- Submodule level 3
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2781_c7_ae11_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2787_c21_c85f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2778_c7_c30d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2781_c7_ae11_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_fbeb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_325e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_ae11_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2789_c7_a7a5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_fbeb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_325e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_9fde_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2778_c7_c30d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2789_c7_a7a5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2794_c7_fbeb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2794_c7_fbeb_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2799_c7_325e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2763_c7_e959_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2766_c7_4fc2_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2794_c7_fbeb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_fbeb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_fbeb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_fbeb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_fbeb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_fbeb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_fbeb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_fbeb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_fbeb_return_output;

     -- n16_MUX[uxn_opcodes_h_l2778_c7_c30d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2778_c7_c30d_cond <= VAR_n16_MUX_uxn_opcodes_h_l2778_c7_c30d_cond;
     n16_MUX_uxn_opcodes_h_l2778_c7_c30d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2778_c7_c30d_iftrue;
     n16_MUX_uxn_opcodes_h_l2778_c7_c30d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2778_c7_c30d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2778_c7_c30d_return_output := n16_MUX_uxn_opcodes_h_l2778_c7_c30d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2794_c7_fbeb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2794_c7_fbeb_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2794_c7_fbeb_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2794_c7_fbeb_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2794_c7_fbeb_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2794_c7_fbeb_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2794_c7_fbeb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2794_c7_fbeb_return_output := result_u8_value_MUX_uxn_opcodes_h_l2794_c7_fbeb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2789_c7_a7a5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2789_c7_a7a5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2789_c7_a7a5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2789_c7_a7a5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2789_c7_a7a5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2789_c7_a7a5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2789_c7_a7a5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2789_c7_a7a5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2789_c7_a7a5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2794_c7_fbeb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_fbeb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_fbeb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_fbeb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_fbeb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_fbeb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_fbeb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_fbeb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_fbeb_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2781_c7_ae11] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_ae11_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_ae11_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_ae11_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_ae11_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_ae11_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_ae11_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_ae11_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_ae11_return_output;

     -- t16_MUX[uxn_opcodes_h_l2763_c7_e959] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2763_c7_e959_cond <= VAR_t16_MUX_uxn_opcodes_h_l2763_c7_e959_cond;
     t16_MUX_uxn_opcodes_h_l2763_c7_e959_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2763_c7_e959_iftrue;
     t16_MUX_uxn_opcodes_h_l2763_c7_e959_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2763_c7_e959_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2763_c7_e959_return_output := t16_MUX_uxn_opcodes_h_l2763_c7_e959_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2773_c7_9fde] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_9fde_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_9fde_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_9fde_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_9fde_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_9fde_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_9fde_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_9fde_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_9fde_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l2773_c7_9fde_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2778_c7_c30d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_a7a5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2794_c7_fbeb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c7_c30d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_ae11_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_a7a5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2794_c7_fbeb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2770_c7_97b8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_9fde_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_ae11_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2789_c7_a7a5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2789_c7_a7a5_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2794_c7_fbeb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2758_c7_4ba1_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2763_c7_e959_return_output;
     -- t16_MUX[uxn_opcodes_h_l2758_c7_4ba1] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2758_c7_4ba1_cond <= VAR_t16_MUX_uxn_opcodes_h_l2758_c7_4ba1_cond;
     t16_MUX_uxn_opcodes_h_l2758_c7_4ba1_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2758_c7_4ba1_iftrue;
     t16_MUX_uxn_opcodes_h_l2758_c7_4ba1_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2758_c7_4ba1_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2758_c7_4ba1_return_output := t16_MUX_uxn_opcodes_h_l2758_c7_4ba1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2770_c7_97b8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2770_c7_97b8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2770_c7_97b8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2770_c7_97b8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2770_c7_97b8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2770_c7_97b8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2770_c7_97b8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2770_c7_97b8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2770_c7_97b8_return_output;

     -- n16_MUX[uxn_opcodes_h_l2773_c7_9fde] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2773_c7_9fde_cond <= VAR_n16_MUX_uxn_opcodes_h_l2773_c7_9fde_cond;
     n16_MUX_uxn_opcodes_h_l2773_c7_9fde_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2773_c7_9fde_iftrue;
     n16_MUX_uxn_opcodes_h_l2773_c7_9fde_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2773_c7_9fde_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2773_c7_9fde_return_output := n16_MUX_uxn_opcodes_h_l2773_c7_9fde_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2789_c7_a7a5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_a7a5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_a7a5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_a7a5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_a7a5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_a7a5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_a7a5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_a7a5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_a7a5_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2789_c7_a7a5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2789_c7_a7a5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2789_c7_a7a5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2789_c7_a7a5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2789_c7_a7a5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2789_c7_a7a5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2789_c7_a7a5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2789_c7_a7a5_return_output := result_u8_value_MUX_uxn_opcodes_h_l2789_c7_a7a5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2781_c7_ae11] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_ae11_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_ae11_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_ae11_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_ae11_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_ae11_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_ae11_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_ae11_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_ae11_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2789_c7_a7a5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_a7a5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_a7a5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_a7a5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_a7a5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_a7a5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_a7a5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_a7a5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_a7a5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2778_c7_c30d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c7_c30d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c7_c30d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c7_c30d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c7_c30d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c7_c30d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c7_c30d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c7_c30d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c7_c30d_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2770_c7_97b8_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2773_c7_9fde_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_ae11_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_a7a5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_9fde_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2778_c7_c30d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_ae11_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_a7a5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_4fc2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2770_c7_97b8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_c30d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_ae11_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2781_c7_ae11_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2789_c7_a7a5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2755_c7_1250_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2758_c7_4ba1_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2781_c7_ae11] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_ae11_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_ae11_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_ae11_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_ae11_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_ae11_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_ae11_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_ae11_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_ae11_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2773_c7_9fde] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_9fde_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_9fde_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_9fde_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_9fde_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_9fde_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_9fde_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_9fde_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_9fde_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2766_c7_4fc2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_4fc2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_4fc2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_4fc2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_4fc2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_4fc2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_4fc2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_4fc2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_4fc2_return_output;

     -- t16_MUX[uxn_opcodes_h_l2755_c7_1250] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2755_c7_1250_cond <= VAR_t16_MUX_uxn_opcodes_h_l2755_c7_1250_cond;
     t16_MUX_uxn_opcodes_h_l2755_c7_1250_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2755_c7_1250_iftrue;
     t16_MUX_uxn_opcodes_h_l2755_c7_1250_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2755_c7_1250_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2755_c7_1250_return_output := t16_MUX_uxn_opcodes_h_l2755_c7_1250_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2778_c7_c30d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_c30d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_c30d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_c30d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_c30d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_c30d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_c30d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_c30d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_c30d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2781_c7_ae11] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2781_c7_ae11_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2781_c7_ae11_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2781_c7_ae11_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2781_c7_ae11_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2781_c7_ae11_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2781_c7_ae11_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2781_c7_ae11_return_output := result_u8_value_MUX_uxn_opcodes_h_l2781_c7_ae11_return_output;

     -- n16_MUX[uxn_opcodes_h_l2770_c7_97b8] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2770_c7_97b8_cond <= VAR_n16_MUX_uxn_opcodes_h_l2770_c7_97b8_cond;
     n16_MUX_uxn_opcodes_h_l2770_c7_97b8_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2770_c7_97b8_iftrue;
     n16_MUX_uxn_opcodes_h_l2770_c7_97b8_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2770_c7_97b8_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2770_c7_97b8_return_output := n16_MUX_uxn_opcodes_h_l2770_c7_97b8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2781_c7_ae11] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_ae11_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_ae11_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_ae11_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_ae11_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_ae11_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_ae11_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_ae11_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_ae11_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2766_c7_4fc2_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2770_c7_97b8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_c30d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_ae11_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2770_c7_97b8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_9fde_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2778_c7_c30d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_ae11_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2763_c7_e959_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_4fc2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_9fde_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_c30d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2778_c7_c30d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2781_c7_ae11_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2750_c2_a4cd_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2755_c7_1250_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2778_c7_c30d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2778_c7_c30d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2778_c7_c30d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2778_c7_c30d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2778_c7_c30d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2778_c7_c30d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2778_c7_c30d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2778_c7_c30d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2778_c7_c30d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2770_c7_97b8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2770_c7_97b8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2770_c7_97b8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2770_c7_97b8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2770_c7_97b8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2770_c7_97b8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2770_c7_97b8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2770_c7_97b8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2770_c7_97b8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2778_c7_c30d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_c30d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_c30d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_c30d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_c30d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_c30d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_c30d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_c30d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_c30d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2773_c7_9fde] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_9fde_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_9fde_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_9fde_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_9fde_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_9fde_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_9fde_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_9fde_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_9fde_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2778_c7_c30d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2778_c7_c30d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2778_c7_c30d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2778_c7_c30d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2778_c7_c30d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2778_c7_c30d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2778_c7_c30d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2778_c7_c30d_return_output := result_u8_value_MUX_uxn_opcodes_h_l2778_c7_c30d_return_output;

     -- n16_MUX[uxn_opcodes_h_l2766_c7_4fc2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2766_c7_4fc2_cond <= VAR_n16_MUX_uxn_opcodes_h_l2766_c7_4fc2_cond;
     n16_MUX_uxn_opcodes_h_l2766_c7_4fc2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2766_c7_4fc2_iftrue;
     n16_MUX_uxn_opcodes_h_l2766_c7_4fc2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2766_c7_4fc2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2766_c7_4fc2_return_output := n16_MUX_uxn_opcodes_h_l2766_c7_4fc2_return_output;

     -- t16_MUX[uxn_opcodes_h_l2750_c2_a4cd] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2750_c2_a4cd_cond <= VAR_t16_MUX_uxn_opcodes_h_l2750_c2_a4cd_cond;
     t16_MUX_uxn_opcodes_h_l2750_c2_a4cd_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2750_c2_a4cd_iftrue;
     t16_MUX_uxn_opcodes_h_l2750_c2_a4cd_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2750_c2_a4cd_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2750_c2_a4cd_return_output := t16_MUX_uxn_opcodes_h_l2750_c2_a4cd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2763_c7_e959] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2763_c7_e959_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2763_c7_e959_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2763_c7_e959_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2763_c7_e959_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2763_c7_e959_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2763_c7_e959_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2763_c7_e959_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2763_c7_e959_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2763_c7_e959_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2766_c7_4fc2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_9fde_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_c30d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_4fc2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2770_c7_97b8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_9fde_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2778_c7_c30d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2758_c7_4ba1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2763_c7_e959_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2770_c7_97b8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_9fde_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2773_c7_9fde_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2778_c7_c30d_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2750_c2_a4cd_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2758_c7_4ba1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2758_c7_4ba1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2758_c7_4ba1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2758_c7_4ba1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2758_c7_4ba1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2758_c7_4ba1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2758_c7_4ba1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2758_c7_4ba1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2758_c7_4ba1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2766_c7_4fc2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_4fc2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_4fc2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_4fc2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_4fc2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_4fc2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_4fc2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_4fc2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_4fc2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2773_c7_9fde] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_9fde_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_9fde_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_9fde_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_9fde_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_9fde_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_9fde_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_9fde_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_9fde_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2770_c7_97b8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2770_c7_97b8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2770_c7_97b8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2770_c7_97b8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2770_c7_97b8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2770_c7_97b8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2770_c7_97b8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2770_c7_97b8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2770_c7_97b8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2773_c7_9fde] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_9fde_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_9fde_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_9fde_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_9fde_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_9fde_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_9fde_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_9fde_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_9fde_return_output;

     -- n16_MUX[uxn_opcodes_h_l2763_c7_e959] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2763_c7_e959_cond <= VAR_n16_MUX_uxn_opcodes_h_l2763_c7_e959_cond;
     n16_MUX_uxn_opcodes_h_l2763_c7_e959_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2763_c7_e959_iftrue;
     n16_MUX_uxn_opcodes_h_l2763_c7_e959_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2763_c7_e959_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2763_c7_e959_return_output := n16_MUX_uxn_opcodes_h_l2763_c7_e959_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2773_c7_9fde] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2773_c7_9fde_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2773_c7_9fde_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2773_c7_9fde_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2773_c7_9fde_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2773_c7_9fde_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2773_c7_9fde_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2773_c7_9fde_return_output := result_u8_value_MUX_uxn_opcodes_h_l2773_c7_9fde_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l2758_c7_4ba1_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2763_c7_e959_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_97b8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_9fde_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2763_c7_e959_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_4fc2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_97b8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_9fde_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c7_1250_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2758_c7_4ba1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_4fc2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2770_c7_97b8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2770_c7_97b8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2773_c7_9fde_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2770_c7_97b8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_97b8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_97b8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_97b8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_97b8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_97b8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_97b8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_97b8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_97b8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2755_c7_1250] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c7_1250_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c7_1250_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c7_1250_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c7_1250_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c7_1250_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c7_1250_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c7_1250_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c7_1250_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2770_c7_97b8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2770_c7_97b8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2770_c7_97b8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2770_c7_97b8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2770_c7_97b8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2770_c7_97b8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2770_c7_97b8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2770_c7_97b8_return_output := result_u8_value_MUX_uxn_opcodes_h_l2770_c7_97b8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2763_c7_e959] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2763_c7_e959_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2763_c7_e959_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2763_c7_e959_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2763_c7_e959_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2763_c7_e959_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2763_c7_e959_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2763_c7_e959_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2763_c7_e959_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2770_c7_97b8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_97b8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_97b8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_97b8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_97b8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_97b8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_97b8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_97b8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_97b8_return_output;

     -- n16_MUX[uxn_opcodes_h_l2758_c7_4ba1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2758_c7_4ba1_cond <= VAR_n16_MUX_uxn_opcodes_h_l2758_c7_4ba1_cond;
     n16_MUX_uxn_opcodes_h_l2758_c7_4ba1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2758_c7_4ba1_iftrue;
     n16_MUX_uxn_opcodes_h_l2758_c7_4ba1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2758_c7_4ba1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2758_c7_4ba1_return_output := n16_MUX_uxn_opcodes_h_l2758_c7_4ba1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2766_c7_4fc2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_4fc2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_4fc2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_4fc2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_4fc2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_4fc2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_4fc2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_4fc2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_4fc2_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l2755_c7_1250_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2758_c7_4ba1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_4fc2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_97b8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2758_c7_4ba1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2763_c7_e959_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_4fc2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_97b8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2750_c2_a4cd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2755_c7_1250_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_e959_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_4fc2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2766_c7_4fc2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2770_c7_97b8_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2750_c2_a4cd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2750_c2_a4cd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2750_c2_a4cd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2750_c2_a4cd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2750_c2_a4cd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2750_c2_a4cd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2750_c2_a4cd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2750_c2_a4cd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2750_c2_a4cd_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2758_c7_4ba1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2758_c7_4ba1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2758_c7_4ba1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2758_c7_4ba1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2758_c7_4ba1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2758_c7_4ba1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2758_c7_4ba1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2758_c7_4ba1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2758_c7_4ba1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2763_c7_e959] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_e959_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_e959_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_e959_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_e959_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_e959_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_e959_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_e959_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_e959_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2766_c7_4fc2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_4fc2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_4fc2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_4fc2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_4fc2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_4fc2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_4fc2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_4fc2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_4fc2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2766_c7_4fc2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2766_c7_4fc2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2766_c7_4fc2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2766_c7_4fc2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2766_c7_4fc2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2766_c7_4fc2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2766_c7_4fc2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2766_c7_4fc2_return_output := result_u8_value_MUX_uxn_opcodes_h_l2766_c7_4fc2_return_output;

     -- n16_MUX[uxn_opcodes_h_l2755_c7_1250] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2755_c7_1250_cond <= VAR_n16_MUX_uxn_opcodes_h_l2755_c7_1250_cond;
     n16_MUX_uxn_opcodes_h_l2755_c7_1250_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2755_c7_1250_iftrue;
     n16_MUX_uxn_opcodes_h_l2755_c7_1250_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2755_c7_1250_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2755_c7_1250_return_output := n16_MUX_uxn_opcodes_h_l2755_c7_1250_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2766_c7_4fc2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_4fc2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_4fc2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_4fc2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_4fc2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_4fc2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_4fc2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_4fc2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_4fc2_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l2750_c2_a4cd_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2755_c7_1250_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_e959_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_4fc2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c7_1250_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2758_c7_4ba1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2763_c7_e959_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_4fc2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2758_c7_4ba1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_e959_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2763_c7_e959_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2766_c7_4fc2_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2755_c7_1250] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c7_1250_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c7_1250_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c7_1250_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c7_1250_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c7_1250_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c7_1250_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c7_1250_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c7_1250_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2758_c7_4ba1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2758_c7_4ba1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2758_c7_4ba1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2758_c7_4ba1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2758_c7_4ba1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2758_c7_4ba1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2758_c7_4ba1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2758_c7_4ba1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2758_c7_4ba1_return_output;

     -- n16_MUX[uxn_opcodes_h_l2750_c2_a4cd] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2750_c2_a4cd_cond <= VAR_n16_MUX_uxn_opcodes_h_l2750_c2_a4cd_cond;
     n16_MUX_uxn_opcodes_h_l2750_c2_a4cd_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2750_c2_a4cd_iftrue;
     n16_MUX_uxn_opcodes_h_l2750_c2_a4cd_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2750_c2_a4cd_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2750_c2_a4cd_return_output := n16_MUX_uxn_opcodes_h_l2750_c2_a4cd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2763_c7_e959] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2763_c7_e959_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2763_c7_e959_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2763_c7_e959_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2763_c7_e959_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2763_c7_e959_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2763_c7_e959_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2763_c7_e959_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2763_c7_e959_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2763_c7_e959] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2763_c7_e959_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2763_c7_e959_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2763_c7_e959_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2763_c7_e959_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2763_c7_e959_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2763_c7_e959_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2763_c7_e959_return_output := result_u8_value_MUX_uxn_opcodes_h_l2763_c7_e959_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2763_c7_e959] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_e959_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_e959_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_e959_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_e959_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_e959_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_e959_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_e959_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_e959_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2750_c2_a4cd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2758_c7_4ba1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_e959_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2750_c2_a4cd_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c7_1250_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2758_c7_4ba1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2763_c7_e959_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_1250_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2758_c7_4ba1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2758_c7_4ba1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2763_c7_e959_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2758_c7_4ba1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2758_c7_4ba1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2758_c7_4ba1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2758_c7_4ba1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2758_c7_4ba1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2758_c7_4ba1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2758_c7_4ba1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2758_c7_4ba1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2758_c7_4ba1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2750_c2_a4cd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2750_c2_a4cd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2750_c2_a4cd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2750_c2_a4cd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2750_c2_a4cd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2750_c2_a4cd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2750_c2_a4cd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2750_c2_a4cd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2750_c2_a4cd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2755_c7_1250] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_1250_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_1250_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_1250_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_1250_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_1250_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_1250_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_1250_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_1250_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2758_c7_4ba1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2758_c7_4ba1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2758_c7_4ba1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2758_c7_4ba1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2758_c7_4ba1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2758_c7_4ba1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2758_c7_4ba1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2758_c7_4ba1_return_output := result_u8_value_MUX_uxn_opcodes_h_l2758_c7_4ba1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2758_c7_4ba1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2758_c7_4ba1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2758_c7_4ba1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2758_c7_4ba1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2758_c7_4ba1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2758_c7_4ba1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2758_c7_4ba1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2758_c7_4ba1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2758_c7_4ba1_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_1250_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2758_c7_4ba1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2755_c7_1250_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2758_c7_4ba1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2750_c2_a4cd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_1250_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c7_1250_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2758_c7_4ba1_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2755_c7_1250] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_1250_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_1250_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_1250_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_1250_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_1250_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_1250_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_1250_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_1250_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2750_c2_a4cd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2750_c2_a4cd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2750_c2_a4cd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2750_c2_a4cd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2750_c2_a4cd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2750_c2_a4cd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2750_c2_a4cd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2750_c2_a4cd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2750_c2_a4cd_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2755_c7_1250] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2755_c7_1250_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c7_1250_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2755_c7_1250_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c7_1250_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2755_c7_1250_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c7_1250_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c7_1250_return_output := result_u8_value_MUX_uxn_opcodes_h_l2755_c7_1250_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2755_c7_1250] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2755_c7_1250_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2755_c7_1250_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2755_c7_1250_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2755_c7_1250_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2755_c7_1250_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2755_c7_1250_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2755_c7_1250_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2755_c7_1250_return_output;

     -- Submodule level 13
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2750_c2_a4cd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_1250_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2750_c2_a4cd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2755_c7_1250_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2750_c2_a4cd_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c7_1250_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2750_c2_a4cd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2750_c2_a4cd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2750_c2_a4cd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2750_c2_a4cd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2750_c2_a4cd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2750_c2_a4cd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2750_c2_a4cd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2750_c2_a4cd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2750_c2_a4cd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2750_c2_a4cd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2750_c2_a4cd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2750_c2_a4cd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2750_c2_a4cd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2750_c2_a4cd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2750_c2_a4cd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2750_c2_a4cd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2750_c2_a4cd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2750_c2_a4cd_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2750_c2_a4cd] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2750_c2_a4cd_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2750_c2_a4cd_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2750_c2_a4cd_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2750_c2_a4cd_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2750_c2_a4cd_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2750_c2_a4cd_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2750_c2_a4cd_return_output := result_u8_value_MUX_uxn_opcodes_h_l2750_c2_a4cd_return_output;

     -- Submodule level 14
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l2746_l2808_DUPLICATE_e969 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l2746_l2808_DUPLICATE_e969_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_8cda(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2750_c2_a4cd_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2750_c2_a4cd_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2750_c2_a4cd_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2750_c2_a4cd_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2750_c2_a4cd_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2750_c2_a4cd_return_output);

     -- Submodule level 15
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l2746_l2808_DUPLICATE_e969_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l2746_l2808_DUPLICATE_e969_return_output;
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
