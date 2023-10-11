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
entity gth2_0CLK_5ccafc54 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end gth2_0CLK_5ccafc54;
architecture arch of gth2_0CLK_5ccafc54 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1989_c6_5553]
signal BIN_OP_EQ_uxn_opcodes_h_l1989_c6_5553_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1989_c6_5553_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1989_c6_5553_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1989_c1_203b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1989_c1_203b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1989_c1_203b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1989_c1_203b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1989_c1_203b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1989_c2_0c8c]
signal n16_MUX_uxn_opcodes_h_l1989_c2_0c8c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1989_c2_0c8c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1989_c2_0c8c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1989_c2_0c8c_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1989_c2_0c8c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1989_c2_0c8c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1989_c2_0c8c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1989_c2_0c8c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1989_c2_0c8c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1989_c2_0c8c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1989_c2_0c8c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1989_c2_0c8c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1989_c2_0c8c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1989_c2_0c8c_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1989_c2_0c8c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1989_c2_0c8c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1989_c2_0c8c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1989_c2_0c8c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1989_c2_0c8c_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1989_c2_0c8c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1989_c2_0c8c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1989_c2_0c8c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1989_c2_0c8c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1989_c2_0c8c_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1989_c2_0c8c]
signal result_stack_value_MUX_uxn_opcodes_h_l1989_c2_0c8c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1989_c2_0c8c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1989_c2_0c8c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1989_c2_0c8c_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1989_c2_0c8c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1989_c2_0c8c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1989_c2_0c8c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1989_c2_0c8c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1989_c2_0c8c_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1989_c2_0c8c]
signal t16_MUX_uxn_opcodes_h_l1989_c2_0c8c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1989_c2_0c8c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1989_c2_0c8c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1989_c2_0c8c_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1990_c3_264f[uxn_opcodes_h_l1990_c3_264f]
signal printf_uxn_opcodes_h_l1990_c3_264f_uxn_opcodes_h_l1990_c3_264f_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1994_c11_c3e0]
signal BIN_OP_EQ_uxn_opcodes_h_l1994_c11_c3e0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1994_c11_c3e0_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1994_c11_c3e0_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1994_c7_e521]
signal n16_MUX_uxn_opcodes_h_l1994_c7_e521_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1994_c7_e521_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1994_c7_e521_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1994_c7_e521_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1994_c7_e521]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1994_c7_e521_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1994_c7_e521_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1994_c7_e521_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1994_c7_e521_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1994_c7_e521]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1994_c7_e521_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1994_c7_e521_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1994_c7_e521_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1994_c7_e521_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1994_c7_e521]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1994_c7_e521_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1994_c7_e521_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1994_c7_e521_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1994_c7_e521_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1994_c7_e521]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1994_c7_e521_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1994_c7_e521_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1994_c7_e521_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1994_c7_e521_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1994_c7_e521]
signal result_stack_value_MUX_uxn_opcodes_h_l1994_c7_e521_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1994_c7_e521_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1994_c7_e521_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1994_c7_e521_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1994_c7_e521]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1994_c7_e521_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1994_c7_e521_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1994_c7_e521_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1994_c7_e521_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1994_c7_e521]
signal t16_MUX_uxn_opcodes_h_l1994_c7_e521_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1994_c7_e521_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1994_c7_e521_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1994_c7_e521_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1997_c11_caeb]
signal BIN_OP_EQ_uxn_opcodes_h_l1997_c11_caeb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1997_c11_caeb_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1997_c11_caeb_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1997_c7_995b]
signal n16_MUX_uxn_opcodes_h_l1997_c7_995b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1997_c7_995b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1997_c7_995b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1997_c7_995b_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1997_c7_995b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_995b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_995b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_995b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_995b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1997_c7_995b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_995b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_995b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_995b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_995b_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1997_c7_995b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c7_995b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c7_995b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c7_995b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c7_995b_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1997_c7_995b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_995b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_995b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_995b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_995b_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1997_c7_995b]
signal result_stack_value_MUX_uxn_opcodes_h_l1997_c7_995b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1997_c7_995b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1997_c7_995b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1997_c7_995b_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1997_c7_995b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c7_995b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c7_995b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c7_995b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c7_995b_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1997_c7_995b]
signal t16_MUX_uxn_opcodes_h_l1997_c7_995b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1997_c7_995b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1997_c7_995b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1997_c7_995b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2002_c11_27bc]
signal BIN_OP_EQ_uxn_opcodes_h_l2002_c11_27bc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2002_c11_27bc_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2002_c11_27bc_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2002_c7_b4d9]
signal n16_MUX_uxn_opcodes_h_l2002_c7_b4d9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2002_c7_b4d9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2002_c7_b4d9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2002_c7_b4d9_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2002_c7_b4d9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_b4d9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_b4d9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_b4d9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_b4d9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2002_c7_b4d9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_b4d9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_b4d9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_b4d9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_b4d9_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2002_c7_b4d9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_b4d9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_b4d9_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_b4d9_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_b4d9_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2002_c7_b4d9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_b4d9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_b4d9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_b4d9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_b4d9_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2002_c7_b4d9]
signal result_stack_value_MUX_uxn_opcodes_h_l2002_c7_b4d9_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2002_c7_b4d9_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2002_c7_b4d9_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2002_c7_b4d9_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2002_c7_b4d9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_b4d9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_b4d9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_b4d9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_b4d9_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2002_c7_b4d9]
signal t16_MUX_uxn_opcodes_h_l2002_c7_b4d9_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2002_c7_b4d9_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2002_c7_b4d9_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2002_c7_b4d9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2005_c11_8094]
signal BIN_OP_EQ_uxn_opcodes_h_l2005_c11_8094_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2005_c11_8094_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2005_c11_8094_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2005_c7_a317]
signal n16_MUX_uxn_opcodes_h_l2005_c7_a317_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2005_c7_a317_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2005_c7_a317_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2005_c7_a317_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2005_c7_a317]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2005_c7_a317_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2005_c7_a317_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2005_c7_a317_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2005_c7_a317_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2005_c7_a317]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c7_a317_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c7_a317_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c7_a317_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c7_a317_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2005_c7_a317]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c7_a317_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c7_a317_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c7_a317_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c7_a317_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2005_c7_a317]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2005_c7_a317_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2005_c7_a317_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2005_c7_a317_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2005_c7_a317_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2005_c7_a317]
signal result_stack_value_MUX_uxn_opcodes_h_l2005_c7_a317_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2005_c7_a317_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2005_c7_a317_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2005_c7_a317_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2005_c7_a317]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2005_c7_a317_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2005_c7_a317_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2005_c7_a317_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2005_c7_a317_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2005_c7_a317]
signal t16_MUX_uxn_opcodes_h_l2005_c7_a317_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2005_c7_a317_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2005_c7_a317_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2005_c7_a317_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2006_c3_7b4e]
signal BIN_OP_OR_uxn_opcodes_h_l2006_c3_7b4e_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2006_c3_7b4e_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2006_c3_7b4e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2009_c11_3218]
signal BIN_OP_EQ_uxn_opcodes_h_l2009_c11_3218_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2009_c11_3218_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2009_c11_3218_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2009_c7_46e2]
signal n16_MUX_uxn_opcodes_h_l2009_c7_46e2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2009_c7_46e2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2009_c7_46e2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2009_c7_46e2_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2009_c7_46e2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_46e2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_46e2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_46e2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_46e2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2009_c7_46e2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_46e2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_46e2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_46e2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_46e2_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2009_c7_46e2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_46e2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_46e2_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_46e2_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_46e2_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2009_c7_46e2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_46e2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_46e2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_46e2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_46e2_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2009_c7_46e2]
signal result_stack_value_MUX_uxn_opcodes_h_l2009_c7_46e2_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2009_c7_46e2_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2009_c7_46e2_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2009_c7_46e2_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2009_c7_46e2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_46e2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_46e2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_46e2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_46e2_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2012_c11_c43b]
signal BIN_OP_EQ_uxn_opcodes_h_l2012_c11_c43b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2012_c11_c43b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2012_c11_c43b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2012_c7_6025]
signal n16_MUX_uxn_opcodes_h_l2012_c7_6025_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2012_c7_6025_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2012_c7_6025_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2012_c7_6025_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2012_c7_6025]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_6025_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_6025_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_6025_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_6025_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2012_c7_6025]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2012_c7_6025_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2012_c7_6025_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2012_c7_6025_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2012_c7_6025_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2012_c7_6025]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2012_c7_6025_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2012_c7_6025_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2012_c7_6025_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2012_c7_6025_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2012_c7_6025]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_6025_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_6025_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_6025_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_6025_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2012_c7_6025]
signal result_stack_value_MUX_uxn_opcodes_h_l2012_c7_6025_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2012_c7_6025_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2012_c7_6025_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2012_c7_6025_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2012_c7_6025]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2012_c7_6025_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2012_c7_6025_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2012_c7_6025_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2012_c7_6025_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2017_c11_cb90]
signal BIN_OP_EQ_uxn_opcodes_h_l2017_c11_cb90_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2017_c11_cb90_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2017_c11_cb90_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2017_c7_b05d]
signal n16_MUX_uxn_opcodes_h_l2017_c7_b05d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2017_c7_b05d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2017_c7_b05d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2017_c7_b05d_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2017_c7_b05d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_b05d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_b05d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_b05d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_b05d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2017_c7_b05d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_b05d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_b05d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_b05d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_b05d_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2017_c7_b05d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_b05d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_b05d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_b05d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_b05d_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2017_c7_b05d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_b05d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_b05d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_b05d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_b05d_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2017_c7_b05d]
signal result_stack_value_MUX_uxn_opcodes_h_l2017_c7_b05d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2017_c7_b05d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2017_c7_b05d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2017_c7_b05d_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2017_c7_b05d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2017_c7_b05d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2017_c7_b05d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2017_c7_b05d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2017_c7_b05d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2020_c11_f544]
signal BIN_OP_EQ_uxn_opcodes_h_l2020_c11_f544_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2020_c11_f544_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2020_c11_f544_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2020_c7_2ae7]
signal n16_MUX_uxn_opcodes_h_l2020_c7_2ae7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2020_c7_2ae7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2020_c7_2ae7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2020_c7_2ae7_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2020_c7_2ae7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_2ae7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_2ae7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_2ae7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_2ae7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2020_c7_2ae7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_2ae7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_2ae7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_2ae7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_2ae7_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2020_c7_2ae7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_2ae7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_2ae7_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_2ae7_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_2ae7_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2020_c7_2ae7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_2ae7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_2ae7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_2ae7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_2ae7_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2020_c7_2ae7]
signal result_stack_value_MUX_uxn_opcodes_h_l2020_c7_2ae7_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2020_c7_2ae7_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2020_c7_2ae7_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2020_c7_2ae7_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2020_c7_2ae7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2020_c7_2ae7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2020_c7_2ae7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2020_c7_2ae7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2020_c7_2ae7_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2021_c3_5065]
signal BIN_OP_OR_uxn_opcodes_h_l2021_c3_5065_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2021_c3_5065_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2021_c3_5065_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2023_c32_6b24]
signal BIN_OP_AND_uxn_opcodes_h_l2023_c32_6b24_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2023_c32_6b24_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2023_c32_6b24_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2023_c32_ba38]
signal BIN_OP_GT_uxn_opcodes_h_l2023_c32_ba38_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2023_c32_ba38_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2023_c32_ba38_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2023_c32_e24f]
signal MUX_uxn_opcodes_h_l2023_c32_e24f_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2023_c32_e24f_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2023_c32_e24f_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2023_c32_e24f_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2025_c11_0efe]
signal BIN_OP_EQ_uxn_opcodes_h_l2025_c11_0efe_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2025_c11_0efe_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2025_c11_0efe_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2025_c7_dad6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_dad6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_dad6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_dad6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_dad6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2025_c7_dad6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_dad6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_dad6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_dad6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_dad6_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2025_c7_dad6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_dad6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_dad6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_dad6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_dad6_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2025_c7_dad6]
signal result_stack_value_MUX_uxn_opcodes_h_l2025_c7_dad6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2025_c7_dad6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2025_c7_dad6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2025_c7_dad6_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2025_c7_dad6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2025_c7_dad6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2025_c7_dad6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2025_c7_dad6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2025_c7_dad6_return_output : unsigned(0 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2029_c24_66c2]
signal BIN_OP_GT_uxn_opcodes_h_l2029_c24_66c2_left : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2029_c24_66c2_right : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2029_c24_66c2_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2029_c24_070e]
signal MUX_uxn_opcodes_h_l2029_c24_070e_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2029_c24_070e_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2029_c24_070e_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2029_c24_070e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2031_c11_0bf7]
signal BIN_OP_EQ_uxn_opcodes_h_l2031_c11_0bf7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2031_c11_0bf7_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2031_c11_0bf7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2031_c7_4ff2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2031_c7_4ff2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2031_c7_4ff2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2031_c7_4ff2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2031_c7_4ff2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2031_c7_4ff2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2031_c7_4ff2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2031_c7_4ff2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2031_c7_4ff2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2031_c7_4ff2_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1999_l2014_DUPLICATE_9cf2
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1999_l2014_DUPLICATE_9cf2_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1999_l2014_DUPLICATE_9cf2_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1989_c6_5553
BIN_OP_EQ_uxn_opcodes_h_l1989_c6_5553 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1989_c6_5553_left,
BIN_OP_EQ_uxn_opcodes_h_l1989_c6_5553_right,
BIN_OP_EQ_uxn_opcodes_h_l1989_c6_5553_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1989_c1_203b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1989_c1_203b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1989_c1_203b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1989_c1_203b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1989_c1_203b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1989_c1_203b_return_output);

