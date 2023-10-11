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
-- Submodules: 84
entity ldz2_0CLK_77d0ca3d is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ldz2_0CLK_77d0ca3d;
architecture arch of ldz2_0CLK_77d0ca3d is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1594_c6_2ab4]
signal BIN_OP_EQ_uxn_opcodes_h_l1594_c6_2ab4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1594_c6_2ab4_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1594_c6_2ab4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1594_c1_d07c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1594_c1_d07c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1594_c1_d07c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1594_c1_d07c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1594_c1_d07c_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1594_c2_540e]
signal tmp16_MUX_uxn_opcodes_h_l1594_c2_540e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1594_c2_540e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1594_c2_540e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1594_c2_540e_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l1594_c2_540e]
signal t8_MUX_uxn_opcodes_h_l1594_c2_540e_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1594_c2_540e_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1594_c2_540e_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1594_c2_540e_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1594_c2_540e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1594_c2_540e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1594_c2_540e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1594_c2_540e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1594_c2_540e_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1594_c2_540e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c2_540e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c2_540e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c2_540e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c2_540e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1594_c2_540e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c2_540e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c2_540e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c2_540e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c2_540e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1594_c2_540e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c2_540e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c2_540e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c2_540e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c2_540e_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1594_c2_540e]
signal result_stack_value_MUX_uxn_opcodes_h_l1594_c2_540e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1594_c2_540e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1594_c2_540e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1594_c2_540e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1594_c2_540e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1594_c2_540e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1594_c2_540e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1594_c2_540e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1594_c2_540e_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1594_c2_540e]
signal result_ram_addr_MUX_uxn_opcodes_h_l1594_c2_540e_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1594_c2_540e_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1594_c2_540e_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1594_c2_540e_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1595_c3_e1e3[uxn_opcodes_h_l1595_c3_e1e3]
signal printf_uxn_opcodes_h_l1595_c3_e1e3_uxn_opcodes_h_l1595_c3_e1e3_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1599_c11_d20a]
signal BIN_OP_EQ_uxn_opcodes_h_l1599_c11_d20a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1599_c11_d20a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1599_c11_d20a_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1599_c7_51bd]
signal tmp16_MUX_uxn_opcodes_h_l1599_c7_51bd_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1599_c7_51bd_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1599_c7_51bd_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1599_c7_51bd_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l1599_c7_51bd]
signal t8_MUX_uxn_opcodes_h_l1599_c7_51bd_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1599_c7_51bd_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1599_c7_51bd_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1599_c7_51bd_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1599_c7_51bd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1599_c7_51bd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1599_c7_51bd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1599_c7_51bd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1599_c7_51bd_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1599_c7_51bd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1599_c7_51bd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1599_c7_51bd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1599_c7_51bd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1599_c7_51bd_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1599_c7_51bd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1599_c7_51bd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1599_c7_51bd_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1599_c7_51bd_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1599_c7_51bd_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1599_c7_51bd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1599_c7_51bd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1599_c7_51bd_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1599_c7_51bd_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1599_c7_51bd_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1599_c7_51bd]
signal result_stack_value_MUX_uxn_opcodes_h_l1599_c7_51bd_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1599_c7_51bd_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1599_c7_51bd_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1599_c7_51bd_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1599_c7_51bd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1599_c7_51bd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1599_c7_51bd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1599_c7_51bd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1599_c7_51bd_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1599_c7_51bd]
signal result_ram_addr_MUX_uxn_opcodes_h_l1599_c7_51bd_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1599_c7_51bd_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1599_c7_51bd_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1599_c7_51bd_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1602_c11_c443]
signal BIN_OP_EQ_uxn_opcodes_h_l1602_c11_c443_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1602_c11_c443_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1602_c11_c443_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1602_c7_6fc0]
signal tmp16_MUX_uxn_opcodes_h_l1602_c7_6fc0_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1602_c7_6fc0_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1602_c7_6fc0_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1602_c7_6fc0_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l1602_c7_6fc0]
signal t8_MUX_uxn_opcodes_h_l1602_c7_6fc0_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1602_c7_6fc0_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1602_c7_6fc0_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1602_c7_6fc0_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1602_c7_6fc0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_6fc0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_6fc0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_6fc0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_6fc0_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1602_c7_6fc0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1602_c7_6fc0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1602_c7_6fc0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1602_c7_6fc0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1602_c7_6fc0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1602_c7_6fc0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1602_c7_6fc0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1602_c7_6fc0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1602_c7_6fc0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1602_c7_6fc0_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1602_c7_6fc0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1602_c7_6fc0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1602_c7_6fc0_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1602_c7_6fc0_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1602_c7_6fc0_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1602_c7_6fc0]
signal result_stack_value_MUX_uxn_opcodes_h_l1602_c7_6fc0_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1602_c7_6fc0_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1602_c7_6fc0_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1602_c7_6fc0_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1602_c7_6fc0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_6fc0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_6fc0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_6fc0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_6fc0_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1602_c7_6fc0]
signal result_ram_addr_MUX_uxn_opcodes_h_l1602_c7_6fc0_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1602_c7_6fc0_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1602_c7_6fc0_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1602_c7_6fc0_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1605_c32_87a3]
signal BIN_OP_AND_uxn_opcodes_h_l1605_c32_87a3_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1605_c32_87a3_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1605_c32_87a3_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1605_c32_c20e]
signal BIN_OP_GT_uxn_opcodes_h_l1605_c32_c20e_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1605_c32_c20e_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1605_c32_c20e_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1605_c32_28e6]
signal MUX_uxn_opcodes_h_l1605_c32_28e6_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1605_c32_28e6_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1605_c32_28e6_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1605_c32_28e6_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1608_c11_60a3]
signal BIN_OP_EQ_uxn_opcodes_h_l1608_c11_60a3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1608_c11_60a3_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1608_c11_60a3_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1608_c7_3cbb]
signal tmp16_MUX_uxn_opcodes_h_l1608_c7_3cbb_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1608_c7_3cbb_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1608_c7_3cbb_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1608_c7_3cbb_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1608_c7_3cbb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_3cbb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_3cbb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_3cbb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_3cbb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1608_c7_3cbb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1608_c7_3cbb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1608_c7_3cbb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1608_c7_3cbb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1608_c7_3cbb_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1608_c7_3cbb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_3cbb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_3cbb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_3cbb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_3cbb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1608_c7_3cbb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_3cbb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_3cbb_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_3cbb_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_3cbb_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1608_c7_3cbb]
signal result_stack_value_MUX_uxn_opcodes_h_l1608_c7_3cbb_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1608_c7_3cbb_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1608_c7_3cbb_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1608_c7_3cbb_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1608_c7_3cbb]
signal result_ram_addr_MUX_uxn_opcodes_h_l1608_c7_3cbb_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1608_c7_3cbb_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1608_c7_3cbb_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1608_c7_3cbb_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1612_c11_124d]
signal BIN_OP_EQ_uxn_opcodes_h_l1612_c11_124d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1612_c11_124d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1612_c11_124d_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1612_c7_1674]
signal tmp16_MUX_uxn_opcodes_h_l1612_c7_1674_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1612_c7_1674_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1612_c7_1674_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1612_c7_1674_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1612_c7_1674]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1612_c7_1674_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1612_c7_1674_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1612_c7_1674_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1612_c7_1674_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1612_c7_1674]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1612_c7_1674_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1612_c7_1674_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1612_c7_1674_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1612_c7_1674_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1612_c7_1674]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1612_c7_1674_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1612_c7_1674_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1612_c7_1674_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1612_c7_1674_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1612_c7_1674]
signal result_stack_value_MUX_uxn_opcodes_h_l1612_c7_1674_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1612_c7_1674_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1612_c7_1674_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1612_c7_1674_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1612_c7_1674]
signal result_ram_addr_MUX_uxn_opcodes_h_l1612_c7_1674_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1612_c7_1674_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1612_c7_1674_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1612_c7_1674_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1614_c3_2468]
signal CONST_SL_8_uxn_opcodes_h_l1614_c3_2468_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1614_c3_2468_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1615_c32_a550]
signal BIN_OP_PLUS_uxn_opcodes_h_l1615_c32_a550_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1615_c32_a550_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1615_c32_a550_return_output : unsigned(8 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1617_c11_d672]
signal BIN_OP_EQ_uxn_opcodes_h_l1617_c11_d672_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1617_c11_d672_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1617_c11_d672_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1617_c7_ec10]
signal tmp16_MUX_uxn_opcodes_h_l1617_c7_ec10_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1617_c7_ec10_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1617_c7_ec10_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1617_c7_ec10_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1617_c7_ec10]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_ec10_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_ec10_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_ec10_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_ec10_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1617_c7_ec10]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_ec10_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_ec10_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_ec10_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_ec10_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1617_c7_ec10]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1617_c7_ec10_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1617_c7_ec10_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1617_c7_ec10_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1617_c7_ec10_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1617_c7_ec10]
signal result_stack_value_MUX_uxn_opcodes_h_l1617_c7_ec10_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1617_c7_ec10_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1617_c7_ec10_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1617_c7_ec10_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1617_c7_ec10]
signal result_ram_addr_MUX_uxn_opcodes_h_l1617_c7_ec10_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1617_c7_ec10_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1617_c7_ec10_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1617_c7_ec10_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1618_c32_8dd2]
signal BIN_OP_PLUS_uxn_opcodes_h_l1618_c32_8dd2_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1618_c32_8dd2_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1618_c32_8dd2_return_output : unsigned(8 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1620_c11_2393]
signal BIN_OP_EQ_uxn_opcodes_h_l1620_c11_2393_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1620_c11_2393_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1620_c11_2393_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1620_c7_6683]
signal tmp16_MUX_uxn_opcodes_h_l1620_c7_6683_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1620_c7_6683_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1620_c7_6683_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1620_c7_6683_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1620_c7_6683]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_6683_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_6683_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_6683_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_6683_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1620_c7_6683]
signal result_stack_value_MUX_uxn_opcodes_h_l1620_c7_6683_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1620_c7_6683_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1620_c7_6683_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1620_c7_6683_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1620_c7_6683]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_6683_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_6683_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_6683_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_6683_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1620_c7_6683]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1620_c7_6683_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1620_c7_6683_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1620_c7_6683_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1620_c7_6683_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1621_c3_8787]
signal BIN_OP_OR_uxn_opcodes_h_l1621_c3_8787_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1621_c3_8787_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1621_c3_8787_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1626_c11_fab0]
signal BIN_OP_EQ_uxn_opcodes_h_l1626_c11_fab0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1626_c11_fab0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1626_c11_fab0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1626_c7_da1f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_da1f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_da1f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_da1f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_da1f_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1626_c7_da1f]
signal result_stack_value_MUX_uxn_opcodes_h_l1626_c7_da1f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1626_c7_da1f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1626_c7_da1f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1626_c7_da1f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1626_c7_da1f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_da1f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_da1f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_da1f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_da1f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1626_c7_da1f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_da1f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_da1f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_da1f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_da1f_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1628_c34_1851]
signal CONST_SR_8_uxn_opcodes_h_l1628_c34_1851_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1628_c34_1851_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1630_c11_ffb1]
signal BIN_OP_EQ_uxn_opcodes_h_l1630_c11_ffb1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1630_c11_ffb1_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1630_c11_ffb1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1630_c7_4fd3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_4fd3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_4fd3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_4fd3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_4fd3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1630_c7_4fd3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_4fd3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_4fd3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_4fd3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_4fd3_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CAST_TO_uint16_t_uint9_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(8 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_5b20( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : signed;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
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
      base.ram_addr := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1594_c6_2ab4
BIN_OP_EQ_uxn_opcodes_h_l1594_c6_2ab4 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1594_c6_2ab4_left,
BIN_OP_EQ_uxn_opcodes_h_l1594_c6_2ab4_right,
BIN_OP_EQ_uxn_opcodes_h_l1594_c6_2ab4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1594_c1_d07c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1594_c1_d07c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1594_c1_d07c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1594_c1_d07c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1594_c1_d07c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1594_c1_d07c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1594_c2_540e
tmp16_MUX_uxn_opcodes_h_l1594_c2_540e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1594_c2_540e_cond,
tmp16_MUX_uxn_opcodes_h_l1594_c2_540e_iftrue,
tmp16_MUX_uxn_opcodes_h_l1594_c2_540e_iffalse,
tmp16_MUX_uxn_opcodes_h_l1594_c2_540e_return_output);

-- t8_MUX_uxn_opcodes_h_l1594_c2_540e
t8_MUX_uxn_opcodes_h_l1594_c2_540e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1594_c2_540e_cond,
t8_MUX_uxn_opcodes_h_l1594_c2_540e_iftrue,
t8_MUX_uxn_opcodes_h_l1594_c2_540e_iffalse,
t8_MUX_uxn_opcodes_h_l1594_c2_540e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1594_c2_540e
result_is_stack_write_MUX_uxn_opcodes_h_l1594_c2_540e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1594_c2_540e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1594_c2_540e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1594_c2_540e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1594_c2_540e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c2_540e
result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c2_540e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c2_540e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c2_540e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c2_540e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c2_540e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c2_540e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c2_540e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c2_540e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c2_540e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c2_540e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c2_540e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c2_540e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c2_540e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c2_540e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c2_540e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c2_540e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c2_540e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1594_c2_540e
result_stack_value_MUX_uxn_opcodes_h_l1594_c2_540e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1594_c2_540e_cond,
result_stack_value_MUX_uxn_opcodes_h_l1594_c2_540e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1594_c2_540e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1594_c2_540e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1594_c2_540e
result_is_opc_done_MUX_uxn_opcodes_h_l1594_c2_540e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1594_c2_540e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1594_c2_540e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1594_c2_540e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1594_c2_540e_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1594_c2_540e
result_ram_addr_MUX_uxn_opcodes_h_l1594_c2_540e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1594_c2_540e_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1594_c2_540e_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1594_c2_540e_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1594_c2_540e_return_output);

