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
-- BIN_OP_EQ[uxn_opcodes_h_l1436_c6_90ae]
signal BIN_OP_EQ_uxn_opcodes_h_l1436_c6_90ae_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1436_c6_90ae_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1436_c6_90ae_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1436_c1_72a0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1436_c1_72a0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1436_c1_72a0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1436_c1_72a0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1436_c1_72a0_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1436_c2_d48e]
signal t16_MUX_uxn_opcodes_h_l1436_c2_d48e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1436_c2_d48e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1436_c2_d48e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1436_c2_d48e_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1436_c2_d48e]
signal tmp16_MUX_uxn_opcodes_h_l1436_c2_d48e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1436_c2_d48e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1436_c2_d48e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1436_c2_d48e_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1436_c2_d48e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c2_d48e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c2_d48e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c2_d48e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c2_d48e_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1436_c2_d48e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1436_c2_d48e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1436_c2_d48e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1436_c2_d48e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1436_c2_d48e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1436_c2_d48e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1436_c2_d48e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1436_c2_d48e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1436_c2_d48e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1436_c2_d48e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1436_c2_d48e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1436_c2_d48e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1436_c2_d48e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1436_c2_d48e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1436_c2_d48e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1436_c2_d48e]
signal result_u8_value_MUX_uxn_opcodes_h_l1436_c2_d48e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1436_c2_d48e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1436_c2_d48e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1436_c2_d48e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1436_c2_d48e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c2_d48e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c2_d48e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c2_d48e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c2_d48e_return_output : signed(3 downto 0);

-- printf_uxn_opcodes_h_l1437_c3_2ffb[uxn_opcodes_h_l1437_c3_2ffb]
signal printf_uxn_opcodes_h_l1437_c3_2ffb_uxn_opcodes_h_l1437_c3_2ffb_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1441_c11_0e2f]
signal BIN_OP_EQ_uxn_opcodes_h_l1441_c11_0e2f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1441_c11_0e2f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1441_c11_0e2f_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1441_c7_9ddf]
signal t16_MUX_uxn_opcodes_h_l1441_c7_9ddf_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1441_c7_9ddf_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1441_c7_9ddf_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1441_c7_9ddf_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1441_c7_9ddf]
signal tmp16_MUX_uxn_opcodes_h_l1441_c7_9ddf_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1441_c7_9ddf_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1441_c7_9ddf_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1441_c7_9ddf_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1441_c7_9ddf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1441_c7_9ddf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1441_c7_9ddf_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1441_c7_9ddf_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1441_c7_9ddf_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1441_c7_9ddf]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1441_c7_9ddf_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1441_c7_9ddf_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1441_c7_9ddf_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1441_c7_9ddf_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1441_c7_9ddf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1441_c7_9ddf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1441_c7_9ddf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1441_c7_9ddf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1441_c7_9ddf_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1441_c7_9ddf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1441_c7_9ddf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1441_c7_9ddf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1441_c7_9ddf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1441_c7_9ddf_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1441_c7_9ddf]
signal result_u8_value_MUX_uxn_opcodes_h_l1441_c7_9ddf_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1441_c7_9ddf_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1441_c7_9ddf_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1441_c7_9ddf_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1441_c7_9ddf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1441_c7_9ddf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1441_c7_9ddf_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1441_c7_9ddf_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1441_c7_9ddf_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1444_c11_c201]
signal BIN_OP_EQ_uxn_opcodes_h_l1444_c11_c201_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1444_c11_c201_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1444_c11_c201_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1444_c7_86be]
signal t16_MUX_uxn_opcodes_h_l1444_c7_86be_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1444_c7_86be_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1444_c7_86be_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1444_c7_86be_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1444_c7_86be]
signal tmp16_MUX_uxn_opcodes_h_l1444_c7_86be_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1444_c7_86be_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1444_c7_86be_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1444_c7_86be_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1444_c7_86be]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_86be_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_86be_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_86be_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_86be_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1444_c7_86be]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_86be_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_86be_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_86be_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_86be_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1444_c7_86be]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_86be_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_86be_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_86be_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_86be_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1444_c7_86be]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_86be_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_86be_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_86be_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_86be_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1444_c7_86be]
signal result_u8_value_MUX_uxn_opcodes_h_l1444_c7_86be_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1444_c7_86be_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1444_c7_86be_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1444_c7_86be_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1444_c7_86be]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_86be_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_86be_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_86be_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_86be_return_output : signed(3 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1446_c3_fed8]
signal CONST_SL_8_uxn_opcodes_h_l1446_c3_fed8_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1446_c3_fed8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1449_c11_62cf]
signal BIN_OP_EQ_uxn_opcodes_h_l1449_c11_62cf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1449_c11_62cf_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1449_c11_62cf_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1449_c7_e854]
signal t16_MUX_uxn_opcodes_h_l1449_c7_e854_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1449_c7_e854_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1449_c7_e854_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1449_c7_e854_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1449_c7_e854]
signal tmp16_MUX_uxn_opcodes_h_l1449_c7_e854_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1449_c7_e854_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1449_c7_e854_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1449_c7_e854_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1449_c7_e854]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1449_c7_e854_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1449_c7_e854_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1449_c7_e854_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1449_c7_e854_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1449_c7_e854]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1449_c7_e854_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1449_c7_e854_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1449_c7_e854_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1449_c7_e854_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1449_c7_e854]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1449_c7_e854_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1449_c7_e854_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1449_c7_e854_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1449_c7_e854_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1449_c7_e854]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1449_c7_e854_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1449_c7_e854_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1449_c7_e854_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1449_c7_e854_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1449_c7_e854]
signal result_u8_value_MUX_uxn_opcodes_h_l1449_c7_e854_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1449_c7_e854_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1449_c7_e854_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1449_c7_e854_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1449_c7_e854]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1449_c7_e854_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1449_c7_e854_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1449_c7_e854_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1449_c7_e854_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1452_c11_391b]
signal BIN_OP_EQ_uxn_opcodes_h_l1452_c11_391b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1452_c11_391b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1452_c11_391b_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1452_c7_e400]
signal t16_MUX_uxn_opcodes_h_l1452_c7_e400_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1452_c7_e400_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1452_c7_e400_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1452_c7_e400_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1452_c7_e400]
signal tmp16_MUX_uxn_opcodes_h_l1452_c7_e400_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1452_c7_e400_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1452_c7_e400_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1452_c7_e400_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1452_c7_e400]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1452_c7_e400_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1452_c7_e400_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1452_c7_e400_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1452_c7_e400_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1452_c7_e400]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1452_c7_e400_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1452_c7_e400_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1452_c7_e400_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1452_c7_e400_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1452_c7_e400]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1452_c7_e400_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1452_c7_e400_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1452_c7_e400_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1452_c7_e400_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1452_c7_e400]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1452_c7_e400_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1452_c7_e400_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1452_c7_e400_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1452_c7_e400_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1452_c7_e400]
signal result_u8_value_MUX_uxn_opcodes_h_l1452_c7_e400_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1452_c7_e400_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1452_c7_e400_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1452_c7_e400_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1452_c7_e400]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1452_c7_e400_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1452_c7_e400_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1452_c7_e400_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1452_c7_e400_return_output : signed(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1453_c3_68c2]
signal BIN_OP_OR_uxn_opcodes_h_l1453_c3_68c2_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1453_c3_68c2_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1453_c3_68c2_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1454_c11_ba47]
signal BIN_OP_PLUS_uxn_opcodes_h_l1454_c11_ba47_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1454_c11_ba47_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1454_c11_ba47_return_output : unsigned(16 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1456_c30_628c]
signal sp_relative_shift_uxn_opcodes_h_l1456_c30_628c_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1456_c30_628c_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1456_c30_628c_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1456_c30_628c_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1461_c11_d807]
signal BIN_OP_EQ_uxn_opcodes_h_l1461_c11_d807_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1461_c11_d807_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1461_c11_d807_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1461_c7_c3be]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1461_c7_c3be_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1461_c7_c3be_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1461_c7_c3be_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1461_c7_c3be_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1461_c7_c3be]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1461_c7_c3be_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1461_c7_c3be_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1461_c7_c3be_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1461_c7_c3be_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1461_c7_c3be]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_c3be_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_c3be_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_c3be_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_c3be_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1461_c7_c3be]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_c3be_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_c3be_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_c3be_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_c3be_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1461_c7_c3be]
signal result_u8_value_MUX_uxn_opcodes_h_l1461_c7_c3be_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1461_c7_c3be_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1461_c7_c3be_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1461_c7_c3be_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1464_c31_504d]
signal CONST_SR_8_uxn_opcodes_h_l1464_c31_504d_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1464_c31_504d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1466_c11_2d6d]
signal BIN_OP_EQ_uxn_opcodes_h_l1466_c11_2d6d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1466_c11_2d6d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1466_c11_2d6d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1466_c7_744a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1466_c7_744a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1466_c7_744a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1466_c7_744a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1466_c7_744a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1466_c7_744a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1466_c7_744a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1466_c7_744a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1466_c7_744a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1466_c7_744a_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_641b( ref_toks_0 : opcode_result_t;
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
      base.stack_address_sp_offset := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.u8_value := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1436_c6_90ae
BIN_OP_EQ_uxn_opcodes_h_l1436_c6_90ae : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1436_c6_90ae_left,
BIN_OP_EQ_uxn_opcodes_h_l1436_c6_90ae_right,
BIN_OP_EQ_uxn_opcodes_h_l1436_c6_90ae_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1436_c1_72a0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1436_c1_72a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1436_c1_72a0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1436_c1_72a0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1436_c1_72a0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1436_c1_72a0_return_output);

