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
-- Submodules: 60
entity neq_0CLK_1c7b7172 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end neq_0CLK_1c7b7172;
architecture arch of neq_0CLK_1c7b7172 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1341_c6_85f9]
signal BIN_OP_EQ_uxn_opcodes_h_l1341_c6_85f9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1341_c6_85f9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1341_c6_85f9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1341_c1_5d4e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1341_c1_5d4e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1341_c1_5d4e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1341_c1_5d4e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1341_c1_5d4e_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1341_c2_9b1c]
signal t8_MUX_uxn_opcodes_h_l1341_c2_9b1c_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1341_c2_9b1c_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1341_c2_9b1c_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1341_c2_9b1c_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1341_c2_9b1c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1341_c2_9b1c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1341_c2_9b1c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1341_c2_9b1c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1341_c2_9b1c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1341_c2_9b1c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c2_9b1c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c2_9b1c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c2_9b1c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c2_9b1c_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1341_c2_9b1c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c2_9b1c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c2_9b1c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c2_9b1c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c2_9b1c_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1341_c2_9b1c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1341_c2_9b1c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1341_c2_9b1c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1341_c2_9b1c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1341_c2_9b1c_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1341_c2_9b1c]
signal result_stack_value_MUX_uxn_opcodes_h_l1341_c2_9b1c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1341_c2_9b1c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1341_c2_9b1c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1341_c2_9b1c_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1341_c2_9b1c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c2_9b1c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c2_9b1c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c2_9b1c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c2_9b1c_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1341_c2_9b1c]
signal n8_MUX_uxn_opcodes_h_l1341_c2_9b1c_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1341_c2_9b1c_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1341_c2_9b1c_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1341_c2_9b1c_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l1342_c3_b425[uxn_opcodes_h_l1342_c3_b425]
signal printf_uxn_opcodes_h_l1342_c3_b425_uxn_opcodes_h_l1342_c3_b425_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1346_c11_91bf]
signal BIN_OP_EQ_uxn_opcodes_h_l1346_c11_91bf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1346_c11_91bf_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1346_c11_91bf_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1346_c7_294c]
signal t8_MUX_uxn_opcodes_h_l1346_c7_294c_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1346_c7_294c_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1346_c7_294c_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1346_c7_294c_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1346_c7_294c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1346_c7_294c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1346_c7_294c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1346_c7_294c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1346_c7_294c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1346_c7_294c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1346_c7_294c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1346_c7_294c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1346_c7_294c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1346_c7_294c_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1346_c7_294c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1346_c7_294c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1346_c7_294c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1346_c7_294c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1346_c7_294c_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1346_c7_294c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1346_c7_294c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1346_c7_294c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1346_c7_294c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1346_c7_294c_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1346_c7_294c]
signal result_stack_value_MUX_uxn_opcodes_h_l1346_c7_294c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1346_c7_294c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1346_c7_294c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1346_c7_294c_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1346_c7_294c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1346_c7_294c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1346_c7_294c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1346_c7_294c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1346_c7_294c_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1346_c7_294c]
signal n8_MUX_uxn_opcodes_h_l1346_c7_294c_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1346_c7_294c_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1346_c7_294c_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1346_c7_294c_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1349_c11_8622]
signal BIN_OP_EQ_uxn_opcodes_h_l1349_c11_8622_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1349_c11_8622_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1349_c11_8622_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1349_c7_ef15]
signal t8_MUX_uxn_opcodes_h_l1349_c7_ef15_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1349_c7_ef15_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1349_c7_ef15_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1349_c7_ef15_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1349_c7_ef15]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1349_c7_ef15_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1349_c7_ef15_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1349_c7_ef15_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1349_c7_ef15_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1349_c7_ef15]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1349_c7_ef15_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1349_c7_ef15_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1349_c7_ef15_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1349_c7_ef15_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1349_c7_ef15]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1349_c7_ef15_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1349_c7_ef15_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1349_c7_ef15_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1349_c7_ef15_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1349_c7_ef15]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1349_c7_ef15_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1349_c7_ef15_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1349_c7_ef15_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1349_c7_ef15_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1349_c7_ef15]
signal result_stack_value_MUX_uxn_opcodes_h_l1349_c7_ef15_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1349_c7_ef15_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1349_c7_ef15_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1349_c7_ef15_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1349_c7_ef15]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1349_c7_ef15_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1349_c7_ef15_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1349_c7_ef15_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1349_c7_ef15_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1349_c7_ef15]
signal n8_MUX_uxn_opcodes_h_l1349_c7_ef15_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1349_c7_ef15_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1349_c7_ef15_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1349_c7_ef15_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1353_c11_9439]
signal BIN_OP_EQ_uxn_opcodes_h_l1353_c11_9439_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1353_c11_9439_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1353_c11_9439_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1353_c7_c012]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_c012_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_c012_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_c012_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_c012_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1353_c7_c012]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_c012_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_c012_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_c012_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_c012_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1353_c7_c012]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_c012_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_c012_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_c012_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_c012_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1353_c7_c012]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_c012_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_c012_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_c012_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_c012_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1353_c7_c012]
signal result_stack_value_MUX_uxn_opcodes_h_l1353_c7_c012_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1353_c7_c012_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1353_c7_c012_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1353_c7_c012_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1353_c7_c012]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_c012_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_c012_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_c012_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_c012_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1353_c7_c012]
signal n8_MUX_uxn_opcodes_h_l1353_c7_c012_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1353_c7_c012_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1353_c7_c012_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1353_c7_c012_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1356_c11_5339]
signal BIN_OP_EQ_uxn_opcodes_h_l1356_c11_5339_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1356_c11_5339_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1356_c11_5339_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1356_c7_5763]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1356_c7_5763_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1356_c7_5763_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1356_c7_5763_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1356_c7_5763_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1356_c7_5763]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1356_c7_5763_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1356_c7_5763_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1356_c7_5763_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1356_c7_5763_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1356_c7_5763]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1356_c7_5763_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1356_c7_5763_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1356_c7_5763_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1356_c7_5763_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1356_c7_5763]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1356_c7_5763_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1356_c7_5763_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1356_c7_5763_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1356_c7_5763_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1356_c7_5763]
signal result_stack_value_MUX_uxn_opcodes_h_l1356_c7_5763_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1356_c7_5763_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1356_c7_5763_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1356_c7_5763_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1356_c7_5763]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1356_c7_5763_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1356_c7_5763_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1356_c7_5763_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1356_c7_5763_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1356_c7_5763]
signal n8_MUX_uxn_opcodes_h_l1356_c7_5763_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1356_c7_5763_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1356_c7_5763_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1356_c7_5763_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1359_c32_b9a2]
signal BIN_OP_AND_uxn_opcodes_h_l1359_c32_b9a2_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1359_c32_b9a2_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1359_c32_b9a2_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1359_c32_ff03]
signal BIN_OP_GT_uxn_opcodes_h_l1359_c32_ff03_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1359_c32_ff03_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1359_c32_ff03_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1359_c32_84fd]
signal MUX_uxn_opcodes_h_l1359_c32_84fd_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1359_c32_84fd_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1359_c32_84fd_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1359_c32_84fd_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1361_c11_27ed]
signal BIN_OP_EQ_uxn_opcodes_h_l1361_c11_27ed_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1361_c11_27ed_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1361_c11_27ed_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1361_c7_f12a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_f12a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_f12a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_f12a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_f12a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1361_c7_f12a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_f12a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_f12a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_f12a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_f12a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1361_c7_f12a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_f12a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_f12a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_f12a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_f12a_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1361_c7_f12a]
signal result_stack_value_MUX_uxn_opcodes_h_l1361_c7_f12a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1361_c7_f12a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1361_c7_f12a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1361_c7_f12a_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1361_c7_f12a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_f12a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_f12a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_f12a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_f12a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1365_c24_4779]
signal BIN_OP_EQ_uxn_opcodes_h_l1365_c24_4779_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1365_c24_4779_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1365_c24_4779_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1365_c24_467c]
signal MUX_uxn_opcodes_h_l1365_c24_467c_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1365_c24_467c_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1365_c24_467c_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1365_c24_467c_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1367_c11_74e0]
signal BIN_OP_EQ_uxn_opcodes_h_l1367_c11_74e0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1367_c11_74e0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1367_c11_74e0_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1367_c7_453b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1367_c7_453b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1367_c7_453b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1367_c7_453b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1367_c7_453b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1367_c7_453b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1367_c7_453b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1367_c7_453b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1367_c7_453b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1367_c7_453b_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1341_c6_85f9
BIN_OP_EQ_uxn_opcodes_h_l1341_c6_85f9 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1341_c6_85f9_left,
BIN_OP_EQ_uxn_opcodes_h_l1341_c6_85f9_right,
BIN_OP_EQ_uxn_opcodes_h_l1341_c6_85f9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1341_c1_5d4e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1341_c1_5d4e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1341_c1_5d4e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1341_c1_5d4e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1341_c1_5d4e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1341_c1_5d4e_return_output);