-- printf_uxn_opcodes_h_l1595_c3_e1e3_uxn_opcodes_h_l1595_c3_e1e3
printf_uxn_opcodes_h_l1595_c3_e1e3_uxn_opcodes_h_l1595_c3_e1e3 : entity work.printf_uxn_opcodes_h_l1595_c3_e1e3_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1595_c3_e1e3_uxn_opcodes_h_l1595_c3_e1e3_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1599_c11_d20a
BIN_OP_EQ_uxn_opcodes_h_l1599_c11_d20a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1599_c11_d20a_left,
BIN_OP_EQ_uxn_opcodes_h_l1599_c11_d20a_right,
BIN_OP_EQ_uxn_opcodes_h_l1599_c11_d20a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1599_c7_51bd
tmp16_MUX_uxn_opcodes_h_l1599_c7_51bd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1599_c7_51bd_cond,
tmp16_MUX_uxn_opcodes_h_l1599_c7_51bd_iftrue,
tmp16_MUX_uxn_opcodes_h_l1599_c7_51bd_iffalse,
tmp16_MUX_uxn_opcodes_h_l1599_c7_51bd_return_output);

-- t8_MUX_uxn_opcodes_h_l1599_c7_51bd
t8_MUX_uxn_opcodes_h_l1599_c7_51bd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1599_c7_51bd_cond,
t8_MUX_uxn_opcodes_h_l1599_c7_51bd_iftrue,
t8_MUX_uxn_opcodes_h_l1599_c7_51bd_iffalse,
t8_MUX_uxn_opcodes_h_l1599_c7_51bd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1599_c7_51bd
result_is_stack_write_MUX_uxn_opcodes_h_l1599_c7_51bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1599_c7_51bd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1599_c7_51bd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1599_c7_51bd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1599_c7_51bd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1599_c7_51bd
result_is_sp_shift_MUX_uxn_opcodes_h_l1599_c7_51bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1599_c7_51bd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1599_c7_51bd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1599_c7_51bd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1599_c7_51bd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1599_c7_51bd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1599_c7_51bd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1599_c7_51bd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1599_c7_51bd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1599_c7_51bd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1599_c7_51bd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1599_c7_51bd
result_sp_relative_shift_MUX_uxn_opcodes_h_l1599_c7_51bd : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1599_c7_51bd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1599_c7_51bd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1599_c7_51bd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1599_c7_51bd_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1599_c7_51bd
result_stack_value_MUX_uxn_opcodes_h_l1599_c7_51bd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1599_c7_51bd_cond,
result_stack_value_MUX_uxn_opcodes_h_l1599_c7_51bd_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1599_c7_51bd_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1599_c7_51bd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1599_c7_51bd
result_is_opc_done_MUX_uxn_opcodes_h_l1599_c7_51bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1599_c7_51bd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1599_c7_51bd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1599_c7_51bd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1599_c7_51bd_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1599_c7_51bd
result_ram_addr_MUX_uxn_opcodes_h_l1599_c7_51bd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1599_c7_51bd_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1599_c7_51bd_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1599_c7_51bd_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1599_c7_51bd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1602_c11_c443
BIN_OP_EQ_uxn_opcodes_h_l1602_c11_c443 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1602_c11_c443_left,
BIN_OP_EQ_uxn_opcodes_h_l1602_c11_c443_right,
BIN_OP_EQ_uxn_opcodes_h_l1602_c11_c443_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1602_c7_6fc0
tmp16_MUX_uxn_opcodes_h_l1602_c7_6fc0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1602_c7_6fc0_cond,
tmp16_MUX_uxn_opcodes_h_l1602_c7_6fc0_iftrue,
tmp16_MUX_uxn_opcodes_h_l1602_c7_6fc0_iffalse,
tmp16_MUX_uxn_opcodes_h_l1602_c7_6fc0_return_output);