-- t16_MUX_uxn_opcodes_h_l1436_c2_d48e
t16_MUX_uxn_opcodes_h_l1436_c2_d48e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1436_c2_d48e_cond,
t16_MUX_uxn_opcodes_h_l1436_c2_d48e_iftrue,
t16_MUX_uxn_opcodes_h_l1436_c2_d48e_iffalse,
t16_MUX_uxn_opcodes_h_l1436_c2_d48e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1436_c2_d48e
tmp16_MUX_uxn_opcodes_h_l1436_c2_d48e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1436_c2_d48e_cond,
tmp16_MUX_uxn_opcodes_h_l1436_c2_d48e_iftrue,
tmp16_MUX_uxn_opcodes_h_l1436_c2_d48e_iffalse,
tmp16_MUX_uxn_opcodes_h_l1436_c2_d48e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c2_d48e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c2_d48e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c2_d48e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c2_d48e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c2_d48e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c2_d48e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1436_c2_d48e
result_is_sp_shift_MUX_uxn_opcodes_h_l1436_c2_d48e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1436_c2_d48e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1436_c2_d48e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1436_c2_d48e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1436_c2_d48e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1436_c2_d48e
result_is_opc_done_MUX_uxn_opcodes_h_l1436_c2_d48e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1436_c2_d48e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1436_c2_d48e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1436_c2_d48e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1436_c2_d48e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1436_c2_d48e
result_is_stack_write_MUX_uxn_opcodes_h_l1436_c2_d48e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1436_c2_d48e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1436_c2_d48e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1436_c2_d48e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1436_c2_d48e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1436_c2_d48e
result_u8_value_MUX_uxn_opcodes_h_l1436_c2_d48e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1436_c2_d48e_cond,
result_u8_value_MUX_uxn_opcodes_h_l1436_c2_d48e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1436_c2_d48e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1436_c2_d48e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c2_d48e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c2_d48e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c2_d48e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c2_d48e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c2_d48e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c2_d48e_return_output);

-- printf_uxn_opcodes_h_l1437_c3_2ffb_uxn_opcodes_h_l1437_c3_2ffb
printf_uxn_opcodes_h_l1437_c3_2ffb_uxn_opcodes_h_l1437_c3_2ffb : entity work.printf_uxn_opcodes_h_l1437_c3_2ffb_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1437_c3_2ffb_uxn_opcodes_h_l1437_c3_2ffb_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1441_c11_0e2f
BIN_OP_EQ_uxn_opcodes_h_l1441_c11_0e2f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1441_c11_0e2f_left,
BIN_OP_EQ_uxn_opcodes_h_l1441_c11_0e2f_right,
BIN_OP_EQ_uxn_opcodes_h_l1441_c11_0e2f_return_output);

-- t16_MUX_uxn_opcodes_h_l1441_c7_9ddf
t16_MUX_uxn_opcodes_h_l1441_c7_9ddf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1441_c7_9ddf_cond,
t16_MUX_uxn_opcodes_h_l1441_c7_9ddf_iftrue,
t16_MUX_uxn_opcodes_h_l1441_c7_9ddf_iffalse,
t16_MUX_uxn_opcodes_h_l1441_c7_9ddf_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1441_c7_9ddf
tmp16_MUX_uxn_opcodes_h_l1441_c7_9ddf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1441_c7_9ddf_cond,
tmp16_MUX_uxn_opcodes_h_l1441_c7_9ddf_iftrue,
tmp16_MUX_uxn_opcodes_h_l1441_c7_9ddf_iffalse,
tmp16_MUX_uxn_opcodes_h_l1441_c7_9ddf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1441_c7_9ddf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1441_c7_9ddf : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1441_c7_9ddf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1441_c7_9ddf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1441_c7_9ddf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1441_c7_9ddf_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1441_c7_9ddf
result_is_sp_shift_MUX_uxn_opcodes_h_l1441_c7_9ddf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1441_c7_9ddf_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1441_c7_9ddf_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1441_c7_9ddf_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1441_c7_9ddf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1441_c7_9ddf
result_is_opc_done_MUX_uxn_opcodes_h_l1441_c7_9ddf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1441_c7_9ddf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1441_c7_9ddf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1441_c7_9ddf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1441_c7_9ddf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1441_c7_9ddf
result_is_stack_write_MUX_uxn_opcodes_h_l1441_c7_9ddf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1441_c7_9ddf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1441_c7_9ddf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1441_c7_9ddf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1441_c7_9ddf_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1441_c7_9ddf
result_u8_value_MUX_uxn_opcodes_h_l1441_c7_9ddf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1441_c7_9ddf_cond,
result_u8_value_MUX_uxn_opcodes_h_l1441_c7_9ddf_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1441_c7_9ddf_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1441_c7_9ddf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1441_c7_9ddf
result_sp_relative_shift_MUX_uxn_opcodes_h_l1441_c7_9ddf : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1441_c7_9ddf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1441_c7_9ddf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1441_c7_9ddf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1441_c7_9ddf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1444_c11_c201
BIN_OP_EQ_uxn_opcodes_h_l1444_c11_c201 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1444_c11_c201_left,
BIN_OP_EQ_uxn_opcodes_h_l1444_c11_c201_right,
BIN_OP_EQ_uxn_opcodes_h_l1444_c11_c201_return_output);