-- t8_MUX_uxn_opcodes_h_l1341_c2_9b1c
t8_MUX_uxn_opcodes_h_l1341_c2_9b1c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1341_c2_9b1c_cond,
t8_MUX_uxn_opcodes_h_l1341_c2_9b1c_iftrue,
t8_MUX_uxn_opcodes_h_l1341_c2_9b1c_iffalse,
t8_MUX_uxn_opcodes_h_l1341_c2_9b1c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1341_c2_9b1c
result_is_stack_write_MUX_uxn_opcodes_h_l1341_c2_9b1c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1341_c2_9b1c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1341_c2_9b1c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1341_c2_9b1c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1341_c2_9b1c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c2_9b1c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c2_9b1c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c2_9b1c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c2_9b1c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c2_9b1c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c2_9b1c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c2_9b1c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c2_9b1c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c2_9b1c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c2_9b1c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c2_9b1c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c2_9b1c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1341_c2_9b1c
result_is_opc_done_MUX_uxn_opcodes_h_l1341_c2_9b1c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1341_c2_9b1c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1341_c2_9b1c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1341_c2_9b1c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1341_c2_9b1c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1341_c2_9b1c
result_stack_value_MUX_uxn_opcodes_h_l1341_c2_9b1c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1341_c2_9b1c_cond,
result_stack_value_MUX_uxn_opcodes_h_l1341_c2_9b1c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1341_c2_9b1c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1341_c2_9b1c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c2_9b1c
result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c2_9b1c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c2_9b1c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c2_9b1c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c2_9b1c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c2_9b1c_return_output);

-- n8_MUX_uxn_opcodes_h_l1341_c2_9b1c
n8_MUX_uxn_opcodes_h_l1341_c2_9b1c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1341_c2_9b1c_cond,
n8_MUX_uxn_opcodes_h_l1341_c2_9b1c_iftrue,
n8_MUX_uxn_opcodes_h_l1341_c2_9b1c_iffalse,
n8_MUX_uxn_opcodes_h_l1341_c2_9b1c_return_output);

-- printf_uxn_opcodes_h_l1342_c3_b425_uxn_opcodes_h_l1342_c3_b425
printf_uxn_opcodes_h_l1342_c3_b425_uxn_opcodes_h_l1342_c3_b425 : entity work.printf_uxn_opcodes_h_l1342_c3_b425_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1342_c3_b425_uxn_opcodes_h_l1342_c3_b425_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1346_c11_91bf
BIN_OP_EQ_uxn_opcodes_h_l1346_c11_91bf : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1346_c11_91bf_left,
BIN_OP_EQ_uxn_opcodes_h_l1346_c11_91bf_right,
BIN_OP_EQ_uxn_opcodes_h_l1346_c11_91bf_return_output);

-- t8_MUX_uxn_opcodes_h_l1346_c7_294c
t8_MUX_uxn_opcodes_h_l1346_c7_294c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1346_c7_294c_cond,
t8_MUX_uxn_opcodes_h_l1346_c7_294c_iftrue,
t8_MUX_uxn_opcodes_h_l1346_c7_294c_iffalse,
t8_MUX_uxn_opcodes_h_l1346_c7_294c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1346_c7_294c
result_is_stack_write_MUX_uxn_opcodes_h_l1346_c7_294c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1346_c7_294c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1346_c7_294c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1346_c7_294c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1346_c7_294c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1346_c7_294c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1346_c7_294c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1346_c7_294c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1346_c7_294c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1346_c7_294c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1346_c7_294c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1346_c7_294c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1346_c7_294c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1346_c7_294c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1346_c7_294c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1346_c7_294c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1346_c7_294c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1346_c7_294c
result_is_opc_done_MUX_uxn_opcodes_h_l1346_c7_294c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1346_c7_294c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1346_c7_294c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1346_c7_294c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1346_c7_294c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1346_c7_294c
result_stack_value_MUX_uxn_opcodes_h_l1346_c7_294c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1346_c7_294c_cond,
result_stack_value_MUX_uxn_opcodes_h_l1346_c7_294c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1346_c7_294c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1346_c7_294c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1346_c7_294c
result_is_sp_shift_MUX_uxn_opcodes_h_l1346_c7_294c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1346_c7_294c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1346_c7_294c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1346_c7_294c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1346_c7_294c_return_output);

-- n8_MUX_uxn_opcodes_h_l1346_c7_294c
n8_MUX_uxn_opcodes_h_l1346_c7_294c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1346_c7_294c_cond,
n8_MUX_uxn_opcodes_h_l1346_c7_294c_iftrue,
n8_MUX_uxn_opcodes_h_l1346_c7_294c_iffalse,
n8_MUX_uxn_opcodes_h_l1346_c7_294c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1349_c11_8622
BIN_OP_EQ_uxn_opcodes_h_l1349_c11_8622 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1349_c11_8622_left,
BIN_OP_EQ_uxn_opcodes_h_l1349_c11_8622_right,
BIN_OP_EQ_uxn_opcodes_h_l1349_c11_8622_return_output);

