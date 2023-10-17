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
-- Submodules: 91
entity neq2_0CLK_c96e1a89 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end neq2_0CLK_c96e1a89;
architecture arch of neq2_0CLK_c96e1a89 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1350_c6_1c18]
signal BIN_OP_EQ_uxn_opcodes_h_l1350_c6_1c18_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1350_c6_1c18_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1350_c6_1c18_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1350_c1_297f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1350_c1_297f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1350_c1_297f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1350_c1_297f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1350_c1_297f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1350_c2_e1c7]
signal n16_MUX_uxn_opcodes_h_l1350_c2_e1c7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1350_c2_e1c7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1350_c2_e1c7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1350_c2_e1c7_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1350_c2_e1c7]
signal result_u8_value_MUX_uxn_opcodes_h_l1350_c2_e1c7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1350_c2_e1c7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1350_c2_e1c7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1350_c2_e1c7_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1350_c2_e1c7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1350_c2_e1c7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1350_c2_e1c7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1350_c2_e1c7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1350_c2_e1c7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1350_c2_e1c7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c2_e1c7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c2_e1c7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c2_e1c7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c2_e1c7_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1350_c2_e1c7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1350_c2_e1c7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1350_c2_e1c7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1350_c2_e1c7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1350_c2_e1c7_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1350_c2_e1c7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c2_e1c7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c2_e1c7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c2_e1c7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c2_e1c7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1350_c2_e1c7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c2_e1c7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c2_e1c7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c2_e1c7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c2_e1c7_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1350_c2_e1c7]
signal t16_MUX_uxn_opcodes_h_l1350_c2_e1c7_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1350_c2_e1c7_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1350_c2_e1c7_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1350_c2_e1c7_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1351_c3_3e95[uxn_opcodes_h_l1351_c3_3e95]
signal printf_uxn_opcodes_h_l1351_c3_3e95_uxn_opcodes_h_l1351_c3_3e95_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1355_c11_f7b9]
signal BIN_OP_EQ_uxn_opcodes_h_l1355_c11_f7b9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1355_c11_f7b9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1355_c11_f7b9_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1355_c7_91b7]
signal n16_MUX_uxn_opcodes_h_l1355_c7_91b7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1355_c7_91b7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1355_c7_91b7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1355_c7_91b7_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1355_c7_91b7]
signal result_u8_value_MUX_uxn_opcodes_h_l1355_c7_91b7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1355_c7_91b7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1355_c7_91b7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1355_c7_91b7_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1355_c7_91b7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1355_c7_91b7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1355_c7_91b7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1355_c7_91b7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1355_c7_91b7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1355_c7_91b7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c7_91b7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c7_91b7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c7_91b7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c7_91b7_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1355_c7_91b7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1355_c7_91b7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1355_c7_91b7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1355_c7_91b7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1355_c7_91b7_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1355_c7_91b7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c7_91b7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c7_91b7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c7_91b7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c7_91b7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1355_c7_91b7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c7_91b7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c7_91b7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c7_91b7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c7_91b7_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1355_c7_91b7]
signal t16_MUX_uxn_opcodes_h_l1355_c7_91b7_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1355_c7_91b7_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1355_c7_91b7_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1355_c7_91b7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1358_c11_35db]
signal BIN_OP_EQ_uxn_opcodes_h_l1358_c11_35db_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1358_c11_35db_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1358_c11_35db_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1358_c7_2224]
signal n16_MUX_uxn_opcodes_h_l1358_c7_2224_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1358_c7_2224_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1358_c7_2224_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1358_c7_2224_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1358_c7_2224]
signal result_u8_value_MUX_uxn_opcodes_h_l1358_c7_2224_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1358_c7_2224_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1358_c7_2224_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1358_c7_2224_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1358_c7_2224]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_2224_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_2224_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_2224_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_2224_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1358_c7_2224]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_2224_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_2224_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_2224_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_2224_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1358_c7_2224]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_2224_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_2224_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_2224_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_2224_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1358_c7_2224]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_2224_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_2224_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_2224_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_2224_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1358_c7_2224]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_2224_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_2224_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_2224_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_2224_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1358_c7_2224]
signal t16_MUX_uxn_opcodes_h_l1358_c7_2224_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1358_c7_2224_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1358_c7_2224_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1358_c7_2224_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1363_c11_da34]
signal BIN_OP_EQ_uxn_opcodes_h_l1363_c11_da34_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1363_c11_da34_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1363_c11_da34_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1363_c7_3cf7]
signal n16_MUX_uxn_opcodes_h_l1363_c7_3cf7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1363_c7_3cf7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1363_c7_3cf7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1363_c7_3cf7_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1363_c7_3cf7]
signal result_u8_value_MUX_uxn_opcodes_h_l1363_c7_3cf7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1363_c7_3cf7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1363_c7_3cf7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1363_c7_3cf7_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1363_c7_3cf7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_3cf7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_3cf7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_3cf7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_3cf7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1363_c7_3cf7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_3cf7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_3cf7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_3cf7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_3cf7_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1363_c7_3cf7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_3cf7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_3cf7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_3cf7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_3cf7_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1363_c7_3cf7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_3cf7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_3cf7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_3cf7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_3cf7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1363_c7_3cf7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_3cf7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_3cf7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_3cf7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_3cf7_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1363_c7_3cf7]
signal t16_MUX_uxn_opcodes_h_l1363_c7_3cf7_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1363_c7_3cf7_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1363_c7_3cf7_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1363_c7_3cf7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1366_c11_f377]
signal BIN_OP_EQ_uxn_opcodes_h_l1366_c11_f377_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1366_c11_f377_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1366_c11_f377_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1366_c7_5163]
signal n16_MUX_uxn_opcodes_h_l1366_c7_5163_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1366_c7_5163_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1366_c7_5163_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1366_c7_5163_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1366_c7_5163]
signal result_u8_value_MUX_uxn_opcodes_h_l1366_c7_5163_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1366_c7_5163_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1366_c7_5163_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1366_c7_5163_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1366_c7_5163]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_5163_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_5163_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_5163_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_5163_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1366_c7_5163]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_5163_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_5163_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_5163_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_5163_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1366_c7_5163]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_5163_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_5163_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_5163_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_5163_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1366_c7_5163]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_5163_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_5163_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_5163_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_5163_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1366_c7_5163]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_5163_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_5163_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_5163_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_5163_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1366_c7_5163]
signal t16_MUX_uxn_opcodes_h_l1366_c7_5163_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1366_c7_5163_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1366_c7_5163_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1366_c7_5163_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1367_c3_354f]
signal BIN_OP_OR_uxn_opcodes_h_l1367_c3_354f_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1367_c3_354f_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1367_c3_354f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1370_c11_20fb]
signal BIN_OP_EQ_uxn_opcodes_h_l1370_c11_20fb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1370_c11_20fb_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1370_c11_20fb_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1370_c7_1422]
signal n16_MUX_uxn_opcodes_h_l1370_c7_1422_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1370_c7_1422_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1370_c7_1422_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1370_c7_1422_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1370_c7_1422]
signal result_u8_value_MUX_uxn_opcodes_h_l1370_c7_1422_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1370_c7_1422_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1370_c7_1422_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1370_c7_1422_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1370_c7_1422]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_1422_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_1422_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_1422_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_1422_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1370_c7_1422]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_1422_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_1422_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_1422_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_1422_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1370_c7_1422]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_1422_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_1422_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_1422_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_1422_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1370_c7_1422]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_1422_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_1422_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_1422_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_1422_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1370_c7_1422]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_1422_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_1422_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_1422_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_1422_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1373_c11_a566]
signal BIN_OP_EQ_uxn_opcodes_h_l1373_c11_a566_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1373_c11_a566_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1373_c11_a566_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1373_c7_9cf1]
signal n16_MUX_uxn_opcodes_h_l1373_c7_9cf1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1373_c7_9cf1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1373_c7_9cf1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1373_c7_9cf1_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1373_c7_9cf1]
signal result_u8_value_MUX_uxn_opcodes_h_l1373_c7_9cf1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1373_c7_9cf1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1373_c7_9cf1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1373_c7_9cf1_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1373_c7_9cf1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_9cf1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_9cf1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_9cf1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_9cf1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1373_c7_9cf1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_9cf1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_9cf1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_9cf1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_9cf1_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1373_c7_9cf1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_9cf1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_9cf1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_9cf1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_9cf1_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1373_c7_9cf1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_9cf1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_9cf1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_9cf1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_9cf1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1373_c7_9cf1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_9cf1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_9cf1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_9cf1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_9cf1_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1378_c11_1929]
signal BIN_OP_EQ_uxn_opcodes_h_l1378_c11_1929_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1378_c11_1929_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1378_c11_1929_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1378_c7_e4b7]
signal n16_MUX_uxn_opcodes_h_l1378_c7_e4b7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1378_c7_e4b7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1378_c7_e4b7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1378_c7_e4b7_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1378_c7_e4b7]
signal result_u8_value_MUX_uxn_opcodes_h_l1378_c7_e4b7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1378_c7_e4b7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1378_c7_e4b7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1378_c7_e4b7_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1378_c7_e4b7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_e4b7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_e4b7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_e4b7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_e4b7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1378_c7_e4b7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_e4b7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_e4b7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_e4b7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_e4b7_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1378_c7_e4b7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_e4b7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_e4b7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_e4b7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_e4b7_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1378_c7_e4b7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_e4b7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_e4b7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_e4b7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_e4b7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1378_c7_e4b7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_e4b7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_e4b7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_e4b7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_e4b7_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1381_c11_b984]
signal BIN_OP_EQ_uxn_opcodes_h_l1381_c11_b984_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1381_c11_b984_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1381_c11_b984_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1381_c7_a50c]
signal n16_MUX_uxn_opcodes_h_l1381_c7_a50c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1381_c7_a50c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1381_c7_a50c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1381_c7_a50c_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1381_c7_a50c]
signal result_u8_value_MUX_uxn_opcodes_h_l1381_c7_a50c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1381_c7_a50c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1381_c7_a50c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1381_c7_a50c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1381_c7_a50c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_a50c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_a50c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_a50c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_a50c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1381_c7_a50c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_a50c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_a50c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_a50c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_a50c_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1381_c7_a50c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_a50c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_a50c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_a50c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_a50c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1381_c7_a50c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_a50c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_a50c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_a50c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_a50c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1381_c7_a50c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_a50c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_a50c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_a50c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_a50c_return_output : unsigned(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1382_c3_dd86]
signal BIN_OP_OR_uxn_opcodes_h_l1382_c3_dd86_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1382_c3_dd86_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1382_c3_dd86_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1384_c30_d480]
signal sp_relative_shift_uxn_opcodes_h_l1384_c30_d480_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1384_c30_d480_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1384_c30_d480_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1384_c30_d480_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1387_c21_56fc]
signal BIN_OP_EQ_uxn_opcodes_h_l1387_c21_56fc_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1387_c21_56fc_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1387_c21_56fc_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1387_c21_5997]
signal MUX_uxn_opcodes_h_l1387_c21_5997_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1387_c21_5997_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1387_c21_5997_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1387_c21_5997_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1389_c11_deb7]
signal BIN_OP_EQ_uxn_opcodes_h_l1389_c11_deb7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1389_c11_deb7_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1389_c11_deb7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1389_c7_9693]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_9693_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_9693_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_9693_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_9693_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1389_c7_9693]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_9693_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_9693_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_9693_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_9693_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1389_c7_9693]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_9693_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_9693_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_9693_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_9693_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1360_l1375_DUPLICATE_467f
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1360_l1375_DUPLICATE_467f_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1360_l1375_DUPLICATE_467f_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_25e8( ref_toks_0 : opcode_result_t;
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
      base.u8_value := ref_toks_1;
      base.is_opc_done := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1350_c6_1c18
BIN_OP_EQ_uxn_opcodes_h_l1350_c6_1c18 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1350_c6_1c18_left,
BIN_OP_EQ_uxn_opcodes_h_l1350_c6_1c18_right,
BIN_OP_EQ_uxn_opcodes_h_l1350_c6_1c18_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1350_c1_297f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1350_c1_297f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1350_c1_297f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1350_c1_297f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1350_c1_297f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1350_c1_297f_return_output);