-- t8_MUX_uxn_opcodes_h_l1602_c7_6fc0
t8_MUX_uxn_opcodes_h_l1602_c7_6fc0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1602_c7_6fc0_cond,
t8_MUX_uxn_opcodes_h_l1602_c7_6fc0_iftrue,
t8_MUX_uxn_opcodes_h_l1602_c7_6fc0_iffalse,
t8_MUX_uxn_opcodes_h_l1602_c7_6fc0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_6fc0
result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_6fc0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_6fc0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_6fc0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_6fc0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_6fc0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1602_c7_6fc0
result_is_sp_shift_MUX_uxn_opcodes_h_l1602_c7_6fc0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1602_c7_6fc0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1602_c7_6fc0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1602_c7_6fc0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1602_c7_6fc0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1602_c7_6fc0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1602_c7_6fc0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1602_c7_6fc0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1602_c7_6fc0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1602_c7_6fc0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1602_c7_6fc0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1602_c7_6fc0
result_sp_relative_shift_MUX_uxn_opcodes_h_l1602_c7_6fc0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1602_c7_6fc0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1602_c7_6fc0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1602_c7_6fc0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1602_c7_6fc0_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1602_c7_6fc0
result_stack_value_MUX_uxn_opcodes_h_l1602_c7_6fc0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1602_c7_6fc0_cond,
result_stack_value_MUX_uxn_opcodes_h_l1602_c7_6fc0_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1602_c7_6fc0_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1602_c7_6fc0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_6fc0
result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_6fc0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_6fc0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_6fc0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_6fc0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_6fc0_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1602_c7_6fc0
result_ram_addr_MUX_uxn_opcodes_h_l1602_c7_6fc0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1602_c7_6fc0_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1602_c7_6fc0_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1602_c7_6fc0_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1602_c7_6fc0_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1605_c32_87a3
BIN_OP_AND_uxn_opcodes_h_l1605_c32_87a3 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1605_c32_87a3_left,
BIN_OP_AND_uxn_opcodes_h_l1605_c32_87a3_right,
BIN_OP_AND_uxn_opcodes_h_l1605_c32_87a3_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1605_c32_c20e
BIN_OP_GT_uxn_opcodes_h_l1605_c32_c20e : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1605_c32_c20e_left,
BIN_OP_GT_uxn_opcodes_h_l1605_c32_c20e_right,
BIN_OP_GT_uxn_opcodes_h_l1605_c32_c20e_return_output);

