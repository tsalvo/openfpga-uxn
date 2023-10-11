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
-- Submodules: 59
entity ora_0CLK_3220bbf1 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ora_0CLK_3220bbf1;
architecture arch of ora_0CLK_3220bbf1 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1059_c6_f5c9]
signal BIN_OP_EQ_uxn_opcodes_h_l1059_c6_f5c9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1059_c6_f5c9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1059_c6_f5c9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1059_c1_d46c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_d46c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_d46c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_d46c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_d46c_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1059_c2_2df0]
signal n8_MUX_uxn_opcodes_h_l1059_c2_2df0_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1059_c2_2df0_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1059_c2_2df0_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1059_c2_2df0_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1059_c2_2df0]
signal t8_MUX_uxn_opcodes_h_l1059_c2_2df0_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1059_c2_2df0_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1059_c2_2df0_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1059_c2_2df0_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1059_c2_2df0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1059_c2_2df0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1059_c2_2df0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1059_c2_2df0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1059_c2_2df0_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1059_c2_2df0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1059_c2_2df0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1059_c2_2df0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1059_c2_2df0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1059_c2_2df0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1059_c2_2df0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1059_c2_2df0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1059_c2_2df0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1059_c2_2df0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1059_c2_2df0_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1059_c2_2df0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1059_c2_2df0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1059_c2_2df0_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1059_c2_2df0_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1059_c2_2df0_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1059_c2_2df0]
signal result_stack_value_MUX_uxn_opcodes_h_l1059_c2_2df0_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1059_c2_2df0_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1059_c2_2df0_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1059_c2_2df0_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1059_c2_2df0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1059_c2_2df0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1059_c2_2df0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1059_c2_2df0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1059_c2_2df0_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l1060_c3_63db[uxn_opcodes_h_l1060_c3_63db]
signal printf_uxn_opcodes_h_l1060_c3_63db_uxn_opcodes_h_l1060_c3_63db_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1064_c11_93c4]
signal BIN_OP_EQ_uxn_opcodes_h_l1064_c11_93c4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1064_c11_93c4_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1064_c11_93c4_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1064_c7_5be0]
signal n8_MUX_uxn_opcodes_h_l1064_c7_5be0_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1064_c7_5be0_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1064_c7_5be0_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1064_c7_5be0_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1064_c7_5be0]
signal t8_MUX_uxn_opcodes_h_l1064_c7_5be0_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1064_c7_5be0_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1064_c7_5be0_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1064_c7_5be0_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1064_c7_5be0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_5be0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_5be0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_5be0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_5be0_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1064_c7_5be0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1064_c7_5be0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1064_c7_5be0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1064_c7_5be0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1064_c7_5be0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1064_c7_5be0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_5be0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_5be0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_5be0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_5be0_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1064_c7_5be0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_5be0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_5be0_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_5be0_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_5be0_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1064_c7_5be0]
signal result_stack_value_MUX_uxn_opcodes_h_l1064_c7_5be0_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1064_c7_5be0_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1064_c7_5be0_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1064_c7_5be0_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1064_c7_5be0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_5be0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_5be0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_5be0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_5be0_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1067_c11_ca1c]
signal BIN_OP_EQ_uxn_opcodes_h_l1067_c11_ca1c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1067_c11_ca1c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1067_c11_ca1c_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1067_c7_89e1]
signal n8_MUX_uxn_opcodes_h_l1067_c7_89e1_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1067_c7_89e1_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1067_c7_89e1_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1067_c7_89e1_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1067_c7_89e1]
signal t8_MUX_uxn_opcodes_h_l1067_c7_89e1_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1067_c7_89e1_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1067_c7_89e1_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1067_c7_89e1_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1067_c7_89e1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_89e1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_89e1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_89e1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_89e1_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1067_c7_89e1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_89e1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_89e1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_89e1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_89e1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1067_c7_89e1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_89e1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_89e1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_89e1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_89e1_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1067_c7_89e1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_89e1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_89e1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_89e1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_89e1_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1067_c7_89e1]
signal result_stack_value_MUX_uxn_opcodes_h_l1067_c7_89e1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1067_c7_89e1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1067_c7_89e1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1067_c7_89e1_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1067_c7_89e1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_89e1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_89e1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_89e1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_89e1_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1071_c11_e600]
signal BIN_OP_EQ_uxn_opcodes_h_l1071_c11_e600_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1071_c11_e600_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1071_c11_e600_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1071_c7_3471]
signal n8_MUX_uxn_opcodes_h_l1071_c7_3471_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1071_c7_3471_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1071_c7_3471_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1071_c7_3471_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1071_c7_3471]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1071_c7_3471_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1071_c7_3471_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1071_c7_3471_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1071_c7_3471_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1071_c7_3471]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1071_c7_3471_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1071_c7_3471_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1071_c7_3471_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1071_c7_3471_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1071_c7_3471]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1071_c7_3471_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1071_c7_3471_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1071_c7_3471_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1071_c7_3471_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1071_c7_3471]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1071_c7_3471_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1071_c7_3471_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1071_c7_3471_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1071_c7_3471_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1071_c7_3471]
signal result_stack_value_MUX_uxn_opcodes_h_l1071_c7_3471_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1071_c7_3471_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1071_c7_3471_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1071_c7_3471_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1071_c7_3471]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1071_c7_3471_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1071_c7_3471_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1071_c7_3471_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1071_c7_3471_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1074_c11_94f8]
signal BIN_OP_EQ_uxn_opcodes_h_l1074_c11_94f8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1074_c11_94f8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1074_c11_94f8_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1074_c7_ad7c]
signal n8_MUX_uxn_opcodes_h_l1074_c7_ad7c_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1074_c7_ad7c_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1074_c7_ad7c_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1074_c7_ad7c_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1074_c7_ad7c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1074_c7_ad7c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1074_c7_ad7c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1074_c7_ad7c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1074_c7_ad7c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1074_c7_ad7c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1074_c7_ad7c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1074_c7_ad7c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1074_c7_ad7c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1074_c7_ad7c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1074_c7_ad7c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1074_c7_ad7c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1074_c7_ad7c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1074_c7_ad7c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1074_c7_ad7c_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1074_c7_ad7c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1074_c7_ad7c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1074_c7_ad7c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1074_c7_ad7c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1074_c7_ad7c_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1074_c7_ad7c]
signal result_stack_value_MUX_uxn_opcodes_h_l1074_c7_ad7c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1074_c7_ad7c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1074_c7_ad7c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1074_c7_ad7c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1074_c7_ad7c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1074_c7_ad7c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1074_c7_ad7c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1074_c7_ad7c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1074_c7_ad7c_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1077_c32_724d]
signal BIN_OP_AND_uxn_opcodes_h_l1077_c32_724d_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1077_c32_724d_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1077_c32_724d_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1077_c32_9845]
signal BIN_OP_GT_uxn_opcodes_h_l1077_c32_9845_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1077_c32_9845_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1077_c32_9845_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1077_c32_29a8]
signal MUX_uxn_opcodes_h_l1077_c32_29a8_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1077_c32_29a8_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1077_c32_29a8_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1077_c32_29a8_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1079_c11_c3ab]
signal BIN_OP_EQ_uxn_opcodes_h_l1079_c11_c3ab_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1079_c11_c3ab_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1079_c11_c3ab_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1079_c7_25dc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_25dc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_25dc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_25dc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_25dc_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1079_c7_25dc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_25dc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_25dc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_25dc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_25dc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1079_c7_25dc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_25dc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_25dc_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_25dc_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_25dc_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1079_c7_25dc]
signal result_stack_value_MUX_uxn_opcodes_h_l1079_c7_25dc_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1079_c7_25dc_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1079_c7_25dc_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1079_c7_25dc_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1079_c7_25dc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_25dc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_25dc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_25dc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_25dc_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1083_c24_7a56]
signal BIN_OP_OR_uxn_opcodes_h_l1083_c24_7a56_left : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1083_c24_7a56_right : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1083_c24_7a56_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1085_c11_69fe]
signal BIN_OP_EQ_uxn_opcodes_h_l1085_c11_69fe_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1085_c11_69fe_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1085_c11_69fe_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1085_c7_2c29]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_2c29_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_2c29_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_2c29_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_2c29_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1085_c7_2c29]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_2c29_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_2c29_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_2c29_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_2c29_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_09c5( ref_toks_0 : opcode_result_t;
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
      base.is_stack_write := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.stack_value := ref_toks_5;
      base.is_opc_done := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1059_c6_f5c9
BIN_OP_EQ_uxn_opcodes_h_l1059_c6_f5c9 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1059_c6_f5c9_left,
BIN_OP_EQ_uxn_opcodes_h_l1059_c6_f5c9_right,
BIN_OP_EQ_uxn_opcodes_h_l1059_c6_f5c9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_d46c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_d46c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_d46c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_d46c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_d46c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_d46c_return_output);