-- n16_MUX_uxn_opcodes_h_l1350_c2_e1c7
n16_MUX_uxn_opcodes_h_l1350_c2_e1c7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1350_c2_e1c7_cond,
n16_MUX_uxn_opcodes_h_l1350_c2_e1c7_iftrue,
n16_MUX_uxn_opcodes_h_l1350_c2_e1c7_iffalse,
n16_MUX_uxn_opcodes_h_l1350_c2_e1c7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1350_c2_e1c7
result_u8_value_MUX_uxn_opcodes_h_l1350_c2_e1c7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1350_c2_e1c7_cond,
result_u8_value_MUX_uxn_opcodes_h_l1350_c2_e1c7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1350_c2_e1c7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1350_c2_e1c7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1350_c2_e1c7
result_is_opc_done_MUX_uxn_opcodes_h_l1350_c2_e1c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1350_c2_e1c7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1350_c2_e1c7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1350_c2_e1c7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1350_c2_e1c7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c2_e1c7
result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c2_e1c7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c2_e1c7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c2_e1c7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c2_e1c7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c2_e1c7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1350_c2_e1c7
result_is_stack_write_MUX_uxn_opcodes_h_l1350_c2_e1c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1350_c2_e1c7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1350_c2_e1c7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1350_c2_e1c7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1350_c2_e1c7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c2_e1c7
result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c2_e1c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c2_e1c7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c2_e1c7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c2_e1c7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c2_e1c7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c2_e1c7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c2_e1c7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c2_e1c7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c2_e1c7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c2_e1c7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c2_e1c7_return_output);

-- t16_MUX_uxn_opcodes_h_l1350_c2_e1c7
t16_MUX_uxn_opcodes_h_l1350_c2_e1c7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1350_c2_e1c7_cond,
t16_MUX_uxn_opcodes_h_l1350_c2_e1c7_iftrue,
t16_MUX_uxn_opcodes_h_l1350_c2_e1c7_iffalse,
t16_MUX_uxn_opcodes_h_l1350_c2_e1c7_return_output);

-- printf_uxn_opcodes_h_l1351_c3_3e95_uxn_opcodes_h_l1351_c3_3e95
printf_uxn_opcodes_h_l1351_c3_3e95_uxn_opcodes_h_l1351_c3_3e95 : entity work.printf_uxn_opcodes_h_l1351_c3_3e95_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1351_c3_3e95_uxn_opcodes_h_l1351_c3_3e95_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1355_c11_f7b9
BIN_OP_EQ_uxn_opcodes_h_l1355_c11_f7b9 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1355_c11_f7b9_left,
BIN_OP_EQ_uxn_opcodes_h_l1355_c11_f7b9_right,
BIN_OP_EQ_uxn_opcodes_h_l1355_c11_f7b9_return_output);

-- n16_MUX_uxn_opcodes_h_l1355_c7_91b7
n16_MUX_uxn_opcodes_h_l1355_c7_91b7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1355_c7_91b7_cond,
n16_MUX_uxn_opcodes_h_l1355_c7_91b7_iftrue,
n16_MUX_uxn_opcodes_h_l1355_c7_91b7_iffalse,
n16_MUX_uxn_opcodes_h_l1355_c7_91b7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1355_c7_91b7
result_u8_value_MUX_uxn_opcodes_h_l1355_c7_91b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1355_c7_91b7_cond,
result_u8_value_MUX_uxn_opcodes_h_l1355_c7_91b7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1355_c7_91b7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1355_c7_91b7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1355_c7_91b7
result_is_opc_done_MUX_uxn_opcodes_h_l1355_c7_91b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1355_c7_91b7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1355_c7_91b7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1355_c7_91b7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1355_c7_91b7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c7_91b7
result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c7_91b7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c7_91b7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c7_91b7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c7_91b7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c7_91b7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1355_c7_91b7
result_is_stack_write_MUX_uxn_opcodes_h_l1355_c7_91b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1355_c7_91b7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1355_c7_91b7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1355_c7_91b7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1355_c7_91b7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c7_91b7
result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c7_91b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c7_91b7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c7_91b7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c7_91b7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c7_91b7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c7_91b7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c7_91b7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c7_91b7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c7_91b7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c7_91b7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c7_91b7_return_output);

-- t16_MUX_uxn_opcodes_h_l1355_c7_91b7
t16_MUX_uxn_opcodes_h_l1355_c7_91b7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1355_c7_91b7_cond,
t16_MUX_uxn_opcodes_h_l1355_c7_91b7_iftrue,
t16_MUX_uxn_opcodes_h_l1355_c7_91b7_iffalse,
t16_MUX_uxn_opcodes_h_l1355_c7_91b7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1358_c11_35db
BIN_OP_EQ_uxn_opcodes_h_l1358_c11_35db : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1358_c11_35db_left,
BIN_OP_EQ_uxn_opcodes_h_l1358_c11_35db_right,
BIN_OP_EQ_uxn_opcodes_h_l1358_c11_35db_return_output);

-- n16_MUX_uxn_opcodes_h_l1358_c7_2224
n16_MUX_uxn_opcodes_h_l1358_c7_2224 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1358_c7_2224_cond,
n16_MUX_uxn_opcodes_h_l1358_c7_2224_iftrue,
n16_MUX_uxn_opcodes_h_l1358_c7_2224_iffalse,
n16_MUX_uxn_opcodes_h_l1358_c7_2224_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1358_c7_2224
result_u8_value_MUX_uxn_opcodes_h_l1358_c7_2224 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1358_c7_2224_cond,
result_u8_value_MUX_uxn_opcodes_h_l1358_c7_2224_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1358_c7_2224_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1358_c7_2224_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_2224
result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_2224 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_2224_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_2224_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_2224_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_2224_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_2224
result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_2224 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_2224_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_2224_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_2224_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_2224_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_2224
result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_2224 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_2224_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_2224_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_2224_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_2224_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_2224
result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_2224 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_2224_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_2224_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_2224_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_2224_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_2224
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_2224 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_2224_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_2224_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_2224_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_2224_return_output);

-- t16_MUX_uxn_opcodes_h_l1358_c7_2224
t16_MUX_uxn_opcodes_h_l1358_c7_2224 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1358_c7_2224_cond,
t16_MUX_uxn_opcodes_h_l1358_c7_2224_iftrue,
t16_MUX_uxn_opcodes_h_l1358_c7_2224_iffalse,
t16_MUX_uxn_opcodes_h_l1358_c7_2224_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1363_c11_da34
BIN_OP_EQ_uxn_opcodes_h_l1363_c11_da34 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1363_c11_da34_left,
BIN_OP_EQ_uxn_opcodes_h_l1363_c11_da34_right,
BIN_OP_EQ_uxn_opcodes_h_l1363_c11_da34_return_output);

-- n16_MUX_uxn_opcodes_h_l1363_c7_3cf7
n16_MUX_uxn_opcodes_h_l1363_c7_3cf7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1363_c7_3cf7_cond,
n16_MUX_uxn_opcodes_h_l1363_c7_3cf7_iftrue,
n16_MUX_uxn_opcodes_h_l1363_c7_3cf7_iffalse,
n16_MUX_uxn_opcodes_h_l1363_c7_3cf7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1363_c7_3cf7
result_u8_value_MUX_uxn_opcodes_h_l1363_c7_3cf7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1363_c7_3cf7_cond,
result_u8_value_MUX_uxn_opcodes_h_l1363_c7_3cf7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1363_c7_3cf7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1363_c7_3cf7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_3cf7
result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_3cf7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_3cf7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_3cf7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_3cf7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_3cf7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_3cf7
result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_3cf7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_3cf7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_3cf7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_3cf7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_3cf7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_3cf7
result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_3cf7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_3cf7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_3cf7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_3cf7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_3cf7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_3cf7
result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_3cf7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_3cf7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_3cf7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_3cf7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_3cf7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_3cf7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_3cf7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_3cf7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_3cf7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_3cf7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_3cf7_return_output);