-- n16_MUX_uxn_opcodes_h_l1989_c2_0c8c
n16_MUX_uxn_opcodes_h_l1989_c2_0c8c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1989_c2_0c8c_cond,
n16_MUX_uxn_opcodes_h_l1989_c2_0c8c_iftrue,
n16_MUX_uxn_opcodes_h_l1989_c2_0c8c_iffalse,
n16_MUX_uxn_opcodes_h_l1989_c2_0c8c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1989_c2_0c8c
result_is_stack_write_MUX_uxn_opcodes_h_l1989_c2_0c8c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1989_c2_0c8c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1989_c2_0c8c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1989_c2_0c8c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1989_c2_0c8c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1989_c2_0c8c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1989_c2_0c8c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1989_c2_0c8c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1989_c2_0c8c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1989_c2_0c8c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1989_c2_0c8c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1989_c2_0c8c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1989_c2_0c8c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1989_c2_0c8c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1989_c2_0c8c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1989_c2_0c8c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1989_c2_0c8c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1989_c2_0c8c
result_is_opc_done_MUX_uxn_opcodes_h_l1989_c2_0c8c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1989_c2_0c8c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1989_c2_0c8c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1989_c2_0c8c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1989_c2_0c8c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1989_c2_0c8c
result_stack_value_MUX_uxn_opcodes_h_l1989_c2_0c8c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1989_c2_0c8c_cond,
result_stack_value_MUX_uxn_opcodes_h_l1989_c2_0c8c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1989_c2_0c8c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1989_c2_0c8c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1989_c2_0c8c
result_is_sp_shift_MUX_uxn_opcodes_h_l1989_c2_0c8c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1989_c2_0c8c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1989_c2_0c8c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1989_c2_0c8c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1989_c2_0c8c_return_output);

-- t16_MUX_uxn_opcodes_h_l1989_c2_0c8c
t16_MUX_uxn_opcodes_h_l1989_c2_0c8c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1989_c2_0c8c_cond,
t16_MUX_uxn_opcodes_h_l1989_c2_0c8c_iftrue,
t16_MUX_uxn_opcodes_h_l1989_c2_0c8c_iffalse,
t16_MUX_uxn_opcodes_h_l1989_c2_0c8c_return_output);

-- printf_uxn_opcodes_h_l1990_c3_264f_uxn_opcodes_h_l1990_c3_264f
printf_uxn_opcodes_h_l1990_c3_264f_uxn_opcodes_h_l1990_c3_264f : entity work.printf_uxn_opcodes_h_l1990_c3_264f_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1990_c3_264f_uxn_opcodes_h_l1990_c3_264f_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1994_c11_c3e0
BIN_OP_EQ_uxn_opcodes_h_l1994_c11_c3e0 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1994_c11_c3e0_left,
BIN_OP_EQ_uxn_opcodes_h_l1994_c11_c3e0_right,
BIN_OP_EQ_uxn_opcodes_h_l1994_c11_c3e0_return_output);

-- n16_MUX_uxn_opcodes_h_l1994_c7_e521
n16_MUX_uxn_opcodes_h_l1994_c7_e521 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1994_c7_e521_cond,
n16_MUX_uxn_opcodes_h_l1994_c7_e521_iftrue,
n16_MUX_uxn_opcodes_h_l1994_c7_e521_iffalse,
n16_MUX_uxn_opcodes_h_l1994_c7_e521_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1994_c7_e521
result_is_stack_write_MUX_uxn_opcodes_h_l1994_c7_e521 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1994_c7_e521_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1994_c7_e521_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1994_c7_e521_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1994_c7_e521_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1994_c7_e521
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1994_c7_e521 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1994_c7_e521_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1994_c7_e521_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1994_c7_e521_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1994_c7_e521_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1994_c7_e521
result_sp_relative_shift_MUX_uxn_opcodes_h_l1994_c7_e521 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1994_c7_e521_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1994_c7_e521_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1994_c7_e521_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1994_c7_e521_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1994_c7_e521
result_is_opc_done_MUX_uxn_opcodes_h_l1994_c7_e521 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1994_c7_e521_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1994_c7_e521_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1994_c7_e521_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1994_c7_e521_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1994_c7_e521
result_stack_value_MUX_uxn_opcodes_h_l1994_c7_e521 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1994_c7_e521_cond,
result_stack_value_MUX_uxn_opcodes_h_l1994_c7_e521_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1994_c7_e521_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1994_c7_e521_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1994_c7_e521
result_is_sp_shift_MUX_uxn_opcodes_h_l1994_c7_e521 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1994_c7_e521_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1994_c7_e521_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1994_c7_e521_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1994_c7_e521_return_output);

-- t16_MUX_uxn_opcodes_h_l1994_c7_e521
t16_MUX_uxn_opcodes_h_l1994_c7_e521 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1994_c7_e521_cond,
t16_MUX_uxn_opcodes_h_l1994_c7_e521_iftrue,
t16_MUX_uxn_opcodes_h_l1994_c7_e521_iffalse,
t16_MUX_uxn_opcodes_h_l1994_c7_e521_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1997_c11_caeb
BIN_OP_EQ_uxn_opcodes_h_l1997_c11_caeb : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1997_c11_caeb_left,
BIN_OP_EQ_uxn_opcodes_h_l1997_c11_caeb_right,
BIN_OP_EQ_uxn_opcodes_h_l1997_c11_caeb_return_output);

-- n16_MUX_uxn_opcodes_h_l1997_c7_995b
n16_MUX_uxn_opcodes_h_l1997_c7_995b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1997_c7_995b_cond,
n16_MUX_uxn_opcodes_h_l1997_c7_995b_iftrue,
n16_MUX_uxn_opcodes_h_l1997_c7_995b_iffalse,
n16_MUX_uxn_opcodes_h_l1997_c7_995b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_995b
result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_995b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_995b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_995b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_995b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_995b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_995b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_995b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_995b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_995b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_995b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_995b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c7_995b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c7_995b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c7_995b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c7_995b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c7_995b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c7_995b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_995b
result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_995b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_995b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_995b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_995b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_995b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1997_c7_995b
result_stack_value_MUX_uxn_opcodes_h_l1997_c7_995b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1997_c7_995b_cond,
result_stack_value_MUX_uxn_opcodes_h_l1997_c7_995b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1997_c7_995b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1997_c7_995b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c7_995b
result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c7_995b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c7_995b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c7_995b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c7_995b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c7_995b_return_output);

-- t16_MUX_uxn_opcodes_h_l1997_c7_995b
t16_MUX_uxn_opcodes_h_l1997_c7_995b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1997_c7_995b_cond,
t16_MUX_uxn_opcodes_h_l1997_c7_995b_iftrue,
t16_MUX_uxn_opcodes_h_l1997_c7_995b_iffalse,
t16_MUX_uxn_opcodes_h_l1997_c7_995b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2002_c11_27bc
BIN_OP_EQ_uxn_opcodes_h_l2002_c11_27bc : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2002_c11_27bc_left,
BIN_OP_EQ_uxn_opcodes_h_l2002_c11_27bc_right,
BIN_OP_EQ_uxn_opcodes_h_l2002_c11_27bc_return_output);

-- n16_MUX_uxn_opcodes_h_l2002_c7_b4d9
n16_MUX_uxn_opcodes_h_l2002_c7_b4d9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2002_c7_b4d9_cond,
n16_MUX_uxn_opcodes_h_l2002_c7_b4d9_iftrue,
n16_MUX_uxn_opcodes_h_l2002_c7_b4d9_iffalse,
n16_MUX_uxn_opcodes_h_l2002_c7_b4d9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_b4d9
result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_b4d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_b4d9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_b4d9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_b4d9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_b4d9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_b4d9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_b4d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_b4d9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_b4d9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_b4d9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_b4d9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_b4d9
result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_b4d9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_b4d9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_b4d9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_b4d9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_b4d9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_b4d9
result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_b4d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_b4d9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_b4d9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_b4d9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_b4d9_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2002_c7_b4d9
result_stack_value_MUX_uxn_opcodes_h_l2002_c7_b4d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2002_c7_b4d9_cond,
result_stack_value_MUX_uxn_opcodes_h_l2002_c7_b4d9_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2002_c7_b4d9_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2002_c7_b4d9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_b4d9
result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_b4d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_b4d9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_b4d9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_b4d9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_b4d9_return_output);

-- t16_MUX_uxn_opcodes_h_l2002_c7_b4d9
t16_MUX_uxn_opcodes_h_l2002_c7_b4d9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2002_c7_b4d9_cond,
t16_MUX_uxn_opcodes_h_l2002_c7_b4d9_iftrue,
t16_MUX_uxn_opcodes_h_l2002_c7_b4d9_iffalse,
t16_MUX_uxn_opcodes_h_l2002_c7_b4d9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2005_c11_8094
BIN_OP_EQ_uxn_opcodes_h_l2005_c11_8094 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2005_c11_8094_left,
BIN_OP_EQ_uxn_opcodes_h_l2005_c11_8094_right,
BIN_OP_EQ_uxn_opcodes_h_l2005_c11_8094_return_output);