-- t16_MUX_uxn_opcodes_h_l1444_c7_86be
t16_MUX_uxn_opcodes_h_l1444_c7_86be : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1444_c7_86be_cond,
t16_MUX_uxn_opcodes_h_l1444_c7_86be_iftrue,
t16_MUX_uxn_opcodes_h_l1444_c7_86be_iffalse,
t16_MUX_uxn_opcodes_h_l1444_c7_86be_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1444_c7_86be
tmp16_MUX_uxn_opcodes_h_l1444_c7_86be : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1444_c7_86be_cond,
tmp16_MUX_uxn_opcodes_h_l1444_c7_86be_iftrue,
tmp16_MUX_uxn_opcodes_h_l1444_c7_86be_iffalse,
tmp16_MUX_uxn_opcodes_h_l1444_c7_86be_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_86be
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_86be : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_86be_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_86be_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_86be_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_86be_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_86be
result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_86be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_86be_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_86be_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_86be_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_86be_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_86be
result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_86be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_86be_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_86be_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_86be_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_86be_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_86be
result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_86be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_86be_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_86be_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_86be_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_86be_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1444_c7_86be
result_u8_value_MUX_uxn_opcodes_h_l1444_c7_86be : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1444_c7_86be_cond,
result_u8_value_MUX_uxn_opcodes_h_l1444_c7_86be_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1444_c7_86be_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1444_c7_86be_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_86be
result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_86be : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_86be_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_86be_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_86be_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_86be_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1446_c3_fed8
CONST_SL_8_uxn_opcodes_h_l1446_c3_fed8 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1446_c3_fed8_x,
CONST_SL_8_uxn_opcodes_h_l1446_c3_fed8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1449_c11_62cf
BIN_OP_EQ_uxn_opcodes_h_l1449_c11_62cf : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1449_c11_62cf_left,
BIN_OP_EQ_uxn_opcodes_h_l1449_c11_62cf_right,
BIN_OP_EQ_uxn_opcodes_h_l1449_c11_62cf_return_output);

-- t16_MUX_uxn_opcodes_h_l1449_c7_e854
t16_MUX_uxn_opcodes_h_l1449_c7_e854 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1449_c7_e854_cond,
t16_MUX_uxn_opcodes_h_l1449_c7_e854_iftrue,
t16_MUX_uxn_opcodes_h_l1449_c7_e854_iffalse,
t16_MUX_uxn_opcodes_h_l1449_c7_e854_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1449_c7_e854
tmp16_MUX_uxn_opcodes_h_l1449_c7_e854 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1449_c7_e854_cond,
tmp16_MUX_uxn_opcodes_h_l1449_c7_e854_iftrue,
tmp16_MUX_uxn_opcodes_h_l1449_c7_e854_iffalse,
tmp16_MUX_uxn_opcodes_h_l1449_c7_e854_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1449_c7_e854
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1449_c7_e854 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1449_c7_e854_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1449_c7_e854_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1449_c7_e854_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1449_c7_e854_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1449_c7_e854
result_is_sp_shift_MUX_uxn_opcodes_h_l1449_c7_e854 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1449_c7_e854_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1449_c7_e854_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1449_c7_e854_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1449_c7_e854_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1449_c7_e854
result_is_opc_done_MUX_uxn_opcodes_h_l1449_c7_e854 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1449_c7_e854_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1449_c7_e854_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1449_c7_e854_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1449_c7_e854_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1449_c7_e854
result_is_stack_write_MUX_uxn_opcodes_h_l1449_c7_e854 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1449_c7_e854_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1449_c7_e854_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1449_c7_e854_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1449_c7_e854_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1449_c7_e854
result_u8_value_MUX_uxn_opcodes_h_l1449_c7_e854 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1449_c7_e854_cond,
result_u8_value_MUX_uxn_opcodes_h_l1449_c7_e854_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1449_c7_e854_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1449_c7_e854_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1449_c7_e854
result_sp_relative_shift_MUX_uxn_opcodes_h_l1449_c7_e854 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1449_c7_e854_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1449_c7_e854_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1449_c7_e854_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1449_c7_e854_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1452_c11_391b
BIN_OP_EQ_uxn_opcodes_h_l1452_c11_391b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1452_c11_391b_left,
BIN_OP_EQ_uxn_opcodes_h_l1452_c11_391b_right,
BIN_OP_EQ_uxn_opcodes_h_l1452_c11_391b_return_output);