-- t16_MUX_uxn_opcodes_h_l1363_c7_3cf7
t16_MUX_uxn_opcodes_h_l1363_c7_3cf7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1363_c7_3cf7_cond,
t16_MUX_uxn_opcodes_h_l1363_c7_3cf7_iftrue,
t16_MUX_uxn_opcodes_h_l1363_c7_3cf7_iffalse,
t16_MUX_uxn_opcodes_h_l1363_c7_3cf7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1366_c11_f377
BIN_OP_EQ_uxn_opcodes_h_l1366_c11_f377 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1366_c11_f377_left,
BIN_OP_EQ_uxn_opcodes_h_l1366_c11_f377_right,
BIN_OP_EQ_uxn_opcodes_h_l1366_c11_f377_return_output);

-- n16_MUX_uxn_opcodes_h_l1366_c7_5163
n16_MUX_uxn_opcodes_h_l1366_c7_5163 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1366_c7_5163_cond,
n16_MUX_uxn_opcodes_h_l1366_c7_5163_iftrue,
n16_MUX_uxn_opcodes_h_l1366_c7_5163_iffalse,
n16_MUX_uxn_opcodes_h_l1366_c7_5163_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1366_c7_5163
result_u8_value_MUX_uxn_opcodes_h_l1366_c7_5163 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1366_c7_5163_cond,
result_u8_value_MUX_uxn_opcodes_h_l1366_c7_5163_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1366_c7_5163_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1366_c7_5163_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_5163
result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_5163 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_5163_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_5163_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_5163_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_5163_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_5163
result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_5163 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_5163_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_5163_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_5163_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_5163_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_5163
result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_5163 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_5163_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_5163_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_5163_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_5163_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_5163
result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_5163 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_5163_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_5163_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_5163_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_5163_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_5163
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_5163 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_5163_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_5163_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_5163_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_5163_return_output);

-- t16_MUX_uxn_opcodes_h_l1366_c7_5163
t16_MUX_uxn_opcodes_h_l1366_c7_5163 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1366_c7_5163_cond,
t16_MUX_uxn_opcodes_h_l1366_c7_5163_iftrue,
t16_MUX_uxn_opcodes_h_l1366_c7_5163_iffalse,
t16_MUX_uxn_opcodes_h_l1366_c7_5163_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1367_c3_354f
BIN_OP_OR_uxn_opcodes_h_l1367_c3_354f : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1367_c3_354f_left,
BIN_OP_OR_uxn_opcodes_h_l1367_c3_354f_right,
BIN_OP_OR_uxn_opcodes_h_l1367_c3_354f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1370_c11_20fb
BIN_OP_EQ_uxn_opcodes_h_l1370_c11_20fb : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1370_c11_20fb_left,
BIN_OP_EQ_uxn_opcodes_h_l1370_c11_20fb_right,
BIN_OP_EQ_uxn_opcodes_h_l1370_c11_20fb_return_output);

-- n16_MUX_uxn_opcodes_h_l1370_c7_1422
n16_MUX_uxn_opcodes_h_l1370_c7_1422 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1370_c7_1422_cond,
n16_MUX_uxn_opcodes_h_l1370_c7_1422_iftrue,
n16_MUX_uxn_opcodes_h_l1370_c7_1422_iffalse,
n16_MUX_uxn_opcodes_h_l1370_c7_1422_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1370_c7_1422
result_u8_value_MUX_uxn_opcodes_h_l1370_c7_1422 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1370_c7_1422_cond,
result_u8_value_MUX_uxn_opcodes_h_l1370_c7_1422_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1370_c7_1422_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1370_c7_1422_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_1422
result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_1422 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_1422_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_1422_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_1422_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_1422_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_1422
result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_1422 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_1422_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_1422_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_1422_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_1422_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_1422
result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_1422 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_1422_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_1422_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_1422_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_1422_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_1422
result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_1422 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_1422_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_1422_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_1422_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_1422_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_1422
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_1422 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_1422_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_1422_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_1422_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_1422_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1373_c11_a566
BIN_OP_EQ_uxn_opcodes_h_l1373_c11_a566 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1373_c11_a566_left,
BIN_OP_EQ_uxn_opcodes_h_l1373_c11_a566_right,
BIN_OP_EQ_uxn_opcodes_h_l1373_c11_a566_return_output);

-- n16_MUX_uxn_opcodes_h_l1373_c7_9cf1
n16_MUX_uxn_opcodes_h_l1373_c7_9cf1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1373_c7_9cf1_cond,
n16_MUX_uxn_opcodes_h_l1373_c7_9cf1_iftrue,
n16_MUX_uxn_opcodes_h_l1373_c7_9cf1_iffalse,
n16_MUX_uxn_opcodes_h_l1373_c7_9cf1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1373_c7_9cf1
result_u8_value_MUX_uxn_opcodes_h_l1373_c7_9cf1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1373_c7_9cf1_cond,
result_u8_value_MUX_uxn_opcodes_h_l1373_c7_9cf1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1373_c7_9cf1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1373_c7_9cf1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_9cf1
result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_9cf1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_9cf1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_9cf1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_9cf1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_9cf1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_9cf1
result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_9cf1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_9cf1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_9cf1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_9cf1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_9cf1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_9cf1
result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_9cf1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_9cf1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_9cf1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_9cf1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_9cf1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_9cf1
result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_9cf1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_9cf1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_9cf1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_9cf1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_9cf1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_9cf1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_9cf1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_9cf1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_9cf1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_9cf1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_9cf1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1378_c11_1929
BIN_OP_EQ_uxn_opcodes_h_l1378_c11_1929 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1378_c11_1929_left,
BIN_OP_EQ_uxn_opcodes_h_l1378_c11_1929_right,
BIN_OP_EQ_uxn_opcodes_h_l1378_c11_1929_return_output);

-- n16_MUX_uxn_opcodes_h_l1378_c7_e4b7
n16_MUX_uxn_opcodes_h_l1378_c7_e4b7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1378_c7_e4b7_cond,
n16_MUX_uxn_opcodes_h_l1378_c7_e4b7_iftrue,
n16_MUX_uxn_opcodes_h_l1378_c7_e4b7_iffalse,
n16_MUX_uxn_opcodes_h_l1378_c7_e4b7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1378_c7_e4b7
result_u8_value_MUX_uxn_opcodes_h_l1378_c7_e4b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1378_c7_e4b7_cond,
result_u8_value_MUX_uxn_opcodes_h_l1378_c7_e4b7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1378_c7_e4b7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1378_c7_e4b7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_e4b7
result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_e4b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_e4b7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_e4b7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_e4b7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_e4b7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_e4b7
result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_e4b7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_e4b7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_e4b7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_e4b7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_e4b7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_e4b7
result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_e4b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_e4b7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_e4b7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_e4b7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_e4b7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_e4b7
result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_e4b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_e4b7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_e4b7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_e4b7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_e4b7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_e4b7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_e4b7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_e4b7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_e4b7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_e4b7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_e4b7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1381_c11_b984
BIN_OP_EQ_uxn_opcodes_h_l1381_c11_b984 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1381_c11_b984_left,
BIN_OP_EQ_uxn_opcodes_h_l1381_c11_b984_right,
BIN_OP_EQ_uxn_opcodes_h_l1381_c11_b984_return_output);

-- n16_MUX_uxn_opcodes_h_l1381_c7_a50c
n16_MUX_uxn_opcodes_h_l1381_c7_a50c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1381_c7_a50c_cond,
n16_MUX_uxn_opcodes_h_l1381_c7_a50c_iftrue,
n16_MUX_uxn_opcodes_h_l1381_c7_a50c_iffalse,
n16_MUX_uxn_opcodes_h_l1381_c7_a50c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1381_c7_a50c
result_u8_value_MUX_uxn_opcodes_h_l1381_c7_a50c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1381_c7_a50c_cond,
result_u8_value_MUX_uxn_opcodes_h_l1381_c7_a50c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1381_c7_a50c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1381_c7_a50c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_a50c
result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_a50c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_a50c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_a50c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_a50c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_a50c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_a50c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_a50c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_a50c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_a50c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_a50c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_a50c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_a50c
result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_a50c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_a50c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_a50c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_a50c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_a50c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_a50c
result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_a50c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_a50c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_a50c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_a50c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_a50c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_a50c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_a50c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_a50c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_a50c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_a50c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_a50c_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1382_c3_dd86
BIN_OP_OR_uxn_opcodes_h_l1382_c3_dd86 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1382_c3_dd86_left,
BIN_OP_OR_uxn_opcodes_h_l1382_c3_dd86_right,
BIN_OP_OR_uxn_opcodes_h_l1382_c3_dd86_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1384_c30_d480
sp_relative_shift_uxn_opcodes_h_l1384_c30_d480 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1384_c30_d480_ins,
sp_relative_shift_uxn_opcodes_h_l1384_c30_d480_x,
sp_relative_shift_uxn_opcodes_h_l1384_c30_d480_y,
sp_relative_shift_uxn_opcodes_h_l1384_c30_d480_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1387_c21_56fc
BIN_OP_EQ_uxn_opcodes_h_l1387_c21_56fc : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1387_c21_56fc_left,
BIN_OP_EQ_uxn_opcodes_h_l1387_c21_56fc_right,
BIN_OP_EQ_uxn_opcodes_h_l1387_c21_56fc_return_output);