-- n8_MUX_uxn_opcodes_h_l1059_c2_2df0
n8_MUX_uxn_opcodes_h_l1059_c2_2df0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1059_c2_2df0_cond,
n8_MUX_uxn_opcodes_h_l1059_c2_2df0_iftrue,
n8_MUX_uxn_opcodes_h_l1059_c2_2df0_iffalse,
n8_MUX_uxn_opcodes_h_l1059_c2_2df0_return_output);

-- t8_MUX_uxn_opcodes_h_l1059_c2_2df0
t8_MUX_uxn_opcodes_h_l1059_c2_2df0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1059_c2_2df0_cond,
t8_MUX_uxn_opcodes_h_l1059_c2_2df0_iftrue,
t8_MUX_uxn_opcodes_h_l1059_c2_2df0_iffalse,
t8_MUX_uxn_opcodes_h_l1059_c2_2df0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1059_c2_2df0
result_is_stack_write_MUX_uxn_opcodes_h_l1059_c2_2df0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1059_c2_2df0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1059_c2_2df0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1059_c2_2df0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1059_c2_2df0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1059_c2_2df0
result_is_sp_shift_MUX_uxn_opcodes_h_l1059_c2_2df0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1059_c2_2df0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1059_c2_2df0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1059_c2_2df0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1059_c2_2df0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1059_c2_2df0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1059_c2_2df0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1059_c2_2df0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1059_c2_2df0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1059_c2_2df0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1059_c2_2df0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1059_c2_2df0
result_sp_relative_shift_MUX_uxn_opcodes_h_l1059_c2_2df0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1059_c2_2df0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1059_c2_2df0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1059_c2_2df0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1059_c2_2df0_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1059_c2_2df0
result_stack_value_MUX_uxn_opcodes_h_l1059_c2_2df0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1059_c2_2df0_cond,
result_stack_value_MUX_uxn_opcodes_h_l1059_c2_2df0_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1059_c2_2df0_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1059_c2_2df0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1059_c2_2df0
result_is_opc_done_MUX_uxn_opcodes_h_l1059_c2_2df0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1059_c2_2df0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1059_c2_2df0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1059_c2_2df0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1059_c2_2df0_return_output);

-- printf_uxn_opcodes_h_l1060_c3_63db_uxn_opcodes_h_l1060_c3_63db
printf_uxn_opcodes_h_l1060_c3_63db_uxn_opcodes_h_l1060_c3_63db : entity work.printf_uxn_opcodes_h_l1060_c3_63db_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1060_c3_63db_uxn_opcodes_h_l1060_c3_63db_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1064_c11_93c4
BIN_OP_EQ_uxn_opcodes_h_l1064_c11_93c4 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1064_c11_93c4_left,
BIN_OP_EQ_uxn_opcodes_h_l1064_c11_93c4_right,
BIN_OP_EQ_uxn_opcodes_h_l1064_c11_93c4_return_output);

-- n8_MUX_uxn_opcodes_h_l1064_c7_5be0
n8_MUX_uxn_opcodes_h_l1064_c7_5be0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1064_c7_5be0_cond,
n8_MUX_uxn_opcodes_h_l1064_c7_5be0_iftrue,
n8_MUX_uxn_opcodes_h_l1064_c7_5be0_iffalse,
n8_MUX_uxn_opcodes_h_l1064_c7_5be0_return_output);

-- t8_MUX_uxn_opcodes_h_l1064_c7_5be0
t8_MUX_uxn_opcodes_h_l1064_c7_5be0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1064_c7_5be0_cond,
t8_MUX_uxn_opcodes_h_l1064_c7_5be0_iftrue,
t8_MUX_uxn_opcodes_h_l1064_c7_5be0_iffalse,
t8_MUX_uxn_opcodes_h_l1064_c7_5be0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_5be0
result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_5be0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_5be0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_5be0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_5be0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_5be0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1064_c7_5be0
result_is_sp_shift_MUX_uxn_opcodes_h_l1064_c7_5be0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1064_c7_5be0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1064_c7_5be0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1064_c7_5be0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1064_c7_5be0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_5be0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_5be0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_5be0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_5be0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_5be0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_5be0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_5be0
result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_5be0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_5be0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_5be0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_5be0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_5be0_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1064_c7_5be0
result_stack_value_MUX_uxn_opcodes_h_l1064_c7_5be0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1064_c7_5be0_cond,
result_stack_value_MUX_uxn_opcodes_h_l1064_c7_5be0_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1064_c7_5be0_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1064_c7_5be0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_5be0
result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_5be0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_5be0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_5be0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_5be0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_5be0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1067_c11_ca1c
BIN_OP_EQ_uxn_opcodes_h_l1067_c11_ca1c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1067_c11_ca1c_left,
BIN_OP_EQ_uxn_opcodes_h_l1067_c11_ca1c_right,
BIN_OP_EQ_uxn_opcodes_h_l1067_c11_ca1c_return_output);