-- t16_MUX_uxn_opcodes_h_l1452_c7_e400
t16_MUX_uxn_opcodes_h_l1452_c7_e400 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1452_c7_e400_cond,
t16_MUX_uxn_opcodes_h_l1452_c7_e400_iftrue,
t16_MUX_uxn_opcodes_h_l1452_c7_e400_iffalse,
t16_MUX_uxn_opcodes_h_l1452_c7_e400_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1452_c7_e400
tmp16_MUX_uxn_opcodes_h_l1452_c7_e400 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1452_c7_e400_cond,
tmp16_MUX_uxn_opcodes_h_l1452_c7_e400_iftrue,
tmp16_MUX_uxn_opcodes_h_l1452_c7_e400_iffalse,
tmp16_MUX_uxn_opcodes_h_l1452_c7_e400_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1452_c7_e400
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1452_c7_e400 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1452_c7_e400_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1452_c7_e400_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1452_c7_e400_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1452_c7_e400_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1452_c7_e400
result_is_sp_shift_MUX_uxn_opcodes_h_l1452_c7_e400 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1452_c7_e400_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1452_c7_e400_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1452_c7_e400_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1452_c7_e400_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1452_c7_e400
result_is_opc_done_MUX_uxn_opcodes_h_l1452_c7_e400 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1452_c7_e400_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1452_c7_e400_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1452_c7_e400_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1452_c7_e400_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1452_c7_e400
result_is_stack_write_MUX_uxn_opcodes_h_l1452_c7_e400 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1452_c7_e400_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1452_c7_e400_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1452_c7_e400_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1452_c7_e400_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1452_c7_e400
result_u8_value_MUX_uxn_opcodes_h_l1452_c7_e400 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1452_c7_e400_cond,
result_u8_value_MUX_uxn_opcodes_h_l1452_c7_e400_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1452_c7_e400_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1452_c7_e400_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1452_c7_e400
result_sp_relative_shift_MUX_uxn_opcodes_h_l1452_c7_e400 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1452_c7_e400_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1452_c7_e400_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1452_c7_e400_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1452_c7_e400_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1453_c3_68c2
BIN_OP_OR_uxn_opcodes_h_l1453_c3_68c2 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1453_c3_68c2_left,
BIN_OP_OR_uxn_opcodes_h_l1453_c3_68c2_right,
BIN_OP_OR_uxn_opcodes_h_l1453_c3_68c2_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1454_c11_ba47
BIN_OP_PLUS_uxn_opcodes_h_l1454_c11_ba47 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1454_c11_ba47_left,
BIN_OP_PLUS_uxn_opcodes_h_l1454_c11_ba47_right,
BIN_OP_PLUS_uxn_opcodes_h_l1454_c11_ba47_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1456_c30_628c
sp_relative_shift_uxn_opcodes_h_l1456_c30_628c : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1456_c30_628c_ins,
sp_relative_shift_uxn_opcodes_h_l1456_c30_628c_x,
sp_relative_shift_uxn_opcodes_h_l1456_c30_628c_y,
sp_relative_shift_uxn_opcodes_h_l1456_c30_628c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1461_c11_d807
BIN_OP_EQ_uxn_opcodes_h_l1461_c11_d807 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1461_c11_d807_left,
BIN_OP_EQ_uxn_opcodes_h_l1461_c11_d807_right,
BIN_OP_EQ_uxn_opcodes_h_l1461_c11_d807_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1461_c7_c3be
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1461_c7_c3be : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1461_c7_c3be_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1461_c7_c3be_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1461_c7_c3be_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1461_c7_c3be_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1461_c7_c3be
result_is_sp_shift_MUX_uxn_opcodes_h_l1461_c7_c3be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1461_c7_c3be_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1461_c7_c3be_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1461_c7_c3be_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1461_c7_c3be_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_c3be
result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_c3be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_c3be_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_c3be_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_c3be_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_c3be_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_c3be
result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_c3be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_c3be_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_c3be_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_c3be_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_c3be_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1461_c7_c3be
result_u8_value_MUX_uxn_opcodes_h_l1461_c7_c3be : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1461_c7_c3be_cond,
result_u8_value_MUX_uxn_opcodes_h_l1461_c7_c3be_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1461_c7_c3be_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1461_c7_c3be_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1464_c31_504d
CONST_SR_8_uxn_opcodes_h_l1464_c31_504d : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1464_c31_504d_x,
CONST_SR_8_uxn_opcodes_h_l1464_c31_504d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1466_c11_2d6d
BIN_OP_EQ_uxn_opcodes_h_l1466_c11_2d6d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1466_c11_2d6d_left,
BIN_OP_EQ_uxn_opcodes_h_l1466_c11_2d6d_right,
BIN_OP_EQ_uxn_opcodes_h_l1466_c11_2d6d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1466_c7_744a
result_is_stack_write_MUX_uxn_opcodes_h_l1466_c7_744a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1466_c7_744a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1466_c7_744a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1466_c7_744a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1466_c7_744a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1466_c7_744a
result_is_opc_done_MUX_uxn_opcodes_h_l1466_c7_744a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1466_c7_744a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1466_c7_744a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1466_c7_744a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1466_c7_744a_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1436_c6_90ae_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1436_c1_72a0_return_output,
 t16_MUX_uxn_opcodes_h_l1436_c2_d48e_return_output,
 tmp16_MUX_uxn_opcodes_h_l1436_c2_d48e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c2_d48e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1436_c2_d48e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1436_c2_d48e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1436_c2_d48e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1436_c2_d48e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c2_d48e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1441_c11_0e2f_return_output,
 t16_MUX_uxn_opcodes_h_l1441_c7_9ddf_return_output,
 tmp16_MUX_uxn_opcodes_h_l1441_c7_9ddf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1441_c7_9ddf_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1441_c7_9ddf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1441_c7_9ddf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1441_c7_9ddf_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1441_c7_9ddf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1441_c7_9ddf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1444_c11_c201_return_output,
 t16_MUX_uxn_opcodes_h_l1444_c7_86be_return_output,
 tmp16_MUX_uxn_opcodes_h_l1444_c7_86be_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_86be_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_86be_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_86be_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_86be_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1444_c7_86be_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_86be_return_output,
 CONST_SL_8_uxn_opcodes_h_l1446_c3_fed8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1449_c11_62cf_return_output,
 t16_MUX_uxn_opcodes_h_l1449_c7_e854_return_output,
 tmp16_MUX_uxn_opcodes_h_l1449_c7_e854_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1449_c7_e854_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1449_c7_e854_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1449_c7_e854_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1449_c7_e854_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1449_c7_e854_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1449_c7_e854_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1452_c11_391b_return_output,
 t16_MUX_uxn_opcodes_h_l1452_c7_e400_return_output,
 tmp16_MUX_uxn_opcodes_h_l1452_c7_e400_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1452_c7_e400_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1452_c7_e400_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1452_c7_e400_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1452_c7_e400_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1452_c7_e400_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1452_c7_e400_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1453_c3_68c2_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1454_c11_ba47_return_output,
 sp_relative_shift_uxn_opcodes_h_l1456_c30_628c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1461_c11_d807_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1461_c7_c3be_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1461_c7_c3be_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_c3be_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_c3be_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1461_c7_c3be_return_output,
 CONST_SR_8_uxn_opcodes_h_l1464_c31_504d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1466_c11_2d6d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1466_c7_744a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1466_c7_744a_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1436_c6_90ae_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1436_c6_90ae_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1436_c6_90ae_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1436_c1_72a0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1436_c1_72a0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1436_c1_72a0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1436_c1_72a0_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1436_c2_d48e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1436_c2_d48e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1441_c7_9ddf_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1436_c2_d48e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1436_c2_d48e_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1436_c2_d48e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1436_c2_d48e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1441_c7_9ddf_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1436_c2_d48e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1436_c2_d48e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c2_d48e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1438_c3_62f5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c2_d48e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1441_c7_9ddf_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c2_d48e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c2_d48e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1436_c2_d48e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1436_c2_d48e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1441_c7_9ddf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1436_c2_d48e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1436_c2_d48e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1436_c2_d48e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1436_c2_d48e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1441_c7_9ddf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1436_c2_d48e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1436_c2_d48e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1436_c2_d48e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1436_c2_d48e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1441_c7_9ddf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1436_c2_d48e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1436_c2_d48e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1436_c2_d48e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1436_c2_d48e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1441_c7_9ddf_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1436_c2_d48e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1436_c2_d48e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c2_d48e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c2_d48e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1441_c7_9ddf_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c2_d48e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c2_d48e_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1437_c3_2ffb_uxn_opcodes_h_l1437_c3_2ffb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1441_c11_0e2f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1441_c11_0e2f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1441_c11_0e2f_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1441_c7_9ddf_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1441_c7_9ddf_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1444_c7_86be_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1441_c7_9ddf_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1441_c7_9ddf_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1441_c7_9ddf_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1444_c7_86be_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1441_c7_9ddf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1441_c7_9ddf_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1442_c3_4236 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1441_c7_9ddf_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_86be_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1441_c7_9ddf_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1441_c7_9ddf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1441_c7_9ddf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_86be_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1441_c7_9ddf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1441_c7_9ddf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1441_c7_9ddf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_86be_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1441_c7_9ddf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1441_c7_9ddf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1441_c7_9ddf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_86be_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1441_c7_9ddf_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1441_c7_9ddf_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1441_c7_9ddf_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1444_c7_86be_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1441_c7_9ddf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1441_c7_9ddf_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1441_c7_9ddf_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_86be_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1441_c7_9ddf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_c201_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_c201_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_c201_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1444_c7_86be_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1444_c7_86be_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1449_c7_e854_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1444_c7_86be_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1444_c7_86be_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1444_c7_86be_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1449_c7_e854_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1444_c7_86be_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_86be_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1447_c3_6859 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_86be_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1449_c7_e854_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_86be_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_86be_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_86be_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1449_c7_e854_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_86be_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_86be_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_86be_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1449_c7_e854_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_86be_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_86be_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_86be_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1449_c7_e854_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_86be_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1444_c7_86be_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1444_c7_86be_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1449_c7_e854_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1444_c7_86be_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_86be_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_86be_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1449_c7_e854_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_86be_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1446_c3_fed8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1446_c3_fed8_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1449_c11_62cf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1449_c11_62cf_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1449_c11_62cf_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1449_c7_e854_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1449_c7_e854_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1452_c7_e400_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1449_c7_e854_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1449_c7_e854_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1449_c7_e854_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1452_c7_e400_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1449_c7_e854_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1449_c7_e854_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1450_c3_501e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1449_c7_e854_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1452_c7_e400_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1449_c7_e854_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1449_c7_e854_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1449_c7_e854_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1452_c7_e400_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1449_c7_e854_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1449_c7_e854_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1449_c7_e854_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1452_c7_e400_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1449_c7_e854_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1449_c7_e854_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1449_c7_e854_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1452_c7_e400_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1449_c7_e854_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1449_c7_e854_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1449_c7_e854_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1452_c7_e400_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1449_c7_e854_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1449_c7_e854_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1449_c7_e854_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1452_c7_e400_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1449_c7_e854_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1452_c11_391b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1452_c11_391b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1452_c11_391b_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1452_c7_e400_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1452_c7_e400_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1452_c7_e400_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1452_c7_e400_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l1454_c3_0585 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1452_c7_e400_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1452_c7_e400_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1452_c7_e400_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1458_c3_7ac4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1452_c7_e400_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1461_c7_c3be_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1452_c7_e400_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1452_c7_e400_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1452_c7_e400_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1461_c7_c3be_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1452_c7_e400_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1452_c7_e400_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1452_c7_e400_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_c3be_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1452_c7_e400_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1452_c7_e400_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1452_c7_e400_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_c3be_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1452_c7_e400_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1452_c7_e400_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1452_c7_e400_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1461_c7_c3be_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1452_c7_e400_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1452_c7_e400_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1452_c7_e400_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1452_c7_e400_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1453_c3_68c2_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1453_c3_68c2_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1453_c3_68c2_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1454_c11_ba47_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1454_c11_ba47_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1454_c11_ba47_return_output : unsigned(16 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1456_c30_628c_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1456_c30_628c_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1456_c30_628c_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1456_c30_628c_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1459_c21_5522_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1461_c11_d807_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1461_c11_d807_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1461_c11_d807_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1461_c7_c3be_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1463_c3_7b0b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1461_c7_c3be_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1461_c7_c3be_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1461_c7_c3be_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1461_c7_c3be_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1461_c7_c3be_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1461_c7_c3be_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_c3be_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_c3be_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1466_c7_744a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_c3be_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_c3be_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_c3be_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1466_c7_744a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_c3be_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1461_c7_c3be_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1461_c7_c3be_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1461_c7_c3be_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1464_c31_504d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1464_c31_504d_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1464_c21_0a08_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1466_c11_2d6d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1466_c11_2d6d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1466_c11_2d6d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1466_c7_744a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1466_c7_744a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1466_c7_744a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1466_c7_744a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1466_c7_744a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1466_c7_744a_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1449_l1444_l1441_l1436_l1461_DUPLICATE_8905_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1449_l1444_l1441_l1436_l1466_l1461_DUPLICATE_cbce_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1449_l1444_l1441_l1436_l1461_DUPLICATE_0aa4_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1452_l1449_l1444_l1441_l1436_DUPLICATE_5006_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1452_l1449_l1444_l1441_l1466_l1461_DUPLICATE_f0aa_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1445_l1453_DUPLICATE_953a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l1432_l1471_DUPLICATE_3425_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_c201_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1466_c7_744a_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1452_c7_e400_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1436_c6_90ae_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1436_c2_d48e_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1456_c30_628c_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1458_c3_7ac4 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1452_c7_e400_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1458_c3_7ac4;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1466_c11_2d6d_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1463_c3_7b0b := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1461_c7_c3be_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1463_c3_7b0b;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1438_c3_62f5 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c2_d48e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1438_c3_62f5;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1447_c3_6859 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_86be_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1447_c3_6859;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1466_c7_744a_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1452_c7_e400_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1450_c3_501e := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1449_c7_e854_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1450_c3_501e;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1454_c11_ba47_right := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1436_c1_72a0_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1442_c3_4236 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1441_c7_9ddf_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1442_c3_4236;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1461_c11_d807_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1452_c11_391b_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1449_c11_62cf_right := to_unsigned(3, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l1456_c30_628c_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1441_c11_0e2f_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1461_c7_c3be_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1436_c1_72a0_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1456_c30_628c_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1436_c6_90ae_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1441_c11_0e2f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_c201_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1449_c11_62cf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1452_c11_391b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1461_c11_d807_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1466_c11_2d6d_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1453_c3_68c2_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1436_c2_d48e_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1441_c7_9ddf_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1449_c7_e854_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1452_c7_e400_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1464_c31_504d_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1436_c2_d48e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1441_c7_9ddf_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1444_c7_86be_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1449_c7_e854_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1452_c7_e400_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1461_c11_d807] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1461_c11_d807_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1461_c11_d807_left;
     BIN_OP_EQ_uxn_opcodes_h_l1461_c11_d807_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1461_c11_d807_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1461_c11_d807_return_output := BIN_OP_EQ_uxn_opcodes_h_l1461_c11_d807_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1464_c31_504d] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1464_c31_504d_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1464_c31_504d_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1464_c31_504d_return_output := CONST_SR_8_uxn_opcodes_h_l1464_c31_504d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1444_c11_c201] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1444_c11_c201_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_c201_left;
     BIN_OP_EQ_uxn_opcodes_h_l1444_c11_c201_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_c201_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_c201_return_output := BIN_OP_EQ_uxn_opcodes_h_l1444_c11_c201_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1449_l1444_l1441_l1436_l1461_DUPLICATE_0aa4 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1449_l1444_l1441_l1436_l1461_DUPLICATE_0aa4_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1466_c11_2d6d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1466_c11_2d6d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1466_c11_2d6d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1466_c11_2d6d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1466_c11_2d6d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1466_c11_2d6d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1466_c11_2d6d_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1456_c30_628c] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1456_c30_628c_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1456_c30_628c_ins;
     sp_relative_shift_uxn_opcodes_h_l1456_c30_628c_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1456_c30_628c_x;
     sp_relative_shift_uxn_opcodes_h_l1456_c30_628c_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1456_c30_628c_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1456_c30_628c_return_output := sp_relative_shift_uxn_opcodes_h_l1456_c30_628c_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1461_c7_c3be] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1461_c7_c3be_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1449_l1444_l1441_l1436_l1461_DUPLICATE_8905 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1449_l1444_l1441_l1436_l1461_DUPLICATE_8905_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1441_c11_0e2f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1441_c11_0e2f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1441_c11_0e2f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1441_c11_0e2f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1441_c11_0e2f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1441_c11_0e2f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1441_c11_0e2f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1449_l1444_l1441_l1436_l1466_l1461_DUPLICATE_cbce LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1449_l1444_l1441_l1436_l1466_l1461_DUPLICATE_cbce_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1436_c6_90ae] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1436_c6_90ae_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1436_c6_90ae_left;
     BIN_OP_EQ_uxn_opcodes_h_l1436_c6_90ae_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1436_c6_90ae_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1436_c6_90ae_return_output := BIN_OP_EQ_uxn_opcodes_h_l1436_c6_90ae_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1452_l1449_l1444_l1441_l1436_DUPLICATE_5006 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1452_l1449_l1444_l1441_l1436_DUPLICATE_5006_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1452_l1449_l1444_l1441_l1466_l1461_DUPLICATE_f0aa LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1452_l1449_l1444_l1441_l1466_l1461_DUPLICATE_f0aa_return_output := result.is_opc_done;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1445_l1453_DUPLICATE_953a LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1445_l1453_DUPLICATE_953a_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1452_c11_391b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1452_c11_391b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1452_c11_391b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1452_c11_391b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1452_c11_391b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1452_c11_391b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1452_c11_391b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1449_c11_62cf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1449_c11_62cf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1449_c11_62cf_left;
     BIN_OP_EQ_uxn_opcodes_h_l1449_c11_62cf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1449_c11_62cf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1449_c11_62cf_return_output := BIN_OP_EQ_uxn_opcodes_h_l1449_c11_62cf_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1436_c1_72a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1436_c6_90ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1436_c2_d48e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1436_c6_90ae_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1436_c2_d48e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1436_c6_90ae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1436_c2_d48e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1436_c6_90ae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c2_d48e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1436_c6_90ae_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c2_d48e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1436_c6_90ae_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1436_c2_d48e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1436_c6_90ae_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1436_c2_d48e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1436_c6_90ae_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1436_c2_d48e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1436_c6_90ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1441_c7_9ddf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1441_c11_0e2f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1441_c7_9ddf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1441_c11_0e2f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1441_c7_9ddf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1441_c11_0e2f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1441_c7_9ddf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1441_c11_0e2f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1441_c7_9ddf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1441_c11_0e2f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1441_c7_9ddf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1441_c11_0e2f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1441_c7_9ddf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1441_c11_0e2f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1441_c7_9ddf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1441_c11_0e2f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_86be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_c201_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_86be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_c201_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_86be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_c201_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_86be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_c201_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_86be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_c201_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1444_c7_86be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_c201_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1444_c7_86be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_c201_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1444_c7_86be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_c201_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1449_c7_e854_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1449_c11_62cf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1449_c7_e854_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1449_c11_62cf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1449_c7_e854_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1449_c11_62cf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1449_c7_e854_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1449_c11_62cf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1449_c7_e854_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1449_c11_62cf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1449_c7_e854_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1449_c11_62cf_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1449_c7_e854_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1449_c11_62cf_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1449_c7_e854_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1449_c11_62cf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1452_c7_e400_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1452_c11_391b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1452_c7_e400_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1452_c11_391b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1452_c7_e400_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1452_c11_391b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1452_c7_e400_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1452_c11_391b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1452_c7_e400_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1452_c11_391b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1452_c7_e400_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1452_c11_391b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1452_c7_e400_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1452_c11_391b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1452_c7_e400_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1452_c11_391b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_c3be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1461_c11_d807_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1461_c7_c3be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1461_c11_d807_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_c3be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1461_c11_d807_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1461_c7_c3be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1461_c11_d807_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1461_c7_c3be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1461_c11_d807_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1466_c7_744a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1466_c11_2d6d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1466_c7_744a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1466_c11_2d6d_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1453_c3_68c2_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1445_l1453_DUPLICATE_953a_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1446_c3_fed8_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1445_l1453_DUPLICATE_953a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c2_d48e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1452_l1449_l1444_l1441_l1436_DUPLICATE_5006_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1441_c7_9ddf_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1452_l1449_l1444_l1441_l1436_DUPLICATE_5006_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_86be_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1452_l1449_l1444_l1441_l1436_DUPLICATE_5006_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1449_c7_e854_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1452_l1449_l1444_l1441_l1436_DUPLICATE_5006_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1452_c7_e400_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1452_l1449_l1444_l1441_l1436_DUPLICATE_5006_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1441_c7_9ddf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1452_l1449_l1444_l1441_l1466_l1461_DUPLICATE_f0aa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_86be_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1452_l1449_l1444_l1441_l1466_l1461_DUPLICATE_f0aa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1449_c7_e854_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1452_l1449_l1444_l1441_l1466_l1461_DUPLICATE_f0aa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1452_c7_e400_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1452_l1449_l1444_l1441_l1466_l1461_DUPLICATE_f0aa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_c3be_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1452_l1449_l1444_l1441_l1466_l1461_DUPLICATE_f0aa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1466_c7_744a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1452_l1449_l1444_l1441_l1466_l1461_DUPLICATE_f0aa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1436_c2_d48e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1449_l1444_l1441_l1436_l1461_DUPLICATE_8905_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1441_c7_9ddf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1449_l1444_l1441_l1436_l1461_DUPLICATE_8905_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_86be_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1449_l1444_l1441_l1436_l1461_DUPLICATE_8905_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1449_c7_e854_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1449_l1444_l1441_l1436_l1461_DUPLICATE_8905_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1461_c7_c3be_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1449_l1444_l1441_l1436_l1461_DUPLICATE_8905_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1436_c2_d48e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1449_l1444_l1441_l1436_l1466_l1461_DUPLICATE_cbce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1441_c7_9ddf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1449_l1444_l1441_l1436_l1466_l1461_DUPLICATE_cbce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_86be_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1449_l1444_l1441_l1436_l1466_l1461_DUPLICATE_cbce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1449_c7_e854_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1449_l1444_l1441_l1436_l1466_l1461_DUPLICATE_cbce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_c3be_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1449_l1444_l1441_l1436_l1466_l1461_DUPLICATE_cbce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1466_c7_744a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1449_l1444_l1441_l1436_l1466_l1461_DUPLICATE_cbce_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1436_c2_d48e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1449_l1444_l1441_l1436_l1461_DUPLICATE_0aa4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1441_c7_9ddf_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1449_l1444_l1441_l1436_l1461_DUPLICATE_0aa4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1444_c7_86be_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1449_l1444_l1441_l1436_l1461_DUPLICATE_0aa4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1449_c7_e854_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1449_l1444_l1441_l1436_l1461_DUPLICATE_0aa4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1461_c7_c3be_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1449_l1444_l1441_l1436_l1461_DUPLICATE_0aa4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1461_c7_c3be_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1461_c7_c3be_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1452_c7_e400_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1456_c30_628c_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1461_c7_c3be] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1461_c7_c3be_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1461_c7_c3be_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1461_c7_c3be_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1461_c7_c3be_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1461_c7_c3be_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1461_c7_c3be_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1461_c7_c3be_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1461_c7_c3be_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1461_c7_c3be] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1461_c7_c3be_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1461_c7_c3be_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1461_c7_c3be_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1461_c7_c3be_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1461_c7_c3be_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1461_c7_c3be_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1461_c7_c3be_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1461_c7_c3be_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1452_c7_e400] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1452_c7_e400_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1452_c7_e400_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1452_c7_e400_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1452_c7_e400_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1452_c7_e400_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1452_c7_e400_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1452_c7_e400_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1452_c7_e400_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1446_c3_fed8] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1446_c3_fed8_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1446_c3_fed8_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1446_c3_fed8_return_output := CONST_SL_8_uxn_opcodes_h_l1446_c3_fed8_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1464_c21_0a08] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1464_c21_0a08_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1464_c31_504d_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1466_c7_744a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1466_c7_744a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1466_c7_744a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1466_c7_744a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1466_c7_744a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1466_c7_744a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1466_c7_744a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1466_c7_744a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1466_c7_744a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1436_c1_72a0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1436_c1_72a0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1436_c1_72a0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1436_c1_72a0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1436_c1_72a0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1436_c1_72a0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1436_c1_72a0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1436_c1_72a0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1436_c1_72a0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1466_c7_744a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1466_c7_744a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1466_c7_744a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1466_c7_744a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1466_c7_744a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1466_c7_744a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1466_c7_744a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1466_c7_744a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1466_c7_744a_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1453_c3_68c2] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1453_c3_68c2_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1453_c3_68c2_left;
     BIN_OP_OR_uxn_opcodes_h_l1453_c3_68c2_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1453_c3_68c2_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1453_c3_68c2_return_output := BIN_OP_OR_uxn_opcodes_h_l1453_c3_68c2_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1454_c11_ba47_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1453_c3_68c2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1452_c7_e400_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1453_c3_68c2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1461_c7_c3be_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1464_c21_0a08_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1444_c7_86be_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1446_c3_fed8_return_output;
     VAR_printf_uxn_opcodes_h_l1437_c3_2ffb_uxn_opcodes_h_l1437_c3_2ffb_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1436_c1_72a0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_c3be_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1466_c7_744a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1452_c7_e400_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1461_c7_c3be_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_c3be_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1466_c7_744a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1449_c7_e854_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1452_c7_e400_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1452_c7_e400_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1461_c7_c3be_return_output;
     -- t16_MUX[uxn_opcodes_h_l1452_c7_e400] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1452_c7_e400_cond <= VAR_t16_MUX_uxn_opcodes_h_l1452_c7_e400_cond;
     t16_MUX_uxn_opcodes_h_l1452_c7_e400_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1452_c7_e400_iftrue;
     t16_MUX_uxn_opcodes_h_l1452_c7_e400_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1452_c7_e400_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1452_c7_e400_return_output := t16_MUX_uxn_opcodes_h_l1452_c7_e400_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1461_c7_c3be] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_c3be_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_c3be_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_c3be_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_c3be_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_c3be_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_c3be_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_c3be_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_c3be_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1449_c7_e854] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1449_c7_e854_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1449_c7_e854_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1449_c7_e854_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1449_c7_e854_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1449_c7_e854_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1449_c7_e854_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1449_c7_e854_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1449_c7_e854_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1461_c7_c3be] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_c3be_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_c3be_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_c3be_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_c3be_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_c3be_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_c3be_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_c3be_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_c3be_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1454_c11_ba47] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1454_c11_ba47_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1454_c11_ba47_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1454_c11_ba47_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1454_c11_ba47_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1454_c11_ba47_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1454_c11_ba47_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1461_c7_c3be] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1461_c7_c3be_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1461_c7_c3be_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1461_c7_c3be_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1461_c7_c3be_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1461_c7_c3be_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1461_c7_c3be_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1461_c7_c3be_return_output := result_u8_value_MUX_uxn_opcodes_h_l1461_c7_c3be_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1452_c7_e400] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1452_c7_e400_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1452_c7_e400_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1452_c7_e400_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1452_c7_e400_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1452_c7_e400_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1452_c7_e400_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1452_c7_e400_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1452_c7_e400_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1452_c7_e400] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1452_c7_e400_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1452_c7_e400_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1452_c7_e400_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1452_c7_e400_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1452_c7_e400_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1452_c7_e400_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1452_c7_e400_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1452_c7_e400_return_output;

     -- printf_uxn_opcodes_h_l1437_c3_2ffb[uxn_opcodes_h_l1437_c3_2ffb] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1437_c3_2ffb_uxn_opcodes_h_l1437_c3_2ffb_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1437_c3_2ffb_uxn_opcodes_h_l1437_c3_2ffb_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l1454_c3_0585 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1454_c11_ba47_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1452_c7_e400_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1461_c7_c3be_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1449_c7_e854_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1452_c7_e400_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1452_c7_e400_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1461_c7_c3be_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_86be_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1449_c7_e854_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1449_c7_e854_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1452_c7_e400_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1452_c7_e400_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1461_c7_c3be_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1449_c7_e854_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1452_c7_e400_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1452_c7_e400_iftrue := VAR_tmp16_uxn_opcodes_h_l1454_c3_0585;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1449_c7_e854] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1449_c7_e854_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1449_c7_e854_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1449_c7_e854_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1449_c7_e854_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1449_c7_e854_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1449_c7_e854_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1449_c7_e854_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1449_c7_e854_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1452_c7_e400] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1452_c7_e400_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1452_c7_e400_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1452_c7_e400_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1452_c7_e400_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1452_c7_e400_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1452_c7_e400_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1452_c7_e400_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1452_c7_e400_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1452_c7_e400] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1452_c7_e400_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1452_c7_e400_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1452_c7_e400_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1452_c7_e400_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1452_c7_e400_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1452_c7_e400_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1452_c7_e400_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1452_c7_e400_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1449_c7_e854] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1449_c7_e854_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1449_c7_e854_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1449_c7_e854_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1449_c7_e854_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1449_c7_e854_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1449_c7_e854_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1449_c7_e854_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1449_c7_e854_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1459_c21_5522] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1459_c21_5522_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_tmp16_uxn_opcodes_h_l1454_c3_0585);

     -- t16_MUX[uxn_opcodes_h_l1449_c7_e854] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1449_c7_e854_cond <= VAR_t16_MUX_uxn_opcodes_h_l1449_c7_e854_cond;
     t16_MUX_uxn_opcodes_h_l1449_c7_e854_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1449_c7_e854_iftrue;
     t16_MUX_uxn_opcodes_h_l1449_c7_e854_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1449_c7_e854_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1449_c7_e854_return_output := t16_MUX_uxn_opcodes_h_l1449_c7_e854_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1444_c7_86be] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_86be_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_86be_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_86be_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_86be_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_86be_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_86be_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_86be_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_86be_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1452_c7_e400] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1452_c7_e400_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1452_c7_e400_cond;
     tmp16_MUX_uxn_opcodes_h_l1452_c7_e400_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1452_c7_e400_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1452_c7_e400_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1452_c7_e400_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1452_c7_e400_return_output := tmp16_MUX_uxn_opcodes_h_l1452_c7_e400_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1452_c7_e400_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1459_c21_5522_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1449_c7_e854_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1452_c7_e400_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_86be_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1449_c7_e854_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1449_c7_e854_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1452_c7_e400_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1441_c7_9ddf_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_86be_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_86be_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1449_c7_e854_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1444_c7_86be_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1449_c7_e854_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1449_c7_e854_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1452_c7_e400_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1444_c7_86be] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_86be_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_86be_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_86be_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_86be_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_86be_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_86be_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_86be_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_86be_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1449_c7_e854] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1449_c7_e854_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1449_c7_e854_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1449_c7_e854_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1449_c7_e854_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1449_c7_e854_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1449_c7_e854_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1449_c7_e854_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1449_c7_e854_return_output;

     -- t16_MUX[uxn_opcodes_h_l1444_c7_86be] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1444_c7_86be_cond <= VAR_t16_MUX_uxn_opcodes_h_l1444_c7_86be_cond;
     t16_MUX_uxn_opcodes_h_l1444_c7_86be_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1444_c7_86be_iftrue;
     t16_MUX_uxn_opcodes_h_l1444_c7_86be_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1444_c7_86be_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1444_c7_86be_return_output := t16_MUX_uxn_opcodes_h_l1444_c7_86be_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1452_c7_e400] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1452_c7_e400_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1452_c7_e400_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1452_c7_e400_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1452_c7_e400_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1452_c7_e400_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1452_c7_e400_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1452_c7_e400_return_output := result_u8_value_MUX_uxn_opcodes_h_l1452_c7_e400_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1449_c7_e854] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1449_c7_e854_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1449_c7_e854_cond;
     tmp16_MUX_uxn_opcodes_h_l1449_c7_e854_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1449_c7_e854_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1449_c7_e854_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1449_c7_e854_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1449_c7_e854_return_output := tmp16_MUX_uxn_opcodes_h_l1449_c7_e854_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1449_c7_e854] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1449_c7_e854_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1449_c7_e854_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1449_c7_e854_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1449_c7_e854_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1449_c7_e854_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1449_c7_e854_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1449_c7_e854_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1449_c7_e854_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1441_c7_9ddf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1441_c7_9ddf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1441_c7_9ddf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1441_c7_9ddf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1441_c7_9ddf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1441_c7_9ddf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1441_c7_9ddf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1441_c7_9ddf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1441_c7_9ddf_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1444_c7_86be] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_86be_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_86be_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_86be_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_86be_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_86be_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_86be_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_86be_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_86be_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_86be_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1449_c7_e854_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1441_c7_9ddf_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_86be_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_86be_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1449_c7_e854_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c2_d48e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1441_c7_9ddf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1441_c7_9ddf_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_86be_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1449_c7_e854_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1452_c7_e400_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1441_c7_9ddf_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1444_c7_86be_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1444_c7_86be_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1449_c7_e854_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1436_c2_d48e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c2_d48e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c2_d48e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c2_d48e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c2_d48e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c2_d48e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c2_d48e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c2_d48e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c2_d48e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1449_c7_e854] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1449_c7_e854_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1449_c7_e854_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1449_c7_e854_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1449_c7_e854_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1449_c7_e854_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1449_c7_e854_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1449_c7_e854_return_output := result_u8_value_MUX_uxn_opcodes_h_l1449_c7_e854_return_output;

     -- t16_MUX[uxn_opcodes_h_l1441_c7_9ddf] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1441_c7_9ddf_cond <= VAR_t16_MUX_uxn_opcodes_h_l1441_c7_9ddf_cond;
     t16_MUX_uxn_opcodes_h_l1441_c7_9ddf_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1441_c7_9ddf_iftrue;
     t16_MUX_uxn_opcodes_h_l1441_c7_9ddf_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1441_c7_9ddf_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1441_c7_9ddf_return_output := t16_MUX_uxn_opcodes_h_l1441_c7_9ddf_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1441_c7_9ddf] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1441_c7_9ddf_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1441_c7_9ddf_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1441_c7_9ddf_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1441_c7_9ddf_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1441_c7_9ddf_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1441_c7_9ddf_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1441_c7_9ddf_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1441_c7_9ddf_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1444_c7_86be] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1444_c7_86be_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1444_c7_86be_cond;
     tmp16_MUX_uxn_opcodes_h_l1444_c7_86be_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1444_c7_86be_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1444_c7_86be_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1444_c7_86be_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1444_c7_86be_return_output := tmp16_MUX_uxn_opcodes_h_l1444_c7_86be_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1444_c7_86be] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_86be_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_86be_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_86be_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_86be_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_86be_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_86be_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_86be_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_86be_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1441_c7_9ddf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1441_c7_9ddf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1441_c7_9ddf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1441_c7_9ddf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1441_c7_9ddf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1441_c7_9ddf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1441_c7_9ddf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1441_c7_9ddf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1441_c7_9ddf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1444_c7_86be] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_86be_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_86be_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_86be_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_86be_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_86be_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_86be_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_86be_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_86be_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1441_c7_9ddf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_86be_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1436_c2_d48e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1441_c7_9ddf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1441_c7_9ddf_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_86be_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c2_d48e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1441_c7_9ddf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1444_c7_86be_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1449_c7_e854_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1436_c2_d48e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1441_c7_9ddf_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1441_c7_9ddf_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1444_c7_86be_return_output;
     -- t16_MUX[uxn_opcodes_h_l1436_c2_d48e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1436_c2_d48e_cond <= VAR_t16_MUX_uxn_opcodes_h_l1436_c2_d48e_cond;
     t16_MUX_uxn_opcodes_h_l1436_c2_d48e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1436_c2_d48e_iftrue;
     t16_MUX_uxn_opcodes_h_l1436_c2_d48e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1436_c2_d48e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1436_c2_d48e_return_output := t16_MUX_uxn_opcodes_h_l1436_c2_d48e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1441_c7_9ddf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1441_c7_9ddf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1441_c7_9ddf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1441_c7_9ddf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1441_c7_9ddf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1441_c7_9ddf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1441_c7_9ddf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1441_c7_9ddf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1441_c7_9ddf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1441_c7_9ddf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1441_c7_9ddf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1441_c7_9ddf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1441_c7_9ddf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1441_c7_9ddf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1441_c7_9ddf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1441_c7_9ddf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1441_c7_9ddf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1441_c7_9ddf_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1436_c2_d48e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c2_d48e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c2_d48e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c2_d48e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c2_d48e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c2_d48e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c2_d48e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c2_d48e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c2_d48e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1436_c2_d48e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1436_c2_d48e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1436_c2_d48e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1436_c2_d48e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1436_c2_d48e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1436_c2_d48e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1436_c2_d48e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1436_c2_d48e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1436_c2_d48e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1441_c7_9ddf] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1441_c7_9ddf_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1441_c7_9ddf_cond;
     tmp16_MUX_uxn_opcodes_h_l1441_c7_9ddf_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1441_c7_9ddf_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1441_c7_9ddf_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1441_c7_9ddf_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1441_c7_9ddf_return_output := tmp16_MUX_uxn_opcodes_h_l1441_c7_9ddf_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1444_c7_86be] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1444_c7_86be_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1444_c7_86be_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1444_c7_86be_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1444_c7_86be_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1444_c7_86be_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1444_c7_86be_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1444_c7_86be_return_output := result_u8_value_MUX_uxn_opcodes_h_l1444_c7_86be_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1436_c2_d48e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1441_c7_9ddf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1436_c2_d48e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1441_c7_9ddf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1441_c7_9ddf_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1444_c7_86be_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1436_c2_d48e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1436_c2_d48e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1441_c7_9ddf_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1436_c2_d48e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1436_c2_d48e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1436_c2_d48e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1436_c2_d48e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1436_c2_d48e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1436_c2_d48e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1436_c2_d48e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1436_c2_d48e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1436_c2_d48e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1436_c2_d48e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1436_c2_d48e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1436_c2_d48e_cond;
     tmp16_MUX_uxn_opcodes_h_l1436_c2_d48e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1436_c2_d48e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1436_c2_d48e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1436_c2_d48e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1436_c2_d48e_return_output := tmp16_MUX_uxn_opcodes_h_l1436_c2_d48e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1436_c2_d48e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1436_c2_d48e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1436_c2_d48e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1436_c2_d48e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1436_c2_d48e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1436_c2_d48e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1436_c2_d48e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1436_c2_d48e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1436_c2_d48e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1441_c7_9ddf] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1441_c7_9ddf_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1441_c7_9ddf_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1441_c7_9ddf_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1441_c7_9ddf_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1441_c7_9ddf_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1441_c7_9ddf_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1441_c7_9ddf_return_output := result_u8_value_MUX_uxn_opcodes_h_l1441_c7_9ddf_return_output;

     -- Submodule level 8
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1436_c2_d48e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1441_c7_9ddf_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1436_c2_d48e_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1436_c2_d48e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1436_c2_d48e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1436_c2_d48e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1436_c2_d48e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1436_c2_d48e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1436_c2_d48e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1436_c2_d48e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1436_c2_d48e_return_output := result_u8_value_MUX_uxn_opcodes_h_l1436_c2_d48e_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l1432_l1471_DUPLICATE_3425 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l1432_l1471_DUPLICATE_3425_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_641b(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1436_c2_d48e_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1436_c2_d48e_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1436_c2_d48e_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1436_c2_d48e_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1436_c2_d48e_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1436_c2_d48e_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l1432_l1471_DUPLICATE_3425_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l1432_l1471_DUPLICATE_3425_return_output;
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
