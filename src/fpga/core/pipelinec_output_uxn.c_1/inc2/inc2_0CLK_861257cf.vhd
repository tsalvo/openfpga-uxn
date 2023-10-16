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
-- Submodules: 65
entity inc2_0CLK_861257cf is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end inc2_0CLK_861257cf;
architecture arch of inc2_0CLK_861257cf is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1431_c6_9273]
signal BIN_OP_EQ_uxn_opcodes_h_l1431_c6_9273_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1431_c6_9273_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1431_c6_9273_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1431_c1_3fff]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1431_c1_3fff_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1431_c1_3fff_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1431_c1_3fff_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1431_c1_3fff_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1431_c2_f5eb]
signal tmp16_MUX_uxn_opcodes_h_l1431_c2_f5eb_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1431_c2_f5eb_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1431_c2_f5eb_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1431_c2_f5eb_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1431_c2_f5eb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c2_f5eb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c2_f5eb_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c2_f5eb_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c2_f5eb_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1431_c2_f5eb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c2_f5eb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c2_f5eb_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c2_f5eb_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c2_f5eb_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1431_c2_f5eb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c2_f5eb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c2_f5eb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c2_f5eb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c2_f5eb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1431_c2_f5eb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1431_c2_f5eb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1431_c2_f5eb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1431_c2_f5eb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1431_c2_f5eb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1431_c2_f5eb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1431_c2_f5eb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1431_c2_f5eb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1431_c2_f5eb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1431_c2_f5eb_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1431_c2_f5eb]
signal result_u8_value_MUX_uxn_opcodes_h_l1431_c2_f5eb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1431_c2_f5eb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1431_c2_f5eb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1431_c2_f5eb_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1431_c2_f5eb]
signal t16_MUX_uxn_opcodes_h_l1431_c2_f5eb_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1431_c2_f5eb_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1431_c2_f5eb_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1431_c2_f5eb_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1432_c3_1fc1[uxn_opcodes_h_l1432_c3_1fc1]
signal printf_uxn_opcodes_h_l1432_c3_1fc1_uxn_opcodes_h_l1432_c3_1fc1_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1436_c11_af59]
signal BIN_OP_EQ_uxn_opcodes_h_l1436_c11_af59_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1436_c11_af59_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1436_c11_af59_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1436_c7_4630]
signal tmp16_MUX_uxn_opcodes_h_l1436_c7_4630_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1436_c7_4630_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1436_c7_4630_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1436_c7_4630_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1436_c7_4630]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_4630_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_4630_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_4630_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_4630_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1436_c7_4630]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_4630_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_4630_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_4630_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_4630_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1436_c7_4630]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1436_c7_4630_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1436_c7_4630_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1436_c7_4630_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1436_c7_4630_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1436_c7_4630]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_4630_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_4630_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_4630_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_4630_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1436_c7_4630]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_4630_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_4630_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_4630_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_4630_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1436_c7_4630]
signal result_u8_value_MUX_uxn_opcodes_h_l1436_c7_4630_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1436_c7_4630_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1436_c7_4630_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1436_c7_4630_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1436_c7_4630]
signal t16_MUX_uxn_opcodes_h_l1436_c7_4630_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1436_c7_4630_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1436_c7_4630_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1436_c7_4630_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1439_c11_364f]
signal BIN_OP_EQ_uxn_opcodes_h_l1439_c11_364f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1439_c11_364f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1439_c11_364f_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1439_c7_3e02]
signal tmp16_MUX_uxn_opcodes_h_l1439_c7_3e02_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1439_c7_3e02_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1439_c7_3e02_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1439_c7_3e02_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1439_c7_3e02]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_3e02_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_3e02_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_3e02_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_3e02_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1439_c7_3e02]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_3e02_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_3e02_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_3e02_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_3e02_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1439_c7_3e02]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_3e02_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_3e02_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_3e02_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_3e02_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1439_c7_3e02]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_3e02_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_3e02_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_3e02_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_3e02_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1439_c7_3e02]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_3e02_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_3e02_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_3e02_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_3e02_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1439_c7_3e02]
signal result_u8_value_MUX_uxn_opcodes_h_l1439_c7_3e02_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1439_c7_3e02_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1439_c7_3e02_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1439_c7_3e02_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1439_c7_3e02]
signal t16_MUX_uxn_opcodes_h_l1439_c7_3e02_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1439_c7_3e02_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1439_c7_3e02_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1439_c7_3e02_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1441_c3_5cf1]
signal CONST_SL_8_uxn_opcodes_h_l1441_c3_5cf1_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1441_c3_5cf1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1444_c11_476f]
signal BIN_OP_EQ_uxn_opcodes_h_l1444_c11_476f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1444_c11_476f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1444_c11_476f_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1444_c7_56a6]
signal tmp16_MUX_uxn_opcodes_h_l1444_c7_56a6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1444_c7_56a6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1444_c7_56a6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1444_c7_56a6_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1444_c7_56a6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_56a6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_56a6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_56a6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_56a6_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1444_c7_56a6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_56a6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_56a6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_56a6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_56a6_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1444_c7_56a6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_56a6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_56a6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_56a6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_56a6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1444_c7_56a6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_56a6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_56a6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_56a6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_56a6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1444_c7_56a6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_56a6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_56a6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_56a6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_56a6_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1444_c7_56a6]
signal result_u8_value_MUX_uxn_opcodes_h_l1444_c7_56a6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1444_c7_56a6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1444_c7_56a6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1444_c7_56a6_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1444_c7_56a6]
signal t16_MUX_uxn_opcodes_h_l1444_c7_56a6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1444_c7_56a6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1444_c7_56a6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1444_c7_56a6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1447_c11_75ec]
signal BIN_OP_EQ_uxn_opcodes_h_l1447_c11_75ec_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1447_c11_75ec_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1447_c11_75ec_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1447_c7_277f]
signal tmp16_MUX_uxn_opcodes_h_l1447_c7_277f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1447_c7_277f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1447_c7_277f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1447_c7_277f_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1447_c7_277f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_277f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_277f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_277f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_277f_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1447_c7_277f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_277f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_277f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_277f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_277f_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1447_c7_277f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_277f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_277f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_277f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_277f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1447_c7_277f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_277f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_277f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_277f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_277f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1447_c7_277f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_277f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_277f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_277f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_277f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1447_c7_277f]
signal result_u8_value_MUX_uxn_opcodes_h_l1447_c7_277f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1447_c7_277f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1447_c7_277f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1447_c7_277f_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1447_c7_277f]
signal t16_MUX_uxn_opcodes_h_l1447_c7_277f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1447_c7_277f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1447_c7_277f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1447_c7_277f_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1448_c3_0fae]
signal BIN_OP_OR_uxn_opcodes_h_l1448_c3_0fae_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1448_c3_0fae_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1448_c3_0fae_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1449_c11_e8fe]
signal BIN_OP_PLUS_uxn_opcodes_h_l1449_c11_e8fe_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1449_c11_e8fe_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1449_c11_e8fe_return_output : unsigned(16 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1451_c30_0766]
signal sp_relative_shift_uxn_opcodes_h_l1451_c30_0766_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1451_c30_0766_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1451_c30_0766_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1451_c30_0766_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1456_c11_2367]
signal BIN_OP_EQ_uxn_opcodes_h_l1456_c11_2367_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1456_c11_2367_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1456_c11_2367_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1456_c7_6e1d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1456_c7_6e1d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1456_c7_6e1d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1456_c7_6e1d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1456_c7_6e1d_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1456_c7_6e1d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1456_c7_6e1d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1456_c7_6e1d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1456_c7_6e1d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1456_c7_6e1d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1456_c7_6e1d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1456_c7_6e1d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1456_c7_6e1d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1456_c7_6e1d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1456_c7_6e1d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1456_c7_6e1d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1456_c7_6e1d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1456_c7_6e1d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1456_c7_6e1d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1456_c7_6e1d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1456_c7_6e1d]
signal result_u8_value_MUX_uxn_opcodes_h_l1456_c7_6e1d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1456_c7_6e1d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1456_c7_6e1d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1456_c7_6e1d_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1459_c31_d25c]
signal CONST_SR_8_uxn_opcodes_h_l1459_c31_d25c_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1459_c31_d25c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1461_c11_fa75]
signal BIN_OP_EQ_uxn_opcodes_h_l1461_c11_fa75_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1461_c11_fa75_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1461_c11_fa75_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1461_c7_6542]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_6542_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_6542_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_6542_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_6542_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1461_c7_6542]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_6542_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_6542_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_6542_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_6542_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1431_c6_9273
BIN_OP_EQ_uxn_opcodes_h_l1431_c6_9273 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1431_c6_9273_left,
BIN_OP_EQ_uxn_opcodes_h_l1431_c6_9273_right,
BIN_OP_EQ_uxn_opcodes_h_l1431_c6_9273_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1431_c1_3fff
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1431_c1_3fff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1431_c1_3fff_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1431_c1_3fff_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1431_c1_3fff_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1431_c1_3fff_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1431_c2_f5eb
tmp16_MUX_uxn_opcodes_h_l1431_c2_f5eb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1431_c2_f5eb_cond,
tmp16_MUX_uxn_opcodes_h_l1431_c2_f5eb_iftrue,
tmp16_MUX_uxn_opcodes_h_l1431_c2_f5eb_iffalse,
tmp16_MUX_uxn_opcodes_h_l1431_c2_f5eb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c2_f5eb
result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c2_f5eb : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c2_f5eb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c2_f5eb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c2_f5eb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c2_f5eb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c2_f5eb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c2_f5eb : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c2_f5eb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c2_f5eb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c2_f5eb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c2_f5eb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c2_f5eb
result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c2_f5eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c2_f5eb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c2_f5eb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c2_f5eb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c2_f5eb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1431_c2_f5eb
result_is_opc_done_MUX_uxn_opcodes_h_l1431_c2_f5eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1431_c2_f5eb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1431_c2_f5eb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1431_c2_f5eb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1431_c2_f5eb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1431_c2_f5eb
result_is_stack_write_MUX_uxn_opcodes_h_l1431_c2_f5eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1431_c2_f5eb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1431_c2_f5eb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1431_c2_f5eb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1431_c2_f5eb_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1431_c2_f5eb
result_u8_value_MUX_uxn_opcodes_h_l1431_c2_f5eb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1431_c2_f5eb_cond,
result_u8_value_MUX_uxn_opcodes_h_l1431_c2_f5eb_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1431_c2_f5eb_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1431_c2_f5eb_return_output);