-- n8_MUX_uxn_opcodes_h_l1067_c7_89e1
n8_MUX_uxn_opcodes_h_l1067_c7_89e1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1067_c7_89e1_cond,
n8_MUX_uxn_opcodes_h_l1067_c7_89e1_iftrue,
n8_MUX_uxn_opcodes_h_l1067_c7_89e1_iffalse,
n8_MUX_uxn_opcodes_h_l1067_c7_89e1_return_output);

-- t8_MUX_uxn_opcodes_h_l1067_c7_89e1
t8_MUX_uxn_opcodes_h_l1067_c7_89e1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1067_c7_89e1_cond,
t8_MUX_uxn_opcodes_h_l1067_c7_89e1_iftrue,
t8_MUX_uxn_opcodes_h_l1067_c7_89e1_iffalse,
t8_MUX_uxn_opcodes_h_l1067_c7_89e1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_89e1
result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_89e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_89e1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_89e1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_89e1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_89e1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_89e1
result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_89e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_89e1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_89e1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_89e1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_89e1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_89e1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_89e1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_89e1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_89e1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_89e1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_89e1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_89e1
result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_89e1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_89e1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_89e1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_89e1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_89e1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1067_c7_89e1
result_stack_value_MUX_uxn_opcodes_h_l1067_c7_89e1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1067_c7_89e1_cond,
result_stack_value_MUX_uxn_opcodes_h_l1067_c7_89e1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1067_c7_89e1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1067_c7_89e1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_89e1
result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_89e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_89e1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_89e1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_89e1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_89e1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1071_c11_e600
BIN_OP_EQ_uxn_opcodes_h_l1071_c11_e600 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1071_c11_e600_left,
BIN_OP_EQ_uxn_opcodes_h_l1071_c11_e600_right,
BIN_OP_EQ_uxn_opcodes_h_l1071_c11_e600_return_output);

-- n8_MUX_uxn_opcodes_h_l1071_c7_3471
n8_MUX_uxn_opcodes_h_l1071_c7_3471 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1071_c7_3471_cond,
n8_MUX_uxn_opcodes_h_l1071_c7_3471_iftrue,
n8_MUX_uxn_opcodes_h_l1071_c7_3471_iffalse,
n8_MUX_uxn_opcodes_h_l1071_c7_3471_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1071_c7_3471
result_is_stack_write_MUX_uxn_opcodes_h_l1071_c7_3471 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1071_c7_3471_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1071_c7_3471_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1071_c7_3471_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1071_c7_3471_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1071_c7_3471
result_is_sp_shift_MUX_uxn_opcodes_h_l1071_c7_3471 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1071_c7_3471_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1071_c7_3471_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1071_c7_3471_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1071_c7_3471_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1071_c7_3471
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1071_c7_3471 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1071_c7_3471_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1071_c7_3471_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1071_c7_3471_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1071_c7_3471_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1071_c7_3471
result_sp_relative_shift_MUX_uxn_opcodes_h_l1071_c7_3471 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1071_c7_3471_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1071_c7_3471_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1071_c7_3471_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1071_c7_3471_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1071_c7_3471
result_stack_value_MUX_uxn_opcodes_h_l1071_c7_3471 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1071_c7_3471_cond,
result_stack_value_MUX_uxn_opcodes_h_l1071_c7_3471_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1071_c7_3471_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1071_c7_3471_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1071_c7_3471
result_is_opc_done_MUX_uxn_opcodes_h_l1071_c7_3471 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1071_c7_3471_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1071_c7_3471_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1071_c7_3471_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1071_c7_3471_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1074_c11_94f8
BIN_OP_EQ_uxn_opcodes_h_l1074_c11_94f8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1074_c11_94f8_left,
BIN_OP_EQ_uxn_opcodes_h_l1074_c11_94f8_right,
BIN_OP_EQ_uxn_opcodes_h_l1074_c11_94f8_return_output);

-- n8_MUX_uxn_opcodes_h_l1074_c7_ad7c
n8_MUX_uxn_opcodes_h_l1074_c7_ad7c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1074_c7_ad7c_cond,
n8_MUX_uxn_opcodes_h_l1074_c7_ad7c_iftrue,
n8_MUX_uxn_opcodes_h_l1074_c7_ad7c_iffalse,
n8_MUX_uxn_opcodes_h_l1074_c7_ad7c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1074_c7_ad7c
result_is_stack_write_MUX_uxn_opcodes_h_l1074_c7_ad7c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1074_c7_ad7c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1074_c7_ad7c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1074_c7_ad7c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1074_c7_ad7c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1074_c7_ad7c
result_is_sp_shift_MUX_uxn_opcodes_h_l1074_c7_ad7c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1074_c7_ad7c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1074_c7_ad7c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1074_c7_ad7c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1074_c7_ad7c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1074_c7_ad7c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1074_c7_ad7c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1074_c7_ad7c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1074_c7_ad7c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1074_c7_ad7c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1074_c7_ad7c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1074_c7_ad7c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1074_c7_ad7c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1074_c7_ad7c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1074_c7_ad7c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1074_c7_ad7c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1074_c7_ad7c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1074_c7_ad7c
result_stack_value_MUX_uxn_opcodes_h_l1074_c7_ad7c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1074_c7_ad7c_cond,
result_stack_value_MUX_uxn_opcodes_h_l1074_c7_ad7c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1074_c7_ad7c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1074_c7_ad7c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1074_c7_ad7c
result_is_opc_done_MUX_uxn_opcodes_h_l1074_c7_ad7c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1074_c7_ad7c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1074_c7_ad7c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1074_c7_ad7c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1074_c7_ad7c_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1077_c32_724d
BIN_OP_AND_uxn_opcodes_h_l1077_c32_724d : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1077_c32_724d_left,
BIN_OP_AND_uxn_opcodes_h_l1077_c32_724d_right,
BIN_OP_AND_uxn_opcodes_h_l1077_c32_724d_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1077_c32_9845
BIN_OP_GT_uxn_opcodes_h_l1077_c32_9845 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1077_c32_9845_left,
BIN_OP_GT_uxn_opcodes_h_l1077_c32_9845_right,
BIN_OP_GT_uxn_opcodes_h_l1077_c32_9845_return_output);