-- n16_MUX_uxn_opcodes_h_l2005_c7_a317
n16_MUX_uxn_opcodes_h_l2005_c7_a317 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2005_c7_a317_cond,
n16_MUX_uxn_opcodes_h_l2005_c7_a317_iftrue,
n16_MUX_uxn_opcodes_h_l2005_c7_a317_iffalse,
n16_MUX_uxn_opcodes_h_l2005_c7_a317_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2005_c7_a317
result_is_stack_write_MUX_uxn_opcodes_h_l2005_c7_a317 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2005_c7_a317_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2005_c7_a317_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2005_c7_a317_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2005_c7_a317_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c7_a317
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c7_a317 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c7_a317_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c7_a317_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c7_a317_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c7_a317_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c7_a317
result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c7_a317 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c7_a317_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c7_a317_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c7_a317_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c7_a317_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2005_c7_a317
result_is_opc_done_MUX_uxn_opcodes_h_l2005_c7_a317 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2005_c7_a317_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2005_c7_a317_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2005_c7_a317_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2005_c7_a317_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2005_c7_a317
result_stack_value_MUX_uxn_opcodes_h_l2005_c7_a317 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2005_c7_a317_cond,
result_stack_value_MUX_uxn_opcodes_h_l2005_c7_a317_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2005_c7_a317_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2005_c7_a317_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2005_c7_a317
result_is_sp_shift_MUX_uxn_opcodes_h_l2005_c7_a317 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2005_c7_a317_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2005_c7_a317_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2005_c7_a317_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2005_c7_a317_return_output);

-- t16_MUX_uxn_opcodes_h_l2005_c7_a317
t16_MUX_uxn_opcodes_h_l2005_c7_a317 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2005_c7_a317_cond,
t16_MUX_uxn_opcodes_h_l2005_c7_a317_iftrue,
t16_MUX_uxn_opcodes_h_l2005_c7_a317_iffalse,
t16_MUX_uxn_opcodes_h_l2005_c7_a317_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2006_c3_7b4e
BIN_OP_OR_uxn_opcodes_h_l2006_c3_7b4e : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2006_c3_7b4e_left,
BIN_OP_OR_uxn_opcodes_h_l2006_c3_7b4e_right,
BIN_OP_OR_uxn_opcodes_h_l2006_c3_7b4e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2009_c11_3218
BIN_OP_EQ_uxn_opcodes_h_l2009_c11_3218 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2009_c11_3218_left,
BIN_OP_EQ_uxn_opcodes_h_l2009_c11_3218_right,
BIN_OP_EQ_uxn_opcodes_h_l2009_c11_3218_return_output);

-- n16_MUX_uxn_opcodes_h_l2009_c7_46e2
n16_MUX_uxn_opcodes_h_l2009_c7_46e2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2009_c7_46e2_cond,
n16_MUX_uxn_opcodes_h_l2009_c7_46e2_iftrue,
n16_MUX_uxn_opcodes_h_l2009_c7_46e2_iffalse,
n16_MUX_uxn_opcodes_h_l2009_c7_46e2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_46e2
result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_46e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_46e2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_46e2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_46e2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_46e2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_46e2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_46e2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_46e2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_46e2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_46e2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_46e2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_46e2
result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_46e2 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_46e2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_46e2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_46e2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_46e2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_46e2
result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_46e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_46e2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_46e2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_46e2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_46e2_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2009_c7_46e2
result_stack_value_MUX_uxn_opcodes_h_l2009_c7_46e2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2009_c7_46e2_cond,
result_stack_value_MUX_uxn_opcodes_h_l2009_c7_46e2_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2009_c7_46e2_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2009_c7_46e2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_46e2
result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_46e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_46e2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_46e2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_46e2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_46e2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2012_c11_c43b
BIN_OP_EQ_uxn_opcodes_h_l2012_c11_c43b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2012_c11_c43b_left,
BIN_OP_EQ_uxn_opcodes_h_l2012_c11_c43b_right,
BIN_OP_EQ_uxn_opcodes_h_l2012_c11_c43b_return_output);

-- n16_MUX_uxn_opcodes_h_l2012_c7_6025
n16_MUX_uxn_opcodes_h_l2012_c7_6025 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2012_c7_6025_cond,
n16_MUX_uxn_opcodes_h_l2012_c7_6025_iftrue,
n16_MUX_uxn_opcodes_h_l2012_c7_6025_iffalse,
n16_MUX_uxn_opcodes_h_l2012_c7_6025_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_6025
result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_6025 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_6025_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_6025_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_6025_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_6025_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2012_c7_6025
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2012_c7_6025 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2012_c7_6025_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2012_c7_6025_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2012_c7_6025_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2012_c7_6025_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2012_c7_6025
result_sp_relative_shift_MUX_uxn_opcodes_h_l2012_c7_6025 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2012_c7_6025_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2012_c7_6025_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2012_c7_6025_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2012_c7_6025_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_6025
result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_6025 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_6025_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_6025_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_6025_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_6025_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2012_c7_6025
result_stack_value_MUX_uxn_opcodes_h_l2012_c7_6025 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2012_c7_6025_cond,
result_stack_value_MUX_uxn_opcodes_h_l2012_c7_6025_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2012_c7_6025_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2012_c7_6025_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2012_c7_6025
result_is_sp_shift_MUX_uxn_opcodes_h_l2012_c7_6025 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2012_c7_6025_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2012_c7_6025_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2012_c7_6025_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2012_c7_6025_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2017_c11_cb90
BIN_OP_EQ_uxn_opcodes_h_l2017_c11_cb90 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2017_c11_cb90_left,
BIN_OP_EQ_uxn_opcodes_h_l2017_c11_cb90_right,
BIN_OP_EQ_uxn_opcodes_h_l2017_c11_cb90_return_output);

-- n16_MUX_uxn_opcodes_h_l2017_c7_b05d
n16_MUX_uxn_opcodes_h_l2017_c7_b05d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2017_c7_b05d_cond,
n16_MUX_uxn_opcodes_h_l2017_c7_b05d_iftrue,
n16_MUX_uxn_opcodes_h_l2017_c7_b05d_iffalse,
n16_MUX_uxn_opcodes_h_l2017_c7_b05d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_b05d
result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_b05d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_b05d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_b05d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_b05d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_b05d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_b05d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_b05d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_b05d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_b05d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_b05d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_b05d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_b05d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_b05d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_b05d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_b05d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_b05d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_b05d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_b05d
result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_b05d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_b05d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_b05d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_b05d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_b05d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2017_c7_b05d
result_stack_value_MUX_uxn_opcodes_h_l2017_c7_b05d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2017_c7_b05d_cond,
result_stack_value_MUX_uxn_opcodes_h_l2017_c7_b05d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2017_c7_b05d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2017_c7_b05d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2017_c7_b05d
result_is_sp_shift_MUX_uxn_opcodes_h_l2017_c7_b05d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2017_c7_b05d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2017_c7_b05d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2017_c7_b05d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2017_c7_b05d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2020_c11_f544
BIN_OP_EQ_uxn_opcodes_h_l2020_c11_f544 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2020_c11_f544_left,
BIN_OP_EQ_uxn_opcodes_h_l2020_c11_f544_right,
BIN_OP_EQ_uxn_opcodes_h_l2020_c11_f544_return_output);

-- n16_MUX_uxn_opcodes_h_l2020_c7_2ae7
n16_MUX_uxn_opcodes_h_l2020_c7_2ae7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2020_c7_2ae7_cond,
n16_MUX_uxn_opcodes_h_l2020_c7_2ae7_iftrue,
n16_MUX_uxn_opcodes_h_l2020_c7_2ae7_iffalse,
n16_MUX_uxn_opcodes_h_l2020_c7_2ae7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_2ae7
result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_2ae7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_2ae7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_2ae7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_2ae7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_2ae7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_2ae7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_2ae7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_2ae7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_2ae7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_2ae7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_2ae7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_2ae7
result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_2ae7 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_2ae7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_2ae7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_2ae7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_2ae7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_2ae7
result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_2ae7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_2ae7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_2ae7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_2ae7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_2ae7_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2020_c7_2ae7
result_stack_value_MUX_uxn_opcodes_h_l2020_c7_2ae7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2020_c7_2ae7_cond,
result_stack_value_MUX_uxn_opcodes_h_l2020_c7_2ae7_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2020_c7_2ae7_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2020_c7_2ae7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2020_c7_2ae7
result_is_sp_shift_MUX_uxn_opcodes_h_l2020_c7_2ae7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2020_c7_2ae7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2020_c7_2ae7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2020_c7_2ae7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2020_c7_2ae7_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2021_c3_5065
BIN_OP_OR_uxn_opcodes_h_l2021_c3_5065 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2021_c3_5065_left,
BIN_OP_OR_uxn_opcodes_h_l2021_c3_5065_right,
BIN_OP_OR_uxn_opcodes_h_l2021_c3_5065_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2023_c32_6b24
BIN_OP_AND_uxn_opcodes_h_l2023_c32_6b24 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2023_c32_6b24_left,
BIN_OP_AND_uxn_opcodes_h_l2023_c32_6b24_right,
BIN_OP_AND_uxn_opcodes_h_l2023_c32_6b24_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2023_c32_ba38
BIN_OP_GT_uxn_opcodes_h_l2023_c32_ba38 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2023_c32_ba38_left,
BIN_OP_GT_uxn_opcodes_h_l2023_c32_ba38_right,
BIN_OP_GT_uxn_opcodes_h_l2023_c32_ba38_return_output);

-- MUX_uxn_opcodes_h_l2023_c32_e24f
MUX_uxn_opcodes_h_l2023_c32_e24f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2023_c32_e24f_cond,
MUX_uxn_opcodes_h_l2023_c32_e24f_iftrue,
MUX_uxn_opcodes_h_l2023_c32_e24f_iffalse,
MUX_uxn_opcodes_h_l2023_c32_e24f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2025_c11_0efe
BIN_OP_EQ_uxn_opcodes_h_l2025_c11_0efe : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2025_c11_0efe_left,
BIN_OP_EQ_uxn_opcodes_h_l2025_c11_0efe_right,
BIN_OP_EQ_uxn_opcodes_h_l2025_c11_0efe_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_dad6
result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_dad6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_dad6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_dad6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_dad6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_dad6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_dad6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_dad6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_dad6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_dad6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_dad6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_dad6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_dad6
result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_dad6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_dad6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_dad6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_dad6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_dad6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2025_c7_dad6
result_stack_value_MUX_uxn_opcodes_h_l2025_c7_dad6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2025_c7_dad6_cond,
result_stack_value_MUX_uxn_opcodes_h_l2025_c7_dad6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2025_c7_dad6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2025_c7_dad6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2025_c7_dad6
result_is_sp_shift_MUX_uxn_opcodes_h_l2025_c7_dad6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2025_c7_dad6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2025_c7_dad6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2025_c7_dad6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2025_c7_dad6_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2029_c24_66c2
BIN_OP_GT_uxn_opcodes_h_l2029_c24_66c2 : entity work.BIN_OP_GT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2029_c24_66c2_left,
BIN_OP_GT_uxn_opcodes_h_l2029_c24_66c2_right,
BIN_OP_GT_uxn_opcodes_h_l2029_c24_66c2_return_output);