-- t16_MUX_uxn_opcodes_h_l1431_c2_f5eb
t16_MUX_uxn_opcodes_h_l1431_c2_f5eb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1431_c2_f5eb_cond,
t16_MUX_uxn_opcodes_h_l1431_c2_f5eb_iftrue,
t16_MUX_uxn_opcodes_h_l1431_c2_f5eb_iffalse,
t16_MUX_uxn_opcodes_h_l1431_c2_f5eb_return_output);

-- printf_uxn_opcodes_h_l1432_c3_1fc1_uxn_opcodes_h_l1432_c3_1fc1
printf_uxn_opcodes_h_l1432_c3_1fc1_uxn_opcodes_h_l1432_c3_1fc1 : entity work.printf_uxn_opcodes_h_l1432_c3_1fc1_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1432_c3_1fc1_uxn_opcodes_h_l1432_c3_1fc1_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1436_c11_af59
BIN_OP_EQ_uxn_opcodes_h_l1436_c11_af59 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1436_c11_af59_left,
BIN_OP_EQ_uxn_opcodes_h_l1436_c11_af59_right,
BIN_OP_EQ_uxn_opcodes_h_l1436_c11_af59_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1436_c7_4630
tmp16_MUX_uxn_opcodes_h_l1436_c7_4630 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1436_c7_4630_cond,
tmp16_MUX_uxn_opcodes_h_l1436_c7_4630_iftrue,
tmp16_MUX_uxn_opcodes_h_l1436_c7_4630_iffalse,
tmp16_MUX_uxn_opcodes_h_l1436_c7_4630_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_4630
result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_4630 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_4630_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_4630_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_4630_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_4630_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_4630
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_4630 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_4630_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_4630_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_4630_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_4630_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1436_c7_4630
result_is_sp_shift_MUX_uxn_opcodes_h_l1436_c7_4630 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1436_c7_4630_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1436_c7_4630_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1436_c7_4630_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1436_c7_4630_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_4630
result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_4630 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_4630_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_4630_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_4630_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_4630_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_4630
result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_4630 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_4630_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_4630_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_4630_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_4630_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1436_c7_4630
result_u8_value_MUX_uxn_opcodes_h_l1436_c7_4630 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1436_c7_4630_cond,
result_u8_value_MUX_uxn_opcodes_h_l1436_c7_4630_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1436_c7_4630_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1436_c7_4630_return_output);