-- MUX_uxn_opcodes_h_l1077_c32_29a8
MUX_uxn_opcodes_h_l1077_c32_29a8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1077_c32_29a8_cond,
MUX_uxn_opcodes_h_l1077_c32_29a8_iftrue,
MUX_uxn_opcodes_h_l1077_c32_29a8_iffalse,
MUX_uxn_opcodes_h_l1077_c32_29a8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1079_c11_c3ab
BIN_OP_EQ_uxn_opcodes_h_l1079_c11_c3ab : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1079_c11_c3ab_left,
BIN_OP_EQ_uxn_opcodes_h_l1079_c11_c3ab_right,
BIN_OP_EQ_uxn_opcodes_h_l1079_c11_c3ab_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_25dc
result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_25dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_25dc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_25dc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_25dc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_25dc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_25dc
result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_25dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_25dc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_25dc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_25dc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_25dc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_25dc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_25dc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_25dc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_25dc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_25dc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_25dc_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1079_c7_25dc
result_stack_value_MUX_uxn_opcodes_h_l1079_c7_25dc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1079_c7_25dc_cond,
result_stack_value_MUX_uxn_opcodes_h_l1079_c7_25dc_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1079_c7_25dc_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1079_c7_25dc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_25dc
result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_25dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_25dc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_25dc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_25dc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_25dc_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1083_c24_7a56
BIN_OP_OR_uxn_opcodes_h_l1083_c24_7a56 : entity work.BIN_OP_OR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1083_c24_7a56_left,
BIN_OP_OR_uxn_opcodes_h_l1083_c24_7a56_right,
BIN_OP_OR_uxn_opcodes_h_l1083_c24_7a56_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1085_c11_69fe
BIN_OP_EQ_uxn_opcodes_h_l1085_c11_69fe : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1085_c11_69fe_left,
BIN_OP_EQ_uxn_opcodes_h_l1085_c11_69fe_right,
BIN_OP_EQ_uxn_opcodes_h_l1085_c11_69fe_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_2c29
result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_2c29 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_2c29_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_2c29_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_2c29_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_2c29_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_2c29
result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_2c29 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_2c29_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_2c29_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_2c29_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_2c29_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1059_c6_f5c9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_d46c_return_output,
 n8_MUX_uxn_opcodes_h_l1059_c2_2df0_return_output,
 t8_MUX_uxn_opcodes_h_l1059_c2_2df0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1059_c2_2df0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1059_c2_2df0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1059_c2_2df0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1059_c2_2df0_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1059_c2_2df0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1059_c2_2df0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1064_c11_93c4_return_output,
 n8_MUX_uxn_opcodes_h_l1064_c7_5be0_return_output,
 t8_MUX_uxn_opcodes_h_l1064_c7_5be0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_5be0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1064_c7_5be0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_5be0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_5be0_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1064_c7_5be0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_5be0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1067_c11_ca1c_return_output,
 n8_MUX_uxn_opcodes_h_l1067_c7_89e1_return_output,
 t8_MUX_uxn_opcodes_h_l1067_c7_89e1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_89e1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_89e1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_89e1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_89e1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1067_c7_89e1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_89e1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1071_c11_e600_return_output,
 n8_MUX_uxn_opcodes_h_l1071_c7_3471_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1071_c7_3471_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1071_c7_3471_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1071_c7_3471_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1071_c7_3471_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1071_c7_3471_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1071_c7_3471_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1074_c11_94f8_return_output,
 n8_MUX_uxn_opcodes_h_l1074_c7_ad7c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1074_c7_ad7c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1074_c7_ad7c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1074_c7_ad7c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1074_c7_ad7c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1074_c7_ad7c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1074_c7_ad7c_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1077_c32_724d_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1077_c32_9845_return_output,
 MUX_uxn_opcodes_h_l1077_c32_29a8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1079_c11_c3ab_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_25dc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_25dc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_25dc_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1079_c7_25dc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_25dc_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1083_c24_7a56_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1085_c11_69fe_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_2c29_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_2c29_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c6_f5c9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c6_f5c9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c6_f5c9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_d46c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_d46c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_d46c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_d46c_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1059_c2_2df0_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1059_c2_2df0_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1064_c7_5be0_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1059_c2_2df0_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1059_c2_2df0_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1059_c2_2df0_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1059_c2_2df0_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1064_c7_5be0_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1059_c2_2df0_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1059_c2_2df0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1059_c2_2df0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1059_c2_2df0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_5be0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1059_c2_2df0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1059_c2_2df0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1059_c2_2df0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1059_c2_2df0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1064_c7_5be0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1059_c2_2df0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1059_c2_2df0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1059_c2_2df0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1061_c3_c6b0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1059_c2_2df0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_5be0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1059_c2_2df0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1059_c2_2df0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1059_c2_2df0_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1059_c2_2df0_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_5be0_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1059_c2_2df0_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1059_c2_2df0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1059_c2_2df0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1059_c2_2df0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1064_c7_5be0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1059_c2_2df0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1059_c2_2df0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1059_c2_2df0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1059_c2_2df0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_5be0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1059_c2_2df0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1059_c2_2df0_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1060_c3_63db_uxn_opcodes_h_l1060_c3_63db_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_93c4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_93c4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_93c4_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1064_c7_5be0_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1064_c7_5be0_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1067_c7_89e1_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1064_c7_5be0_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1064_c7_5be0_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1064_c7_5be0_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1067_c7_89e1_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1064_c7_5be0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_5be0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_5be0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_89e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_5be0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1064_c7_5be0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1064_c7_5be0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_89e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1064_c7_5be0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_5be0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1065_c3_ea5a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_5be0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_89e1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_5be0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_5be0_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_5be0_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_89e1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_5be0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1064_c7_5be0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1064_c7_5be0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1067_c7_89e1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1064_c7_5be0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_5be0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_5be0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_89e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_5be0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_ca1c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_ca1c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_ca1c_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1067_c7_89e1_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1067_c7_89e1_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1071_c7_3471_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1067_c7_89e1_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1067_c7_89e1_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1067_c7_89e1_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1067_c7_89e1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_89e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_89e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1071_c7_3471_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_89e1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_89e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_89e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1071_c7_3471_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_89e1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_89e1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1069_c3_969f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_89e1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1071_c7_3471_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_89e1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_89e1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_89e1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1071_c7_3471_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_89e1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1067_c7_89e1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1067_c7_89e1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1071_c7_3471_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1067_c7_89e1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_89e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_89e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1071_c7_3471_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_89e1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1071_c11_e600_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1071_c11_e600_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1071_c11_e600_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1071_c7_3471_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1071_c7_3471_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1074_c7_ad7c_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1071_c7_3471_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1071_c7_3471_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1071_c7_3471_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1074_c7_ad7c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1071_c7_3471_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1071_c7_3471_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1071_c7_3471_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1074_c7_ad7c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1071_c7_3471_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1071_c7_3471_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1072_c3_c586 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1071_c7_3471_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1074_c7_ad7c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1071_c7_3471_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1071_c7_3471_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1071_c7_3471_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1074_c7_ad7c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1071_c7_3471_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1071_c7_3471_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1071_c7_3471_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1074_c7_ad7c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1071_c7_3471_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1071_c7_3471_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1071_c7_3471_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1074_c7_ad7c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1071_c7_3471_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1074_c11_94f8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1074_c11_94f8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1074_c11_94f8_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1074_c7_ad7c_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1074_c7_ad7c_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1074_c7_ad7c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1074_c7_ad7c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1074_c7_ad7c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_25dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1074_c7_ad7c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1074_c7_ad7c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1074_c7_ad7c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_25dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1074_c7_ad7c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1074_c7_ad7c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1074_c7_ad7c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_25dc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1074_c7_ad7c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1074_c7_ad7c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1074_c7_ad7c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1074_c7_ad7c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1074_c7_ad7c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1074_c7_ad7c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1079_c7_25dc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1074_c7_ad7c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1074_c7_ad7c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1074_c7_ad7c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_25dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1074_c7_ad7c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1077_c32_29a8_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1077_c32_29a8_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1077_c32_29a8_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1077_c32_724d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1077_c32_724d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1077_c32_724d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1077_c32_9845_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1077_c32_9845_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1077_c32_9845_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1077_c32_29a8_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_c3ab_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_c3ab_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_c3ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_25dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_25dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_2c29_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_25dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_25dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_25dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_25dc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_25dc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1082_c3_84d2 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_25dc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_25dc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1079_c7_25dc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1079_c7_25dc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1079_c7_25dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_25dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_25dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_2c29_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_25dc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1083_c24_7a56_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1083_c24_7a56_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1083_c24_7a56_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_69fe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_69fe_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_69fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_2c29_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_2c29_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_2c29_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_2c29_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_2c29_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_2c29_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1067_l1064_l1059_l1085_l1074_l1071_DUPLICATE_f0f9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1067_l1064_l1059_l1079_l1071_DUPLICATE_e1c3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1067_l1064_l1059_l1074_l1071_DUPLICATE_f29f_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1067_l1064_l1059_l1079_l1074_l1071_DUPLICATE_4bbc_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1067_l1064_l1085_l1079_l1074_l1071_DUPLICATE_3c32_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1074_l1079_DUPLICATE_c223_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l1090_l1055_DUPLICATE_b909_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c6_f5c9_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1069_c3_969f := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_89e1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1069_c3_969f;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_25dc_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_25dc_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_c3ab_right := to_unsigned(5, 3);
     VAR_MUX_uxn_opcodes_h_l1077_c32_29a8_iffalse := resize(to_signed(-1, 2), 8);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1077_c32_9845_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1061_c3_c6b0 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1059_c2_2df0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1061_c3_c6b0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_69fe_right := to_unsigned(6, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_2c29_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_ca1c_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1071_c11_e600_right := to_unsigned(3, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_d46c_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_2c29_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1082_c3_84d2 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_25dc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1082_c3_84d2;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_93c4_right := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1077_c32_29a8_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1065_c3_ea5a := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_5be0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1065_c3_ea5a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1074_c11_94f8_right := to_unsigned(4, 3);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1077_c32_724d_right := to_unsigned(128, 8);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1074_c7_ad7c_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1072_c3_c586 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1071_c7_3471_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1072_c3_c586;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1059_c2_2df0_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_d46c_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1077_c32_724d_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1083_c24_7a56_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1059_c2_2df0_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1064_c7_5be0_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1067_c7_89e1_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1071_c7_3471_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1074_c7_ad7c_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c6_f5c9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_93c4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_ca1c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1071_c11_e600_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1074_c11_94f8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_c3ab_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_69fe_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l1074_c7_ad7c_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1067_c7_89e1_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1083_c24_7a56_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1059_c2_2df0_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1064_c7_5be0_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1067_c7_89e1_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1074_c11_94f8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1074_c11_94f8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1074_c11_94f8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1074_c11_94f8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1074_c11_94f8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1074_c11_94f8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1074_c11_94f8_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1067_l1064_l1085_l1079_l1074_l1071_DUPLICATE_3c32 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1067_l1064_l1085_l1079_l1074_l1071_DUPLICATE_3c32_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1067_c11_ca1c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1067_c11_ca1c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_ca1c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1067_c11_ca1c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_ca1c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_ca1c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1067_c11_ca1c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1071_c11_e600] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1071_c11_e600_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1071_c11_e600_left;
     BIN_OP_EQ_uxn_opcodes_h_l1071_c11_e600_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1071_c11_e600_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1071_c11_e600_return_output := BIN_OP_EQ_uxn_opcodes_h_l1071_c11_e600_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1074_l1079_DUPLICATE_c223 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1074_l1079_DUPLICATE_c223_return_output := result.stack_address_sp_offset;

     -- BIN_OP_OR[uxn_opcodes_h_l1083_c24_7a56] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1083_c24_7a56_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1083_c24_7a56_left;
     BIN_OP_OR_uxn_opcodes_h_l1083_c24_7a56_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1083_c24_7a56_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1083_c24_7a56_return_output := BIN_OP_OR_uxn_opcodes_h_l1083_c24_7a56_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1067_l1064_l1059_l1079_l1071_DUPLICATE_e1c3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1067_l1064_l1059_l1079_l1071_DUPLICATE_e1c3_return_output := result.is_sp_shift;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1067_l1064_l1059_l1074_l1071_DUPLICATE_f29f LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1067_l1064_l1059_l1074_l1071_DUPLICATE_f29f_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1067_l1064_l1059_l1085_l1074_l1071_DUPLICATE_f0f9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1067_l1064_l1059_l1085_l1074_l1071_DUPLICATE_f0f9_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1079_c11_c3ab] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1079_c11_c3ab_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_c3ab_left;
     BIN_OP_EQ_uxn_opcodes_h_l1079_c11_c3ab_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_c3ab_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_c3ab_return_output := BIN_OP_EQ_uxn_opcodes_h_l1079_c11_c3ab_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1064_c11_93c4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1064_c11_93c4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_93c4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1064_c11_93c4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_93c4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_93c4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1064_c11_93c4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1059_c6_f5c9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1059_c6_f5c9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c6_f5c9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1059_c6_f5c9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c6_f5c9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c6_f5c9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1059_c6_f5c9_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1077_c32_724d] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1077_c32_724d_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1077_c32_724d_left;
     BIN_OP_AND_uxn_opcodes_h_l1077_c32_724d_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1077_c32_724d_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1077_c32_724d_return_output := BIN_OP_AND_uxn_opcodes_h_l1077_c32_724d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1085_c11_69fe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1085_c11_69fe_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_69fe_left;
     BIN_OP_EQ_uxn_opcodes_h_l1085_c11_69fe_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_69fe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_69fe_return_output := BIN_OP_EQ_uxn_opcodes_h_l1085_c11_69fe_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1067_l1064_l1059_l1079_l1074_l1071_DUPLICATE_4bbc LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1067_l1064_l1059_l1079_l1074_l1071_DUPLICATE_4bbc_return_output := result.stack_value;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1077_c32_9845_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1077_c32_724d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_d46c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c6_f5c9_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1059_c2_2df0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c6_f5c9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1059_c2_2df0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c6_f5c9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1059_c2_2df0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c6_f5c9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1059_c2_2df0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c6_f5c9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1059_c2_2df0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c6_f5c9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1059_c2_2df0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c6_f5c9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1059_c2_2df0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c6_f5c9_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1059_c2_2df0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c6_f5c9_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1064_c7_5be0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_93c4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_5be0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_93c4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1064_c7_5be0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_93c4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_5be0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_93c4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_5be0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_93c4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_5be0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_93c4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1064_c7_5be0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_93c4_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1064_c7_5be0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_93c4_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1067_c7_89e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_ca1c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_89e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_ca1c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_89e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_ca1c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_89e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_ca1c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_89e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_ca1c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_89e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_ca1c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1067_c7_89e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_ca1c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1067_c7_89e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_ca1c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1071_c7_3471_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1071_c11_e600_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1071_c7_3471_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1071_c11_e600_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1071_c7_3471_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1071_c11_e600_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1071_c7_3471_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1071_c11_e600_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1071_c7_3471_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1071_c11_e600_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1071_c7_3471_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1071_c11_e600_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1071_c7_3471_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1071_c11_e600_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1074_c7_ad7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1074_c11_94f8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1074_c7_ad7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1074_c11_94f8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1074_c7_ad7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1074_c11_94f8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1074_c7_ad7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1074_c11_94f8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1074_c7_ad7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1074_c11_94f8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1074_c7_ad7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1074_c11_94f8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1074_c7_ad7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1074_c11_94f8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_25dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_c3ab_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_25dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_c3ab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_25dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_c3ab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_25dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_c3ab_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1079_c7_25dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_c3ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_2c29_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_69fe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_2c29_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_69fe_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1079_c7_25dc_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1083_c24_7a56_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1059_c2_2df0_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1067_l1064_l1059_l1074_l1071_DUPLICATE_f29f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_5be0_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1067_l1064_l1059_l1074_l1071_DUPLICATE_f29f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_89e1_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1067_l1064_l1059_l1074_l1071_DUPLICATE_f29f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1071_c7_3471_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1067_l1064_l1059_l1074_l1071_DUPLICATE_f29f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1074_c7_ad7c_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1067_l1064_l1059_l1074_l1071_DUPLICATE_f29f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_5be0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1067_l1064_l1085_l1079_l1074_l1071_DUPLICATE_3c32_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_89e1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1067_l1064_l1085_l1079_l1074_l1071_DUPLICATE_3c32_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1071_c7_3471_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1067_l1064_l1085_l1079_l1074_l1071_DUPLICATE_3c32_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1074_c7_ad7c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1067_l1064_l1085_l1079_l1074_l1071_DUPLICATE_3c32_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_25dc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1067_l1064_l1085_l1079_l1074_l1071_DUPLICATE_3c32_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_2c29_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1067_l1064_l1085_l1079_l1074_l1071_DUPLICATE_3c32_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1059_c2_2df0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1067_l1064_l1059_l1079_l1071_DUPLICATE_e1c3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1064_c7_5be0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1067_l1064_l1059_l1079_l1071_DUPLICATE_e1c3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_89e1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1067_l1064_l1059_l1079_l1071_DUPLICATE_e1c3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1071_c7_3471_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1067_l1064_l1059_l1079_l1071_DUPLICATE_e1c3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_25dc_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1067_l1064_l1059_l1079_l1071_DUPLICATE_e1c3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1059_c2_2df0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1067_l1064_l1059_l1085_l1074_l1071_DUPLICATE_f0f9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_5be0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1067_l1064_l1059_l1085_l1074_l1071_DUPLICATE_f0f9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_89e1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1067_l1064_l1059_l1085_l1074_l1071_DUPLICATE_f0f9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1071_c7_3471_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1067_l1064_l1059_l1085_l1074_l1071_DUPLICATE_f0f9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1074_c7_ad7c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1067_l1064_l1059_l1085_l1074_l1071_DUPLICATE_f0f9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_2c29_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1067_l1064_l1059_l1085_l1074_l1071_DUPLICATE_f0f9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1074_c7_ad7c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1074_l1079_DUPLICATE_c223_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_25dc_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1074_l1079_DUPLICATE_c223_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1059_c2_2df0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1067_l1064_l1059_l1079_l1074_l1071_DUPLICATE_4bbc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1064_c7_5be0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1067_l1064_l1059_l1079_l1074_l1071_DUPLICATE_4bbc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1067_c7_89e1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1067_l1064_l1059_l1079_l1074_l1071_DUPLICATE_4bbc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1071_c7_3471_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1067_l1064_l1059_l1079_l1074_l1071_DUPLICATE_4bbc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1074_c7_ad7c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1067_l1064_l1059_l1079_l1074_l1071_DUPLICATE_4bbc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1079_c7_25dc_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1067_l1064_l1059_l1079_l1074_l1071_DUPLICATE_4bbc_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1079_c7_25dc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_25dc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_25dc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_25dc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_25dc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_25dc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_25dc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_25dc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_25dc_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1079_c7_25dc] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1079_c7_25dc_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1079_c7_25dc_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1079_c7_25dc_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1079_c7_25dc_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1079_c7_25dc_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1079_c7_25dc_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1079_c7_25dc_return_output := result_stack_value_MUX_uxn_opcodes_h_l1079_c7_25dc_return_output;

     -- n8_MUX[uxn_opcodes_h_l1074_c7_ad7c] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1074_c7_ad7c_cond <= VAR_n8_MUX_uxn_opcodes_h_l1074_c7_ad7c_cond;
     n8_MUX_uxn_opcodes_h_l1074_c7_ad7c_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1074_c7_ad7c_iftrue;
     n8_MUX_uxn_opcodes_h_l1074_c7_ad7c_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1074_c7_ad7c_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1074_c7_ad7c_return_output := n8_MUX_uxn_opcodes_h_l1074_c7_ad7c_return_output;

     -- t8_MUX[uxn_opcodes_h_l1067_c7_89e1] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1067_c7_89e1_cond <= VAR_t8_MUX_uxn_opcodes_h_l1067_c7_89e1_cond;
     t8_MUX_uxn_opcodes_h_l1067_c7_89e1_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1067_c7_89e1_iftrue;
     t8_MUX_uxn_opcodes_h_l1067_c7_89e1_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1067_c7_89e1_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1067_c7_89e1_return_output := t8_MUX_uxn_opcodes_h_l1067_c7_89e1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1085_c7_2c29] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_2c29_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_2c29_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_2c29_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_2c29_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_2c29_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_2c29_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_2c29_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_2c29_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1077_c32_9845] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1077_c32_9845_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1077_c32_9845_left;
     BIN_OP_GT_uxn_opcodes_h_l1077_c32_9845_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1077_c32_9845_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1077_c32_9845_return_output := BIN_OP_GT_uxn_opcodes_h_l1077_c32_9845_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1079_c7_25dc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_25dc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_25dc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_25dc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_25dc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_25dc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_25dc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_25dc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_25dc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1085_c7_2c29] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_2c29_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_2c29_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_2c29_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_2c29_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_2c29_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_2c29_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_2c29_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_2c29_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1059_c1_d46c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_d46c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_d46c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_d46c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_d46c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_d46c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_d46c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_d46c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_d46c_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1077_c32_29a8_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1077_c32_9845_return_output;
     VAR_printf_uxn_opcodes_h_l1060_c3_63db_uxn_opcodes_h_l1060_c3_63db_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_d46c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1071_c7_3471_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1074_c7_ad7c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_25dc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_2c29_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1074_c7_ad7c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_25dc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_25dc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_2c29_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1074_c7_ad7c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_25dc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1074_c7_ad7c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1079_c7_25dc_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1064_c7_5be0_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1067_c7_89e1_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1079_c7_25dc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_25dc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_25dc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_25dc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_25dc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_25dc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_25dc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_25dc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_25dc_return_output;

     -- n8_MUX[uxn_opcodes_h_l1071_c7_3471] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1071_c7_3471_cond <= VAR_n8_MUX_uxn_opcodes_h_l1071_c7_3471_cond;
     n8_MUX_uxn_opcodes_h_l1071_c7_3471_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1071_c7_3471_iftrue;
     n8_MUX_uxn_opcodes_h_l1071_c7_3471_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1071_c7_3471_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1071_c7_3471_return_output := n8_MUX_uxn_opcodes_h_l1071_c7_3471_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1074_c7_ad7c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1074_c7_ad7c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1074_c7_ad7c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1074_c7_ad7c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1074_c7_ad7c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1074_c7_ad7c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1074_c7_ad7c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1074_c7_ad7c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1074_c7_ad7c_return_output;

     -- t8_MUX[uxn_opcodes_h_l1064_c7_5be0] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1064_c7_5be0_cond <= VAR_t8_MUX_uxn_opcodes_h_l1064_c7_5be0_cond;
     t8_MUX_uxn_opcodes_h_l1064_c7_5be0_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1064_c7_5be0_iftrue;
     t8_MUX_uxn_opcodes_h_l1064_c7_5be0_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1064_c7_5be0_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1064_c7_5be0_return_output := t8_MUX_uxn_opcodes_h_l1064_c7_5be0_return_output;

     -- MUX[uxn_opcodes_h_l1077_c32_29a8] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1077_c32_29a8_cond <= VAR_MUX_uxn_opcodes_h_l1077_c32_29a8_cond;
     MUX_uxn_opcodes_h_l1077_c32_29a8_iftrue <= VAR_MUX_uxn_opcodes_h_l1077_c32_29a8_iftrue;
     MUX_uxn_opcodes_h_l1077_c32_29a8_iffalse <= VAR_MUX_uxn_opcodes_h_l1077_c32_29a8_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1077_c32_29a8_return_output := MUX_uxn_opcodes_h_l1077_c32_29a8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1079_c7_25dc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_25dc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_25dc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_25dc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_25dc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_25dc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_25dc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_25dc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_25dc_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1074_c7_ad7c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1074_c7_ad7c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1074_c7_ad7c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1074_c7_ad7c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1074_c7_ad7c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1074_c7_ad7c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1074_c7_ad7c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1074_c7_ad7c_return_output := result_stack_value_MUX_uxn_opcodes_h_l1074_c7_ad7c_return_output;

     -- printf_uxn_opcodes_h_l1060_c3_63db[uxn_opcodes_h_l1060_c3_63db] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1060_c3_63db_uxn_opcodes_h_l1060_c3_63db_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1060_c3_63db_uxn_opcodes_h_l1060_c3_63db_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1074_c7_ad7c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1074_c7_ad7c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1074_c7_ad7c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1074_c7_ad7c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1074_c7_ad7c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1074_c7_ad7c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1074_c7_ad7c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1074_c7_ad7c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1074_c7_ad7c_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1074_c7_ad7c_iftrue := VAR_MUX_uxn_opcodes_h_l1077_c32_29a8_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1067_c7_89e1_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1071_c7_3471_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1074_c7_ad7c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_25dc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1071_c7_3471_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1074_c7_ad7c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1074_c7_ad7c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_25dc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1071_c7_3471_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1074_c7_ad7c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1071_c7_3471_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1074_c7_ad7c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1059_c2_2df0_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1064_c7_5be0_return_output;
     -- t8_MUX[uxn_opcodes_h_l1059_c2_2df0] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1059_c2_2df0_cond <= VAR_t8_MUX_uxn_opcodes_h_l1059_c2_2df0_cond;
     t8_MUX_uxn_opcodes_h_l1059_c2_2df0_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1059_c2_2df0_iftrue;
     t8_MUX_uxn_opcodes_h_l1059_c2_2df0_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1059_c2_2df0_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1059_c2_2df0_return_output := t8_MUX_uxn_opcodes_h_l1059_c2_2df0_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1071_c7_3471] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1071_c7_3471_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1071_c7_3471_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1071_c7_3471_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1071_c7_3471_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1071_c7_3471_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1071_c7_3471_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1071_c7_3471_return_output := result_stack_value_MUX_uxn_opcodes_h_l1071_c7_3471_return_output;

     -- n8_MUX[uxn_opcodes_h_l1067_c7_89e1] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1067_c7_89e1_cond <= VAR_n8_MUX_uxn_opcodes_h_l1067_c7_89e1_cond;
     n8_MUX_uxn_opcodes_h_l1067_c7_89e1_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1067_c7_89e1_iftrue;
     n8_MUX_uxn_opcodes_h_l1067_c7_89e1_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1067_c7_89e1_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1067_c7_89e1_return_output := n8_MUX_uxn_opcodes_h_l1067_c7_89e1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1074_c7_ad7c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1074_c7_ad7c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1074_c7_ad7c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1074_c7_ad7c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1074_c7_ad7c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1074_c7_ad7c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1074_c7_ad7c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1074_c7_ad7c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1074_c7_ad7c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1074_c7_ad7c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1074_c7_ad7c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1074_c7_ad7c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1074_c7_ad7c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1074_c7_ad7c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1074_c7_ad7c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1074_c7_ad7c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1074_c7_ad7c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1074_c7_ad7c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1071_c7_3471] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1071_c7_3471_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1071_c7_3471_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1071_c7_3471_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1071_c7_3471_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1071_c7_3471_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1071_c7_3471_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1071_c7_3471_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1071_c7_3471_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1071_c7_3471] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1071_c7_3471_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1071_c7_3471_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1071_c7_3471_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1071_c7_3471_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1071_c7_3471_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1071_c7_3471_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1071_c7_3471_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1071_c7_3471_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1074_c7_ad7c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1074_c7_ad7c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1074_c7_ad7c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1074_c7_ad7c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1074_c7_ad7c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1074_c7_ad7c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1074_c7_ad7c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1074_c7_ad7c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1074_c7_ad7c_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1064_c7_5be0_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1067_c7_89e1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1071_c7_3471_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1074_c7_ad7c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_89e1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1071_c7_3471_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1071_c7_3471_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1074_c7_ad7c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1071_c7_3471_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1074_c7_ad7c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_89e1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1071_c7_3471_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1067_c7_89e1_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1071_c7_3471_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1059_c2_2df0_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1067_c7_89e1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1067_c7_89e1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1067_c7_89e1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1067_c7_89e1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1067_c7_89e1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1067_c7_89e1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1067_c7_89e1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1067_c7_89e1_return_output := result_stack_value_MUX_uxn_opcodes_h_l1067_c7_89e1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1067_c7_89e1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_89e1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_89e1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_89e1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_89e1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_89e1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_89e1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_89e1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_89e1_return_output;

     -- n8_MUX[uxn_opcodes_h_l1064_c7_5be0] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1064_c7_5be0_cond <= VAR_n8_MUX_uxn_opcodes_h_l1064_c7_5be0_cond;
     n8_MUX_uxn_opcodes_h_l1064_c7_5be0_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1064_c7_5be0_iftrue;
     n8_MUX_uxn_opcodes_h_l1064_c7_5be0_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1064_c7_5be0_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1064_c7_5be0_return_output := n8_MUX_uxn_opcodes_h_l1064_c7_5be0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1071_c7_3471] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1071_c7_3471_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1071_c7_3471_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1071_c7_3471_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1071_c7_3471_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1071_c7_3471_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1071_c7_3471_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1071_c7_3471_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1071_c7_3471_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1071_c7_3471] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1071_c7_3471_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1071_c7_3471_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1071_c7_3471_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1071_c7_3471_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1071_c7_3471_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1071_c7_3471_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1071_c7_3471_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1071_c7_3471_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1067_c7_89e1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_89e1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_89e1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_89e1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_89e1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_89e1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_89e1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_89e1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_89e1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1071_c7_3471] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1071_c7_3471_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1071_c7_3471_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1071_c7_3471_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1071_c7_3471_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1071_c7_3471_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1071_c7_3471_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1071_c7_3471_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1071_c7_3471_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l1059_c2_2df0_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1064_c7_5be0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_89e1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1071_c7_3471_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1064_c7_5be0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_89e1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_89e1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1071_c7_3471_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_89e1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1071_c7_3471_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_5be0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_89e1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1064_c7_5be0_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1067_c7_89e1_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1064_c7_5be0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_5be0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_5be0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_5be0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_5be0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_5be0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_5be0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_5be0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_5be0_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1064_c7_5be0] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1064_c7_5be0_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1064_c7_5be0_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1064_c7_5be0_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1064_c7_5be0_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1064_c7_5be0_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1064_c7_5be0_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1064_c7_5be0_return_output := result_stack_value_MUX_uxn_opcodes_h_l1064_c7_5be0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1064_c7_5be0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1064_c7_5be0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1064_c7_5be0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1064_c7_5be0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1064_c7_5be0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1064_c7_5be0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1064_c7_5be0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1064_c7_5be0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1064_c7_5be0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1067_c7_89e1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_89e1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_89e1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_89e1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_89e1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_89e1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_89e1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_89e1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_89e1_return_output;

     -- n8_MUX[uxn_opcodes_h_l1059_c2_2df0] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1059_c2_2df0_cond <= VAR_n8_MUX_uxn_opcodes_h_l1059_c2_2df0_cond;
     n8_MUX_uxn_opcodes_h_l1059_c2_2df0_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1059_c2_2df0_iftrue;
     n8_MUX_uxn_opcodes_h_l1059_c2_2df0_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1059_c2_2df0_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1059_c2_2df0_return_output := n8_MUX_uxn_opcodes_h_l1059_c2_2df0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1067_c7_89e1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_89e1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_89e1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_89e1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_89e1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_89e1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_89e1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_89e1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_89e1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1067_c7_89e1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_89e1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_89e1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_89e1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_89e1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_89e1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_89e1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_89e1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_89e1_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1059_c2_2df0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_5be0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_89e1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1059_c2_2df0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1064_c7_5be0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_5be0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_89e1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_5be0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_89e1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1059_c2_2df0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_5be0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1059_c2_2df0_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1064_c7_5be0_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1059_c2_2df0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1059_c2_2df0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1059_c2_2df0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1059_c2_2df0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1059_c2_2df0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1059_c2_2df0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1059_c2_2df0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1059_c2_2df0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1059_c2_2df0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1064_c7_5be0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_5be0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_5be0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_5be0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_5be0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_5be0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_5be0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_5be0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_5be0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1064_c7_5be0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_5be0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_5be0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_5be0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_5be0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_5be0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_5be0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_5be0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_5be0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1064_c7_5be0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_5be0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_5be0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_5be0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_5be0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_5be0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_5be0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_5be0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_5be0_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1059_c2_2df0] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1059_c2_2df0_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1059_c2_2df0_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1059_c2_2df0_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1059_c2_2df0_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1059_c2_2df0_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1059_c2_2df0_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1059_c2_2df0_return_output := result_stack_value_MUX_uxn_opcodes_h_l1059_c2_2df0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1059_c2_2df0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1059_c2_2df0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1059_c2_2df0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1059_c2_2df0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1059_c2_2df0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1059_c2_2df0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1059_c2_2df0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1059_c2_2df0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1059_c2_2df0_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1059_c2_2df0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_5be0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1059_c2_2df0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_5be0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1059_c2_2df0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_5be0_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1059_c2_2df0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1059_c2_2df0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1059_c2_2df0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1059_c2_2df0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1059_c2_2df0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1059_c2_2df0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1059_c2_2df0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1059_c2_2df0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1059_c2_2df0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1059_c2_2df0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1059_c2_2df0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1059_c2_2df0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1059_c2_2df0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1059_c2_2df0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1059_c2_2df0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1059_c2_2df0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1059_c2_2df0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1059_c2_2df0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1059_c2_2df0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1059_c2_2df0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1059_c2_2df0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1059_c2_2df0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1059_c2_2df0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1059_c2_2df0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1059_c2_2df0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1059_c2_2df0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1059_c2_2df0_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l1090_l1055_DUPLICATE_b909 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l1090_l1055_DUPLICATE_b909_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_09c5(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1059_c2_2df0_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1059_c2_2df0_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1059_c2_2df0_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1059_c2_2df0_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1059_c2_2df0_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1059_c2_2df0_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l1090_l1055_DUPLICATE_b909_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l1090_l1055_DUPLICATE_b909_return_output;
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