-- MUX_uxn_opcodes_h_l2029_c24_070e
MUX_uxn_opcodes_h_l2029_c24_070e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2029_c24_070e_cond,
MUX_uxn_opcodes_h_l2029_c24_070e_iftrue,
MUX_uxn_opcodes_h_l2029_c24_070e_iffalse,
MUX_uxn_opcodes_h_l2029_c24_070e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2031_c11_0bf7
BIN_OP_EQ_uxn_opcodes_h_l2031_c11_0bf7 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2031_c11_0bf7_left,
BIN_OP_EQ_uxn_opcodes_h_l2031_c11_0bf7_right,
BIN_OP_EQ_uxn_opcodes_h_l2031_c11_0bf7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2031_c7_4ff2
result_is_stack_write_MUX_uxn_opcodes_h_l2031_c7_4ff2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2031_c7_4ff2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2031_c7_4ff2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2031_c7_4ff2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2031_c7_4ff2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2031_c7_4ff2
result_is_opc_done_MUX_uxn_opcodes_h_l2031_c7_4ff2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2031_c7_4ff2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2031_c7_4ff2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2031_c7_4ff2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2031_c7_4ff2_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1999_l2014_DUPLICATE_9cf2
CONST_SL_8_uint16_t_uxn_opcodes_h_l1999_l2014_DUPLICATE_9cf2 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1999_l2014_DUPLICATE_9cf2_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1999_l2014_DUPLICATE_9cf2_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1989_c6_5553_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1989_c1_203b_return_output,
 n16_MUX_uxn_opcodes_h_l1989_c2_0c8c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1989_c2_0c8c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1989_c2_0c8c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1989_c2_0c8c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1989_c2_0c8c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1989_c2_0c8c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1989_c2_0c8c_return_output,
 t16_MUX_uxn_opcodes_h_l1989_c2_0c8c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1994_c11_c3e0_return_output,
 n16_MUX_uxn_opcodes_h_l1994_c7_e521_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1994_c7_e521_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1994_c7_e521_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1994_c7_e521_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1994_c7_e521_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1994_c7_e521_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1994_c7_e521_return_output,
 t16_MUX_uxn_opcodes_h_l1994_c7_e521_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1997_c11_caeb_return_output,
 n16_MUX_uxn_opcodes_h_l1997_c7_995b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_995b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_995b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c7_995b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_995b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1997_c7_995b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c7_995b_return_output,
 t16_MUX_uxn_opcodes_h_l1997_c7_995b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2002_c11_27bc_return_output,
 n16_MUX_uxn_opcodes_h_l2002_c7_b4d9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_b4d9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_b4d9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_b4d9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_b4d9_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2002_c7_b4d9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_b4d9_return_output,
 t16_MUX_uxn_opcodes_h_l2002_c7_b4d9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2005_c11_8094_return_output,
 n16_MUX_uxn_opcodes_h_l2005_c7_a317_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2005_c7_a317_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c7_a317_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c7_a317_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2005_c7_a317_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2005_c7_a317_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2005_c7_a317_return_output,
 t16_MUX_uxn_opcodes_h_l2005_c7_a317_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2006_c3_7b4e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2009_c11_3218_return_output,
 n16_MUX_uxn_opcodes_h_l2009_c7_46e2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_46e2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_46e2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_46e2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_46e2_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2009_c7_46e2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_46e2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2012_c11_c43b_return_output,
 n16_MUX_uxn_opcodes_h_l2012_c7_6025_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_6025_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2012_c7_6025_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2012_c7_6025_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_6025_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2012_c7_6025_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2012_c7_6025_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2017_c11_cb90_return_output,
 n16_MUX_uxn_opcodes_h_l2017_c7_b05d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_b05d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_b05d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_b05d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_b05d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2017_c7_b05d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2017_c7_b05d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2020_c11_f544_return_output,
 n16_MUX_uxn_opcodes_h_l2020_c7_2ae7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_2ae7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_2ae7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_2ae7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_2ae7_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2020_c7_2ae7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2020_c7_2ae7_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2021_c3_5065_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2023_c32_6b24_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2023_c32_ba38_return_output,
 MUX_uxn_opcodes_h_l2023_c32_e24f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2025_c11_0efe_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_dad6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_dad6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_dad6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2025_c7_dad6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2025_c7_dad6_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2029_c24_66c2_return_output,
 MUX_uxn_opcodes_h_l2029_c24_070e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2031_c11_0bf7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2031_c7_4ff2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2031_c7_4ff2_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1999_l2014_DUPLICATE_9cf2_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1989_c6_5553_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1989_c6_5553_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1989_c6_5553_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1989_c1_203b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1989_c1_203b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1989_c1_203b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1989_c1_203b_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1989_c2_0c8c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1989_c2_0c8c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1994_c7_e521_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1989_c2_0c8c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1989_c2_0c8c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1989_c2_0c8c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1989_c2_0c8c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1994_c7_e521_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1989_c2_0c8c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1989_c2_0c8c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1989_c2_0c8c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1991_c3_2e19 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1989_c2_0c8c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1994_c7_e521_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1989_c2_0c8c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1989_c2_0c8c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1989_c2_0c8c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1989_c2_0c8c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1994_c7_e521_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1989_c2_0c8c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1989_c2_0c8c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1989_c2_0c8c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1989_c2_0c8c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1994_c7_e521_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1989_c2_0c8c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1989_c2_0c8c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1989_c2_0c8c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1989_c2_0c8c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1994_c7_e521_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1989_c2_0c8c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1989_c2_0c8c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1989_c2_0c8c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1989_c2_0c8c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1994_c7_e521_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1989_c2_0c8c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1989_c2_0c8c_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1989_c2_0c8c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1989_c2_0c8c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1994_c7_e521_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1989_c2_0c8c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1989_c2_0c8c_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1990_c3_264f_uxn_opcodes_h_l1990_c3_264f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1994_c11_c3e0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1994_c11_c3e0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1994_c11_c3e0_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1994_c7_e521_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1994_c7_e521_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1997_c7_995b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1994_c7_e521_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1994_c7_e521_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1994_c7_e521_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_995b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1994_c7_e521_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1994_c7_e521_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1995_c3_0dc1 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1994_c7_e521_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_995b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1994_c7_e521_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1994_c7_e521_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1994_c7_e521_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c7_995b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1994_c7_e521_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1994_c7_e521_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1994_c7_e521_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_995b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1994_c7_e521_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1994_c7_e521_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1994_c7_e521_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1997_c7_995b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1994_c7_e521_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1994_c7_e521_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1994_c7_e521_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c7_995b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1994_c7_e521_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1994_c7_e521_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1994_c7_e521_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1997_c7_995b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1994_c7_e521_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1997_c11_caeb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1997_c11_caeb_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1997_c11_caeb_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1997_c7_995b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1997_c7_995b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2002_c7_b4d9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1997_c7_995b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_995b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_995b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_b4d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_995b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_995b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2000_c3_c506 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_995b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_b4d9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_995b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c7_995b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c7_995b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_b4d9_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c7_995b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_995b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_995b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_b4d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_995b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1997_c7_995b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1997_c7_995b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2002_c7_b4d9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1997_c7_995b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c7_995b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c7_995b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_b4d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c7_995b_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1997_c7_995b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1997_c7_995b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2002_c7_b4d9_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1997_c7_995b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_27bc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_27bc_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_27bc_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2002_c7_b4d9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2002_c7_b4d9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2005_c7_a317_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2002_c7_b4d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_b4d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_b4d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2005_c7_a317_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_b4d9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_b4d9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2003_c3_1203 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_b4d9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c7_a317_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_b4d9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_b4d9_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_b4d9_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c7_a317_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_b4d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_b4d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_b4d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2005_c7_a317_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_b4d9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2002_c7_b4d9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2002_c7_b4d9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2005_c7_a317_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2002_c7_b4d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_b4d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_b4d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2005_c7_a317_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_b4d9_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2002_c7_b4d9_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2002_c7_b4d9_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2005_c7_a317_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2002_c7_b4d9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c11_8094_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c11_8094_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c11_8094_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2005_c7_a317_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2005_c7_a317_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2009_c7_46e2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2005_c7_a317_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2005_c7_a317_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2005_c7_a317_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_46e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2005_c7_a317_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c7_a317_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2007_c3_c05a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c7_a317_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_46e2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c7_a317_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c7_a317_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c7_a317_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_46e2_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c7_a317_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2005_c7_a317_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2005_c7_a317_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_46e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2005_c7_a317_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2005_c7_a317_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2005_c7_a317_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2009_c7_46e2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2005_c7_a317_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2005_c7_a317_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2005_c7_a317_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_46e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2005_c7_a317_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2005_c7_a317_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2005_c7_a317_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2005_c7_a317_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2006_c3_7b4e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2006_c3_7b4e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2006_c3_7b4e_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_3218_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_3218_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_3218_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2009_c7_46e2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2009_c7_46e2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2012_c7_6025_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2009_c7_46e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_46e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_46e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_6025_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_46e2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_46e2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2010_c3_dd96 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_46e2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2012_c7_6025_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_46e2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_46e2_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_46e2_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2012_c7_6025_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_46e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_46e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_46e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_6025_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_46e2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2009_c7_46e2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2009_c7_46e2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2012_c7_6025_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2009_c7_46e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_46e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_46e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2012_c7_6025_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_46e2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2012_c11_c43b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2012_c11_c43b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2012_c11_c43b_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2012_c7_6025_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2012_c7_6025_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2017_c7_b05d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2012_c7_6025_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_6025_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_6025_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_b05d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_6025_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2012_c7_6025_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2015_c3_05b4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2012_c7_6025_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_b05d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2012_c7_6025_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2012_c7_6025_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2012_c7_6025_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_b05d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2012_c7_6025_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_6025_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_6025_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_b05d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_6025_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2012_c7_6025_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2012_c7_6025_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2017_c7_b05d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2012_c7_6025_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2012_c7_6025_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2012_c7_6025_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2017_c7_b05d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2012_c7_6025_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_cb90_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_cb90_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_cb90_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2017_c7_b05d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2017_c7_b05d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2020_c7_2ae7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2017_c7_b05d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_b05d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_b05d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_2ae7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_b05d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_b05d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2018_c3_e4f5 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_b05d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_2ae7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_b05d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_b05d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_b05d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_2ae7_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_b05d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_b05d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_b05d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_2ae7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_b05d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2017_c7_b05d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2017_c7_b05d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2020_c7_2ae7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2017_c7_b05d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2017_c7_b05d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2017_c7_b05d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2020_c7_2ae7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2017_c7_b05d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_f544_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_f544_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_f544_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2020_c7_2ae7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2020_c7_2ae7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2020_c7_2ae7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_2ae7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_2ae7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_dad6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_2ae7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_2ae7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_2ae7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_dad6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_2ae7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_2ae7_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_2ae7_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_2ae7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_2ae7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_2ae7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_dad6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_2ae7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2020_c7_2ae7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2020_c7_2ae7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2025_c7_dad6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2020_c7_2ae7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2020_c7_2ae7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2020_c7_2ae7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2025_c7_dad6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2020_c7_2ae7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2021_c3_5065_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2021_c3_5065_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2021_c3_5065_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2023_c32_e24f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2023_c32_e24f_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2023_c32_e24f_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2023_c32_6b24_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2023_c32_6b24_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2023_c32_6b24_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2023_c32_ba38_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2023_c32_ba38_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2023_c32_ba38_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2023_c32_e24f_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_0efe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_0efe_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_0efe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_dad6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_dad6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2031_c7_4ff2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_dad6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_dad6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2028_c3_0f3d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_dad6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_dad6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_dad6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_dad6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2031_c7_4ff2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_dad6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2025_c7_dad6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2025_c7_dad6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2025_c7_dad6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2025_c7_dad6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2025_c7_dad6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2025_c7_dad6_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2029_c24_070e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2029_c24_070e_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2029_c24_070e_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2029_c24_66c2_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2029_c24_66c2_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2029_c24_66c2_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2029_c24_070e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2031_c11_0bf7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2031_c11_0bf7_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2031_c11_0bf7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2031_c7_4ff2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2031_c7_4ff2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2031_c7_4ff2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2031_c7_4ff2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2031_c7_4ff2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2031_c7_4ff2_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1997_l2020_l1994_l2017_l1989_l2012_l2009_l2005_l2031_l2002_DUPLICATE_d092_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1997_l2020_l1994_l2017_l1989_l2012_l2009_l2005_l2002_DUPLICATE_be49_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2025_l1997_l2020_l1994_l2017_l1989_l2012_l2009_l2005_l2002_DUPLICATE_ebc1_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2025_l1997_l1994_l2017_l1989_l2012_l2009_l2005_l2002_DUPLICATE_234a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2025_l1997_l2020_l1994_l2017_l2012_l2009_l2005_l2031_l2002_DUPLICATE_1bce_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2013_l2006_l1998_l2021_DUPLICATE_d6c7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1999_l2014_DUPLICATE_9cf2_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1999_l2014_DUPLICATE_9cf2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2025_l2020_DUPLICATE_aaa7_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l1985_l2036_DUPLICATE_c4ce_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_27bc_right := to_unsigned(3, 2);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2023_c32_6b24_right := to_unsigned(128, 8);
     VAR_MUX_uxn_opcodes_h_l2023_c32_e24f_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_0efe_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1995_c3_0dc1 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1994_c7_e521_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1995_c3_0dc1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1997_c11_caeb_right := to_unsigned(2, 2);
     VAR_MUX_uxn_opcodes_h_l2029_c24_070e_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2023_c32_ba38_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2020_c7_2ae7_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2015_c3_05b4 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2012_c7_6025_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2015_c3_05b4;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_f544_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1991_c3_2e19 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1989_c2_0c8c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1991_c3_2e19;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2018_c3_e4f5 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_b05d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2018_c3_e4f5;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2031_c7_4ff2_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2010_c3_dd96 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_46e2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2010_c3_dd96;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2031_c11_0bf7_right := to_unsigned(10, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2028_c3_0f3d := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_dad6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2028_c3_0f3d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_cb90_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c11_8094_right := to_unsigned(4, 3);
     VAR_MUX_uxn_opcodes_h_l2029_c24_070e_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2031_c7_4ff2_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l2023_c32_e24f_iffalse := resize(to_signed(-3, 3), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2012_c11_c43b_right := to_unsigned(6, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1989_c1_203b_iffalse := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1989_c2_0c8c_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2007_c3_c05a := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c7_a317_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2007_c3_c05a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_3218_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2003_c3_1203 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_b4d9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2003_c3_1203;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2000_c3_c506 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_995b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2000_c3_c506;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2025_c7_dad6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1989_c6_5553_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1994_c11_c3e0_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_dad6_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1989_c1_203b_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2023_c32_6b24_left := VAR_ins;
     VAR_BIN_OP_GT_uxn_opcodes_h_l2029_c24_66c2_left := n16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2021_c3_5065_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1989_c2_0c8c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1994_c7_e521_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1997_c7_995b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2002_c7_b4d9_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2005_c7_a317_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2009_c7_46e2_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2017_c7_b05d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2020_c7_2ae7_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1989_c6_5553_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1994_c11_c3e0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1997_c11_caeb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_27bc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c11_8094_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_3218_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2012_c11_c43b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_cb90_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_f544_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_0efe_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2031_c11_0bf7_left := VAR_phase;
     VAR_BIN_OP_GT_uxn_opcodes_h_l2029_c24_66c2_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2006_c3_7b4e_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1989_c2_0c8c_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1994_c7_e521_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2002_c7_b4d9_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2005_c7_a317_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2012_c11_c43b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2012_c11_c43b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2012_c11_c43b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2012_c11_c43b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2012_c11_c43b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2012_c11_c43b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2012_c11_c43b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2009_c11_3218] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2009_c11_3218_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_3218_left;
     BIN_OP_EQ_uxn_opcodes_h_l2009_c11_3218_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_3218_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_3218_return_output := BIN_OP_EQ_uxn_opcodes_h_l2009_c11_3218_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2025_l2020_DUPLICATE_aaa7 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2025_l2020_DUPLICATE_aaa7_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2017_c11_cb90] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2017_c11_cb90_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_cb90_left;
     BIN_OP_EQ_uxn_opcodes_h_l2017_c11_cb90_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_cb90_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_cb90_return_output := BIN_OP_EQ_uxn_opcodes_h_l2017_c11_cb90_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2025_l1997_l1994_l2017_l1989_l2012_l2009_l2005_l2002_DUPLICATE_234a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2025_l1997_l1994_l2017_l1989_l2012_l2009_l2005_l2002_DUPLICATE_234a_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1994_c11_c3e0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1994_c11_c3e0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1994_c11_c3e0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1994_c11_c3e0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1994_c11_c3e0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1994_c11_c3e0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1994_c11_c3e0_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2023_c32_6b24] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2023_c32_6b24_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2023_c32_6b24_left;
     BIN_OP_AND_uxn_opcodes_h_l2023_c32_6b24_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2023_c32_6b24_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2023_c32_6b24_return_output := BIN_OP_AND_uxn_opcodes_h_l2023_c32_6b24_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2031_c11_0bf7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2031_c11_0bf7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2031_c11_0bf7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2031_c11_0bf7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2031_c11_0bf7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2031_c11_0bf7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2031_c11_0bf7_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2025_l1997_l2020_l1994_l2017_l1989_l2012_l2009_l2005_l2002_DUPLICATE_ebc1 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2025_l1997_l2020_l1994_l2017_l1989_l2012_l2009_l2005_l2002_DUPLICATE_ebc1_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2025_c11_0efe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2025_c11_0efe_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_0efe_left;
     BIN_OP_EQ_uxn_opcodes_h_l2025_c11_0efe_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_0efe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_0efe_return_output := BIN_OP_EQ_uxn_opcodes_h_l2025_c11_0efe_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1989_c6_5553] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1989_c6_5553_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1989_c6_5553_left;
     BIN_OP_EQ_uxn_opcodes_h_l1989_c6_5553_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1989_c6_5553_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1989_c6_5553_return_output := BIN_OP_EQ_uxn_opcodes_h_l1989_c6_5553_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1997_l2020_l1994_l2017_l1989_l2012_l2009_l2005_l2031_l2002_DUPLICATE_d092 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1997_l2020_l1994_l2017_l1989_l2012_l2009_l2005_l2031_l2002_DUPLICATE_d092_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2005_c11_8094] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2005_c11_8094_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c11_8094_left;
     BIN_OP_EQ_uxn_opcodes_h_l2005_c11_8094_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c11_8094_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c11_8094_return_output := BIN_OP_EQ_uxn_opcodes_h_l2005_c11_8094_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1997_l2020_l1994_l2017_l1989_l2012_l2009_l2005_l2002_DUPLICATE_be49 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1997_l2020_l1994_l2017_l1989_l2012_l2009_l2005_l2002_DUPLICATE_be49_return_output := result.sp_relative_shift;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2013_l2006_l1998_l2021_DUPLICATE_d6c7 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2013_l2006_l1998_l2021_DUPLICATE_d6c7_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_GT[uxn_opcodes_h_l2029_c24_66c2] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2029_c24_66c2_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2029_c24_66c2_left;
     BIN_OP_GT_uxn_opcodes_h_l2029_c24_66c2_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2029_c24_66c2_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2029_c24_66c2_return_output := BIN_OP_GT_uxn_opcodes_h_l2029_c24_66c2_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2025_l1997_l2020_l1994_l2017_l2012_l2009_l2005_l2031_l2002_DUPLICATE_1bce LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2025_l1997_l2020_l1994_l2017_l2012_l2009_l2005_l2031_l2002_DUPLICATE_1bce_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2020_c11_f544] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2020_c11_f544_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_f544_left;
     BIN_OP_EQ_uxn_opcodes_h_l2020_c11_f544_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_f544_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_f544_return_output := BIN_OP_EQ_uxn_opcodes_h_l2020_c11_f544_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2002_c11_27bc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2002_c11_27bc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_27bc_left;
     BIN_OP_EQ_uxn_opcodes_h_l2002_c11_27bc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_27bc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_27bc_return_output := BIN_OP_EQ_uxn_opcodes_h_l2002_c11_27bc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1997_c11_caeb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1997_c11_caeb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1997_c11_caeb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1997_c11_caeb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1997_c11_caeb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1997_c11_caeb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1997_c11_caeb_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2023_c32_ba38_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2023_c32_6b24_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1989_c1_203b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1989_c6_5553_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1989_c2_0c8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1989_c6_5553_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1989_c2_0c8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1989_c6_5553_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1989_c2_0c8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1989_c6_5553_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1989_c2_0c8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1989_c6_5553_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1989_c2_0c8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1989_c6_5553_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1989_c2_0c8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1989_c6_5553_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1989_c2_0c8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1989_c6_5553_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1989_c2_0c8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1989_c6_5553_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1994_c7_e521_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1994_c11_c3e0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1994_c7_e521_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1994_c11_c3e0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1994_c7_e521_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1994_c11_c3e0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1994_c7_e521_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1994_c11_c3e0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1994_c7_e521_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1994_c11_c3e0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1994_c7_e521_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1994_c11_c3e0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1994_c7_e521_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1994_c11_c3e0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1994_c7_e521_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1994_c11_c3e0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1997_c7_995b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1997_c11_caeb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_995b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1997_c11_caeb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c7_995b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1997_c11_caeb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_995b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1997_c11_caeb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c7_995b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1997_c11_caeb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_995b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1997_c11_caeb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1997_c7_995b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1997_c11_caeb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1997_c7_995b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1997_c11_caeb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2002_c7_b4d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_27bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_b4d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_27bc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_b4d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_27bc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_b4d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_27bc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_b4d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_27bc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_b4d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_27bc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2002_c7_b4d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_27bc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2002_c7_b4d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_27bc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2005_c7_a317_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c11_8094_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2005_c7_a317_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c11_8094_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2005_c7_a317_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c11_8094_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2005_c7_a317_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c11_8094_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c7_a317_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c11_8094_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c7_a317_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c11_8094_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2005_c7_a317_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c11_8094_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2005_c7_a317_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c11_8094_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2009_c7_46e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_3218_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_46e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_3218_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_46e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_3218_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_46e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_3218_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_46e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_3218_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_46e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_3218_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2009_c7_46e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_3218_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2012_c7_6025_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2012_c11_c43b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_6025_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2012_c11_c43b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2012_c7_6025_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2012_c11_c43b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_6025_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2012_c11_c43b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2012_c7_6025_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2012_c11_c43b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2012_c7_6025_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2012_c11_c43b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2012_c7_6025_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2012_c11_c43b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2017_c7_b05d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_cb90_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_b05d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_cb90_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2017_c7_b05d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_cb90_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_b05d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_cb90_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_b05d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_cb90_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_b05d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_cb90_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2017_c7_b05d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_cb90_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2020_c7_2ae7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_f544_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_2ae7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_f544_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2020_c7_2ae7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_f544_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_2ae7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_f544_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_2ae7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_f544_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_2ae7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_f544_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2020_c7_2ae7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_f544_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_dad6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_0efe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2025_c7_dad6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_0efe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_dad6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_0efe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_dad6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_0efe_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2025_c7_dad6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_0efe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2031_c7_4ff2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2031_c11_0bf7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2031_c7_4ff2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2031_c11_0bf7_return_output;
     VAR_MUX_uxn_opcodes_h_l2029_c24_070e_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2029_c24_66c2_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2006_c3_7b4e_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2013_l2006_l1998_l2021_DUPLICATE_d6c7_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2021_c3_5065_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2013_l2006_l1998_l2021_DUPLICATE_d6c7_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1999_l2014_DUPLICATE_9cf2_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2013_l2006_l1998_l2021_DUPLICATE_d6c7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1989_c2_0c8c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1997_l2020_l1994_l2017_l1989_l2012_l2009_l2005_l2002_DUPLICATE_be49_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1994_c7_e521_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1997_l2020_l1994_l2017_l1989_l2012_l2009_l2005_l2002_DUPLICATE_be49_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c7_995b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1997_l2020_l1994_l2017_l1989_l2012_l2009_l2005_l2002_DUPLICATE_be49_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_b4d9_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1997_l2020_l1994_l2017_l1989_l2012_l2009_l2005_l2002_DUPLICATE_be49_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c7_a317_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1997_l2020_l1994_l2017_l1989_l2012_l2009_l2005_l2002_DUPLICATE_be49_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_46e2_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1997_l2020_l1994_l2017_l1989_l2012_l2009_l2005_l2002_DUPLICATE_be49_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2012_c7_6025_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1997_l2020_l1994_l2017_l1989_l2012_l2009_l2005_l2002_DUPLICATE_be49_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_b05d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1997_l2020_l1994_l2017_l1989_l2012_l2009_l2005_l2002_DUPLICATE_be49_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_2ae7_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1997_l2020_l1994_l2017_l1989_l2012_l2009_l2005_l2002_DUPLICATE_be49_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1994_c7_e521_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2025_l1997_l2020_l1994_l2017_l2012_l2009_l2005_l2031_l2002_DUPLICATE_1bce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_995b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2025_l1997_l2020_l1994_l2017_l2012_l2009_l2005_l2031_l2002_DUPLICATE_1bce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_b4d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2025_l1997_l2020_l1994_l2017_l2012_l2009_l2005_l2031_l2002_DUPLICATE_1bce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2005_c7_a317_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2025_l1997_l2020_l1994_l2017_l2012_l2009_l2005_l2031_l2002_DUPLICATE_1bce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_46e2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2025_l1997_l2020_l1994_l2017_l2012_l2009_l2005_l2031_l2002_DUPLICATE_1bce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_6025_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2025_l1997_l2020_l1994_l2017_l2012_l2009_l2005_l2031_l2002_DUPLICATE_1bce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_b05d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2025_l1997_l2020_l1994_l2017_l2012_l2009_l2005_l2031_l2002_DUPLICATE_1bce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_2ae7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2025_l1997_l2020_l1994_l2017_l2012_l2009_l2005_l2031_l2002_DUPLICATE_1bce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_dad6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2025_l1997_l2020_l1994_l2017_l2012_l2009_l2005_l2031_l2002_DUPLICATE_1bce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2031_c7_4ff2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2025_l1997_l2020_l1994_l2017_l2012_l2009_l2005_l2031_l2002_DUPLICATE_1bce_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1989_c2_0c8c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2025_l1997_l1994_l2017_l1989_l2012_l2009_l2005_l2002_DUPLICATE_234a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1994_c7_e521_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2025_l1997_l1994_l2017_l1989_l2012_l2009_l2005_l2002_DUPLICATE_234a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c7_995b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2025_l1997_l1994_l2017_l1989_l2012_l2009_l2005_l2002_DUPLICATE_234a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_b4d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2025_l1997_l1994_l2017_l1989_l2012_l2009_l2005_l2002_DUPLICATE_234a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2005_c7_a317_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2025_l1997_l1994_l2017_l1989_l2012_l2009_l2005_l2002_DUPLICATE_234a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_46e2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2025_l1997_l1994_l2017_l1989_l2012_l2009_l2005_l2002_DUPLICATE_234a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2012_c7_6025_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2025_l1997_l1994_l2017_l1989_l2012_l2009_l2005_l2002_DUPLICATE_234a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2017_c7_b05d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2025_l1997_l1994_l2017_l1989_l2012_l2009_l2005_l2002_DUPLICATE_234a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2025_c7_dad6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2025_l1997_l1994_l2017_l1989_l2012_l2009_l2005_l2002_DUPLICATE_234a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1989_c2_0c8c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1997_l2020_l1994_l2017_l1989_l2012_l2009_l2005_l2031_l2002_DUPLICATE_d092_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1994_c7_e521_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1997_l2020_l1994_l2017_l1989_l2012_l2009_l2005_l2031_l2002_DUPLICATE_d092_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_995b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1997_l2020_l1994_l2017_l1989_l2012_l2009_l2005_l2031_l2002_DUPLICATE_d092_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_b4d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1997_l2020_l1994_l2017_l1989_l2012_l2009_l2005_l2031_l2002_DUPLICATE_d092_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2005_c7_a317_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1997_l2020_l1994_l2017_l1989_l2012_l2009_l2005_l2031_l2002_DUPLICATE_d092_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_46e2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1997_l2020_l1994_l2017_l1989_l2012_l2009_l2005_l2031_l2002_DUPLICATE_d092_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_6025_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1997_l2020_l1994_l2017_l1989_l2012_l2009_l2005_l2031_l2002_DUPLICATE_d092_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_b05d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1997_l2020_l1994_l2017_l1989_l2012_l2009_l2005_l2031_l2002_DUPLICATE_d092_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_2ae7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1997_l2020_l1994_l2017_l1989_l2012_l2009_l2005_l2031_l2002_DUPLICATE_d092_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2031_c7_4ff2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1997_l2020_l1994_l2017_l1989_l2012_l2009_l2005_l2031_l2002_DUPLICATE_d092_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_2ae7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2025_l2020_DUPLICATE_aaa7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_dad6_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2025_l2020_DUPLICATE_aaa7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1989_c2_0c8c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2025_l1997_l2020_l1994_l2017_l1989_l2012_l2009_l2005_l2002_DUPLICATE_ebc1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1994_c7_e521_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2025_l1997_l2020_l1994_l2017_l1989_l2012_l2009_l2005_l2002_DUPLICATE_ebc1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1997_c7_995b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2025_l1997_l2020_l1994_l2017_l1989_l2012_l2009_l2005_l2002_DUPLICATE_ebc1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2002_c7_b4d9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2025_l1997_l2020_l1994_l2017_l1989_l2012_l2009_l2005_l2002_DUPLICATE_ebc1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2005_c7_a317_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2025_l1997_l2020_l1994_l2017_l1989_l2012_l2009_l2005_l2002_DUPLICATE_ebc1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2009_c7_46e2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2025_l1997_l2020_l1994_l2017_l1989_l2012_l2009_l2005_l2002_DUPLICATE_ebc1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2012_c7_6025_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2025_l1997_l2020_l1994_l2017_l1989_l2012_l2009_l2005_l2002_DUPLICATE_ebc1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2017_c7_b05d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2025_l1997_l2020_l1994_l2017_l1989_l2012_l2009_l2005_l2002_DUPLICATE_ebc1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2020_c7_2ae7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2025_l1997_l2020_l1994_l2017_l1989_l2012_l2009_l2005_l2002_DUPLICATE_ebc1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2025_c7_dad6_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2025_l1997_l2020_l1994_l2017_l1989_l2012_l2009_l2005_l2002_DUPLICATE_ebc1_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2025_c7_dad6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_dad6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_dad6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_dad6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_dad6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_dad6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_dad6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_dad6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_dad6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2025_c7_dad6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2025_c7_dad6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2025_c7_dad6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2025_c7_dad6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2025_c7_dad6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2025_c7_dad6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2025_c7_dad6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2025_c7_dad6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2025_c7_dad6_return_output;

     -- MUX[uxn_opcodes_h_l2029_c24_070e] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2029_c24_070e_cond <= VAR_MUX_uxn_opcodes_h_l2029_c24_070e_cond;
     MUX_uxn_opcodes_h_l2029_c24_070e_iftrue <= VAR_MUX_uxn_opcodes_h_l2029_c24_070e_iftrue;
     MUX_uxn_opcodes_h_l2029_c24_070e_iffalse <= VAR_MUX_uxn_opcodes_h_l2029_c24_070e_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2029_c24_070e_return_output := MUX_uxn_opcodes_h_l2029_c24_070e_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2021_c3_5065] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2021_c3_5065_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2021_c3_5065_left;
     BIN_OP_OR_uxn_opcodes_h_l2021_c3_5065_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2021_c3_5065_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2021_c3_5065_return_output := BIN_OP_OR_uxn_opcodes_h_l2021_c3_5065_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2031_c7_4ff2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2031_c7_4ff2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2031_c7_4ff2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2031_c7_4ff2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2031_c7_4ff2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2031_c7_4ff2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2031_c7_4ff2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2031_c7_4ff2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2031_c7_4ff2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2031_c7_4ff2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2031_c7_4ff2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2031_c7_4ff2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2031_c7_4ff2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2031_c7_4ff2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2031_c7_4ff2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2031_c7_4ff2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2031_c7_4ff2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2031_c7_4ff2_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2023_c32_ba38] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2023_c32_ba38_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2023_c32_ba38_left;
     BIN_OP_GT_uxn_opcodes_h_l2023_c32_ba38_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2023_c32_ba38_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2023_c32_ba38_return_output := BIN_OP_GT_uxn_opcodes_h_l2023_c32_ba38_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1989_c1_203b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1989_c1_203b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1989_c1_203b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1989_c1_203b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1989_c1_203b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1989_c1_203b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1989_c1_203b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1989_c1_203b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1989_c1_203b_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1999_l2014_DUPLICATE_9cf2 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1999_l2014_DUPLICATE_9cf2_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1999_l2014_DUPLICATE_9cf2_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1999_l2014_DUPLICATE_9cf2_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1999_l2014_DUPLICATE_9cf2_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2006_c3_7b4e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2006_c3_7b4e_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2006_c3_7b4e_left;
     BIN_OP_OR_uxn_opcodes_h_l2006_c3_7b4e_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2006_c3_7b4e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2006_c3_7b4e_return_output := BIN_OP_OR_uxn_opcodes_h_l2006_c3_7b4e_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2023_c32_e24f_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2023_c32_ba38_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2005_c7_a317_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2006_c3_7b4e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2020_c7_2ae7_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2021_c3_5065_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2012_c7_6025_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1999_l2014_DUPLICATE_9cf2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1997_c7_995b_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1999_l2014_DUPLICATE_9cf2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2025_c7_dad6_iftrue := VAR_MUX_uxn_opcodes_h_l2029_c24_070e_return_output;
     VAR_printf_uxn_opcodes_h_l1990_c3_264f_uxn_opcodes_h_l1990_c3_264f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1989_c1_203b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_dad6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2031_c7_4ff2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2020_c7_2ae7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2025_c7_dad6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_dad6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2031_c7_4ff2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_2ae7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_dad6_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2025_c7_dad6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_dad6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_dad6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_dad6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_dad6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_dad6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_dad6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_dad6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_dad6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2025_c7_dad6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_dad6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_dad6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_dad6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_dad6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_dad6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_dad6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_dad6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_dad6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2020_c7_2ae7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2020_c7_2ae7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2020_c7_2ae7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2020_c7_2ae7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2020_c7_2ae7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2020_c7_2ae7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2020_c7_2ae7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2020_c7_2ae7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2020_c7_2ae7_return_output;

     -- printf_uxn_opcodes_h_l1990_c3_264f[uxn_opcodes_h_l1990_c3_264f] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1990_c3_264f_uxn_opcodes_h_l1990_c3_264f_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1990_c3_264f_uxn_opcodes_h_l1990_c3_264f_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- t16_MUX[uxn_opcodes_h_l2005_c7_a317] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2005_c7_a317_cond <= VAR_t16_MUX_uxn_opcodes_h_l2005_c7_a317_cond;
     t16_MUX_uxn_opcodes_h_l2005_c7_a317_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2005_c7_a317_iftrue;
     t16_MUX_uxn_opcodes_h_l2005_c7_a317_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2005_c7_a317_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2005_c7_a317_return_output := t16_MUX_uxn_opcodes_h_l2005_c7_a317_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2025_c7_dad6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2025_c7_dad6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2025_c7_dad6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2025_c7_dad6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2025_c7_dad6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2025_c7_dad6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2025_c7_dad6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2025_c7_dad6_return_output := result_stack_value_MUX_uxn_opcodes_h_l2025_c7_dad6_return_output;

     -- n16_MUX[uxn_opcodes_h_l2020_c7_2ae7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2020_c7_2ae7_cond <= VAR_n16_MUX_uxn_opcodes_h_l2020_c7_2ae7_cond;
     n16_MUX_uxn_opcodes_h_l2020_c7_2ae7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2020_c7_2ae7_iftrue;
     n16_MUX_uxn_opcodes_h_l2020_c7_2ae7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2020_c7_2ae7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2020_c7_2ae7_return_output := n16_MUX_uxn_opcodes_h_l2020_c7_2ae7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2020_c7_2ae7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_2ae7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_2ae7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_2ae7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_2ae7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_2ae7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_2ae7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_2ae7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_2ae7_return_output;

     -- MUX[uxn_opcodes_h_l2023_c32_e24f] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2023_c32_e24f_cond <= VAR_MUX_uxn_opcodes_h_l2023_c32_e24f_cond;
     MUX_uxn_opcodes_h_l2023_c32_e24f_iftrue <= VAR_MUX_uxn_opcodes_h_l2023_c32_e24f_iftrue;
     MUX_uxn_opcodes_h_l2023_c32_e24f_iffalse <= VAR_MUX_uxn_opcodes_h_l2023_c32_e24f_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2023_c32_e24f_return_output := MUX_uxn_opcodes_h_l2023_c32_e24f_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_2ae7_iftrue := VAR_MUX_uxn_opcodes_h_l2023_c32_e24f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2017_c7_b05d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2020_c7_2ae7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_2ae7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_dad6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2017_c7_b05d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2020_c7_2ae7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_2ae7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_dad6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_b05d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_2ae7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2020_c7_2ae7_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2025_c7_dad6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2002_c7_b4d9_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2005_c7_a317_return_output;
     -- n16_MUX[uxn_opcodes_h_l2017_c7_b05d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2017_c7_b05d_cond <= VAR_n16_MUX_uxn_opcodes_h_l2017_c7_b05d_cond;
     n16_MUX_uxn_opcodes_h_l2017_c7_b05d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2017_c7_b05d_iftrue;
     n16_MUX_uxn_opcodes_h_l2017_c7_b05d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2017_c7_b05d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2017_c7_b05d_return_output := n16_MUX_uxn_opcodes_h_l2017_c7_b05d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2020_c7_2ae7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_2ae7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_2ae7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_2ae7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_2ae7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_2ae7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_2ae7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_2ae7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_2ae7_return_output;

     -- t16_MUX[uxn_opcodes_h_l2002_c7_b4d9] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2002_c7_b4d9_cond <= VAR_t16_MUX_uxn_opcodes_h_l2002_c7_b4d9_cond;
     t16_MUX_uxn_opcodes_h_l2002_c7_b4d9_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2002_c7_b4d9_iftrue;
     t16_MUX_uxn_opcodes_h_l2002_c7_b4d9_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2002_c7_b4d9_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2002_c7_b4d9_return_output := t16_MUX_uxn_opcodes_h_l2002_c7_b4d9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2017_c7_b05d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2017_c7_b05d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2017_c7_b05d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2017_c7_b05d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2017_c7_b05d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2017_c7_b05d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2017_c7_b05d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2017_c7_b05d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2017_c7_b05d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2020_c7_2ae7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_2ae7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_2ae7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_2ae7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_2ae7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_2ae7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_2ae7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_2ae7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_2ae7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2020_c7_2ae7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_2ae7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_2ae7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_2ae7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_2ae7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_2ae7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_2ae7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_2ae7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_2ae7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2017_c7_b05d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_b05d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_b05d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_b05d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_b05d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_b05d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_b05d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_b05d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_b05d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2020_c7_2ae7] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2020_c7_2ae7_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2020_c7_2ae7_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2020_c7_2ae7_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2020_c7_2ae7_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2020_c7_2ae7_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2020_c7_2ae7_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2020_c7_2ae7_return_output := result_stack_value_MUX_uxn_opcodes_h_l2020_c7_2ae7_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l2012_c7_6025_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2017_c7_b05d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_b05d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_2ae7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2012_c7_6025_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2017_c7_b05d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_b05d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_2ae7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_b05d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_2ae7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2012_c7_6025_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_b05d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2017_c7_b05d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2020_c7_2ae7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1997_c7_995b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2002_c7_b4d9_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2017_c7_b05d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2017_c7_b05d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2017_c7_b05d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2017_c7_b05d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2017_c7_b05d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2017_c7_b05d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2017_c7_b05d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2017_c7_b05d_return_output := result_stack_value_MUX_uxn_opcodes_h_l2017_c7_b05d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2012_c7_6025] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2012_c7_6025_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2012_c7_6025_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2012_c7_6025_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2012_c7_6025_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2012_c7_6025_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2012_c7_6025_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2012_c7_6025_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2012_c7_6025_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2017_c7_b05d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_b05d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_b05d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_b05d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_b05d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_b05d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_b05d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_b05d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_b05d_return_output;

     -- n16_MUX[uxn_opcodes_h_l2012_c7_6025] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2012_c7_6025_cond <= VAR_n16_MUX_uxn_opcodes_h_l2012_c7_6025_cond;
     n16_MUX_uxn_opcodes_h_l2012_c7_6025_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2012_c7_6025_iftrue;
     n16_MUX_uxn_opcodes_h_l2012_c7_6025_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2012_c7_6025_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2012_c7_6025_return_output := n16_MUX_uxn_opcodes_h_l2012_c7_6025_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2017_c7_b05d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_b05d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_b05d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_b05d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_b05d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_b05d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_b05d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_b05d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_b05d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2012_c7_6025] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2012_c7_6025_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2012_c7_6025_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2012_c7_6025_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2012_c7_6025_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2012_c7_6025_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2012_c7_6025_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2012_c7_6025_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2012_c7_6025_return_output;

     -- t16_MUX[uxn_opcodes_h_l1997_c7_995b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1997_c7_995b_cond <= VAR_t16_MUX_uxn_opcodes_h_l1997_c7_995b_cond;
     t16_MUX_uxn_opcodes_h_l1997_c7_995b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1997_c7_995b_iftrue;
     t16_MUX_uxn_opcodes_h_l1997_c7_995b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1997_c7_995b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1997_c7_995b_return_output := t16_MUX_uxn_opcodes_h_l1997_c7_995b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2017_c7_b05d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_b05d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_b05d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_b05d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_b05d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_b05d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_b05d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_b05d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_b05d_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2009_c7_46e2_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2012_c7_6025_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_6025_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_b05d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_46e2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2012_c7_6025_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_6025_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_b05d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2012_c7_6025_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_b05d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_46e2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2012_c7_6025_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2012_c7_6025_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2017_c7_b05d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1994_c7_e521_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1997_c7_995b_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2009_c7_46e2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_46e2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_46e2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_46e2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_46e2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_46e2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_46e2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_46e2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_46e2_return_output;

     -- t16_MUX[uxn_opcodes_h_l1994_c7_e521] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1994_c7_e521_cond <= VAR_t16_MUX_uxn_opcodes_h_l1994_c7_e521_cond;
     t16_MUX_uxn_opcodes_h_l1994_c7_e521_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1994_c7_e521_iftrue;
     t16_MUX_uxn_opcodes_h_l1994_c7_e521_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1994_c7_e521_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1994_c7_e521_return_output := t16_MUX_uxn_opcodes_h_l1994_c7_e521_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2012_c7_6025] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2012_c7_6025_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2012_c7_6025_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2012_c7_6025_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2012_c7_6025_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2012_c7_6025_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2012_c7_6025_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2012_c7_6025_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2012_c7_6025_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2012_c7_6025] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_6025_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_6025_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_6025_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_6025_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_6025_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_6025_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_6025_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_6025_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2009_c7_46e2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_46e2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_46e2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_46e2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_46e2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_46e2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_46e2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_46e2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_46e2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2012_c7_6025] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_6025_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_6025_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_6025_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_6025_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_6025_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_6025_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_6025_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_6025_return_output;

     -- n16_MUX[uxn_opcodes_h_l2009_c7_46e2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2009_c7_46e2_cond <= VAR_n16_MUX_uxn_opcodes_h_l2009_c7_46e2_cond;
     n16_MUX_uxn_opcodes_h_l2009_c7_46e2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2009_c7_46e2_iftrue;
     n16_MUX_uxn_opcodes_h_l2009_c7_46e2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2009_c7_46e2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2009_c7_46e2_return_output := n16_MUX_uxn_opcodes_h_l2009_c7_46e2_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2012_c7_6025] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2012_c7_6025_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2012_c7_6025_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2012_c7_6025_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2012_c7_6025_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2012_c7_6025_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2012_c7_6025_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2012_c7_6025_return_output := result_stack_value_MUX_uxn_opcodes_h_l2012_c7_6025_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2005_c7_a317_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2009_c7_46e2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_46e2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_6025_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2005_c7_a317_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_46e2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_46e2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_6025_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_46e2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2012_c7_6025_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c7_a317_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_46e2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2009_c7_46e2_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2012_c7_6025_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1989_c2_0c8c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1994_c7_e521_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2009_c7_46e2] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2009_c7_46e2_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2009_c7_46e2_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2009_c7_46e2_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2009_c7_46e2_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2009_c7_46e2_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2009_c7_46e2_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2009_c7_46e2_return_output := result_stack_value_MUX_uxn_opcodes_h_l2009_c7_46e2_return_output;

     -- n16_MUX[uxn_opcodes_h_l2005_c7_a317] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2005_c7_a317_cond <= VAR_n16_MUX_uxn_opcodes_h_l2005_c7_a317_cond;
     n16_MUX_uxn_opcodes_h_l2005_c7_a317_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2005_c7_a317_iftrue;
     n16_MUX_uxn_opcodes_h_l2005_c7_a317_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2005_c7_a317_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2005_c7_a317_return_output := n16_MUX_uxn_opcodes_h_l2005_c7_a317_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2005_c7_a317] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2005_c7_a317_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2005_c7_a317_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2005_c7_a317_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2005_c7_a317_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2005_c7_a317_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2005_c7_a317_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2005_c7_a317_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2005_c7_a317_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2009_c7_46e2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_46e2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_46e2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_46e2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_46e2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_46e2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_46e2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_46e2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_46e2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2005_c7_a317] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c7_a317_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c7_a317_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c7_a317_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c7_a317_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c7_a317_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c7_a317_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c7_a317_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c7_a317_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2009_c7_46e2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_46e2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_46e2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_46e2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_46e2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_46e2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_46e2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_46e2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_46e2_return_output;

     -- t16_MUX[uxn_opcodes_h_l1989_c2_0c8c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1989_c2_0c8c_cond <= VAR_t16_MUX_uxn_opcodes_h_l1989_c2_0c8c_cond;
     t16_MUX_uxn_opcodes_h_l1989_c2_0c8c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1989_c2_0c8c_iftrue;
     t16_MUX_uxn_opcodes_h_l1989_c2_0c8c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1989_c2_0c8c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1989_c2_0c8c_return_output := t16_MUX_uxn_opcodes_h_l1989_c2_0c8c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2009_c7_46e2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_46e2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_46e2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_46e2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_46e2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_46e2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_46e2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_46e2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_46e2_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2002_c7_b4d9_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2005_c7_a317_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2005_c7_a317_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_46e2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_b4d9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2005_c7_a317_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2005_c7_a317_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_46e2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c7_a317_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_46e2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_b4d9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c7_a317_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2005_c7_a317_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2009_c7_46e2_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1989_c2_0c8c_return_output;
     -- n16_MUX[uxn_opcodes_h_l2002_c7_b4d9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2002_c7_b4d9_cond <= VAR_n16_MUX_uxn_opcodes_h_l2002_c7_b4d9_cond;
     n16_MUX_uxn_opcodes_h_l2002_c7_b4d9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2002_c7_b4d9_iftrue;
     n16_MUX_uxn_opcodes_h_l2002_c7_b4d9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2002_c7_b4d9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2002_c7_b4d9_return_output := n16_MUX_uxn_opcodes_h_l2002_c7_b4d9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2005_c7_a317] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2005_c7_a317_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2005_c7_a317_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2005_c7_a317_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2005_c7_a317_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2005_c7_a317_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2005_c7_a317_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2005_c7_a317_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2005_c7_a317_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2005_c7_a317] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2005_c7_a317_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2005_c7_a317_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2005_c7_a317_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2005_c7_a317_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2005_c7_a317_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2005_c7_a317_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2005_c7_a317_return_output := result_stack_value_MUX_uxn_opcodes_h_l2005_c7_a317_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2002_c7_b4d9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_b4d9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_b4d9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_b4d9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_b4d9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_b4d9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_b4d9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_b4d9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_b4d9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2005_c7_a317] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2005_c7_a317_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2005_c7_a317_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2005_c7_a317_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2005_c7_a317_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2005_c7_a317_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2005_c7_a317_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2005_c7_a317_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2005_c7_a317_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2002_c7_b4d9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_b4d9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_b4d9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_b4d9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_b4d9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_b4d9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_b4d9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_b4d9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_b4d9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2005_c7_a317] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c7_a317_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c7_a317_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c7_a317_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c7_a317_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c7_a317_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c7_a317_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c7_a317_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c7_a317_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1997_c7_995b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2002_c7_b4d9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_b4d9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2005_c7_a317_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c7_995b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_b4d9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_b4d9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2005_c7_a317_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_b4d9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c7_a317_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_995b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_b4d9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2002_c7_b4d9_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2005_c7_a317_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1997_c7_995b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c7_995b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c7_995b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c7_995b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c7_995b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c7_995b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c7_995b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c7_995b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c7_995b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2002_c7_b4d9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_b4d9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_b4d9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_b4d9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_b4d9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_b4d9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_b4d9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_b4d9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_b4d9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1997_c7_995b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_995b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_995b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_995b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_995b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_995b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_995b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_995b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_995b_return_output;

     -- n16_MUX[uxn_opcodes_h_l1997_c7_995b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1997_c7_995b_cond <= VAR_n16_MUX_uxn_opcodes_h_l1997_c7_995b_cond;
     n16_MUX_uxn_opcodes_h_l1997_c7_995b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1997_c7_995b_iftrue;
     n16_MUX_uxn_opcodes_h_l1997_c7_995b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1997_c7_995b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1997_c7_995b_return_output := n16_MUX_uxn_opcodes_h_l1997_c7_995b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2002_c7_b4d9] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2002_c7_b4d9_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2002_c7_b4d9_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2002_c7_b4d9_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2002_c7_b4d9_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2002_c7_b4d9_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2002_c7_b4d9_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2002_c7_b4d9_return_output := result_stack_value_MUX_uxn_opcodes_h_l2002_c7_b4d9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2002_c7_b4d9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_b4d9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_b4d9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_b4d9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_b4d9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_b4d9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_b4d9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_b4d9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_b4d9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2002_c7_b4d9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_b4d9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_b4d9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_b4d9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_b4d9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_b4d9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_b4d9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_b4d9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_b4d9_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1994_c7_e521_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1997_c7_995b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_995b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_b4d9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1994_c7_e521_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1997_c7_995b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_995b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2002_c7_b4d9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c7_995b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_b4d9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1994_c7_e521_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1997_c7_995b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1997_c7_995b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2002_c7_b4d9_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1997_c7_995b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1997_c7_995b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1997_c7_995b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1997_c7_995b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1997_c7_995b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1997_c7_995b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1997_c7_995b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1997_c7_995b_return_output := result_stack_value_MUX_uxn_opcodes_h_l1997_c7_995b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1997_c7_995b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_995b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_995b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_995b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_995b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_995b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_995b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_995b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_995b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1997_c7_995b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c7_995b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c7_995b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c7_995b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c7_995b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c7_995b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c7_995b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c7_995b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c7_995b_return_output;

     -- n16_MUX[uxn_opcodes_h_l1994_c7_e521] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1994_c7_e521_cond <= VAR_n16_MUX_uxn_opcodes_h_l1994_c7_e521_cond;
     n16_MUX_uxn_opcodes_h_l1994_c7_e521_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1994_c7_e521_iftrue;
     n16_MUX_uxn_opcodes_h_l1994_c7_e521_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1994_c7_e521_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1994_c7_e521_return_output := n16_MUX_uxn_opcodes_h_l1994_c7_e521_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1994_c7_e521] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1994_c7_e521_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1994_c7_e521_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1994_c7_e521_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1994_c7_e521_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1994_c7_e521_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1994_c7_e521_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1994_c7_e521_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1994_c7_e521_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1997_c7_995b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_995b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_995b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_995b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_995b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_995b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_995b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_995b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_995b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1994_c7_e521] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1994_c7_e521_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1994_c7_e521_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1994_c7_e521_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1994_c7_e521_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1994_c7_e521_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1994_c7_e521_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1994_c7_e521_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1994_c7_e521_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1989_c2_0c8c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1994_c7_e521_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1994_c7_e521_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1997_c7_995b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1989_c2_0c8c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1994_c7_e521_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1994_c7_e521_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1997_c7_995b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1994_c7_e521_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1997_c7_995b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1989_c2_0c8c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1994_c7_e521_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1994_c7_e521_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1997_c7_995b_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1994_c7_e521] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1994_c7_e521_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1994_c7_e521_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1994_c7_e521_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1994_c7_e521_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1994_c7_e521_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1994_c7_e521_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1994_c7_e521_return_output := result_stack_value_MUX_uxn_opcodes_h_l1994_c7_e521_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1989_c2_0c8c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1989_c2_0c8c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1989_c2_0c8c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1989_c2_0c8c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1989_c2_0c8c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1989_c2_0c8c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1989_c2_0c8c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1989_c2_0c8c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1989_c2_0c8c_return_output;

     -- n16_MUX[uxn_opcodes_h_l1989_c2_0c8c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1989_c2_0c8c_cond <= VAR_n16_MUX_uxn_opcodes_h_l1989_c2_0c8c_cond;
     n16_MUX_uxn_opcodes_h_l1989_c2_0c8c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1989_c2_0c8c_iftrue;
     n16_MUX_uxn_opcodes_h_l1989_c2_0c8c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1989_c2_0c8c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1989_c2_0c8c_return_output := n16_MUX_uxn_opcodes_h_l1989_c2_0c8c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1994_c7_e521] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1994_c7_e521_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1994_c7_e521_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1994_c7_e521_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1994_c7_e521_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1994_c7_e521_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1994_c7_e521_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1994_c7_e521_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1994_c7_e521_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1989_c2_0c8c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1989_c2_0c8c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1989_c2_0c8c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1989_c2_0c8c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1989_c2_0c8c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1989_c2_0c8c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1989_c2_0c8c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1989_c2_0c8c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1989_c2_0c8c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1994_c7_e521] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1994_c7_e521_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1994_c7_e521_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1994_c7_e521_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1994_c7_e521_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1994_c7_e521_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1994_c7_e521_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1994_c7_e521_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1994_c7_e521_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1994_c7_e521] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1994_c7_e521_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1994_c7_e521_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1994_c7_e521_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1994_c7_e521_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1994_c7_e521_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1994_c7_e521_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1994_c7_e521_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1994_c7_e521_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1989_c2_0c8c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1989_c2_0c8c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1994_c7_e521_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1989_c2_0c8c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1994_c7_e521_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1989_c2_0c8c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1994_c7_e521_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1989_c2_0c8c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1994_c7_e521_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1989_c2_0c8c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1989_c2_0c8c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1989_c2_0c8c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1989_c2_0c8c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1989_c2_0c8c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1989_c2_0c8c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1989_c2_0c8c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1989_c2_0c8c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1989_c2_0c8c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1989_c2_0c8c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1989_c2_0c8c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1989_c2_0c8c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1989_c2_0c8c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1989_c2_0c8c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1989_c2_0c8c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1989_c2_0c8c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1989_c2_0c8c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1989_c2_0c8c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1989_c2_0c8c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1989_c2_0c8c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1989_c2_0c8c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1989_c2_0c8c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1989_c2_0c8c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1989_c2_0c8c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1989_c2_0c8c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1989_c2_0c8c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1989_c2_0c8c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1989_c2_0c8c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1989_c2_0c8c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1989_c2_0c8c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1989_c2_0c8c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1989_c2_0c8c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1989_c2_0c8c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1989_c2_0c8c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1989_c2_0c8c_return_output := result_stack_value_MUX_uxn_opcodes_h_l1989_c2_0c8c_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l1985_l2036_DUPLICATE_c4ce LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l1985_l2036_DUPLICATE_c4ce_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_53ff(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1989_c2_0c8c_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1989_c2_0c8c_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1989_c2_0c8c_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1989_c2_0c8c_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1989_c2_0c8c_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1989_c2_0c8c_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l1985_l2036_DUPLICATE_c4ce_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l1985_l2036_DUPLICATE_c4ce_return_output;
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