-- MUX_uxn_opcodes_h_l1605_c32_28e6
MUX_uxn_opcodes_h_l1605_c32_28e6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1605_c32_28e6_cond,
MUX_uxn_opcodes_h_l1605_c32_28e6_iftrue,
MUX_uxn_opcodes_h_l1605_c32_28e6_iffalse,
MUX_uxn_opcodes_h_l1605_c32_28e6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1608_c11_60a3
BIN_OP_EQ_uxn_opcodes_h_l1608_c11_60a3 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1608_c11_60a3_left,
BIN_OP_EQ_uxn_opcodes_h_l1608_c11_60a3_right,
BIN_OP_EQ_uxn_opcodes_h_l1608_c11_60a3_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1608_c7_3cbb
tmp16_MUX_uxn_opcodes_h_l1608_c7_3cbb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1608_c7_3cbb_cond,
tmp16_MUX_uxn_opcodes_h_l1608_c7_3cbb_iftrue,
tmp16_MUX_uxn_opcodes_h_l1608_c7_3cbb_iffalse,
tmp16_MUX_uxn_opcodes_h_l1608_c7_3cbb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_3cbb
result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_3cbb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_3cbb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_3cbb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_3cbb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_3cbb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1608_c7_3cbb
result_is_stack_write_MUX_uxn_opcodes_h_l1608_c7_3cbb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1608_c7_3cbb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1608_c7_3cbb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1608_c7_3cbb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1608_c7_3cbb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_3cbb
result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_3cbb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_3cbb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_3cbb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_3cbb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_3cbb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_3cbb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_3cbb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_3cbb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_3cbb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_3cbb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_3cbb_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1608_c7_3cbb
result_stack_value_MUX_uxn_opcodes_h_l1608_c7_3cbb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1608_c7_3cbb_cond,
result_stack_value_MUX_uxn_opcodes_h_l1608_c7_3cbb_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1608_c7_3cbb_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1608_c7_3cbb_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1608_c7_3cbb
result_ram_addr_MUX_uxn_opcodes_h_l1608_c7_3cbb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1608_c7_3cbb_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1608_c7_3cbb_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1608_c7_3cbb_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1608_c7_3cbb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1612_c11_124d
BIN_OP_EQ_uxn_opcodes_h_l1612_c11_124d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1612_c11_124d_left,
BIN_OP_EQ_uxn_opcodes_h_l1612_c11_124d_right,
BIN_OP_EQ_uxn_opcodes_h_l1612_c11_124d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1612_c7_1674
tmp16_MUX_uxn_opcodes_h_l1612_c7_1674 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1612_c7_1674_cond,
tmp16_MUX_uxn_opcodes_h_l1612_c7_1674_iftrue,
tmp16_MUX_uxn_opcodes_h_l1612_c7_1674_iffalse,
tmp16_MUX_uxn_opcodes_h_l1612_c7_1674_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1612_c7_1674
result_is_opc_done_MUX_uxn_opcodes_h_l1612_c7_1674 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1612_c7_1674_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1612_c7_1674_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1612_c7_1674_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1612_c7_1674_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1612_c7_1674
result_is_stack_write_MUX_uxn_opcodes_h_l1612_c7_1674 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1612_c7_1674_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1612_c7_1674_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1612_c7_1674_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1612_c7_1674_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1612_c7_1674
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1612_c7_1674 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1612_c7_1674_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1612_c7_1674_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1612_c7_1674_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1612_c7_1674_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1612_c7_1674
result_stack_value_MUX_uxn_opcodes_h_l1612_c7_1674 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1612_c7_1674_cond,
result_stack_value_MUX_uxn_opcodes_h_l1612_c7_1674_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1612_c7_1674_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1612_c7_1674_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1612_c7_1674
result_ram_addr_MUX_uxn_opcodes_h_l1612_c7_1674 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1612_c7_1674_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1612_c7_1674_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1612_c7_1674_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1612_c7_1674_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1614_c3_2468
CONST_SL_8_uxn_opcodes_h_l1614_c3_2468 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1614_c3_2468_x,
CONST_SL_8_uxn_opcodes_h_l1614_c3_2468_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1615_c32_a550
BIN_OP_PLUS_uxn_opcodes_h_l1615_c32_a550 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1615_c32_a550_left,
BIN_OP_PLUS_uxn_opcodes_h_l1615_c32_a550_right,
BIN_OP_PLUS_uxn_opcodes_h_l1615_c32_a550_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1617_c11_d672
BIN_OP_EQ_uxn_opcodes_h_l1617_c11_d672 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1617_c11_d672_left,
BIN_OP_EQ_uxn_opcodes_h_l1617_c11_d672_right,
BIN_OP_EQ_uxn_opcodes_h_l1617_c11_d672_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1617_c7_ec10
tmp16_MUX_uxn_opcodes_h_l1617_c7_ec10 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1617_c7_ec10_cond,
tmp16_MUX_uxn_opcodes_h_l1617_c7_ec10_iftrue,
tmp16_MUX_uxn_opcodes_h_l1617_c7_ec10_iffalse,
tmp16_MUX_uxn_opcodes_h_l1617_c7_ec10_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_ec10
result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_ec10 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_ec10_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_ec10_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_ec10_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_ec10_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_ec10
result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_ec10 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_ec10_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_ec10_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_ec10_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_ec10_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1617_c7_ec10
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1617_c7_ec10 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1617_c7_ec10_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1617_c7_ec10_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1617_c7_ec10_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1617_c7_ec10_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1617_c7_ec10
result_stack_value_MUX_uxn_opcodes_h_l1617_c7_ec10 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1617_c7_ec10_cond,
result_stack_value_MUX_uxn_opcodes_h_l1617_c7_ec10_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1617_c7_ec10_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1617_c7_ec10_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1617_c7_ec10
result_ram_addr_MUX_uxn_opcodes_h_l1617_c7_ec10 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1617_c7_ec10_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1617_c7_ec10_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1617_c7_ec10_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1617_c7_ec10_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1618_c32_8dd2
BIN_OP_PLUS_uxn_opcodes_h_l1618_c32_8dd2 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1618_c32_8dd2_left,
BIN_OP_PLUS_uxn_opcodes_h_l1618_c32_8dd2_right,
BIN_OP_PLUS_uxn_opcodes_h_l1618_c32_8dd2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1620_c11_2393
BIN_OP_EQ_uxn_opcodes_h_l1620_c11_2393 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1620_c11_2393_left,
BIN_OP_EQ_uxn_opcodes_h_l1620_c11_2393_right,
BIN_OP_EQ_uxn_opcodes_h_l1620_c11_2393_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1620_c7_6683
tmp16_MUX_uxn_opcodes_h_l1620_c7_6683 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1620_c7_6683_cond,
tmp16_MUX_uxn_opcodes_h_l1620_c7_6683_iftrue,
tmp16_MUX_uxn_opcodes_h_l1620_c7_6683_iffalse,
tmp16_MUX_uxn_opcodes_h_l1620_c7_6683_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_6683
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_6683 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_6683_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_6683_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_6683_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_6683_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1620_c7_6683
result_stack_value_MUX_uxn_opcodes_h_l1620_c7_6683 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1620_c7_6683_cond,
result_stack_value_MUX_uxn_opcodes_h_l1620_c7_6683_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1620_c7_6683_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1620_c7_6683_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_6683
result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_6683 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_6683_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_6683_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_6683_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_6683_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1620_c7_6683
result_is_stack_write_MUX_uxn_opcodes_h_l1620_c7_6683 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1620_c7_6683_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1620_c7_6683_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1620_c7_6683_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1620_c7_6683_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1621_c3_8787
BIN_OP_OR_uxn_opcodes_h_l1621_c3_8787 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1621_c3_8787_left,
BIN_OP_OR_uxn_opcodes_h_l1621_c3_8787_right,
BIN_OP_OR_uxn_opcodes_h_l1621_c3_8787_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1626_c11_fab0
BIN_OP_EQ_uxn_opcodes_h_l1626_c11_fab0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1626_c11_fab0_left,
BIN_OP_EQ_uxn_opcodes_h_l1626_c11_fab0_right,
BIN_OP_EQ_uxn_opcodes_h_l1626_c11_fab0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_da1f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_da1f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_da1f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_da1f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_da1f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_da1f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1626_c7_da1f
result_stack_value_MUX_uxn_opcodes_h_l1626_c7_da1f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1626_c7_da1f_cond,
result_stack_value_MUX_uxn_opcodes_h_l1626_c7_da1f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1626_c7_da1f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1626_c7_da1f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_da1f
result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_da1f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_da1f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_da1f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_da1f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_da1f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_da1f
result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_da1f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_da1f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_da1f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_da1f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_da1f_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1628_c34_1851
CONST_SR_8_uxn_opcodes_h_l1628_c34_1851 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1628_c34_1851_x,
CONST_SR_8_uxn_opcodes_h_l1628_c34_1851_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1630_c11_ffb1
BIN_OP_EQ_uxn_opcodes_h_l1630_c11_ffb1 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1630_c11_ffb1_left,
BIN_OP_EQ_uxn_opcodes_h_l1630_c11_ffb1_right,
BIN_OP_EQ_uxn_opcodes_h_l1630_c11_ffb1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_4fd3
result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_4fd3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_4fd3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_4fd3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_4fd3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_4fd3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_4fd3
result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_4fd3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_4fd3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_4fd3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_4fd3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_4fd3_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 t8,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1594_c6_2ab4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1594_c1_d07c_return_output,
 tmp16_MUX_uxn_opcodes_h_l1594_c2_540e_return_output,
 t8_MUX_uxn_opcodes_h_l1594_c2_540e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1594_c2_540e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c2_540e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c2_540e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c2_540e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1594_c2_540e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1594_c2_540e_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1594_c2_540e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1599_c11_d20a_return_output,
 tmp16_MUX_uxn_opcodes_h_l1599_c7_51bd_return_output,
 t8_MUX_uxn_opcodes_h_l1599_c7_51bd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1599_c7_51bd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1599_c7_51bd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1599_c7_51bd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1599_c7_51bd_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1599_c7_51bd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1599_c7_51bd_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1599_c7_51bd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1602_c11_c443_return_output,
 tmp16_MUX_uxn_opcodes_h_l1602_c7_6fc0_return_output,
 t8_MUX_uxn_opcodes_h_l1602_c7_6fc0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_6fc0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1602_c7_6fc0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1602_c7_6fc0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1602_c7_6fc0_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1602_c7_6fc0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_6fc0_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1602_c7_6fc0_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1605_c32_87a3_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1605_c32_c20e_return_output,
 MUX_uxn_opcodes_h_l1605_c32_28e6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1608_c11_60a3_return_output,
 tmp16_MUX_uxn_opcodes_h_l1608_c7_3cbb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_3cbb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1608_c7_3cbb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_3cbb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_3cbb_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1608_c7_3cbb_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1608_c7_3cbb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1612_c11_124d_return_output,
 tmp16_MUX_uxn_opcodes_h_l1612_c7_1674_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1612_c7_1674_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1612_c7_1674_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1612_c7_1674_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1612_c7_1674_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1612_c7_1674_return_output,
 CONST_SL_8_uxn_opcodes_h_l1614_c3_2468_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1615_c32_a550_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1617_c11_d672_return_output,
 tmp16_MUX_uxn_opcodes_h_l1617_c7_ec10_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_ec10_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_ec10_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1617_c7_ec10_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1617_c7_ec10_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1617_c7_ec10_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1618_c32_8dd2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1620_c11_2393_return_output,
 tmp16_MUX_uxn_opcodes_h_l1620_c7_6683_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_6683_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1620_c7_6683_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_6683_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1620_c7_6683_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1621_c3_8787_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1626_c11_fab0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_da1f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1626_c7_da1f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_da1f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_da1f_return_output,
 CONST_SR_8_uxn_opcodes_h_l1628_c34_1851_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1630_c11_ffb1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_4fd3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_4fd3_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c6_2ab4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c6_2ab4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c6_2ab4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1594_c1_d07c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1594_c1_d07c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1594_c1_d07c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1594_c1_d07c_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1594_c2_540e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1594_c2_540e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1599_c7_51bd_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1594_c2_540e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1594_c2_540e_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1594_c2_540e_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1594_c2_540e_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1599_c7_51bd_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1594_c2_540e_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1594_c2_540e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1594_c2_540e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1594_c2_540e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1599_c7_51bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1594_c2_540e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1594_c2_540e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c2_540e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c2_540e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1599_c7_51bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c2_540e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c2_540e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c2_540e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1596_c3_335a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c2_540e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1599_c7_51bd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c2_540e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c2_540e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c2_540e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c2_540e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1599_c7_51bd_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c2_540e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c2_540e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1594_c2_540e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1594_c2_540e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1599_c7_51bd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1594_c2_540e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1594_c2_540e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1594_c2_540e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1594_c2_540e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1599_c7_51bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1594_c2_540e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1594_c2_540e_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1594_c2_540e_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1594_c2_540e_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1599_c7_51bd_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1594_c2_540e_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1594_c2_540e_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1595_c3_e1e3_uxn_opcodes_h_l1595_c3_e1e3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1599_c11_d20a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1599_c11_d20a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1599_c11_d20a_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1599_c7_51bd_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1599_c7_51bd_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1602_c7_6fc0_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1599_c7_51bd_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1599_c7_51bd_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1599_c7_51bd_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1602_c7_6fc0_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1599_c7_51bd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1599_c7_51bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1599_c7_51bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_6fc0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1599_c7_51bd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1599_c7_51bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1599_c7_51bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1602_c7_6fc0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1599_c7_51bd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1599_c7_51bd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1600_c3_418e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1599_c7_51bd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1602_c7_6fc0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1599_c7_51bd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1599_c7_51bd_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1599_c7_51bd_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1602_c7_6fc0_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1599_c7_51bd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1599_c7_51bd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1599_c7_51bd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1602_c7_6fc0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1599_c7_51bd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1599_c7_51bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1599_c7_51bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_6fc0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1599_c7_51bd_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1599_c7_51bd_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1599_c7_51bd_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1602_c7_6fc0_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1599_c7_51bd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1602_c11_c443_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1602_c11_c443_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1602_c11_c443_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1602_c7_6fc0_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1602_c7_6fc0_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1608_c7_3cbb_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1602_c7_6fc0_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1602_c7_6fc0_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1602_c7_6fc0_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1602_c7_6fc0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_6fc0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_6fc0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1608_c7_3cbb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_6fc0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1602_c7_6fc0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1602_c7_6fc0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_3cbb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1602_c7_6fc0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1602_c7_6fc0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1602_c7_6fc0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_3cbb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1602_c7_6fc0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1602_c7_6fc0_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1602_c7_6fc0_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1602_c7_6fc0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1602_c7_6fc0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1602_c7_6fc0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1608_c7_3cbb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1602_c7_6fc0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_6fc0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_6fc0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_3cbb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_6fc0_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1602_c7_6fc0_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1602_c7_6fc0_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1608_c7_3cbb_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1602_c7_6fc0_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1605_c32_28e6_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1605_c32_28e6_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1605_c32_28e6_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1605_c32_87a3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1605_c32_87a3_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1605_c32_87a3_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1605_c32_c20e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1605_c32_c20e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1605_c32_c20e_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1605_c32_28e6_return_output : signed(7 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1606_c21_7dad_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c11_60a3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c11_60a3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c11_60a3_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1608_c7_3cbb_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1608_c7_3cbb_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1612_c7_1674_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1608_c7_3cbb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_3cbb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_3cbb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1612_c7_1674_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_3cbb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1608_c7_3cbb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1608_c7_3cbb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1612_c7_1674_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1608_c7_3cbb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_3cbb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_3cbb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_3cbb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_3cbb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_3cbb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1612_c7_1674_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_3cbb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1608_c7_3cbb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1608_c7_3cbb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1612_c7_1674_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1608_c7_3cbb_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1608_c7_3cbb_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1608_c7_3cbb_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1612_c7_1674_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1608_c7_3cbb_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1610_c21_5647_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1612_c11_124d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1612_c11_124d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1612_c11_124d_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1612_c7_1674_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1612_c7_1674_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1617_c7_ec10_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1612_c7_1674_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1612_c7_1674_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1612_c7_1674_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_ec10_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1612_c7_1674_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1612_c7_1674_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1612_c7_1674_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_ec10_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1612_c7_1674_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1612_c7_1674_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1612_c7_1674_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1617_c7_ec10_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1612_c7_1674_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1612_c7_1674_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1612_c7_1674_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1617_c7_ec10_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1612_c7_1674_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1612_c7_1674_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1612_c7_1674_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1617_c7_ec10_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1612_c7_1674_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1614_c3_2468_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1614_c3_2468_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1615_c32_a550_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1615_c32_a550_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1615_c32_a550_return_output : unsigned(8 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1615_c21_089f_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1617_c11_d672_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1617_c11_d672_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1617_c11_d672_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1617_c7_ec10_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1617_c7_ec10_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1620_c7_6683_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1617_c7_ec10_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_ec10_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_ec10_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_6683_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_ec10_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_ec10_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_ec10_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1620_c7_6683_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_ec10_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1617_c7_ec10_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1617_c7_ec10_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_6683_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1617_c7_ec10_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1617_c7_ec10_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1617_c7_ec10_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1620_c7_6683_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1617_c7_ec10_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1617_c7_ec10_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1617_c7_ec10_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1617_c7_ec10_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1618_c32_8dd2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1618_c32_8dd2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1618_c32_8dd2_return_output : unsigned(8 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1618_c21_622c_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1620_c11_2393_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1620_c11_2393_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1620_c11_2393_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1620_c7_6683_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1620_c7_6683_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1620_c7_6683_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_6683_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1623_c3_ad13 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_6683_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_da1f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_6683_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1620_c7_6683_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1620_c7_6683_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1626_c7_da1f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1620_c7_6683_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_6683_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_6683_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_da1f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_6683_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1620_c7_6683_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1620_c7_6683_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_da1f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1620_c7_6683_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1621_c3_8787_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1621_c3_8787_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1621_c3_8787_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1624_c24_e1e2_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1626_c11_fab0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1626_c11_fab0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1626_c11_fab0_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_da1f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1627_c3_f61e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_da1f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_da1f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1626_c7_da1f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1626_c7_da1f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1626_c7_da1f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_da1f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_da1f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_4fd3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_da1f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_da1f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_da1f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_4fd3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_da1f_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1628_c34_1851_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1628_c34_1851_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1628_c24_eabb_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1630_c11_ffb1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1630_c11_ffb1_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1630_c11_ffb1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_4fd3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_4fd3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_4fd3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_4fd3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_4fd3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_4fd3_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1617_l1612_l1608_l1602_l1630_l1599_l1626_l1594_DUPLICATE_9ca1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1594_l1608_l1599_DUPLICATE_850d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1602_l1594_l1599_DUPLICATE_4f05_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1617_l1612_l1608_l1602_l1599_l1626_l1594_DUPLICATE_bfbd_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1617_l1594_l1599_DUPLICATE_d734_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1617_l1612_l1608_l1602_l1630_l1599_l1626_l1620_DUPLICATE_5be2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1617_l1612_l1608_l1602_l1626_DUPLICATE_0f79_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1621_l1613_DUPLICATE_7025_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b20_uxn_opcodes_h_l1635_l1589_DUPLICATE_9678_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_AND_uxn_opcodes_h_l1605_c32_87a3_right := to_unsigned(128, 8);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1618_c32_8dd2_right := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1605_c32_28e6_iffalse := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_3cbb_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_4fd3_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c6_2ab4_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1617_c11_d672_right := to_unsigned(5, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1620_c7_6683_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1594_c2_540e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1594_c1_d07c_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1623_c3_ad13 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_6683_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1623_c3_ad13;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1602_c7_6fc0_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c11_60a3_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1630_c11_ffb1_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1627_c3_f61e := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_da1f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1627_c3_f61e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1612_c11_124d_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1626_c11_fab0_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1600_c3_418e := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1599_c7_51bd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1600_c3_418e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1620_c11_2393_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1599_c11_d20a_right := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1605_c32_28e6_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_BIN_OP_GT_uxn_opcodes_h_l1605_c32_c20e_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1602_c11_c443_right := to_unsigned(2, 2);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1615_c32_a550_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1596_c3_335a := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c2_540e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1596_c3_335a;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_4fd3_iftrue := to_unsigned(0, 1);

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
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1594_c1_d07c_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1605_c32_87a3_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c6_2ab4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1599_c11_d20a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1602_c11_c443_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c11_60a3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1612_c11_124d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1617_c11_d672_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1620_c11_2393_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1626_c11_fab0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1630_c11_ffb1_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l1602_c7_6fc0_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1615_c32_a550_left := t8;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1618_c32_8dd2_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1594_c2_540e_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1599_c7_51bd_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1602_c7_6fc0_iffalse := t8;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1621_c3_8787_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1628_c34_1851_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1594_c2_540e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1599_c7_51bd_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1602_c7_6fc0_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1608_c7_3cbb_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1617_c7_ec10_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1620_c7_6683_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1612_c11_124d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1612_c11_124d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1612_c11_124d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1612_c11_124d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1612_c11_124d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1612_c11_124d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1612_c11_124d_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1615_c32_a550] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1615_c32_a550_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1615_c32_a550_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1615_c32_a550_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1615_c32_a550_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1615_c32_a550_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1615_c32_a550_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1610_c21_5647] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1610_c21_5647_return_output := CAST_TO_uint16_t_uint8_t(
     t8);

     -- BIN_OP_EQ[uxn_opcodes_h_l1620_c11_2393] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1620_c11_2393_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1620_c11_2393_left;
     BIN_OP_EQ_uxn_opcodes_h_l1620_c11_2393_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1620_c11_2393_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1620_c11_2393_return_output := BIN_OP_EQ_uxn_opcodes_h_l1620_c11_2393_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1617_l1612_l1608_l1602_l1630_l1599_l1626_l1620_DUPLICATE_5be2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1617_l1612_l1608_l1602_l1630_l1599_l1626_l1620_DUPLICATE_5be2_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1594_l1608_l1599_DUPLICATE_850d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1594_l1608_l1599_DUPLICATE_850d_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1626_c11_fab0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1626_c11_fab0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1626_c11_fab0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1626_c11_fab0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1626_c11_fab0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1626_c11_fab0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1626_c11_fab0_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1617_l1612_l1608_l1602_l1630_l1599_l1626_l1594_DUPLICATE_9ca1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1617_l1612_l1608_l1602_l1630_l1599_l1626_l1594_DUPLICATE_9ca1_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1617_l1594_l1599_DUPLICATE_d734 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1617_l1594_l1599_DUPLICATE_d734_return_output := result.ram_addr;

     -- BIN_OP_EQ[uxn_opcodes_h_l1608_c11_60a3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1608_c11_60a3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c11_60a3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1608_c11_60a3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c11_60a3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c11_60a3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1608_c11_60a3_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1621_l1613_DUPLICATE_7025 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1621_l1613_DUPLICATE_7025_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1594_c6_2ab4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1594_c6_2ab4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c6_2ab4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1594_c6_2ab4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c6_2ab4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c6_2ab4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1594_c6_2ab4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1599_c11_d20a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1599_c11_d20a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1599_c11_d20a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1599_c11_d20a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1599_c11_d20a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1599_c11_d20a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1599_c11_d20a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1602_c11_c443] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1602_c11_c443_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1602_c11_c443_left;
     BIN_OP_EQ_uxn_opcodes_h_l1602_c11_c443_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1602_c11_c443_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1602_c11_c443_return_output := BIN_OP_EQ_uxn_opcodes_h_l1602_c11_c443_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1617_c11_d672] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1617_c11_d672_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1617_c11_d672_left;
     BIN_OP_EQ_uxn_opcodes_h_l1617_c11_d672_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1617_c11_d672_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1617_c11_d672_return_output := BIN_OP_EQ_uxn_opcodes_h_l1617_c11_d672_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1602_l1594_l1599_DUPLICATE_4f05 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1602_l1594_l1599_DUPLICATE_4f05_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1630_c11_ffb1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1630_c11_ffb1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1630_c11_ffb1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1630_c11_ffb1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1630_c11_ffb1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1630_c11_ffb1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1630_c11_ffb1_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1605_c32_87a3] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1605_c32_87a3_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1605_c32_87a3_left;
     BIN_OP_AND_uxn_opcodes_h_l1605_c32_87a3_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1605_c32_87a3_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1605_c32_87a3_return_output := BIN_OP_AND_uxn_opcodes_h_l1605_c32_87a3_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1618_c32_8dd2] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1618_c32_8dd2_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1618_c32_8dd2_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1618_c32_8dd2_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1618_c32_8dd2_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1618_c32_8dd2_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1618_c32_8dd2_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1628_c34_1851] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1628_c34_1851_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1628_c34_1851_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1628_c34_1851_return_output := CONST_SR_8_uxn_opcodes_h_l1628_c34_1851_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1617_l1612_l1608_l1602_l1626_DUPLICATE_0f79 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1617_l1612_l1608_l1602_l1626_DUPLICATE_0f79_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1617_l1612_l1608_l1602_l1599_l1626_l1594_DUPLICATE_bfbd LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1617_l1612_l1608_l1602_l1599_l1626_l1594_DUPLICATE_bfbd_return_output := result.stack_value;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1606_c21_7dad] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1606_c21_7dad_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1605_c32_c20e_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1605_c32_87a3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1594_c1_d07c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c6_2ab4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1594_c2_540e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c6_2ab4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c2_540e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c6_2ab4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1594_c2_540e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c6_2ab4_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1594_c2_540e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c6_2ab4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c2_540e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c6_2ab4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c2_540e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c6_2ab4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1594_c2_540e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c6_2ab4_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1594_c2_540e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c6_2ab4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1594_c2_540e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1594_c6_2ab4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1599_c7_51bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1599_c11_d20a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1599_c7_51bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1599_c11_d20a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1599_c7_51bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1599_c11_d20a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1599_c7_51bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1599_c11_d20a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1599_c7_51bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1599_c11_d20a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1599_c7_51bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1599_c11_d20a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1599_c7_51bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1599_c11_d20a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1599_c7_51bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1599_c11_d20a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1599_c7_51bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1599_c11_d20a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_6fc0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1602_c11_c443_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1602_c7_6fc0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1602_c11_c443_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_6fc0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1602_c11_c443_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1602_c7_6fc0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1602_c11_c443_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1602_c7_6fc0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1602_c11_c443_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1602_c7_6fc0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1602_c11_c443_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1602_c7_6fc0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1602_c11_c443_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1602_c7_6fc0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1602_c11_c443_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1602_c7_6fc0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1602_c11_c443_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_3cbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c11_60a3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_3cbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c11_60a3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1608_c7_3cbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c11_60a3_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1608_c7_3cbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c11_60a3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_3cbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c11_60a3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1608_c7_3cbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c11_60a3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1608_c7_3cbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c11_60a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1612_c7_1674_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1612_c11_124d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1612_c7_1674_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1612_c11_124d_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1612_c7_1674_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1612_c11_124d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1612_c7_1674_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1612_c11_124d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1612_c7_1674_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1612_c11_124d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1612_c7_1674_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1612_c11_124d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_ec10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1617_c11_d672_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_ec10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1617_c11_d672_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1617_c7_ec10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1617_c11_d672_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1617_c7_ec10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1617_c11_d672_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1617_c7_ec10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1617_c11_d672_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1617_c7_ec10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1617_c11_d672_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_6683_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1620_c11_2393_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1620_c7_6683_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1620_c11_2393_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_6683_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1620_c11_2393_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1620_c7_6683_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1620_c11_2393_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1620_c7_6683_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1620_c11_2393_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_da1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1626_c11_fab0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_da1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1626_c11_fab0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_da1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1626_c11_fab0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1626_c7_da1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1626_c11_fab0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_4fd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1630_c11_ffb1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_4fd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1630_c11_ffb1_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1602_c7_6fc0_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1606_c21_7dad_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1608_c7_3cbb_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1610_c21_5647_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1621_c3_8787_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1621_l1613_DUPLICATE_7025_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1614_c3_2468_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1621_l1613_DUPLICATE_7025_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c2_540e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1602_l1594_l1599_DUPLICATE_4f05_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1599_c7_51bd_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1602_l1594_l1599_DUPLICATE_4f05_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1602_c7_6fc0_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1602_l1594_l1599_DUPLICATE_4f05_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1594_c2_540e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1617_l1594_l1599_DUPLICATE_d734_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1599_c7_51bd_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1617_l1594_l1599_DUPLICATE_d734_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1617_c7_ec10_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1617_l1594_l1599_DUPLICATE_d734_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1599_c7_51bd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1617_l1612_l1608_l1602_l1630_l1599_l1626_l1620_DUPLICATE_5be2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_6fc0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1617_l1612_l1608_l1602_l1630_l1599_l1626_l1620_DUPLICATE_5be2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_3cbb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1617_l1612_l1608_l1602_l1630_l1599_l1626_l1620_DUPLICATE_5be2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1612_c7_1674_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1617_l1612_l1608_l1602_l1630_l1599_l1626_l1620_DUPLICATE_5be2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_ec10_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1617_l1612_l1608_l1602_l1630_l1599_l1626_l1620_DUPLICATE_5be2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_6683_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1617_l1612_l1608_l1602_l1630_l1599_l1626_l1620_DUPLICATE_5be2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_da1f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1617_l1612_l1608_l1602_l1630_l1599_l1626_l1620_DUPLICATE_5be2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_4fd3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1617_l1612_l1608_l1602_l1630_l1599_l1626_l1620_DUPLICATE_5be2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c2_540e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1594_l1608_l1599_DUPLICATE_850d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1599_c7_51bd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1594_l1608_l1599_DUPLICATE_850d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_3cbb_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1594_l1608_l1599_DUPLICATE_850d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1594_c2_540e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1617_l1612_l1608_l1602_l1630_l1599_l1626_l1594_DUPLICATE_9ca1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1599_c7_51bd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1617_l1612_l1608_l1602_l1630_l1599_l1626_l1594_DUPLICATE_9ca1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_6fc0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1617_l1612_l1608_l1602_l1630_l1599_l1626_l1594_DUPLICATE_9ca1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1608_c7_3cbb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1617_l1612_l1608_l1602_l1630_l1599_l1626_l1594_DUPLICATE_9ca1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1612_c7_1674_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1617_l1612_l1608_l1602_l1630_l1599_l1626_l1594_DUPLICATE_9ca1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_ec10_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1617_l1612_l1608_l1602_l1630_l1599_l1626_l1594_DUPLICATE_9ca1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_da1f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1617_l1612_l1608_l1602_l1630_l1599_l1626_l1594_DUPLICATE_9ca1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_4fd3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1617_l1612_l1608_l1602_l1630_l1599_l1626_l1594_DUPLICATE_9ca1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1602_c7_6fc0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1617_l1612_l1608_l1602_l1626_DUPLICATE_0f79_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_3cbb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1617_l1612_l1608_l1602_l1626_DUPLICATE_0f79_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1612_c7_1674_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1617_l1612_l1608_l1602_l1626_DUPLICATE_0f79_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1617_c7_ec10_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1617_l1612_l1608_l1602_l1626_DUPLICATE_0f79_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_da1f_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1617_l1612_l1608_l1602_l1626_DUPLICATE_0f79_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1594_c2_540e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1617_l1612_l1608_l1602_l1599_l1626_l1594_DUPLICATE_bfbd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1599_c7_51bd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1617_l1612_l1608_l1602_l1599_l1626_l1594_DUPLICATE_bfbd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1602_c7_6fc0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1617_l1612_l1608_l1602_l1599_l1626_l1594_DUPLICATE_bfbd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1608_c7_3cbb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1617_l1612_l1608_l1602_l1599_l1626_l1594_DUPLICATE_bfbd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1612_c7_1674_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1617_l1612_l1608_l1602_l1599_l1626_l1594_DUPLICATE_bfbd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1617_c7_ec10_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1617_l1612_l1608_l1602_l1599_l1626_l1594_DUPLICATE_bfbd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1626_c7_da1f_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1617_l1612_l1608_l1602_l1599_l1626_l1594_DUPLICATE_bfbd_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1594_c1_d07c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1594_c1_d07c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1594_c1_d07c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1594_c1_d07c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1594_c1_d07c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1594_c1_d07c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1594_c1_d07c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1594_c1_d07c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1594_c1_d07c_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1621_c3_8787] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1621_c3_8787_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1621_c3_8787_left;
     BIN_OP_OR_uxn_opcodes_h_l1621_c3_8787_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1621_c3_8787_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1621_c3_8787_return_output := BIN_OP_OR_uxn_opcodes_h_l1621_c3_8787_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1615_c21_089f] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1615_c21_089f_return_output := CAST_TO_uint16_t_uint9_t(
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1615_c32_a550_return_output);

     -- CONST_SL_8[uxn_opcodes_h_l1614_c3_2468] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1614_c3_2468_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1614_c3_2468_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1614_c3_2468_return_output := CONST_SL_8_uxn_opcodes_h_l1614_c3_2468_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1618_c21_622c] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1618_c21_622c_return_output := CAST_TO_uint16_t_uint9_t(
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1618_c32_8dd2_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1630_c7_4fd3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_4fd3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_4fd3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_4fd3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_4fd3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_4fd3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_4fd3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_4fd3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_4fd3_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1605_c32_c20e] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1605_c32_c20e_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1605_c32_c20e_left;
     BIN_OP_GT_uxn_opcodes_h_l1605_c32_c20e_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1605_c32_c20e_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1605_c32_c20e_return_output := BIN_OP_GT_uxn_opcodes_h_l1605_c32_c20e_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1628_c24_eabb] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1628_c24_eabb_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1628_c34_1851_return_output);

     -- t8_MUX[uxn_opcodes_h_l1602_c7_6fc0] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1602_c7_6fc0_cond <= VAR_t8_MUX_uxn_opcodes_h_l1602_c7_6fc0_cond;
     t8_MUX_uxn_opcodes_h_l1602_c7_6fc0_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1602_c7_6fc0_iftrue;
     t8_MUX_uxn_opcodes_h_l1602_c7_6fc0_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1602_c7_6fc0_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1602_c7_6fc0_return_output := t8_MUX_uxn_opcodes_h_l1602_c7_6fc0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1626_c7_da1f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_da1f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_da1f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_da1f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_da1f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_da1f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_da1f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_da1f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_da1f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1608_c7_3cbb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_3cbb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_3cbb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_3cbb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_3cbb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_3cbb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_3cbb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_3cbb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_3cbb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1630_c7_4fd3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_4fd3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_4fd3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_4fd3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_4fd3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_4fd3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_4fd3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_4fd3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_4fd3_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1605_c32_28e6_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1605_c32_c20e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1620_c7_6683_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1621_c3_8787_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1612_c7_1674_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1615_c21_089f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1617_c7_ec10_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1618_c21_622c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1626_c7_da1f_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1628_c24_eabb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1612_c7_1674_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1614_c3_2468_return_output;
     VAR_printf_uxn_opcodes_h_l1595_c3_e1e3_uxn_opcodes_h_l1595_c3_e1e3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1594_c1_d07c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_da1f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_4fd3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1602_c7_6fc0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_3cbb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_da1f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_4fd3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_6683_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_da1f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1599_c7_51bd_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1602_c7_6fc0_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1602_c7_6fc0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1602_c7_6fc0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1602_c7_6fc0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1602_c7_6fc0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1602_c7_6fc0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1602_c7_6fc0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1602_c7_6fc0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1602_c7_6fc0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1602_c7_6fc0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1620_c7_6683] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_6683_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_6683_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_6683_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_6683_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_6683_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_6683_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_6683_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_6683_return_output;

     -- MUX[uxn_opcodes_h_l1605_c32_28e6] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1605_c32_28e6_cond <= VAR_MUX_uxn_opcodes_h_l1605_c32_28e6_cond;
     MUX_uxn_opcodes_h_l1605_c32_28e6_iftrue <= VAR_MUX_uxn_opcodes_h_l1605_c32_28e6_iftrue;
     MUX_uxn_opcodes_h_l1605_c32_28e6_iffalse <= VAR_MUX_uxn_opcodes_h_l1605_c32_28e6_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1605_c32_28e6_return_output := MUX_uxn_opcodes_h_l1605_c32_28e6_return_output;

     -- t8_MUX[uxn_opcodes_h_l1599_c7_51bd] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1599_c7_51bd_cond <= VAR_t8_MUX_uxn_opcodes_h_l1599_c7_51bd_cond;
     t8_MUX_uxn_opcodes_h_l1599_c7_51bd_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1599_c7_51bd_iftrue;
     t8_MUX_uxn_opcodes_h_l1599_c7_51bd_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1599_c7_51bd_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1599_c7_51bd_return_output := t8_MUX_uxn_opcodes_h_l1599_c7_51bd_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1624_c24_e1e2] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1624_c24_e1e2_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l1621_c3_8787_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1626_c7_da1f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_da1f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_da1f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_da1f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_da1f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_da1f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_da1f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_da1f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_da1f_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1617_c7_ec10] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1617_c7_ec10_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1617_c7_ec10_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1617_c7_ec10_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1617_c7_ec10_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1617_c7_ec10_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1617_c7_ec10_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1617_c7_ec10_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1617_c7_ec10_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1626_c7_da1f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_da1f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_da1f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_da1f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_da1f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_da1f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_da1f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_da1f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_da1f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1626_c7_da1f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1626_c7_da1f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1626_c7_da1f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1626_c7_da1f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1626_c7_da1f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1626_c7_da1f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1626_c7_da1f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1626_c7_da1f_return_output := result_stack_value_MUX_uxn_opcodes_h_l1626_c7_da1f_return_output;

     -- printf_uxn_opcodes_h_l1595_c3_e1e3[uxn_opcodes_h_l1595_c3_e1e3] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1595_c3_e1e3_uxn_opcodes_h_l1595_c3_e1e3_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1595_c3_e1e3_uxn_opcodes_h_l1595_c3_e1e3_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- tmp16_MUX[uxn_opcodes_h_l1620_c7_6683] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1620_c7_6683_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1620_c7_6683_cond;
     tmp16_MUX_uxn_opcodes_h_l1620_c7_6683_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1620_c7_6683_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1620_c7_6683_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1620_c7_6683_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1620_c7_6683_return_output := tmp16_MUX_uxn_opcodes_h_l1620_c7_6683_return_output;

     -- Submodule level 3
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1620_c7_6683_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1624_c24_e1e2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1602_c7_6fc0_iftrue := VAR_MUX_uxn_opcodes_h_l1605_c32_28e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_6683_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_da1f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1599_c7_51bd_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1602_c7_6fc0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1620_c7_6683_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_da1f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1612_c7_1674_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1617_c7_ec10_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1617_c7_ec10_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_6683_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1620_c7_6683_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1626_c7_da1f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1594_c2_540e_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1599_c7_51bd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1617_c7_ec10_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1620_c7_6683_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1620_c7_6683] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_6683_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_6683_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_6683_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_6683_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_6683_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_6683_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_6683_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_6683_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1602_c7_6fc0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1602_c7_6fc0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1602_c7_6fc0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1602_c7_6fc0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1602_c7_6fc0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1602_c7_6fc0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1602_c7_6fc0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1602_c7_6fc0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1602_c7_6fc0_return_output;

     -- t8_MUX[uxn_opcodes_h_l1594_c2_540e] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1594_c2_540e_cond <= VAR_t8_MUX_uxn_opcodes_h_l1594_c2_540e_cond;
     t8_MUX_uxn_opcodes_h_l1594_c2_540e_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1594_c2_540e_iftrue;
     t8_MUX_uxn_opcodes_h_l1594_c2_540e_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1594_c2_540e_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1594_c2_540e_return_output := t8_MUX_uxn_opcodes_h_l1594_c2_540e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1620_c7_6683] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1620_c7_6683_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1620_c7_6683_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1620_c7_6683_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1620_c7_6683_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1620_c7_6683_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1620_c7_6683_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1620_c7_6683_return_output := result_stack_value_MUX_uxn_opcodes_h_l1620_c7_6683_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1599_c7_51bd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1599_c7_51bd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1599_c7_51bd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1599_c7_51bd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1599_c7_51bd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1599_c7_51bd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1599_c7_51bd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1599_c7_51bd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1599_c7_51bd_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1617_c7_ec10] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1617_c7_ec10_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1617_c7_ec10_cond;
     tmp16_MUX_uxn_opcodes_h_l1617_c7_ec10_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1617_c7_ec10_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1617_c7_ec10_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1617_c7_ec10_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1617_c7_ec10_return_output := tmp16_MUX_uxn_opcodes_h_l1617_c7_ec10_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1612_c7_1674] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1612_c7_1674_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1612_c7_1674_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1612_c7_1674_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1612_c7_1674_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1612_c7_1674_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1612_c7_1674_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1612_c7_1674_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1612_c7_1674_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1620_c7_6683] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1620_c7_6683_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1620_c7_6683_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1620_c7_6683_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1620_c7_6683_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1620_c7_6683_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1620_c7_6683_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1620_c7_6683_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1620_c7_6683_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1617_c7_ec10] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1617_c7_ec10_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1617_c7_ec10_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1617_c7_ec10_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1617_c7_ec10_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1617_c7_ec10_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1617_c7_ec10_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1617_c7_ec10_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1617_c7_ec10_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_ec10_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_6683_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c2_540e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1599_c7_51bd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_ec10_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1620_c7_6683_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1608_c7_3cbb_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1612_c7_1674_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1599_c7_51bd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1602_c7_6fc0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1612_c7_1674_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1617_c7_ec10_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1617_c7_ec10_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1620_c7_6683_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1594_c2_540e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1612_c7_1674_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1617_c7_ec10_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l1608_c7_3cbb] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1608_c7_3cbb_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1608_c7_3cbb_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1608_c7_3cbb_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1608_c7_3cbb_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1608_c7_3cbb_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1608_c7_3cbb_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1608_c7_3cbb_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1608_c7_3cbb_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1612_c7_1674] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1612_c7_1674_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1612_c7_1674_cond;
     tmp16_MUX_uxn_opcodes_h_l1612_c7_1674_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1612_c7_1674_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1612_c7_1674_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1612_c7_1674_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1612_c7_1674_return_output := tmp16_MUX_uxn_opcodes_h_l1612_c7_1674_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1612_c7_1674] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1612_c7_1674_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1612_c7_1674_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1612_c7_1674_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1612_c7_1674_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1612_c7_1674_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1612_c7_1674_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1612_c7_1674_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1612_c7_1674_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1594_c2_540e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c2_540e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c2_540e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c2_540e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c2_540e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c2_540e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c2_540e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c2_540e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c2_540e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1617_c7_ec10] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_ec10_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_ec10_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_ec10_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_ec10_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_ec10_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_ec10_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_ec10_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_ec10_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1617_c7_ec10] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_ec10_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_ec10_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_ec10_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_ec10_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_ec10_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_ec10_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_ec10_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_ec10_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1617_c7_ec10] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1617_c7_ec10_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1617_c7_ec10_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1617_c7_ec10_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1617_c7_ec10_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1617_c7_ec10_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1617_c7_ec10_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1617_c7_ec10_return_output := result_stack_value_MUX_uxn_opcodes_h_l1617_c7_ec10_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1599_c7_51bd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1599_c7_51bd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1599_c7_51bd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1599_c7_51bd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1599_c7_51bd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1599_c7_51bd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1599_c7_51bd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1599_c7_51bd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1599_c7_51bd_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1612_c7_1674_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_ec10_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1612_c7_1674_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_ec10_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1602_c7_6fc0_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1608_c7_3cbb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c2_540e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1599_c7_51bd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_3cbb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1612_c7_1674_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1612_c7_1674_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1617_c7_ec10_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1608_c7_3cbb_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1612_c7_1674_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1612_c7_1674] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1612_c7_1674_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1612_c7_1674_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1612_c7_1674_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1612_c7_1674_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1612_c7_1674_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1612_c7_1674_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1612_c7_1674_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1612_c7_1674_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1608_c7_3cbb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_3cbb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_3cbb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_3cbb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_3cbb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_3cbb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_3cbb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_3cbb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_3cbb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1612_c7_1674] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1612_c7_1674_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1612_c7_1674_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1612_c7_1674_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1612_c7_1674_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1612_c7_1674_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1612_c7_1674_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1612_c7_1674_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1612_c7_1674_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1602_c7_6fc0] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1602_c7_6fc0_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1602_c7_6fc0_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1602_c7_6fc0_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1602_c7_6fc0_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1602_c7_6fc0_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1602_c7_6fc0_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1602_c7_6fc0_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1602_c7_6fc0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1594_c2_540e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c2_540e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c2_540e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c2_540e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c2_540e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c2_540e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c2_540e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c2_540e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c2_540e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1612_c7_1674] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1612_c7_1674_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1612_c7_1674_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1612_c7_1674_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1612_c7_1674_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1612_c7_1674_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1612_c7_1674_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1612_c7_1674_return_output := result_stack_value_MUX_uxn_opcodes_h_l1612_c7_1674_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1608_c7_3cbb] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1608_c7_3cbb_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1608_c7_3cbb_cond;
     tmp16_MUX_uxn_opcodes_h_l1608_c7_3cbb_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1608_c7_3cbb_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1608_c7_3cbb_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1608_c7_3cbb_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1608_c7_3cbb_return_output := tmp16_MUX_uxn_opcodes_h_l1608_c7_3cbb_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_3cbb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1612_c7_1674_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1608_c7_3cbb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1612_c7_1674_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1599_c7_51bd_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1602_c7_6fc0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1602_c7_6fc0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_3cbb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1608_c7_3cbb_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1612_c7_1674_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1602_c7_6fc0_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1608_c7_3cbb_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l1599_c7_51bd] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1599_c7_51bd_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1599_c7_51bd_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1599_c7_51bd_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1599_c7_51bd_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1599_c7_51bd_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1599_c7_51bd_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1599_c7_51bd_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1599_c7_51bd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1608_c7_3cbb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_3cbb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_3cbb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_3cbb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_3cbb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_3cbb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_3cbb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_3cbb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_3cbb_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1608_c7_3cbb] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1608_c7_3cbb_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1608_c7_3cbb_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1608_c7_3cbb_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1608_c7_3cbb_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1608_c7_3cbb_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1608_c7_3cbb_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1608_c7_3cbb_return_output := result_stack_value_MUX_uxn_opcodes_h_l1608_c7_3cbb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1602_c7_6fc0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1602_c7_6fc0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1602_c7_6fc0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1602_c7_6fc0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1602_c7_6fc0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1602_c7_6fc0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1602_c7_6fc0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1602_c7_6fc0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1602_c7_6fc0_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1602_c7_6fc0] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1602_c7_6fc0_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1602_c7_6fc0_cond;
     tmp16_MUX_uxn_opcodes_h_l1602_c7_6fc0_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1602_c7_6fc0_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1602_c7_6fc0_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1602_c7_6fc0_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1602_c7_6fc0_return_output := tmp16_MUX_uxn_opcodes_h_l1602_c7_6fc0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1608_c7_3cbb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1608_c7_3cbb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1608_c7_3cbb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1608_c7_3cbb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1608_c7_3cbb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1608_c7_3cbb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1608_c7_3cbb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1608_c7_3cbb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1608_c7_3cbb_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_6fc0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_3cbb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_6fc0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1608_c7_3cbb_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1594_c2_540e_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1599_c7_51bd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1599_c7_51bd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1602_c7_6fc0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1602_c7_6fc0_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1608_c7_3cbb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1599_c7_51bd_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1602_c7_6fc0_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1602_c7_6fc0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_6fc0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_6fc0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_6fc0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_6fc0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_6fc0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_6fc0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_6fc0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_6fc0_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1594_c2_540e] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1594_c2_540e_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1594_c2_540e_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1594_c2_540e_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1594_c2_540e_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1594_c2_540e_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1594_c2_540e_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1594_c2_540e_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1594_c2_540e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1602_c7_6fc0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_6fc0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_6fc0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_6fc0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_6fc0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_6fc0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_6fc0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_6fc0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_6fc0_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1599_c7_51bd] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1599_c7_51bd_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1599_c7_51bd_cond;
     tmp16_MUX_uxn_opcodes_h_l1599_c7_51bd_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1599_c7_51bd_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1599_c7_51bd_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1599_c7_51bd_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1599_c7_51bd_return_output := tmp16_MUX_uxn_opcodes_h_l1599_c7_51bd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1599_c7_51bd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1599_c7_51bd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1599_c7_51bd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1599_c7_51bd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1599_c7_51bd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1599_c7_51bd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1599_c7_51bd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1599_c7_51bd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1599_c7_51bd_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1602_c7_6fc0] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1602_c7_6fc0_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1602_c7_6fc0_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1602_c7_6fc0_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1602_c7_6fc0_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1602_c7_6fc0_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1602_c7_6fc0_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1602_c7_6fc0_return_output := result_stack_value_MUX_uxn_opcodes_h_l1602_c7_6fc0_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1599_c7_51bd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_6fc0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1599_c7_51bd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_6fc0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c2_540e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1599_c7_51bd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1599_c7_51bd_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1602_c7_6fc0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1594_c2_540e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1599_c7_51bd_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1594_c2_540e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1594_c2_540e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1594_c2_540e_cond;
     tmp16_MUX_uxn_opcodes_h_l1594_c2_540e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1594_c2_540e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1594_c2_540e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1594_c2_540e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1594_c2_540e_return_output := tmp16_MUX_uxn_opcodes_h_l1594_c2_540e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1599_c7_51bd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1599_c7_51bd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1599_c7_51bd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1599_c7_51bd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1599_c7_51bd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1599_c7_51bd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1599_c7_51bd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1599_c7_51bd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1599_c7_51bd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1594_c2_540e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c2_540e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c2_540e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c2_540e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c2_540e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c2_540e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c2_540e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c2_540e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c2_540e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1599_c7_51bd] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1599_c7_51bd_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1599_c7_51bd_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1599_c7_51bd_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1599_c7_51bd_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1599_c7_51bd_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1599_c7_51bd_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1599_c7_51bd_return_output := result_stack_value_MUX_uxn_opcodes_h_l1599_c7_51bd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1599_c7_51bd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1599_c7_51bd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1599_c7_51bd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1599_c7_51bd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1599_c7_51bd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1599_c7_51bd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1599_c7_51bd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1599_c7_51bd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1599_c7_51bd_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1594_c2_540e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1599_c7_51bd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1594_c2_540e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1599_c7_51bd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1594_c2_540e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1599_c7_51bd_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1594_c2_540e_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1594_c2_540e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1594_c2_540e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1594_c2_540e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1594_c2_540e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1594_c2_540e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1594_c2_540e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1594_c2_540e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1594_c2_540e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1594_c2_540e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1594_c2_540e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1594_c2_540e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1594_c2_540e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1594_c2_540e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1594_c2_540e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1594_c2_540e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1594_c2_540e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1594_c2_540e_return_output := result_stack_value_MUX_uxn_opcodes_h_l1594_c2_540e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1594_c2_540e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1594_c2_540e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1594_c2_540e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1594_c2_540e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1594_c2_540e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1594_c2_540e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1594_c2_540e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1594_c2_540e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1594_c2_540e_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_5b20_uxn_opcodes_h_l1635_l1589_DUPLICATE_9678 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b20_uxn_opcodes_h_l1635_l1589_DUPLICATE_9678_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_5b20(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1594_c2_540e_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1594_c2_540e_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1594_c2_540e_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1594_c2_540e_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1594_c2_540e_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1594_c2_540e_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1594_c2_540e_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b20_uxn_opcodes_h_l1635_l1589_DUPLICATE_9678_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b20_uxn_opcodes_h_l1635_l1589_DUPLICATE_9678_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