-- MUX_uxn_opcodes_h_l1387_c21_5997
MUX_uxn_opcodes_h_l1387_c21_5997 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1387_c21_5997_cond,
MUX_uxn_opcodes_h_l1387_c21_5997_iftrue,
MUX_uxn_opcodes_h_l1387_c21_5997_iffalse,
MUX_uxn_opcodes_h_l1387_c21_5997_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1389_c11_deb7
BIN_OP_EQ_uxn_opcodes_h_l1389_c11_deb7 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1389_c11_deb7_left,
BIN_OP_EQ_uxn_opcodes_h_l1389_c11_deb7_right,
BIN_OP_EQ_uxn_opcodes_h_l1389_c11_deb7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_9693
result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_9693 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_9693_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_9693_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_9693_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_9693_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_9693
result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_9693 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_9693_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_9693_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_9693_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_9693_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_9693
result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_9693 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_9693_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_9693_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_9693_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_9693_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1360_l1375_DUPLICATE_467f
CONST_SL_8_uint16_t_uxn_opcodes_h_l1360_l1375_DUPLICATE_467f : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1360_l1375_DUPLICATE_467f_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1360_l1375_DUPLICATE_467f_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1350_c6_1c18_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1350_c1_297f_return_output,
 n16_MUX_uxn_opcodes_h_l1350_c2_e1c7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1350_c2_e1c7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1350_c2_e1c7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c2_e1c7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1350_c2_e1c7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c2_e1c7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c2_e1c7_return_output,
 t16_MUX_uxn_opcodes_h_l1350_c2_e1c7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1355_c11_f7b9_return_output,
 n16_MUX_uxn_opcodes_h_l1355_c7_91b7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1355_c7_91b7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1355_c7_91b7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c7_91b7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1355_c7_91b7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c7_91b7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c7_91b7_return_output,
 t16_MUX_uxn_opcodes_h_l1355_c7_91b7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1358_c11_35db_return_output,
 n16_MUX_uxn_opcodes_h_l1358_c7_2224_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1358_c7_2224_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_2224_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_2224_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_2224_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_2224_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_2224_return_output,
 t16_MUX_uxn_opcodes_h_l1358_c7_2224_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1363_c11_da34_return_output,
 n16_MUX_uxn_opcodes_h_l1363_c7_3cf7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1363_c7_3cf7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_3cf7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_3cf7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_3cf7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_3cf7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_3cf7_return_output,
 t16_MUX_uxn_opcodes_h_l1363_c7_3cf7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1366_c11_f377_return_output,
 n16_MUX_uxn_opcodes_h_l1366_c7_5163_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1366_c7_5163_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_5163_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_5163_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_5163_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_5163_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_5163_return_output,
 t16_MUX_uxn_opcodes_h_l1366_c7_5163_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1367_c3_354f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1370_c11_20fb_return_output,
 n16_MUX_uxn_opcodes_h_l1370_c7_1422_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1370_c7_1422_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_1422_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_1422_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_1422_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_1422_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_1422_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1373_c11_a566_return_output,
 n16_MUX_uxn_opcodes_h_l1373_c7_9cf1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1373_c7_9cf1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_9cf1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_9cf1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_9cf1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_9cf1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_9cf1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1378_c11_1929_return_output,
 n16_MUX_uxn_opcodes_h_l1378_c7_e4b7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1378_c7_e4b7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_e4b7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_e4b7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_e4b7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_e4b7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_e4b7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1381_c11_b984_return_output,
 n16_MUX_uxn_opcodes_h_l1381_c7_a50c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1381_c7_a50c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_a50c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_a50c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_a50c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_a50c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_a50c_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1382_c3_dd86_return_output,
 sp_relative_shift_uxn_opcodes_h_l1384_c30_d480_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1387_c21_56fc_return_output,
 MUX_uxn_opcodes_h_l1387_c21_5997_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1389_c11_deb7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_9693_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_9693_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_9693_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1360_l1375_DUPLICATE_467f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1350_c6_1c18_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1350_c6_1c18_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1350_c6_1c18_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1350_c1_297f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1350_c1_297f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1350_c1_297f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1350_c1_297f_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1350_c2_e1c7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1350_c2_e1c7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1355_c7_91b7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1350_c2_e1c7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1350_c2_e1c7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1350_c2_e1c7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1350_c2_e1c7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1355_c7_91b7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1350_c2_e1c7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1350_c2_e1c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1350_c2_e1c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1350_c2_e1c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1355_c7_91b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1350_c2_e1c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1350_c2_e1c7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c2_e1c7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c2_e1c7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c7_91b7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c2_e1c7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c2_e1c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1350_c2_e1c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1350_c2_e1c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1355_c7_91b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1350_c2_e1c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1350_c2_e1c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c2_e1c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c2_e1c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c7_91b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c2_e1c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c2_e1c7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c2_e1c7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1352_c3_bcb9 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c2_e1c7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c7_91b7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c2_e1c7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c2_e1c7_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1350_c2_e1c7_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1350_c2_e1c7_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1355_c7_91b7_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1350_c2_e1c7_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1350_c2_e1c7_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1351_c3_3e95_uxn_opcodes_h_l1351_c3_3e95_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1355_c11_f7b9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1355_c11_f7b9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1355_c11_f7b9_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1355_c7_91b7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1355_c7_91b7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1358_c7_2224_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1355_c7_91b7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1355_c7_91b7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1355_c7_91b7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1358_c7_2224_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1355_c7_91b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1355_c7_91b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1355_c7_91b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_2224_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1355_c7_91b7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c7_91b7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c7_91b7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_2224_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c7_91b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1355_c7_91b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1355_c7_91b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_2224_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1355_c7_91b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c7_91b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c7_91b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_2224_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c7_91b7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c7_91b7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1356_c3_a7ff : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c7_91b7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_2224_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c7_91b7_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1355_c7_91b7_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1355_c7_91b7_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1358_c7_2224_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1355_c7_91b7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_35db_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_35db_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_35db_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1358_c7_2224_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1358_c7_2224_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1363_c7_3cf7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1358_c7_2224_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1358_c7_2224_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1358_c7_2224_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1363_c7_3cf7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1358_c7_2224_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_2224_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_2224_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_3cf7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_2224_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_2224_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_2224_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_3cf7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_2224_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_2224_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_2224_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_3cf7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_2224_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_2224_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_2224_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_3cf7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_2224_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_2224_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1361_c3_d0cc : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_2224_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_3cf7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_2224_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1358_c7_2224_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1358_c7_2224_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1363_c7_3cf7_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1358_c7_2224_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1363_c11_da34_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1363_c11_da34_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1363_c11_da34_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1363_c7_3cf7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1363_c7_3cf7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1366_c7_5163_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1363_c7_3cf7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1363_c7_3cf7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1363_c7_3cf7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1366_c7_5163_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1363_c7_3cf7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_3cf7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_3cf7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_5163_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_3cf7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_3cf7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_3cf7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_5163_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_3cf7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_3cf7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_3cf7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_5163_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_3cf7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_3cf7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_3cf7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_5163_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_3cf7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_3cf7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1364_c3_4121 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_3cf7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_5163_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_3cf7_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1363_c7_3cf7_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1363_c7_3cf7_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1366_c7_5163_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1363_c7_3cf7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1366_c11_f377_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1366_c11_f377_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1366_c11_f377_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1366_c7_5163_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1366_c7_5163_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1370_c7_1422_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1366_c7_5163_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1366_c7_5163_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1366_c7_5163_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1370_c7_1422_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1366_c7_5163_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_5163_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_5163_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_1422_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_5163_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_5163_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_5163_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_1422_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_5163_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_5163_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_5163_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_1422_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_5163_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_5163_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_5163_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_1422_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_5163_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_5163_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1368_c3_792b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_5163_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_1422_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_5163_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1366_c7_5163_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1366_c7_5163_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1366_c7_5163_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1367_c3_354f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1367_c3_354f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1367_c3_354f_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1370_c11_20fb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1370_c11_20fb_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1370_c11_20fb_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1370_c7_1422_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1370_c7_1422_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1373_c7_9cf1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1370_c7_1422_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1370_c7_1422_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1370_c7_1422_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1373_c7_9cf1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1370_c7_1422_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_1422_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_1422_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_9cf1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_1422_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_1422_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_1422_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_9cf1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_1422_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_1422_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_1422_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_9cf1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_1422_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_1422_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_1422_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_9cf1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_1422_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_1422_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1371_c3_22b2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_1422_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_9cf1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_1422_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_a566_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_a566_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_a566_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1373_c7_9cf1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1373_c7_9cf1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1378_c7_e4b7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1373_c7_9cf1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1373_c7_9cf1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1373_c7_9cf1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1378_c7_e4b7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1373_c7_9cf1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_9cf1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_9cf1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_e4b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_9cf1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_9cf1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_9cf1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_e4b7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_9cf1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_9cf1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_9cf1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_e4b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_9cf1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_9cf1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_9cf1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_e4b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_9cf1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_9cf1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1376_c3_75f7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_9cf1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_e4b7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_9cf1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_1929_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_1929_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_1929_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1378_c7_e4b7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1378_c7_e4b7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1381_c7_a50c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1378_c7_e4b7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1378_c7_e4b7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1378_c7_e4b7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1381_c7_a50c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1378_c7_e4b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_e4b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_e4b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_a50c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_e4b7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_e4b7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_e4b7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_a50c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_e4b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_e4b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_e4b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_a50c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_e4b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_e4b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_e4b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_a50c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_e4b7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_e4b7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1379_c3_a7f3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_e4b7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_a50c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_e4b7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_b984_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_b984_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_b984_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1381_c7_a50c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1381_c7_a50c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1381_c7_a50c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1381_c7_a50c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1381_c7_a50c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1381_c7_a50c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_a50c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_a50c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_9693_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_a50c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_a50c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_a50c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_a50c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_a50c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_a50c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_9693_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_a50c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_a50c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_a50c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_9693_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_a50c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_a50c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1386_c3_e0b7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_a50c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1381_c7_a50c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_a50c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1382_c3_dd86_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1382_c3_dd86_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1382_c3_dd86_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1384_c30_d480_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1384_c30_d480_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1384_c30_d480_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1384_c30_d480_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1387_c21_5997_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1387_c21_5997_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1387_c21_5997_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1387_c21_56fc_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1387_c21_56fc_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1387_c21_56fc_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1387_c21_5997_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1389_c11_deb7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1389_c11_deb7_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1389_c11_deb7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_9693_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_9693_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_9693_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_9693_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_9693_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_9693_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_9693_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_9693_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_9693_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1366_l1363_l1358_l1381_l1355_l1378_l1350_l1373_l1370_DUPLICATE_1f5d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1366_l1363_l1358_l1381_l1355_l1378_l1350_l1373_l1370_DUPLICATE_fbd3_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1366_l1363_l1389_l1358_l1355_l1378_l1350_l1373_l1370_DUPLICATE_760a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1366_l1363_l1389_l1358_l1355_l1378_l1350_l1373_l1370_DUPLICATE_11b7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1366_l1363_l1389_l1358_l1381_l1355_l1378_l1373_l1370_DUPLICATE_f20a_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1359_l1367_l1374_l1382_DUPLICATE_6576_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1360_l1375_DUPLICATE_467f_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1360_l1375_DUPLICATE_467f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l1346_l1395_DUPLICATE_e354_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_a566_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1389_c11_deb7_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1355_c11_f7b9_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1352_c3_bcb9 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c2_e1c7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1352_c3_bcb9;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1366_c11_f377_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1350_c6_1c18_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_9693_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1368_c3_792b := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_5163_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1368_c3_792b;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1361_c3_d0cc := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_2224_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1361_c3_d0cc;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_a50c_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1387_c21_5997_iffalse := resize(to_unsigned(1, 1), 8);
     VAR_MUX_uxn_opcodes_h_l1387_c21_5997_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1379_c3_a7f3 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_e4b7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1379_c3_a7f3;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_9693_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1350_c1_297f_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1376_c3_75f7 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_9cf1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1376_c3_75f7;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1370_c11_20fb_right := to_unsigned(5, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_9693_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1384_c30_d480_y := resize(to_signed(-3, 3), 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1350_c2_e1c7_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1356_c3_a7ff := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c7_91b7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1356_c3_a7ff;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_a50c_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1364_c3_4121 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_3cf7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1364_c3_4121;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_1929_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_35db_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1386_c3_e0b7 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_a50c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1386_c3_e0b7;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1371_c3_22b2 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_1422_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1371_c3_22b2;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1363_c11_da34_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_b984_right := to_unsigned(8, 4);
     VAR_sp_relative_shift_uxn_opcodes_h_l1384_c30_d480_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1350_c1_297f_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1384_c30_d480_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1382_c3_dd86_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1350_c2_e1c7_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1355_c7_91b7_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1358_c7_2224_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1363_c7_3cf7_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1366_c7_5163_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1370_c7_1422_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1378_c7_e4b7_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1381_c7_a50c_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1350_c6_1c18_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1355_c11_f7b9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_35db_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1363_c11_da34_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1366_c11_f377_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1370_c11_20fb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_a566_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_1929_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_b984_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1389_c11_deb7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1387_c21_56fc_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1367_c3_354f_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1350_c2_e1c7_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1355_c7_91b7_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1363_c7_3cf7_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1366_c7_5163_iffalse := t16;
     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1366_l1363_l1358_l1381_l1355_l1378_l1350_l1373_l1370_DUPLICATE_1f5d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1366_l1363_l1358_l1381_l1355_l1378_l1350_l1373_l1370_DUPLICATE_1f5d_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1366_l1363_l1389_l1358_l1381_l1355_l1378_l1373_l1370_DUPLICATE_f20a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1366_l1363_l1389_l1358_l1381_l1355_l1378_l1373_l1370_DUPLICATE_f20a_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1358_c11_35db] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1358_c11_35db_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_35db_left;
     BIN_OP_EQ_uxn_opcodes_h_l1358_c11_35db_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_35db_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_35db_return_output := BIN_OP_EQ_uxn_opcodes_h_l1358_c11_35db_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1381_c11_b984] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1381_c11_b984_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_b984_left;
     BIN_OP_EQ_uxn_opcodes_h_l1381_c11_b984_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_b984_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_b984_return_output := BIN_OP_EQ_uxn_opcodes_h_l1381_c11_b984_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1389_c11_deb7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1389_c11_deb7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1389_c11_deb7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1389_c11_deb7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1389_c11_deb7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1389_c11_deb7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1389_c11_deb7_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1366_l1363_l1358_l1381_l1355_l1378_l1350_l1373_l1370_DUPLICATE_fbd3 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1366_l1363_l1358_l1381_l1355_l1378_l1350_l1373_l1370_DUPLICATE_fbd3_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1373_c11_a566] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1373_c11_a566_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_a566_left;
     BIN_OP_EQ_uxn_opcodes_h_l1373_c11_a566_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_a566_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_a566_return_output := BIN_OP_EQ_uxn_opcodes_h_l1373_c11_a566_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1378_c11_1929] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1378_c11_1929_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_1929_left;
     BIN_OP_EQ_uxn_opcodes_h_l1378_c11_1929_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_1929_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_1929_return_output := BIN_OP_EQ_uxn_opcodes_h_l1378_c11_1929_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1366_l1363_l1389_l1358_l1355_l1378_l1350_l1373_l1370_DUPLICATE_760a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1366_l1363_l1389_l1358_l1355_l1378_l1350_l1373_l1370_DUPLICATE_760a_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1366_c11_f377] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1366_c11_f377_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1366_c11_f377_left;
     BIN_OP_EQ_uxn_opcodes_h_l1366_c11_f377_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1366_c11_f377_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1366_c11_f377_return_output := BIN_OP_EQ_uxn_opcodes_h_l1366_c11_f377_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1350_c6_1c18] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1350_c6_1c18_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1350_c6_1c18_left;
     BIN_OP_EQ_uxn_opcodes_h_l1350_c6_1c18_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1350_c6_1c18_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1350_c6_1c18_return_output := BIN_OP_EQ_uxn_opcodes_h_l1350_c6_1c18_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1363_c11_da34] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1363_c11_da34_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1363_c11_da34_left;
     BIN_OP_EQ_uxn_opcodes_h_l1363_c11_da34_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1363_c11_da34_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1363_c11_da34_return_output := BIN_OP_EQ_uxn_opcodes_h_l1363_c11_da34_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1370_c11_20fb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1370_c11_20fb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1370_c11_20fb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1370_c11_20fb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1370_c11_20fb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1370_c11_20fb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1370_c11_20fb_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1381_c7_a50c] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1381_c7_a50c_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1355_c11_f7b9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1355_c11_f7b9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1355_c11_f7b9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1355_c11_f7b9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1355_c11_f7b9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1355_c11_f7b9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1355_c11_f7b9_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1384_c30_d480] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1384_c30_d480_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1384_c30_d480_ins;
     sp_relative_shift_uxn_opcodes_h_l1384_c30_d480_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1384_c30_d480_x;
     sp_relative_shift_uxn_opcodes_h_l1384_c30_d480_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1384_c30_d480_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1384_c30_d480_return_output := sp_relative_shift_uxn_opcodes_h_l1384_c30_d480_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1366_l1363_l1389_l1358_l1355_l1378_l1350_l1373_l1370_DUPLICATE_11b7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1366_l1363_l1389_l1358_l1355_l1378_l1350_l1373_l1370_DUPLICATE_11b7_return_output := result.is_sp_shift;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1359_l1367_l1374_l1382_DUPLICATE_6576 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1359_l1367_l1374_l1382_DUPLICATE_6576_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1350_c1_297f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1350_c6_1c18_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1350_c2_e1c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1350_c6_1c18_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1350_c2_e1c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1350_c6_1c18_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c2_e1c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1350_c6_1c18_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1350_c2_e1c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1350_c6_1c18_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c2_e1c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1350_c6_1c18_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c2_e1c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1350_c6_1c18_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1350_c2_e1c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1350_c6_1c18_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1350_c2_e1c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1350_c6_1c18_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1355_c7_91b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1355_c11_f7b9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1355_c7_91b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1355_c11_f7b9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c7_91b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1355_c11_f7b9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1355_c7_91b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1355_c11_f7b9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c7_91b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1355_c11_f7b9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c7_91b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1355_c11_f7b9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1355_c7_91b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1355_c11_f7b9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1355_c7_91b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1355_c11_f7b9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1358_c7_2224_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_35db_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_2224_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_35db_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_2224_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_35db_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_2224_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_35db_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_2224_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_35db_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_2224_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_35db_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1358_c7_2224_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_35db_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1358_c7_2224_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_35db_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1363_c7_3cf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1363_c11_da34_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_3cf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1363_c11_da34_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_3cf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1363_c11_da34_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_3cf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1363_c11_da34_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_3cf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1363_c11_da34_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_3cf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1363_c11_da34_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1363_c7_3cf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1363_c11_da34_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1363_c7_3cf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1363_c11_da34_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1366_c7_5163_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1366_c11_f377_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_5163_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1366_c11_f377_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_5163_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1366_c11_f377_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_5163_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1366_c11_f377_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_5163_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1366_c11_f377_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_5163_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1366_c11_f377_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1366_c7_5163_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1366_c11_f377_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1366_c7_5163_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1366_c11_f377_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1370_c7_1422_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1370_c11_20fb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_1422_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1370_c11_20fb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_1422_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1370_c11_20fb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_1422_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1370_c11_20fb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_1422_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1370_c11_20fb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_1422_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1370_c11_20fb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1370_c7_1422_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1370_c11_20fb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1373_c7_9cf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_a566_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_9cf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_a566_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_9cf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_a566_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_9cf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_a566_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_9cf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_a566_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_9cf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_a566_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1373_c7_9cf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_a566_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1378_c7_e4b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_1929_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_e4b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_1929_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_e4b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_1929_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_e4b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_1929_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_e4b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_1929_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_e4b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_1929_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1378_c7_e4b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_1929_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1381_c7_a50c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_b984_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_a50c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_b984_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_a50c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_b984_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_a50c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_b984_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_a50c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_b984_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_a50c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_b984_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1381_c7_a50c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_b984_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_9693_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1389_c11_deb7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_9693_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1389_c11_deb7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_9693_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1389_c11_deb7_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1367_c3_354f_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1359_l1367_l1374_l1382_DUPLICATE_6576_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1382_c3_dd86_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1359_l1367_l1374_l1382_DUPLICATE_6576_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1360_l1375_DUPLICATE_467f_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1359_l1367_l1374_l1382_DUPLICATE_6576_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c2_e1c7_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1366_l1363_l1358_l1381_l1355_l1378_l1350_l1373_l1370_DUPLICATE_fbd3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c7_91b7_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1366_l1363_l1358_l1381_l1355_l1378_l1350_l1373_l1370_DUPLICATE_fbd3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_2224_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1366_l1363_l1358_l1381_l1355_l1378_l1350_l1373_l1370_DUPLICATE_fbd3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_3cf7_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1366_l1363_l1358_l1381_l1355_l1378_l1350_l1373_l1370_DUPLICATE_fbd3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_5163_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1366_l1363_l1358_l1381_l1355_l1378_l1350_l1373_l1370_DUPLICATE_fbd3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_1422_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1366_l1363_l1358_l1381_l1355_l1378_l1350_l1373_l1370_DUPLICATE_fbd3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_9cf1_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1366_l1363_l1358_l1381_l1355_l1378_l1350_l1373_l1370_DUPLICATE_fbd3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_e4b7_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1366_l1363_l1358_l1381_l1355_l1378_l1350_l1373_l1370_DUPLICATE_fbd3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_a50c_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1366_l1363_l1358_l1381_l1355_l1378_l1350_l1373_l1370_DUPLICATE_fbd3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1355_c7_91b7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1366_l1363_l1389_l1358_l1381_l1355_l1378_l1373_l1370_DUPLICATE_f20a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_2224_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1366_l1363_l1389_l1358_l1381_l1355_l1378_l1373_l1370_DUPLICATE_f20a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_3cf7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1366_l1363_l1389_l1358_l1381_l1355_l1378_l1373_l1370_DUPLICATE_f20a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_5163_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1366_l1363_l1389_l1358_l1381_l1355_l1378_l1373_l1370_DUPLICATE_f20a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_1422_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1366_l1363_l1389_l1358_l1381_l1355_l1378_l1373_l1370_DUPLICATE_f20a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_9cf1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1366_l1363_l1389_l1358_l1381_l1355_l1378_l1373_l1370_DUPLICATE_f20a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_e4b7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1366_l1363_l1389_l1358_l1381_l1355_l1378_l1373_l1370_DUPLICATE_f20a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_a50c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1366_l1363_l1389_l1358_l1381_l1355_l1378_l1373_l1370_DUPLICATE_f20a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_9693_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1366_l1363_l1389_l1358_l1381_l1355_l1378_l1373_l1370_DUPLICATE_f20a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c2_e1c7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1366_l1363_l1389_l1358_l1355_l1378_l1350_l1373_l1370_DUPLICATE_11b7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c7_91b7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1366_l1363_l1389_l1358_l1355_l1378_l1350_l1373_l1370_DUPLICATE_11b7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_2224_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1366_l1363_l1389_l1358_l1355_l1378_l1350_l1373_l1370_DUPLICATE_11b7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_3cf7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1366_l1363_l1389_l1358_l1355_l1378_l1350_l1373_l1370_DUPLICATE_11b7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_5163_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1366_l1363_l1389_l1358_l1355_l1378_l1350_l1373_l1370_DUPLICATE_11b7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_1422_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1366_l1363_l1389_l1358_l1355_l1378_l1350_l1373_l1370_DUPLICATE_11b7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_9cf1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1366_l1363_l1389_l1358_l1355_l1378_l1350_l1373_l1370_DUPLICATE_11b7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_e4b7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1366_l1363_l1389_l1358_l1355_l1378_l1350_l1373_l1370_DUPLICATE_11b7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_9693_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1366_l1363_l1389_l1358_l1355_l1378_l1350_l1373_l1370_DUPLICATE_11b7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1350_c2_e1c7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1366_l1363_l1389_l1358_l1355_l1378_l1350_l1373_l1370_DUPLICATE_760a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1355_c7_91b7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1366_l1363_l1389_l1358_l1355_l1378_l1350_l1373_l1370_DUPLICATE_760a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_2224_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1366_l1363_l1389_l1358_l1355_l1378_l1350_l1373_l1370_DUPLICATE_760a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_3cf7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1366_l1363_l1389_l1358_l1355_l1378_l1350_l1373_l1370_DUPLICATE_760a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_5163_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1366_l1363_l1389_l1358_l1355_l1378_l1350_l1373_l1370_DUPLICATE_760a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_1422_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1366_l1363_l1389_l1358_l1355_l1378_l1350_l1373_l1370_DUPLICATE_760a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_9cf1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1366_l1363_l1389_l1358_l1355_l1378_l1350_l1373_l1370_DUPLICATE_760a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_e4b7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1366_l1363_l1389_l1358_l1355_l1378_l1350_l1373_l1370_DUPLICATE_760a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_9693_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1366_l1363_l1389_l1358_l1355_l1378_l1350_l1373_l1370_DUPLICATE_760a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1350_c2_e1c7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1366_l1363_l1358_l1381_l1355_l1378_l1350_l1373_l1370_DUPLICATE_1f5d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1355_c7_91b7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1366_l1363_l1358_l1381_l1355_l1378_l1350_l1373_l1370_DUPLICATE_1f5d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1358_c7_2224_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1366_l1363_l1358_l1381_l1355_l1378_l1350_l1373_l1370_DUPLICATE_1f5d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1363_c7_3cf7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1366_l1363_l1358_l1381_l1355_l1378_l1350_l1373_l1370_DUPLICATE_1f5d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1366_c7_5163_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1366_l1363_l1358_l1381_l1355_l1378_l1350_l1373_l1370_DUPLICATE_1f5d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1370_c7_1422_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1366_l1363_l1358_l1381_l1355_l1378_l1350_l1373_l1370_DUPLICATE_1f5d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1373_c7_9cf1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1366_l1363_l1358_l1381_l1355_l1378_l1350_l1373_l1370_DUPLICATE_1f5d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1378_c7_e4b7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1366_l1363_l1358_l1381_l1355_l1378_l1350_l1373_l1370_DUPLICATE_1f5d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1381_c7_a50c_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1366_l1363_l1358_l1381_l1355_l1378_l1350_l1373_l1370_DUPLICATE_1f5d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_a50c_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1381_c7_a50c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_a50c_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1384_c30_d480_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l1367_c3_354f] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1367_c3_354f_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1367_c3_354f_left;
     BIN_OP_OR_uxn_opcodes_h_l1367_c3_354f_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1367_c3_354f_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1367_c3_354f_return_output := BIN_OP_OR_uxn_opcodes_h_l1367_c3_354f_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1360_l1375_DUPLICATE_467f LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1360_l1375_DUPLICATE_467f_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1360_l1375_DUPLICATE_467f_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1360_l1375_DUPLICATE_467f_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1360_l1375_DUPLICATE_467f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1350_c1_297f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1350_c1_297f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1350_c1_297f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1350_c1_297f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1350_c1_297f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1350_c1_297f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1350_c1_297f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1350_c1_297f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1350_c1_297f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1389_c7_9693] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_9693_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_9693_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_9693_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_9693_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_9693_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_9693_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_9693_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_9693_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1382_c3_dd86] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1382_c3_dd86_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1382_c3_dd86_left;
     BIN_OP_OR_uxn_opcodes_h_l1382_c3_dd86_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1382_c3_dd86_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1382_c3_dd86_return_output := BIN_OP_OR_uxn_opcodes_h_l1382_c3_dd86_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1389_c7_9693] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_9693_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_9693_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_9693_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_9693_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_9693_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_9693_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_9693_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_9693_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1389_c7_9693] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_9693_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_9693_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_9693_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_9693_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_9693_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_9693_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_9693_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_9693_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1381_c7_a50c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_a50c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_a50c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_a50c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_a50c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_a50c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_a50c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_a50c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_a50c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1381_c7_a50c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_a50c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_a50c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_a50c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_a50c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_a50c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_a50c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_a50c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_a50c_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1366_c7_5163_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1367_c3_354f_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1387_c21_56fc_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1382_c3_dd86_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1381_c7_a50c_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1382_c3_dd86_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1373_c7_9cf1_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1360_l1375_DUPLICATE_467f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1358_c7_2224_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1360_l1375_DUPLICATE_467f_return_output;
     VAR_printf_uxn_opcodes_h_l1351_c3_3e95_uxn_opcodes_h_l1351_c3_3e95_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1350_c1_297f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_a50c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1389_c7_9693_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_a50c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1389_c7_9693_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_a50c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1389_c7_9693_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_e4b7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_a50c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_e4b7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_a50c_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1381_c7_a50c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_a50c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_a50c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_a50c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_a50c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_a50c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_a50c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_a50c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_a50c_return_output;

     -- t16_MUX[uxn_opcodes_h_l1366_c7_5163] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1366_c7_5163_cond <= VAR_t16_MUX_uxn_opcodes_h_l1366_c7_5163_cond;
     t16_MUX_uxn_opcodes_h_l1366_c7_5163_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1366_c7_5163_iftrue;
     t16_MUX_uxn_opcodes_h_l1366_c7_5163_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1366_c7_5163_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1366_c7_5163_return_output := t16_MUX_uxn_opcodes_h_l1366_c7_5163_return_output;

     -- printf_uxn_opcodes_h_l1351_c3_3e95[uxn_opcodes_h_l1351_c3_3e95] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1351_c3_3e95_uxn_opcodes_h_l1351_c3_3e95_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1351_c3_3e95_uxn_opcodes_h_l1351_c3_3e95_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- n16_MUX[uxn_opcodes_h_l1381_c7_a50c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1381_c7_a50c_cond <= VAR_n16_MUX_uxn_opcodes_h_l1381_c7_a50c_cond;
     n16_MUX_uxn_opcodes_h_l1381_c7_a50c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1381_c7_a50c_iftrue;
     n16_MUX_uxn_opcodes_h_l1381_c7_a50c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1381_c7_a50c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1381_c7_a50c_return_output := n16_MUX_uxn_opcodes_h_l1381_c7_a50c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1378_c7_e4b7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_e4b7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_e4b7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_e4b7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_e4b7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_e4b7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_e4b7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_e4b7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_e4b7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1387_c21_56fc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1387_c21_56fc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1387_c21_56fc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1387_c21_56fc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1387_c21_56fc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1387_c21_56fc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1387_c21_56fc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1381_c7_a50c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_a50c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_a50c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_a50c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_a50c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_a50c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_a50c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_a50c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_a50c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1381_c7_a50c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_a50c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_a50c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_a50c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_a50c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_a50c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_a50c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_a50c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_a50c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1378_c7_e4b7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_e4b7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_e4b7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_e4b7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_e4b7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_e4b7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_e4b7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_e4b7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_e4b7_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1387_c21_5997_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1387_c21_56fc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1378_c7_e4b7_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1381_c7_a50c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_e4b7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_a50c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_e4b7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_a50c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_e4b7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_a50c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_9cf1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_e4b7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_9cf1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_e4b7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1363_c7_3cf7_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1366_c7_5163_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1378_c7_e4b7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_e4b7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_e4b7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_e4b7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_e4b7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_e4b7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_e4b7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_e4b7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_e4b7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1373_c7_9cf1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_9cf1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_9cf1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_9cf1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_9cf1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_9cf1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_9cf1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_9cf1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_9cf1_return_output;

     -- MUX[uxn_opcodes_h_l1387_c21_5997] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1387_c21_5997_cond <= VAR_MUX_uxn_opcodes_h_l1387_c21_5997_cond;
     MUX_uxn_opcodes_h_l1387_c21_5997_iftrue <= VAR_MUX_uxn_opcodes_h_l1387_c21_5997_iftrue;
     MUX_uxn_opcodes_h_l1387_c21_5997_iffalse <= VAR_MUX_uxn_opcodes_h_l1387_c21_5997_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1387_c21_5997_return_output := MUX_uxn_opcodes_h_l1387_c21_5997_return_output;

     -- t16_MUX[uxn_opcodes_h_l1363_c7_3cf7] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1363_c7_3cf7_cond <= VAR_t16_MUX_uxn_opcodes_h_l1363_c7_3cf7_cond;
     t16_MUX_uxn_opcodes_h_l1363_c7_3cf7_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1363_c7_3cf7_iftrue;
     t16_MUX_uxn_opcodes_h_l1363_c7_3cf7_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1363_c7_3cf7_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1363_c7_3cf7_return_output := t16_MUX_uxn_opcodes_h_l1363_c7_3cf7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1378_c7_e4b7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_e4b7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_e4b7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_e4b7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_e4b7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_e4b7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_e4b7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_e4b7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_e4b7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1378_c7_e4b7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_e4b7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_e4b7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_e4b7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_e4b7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_e4b7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_e4b7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_e4b7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_e4b7_return_output;

     -- n16_MUX[uxn_opcodes_h_l1378_c7_e4b7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1378_c7_e4b7_cond <= VAR_n16_MUX_uxn_opcodes_h_l1378_c7_e4b7_cond;
     n16_MUX_uxn_opcodes_h_l1378_c7_e4b7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1378_c7_e4b7_iftrue;
     n16_MUX_uxn_opcodes_h_l1378_c7_e4b7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1378_c7_e4b7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1378_c7_e4b7_return_output := n16_MUX_uxn_opcodes_h_l1378_c7_e4b7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1373_c7_9cf1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_9cf1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_9cf1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_9cf1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_9cf1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_9cf1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_9cf1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_9cf1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_9cf1_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1381_c7_a50c_iftrue := VAR_MUX_uxn_opcodes_h_l1387_c21_5997_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1373_c7_9cf1_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1378_c7_e4b7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_9cf1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_e4b7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_9cf1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_e4b7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_9cf1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_e4b7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_1422_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_9cf1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_1422_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_9cf1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1358_c7_2224_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1363_c7_3cf7_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1370_c7_1422] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_1422_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_1422_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_1422_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_1422_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_1422_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_1422_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_1422_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_1422_return_output;

     -- t16_MUX[uxn_opcodes_h_l1358_c7_2224] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1358_c7_2224_cond <= VAR_t16_MUX_uxn_opcodes_h_l1358_c7_2224_cond;
     t16_MUX_uxn_opcodes_h_l1358_c7_2224_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1358_c7_2224_iftrue;
     t16_MUX_uxn_opcodes_h_l1358_c7_2224_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1358_c7_2224_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1358_c7_2224_return_output := t16_MUX_uxn_opcodes_h_l1358_c7_2224_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1370_c7_1422] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_1422_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_1422_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_1422_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_1422_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_1422_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_1422_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_1422_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_1422_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1373_c7_9cf1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_9cf1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_9cf1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_9cf1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_9cf1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_9cf1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_9cf1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_9cf1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_9cf1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1373_c7_9cf1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_9cf1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_9cf1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_9cf1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_9cf1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_9cf1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_9cf1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_9cf1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_9cf1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1373_c7_9cf1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_9cf1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_9cf1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_9cf1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_9cf1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_9cf1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_9cf1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_9cf1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_9cf1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1381_c7_a50c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1381_c7_a50c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1381_c7_a50c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1381_c7_a50c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1381_c7_a50c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1381_c7_a50c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1381_c7_a50c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1381_c7_a50c_return_output := result_u8_value_MUX_uxn_opcodes_h_l1381_c7_a50c_return_output;

     -- n16_MUX[uxn_opcodes_h_l1373_c7_9cf1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1373_c7_9cf1_cond <= VAR_n16_MUX_uxn_opcodes_h_l1373_c7_9cf1_cond;
     n16_MUX_uxn_opcodes_h_l1373_c7_9cf1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1373_c7_9cf1_iftrue;
     n16_MUX_uxn_opcodes_h_l1373_c7_9cf1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1373_c7_9cf1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1373_c7_9cf1_return_output := n16_MUX_uxn_opcodes_h_l1373_c7_9cf1_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1370_c7_1422_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1373_c7_9cf1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_1422_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_9cf1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_1422_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_9cf1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_1422_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_9cf1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_5163_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_1422_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_5163_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_1422_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1378_c7_e4b7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1381_c7_a50c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1355_c7_91b7_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1358_c7_2224_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1366_c7_5163] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_5163_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_5163_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_5163_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_5163_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_5163_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_5163_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_5163_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_5163_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1370_c7_1422] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_1422_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_1422_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_1422_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_1422_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_1422_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_1422_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_1422_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_1422_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1366_c7_5163] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_5163_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_5163_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_5163_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_5163_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_5163_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_5163_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_5163_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_5163_return_output;

     -- t16_MUX[uxn_opcodes_h_l1355_c7_91b7] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1355_c7_91b7_cond <= VAR_t16_MUX_uxn_opcodes_h_l1355_c7_91b7_cond;
     t16_MUX_uxn_opcodes_h_l1355_c7_91b7_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1355_c7_91b7_iftrue;
     t16_MUX_uxn_opcodes_h_l1355_c7_91b7_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1355_c7_91b7_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1355_c7_91b7_return_output := t16_MUX_uxn_opcodes_h_l1355_c7_91b7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1378_c7_e4b7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1378_c7_e4b7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1378_c7_e4b7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1378_c7_e4b7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1378_c7_e4b7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1378_c7_e4b7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1378_c7_e4b7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1378_c7_e4b7_return_output := result_u8_value_MUX_uxn_opcodes_h_l1378_c7_e4b7_return_output;

     -- n16_MUX[uxn_opcodes_h_l1370_c7_1422] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1370_c7_1422_cond <= VAR_n16_MUX_uxn_opcodes_h_l1370_c7_1422_cond;
     n16_MUX_uxn_opcodes_h_l1370_c7_1422_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1370_c7_1422_iftrue;
     n16_MUX_uxn_opcodes_h_l1370_c7_1422_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1370_c7_1422_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1370_c7_1422_return_output := n16_MUX_uxn_opcodes_h_l1370_c7_1422_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1370_c7_1422] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_1422_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_1422_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_1422_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_1422_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_1422_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_1422_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_1422_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_1422_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1370_c7_1422] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_1422_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_1422_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_1422_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_1422_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_1422_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_1422_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_1422_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_1422_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1366_c7_5163_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1370_c7_1422_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_5163_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_1422_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_5163_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_1422_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_5163_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_1422_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_3cf7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_5163_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_3cf7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_5163_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1373_c7_9cf1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1378_c7_e4b7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1350_c2_e1c7_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1355_c7_91b7_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1366_c7_5163] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_5163_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_5163_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_5163_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_5163_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_5163_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_5163_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_5163_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_5163_return_output;

     -- n16_MUX[uxn_opcodes_h_l1366_c7_5163] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1366_c7_5163_cond <= VAR_n16_MUX_uxn_opcodes_h_l1366_c7_5163_cond;
     n16_MUX_uxn_opcodes_h_l1366_c7_5163_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1366_c7_5163_iftrue;
     n16_MUX_uxn_opcodes_h_l1366_c7_5163_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1366_c7_5163_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1366_c7_5163_return_output := n16_MUX_uxn_opcodes_h_l1366_c7_5163_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1373_c7_9cf1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1373_c7_9cf1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1373_c7_9cf1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1373_c7_9cf1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1373_c7_9cf1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1373_c7_9cf1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1373_c7_9cf1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1373_c7_9cf1_return_output := result_u8_value_MUX_uxn_opcodes_h_l1373_c7_9cf1_return_output;

     -- t16_MUX[uxn_opcodes_h_l1350_c2_e1c7] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1350_c2_e1c7_cond <= VAR_t16_MUX_uxn_opcodes_h_l1350_c2_e1c7_cond;
     t16_MUX_uxn_opcodes_h_l1350_c2_e1c7_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1350_c2_e1c7_iftrue;
     t16_MUX_uxn_opcodes_h_l1350_c2_e1c7_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1350_c2_e1c7_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1350_c2_e1c7_return_output := t16_MUX_uxn_opcodes_h_l1350_c2_e1c7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1363_c7_3cf7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_3cf7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_3cf7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_3cf7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_3cf7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_3cf7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_3cf7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_3cf7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_3cf7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1366_c7_5163] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_5163_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_5163_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_5163_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_5163_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_5163_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_5163_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_5163_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_5163_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1366_c7_5163] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_5163_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_5163_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_5163_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_5163_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_5163_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_5163_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_5163_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_5163_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1363_c7_3cf7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_3cf7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_3cf7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_3cf7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_3cf7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_3cf7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_3cf7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_3cf7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_3cf7_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1363_c7_3cf7_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1366_c7_5163_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_3cf7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_5163_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_3cf7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_5163_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_3cf7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_5163_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_2224_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1363_c7_3cf7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_2224_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1363_c7_3cf7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1370_c7_1422_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1373_c7_9cf1_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1350_c2_e1c7_return_output;
     -- n16_MUX[uxn_opcodes_h_l1363_c7_3cf7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1363_c7_3cf7_cond <= VAR_n16_MUX_uxn_opcodes_h_l1363_c7_3cf7_cond;
     n16_MUX_uxn_opcodes_h_l1363_c7_3cf7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1363_c7_3cf7_iftrue;
     n16_MUX_uxn_opcodes_h_l1363_c7_3cf7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1363_c7_3cf7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1363_c7_3cf7_return_output := n16_MUX_uxn_opcodes_h_l1363_c7_3cf7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1358_c7_2224] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_2224_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_2224_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_2224_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_2224_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_2224_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_2224_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_2224_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_2224_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1363_c7_3cf7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_3cf7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_3cf7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_3cf7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_3cf7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_3cf7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_3cf7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_3cf7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_3cf7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1363_c7_3cf7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_3cf7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_3cf7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_3cf7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_3cf7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_3cf7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_3cf7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_3cf7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_3cf7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1358_c7_2224] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_2224_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_2224_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_2224_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_2224_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_2224_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_2224_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_2224_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_2224_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1363_c7_3cf7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_3cf7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_3cf7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_3cf7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_3cf7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_3cf7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_3cf7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_3cf7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_3cf7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1370_c7_1422] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1370_c7_1422_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1370_c7_1422_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1370_c7_1422_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1370_c7_1422_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1370_c7_1422_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1370_c7_1422_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1370_c7_1422_return_output := result_u8_value_MUX_uxn_opcodes_h_l1370_c7_1422_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1358_c7_2224_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1363_c7_3cf7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_2224_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1363_c7_3cf7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_2224_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1363_c7_3cf7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_2224_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1363_c7_3cf7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c7_91b7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_2224_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c7_91b7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_2224_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1366_c7_5163_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1370_c7_1422_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1358_c7_2224] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_2224_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_2224_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_2224_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_2224_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_2224_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_2224_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_2224_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_2224_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1355_c7_91b7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c7_91b7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c7_91b7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c7_91b7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c7_91b7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c7_91b7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c7_91b7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c7_91b7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c7_91b7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1366_c7_5163] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1366_c7_5163_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1366_c7_5163_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1366_c7_5163_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1366_c7_5163_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1366_c7_5163_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1366_c7_5163_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1366_c7_5163_return_output := result_u8_value_MUX_uxn_opcodes_h_l1366_c7_5163_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1355_c7_91b7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c7_91b7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c7_91b7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c7_91b7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c7_91b7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c7_91b7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c7_91b7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c7_91b7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c7_91b7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1358_c7_2224] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_2224_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_2224_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_2224_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_2224_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_2224_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_2224_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_2224_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_2224_return_output;

     -- n16_MUX[uxn_opcodes_h_l1358_c7_2224] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1358_c7_2224_cond <= VAR_n16_MUX_uxn_opcodes_h_l1358_c7_2224_cond;
     n16_MUX_uxn_opcodes_h_l1358_c7_2224_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1358_c7_2224_iftrue;
     n16_MUX_uxn_opcodes_h_l1358_c7_2224_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1358_c7_2224_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1358_c7_2224_return_output := n16_MUX_uxn_opcodes_h_l1358_c7_2224_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1358_c7_2224] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_2224_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_2224_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_2224_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_2224_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_2224_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_2224_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_2224_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_2224_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1355_c7_91b7_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1358_c7_2224_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1355_c7_91b7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_2224_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c7_91b7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_2224_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1355_c7_91b7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_2224_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c2_e1c7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1355_c7_91b7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c2_e1c7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1355_c7_91b7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1363_c7_3cf7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1366_c7_5163_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1363_c7_3cf7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1363_c7_3cf7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1363_c7_3cf7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1363_c7_3cf7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1363_c7_3cf7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1363_c7_3cf7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1363_c7_3cf7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1363_c7_3cf7_return_output := result_u8_value_MUX_uxn_opcodes_h_l1363_c7_3cf7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1355_c7_91b7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1355_c7_91b7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1355_c7_91b7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1355_c7_91b7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1355_c7_91b7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1355_c7_91b7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1355_c7_91b7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1355_c7_91b7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1355_c7_91b7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1350_c2_e1c7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c2_e1c7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c2_e1c7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c2_e1c7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c2_e1c7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c2_e1c7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c2_e1c7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c2_e1c7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c2_e1c7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1355_c7_91b7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1355_c7_91b7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1355_c7_91b7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1355_c7_91b7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1355_c7_91b7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1355_c7_91b7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1355_c7_91b7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1355_c7_91b7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1355_c7_91b7_return_output;

     -- n16_MUX[uxn_opcodes_h_l1355_c7_91b7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1355_c7_91b7_cond <= VAR_n16_MUX_uxn_opcodes_h_l1355_c7_91b7_cond;
     n16_MUX_uxn_opcodes_h_l1355_c7_91b7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1355_c7_91b7_iftrue;
     n16_MUX_uxn_opcodes_h_l1355_c7_91b7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1355_c7_91b7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1355_c7_91b7_return_output := n16_MUX_uxn_opcodes_h_l1355_c7_91b7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1355_c7_91b7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c7_91b7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c7_91b7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c7_91b7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c7_91b7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c7_91b7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c7_91b7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c7_91b7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c7_91b7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1350_c2_e1c7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c2_e1c7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c2_e1c7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c2_e1c7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c2_e1c7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c2_e1c7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c2_e1c7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c2_e1c7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c2_e1c7_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1350_c2_e1c7_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1355_c7_91b7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1350_c2_e1c7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1355_c7_91b7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c2_e1c7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1355_c7_91b7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1350_c2_e1c7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1355_c7_91b7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1358_c7_2224_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1363_c7_3cf7_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1350_c2_e1c7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c2_e1c7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c2_e1c7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c2_e1c7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c2_e1c7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c2_e1c7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c2_e1c7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c2_e1c7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c2_e1c7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1350_c2_e1c7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1350_c2_e1c7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1350_c2_e1c7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1350_c2_e1c7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1350_c2_e1c7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1350_c2_e1c7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1350_c2_e1c7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1350_c2_e1c7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1350_c2_e1c7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1350_c2_e1c7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1350_c2_e1c7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1350_c2_e1c7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1350_c2_e1c7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1350_c2_e1c7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1350_c2_e1c7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1350_c2_e1c7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1350_c2_e1c7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1350_c2_e1c7_return_output;

     -- n16_MUX[uxn_opcodes_h_l1350_c2_e1c7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1350_c2_e1c7_cond <= VAR_n16_MUX_uxn_opcodes_h_l1350_c2_e1c7_cond;
     n16_MUX_uxn_opcodes_h_l1350_c2_e1c7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1350_c2_e1c7_iftrue;
     n16_MUX_uxn_opcodes_h_l1350_c2_e1c7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1350_c2_e1c7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1350_c2_e1c7_return_output := n16_MUX_uxn_opcodes_h_l1350_c2_e1c7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1358_c7_2224] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1358_c7_2224_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1358_c7_2224_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1358_c7_2224_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1358_c7_2224_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1358_c7_2224_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1358_c7_2224_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1358_c7_2224_return_output := result_u8_value_MUX_uxn_opcodes_h_l1358_c7_2224_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1350_c2_e1c7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1355_c7_91b7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1358_c7_2224_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1355_c7_91b7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1355_c7_91b7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1355_c7_91b7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1355_c7_91b7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1355_c7_91b7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1355_c7_91b7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1355_c7_91b7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1355_c7_91b7_return_output := result_u8_value_MUX_uxn_opcodes_h_l1355_c7_91b7_return_output;

     -- Submodule level 12
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1350_c2_e1c7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1355_c7_91b7_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1350_c2_e1c7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1350_c2_e1c7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1350_c2_e1c7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1350_c2_e1c7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1350_c2_e1c7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1350_c2_e1c7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1350_c2_e1c7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1350_c2_e1c7_return_output := result_u8_value_MUX_uxn_opcodes_h_l1350_c2_e1c7_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l1346_l1395_DUPLICATE_e354 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l1346_l1395_DUPLICATE_e354_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_25e8(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1350_c2_e1c7_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1350_c2_e1c7_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1350_c2_e1c7_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1350_c2_e1c7_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1350_c2_e1c7_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1350_c2_e1c7_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l1346_l1395_DUPLICATE_e354_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l1346_l1395_DUPLICATE_e354_return_output;
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