-- t16_MUX_uxn_opcodes_h_l1436_c7_4630
t16_MUX_uxn_opcodes_h_l1436_c7_4630 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1436_c7_4630_cond,
t16_MUX_uxn_opcodes_h_l1436_c7_4630_iftrue,
t16_MUX_uxn_opcodes_h_l1436_c7_4630_iffalse,
t16_MUX_uxn_opcodes_h_l1436_c7_4630_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1439_c11_364f
BIN_OP_EQ_uxn_opcodes_h_l1439_c11_364f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1439_c11_364f_left,
BIN_OP_EQ_uxn_opcodes_h_l1439_c11_364f_right,
BIN_OP_EQ_uxn_opcodes_h_l1439_c11_364f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1439_c7_3e02
tmp16_MUX_uxn_opcodes_h_l1439_c7_3e02 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1439_c7_3e02_cond,
tmp16_MUX_uxn_opcodes_h_l1439_c7_3e02_iftrue,
tmp16_MUX_uxn_opcodes_h_l1439_c7_3e02_iffalse,
tmp16_MUX_uxn_opcodes_h_l1439_c7_3e02_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_3e02
result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_3e02 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_3e02_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_3e02_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_3e02_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_3e02_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_3e02
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_3e02 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_3e02_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_3e02_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_3e02_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_3e02_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_3e02
result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_3e02 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_3e02_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_3e02_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_3e02_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_3e02_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_3e02
result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_3e02 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_3e02_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_3e02_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_3e02_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_3e02_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_3e02
result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_3e02 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_3e02_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_3e02_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_3e02_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_3e02_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1439_c7_3e02
result_u8_value_MUX_uxn_opcodes_h_l1439_c7_3e02 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1439_c7_3e02_cond,
result_u8_value_MUX_uxn_opcodes_h_l1439_c7_3e02_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1439_c7_3e02_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1439_c7_3e02_return_output);

-- t16_MUX_uxn_opcodes_h_l1439_c7_3e02
t16_MUX_uxn_opcodes_h_l1439_c7_3e02 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1439_c7_3e02_cond,
t16_MUX_uxn_opcodes_h_l1439_c7_3e02_iftrue,
t16_MUX_uxn_opcodes_h_l1439_c7_3e02_iffalse,
t16_MUX_uxn_opcodes_h_l1439_c7_3e02_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1441_c3_5cf1
CONST_SL_8_uxn_opcodes_h_l1441_c3_5cf1 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1441_c3_5cf1_x,
CONST_SL_8_uxn_opcodes_h_l1441_c3_5cf1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1444_c11_476f
BIN_OP_EQ_uxn_opcodes_h_l1444_c11_476f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1444_c11_476f_left,
BIN_OP_EQ_uxn_opcodes_h_l1444_c11_476f_right,
BIN_OP_EQ_uxn_opcodes_h_l1444_c11_476f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1444_c7_56a6
tmp16_MUX_uxn_opcodes_h_l1444_c7_56a6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1444_c7_56a6_cond,
tmp16_MUX_uxn_opcodes_h_l1444_c7_56a6_iftrue,
tmp16_MUX_uxn_opcodes_h_l1444_c7_56a6_iffalse,
tmp16_MUX_uxn_opcodes_h_l1444_c7_56a6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_56a6
result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_56a6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_56a6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_56a6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_56a6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_56a6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_56a6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_56a6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_56a6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_56a6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_56a6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_56a6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_56a6
result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_56a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_56a6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_56a6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_56a6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_56a6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_56a6
result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_56a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_56a6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_56a6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_56a6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_56a6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_56a6
result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_56a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_56a6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_56a6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_56a6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_56a6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1444_c7_56a6
result_u8_value_MUX_uxn_opcodes_h_l1444_c7_56a6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1444_c7_56a6_cond,
result_u8_value_MUX_uxn_opcodes_h_l1444_c7_56a6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1444_c7_56a6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1444_c7_56a6_return_output);

-- t16_MUX_uxn_opcodes_h_l1444_c7_56a6
t16_MUX_uxn_opcodes_h_l1444_c7_56a6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1444_c7_56a6_cond,
t16_MUX_uxn_opcodes_h_l1444_c7_56a6_iftrue,
t16_MUX_uxn_opcodes_h_l1444_c7_56a6_iffalse,
t16_MUX_uxn_opcodes_h_l1444_c7_56a6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1447_c11_75ec
BIN_OP_EQ_uxn_opcodes_h_l1447_c11_75ec : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1447_c11_75ec_left,
BIN_OP_EQ_uxn_opcodes_h_l1447_c11_75ec_right,
BIN_OP_EQ_uxn_opcodes_h_l1447_c11_75ec_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1447_c7_277f
tmp16_MUX_uxn_opcodes_h_l1447_c7_277f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1447_c7_277f_cond,
tmp16_MUX_uxn_opcodes_h_l1447_c7_277f_iftrue,
tmp16_MUX_uxn_opcodes_h_l1447_c7_277f_iffalse,
tmp16_MUX_uxn_opcodes_h_l1447_c7_277f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_277f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_277f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_277f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_277f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_277f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_277f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_277f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_277f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_277f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_277f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_277f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_277f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_277f
result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_277f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_277f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_277f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_277f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_277f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_277f
result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_277f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_277f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_277f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_277f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_277f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_277f
result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_277f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_277f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_277f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_277f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_277f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1447_c7_277f
result_u8_value_MUX_uxn_opcodes_h_l1447_c7_277f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1447_c7_277f_cond,
result_u8_value_MUX_uxn_opcodes_h_l1447_c7_277f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1447_c7_277f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1447_c7_277f_return_output);