-- t8_MUX_uxn_opcodes_h_l1349_c7_ef15
t8_MUX_uxn_opcodes_h_l1349_c7_ef15 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1349_c7_ef15_cond,
t8_MUX_uxn_opcodes_h_l1349_c7_ef15_iftrue,
t8_MUX_uxn_opcodes_h_l1349_c7_ef15_iffalse,
t8_MUX_uxn_opcodes_h_l1349_c7_ef15_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1349_c7_ef15
result_is_stack_write_MUX_uxn_opcodes_h_l1349_c7_ef15 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1349_c7_ef15_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1349_c7_ef15_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1349_c7_ef15_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1349_c7_ef15_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1349_c7_ef15
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1349_c7_ef15 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1349_c7_ef15_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1349_c7_ef15_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1349_c7_ef15_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1349_c7_ef15_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1349_c7_ef15
result_sp_relative_shift_MUX_uxn_opcodes_h_l1349_c7_ef15 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1349_c7_ef15_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1349_c7_ef15_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1349_c7_ef15_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1349_c7_ef15_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1349_c7_ef15
result_is_opc_done_MUX_uxn_opcodes_h_l1349_c7_ef15 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1349_c7_ef15_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1349_c7_ef15_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1349_c7_ef15_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1349_c7_ef15_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1349_c7_ef15
result_stack_value_MUX_uxn_opcodes_h_l1349_c7_ef15 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1349_c7_ef15_cond,
result_stack_value_MUX_uxn_opcodes_h_l1349_c7_ef15_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1349_c7_ef15_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1349_c7_ef15_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1349_c7_ef15
result_is_sp_shift_MUX_uxn_opcodes_h_l1349_c7_ef15 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1349_c7_ef15_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1349_c7_ef15_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1349_c7_ef15_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1349_c7_ef15_return_output);

-- n8_MUX_uxn_opcodes_h_l1349_c7_ef15
n8_MUX_uxn_opcodes_h_l1349_c7_ef15 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1349_c7_ef15_cond,
n8_MUX_uxn_opcodes_h_l1349_c7_ef15_iftrue,
n8_MUX_uxn_opcodes_h_l1349_c7_ef15_iffalse,
n8_MUX_uxn_opcodes_h_l1349_c7_ef15_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1353_c11_9439
BIN_OP_EQ_uxn_opcodes_h_l1353_c11_9439 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1353_c11_9439_left,
BIN_OP_EQ_uxn_opcodes_h_l1353_c11_9439_right,
BIN_OP_EQ_uxn_opcodes_h_l1353_c11_9439_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_c012
result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_c012 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_c012_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_c012_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_c012_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_c012_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_c012
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_c012 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_c012_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_c012_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_c012_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_c012_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_c012
result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_c012 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_c012_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_c012_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_c012_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_c012_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_c012
result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_c012 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_c012_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_c012_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_c012_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_c012_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1353_c7_c012
result_stack_value_MUX_uxn_opcodes_h_l1353_c7_c012 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1353_c7_c012_cond,
result_stack_value_MUX_uxn_opcodes_h_l1353_c7_c012_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1353_c7_c012_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1353_c7_c012_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_c012
result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_c012 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_c012_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_c012_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_c012_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_c012_return_output);

-- n8_MUX_uxn_opcodes_h_l1353_c7_c012
n8_MUX_uxn_opcodes_h_l1353_c7_c012 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1353_c7_c012_cond,
n8_MUX_uxn_opcodes_h_l1353_c7_c012_iftrue,
n8_MUX_uxn_opcodes_h_l1353_c7_c012_iffalse,
n8_MUX_uxn_opcodes_h_l1353_c7_c012_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1356_c11_5339
BIN_OP_EQ_uxn_opcodes_h_l1356_c11_5339 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1356_c11_5339_left,
BIN_OP_EQ_uxn_opcodes_h_l1356_c11_5339_right,
BIN_OP_EQ_uxn_opcodes_h_l1356_c11_5339_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1356_c7_5763
result_is_stack_write_MUX_uxn_opcodes_h_l1356_c7_5763 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1356_c7_5763_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1356_c7_5763_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1356_c7_5763_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1356_c7_5763_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1356_c7_5763
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1356_c7_5763 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1356_c7_5763_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1356_c7_5763_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1356_c7_5763_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1356_c7_5763_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1356_c7_5763
result_sp_relative_shift_MUX_uxn_opcodes_h_l1356_c7_5763 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1356_c7_5763_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1356_c7_5763_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1356_c7_5763_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1356_c7_5763_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1356_c7_5763
result_is_opc_done_MUX_uxn_opcodes_h_l1356_c7_5763 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1356_c7_5763_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1356_c7_5763_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1356_c7_5763_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1356_c7_5763_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1356_c7_5763
result_stack_value_MUX_uxn_opcodes_h_l1356_c7_5763 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1356_c7_5763_cond,
result_stack_value_MUX_uxn_opcodes_h_l1356_c7_5763_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1356_c7_5763_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1356_c7_5763_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1356_c7_5763
result_is_sp_shift_MUX_uxn_opcodes_h_l1356_c7_5763 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1356_c7_5763_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1356_c7_5763_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1356_c7_5763_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1356_c7_5763_return_output);

-- n8_MUX_uxn_opcodes_h_l1356_c7_5763
n8_MUX_uxn_opcodes_h_l1356_c7_5763 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1356_c7_5763_cond,
n8_MUX_uxn_opcodes_h_l1356_c7_5763_iftrue,
n8_MUX_uxn_opcodes_h_l1356_c7_5763_iffalse,
n8_MUX_uxn_opcodes_h_l1356_c7_5763_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1359_c32_b9a2
BIN_OP_AND_uxn_opcodes_h_l1359_c32_b9a2 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1359_c32_b9a2_left,
BIN_OP_AND_uxn_opcodes_h_l1359_c32_b9a2_right,
BIN_OP_AND_uxn_opcodes_h_l1359_c32_b9a2_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1359_c32_ff03
BIN_OP_GT_uxn_opcodes_h_l1359_c32_ff03 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1359_c32_ff03_left,
BIN_OP_GT_uxn_opcodes_h_l1359_c32_ff03_right,
BIN_OP_GT_uxn_opcodes_h_l1359_c32_ff03_return_output);

-- MUX_uxn_opcodes_h_l1359_c32_84fd
MUX_uxn_opcodes_h_l1359_c32_84fd : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1359_c32_84fd_cond,
MUX_uxn_opcodes_h_l1359_c32_84fd_iftrue,
MUX_uxn_opcodes_h_l1359_c32_84fd_iffalse,
MUX_uxn_opcodes_h_l1359_c32_84fd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1361_c11_27ed
BIN_OP_EQ_uxn_opcodes_h_l1361_c11_27ed : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1361_c11_27ed_left,
BIN_OP_EQ_uxn_opcodes_h_l1361_c11_27ed_right,
BIN_OP_EQ_uxn_opcodes_h_l1361_c11_27ed_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_f12a
result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_f12a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_f12a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_f12a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_f12a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_f12a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_f12a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_f12a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_f12a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_f12a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_f12a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_f12a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_f12a
result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_f12a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_f12a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_f12a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_f12a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_f12a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1361_c7_f12a
result_stack_value_MUX_uxn_opcodes_h_l1361_c7_f12a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1361_c7_f12a_cond,
result_stack_value_MUX_uxn_opcodes_h_l1361_c7_f12a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1361_c7_f12a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1361_c7_f12a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_f12a
result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_f12a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_f12a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_f12a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_f12a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_f12a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1365_c24_4779
BIN_OP_EQ_uxn_opcodes_h_l1365_c24_4779 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1365_c24_4779_left,
BIN_OP_EQ_uxn_opcodes_h_l1365_c24_4779_right,
BIN_OP_EQ_uxn_opcodes_h_l1365_c24_4779_return_output);