-- t16_MUX_uxn_opcodes_h_l1447_c7_277f
t16_MUX_uxn_opcodes_h_l1447_c7_277f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1447_c7_277f_cond,
t16_MUX_uxn_opcodes_h_l1447_c7_277f_iftrue,
t16_MUX_uxn_opcodes_h_l1447_c7_277f_iffalse,
t16_MUX_uxn_opcodes_h_l1447_c7_277f_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1448_c3_0fae
BIN_OP_OR_uxn_opcodes_h_l1448_c3_0fae : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1448_c3_0fae_left,
BIN_OP_OR_uxn_opcodes_h_l1448_c3_0fae_right,
BIN_OP_OR_uxn_opcodes_h_l1448_c3_0fae_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1449_c11_e8fe
BIN_OP_PLUS_uxn_opcodes_h_l1449_c11_e8fe : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1449_c11_e8fe_left,
BIN_OP_PLUS_uxn_opcodes_h_l1449_c11_e8fe_right,
BIN_OP_PLUS_uxn_opcodes_h_l1449_c11_e8fe_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1451_c30_0766
sp_relative_shift_uxn_opcodes_h_l1451_c30_0766 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1451_c30_0766_ins,
sp_relative_shift_uxn_opcodes_h_l1451_c30_0766_x,
sp_relative_shift_uxn_opcodes_h_l1451_c30_0766_y,
sp_relative_shift_uxn_opcodes_h_l1451_c30_0766_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1456_c11_2367
BIN_OP_EQ_uxn_opcodes_h_l1456_c11_2367 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1456_c11_2367_left,
BIN_OP_EQ_uxn_opcodes_h_l1456_c11_2367_right,
BIN_OP_EQ_uxn_opcodes_h_l1456_c11_2367_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1456_c7_6e1d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1456_c7_6e1d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1456_c7_6e1d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1456_c7_6e1d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1456_c7_6e1d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1456_c7_6e1d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1456_c7_6e1d
result_is_sp_shift_MUX_uxn_opcodes_h_l1456_c7_6e1d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1456_c7_6e1d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1456_c7_6e1d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1456_c7_6e1d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1456_c7_6e1d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1456_c7_6e1d
result_is_opc_done_MUX_uxn_opcodes_h_l1456_c7_6e1d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1456_c7_6e1d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1456_c7_6e1d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1456_c7_6e1d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1456_c7_6e1d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1456_c7_6e1d
result_is_stack_write_MUX_uxn_opcodes_h_l1456_c7_6e1d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1456_c7_6e1d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1456_c7_6e1d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1456_c7_6e1d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1456_c7_6e1d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1456_c7_6e1d
result_u8_value_MUX_uxn_opcodes_h_l1456_c7_6e1d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1456_c7_6e1d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1456_c7_6e1d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1456_c7_6e1d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1456_c7_6e1d_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1459_c31_d25c
CONST_SR_8_uxn_opcodes_h_l1459_c31_d25c : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1459_c31_d25c_x,
CONST_SR_8_uxn_opcodes_h_l1459_c31_d25c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1461_c11_fa75
BIN_OP_EQ_uxn_opcodes_h_l1461_c11_fa75 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1461_c11_fa75_left,
BIN_OP_EQ_uxn_opcodes_h_l1461_c11_fa75_right,
BIN_OP_EQ_uxn_opcodes_h_l1461_c11_fa75_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_6542
result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_6542 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_6542_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_6542_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_6542_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_6542_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_6542
result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_6542 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_6542_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_6542_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_6542_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_6542_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1431_c6_9273_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1431_c1_3fff_return_output,
 tmp16_MUX_uxn_opcodes_h_l1431_c2_f5eb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c2_f5eb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c2_f5eb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c2_f5eb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1431_c2_f5eb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1431_c2_f5eb_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1431_c2_f5eb_return_output,
 t16_MUX_uxn_opcodes_h_l1431_c2_f5eb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1436_c11_af59_return_output,
 tmp16_MUX_uxn_opcodes_h_l1436_c7_4630_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_4630_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_4630_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1436_c7_4630_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_4630_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_4630_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1436_c7_4630_return_output,
 t16_MUX_uxn_opcodes_h_l1436_c7_4630_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1439_c11_364f_return_output,
 tmp16_MUX_uxn_opcodes_h_l1439_c7_3e02_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_3e02_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_3e02_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_3e02_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_3e02_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_3e02_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1439_c7_3e02_return_output,
 t16_MUX_uxn_opcodes_h_l1439_c7_3e02_return_output,
 CONST_SL_8_uxn_opcodes_h_l1441_c3_5cf1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1444_c11_476f_return_output,
 tmp16_MUX_uxn_opcodes_h_l1444_c7_56a6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_56a6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_56a6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_56a6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_56a6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_56a6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1444_c7_56a6_return_output,
 t16_MUX_uxn_opcodes_h_l1444_c7_56a6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1447_c11_75ec_return_output,
 tmp16_MUX_uxn_opcodes_h_l1447_c7_277f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_277f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_277f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_277f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_277f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_277f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1447_c7_277f_return_output,
 t16_MUX_uxn_opcodes_h_l1447_c7_277f_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1448_c3_0fae_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1449_c11_e8fe_return_output,
 sp_relative_shift_uxn_opcodes_h_l1451_c30_0766_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1456_c11_2367_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1456_c7_6e1d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1456_c7_6e1d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1456_c7_6e1d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1456_c7_6e1d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1456_c7_6e1d_return_output,
 CONST_SR_8_uxn_opcodes_h_l1459_c31_d25c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1461_c11_fa75_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_6542_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_6542_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c6_9273_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c6_9273_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c6_9273_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1431_c1_3fff_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1431_c1_3fff_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1431_c1_3fff_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1431_c1_3fff_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1431_c2_f5eb_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1431_c2_f5eb_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1436_c7_4630_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1431_c2_f5eb_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1431_c2_f5eb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c2_f5eb_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c2_f5eb_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_4630_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c2_f5eb_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c2_f5eb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c2_f5eb_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1433_c3_fe5f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c2_f5eb_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_4630_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c2_f5eb_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c2_f5eb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c2_f5eb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c2_f5eb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1436_c7_4630_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c2_f5eb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c2_f5eb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c2_f5eb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c2_f5eb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_4630_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c2_f5eb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c2_f5eb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c2_f5eb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c2_f5eb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_4630_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c2_f5eb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c2_f5eb_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1431_c2_f5eb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1431_c2_f5eb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1436_c7_4630_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1431_c2_f5eb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1431_c2_f5eb_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1431_c2_f5eb_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1431_c2_f5eb_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1436_c7_4630_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1431_c2_f5eb_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1431_c2_f5eb_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1432_c3_1fc1_uxn_opcodes_h_l1432_c3_1fc1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1436_c11_af59_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1436_c11_af59_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1436_c11_af59_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1436_c7_4630_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1436_c7_4630_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1439_c7_3e02_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1436_c7_4630_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_4630_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_4630_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_3e02_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_4630_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_4630_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1437_c3_9fae : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_4630_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_3e02_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_4630_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1436_c7_4630_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1436_c7_4630_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_3e02_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1436_c7_4630_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_4630_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_4630_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_3e02_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_4630_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_4630_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_4630_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_3e02_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_4630_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1436_c7_4630_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1436_c7_4630_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1439_c7_3e02_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1436_c7_4630_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1436_c7_4630_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1436_c7_4630_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1439_c7_3e02_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1436_c7_4630_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_364f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_364f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_364f_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1439_c7_3e02_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1439_c7_3e02_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1444_c7_56a6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1439_c7_3e02_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_3e02_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_3e02_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_56a6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_3e02_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_3e02_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1442_c3_e14c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_3e02_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_56a6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_3e02_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_3e02_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_3e02_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_56a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_3e02_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_3e02_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_3e02_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_56a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_3e02_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_3e02_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_3e02_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_56a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_3e02_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1439_c7_3e02_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1439_c7_3e02_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1444_c7_56a6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1439_c7_3e02_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1439_c7_3e02_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1439_c7_3e02_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1444_c7_56a6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1439_c7_3e02_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1441_c3_5cf1_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1441_c3_5cf1_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_476f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_476f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_476f_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1444_c7_56a6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1444_c7_56a6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1447_c7_277f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1444_c7_56a6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_56a6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_56a6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_277f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_56a6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_56a6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1445_c3_e7ba : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_56a6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_277f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_56a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_56a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_56a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_277f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_56a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_56a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_56a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_277f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_56a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_56a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_56a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_277f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_56a6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1444_c7_56a6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1444_c7_56a6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1447_c7_277f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1444_c7_56a6_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1444_c7_56a6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1444_c7_56a6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1447_c7_277f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1444_c7_56a6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_75ec_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_75ec_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_75ec_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1447_c7_277f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l1449_c3_ce8e : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1447_c7_277f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1447_c7_277f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_277f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_277f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_277f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_277f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1453_c3_2397 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_277f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1456_c7_6e1d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_277f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_277f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_277f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1456_c7_6e1d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_277f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_277f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_277f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1456_c7_6e1d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_277f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_277f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_277f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1456_c7_6e1d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_277f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1447_c7_277f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1447_c7_277f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1456_c7_6e1d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1447_c7_277f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1447_c7_277f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1447_c7_277f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1447_c7_277f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1448_c3_0fae_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1448_c3_0fae_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1448_c3_0fae_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1449_c11_e8fe_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1449_c11_e8fe_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1449_c11_e8fe_return_output : unsigned(16 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1451_c30_0766_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1451_c30_0766_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1451_c30_0766_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1451_c30_0766_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1454_c21_5473_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1456_c11_2367_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1456_c11_2367_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1456_c11_2367_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1456_c7_6e1d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1458_c3_5e74 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1456_c7_6e1d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1456_c7_6e1d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1456_c7_6e1d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1456_c7_6e1d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1456_c7_6e1d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1456_c7_6e1d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1456_c7_6e1d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1456_c7_6e1d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_6542_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1456_c7_6e1d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1456_c7_6e1d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1456_c7_6e1d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_6542_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1456_c7_6e1d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1456_c7_6e1d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1456_c7_6e1d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1456_c7_6e1d_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1459_c31_d25c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1459_c31_d25c_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1459_c21_cdbd_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1461_c11_fa75_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1461_c11_fa75_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1461_c11_fa75_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_6542_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_6542_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_6542_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_6542_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_6542_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_6542_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1447_l1444_l1436_l1439_l1431_DUPLICATE_87ef_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1456_l1444_l1436_l1439_l1431_DUPLICATE_4a58_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1456_l1461_l1444_l1436_l1439_l1431_DUPLICATE_dc1a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1456_l1444_l1436_l1439_l1431_DUPLICATE_878c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1456_l1461_l1447_l1444_l1436_l1439_DUPLICATE_b2bb_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1440_l1448_DUPLICATE_beda_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l1466_l1427_DUPLICATE_f6c9_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1458_c3_5e74 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1456_c7_6e1d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1458_c3_5e74;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1445_c3_e7ba := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_56a6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1445_c3_e7ba;
     VAR_sp_relative_shift_uxn_opcodes_h_l1451_c30_0766_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1433_c3_fe5f := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c2_f5eb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1433_c3_fe5f;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1431_c1_3fff_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1442_c3_e14c := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_3e02_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1442_c3_e14c;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1456_c7_6e1d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_476f_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1436_c11_af59_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1461_c11_fa75_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1437_c3_9fae := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_4630_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1437_c3_9fae;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_6542_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c2_f5eb_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1451_c30_0766_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_75ec_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_364f_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_277f_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_6542_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c6_9273_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_277f_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1456_c11_2367_right := to_unsigned(5, 3);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1449_c11_e8fe_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1453_c3_2397 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_277f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1453_c3_2397;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1431_c1_3fff_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1451_c30_0766_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c6_9273_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1436_c11_af59_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_364f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_476f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_75ec_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1456_c11_2367_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1461_c11_fa75_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1448_c3_0fae_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1431_c2_f5eb_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1436_c7_4630_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1444_c7_56a6_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1447_c7_277f_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1459_c31_d25c_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1431_c2_f5eb_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1436_c7_4630_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1439_c7_3e02_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1444_c7_56a6_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1447_c7_277f_iffalse := tmp16;
     -- sp_relative_shift[uxn_opcodes_h_l1451_c30_0766] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1451_c30_0766_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1451_c30_0766_ins;
     sp_relative_shift_uxn_opcodes_h_l1451_c30_0766_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1451_c30_0766_x;
     sp_relative_shift_uxn_opcodes_h_l1451_c30_0766_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1451_c30_0766_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1451_c30_0766_return_output := sp_relative_shift_uxn_opcodes_h_l1451_c30_0766_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1440_l1448_DUPLICATE_beda LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1440_l1448_DUPLICATE_beda_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1456_c7_6e1d] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1456_c7_6e1d_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1439_c11_364f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1439_c11_364f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_364f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1439_c11_364f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_364f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_364f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1439_c11_364f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1447_c11_75ec] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1447_c11_75ec_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_75ec_left;
     BIN_OP_EQ_uxn_opcodes_h_l1447_c11_75ec_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_75ec_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_75ec_return_output := BIN_OP_EQ_uxn_opcodes_h_l1447_c11_75ec_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1459_c31_d25c] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1459_c31_d25c_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1459_c31_d25c_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1459_c31_d25c_return_output := CONST_SR_8_uxn_opcodes_h_l1459_c31_d25c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1461_c11_fa75] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1461_c11_fa75_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1461_c11_fa75_left;
     BIN_OP_EQ_uxn_opcodes_h_l1461_c11_fa75_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1461_c11_fa75_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1461_c11_fa75_return_output := BIN_OP_EQ_uxn_opcodes_h_l1461_c11_fa75_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1456_l1444_l1436_l1439_l1431_DUPLICATE_878c LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1456_l1444_l1436_l1439_l1431_DUPLICATE_878c_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1456_c11_2367] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1456_c11_2367_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1456_c11_2367_left;
     BIN_OP_EQ_uxn_opcodes_h_l1456_c11_2367_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1456_c11_2367_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1456_c11_2367_return_output := BIN_OP_EQ_uxn_opcodes_h_l1456_c11_2367_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1447_l1444_l1436_l1439_l1431_DUPLICATE_87ef LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1447_l1444_l1436_l1439_l1431_DUPLICATE_87ef_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1431_c6_9273] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1431_c6_9273_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c6_9273_left;
     BIN_OP_EQ_uxn_opcodes_h_l1431_c6_9273_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c6_9273_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c6_9273_return_output := BIN_OP_EQ_uxn_opcodes_h_l1431_c6_9273_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1456_l1461_l1444_l1436_l1439_l1431_DUPLICATE_dc1a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1456_l1461_l1444_l1436_l1439_l1431_DUPLICATE_dc1a_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1456_l1461_l1447_l1444_l1436_l1439_DUPLICATE_b2bb LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1456_l1461_l1447_l1444_l1436_l1439_DUPLICATE_b2bb_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1456_l1444_l1436_l1439_l1431_DUPLICATE_4a58 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1456_l1444_l1436_l1439_l1431_DUPLICATE_4a58_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1444_c11_476f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1444_c11_476f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_476f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1444_c11_476f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_476f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_476f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1444_c11_476f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1436_c11_af59] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1436_c11_af59_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1436_c11_af59_left;
     BIN_OP_EQ_uxn_opcodes_h_l1436_c11_af59_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1436_c11_af59_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1436_c11_af59_return_output := BIN_OP_EQ_uxn_opcodes_h_l1436_c11_af59_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1431_c1_3fff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c6_9273_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c2_f5eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c6_9273_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c2_f5eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c6_9273_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c2_f5eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c6_9273_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c2_f5eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c6_9273_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c2_f5eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c6_9273_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1431_c2_f5eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c6_9273_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1431_c2_f5eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c6_9273_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1431_c2_f5eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c6_9273_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_4630_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1436_c11_af59_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1436_c7_4630_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1436_c11_af59_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_4630_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1436_c11_af59_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_4630_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1436_c11_af59_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_4630_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1436_c11_af59_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1436_c7_4630_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1436_c11_af59_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1436_c7_4630_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1436_c11_af59_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1436_c7_4630_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1436_c11_af59_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_3e02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_364f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_3e02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_364f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_3e02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_364f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_3e02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_364f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_3e02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_364f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1439_c7_3e02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_364f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1439_c7_3e02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_364f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1439_c7_3e02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_364f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_56a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_476f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_56a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_476f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_56a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_476f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_56a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_476f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_56a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_476f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1444_c7_56a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_476f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1444_c7_56a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_476f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1444_c7_56a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_476f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_277f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_75ec_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_277f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_75ec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_277f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_75ec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_277f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_75ec_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_277f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_75ec_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1447_c7_277f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_75ec_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1447_c7_277f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_75ec_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1447_c7_277f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_75ec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1456_c7_6e1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1456_c11_2367_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1456_c7_6e1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1456_c11_2367_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1456_c7_6e1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1456_c11_2367_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1456_c7_6e1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1456_c11_2367_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1456_c7_6e1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1456_c11_2367_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_6542_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1461_c11_fa75_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_6542_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1461_c11_fa75_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1448_c3_0fae_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1440_l1448_DUPLICATE_beda_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1441_c3_5cf1_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1440_l1448_DUPLICATE_beda_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c2_f5eb_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1447_l1444_l1436_l1439_l1431_DUPLICATE_87ef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_4630_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1447_l1444_l1436_l1439_l1431_DUPLICATE_87ef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_3e02_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1447_l1444_l1436_l1439_l1431_DUPLICATE_87ef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_56a6_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1447_l1444_l1436_l1439_l1431_DUPLICATE_87ef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_277f_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1447_l1444_l1436_l1439_l1431_DUPLICATE_87ef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_4630_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1456_l1461_l1447_l1444_l1436_l1439_DUPLICATE_b2bb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_3e02_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1456_l1461_l1447_l1444_l1436_l1439_DUPLICATE_b2bb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_56a6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1456_l1461_l1447_l1444_l1436_l1439_DUPLICATE_b2bb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_277f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1456_l1461_l1447_l1444_l1436_l1439_DUPLICATE_b2bb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1456_c7_6e1d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1456_l1461_l1447_l1444_l1436_l1439_DUPLICATE_b2bb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_6542_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1456_l1461_l1447_l1444_l1436_l1439_DUPLICATE_b2bb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c2_f5eb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1456_l1444_l1436_l1439_l1431_DUPLICATE_4a58_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1436_c7_4630_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1456_l1444_l1436_l1439_l1431_DUPLICATE_4a58_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_3e02_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1456_l1444_l1436_l1439_l1431_DUPLICATE_4a58_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_56a6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1456_l1444_l1436_l1439_l1431_DUPLICATE_4a58_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1456_c7_6e1d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1456_l1444_l1436_l1439_l1431_DUPLICATE_4a58_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c2_f5eb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1456_l1461_l1444_l1436_l1439_l1431_DUPLICATE_dc1a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_4630_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1456_l1461_l1444_l1436_l1439_l1431_DUPLICATE_dc1a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_3e02_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1456_l1461_l1444_l1436_l1439_l1431_DUPLICATE_dc1a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_56a6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1456_l1461_l1444_l1436_l1439_l1431_DUPLICATE_dc1a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1456_c7_6e1d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1456_l1461_l1444_l1436_l1439_l1431_DUPLICATE_dc1a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_6542_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1456_l1461_l1444_l1436_l1439_l1431_DUPLICATE_dc1a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1431_c2_f5eb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1456_l1444_l1436_l1439_l1431_DUPLICATE_878c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1436_c7_4630_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1456_l1444_l1436_l1439_l1431_DUPLICATE_878c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1439_c7_3e02_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1456_l1444_l1436_l1439_l1431_DUPLICATE_878c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1444_c7_56a6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1456_l1444_l1436_l1439_l1431_DUPLICATE_878c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1456_c7_6e1d_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1456_l1444_l1436_l1439_l1431_DUPLICATE_878c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1456_c7_6e1d_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1456_c7_6e1d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_277f_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1451_c30_0766_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l1448_c3_0fae] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1448_c3_0fae_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1448_c3_0fae_left;
     BIN_OP_OR_uxn_opcodes_h_l1448_c3_0fae_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1448_c3_0fae_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1448_c3_0fae_return_output := BIN_OP_OR_uxn_opcodes_h_l1448_c3_0fae_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1461_c7_6542] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_6542_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_6542_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_6542_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_6542_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_6542_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_6542_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_6542_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_6542_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1441_c3_5cf1] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1441_c3_5cf1_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1441_c3_5cf1_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1441_c3_5cf1_return_output := CONST_SL_8_uxn_opcodes_h_l1441_c3_5cf1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1461_c7_6542] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_6542_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_6542_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_6542_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_6542_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_6542_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_6542_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_6542_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_6542_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1431_c1_3fff] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1431_c1_3fff_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1431_c1_3fff_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1431_c1_3fff_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1431_c1_3fff_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1431_c1_3fff_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1431_c1_3fff_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1431_c1_3fff_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1431_c1_3fff_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1456_c7_6e1d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1456_c7_6e1d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1456_c7_6e1d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1456_c7_6e1d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1456_c7_6e1d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1456_c7_6e1d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1456_c7_6e1d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1456_c7_6e1d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1456_c7_6e1d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1456_c7_6e1d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1456_c7_6e1d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1456_c7_6e1d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1456_c7_6e1d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1456_c7_6e1d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1456_c7_6e1d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1456_c7_6e1d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1456_c7_6e1d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1456_c7_6e1d_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1459_c21_cdbd] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1459_c21_cdbd_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1459_c31_d25c_return_output);

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1447_c7_277f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_277f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_277f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_277f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_277f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_277f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_277f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_277f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_277f_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1449_c11_e8fe_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1448_c3_0fae_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1447_c7_277f_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1448_c3_0fae_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1456_c7_6e1d_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1459_c21_cdbd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1439_c7_3e02_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1441_c3_5cf1_return_output;
     VAR_printf_uxn_opcodes_h_l1432_c3_1fc1_uxn_opcodes_h_l1432_c3_1fc1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1431_c1_3fff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1456_c7_6e1d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_6542_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_277f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1456_c7_6e1d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1456_c7_6e1d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_6542_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_56a6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_277f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_277f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1456_c7_6e1d_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1456_c7_6e1d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1456_c7_6e1d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1456_c7_6e1d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1456_c7_6e1d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1456_c7_6e1d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1456_c7_6e1d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1456_c7_6e1d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1456_c7_6e1d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1456_c7_6e1d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1456_c7_6e1d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1456_c7_6e1d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1456_c7_6e1d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1456_c7_6e1d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1456_c7_6e1d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1456_c7_6e1d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1456_c7_6e1d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1456_c7_6e1d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1456_c7_6e1d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1447_c7_277f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_277f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_277f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_277f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_277f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_277f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_277f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_277f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_277f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1456_c7_6e1d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1456_c7_6e1d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1456_c7_6e1d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1456_c7_6e1d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1456_c7_6e1d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1456_c7_6e1d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1456_c7_6e1d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1456_c7_6e1d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1456_c7_6e1d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1447_c7_277f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_277f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_277f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_277f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_277f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_277f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_277f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_277f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_277f_return_output;

     -- t16_MUX[uxn_opcodes_h_l1447_c7_277f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1447_c7_277f_cond <= VAR_t16_MUX_uxn_opcodes_h_l1447_c7_277f_cond;
     t16_MUX_uxn_opcodes_h_l1447_c7_277f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1447_c7_277f_iftrue;
     t16_MUX_uxn_opcodes_h_l1447_c7_277f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1447_c7_277f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1447_c7_277f_return_output := t16_MUX_uxn_opcodes_h_l1447_c7_277f_return_output;

     -- printf_uxn_opcodes_h_l1432_c3_1fc1[uxn_opcodes_h_l1432_c3_1fc1] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1432_c3_1fc1_uxn_opcodes_h_l1432_c3_1fc1_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1432_c3_1fc1_uxn_opcodes_h_l1432_c3_1fc1_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1444_c7_56a6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_56a6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_56a6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_56a6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_56a6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_56a6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_56a6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_56a6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_56a6_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1449_c11_e8fe] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1449_c11_e8fe_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1449_c11_e8fe_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1449_c11_e8fe_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1449_c11_e8fe_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1449_c11_e8fe_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1449_c11_e8fe_return_output;

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l1449_c3_ce8e := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1449_c11_e8fe_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_277f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1456_c7_6e1d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_56a6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_277f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_277f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1456_c7_6e1d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_3e02_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_56a6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_56a6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_277f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1447_c7_277f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1456_c7_6e1d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1444_c7_56a6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1447_c7_277f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1447_c7_277f_iftrue := VAR_tmp16_uxn_opcodes_h_l1449_c3_ce8e;
     -- t16_MUX[uxn_opcodes_h_l1444_c7_56a6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1444_c7_56a6_cond <= VAR_t16_MUX_uxn_opcodes_h_l1444_c7_56a6_cond;
     t16_MUX_uxn_opcodes_h_l1444_c7_56a6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1444_c7_56a6_iftrue;
     t16_MUX_uxn_opcodes_h_l1444_c7_56a6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1444_c7_56a6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1444_c7_56a6_return_output := t16_MUX_uxn_opcodes_h_l1444_c7_56a6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1447_c7_277f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_277f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_277f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_277f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_277f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_277f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_277f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_277f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_277f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1447_c7_277f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_277f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_277f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_277f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_277f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_277f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_277f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_277f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_277f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1444_c7_56a6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_56a6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_56a6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_56a6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_56a6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_56a6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_56a6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_56a6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_56a6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1444_c7_56a6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_56a6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_56a6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_56a6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_56a6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_56a6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_56a6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_56a6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_56a6_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1454_c21_5473] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1454_c21_5473_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_tmp16_uxn_opcodes_h_l1449_c3_ce8e);

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1439_c7_3e02] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_3e02_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_3e02_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_3e02_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_3e02_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_3e02_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_3e02_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_3e02_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_3e02_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1447_c7_277f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1447_c7_277f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1447_c7_277f_cond;
     tmp16_MUX_uxn_opcodes_h_l1447_c7_277f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1447_c7_277f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1447_c7_277f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1447_c7_277f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1447_c7_277f_return_output := tmp16_MUX_uxn_opcodes_h_l1447_c7_277f_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1447_c7_277f_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1454_c21_5473_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_56a6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_277f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_3e02_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_56a6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_56a6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_277f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_4630_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_3e02_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_3e02_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_56a6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1439_c7_3e02_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1444_c7_56a6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1444_c7_56a6_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1447_c7_277f_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1439_c7_3e02] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_3e02_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_3e02_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_3e02_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_3e02_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_3e02_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_3e02_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_3e02_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_3e02_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1444_c7_56a6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_56a6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_56a6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_56a6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_56a6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_56a6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_56a6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_56a6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_56a6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1436_c7_4630] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_4630_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_4630_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_4630_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_4630_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_4630_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_4630_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_4630_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_4630_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1444_c7_56a6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_56a6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_56a6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_56a6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_56a6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_56a6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_56a6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_56a6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_56a6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1447_c7_277f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1447_c7_277f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1447_c7_277f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1447_c7_277f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1447_c7_277f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1447_c7_277f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1447_c7_277f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1447_c7_277f_return_output := result_u8_value_MUX_uxn_opcodes_h_l1447_c7_277f_return_output;

     -- t16_MUX[uxn_opcodes_h_l1439_c7_3e02] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1439_c7_3e02_cond <= VAR_t16_MUX_uxn_opcodes_h_l1439_c7_3e02_cond;
     t16_MUX_uxn_opcodes_h_l1439_c7_3e02_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1439_c7_3e02_iftrue;
     t16_MUX_uxn_opcodes_h_l1439_c7_3e02_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1439_c7_3e02_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1439_c7_3e02_return_output := t16_MUX_uxn_opcodes_h_l1439_c7_3e02_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1439_c7_3e02] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_3e02_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_3e02_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_3e02_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_3e02_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_3e02_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_3e02_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_3e02_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_3e02_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1444_c7_56a6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1444_c7_56a6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1444_c7_56a6_cond;
     tmp16_MUX_uxn_opcodes_h_l1444_c7_56a6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1444_c7_56a6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1444_c7_56a6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1444_c7_56a6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1444_c7_56a6_return_output := tmp16_MUX_uxn_opcodes_h_l1444_c7_56a6_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_3e02_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_56a6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1436_c7_4630_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_3e02_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_3e02_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_56a6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c2_f5eb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c7_4630_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_4630_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_3e02_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1444_c7_56a6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1447_c7_277f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1436_c7_4630_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1439_c7_3e02_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1439_c7_3e02_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1444_c7_56a6_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1439_c7_3e02] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_3e02_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_3e02_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_3e02_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_3e02_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_3e02_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_3e02_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_3e02_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_3e02_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1431_c2_f5eb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c2_f5eb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c2_f5eb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c2_f5eb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c2_f5eb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c2_f5eb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c2_f5eb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c2_f5eb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c2_f5eb_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1444_c7_56a6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1444_c7_56a6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1444_c7_56a6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1444_c7_56a6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1444_c7_56a6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1444_c7_56a6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1444_c7_56a6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1444_c7_56a6_return_output := result_u8_value_MUX_uxn_opcodes_h_l1444_c7_56a6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1439_c7_3e02] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_3e02_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_3e02_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_3e02_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_3e02_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_3e02_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_3e02_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_3e02_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_3e02_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1439_c7_3e02] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1439_c7_3e02_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1439_c7_3e02_cond;
     tmp16_MUX_uxn_opcodes_h_l1439_c7_3e02_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1439_c7_3e02_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1439_c7_3e02_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1439_c7_3e02_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1439_c7_3e02_return_output := tmp16_MUX_uxn_opcodes_h_l1439_c7_3e02_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1436_c7_4630] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_4630_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_4630_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_4630_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_4630_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_4630_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_4630_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_4630_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_4630_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1436_c7_4630] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1436_c7_4630_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1436_c7_4630_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1436_c7_4630_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1436_c7_4630_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1436_c7_4630_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1436_c7_4630_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1436_c7_4630_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1436_c7_4630_return_output;

     -- t16_MUX[uxn_opcodes_h_l1436_c7_4630] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1436_c7_4630_cond <= VAR_t16_MUX_uxn_opcodes_h_l1436_c7_4630_cond;
     t16_MUX_uxn_opcodes_h_l1436_c7_4630_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1436_c7_4630_iftrue;
     t16_MUX_uxn_opcodes_h_l1436_c7_4630_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1436_c7_4630_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1436_c7_4630_return_output := t16_MUX_uxn_opcodes_h_l1436_c7_4630_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_4630_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_3e02_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c2_f5eb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1436_c7_4630_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_4630_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_3e02_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c2_f5eb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c7_4630_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1439_c7_3e02_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1444_c7_56a6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1431_c2_f5eb_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1436_c7_4630_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1436_c7_4630_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1439_c7_3e02_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1431_c2_f5eb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c2_f5eb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c2_f5eb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c2_f5eb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c2_f5eb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c2_f5eb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c2_f5eb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c2_f5eb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c2_f5eb_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1439_c7_3e02] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1439_c7_3e02_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1439_c7_3e02_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1439_c7_3e02_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1439_c7_3e02_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1439_c7_3e02_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1439_c7_3e02_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1439_c7_3e02_return_output := result_u8_value_MUX_uxn_opcodes_h_l1439_c7_3e02_return_output;

     -- t16_MUX[uxn_opcodes_h_l1431_c2_f5eb] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1431_c2_f5eb_cond <= VAR_t16_MUX_uxn_opcodes_h_l1431_c2_f5eb_cond;
     t16_MUX_uxn_opcodes_h_l1431_c2_f5eb_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1431_c2_f5eb_iftrue;
     t16_MUX_uxn_opcodes_h_l1431_c2_f5eb_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1431_c2_f5eb_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1431_c2_f5eb_return_output := t16_MUX_uxn_opcodes_h_l1431_c2_f5eb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1436_c7_4630] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_4630_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_4630_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_4630_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_4630_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_4630_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_4630_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_4630_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_4630_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1431_c2_f5eb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c2_f5eb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c2_f5eb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c2_f5eb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c2_f5eb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c2_f5eb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c2_f5eb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c2_f5eb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c2_f5eb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1436_c7_4630] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_4630_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_4630_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_4630_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_4630_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_4630_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_4630_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_4630_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_4630_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1436_c7_4630] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1436_c7_4630_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1436_c7_4630_cond;
     tmp16_MUX_uxn_opcodes_h_l1436_c7_4630_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1436_c7_4630_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1436_c7_4630_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1436_c7_4630_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1436_c7_4630_return_output := tmp16_MUX_uxn_opcodes_h_l1436_c7_4630_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c2_f5eb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1436_c7_4630_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c2_f5eb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1436_c7_4630_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1436_c7_4630_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1439_c7_3e02_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1431_c2_f5eb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1431_c2_f5eb_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1436_c7_4630_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1436_c7_4630] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1436_c7_4630_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1436_c7_4630_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1436_c7_4630_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1436_c7_4630_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1436_c7_4630_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1436_c7_4630_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1436_c7_4630_return_output := result_u8_value_MUX_uxn_opcodes_h_l1436_c7_4630_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1431_c2_f5eb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1431_c2_f5eb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c2_f5eb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1431_c2_f5eb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c2_f5eb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1431_c2_f5eb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c2_f5eb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c2_f5eb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1431_c2_f5eb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1431_c2_f5eb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1431_c2_f5eb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c2_f5eb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1431_c2_f5eb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c2_f5eb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1431_c2_f5eb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c2_f5eb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c2_f5eb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1431_c2_f5eb_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1431_c2_f5eb] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1431_c2_f5eb_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1431_c2_f5eb_cond;
     tmp16_MUX_uxn_opcodes_h_l1431_c2_f5eb_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1431_c2_f5eb_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1431_c2_f5eb_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1431_c2_f5eb_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1431_c2_f5eb_return_output := tmp16_MUX_uxn_opcodes_h_l1431_c2_f5eb_return_output;

     -- Submodule level 8
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1431_c2_f5eb_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1436_c7_4630_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1431_c2_f5eb_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1431_c2_f5eb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1431_c2_f5eb_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1431_c2_f5eb_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1431_c2_f5eb_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1431_c2_f5eb_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1431_c2_f5eb_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1431_c2_f5eb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1431_c2_f5eb_return_output := result_u8_value_MUX_uxn_opcodes_h_l1431_c2_f5eb_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l1466_l1427_DUPLICATE_f6c9 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l1466_l1427_DUPLICATE_f6c9_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_8cda(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c2_f5eb_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c2_f5eb_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c2_f5eb_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c2_f5eb_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c2_f5eb_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1431_c2_f5eb_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l1466_l1427_DUPLICATE_f6c9_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l1466_l1427_DUPLICATE_f6c9_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