-- MUX_uxn_opcodes_h_l1365_c24_467c
MUX_uxn_opcodes_h_l1365_c24_467c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1365_c24_467c_cond,
MUX_uxn_opcodes_h_l1365_c24_467c_iftrue,
MUX_uxn_opcodes_h_l1365_c24_467c_iffalse,
MUX_uxn_opcodes_h_l1365_c24_467c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1367_c11_74e0
BIN_OP_EQ_uxn_opcodes_h_l1367_c11_74e0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1367_c11_74e0_left,
BIN_OP_EQ_uxn_opcodes_h_l1367_c11_74e0_right,
BIN_OP_EQ_uxn_opcodes_h_l1367_c11_74e0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1367_c7_453b
result_is_stack_write_MUX_uxn_opcodes_h_l1367_c7_453b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1367_c7_453b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1367_c7_453b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1367_c7_453b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1367_c7_453b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1367_c7_453b
result_is_opc_done_MUX_uxn_opcodes_h_l1367_c7_453b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1367_c7_453b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1367_c7_453b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1367_c7_453b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1367_c7_453b_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1341_c6_85f9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1341_c1_5d4e_return_output,
 t8_MUX_uxn_opcodes_h_l1341_c2_9b1c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1341_c2_9b1c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c2_9b1c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c2_9b1c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1341_c2_9b1c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1341_c2_9b1c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c2_9b1c_return_output,
 n8_MUX_uxn_opcodes_h_l1341_c2_9b1c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1346_c11_91bf_return_output,
 t8_MUX_uxn_opcodes_h_l1346_c7_294c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1346_c7_294c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1346_c7_294c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1346_c7_294c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1346_c7_294c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1346_c7_294c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1346_c7_294c_return_output,
 n8_MUX_uxn_opcodes_h_l1346_c7_294c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1349_c11_8622_return_output,
 t8_MUX_uxn_opcodes_h_l1349_c7_ef15_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1349_c7_ef15_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1349_c7_ef15_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1349_c7_ef15_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1349_c7_ef15_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1349_c7_ef15_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1349_c7_ef15_return_output,
 n8_MUX_uxn_opcodes_h_l1349_c7_ef15_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1353_c11_9439_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_c012_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_c012_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_c012_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_c012_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1353_c7_c012_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_c012_return_output,
 n8_MUX_uxn_opcodes_h_l1353_c7_c012_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1356_c11_5339_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1356_c7_5763_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1356_c7_5763_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1356_c7_5763_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1356_c7_5763_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1356_c7_5763_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1356_c7_5763_return_output,
 n8_MUX_uxn_opcodes_h_l1356_c7_5763_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1359_c32_b9a2_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1359_c32_ff03_return_output,
 MUX_uxn_opcodes_h_l1359_c32_84fd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1361_c11_27ed_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_f12a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_f12a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_f12a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1361_c7_f12a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_f12a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1365_c24_4779_return_output,
 MUX_uxn_opcodes_h_l1365_c24_467c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1367_c11_74e0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1367_c7_453b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1367_c7_453b_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1341_c6_85f9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1341_c6_85f9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1341_c6_85f9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1341_c1_5d4e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1341_c1_5d4e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1341_c1_5d4e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1341_c1_5d4e_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1341_c2_9b1c_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1341_c2_9b1c_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1346_c7_294c_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1341_c2_9b1c_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1341_c2_9b1c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1341_c2_9b1c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1341_c2_9b1c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1346_c7_294c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1341_c2_9b1c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1341_c2_9b1c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c2_9b1c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1343_c3_0df3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c2_9b1c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1346_c7_294c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c2_9b1c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c2_9b1c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c2_9b1c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c2_9b1c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1346_c7_294c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c2_9b1c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c2_9b1c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1341_c2_9b1c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1341_c2_9b1c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1346_c7_294c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1341_c2_9b1c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1341_c2_9b1c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1341_c2_9b1c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1341_c2_9b1c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1346_c7_294c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1341_c2_9b1c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1341_c2_9b1c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c2_9b1c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c2_9b1c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1346_c7_294c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c2_9b1c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c2_9b1c_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1341_c2_9b1c_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1341_c2_9b1c_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1346_c7_294c_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1341_c2_9b1c_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1341_c2_9b1c_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1342_c3_b425_uxn_opcodes_h_l1342_c3_b425_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1346_c11_91bf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1346_c11_91bf_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1346_c11_91bf_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1346_c7_294c_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1346_c7_294c_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1349_c7_ef15_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1346_c7_294c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1346_c7_294c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1346_c7_294c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1349_c7_ef15_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1346_c7_294c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1346_c7_294c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1347_c3_e08c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1346_c7_294c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1349_c7_ef15_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1346_c7_294c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1346_c7_294c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1346_c7_294c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1349_c7_ef15_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1346_c7_294c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1346_c7_294c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1346_c7_294c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1349_c7_ef15_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1346_c7_294c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1346_c7_294c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1346_c7_294c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1349_c7_ef15_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1346_c7_294c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1346_c7_294c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1346_c7_294c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1349_c7_ef15_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1346_c7_294c_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1346_c7_294c_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1346_c7_294c_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1349_c7_ef15_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1346_c7_294c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1349_c11_8622_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1349_c11_8622_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1349_c11_8622_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1349_c7_ef15_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1349_c7_ef15_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1349_c7_ef15_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1349_c7_ef15_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1349_c7_ef15_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_c012_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1349_c7_ef15_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1349_c7_ef15_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1351_c3_5b6d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1349_c7_ef15_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_c012_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1349_c7_ef15_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1349_c7_ef15_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1349_c7_ef15_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_c012_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1349_c7_ef15_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1349_c7_ef15_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1349_c7_ef15_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_c012_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1349_c7_ef15_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1349_c7_ef15_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1349_c7_ef15_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1353_c7_c012_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1349_c7_ef15_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1349_c7_ef15_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1349_c7_ef15_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_c012_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1349_c7_ef15_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1349_c7_ef15_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1349_c7_ef15_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1353_c7_c012_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1349_c7_ef15_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c11_9439_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c11_9439_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c11_9439_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_c012_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_c012_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1356_c7_5763_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_c012_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_c012_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1354_c3_eb9e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_c012_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1356_c7_5763_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_c012_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_c012_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_c012_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1356_c7_5763_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_c012_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_c012_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_c012_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1356_c7_5763_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_c012_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1353_c7_c012_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1353_c7_c012_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1356_c7_5763_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1353_c7_c012_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_c012_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_c012_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1356_c7_5763_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_c012_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1353_c7_c012_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1353_c7_c012_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1356_c7_5763_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1353_c7_c012_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1356_c11_5339_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1356_c11_5339_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1356_c11_5339_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1356_c7_5763_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1356_c7_5763_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_f12a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1356_c7_5763_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1356_c7_5763_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1356_c7_5763_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_f12a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1356_c7_5763_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1356_c7_5763_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1356_c7_5763_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1356_c7_5763_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1356_c7_5763_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1356_c7_5763_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_f12a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1356_c7_5763_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1356_c7_5763_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1356_c7_5763_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1361_c7_f12a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1356_c7_5763_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1356_c7_5763_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1356_c7_5763_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_f12a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1356_c7_5763_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1356_c7_5763_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1356_c7_5763_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1356_c7_5763_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1359_c32_84fd_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1359_c32_84fd_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1359_c32_84fd_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1359_c32_b9a2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1359_c32_b9a2_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1359_c32_b9a2_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1359_c32_ff03_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1359_c32_ff03_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1359_c32_ff03_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1359_c32_84fd_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1361_c11_27ed_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1361_c11_27ed_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1361_c11_27ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_f12a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_f12a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1367_c7_453b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_f12a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_f12a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1364_c3_faf9 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_f12a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_f12a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_f12a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_f12a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1367_c7_453b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_f12a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1361_c7_f12a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1361_c7_f12a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1361_c7_f12a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_f12a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_f12a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_f12a_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1365_c24_467c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1365_c24_467c_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1365_c24_467c_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1365_c24_4779_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1365_c24_4779_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1365_c24_4779_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1365_c24_467c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1367_c11_74e0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1367_c11_74e0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1367_c11_74e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1367_c7_453b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1367_c7_453b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1367_c7_453b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1367_c7_453b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1367_c7_453b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1367_c7_453b_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1356_l1353_l1349_l1346_l1341_l1367_DUPLICATE_1980_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1356_l1353_l1349_l1346_l1341_DUPLICATE_84c0_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1361_l1356_l1353_l1349_l1346_l1341_DUPLICATE_e6ba_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1361_l1353_l1349_l1346_l1341_DUPLICATE_04d2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1361_l1356_l1353_l1349_l1346_l1367_DUPLICATE_c18e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1361_l1356_DUPLICATE_4458_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l1372_l1337_DUPLICATE_5847_return_output : opcode_result_t;
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
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1367_c7_453b_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1365_c24_467c_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1349_c11_8622_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1367_c7_453b_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1354_c3_eb9e := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_c012_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1354_c3_eb9e;
     VAR_MUX_uxn_opcodes_h_l1359_c32_84fd_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1341_c2_9b1c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c11_9439_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1361_c11_27ed_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1346_c11_91bf_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1341_c6_85f9_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1351_c3_5b6d := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1349_c7_ef15_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1351_c3_5b6d;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1347_c3_e08c := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1346_c7_294c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1347_c3_e08c;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1364_c3_faf9 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_f12a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1364_c3_faf9;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1341_c1_5d4e_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1359_c32_84fd_iffalse := resize(to_signed(-1, 2), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1356_c11_5339_right := to_unsigned(4, 3);
     VAR_MUX_uxn_opcodes_h_l1365_c24_467c_iffalse := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1343_c3_0df3 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c2_9b1c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1343_c3_0df3;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1356_c7_5763_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1367_c11_74e0_right := to_unsigned(6, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_f12a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1359_c32_ff03_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_f12a_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1359_c32_b9a2_right := to_unsigned(128, 8);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1341_c1_5d4e_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1359_c32_b9a2_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1365_c24_4779_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1341_c2_9b1c_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1346_c7_294c_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1349_c7_ef15_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1353_c7_c012_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1356_c7_5763_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1341_c6_85f9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1346_c11_91bf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1349_c11_8622_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c11_9439_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1356_c11_5339_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1361_c11_27ed_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1367_c11_74e0_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l1356_c7_5763_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1349_c7_ef15_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1365_c24_4779_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1341_c2_9b1c_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1346_c7_294c_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1349_c7_ef15_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1341_c6_85f9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1341_c6_85f9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1341_c6_85f9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1341_c6_85f9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1341_c6_85f9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1341_c6_85f9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1341_c6_85f9_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1359_c32_b9a2] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1359_c32_b9a2_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1359_c32_b9a2_left;
     BIN_OP_AND_uxn_opcodes_h_l1359_c32_b9a2_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1359_c32_b9a2_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1359_c32_b9a2_return_output := BIN_OP_AND_uxn_opcodes_h_l1359_c32_b9a2_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1361_l1356_l1353_l1349_l1346_l1367_DUPLICATE_c18e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1361_l1356_l1353_l1349_l1346_l1367_DUPLICATE_c18e_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1367_c11_74e0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1367_c11_74e0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1367_c11_74e0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1367_c11_74e0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1367_c11_74e0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1367_c11_74e0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1367_c11_74e0_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1361_l1356_DUPLICATE_4458 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1361_l1356_DUPLICATE_4458_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1349_c11_8622] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1349_c11_8622_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1349_c11_8622_left;
     BIN_OP_EQ_uxn_opcodes_h_l1349_c11_8622_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1349_c11_8622_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1349_c11_8622_return_output := BIN_OP_EQ_uxn_opcodes_h_l1349_c11_8622_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1365_c24_4779] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1365_c24_4779_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1365_c24_4779_left;
     BIN_OP_EQ_uxn_opcodes_h_l1365_c24_4779_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1365_c24_4779_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1365_c24_4779_return_output := BIN_OP_EQ_uxn_opcodes_h_l1365_c24_4779_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1361_l1353_l1349_l1346_l1341_DUPLICATE_04d2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1361_l1353_l1349_l1346_l1341_DUPLICATE_04d2_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1361_l1356_l1353_l1349_l1346_l1341_DUPLICATE_e6ba LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1361_l1356_l1353_l1349_l1346_l1341_DUPLICATE_e6ba_return_output := result.stack_value;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1356_l1353_l1349_l1346_l1341_DUPLICATE_84c0 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1356_l1353_l1349_l1346_l1341_DUPLICATE_84c0_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1353_c11_9439] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1353_c11_9439_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c11_9439_left;
     BIN_OP_EQ_uxn_opcodes_h_l1353_c11_9439_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c11_9439_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c11_9439_return_output := BIN_OP_EQ_uxn_opcodes_h_l1353_c11_9439_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1356_l1353_l1349_l1346_l1341_l1367_DUPLICATE_1980 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1356_l1353_l1349_l1346_l1341_l1367_DUPLICATE_1980_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1361_c11_27ed] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1361_c11_27ed_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1361_c11_27ed_left;
     BIN_OP_EQ_uxn_opcodes_h_l1361_c11_27ed_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1361_c11_27ed_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1361_c11_27ed_return_output := BIN_OP_EQ_uxn_opcodes_h_l1361_c11_27ed_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1356_c11_5339] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1356_c11_5339_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1356_c11_5339_left;
     BIN_OP_EQ_uxn_opcodes_h_l1356_c11_5339_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1356_c11_5339_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1356_c11_5339_return_output := BIN_OP_EQ_uxn_opcodes_h_l1356_c11_5339_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1346_c11_91bf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1346_c11_91bf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1346_c11_91bf_left;
     BIN_OP_EQ_uxn_opcodes_h_l1346_c11_91bf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1346_c11_91bf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1346_c11_91bf_return_output := BIN_OP_EQ_uxn_opcodes_h_l1346_c11_91bf_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1359_c32_ff03_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1359_c32_b9a2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1341_c1_5d4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1341_c6_85f9_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1341_c2_9b1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1341_c6_85f9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1341_c2_9b1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1341_c6_85f9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c2_9b1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1341_c6_85f9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1341_c2_9b1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1341_c6_85f9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c2_9b1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1341_c6_85f9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c2_9b1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1341_c6_85f9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1341_c2_9b1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1341_c6_85f9_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1341_c2_9b1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1341_c6_85f9_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1346_c7_294c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1346_c11_91bf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1346_c7_294c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1346_c11_91bf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1346_c7_294c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1346_c11_91bf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1346_c7_294c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1346_c11_91bf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1346_c7_294c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1346_c11_91bf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1346_c7_294c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1346_c11_91bf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1346_c7_294c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1346_c11_91bf_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1346_c7_294c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1346_c11_91bf_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1349_c7_ef15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1349_c11_8622_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1349_c7_ef15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1349_c11_8622_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1349_c7_ef15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1349_c11_8622_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1349_c7_ef15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1349_c11_8622_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1349_c7_ef15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1349_c11_8622_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1349_c7_ef15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1349_c11_8622_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1349_c7_ef15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1349_c11_8622_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1349_c7_ef15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1349_c11_8622_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1353_c7_c012_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c11_9439_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_c012_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c11_9439_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_c012_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c11_9439_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_c012_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c11_9439_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_c012_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c11_9439_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_c012_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c11_9439_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1353_c7_c012_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c11_9439_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1356_c7_5763_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1356_c11_5339_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1356_c7_5763_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1356_c11_5339_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1356_c7_5763_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1356_c11_5339_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1356_c7_5763_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1356_c11_5339_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1356_c7_5763_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1356_c11_5339_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1356_c7_5763_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1356_c11_5339_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1356_c7_5763_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1356_c11_5339_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_f12a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1361_c11_27ed_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_f12a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1361_c11_27ed_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_f12a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1361_c11_27ed_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_f12a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1361_c11_27ed_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1361_c7_f12a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1361_c11_27ed_return_output;
     VAR_MUX_uxn_opcodes_h_l1365_c24_467c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1365_c24_4779_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1367_c7_453b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1367_c11_74e0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1367_c7_453b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1367_c11_74e0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c2_9b1c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1356_l1353_l1349_l1346_l1341_DUPLICATE_84c0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1346_c7_294c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1356_l1353_l1349_l1346_l1341_DUPLICATE_84c0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1349_c7_ef15_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1356_l1353_l1349_l1346_l1341_DUPLICATE_84c0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_c012_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1356_l1353_l1349_l1346_l1341_DUPLICATE_84c0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1356_c7_5763_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1356_l1353_l1349_l1346_l1341_DUPLICATE_84c0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1346_c7_294c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1361_l1356_l1353_l1349_l1346_l1367_DUPLICATE_c18e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1349_c7_ef15_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1361_l1356_l1353_l1349_l1346_l1367_DUPLICATE_c18e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_c012_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1361_l1356_l1353_l1349_l1346_l1367_DUPLICATE_c18e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1356_c7_5763_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1361_l1356_l1353_l1349_l1346_l1367_DUPLICATE_c18e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_f12a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1361_l1356_l1353_l1349_l1346_l1367_DUPLICATE_c18e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1367_c7_453b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1361_l1356_l1353_l1349_l1346_l1367_DUPLICATE_c18e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c2_9b1c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1361_l1353_l1349_l1346_l1341_DUPLICATE_04d2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1346_c7_294c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1361_l1353_l1349_l1346_l1341_DUPLICATE_04d2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1349_c7_ef15_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1361_l1353_l1349_l1346_l1341_DUPLICATE_04d2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_c012_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1361_l1353_l1349_l1346_l1341_DUPLICATE_04d2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_f12a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1361_l1353_l1349_l1346_l1341_DUPLICATE_04d2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1341_c2_9b1c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1356_l1353_l1349_l1346_l1341_l1367_DUPLICATE_1980_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1346_c7_294c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1356_l1353_l1349_l1346_l1341_l1367_DUPLICATE_1980_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1349_c7_ef15_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1356_l1353_l1349_l1346_l1341_l1367_DUPLICATE_1980_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_c012_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1356_l1353_l1349_l1346_l1341_l1367_DUPLICATE_1980_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1356_c7_5763_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1356_l1353_l1349_l1346_l1341_l1367_DUPLICATE_1980_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1367_c7_453b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1356_l1353_l1349_l1346_l1341_l1367_DUPLICATE_1980_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1356_c7_5763_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1361_l1356_DUPLICATE_4458_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_f12a_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1361_l1356_DUPLICATE_4458_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1341_c2_9b1c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1361_l1356_l1353_l1349_l1346_l1341_DUPLICATE_e6ba_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1346_c7_294c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1361_l1356_l1353_l1349_l1346_l1341_DUPLICATE_e6ba_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1349_c7_ef15_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1361_l1356_l1353_l1349_l1346_l1341_DUPLICATE_e6ba_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1353_c7_c012_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1361_l1356_l1353_l1349_l1346_l1341_DUPLICATE_e6ba_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1356_c7_5763_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1361_l1356_l1353_l1349_l1346_l1341_DUPLICATE_e6ba_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1361_c7_f12a_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1361_l1356_l1353_l1349_l1346_l1341_DUPLICATE_e6ba_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1367_c7_453b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1367_c7_453b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1367_c7_453b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1367_c7_453b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1367_c7_453b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1367_c7_453b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1367_c7_453b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1367_c7_453b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1367_c7_453b_return_output;

     -- MUX[uxn_opcodes_h_l1365_c24_467c] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1365_c24_467c_cond <= VAR_MUX_uxn_opcodes_h_l1365_c24_467c_cond;
     MUX_uxn_opcodes_h_l1365_c24_467c_iftrue <= VAR_MUX_uxn_opcodes_h_l1365_c24_467c_iftrue;
     MUX_uxn_opcodes_h_l1365_c24_467c_iffalse <= VAR_MUX_uxn_opcodes_h_l1365_c24_467c_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1365_c24_467c_return_output := MUX_uxn_opcodes_h_l1365_c24_467c_return_output;

     -- n8_MUX[uxn_opcodes_h_l1356_c7_5763] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1356_c7_5763_cond <= VAR_n8_MUX_uxn_opcodes_h_l1356_c7_5763_cond;
     n8_MUX_uxn_opcodes_h_l1356_c7_5763_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1356_c7_5763_iftrue;
     n8_MUX_uxn_opcodes_h_l1356_c7_5763_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1356_c7_5763_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1356_c7_5763_return_output := n8_MUX_uxn_opcodes_h_l1356_c7_5763_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1361_c7_f12a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_f12a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_f12a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_f12a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_f12a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_f12a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_f12a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_f12a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_f12a_return_output;

     -- t8_MUX[uxn_opcodes_h_l1349_c7_ef15] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1349_c7_ef15_cond <= VAR_t8_MUX_uxn_opcodes_h_l1349_c7_ef15_cond;
     t8_MUX_uxn_opcodes_h_l1349_c7_ef15_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1349_c7_ef15_iftrue;
     t8_MUX_uxn_opcodes_h_l1349_c7_ef15_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1349_c7_ef15_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1349_c7_ef15_return_output := t8_MUX_uxn_opcodes_h_l1349_c7_ef15_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1361_c7_f12a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_f12a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_f12a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_f12a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_f12a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_f12a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_f12a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_f12a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_f12a_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1359_c32_ff03] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1359_c32_ff03_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1359_c32_ff03_left;
     BIN_OP_GT_uxn_opcodes_h_l1359_c32_ff03_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1359_c32_ff03_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1359_c32_ff03_return_output := BIN_OP_GT_uxn_opcodes_h_l1359_c32_ff03_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1341_c1_5d4e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1341_c1_5d4e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1341_c1_5d4e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1341_c1_5d4e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1341_c1_5d4e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1341_c1_5d4e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1341_c1_5d4e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1341_c1_5d4e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1341_c1_5d4e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1367_c7_453b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1367_c7_453b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1367_c7_453b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1367_c7_453b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1367_c7_453b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1367_c7_453b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1367_c7_453b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1367_c7_453b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1367_c7_453b_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1359_c32_84fd_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1359_c32_ff03_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1361_c7_f12a_iftrue := VAR_MUX_uxn_opcodes_h_l1365_c24_467c_return_output;
     VAR_printf_uxn_opcodes_h_l1342_c3_b425_uxn_opcodes_h_l1342_c3_b425_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1341_c1_5d4e_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1353_c7_c012_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1356_c7_5763_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_f12a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1367_c7_453b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1356_c7_5763_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_f12a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_f12a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1367_c7_453b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1356_c7_5763_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_f12a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1346_c7_294c_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1349_c7_ef15_return_output;
     -- t8_MUX[uxn_opcodes_h_l1346_c7_294c] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1346_c7_294c_cond <= VAR_t8_MUX_uxn_opcodes_h_l1346_c7_294c_cond;
     t8_MUX_uxn_opcodes_h_l1346_c7_294c_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1346_c7_294c_iftrue;
     t8_MUX_uxn_opcodes_h_l1346_c7_294c_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1346_c7_294c_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1346_c7_294c_return_output := t8_MUX_uxn_opcodes_h_l1346_c7_294c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1361_c7_f12a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_f12a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_f12a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_f12a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_f12a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_f12a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_f12a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_f12a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_f12a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1356_c7_5763] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1356_c7_5763_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1356_c7_5763_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1356_c7_5763_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1356_c7_5763_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1356_c7_5763_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1356_c7_5763_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1356_c7_5763_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1356_c7_5763_return_output;

     -- n8_MUX[uxn_opcodes_h_l1353_c7_c012] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1353_c7_c012_cond <= VAR_n8_MUX_uxn_opcodes_h_l1353_c7_c012_cond;
     n8_MUX_uxn_opcodes_h_l1353_c7_c012_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1353_c7_c012_iftrue;
     n8_MUX_uxn_opcodes_h_l1353_c7_c012_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1353_c7_c012_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1353_c7_c012_return_output := n8_MUX_uxn_opcodes_h_l1353_c7_c012_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1361_c7_f12a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_f12a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_f12a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_f12a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_f12a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_f12a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_f12a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_f12a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_f12a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1361_c7_f12a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1361_c7_f12a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1361_c7_f12a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1361_c7_f12a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1361_c7_f12a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1361_c7_f12a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1361_c7_f12a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1361_c7_f12a_return_output := result_stack_value_MUX_uxn_opcodes_h_l1361_c7_f12a_return_output;

     -- printf_uxn_opcodes_h_l1342_c3_b425[uxn_opcodes_h_l1342_c3_b425] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1342_c3_b425_uxn_opcodes_h_l1342_c3_b425_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1342_c3_b425_uxn_opcodes_h_l1342_c3_b425_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1356_c7_5763] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1356_c7_5763_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1356_c7_5763_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1356_c7_5763_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1356_c7_5763_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1356_c7_5763_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1356_c7_5763_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1356_c7_5763_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1356_c7_5763_return_output;

     -- MUX[uxn_opcodes_h_l1359_c32_84fd] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1359_c32_84fd_cond <= VAR_MUX_uxn_opcodes_h_l1359_c32_84fd_cond;
     MUX_uxn_opcodes_h_l1359_c32_84fd_iftrue <= VAR_MUX_uxn_opcodes_h_l1359_c32_84fd_iftrue;
     MUX_uxn_opcodes_h_l1359_c32_84fd_iffalse <= VAR_MUX_uxn_opcodes_h_l1359_c32_84fd_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1359_c32_84fd_return_output := MUX_uxn_opcodes_h_l1359_c32_84fd_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1356_c7_5763_iftrue := VAR_MUX_uxn_opcodes_h_l1359_c32_84fd_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1349_c7_ef15_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1353_c7_c012_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1356_c7_5763_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_f12a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_c012_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1356_c7_5763_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1356_c7_5763_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_f12a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_c012_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1356_c7_5763_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1356_c7_5763_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1361_c7_f12a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1341_c2_9b1c_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1346_c7_294c_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1353_c7_c012] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_c012_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_c012_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_c012_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_c012_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_c012_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_c012_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_c012_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_c012_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1356_c7_5763] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1356_c7_5763_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1356_c7_5763_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1356_c7_5763_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1356_c7_5763_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1356_c7_5763_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1356_c7_5763_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1356_c7_5763_return_output := result_stack_value_MUX_uxn_opcodes_h_l1356_c7_5763_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1353_c7_c012] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_c012_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_c012_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_c012_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_c012_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_c012_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_c012_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_c012_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_c012_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1356_c7_5763] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1356_c7_5763_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1356_c7_5763_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1356_c7_5763_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1356_c7_5763_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1356_c7_5763_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1356_c7_5763_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1356_c7_5763_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1356_c7_5763_return_output;

     -- t8_MUX[uxn_opcodes_h_l1341_c2_9b1c] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1341_c2_9b1c_cond <= VAR_t8_MUX_uxn_opcodes_h_l1341_c2_9b1c_cond;
     t8_MUX_uxn_opcodes_h_l1341_c2_9b1c_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1341_c2_9b1c_iftrue;
     t8_MUX_uxn_opcodes_h_l1341_c2_9b1c_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1341_c2_9b1c_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1341_c2_9b1c_return_output := t8_MUX_uxn_opcodes_h_l1341_c2_9b1c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1356_c7_5763] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1356_c7_5763_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1356_c7_5763_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1356_c7_5763_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1356_c7_5763_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1356_c7_5763_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1356_c7_5763_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1356_c7_5763_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1356_c7_5763_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1356_c7_5763] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1356_c7_5763_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1356_c7_5763_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1356_c7_5763_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1356_c7_5763_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1356_c7_5763_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1356_c7_5763_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1356_c7_5763_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1356_c7_5763_return_output;

     -- n8_MUX[uxn_opcodes_h_l1349_c7_ef15] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1349_c7_ef15_cond <= VAR_n8_MUX_uxn_opcodes_h_l1349_c7_ef15_cond;
     n8_MUX_uxn_opcodes_h_l1349_c7_ef15_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1349_c7_ef15_iftrue;
     n8_MUX_uxn_opcodes_h_l1349_c7_ef15_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1349_c7_ef15_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1349_c7_ef15_return_output := n8_MUX_uxn_opcodes_h_l1349_c7_ef15_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1346_c7_294c_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1349_c7_ef15_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_c012_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1356_c7_5763_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1349_c7_ef15_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c7_c012_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_c012_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1356_c7_5763_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_c012_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1356_c7_5763_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1349_c7_ef15_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_c012_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1353_c7_c012_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1356_c7_5763_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1341_c2_9b1c_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1349_c7_ef15] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1349_c7_ef15_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1349_c7_ef15_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1349_c7_ef15_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1349_c7_ef15_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1349_c7_ef15_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1349_c7_ef15_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1349_c7_ef15_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1349_c7_ef15_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1353_c7_c012] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1353_c7_c012_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1353_c7_c012_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1353_c7_c012_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1353_c7_c012_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1353_c7_c012_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1353_c7_c012_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1353_c7_c012_return_output := result_stack_value_MUX_uxn_opcodes_h_l1353_c7_c012_return_output;

     -- n8_MUX[uxn_opcodes_h_l1346_c7_294c] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1346_c7_294c_cond <= VAR_n8_MUX_uxn_opcodes_h_l1346_c7_294c_cond;
     n8_MUX_uxn_opcodes_h_l1346_c7_294c_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1346_c7_294c_iftrue;
     n8_MUX_uxn_opcodes_h_l1346_c7_294c_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1346_c7_294c_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1346_c7_294c_return_output := n8_MUX_uxn_opcodes_h_l1346_c7_294c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1353_c7_c012] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_c012_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_c012_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_c012_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_c012_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_c012_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_c012_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_c012_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_c012_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1349_c7_ef15] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1349_c7_ef15_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1349_c7_ef15_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1349_c7_ef15_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1349_c7_ef15_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1349_c7_ef15_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1349_c7_ef15_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1349_c7_ef15_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1349_c7_ef15_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1353_c7_c012] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_c012_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_c012_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_c012_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_c012_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_c012_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_c012_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_c012_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_c012_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1353_c7_c012] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_c012_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_c012_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_c012_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_c012_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_c012_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_c012_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_c012_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_c012_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l1341_c2_9b1c_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1346_c7_294c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1349_c7_ef15_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_c012_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1346_c7_294c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1349_c7_ef15_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1349_c7_ef15_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_c012_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1349_c7_ef15_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_c012_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1346_c7_294c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1349_c7_ef15_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1349_c7_ef15_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1353_c7_c012_return_output;
     -- n8_MUX[uxn_opcodes_h_l1341_c2_9b1c] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1341_c2_9b1c_cond <= VAR_n8_MUX_uxn_opcodes_h_l1341_c2_9b1c_cond;
     n8_MUX_uxn_opcodes_h_l1341_c2_9b1c_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1341_c2_9b1c_iftrue;
     n8_MUX_uxn_opcodes_h_l1341_c2_9b1c_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1341_c2_9b1c_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1341_c2_9b1c_return_output := n8_MUX_uxn_opcodes_h_l1341_c2_9b1c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1346_c7_294c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1346_c7_294c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1346_c7_294c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1346_c7_294c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1346_c7_294c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1346_c7_294c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1346_c7_294c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1346_c7_294c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1346_c7_294c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1349_c7_ef15] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1349_c7_ef15_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1349_c7_ef15_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1349_c7_ef15_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1349_c7_ef15_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1349_c7_ef15_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1349_c7_ef15_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1349_c7_ef15_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1349_c7_ef15_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1346_c7_294c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1346_c7_294c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1346_c7_294c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1346_c7_294c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1346_c7_294c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1346_c7_294c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1346_c7_294c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1346_c7_294c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1346_c7_294c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1349_c7_ef15] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1349_c7_ef15_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1349_c7_ef15_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1349_c7_ef15_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1349_c7_ef15_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1349_c7_ef15_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1349_c7_ef15_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1349_c7_ef15_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1349_c7_ef15_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1349_c7_ef15] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1349_c7_ef15_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1349_c7_ef15_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1349_c7_ef15_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1349_c7_ef15_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1349_c7_ef15_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1349_c7_ef15_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1349_c7_ef15_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1349_c7_ef15_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1349_c7_ef15] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1349_c7_ef15_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1349_c7_ef15_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1349_c7_ef15_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1349_c7_ef15_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1349_c7_ef15_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1349_c7_ef15_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1349_c7_ef15_return_output := result_stack_value_MUX_uxn_opcodes_h_l1349_c7_ef15_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1341_c2_9b1c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1346_c7_294c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1349_c7_ef15_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c2_9b1c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1346_c7_294c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1346_c7_294c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1349_c7_ef15_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1346_c7_294c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1349_c7_ef15_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c2_9b1c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1346_c7_294c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1346_c7_294c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1349_c7_ef15_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1341_c2_9b1c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c2_9b1c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c2_9b1c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c2_9b1c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c2_9b1c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c2_9b1c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c2_9b1c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c2_9b1c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c2_9b1c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1346_c7_294c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1346_c7_294c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1346_c7_294c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1346_c7_294c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1346_c7_294c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1346_c7_294c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1346_c7_294c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1346_c7_294c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1346_c7_294c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1341_c2_9b1c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c2_9b1c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c2_9b1c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c2_9b1c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c2_9b1c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c2_9b1c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c2_9b1c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c2_9b1c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c2_9b1c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1346_c7_294c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1346_c7_294c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1346_c7_294c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1346_c7_294c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1346_c7_294c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1346_c7_294c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1346_c7_294c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1346_c7_294c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1346_c7_294c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1346_c7_294c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1346_c7_294c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1346_c7_294c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1346_c7_294c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1346_c7_294c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1346_c7_294c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1346_c7_294c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1346_c7_294c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1346_c7_294c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1346_c7_294c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1346_c7_294c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1346_c7_294c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1346_c7_294c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1346_c7_294c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1346_c7_294c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1346_c7_294c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1346_c7_294c_return_output := result_stack_value_MUX_uxn_opcodes_h_l1346_c7_294c_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1341_c2_9b1c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1346_c7_294c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1341_c2_9b1c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1346_c7_294c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c2_9b1c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1346_c7_294c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1341_c2_9b1c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1346_c7_294c_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1341_c2_9b1c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1341_c2_9b1c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1341_c2_9b1c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1341_c2_9b1c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1341_c2_9b1c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1341_c2_9b1c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1341_c2_9b1c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1341_c2_9b1c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1341_c2_9b1c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1341_c2_9b1c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1341_c2_9b1c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1341_c2_9b1c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1341_c2_9b1c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1341_c2_9b1c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1341_c2_9b1c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1341_c2_9b1c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1341_c2_9b1c_return_output := result_stack_value_MUX_uxn_opcodes_h_l1341_c2_9b1c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1341_c2_9b1c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c2_9b1c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c2_9b1c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c2_9b1c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c2_9b1c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c2_9b1c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c2_9b1c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c2_9b1c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c2_9b1c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1341_c2_9b1c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1341_c2_9b1c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1341_c2_9b1c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1341_c2_9b1c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1341_c2_9b1c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1341_c2_9b1c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1341_c2_9b1c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1341_c2_9b1c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1341_c2_9b1c_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l1372_l1337_DUPLICATE_5847 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l1372_l1337_DUPLICATE_5847_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_53ff(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1341_c2_9b1c_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c2_9b1c_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c2_9b1c_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1341_c2_9b1c_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1341_c2_9b1c_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c2_9b1c_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l1372_l1337_DUPLICATE_5847_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l1372_l1337_DUPLICATE_5847_return_output;
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
