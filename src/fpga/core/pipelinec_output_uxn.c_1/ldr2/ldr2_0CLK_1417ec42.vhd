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
-- Submodules: 82
entity ldr2_0CLK_1417ec42 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ldr2_0CLK_1417ec42;
architecture arch of ldr2_0CLK_1417ec42 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1726_c6_e3a2]
signal BIN_OP_EQ_uxn_opcodes_h_l1726_c6_e3a2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1726_c6_e3a2_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1726_c6_e3a2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1726_c1_7021]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1726_c1_7021_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1726_c1_7021_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1726_c1_7021_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1726_c1_7021_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1726_c2_e6cc]
signal tmp16_MUX_uxn_opcodes_h_l1726_c2_e6cc_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1726_c2_e6cc_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1726_c2_e6cc_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1726_c2_e6cc_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l1726_c2_e6cc]
signal t8_MUX_uxn_opcodes_h_l1726_c2_e6cc_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1726_c2_e6cc_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1726_c2_e6cc_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1726_c2_e6cc_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1726_c2_e6cc]
signal result_u8_value_MUX_uxn_opcodes_h_l1726_c2_e6cc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1726_c2_e6cc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1726_c2_e6cc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1726_c2_e6cc_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1726_c2_e6cc]
signal result_u16_value_MUX_uxn_opcodes_h_l1726_c2_e6cc_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1726_c2_e6cc_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1726_c2_e6cc_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1726_c2_e6cc_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1726_c2_e6cc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1726_c2_e6cc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1726_c2_e6cc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1726_c2_e6cc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1726_c2_e6cc_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1726_c2_e6cc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1726_c2_e6cc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1726_c2_e6cc_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1726_c2_e6cc_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1726_c2_e6cc_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1726_c2_e6cc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1726_c2_e6cc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1726_c2_e6cc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1726_c2_e6cc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1726_c2_e6cc_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1726_c2_e6cc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1726_c2_e6cc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1726_c2_e6cc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1726_c2_e6cc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1726_c2_e6cc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1726_c2_e6cc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1726_c2_e6cc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1726_c2_e6cc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1726_c2_e6cc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1726_c2_e6cc_return_output : unsigned(3 downto 0);

-- printf_uxn_opcodes_h_l1727_c3_3ab5[uxn_opcodes_h_l1727_c3_3ab5]
signal printf_uxn_opcodes_h_l1727_c3_3ab5_uxn_opcodes_h_l1727_c3_3ab5_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1731_c11_5901]
signal BIN_OP_EQ_uxn_opcodes_h_l1731_c11_5901_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1731_c11_5901_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1731_c11_5901_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1731_c7_20ab]
signal tmp16_MUX_uxn_opcodes_h_l1731_c7_20ab_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1731_c7_20ab_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1731_c7_20ab_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1731_c7_20ab_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l1731_c7_20ab]
signal t8_MUX_uxn_opcodes_h_l1731_c7_20ab_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1731_c7_20ab_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1731_c7_20ab_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1731_c7_20ab_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1731_c7_20ab]
signal result_u8_value_MUX_uxn_opcodes_h_l1731_c7_20ab_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1731_c7_20ab_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1731_c7_20ab_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1731_c7_20ab_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1731_c7_20ab]
signal result_u16_value_MUX_uxn_opcodes_h_l1731_c7_20ab_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1731_c7_20ab_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1731_c7_20ab_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1731_c7_20ab_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1731_c7_20ab]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_20ab_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_20ab_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_20ab_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_20ab_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1731_c7_20ab]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_20ab_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_20ab_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_20ab_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_20ab_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1731_c7_20ab]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1731_c7_20ab_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1731_c7_20ab_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1731_c7_20ab_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1731_c7_20ab_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1731_c7_20ab]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c7_20ab_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c7_20ab_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c7_20ab_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c7_20ab_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1731_c7_20ab]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_20ab_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_20ab_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_20ab_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_20ab_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1734_c11_eb46]
signal BIN_OP_EQ_uxn_opcodes_h_l1734_c11_eb46_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1734_c11_eb46_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1734_c11_eb46_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1734_c7_54e6]
signal tmp16_MUX_uxn_opcodes_h_l1734_c7_54e6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1734_c7_54e6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1734_c7_54e6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1734_c7_54e6_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l1734_c7_54e6]
signal t8_MUX_uxn_opcodes_h_l1734_c7_54e6_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1734_c7_54e6_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1734_c7_54e6_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1734_c7_54e6_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1734_c7_54e6]
signal result_u8_value_MUX_uxn_opcodes_h_l1734_c7_54e6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1734_c7_54e6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1734_c7_54e6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1734_c7_54e6_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1734_c7_54e6]
signal result_u16_value_MUX_uxn_opcodes_h_l1734_c7_54e6_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1734_c7_54e6_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1734_c7_54e6_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1734_c7_54e6_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1734_c7_54e6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_54e6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_54e6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_54e6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_54e6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1734_c7_54e6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_54e6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_54e6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_54e6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_54e6_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1734_c7_54e6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1734_c7_54e6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1734_c7_54e6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1734_c7_54e6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1734_c7_54e6_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1734_c7_54e6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1734_c7_54e6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1734_c7_54e6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1734_c7_54e6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1734_c7_54e6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1734_c7_54e6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_54e6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_54e6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_54e6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_54e6_return_output : unsigned(3 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1737_c30_33f2]
signal sp_relative_shift_uxn_opcodes_h_l1737_c30_33f2_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1737_c30_33f2_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1737_c30_33f2_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1737_c30_33f2_return_output : signed(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1738_c22_90e3]
signal BIN_OP_PLUS_uxn_opcodes_h_l1738_c22_90e3_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1738_c22_90e3_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1738_c22_90e3_return_output : signed(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1740_c11_d9f8]
signal BIN_OP_EQ_uxn_opcodes_h_l1740_c11_d9f8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1740_c11_d9f8_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1740_c11_d9f8_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1740_c7_251b]
signal tmp16_MUX_uxn_opcodes_h_l1740_c7_251b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1740_c7_251b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1740_c7_251b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1740_c7_251b_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1740_c7_251b]
signal result_u8_value_MUX_uxn_opcodes_h_l1740_c7_251b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1740_c7_251b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1740_c7_251b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1740_c7_251b_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1740_c7_251b]
signal result_u16_value_MUX_uxn_opcodes_h_l1740_c7_251b_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1740_c7_251b_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1740_c7_251b_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1740_c7_251b_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1740_c7_251b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1740_c7_251b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1740_c7_251b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1740_c7_251b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1740_c7_251b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1740_c7_251b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1740_c7_251b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1740_c7_251b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1740_c7_251b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1740_c7_251b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1740_c7_251b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1740_c7_251b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1740_c7_251b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1740_c7_251b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1740_c7_251b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1740_c7_251b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c7_251b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c7_251b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c7_251b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c7_251b_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1744_c11_e74c]
signal BIN_OP_EQ_uxn_opcodes_h_l1744_c11_e74c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1744_c11_e74c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1744_c11_e74c_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1744_c7_f475]
signal tmp16_MUX_uxn_opcodes_h_l1744_c7_f475_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1744_c7_f475_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1744_c7_f475_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1744_c7_f475_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1744_c7_f475]
signal result_u8_value_MUX_uxn_opcodes_h_l1744_c7_f475_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1744_c7_f475_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1744_c7_f475_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1744_c7_f475_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1744_c7_f475]
signal result_u16_value_MUX_uxn_opcodes_h_l1744_c7_f475_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1744_c7_f475_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1744_c7_f475_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1744_c7_f475_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1744_c7_f475]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_f475_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_f475_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_f475_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_f475_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1744_c7_f475]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_f475_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_f475_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_f475_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_f475_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1744_c7_f475]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_f475_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_f475_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_f475_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_f475_return_output : unsigned(3 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1746_c3_33e0]
signal CONST_SL_8_uxn_opcodes_h_l1746_c3_33e0_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1746_c3_33e0_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1747_c22_2e86]
signal BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_2e86_left : signed(17 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_2e86_right : signed(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_2e86_return_output : signed(18 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1749_c11_69b8]
signal BIN_OP_EQ_uxn_opcodes_h_l1749_c11_69b8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1749_c11_69b8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1749_c11_69b8_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1749_c7_2dd4]
signal tmp16_MUX_uxn_opcodes_h_l1749_c7_2dd4_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1749_c7_2dd4_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1749_c7_2dd4_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1749_c7_2dd4_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1749_c7_2dd4]
signal result_u8_value_MUX_uxn_opcodes_h_l1749_c7_2dd4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1749_c7_2dd4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1749_c7_2dd4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1749_c7_2dd4_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1749_c7_2dd4]
signal result_u16_value_MUX_uxn_opcodes_h_l1749_c7_2dd4_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1749_c7_2dd4_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1749_c7_2dd4_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1749_c7_2dd4_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1749_c7_2dd4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_2dd4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_2dd4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_2dd4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_2dd4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1749_c7_2dd4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1749_c7_2dd4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1749_c7_2dd4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1749_c7_2dd4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1749_c7_2dd4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1749_c7_2dd4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1749_c7_2dd4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1749_c7_2dd4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1749_c7_2dd4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1749_c7_2dd4_return_output : unsigned(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1750_c22_4405]
signal BIN_OP_PLUS_uxn_opcodes_h_l1750_c22_4405_left : signed(17 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1750_c22_4405_right : signed(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1750_c22_4405_return_output : signed(18 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1752_c11_8e63]
signal BIN_OP_EQ_uxn_opcodes_h_l1752_c11_8e63_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1752_c11_8e63_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1752_c11_8e63_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1752_c7_847b]
signal tmp16_MUX_uxn_opcodes_h_l1752_c7_847b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1752_c7_847b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1752_c7_847b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1752_c7_847b_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1752_c7_847b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_847b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_847b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_847b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_847b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1752_c7_847b]
signal result_u8_value_MUX_uxn_opcodes_h_l1752_c7_847b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1752_c7_847b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1752_c7_847b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1752_c7_847b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1752_c7_847b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_847b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_847b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_847b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_847b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1752_c7_847b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1752_c7_847b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1752_c7_847b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1752_c7_847b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1752_c7_847b_return_output : unsigned(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1753_c3_6cdd]
signal BIN_OP_OR_uxn_opcodes_h_l1753_c3_6cdd_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1753_c3_6cdd_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1753_c3_6cdd_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1758_c11_b9d1]
signal BIN_OP_EQ_uxn_opcodes_h_l1758_c11_b9d1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1758_c11_b9d1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1758_c11_b9d1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1758_c7_e6d8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_e6d8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_e6d8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_e6d8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_e6d8_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1758_c7_e6d8]
signal result_u8_value_MUX_uxn_opcodes_h_l1758_c7_e6d8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1758_c7_e6d8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1758_c7_e6d8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1758_c7_e6d8_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1758_c7_e6d8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_e6d8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_e6d8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_e6d8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_e6d8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1758_c7_e6d8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_e6d8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_e6d8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_e6d8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_e6d8_return_output : unsigned(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1760_c31_438f]
signal CONST_SR_8_uxn_opcodes_h_l1760_c31_438f_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1760_c31_438f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1762_c11_24be]
signal BIN_OP_EQ_uxn_opcodes_h_l1762_c11_24be_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1762_c11_24be_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1762_c11_24be_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1762_c7_c487]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1762_c7_c487_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1762_c7_c487_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1762_c7_c487_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1762_c7_c487_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1762_c7_c487]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_c487_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_c487_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_c487_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_c487_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1750_l1747_l1742_DUPLICATE_d299
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1750_l1747_l1742_DUPLICATE_d299_left : signed(16 downto 0);
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1750_l1747_l1742_DUPLICATE_d299_right : signed(7 downto 0);
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1750_l1747_l1742_DUPLICATE_d299_return_output : signed(17 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_9969( ref_toks_0 : opcode_result_t;
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
      base.u8_value := ref_toks_1;
      base.u16_value := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.is_sp_shift := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1726_c6_e3a2
BIN_OP_EQ_uxn_opcodes_h_l1726_c6_e3a2 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1726_c6_e3a2_left,
BIN_OP_EQ_uxn_opcodes_h_l1726_c6_e3a2_right,
BIN_OP_EQ_uxn_opcodes_h_l1726_c6_e3a2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1726_c1_7021
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1726_c1_7021 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1726_c1_7021_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1726_c1_7021_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1726_c1_7021_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1726_c1_7021_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1726_c2_e6cc
tmp16_MUX_uxn_opcodes_h_l1726_c2_e6cc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1726_c2_e6cc_cond,
tmp16_MUX_uxn_opcodes_h_l1726_c2_e6cc_iftrue,
tmp16_MUX_uxn_opcodes_h_l1726_c2_e6cc_iffalse,
tmp16_MUX_uxn_opcodes_h_l1726_c2_e6cc_return_output);

-- t8_MUX_uxn_opcodes_h_l1726_c2_e6cc
t8_MUX_uxn_opcodes_h_l1726_c2_e6cc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1726_c2_e6cc_cond,
t8_MUX_uxn_opcodes_h_l1726_c2_e6cc_iftrue,
t8_MUX_uxn_opcodes_h_l1726_c2_e6cc_iffalse,
t8_MUX_uxn_opcodes_h_l1726_c2_e6cc_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1726_c2_e6cc
result_u8_value_MUX_uxn_opcodes_h_l1726_c2_e6cc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1726_c2_e6cc_cond,
result_u8_value_MUX_uxn_opcodes_h_l1726_c2_e6cc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1726_c2_e6cc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1726_c2_e6cc_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1726_c2_e6cc
result_u16_value_MUX_uxn_opcodes_h_l1726_c2_e6cc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1726_c2_e6cc_cond,
result_u16_value_MUX_uxn_opcodes_h_l1726_c2_e6cc_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1726_c2_e6cc_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1726_c2_e6cc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1726_c2_e6cc
result_is_opc_done_MUX_uxn_opcodes_h_l1726_c2_e6cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1726_c2_e6cc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1726_c2_e6cc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1726_c2_e6cc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1726_c2_e6cc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1726_c2_e6cc
result_sp_relative_shift_MUX_uxn_opcodes_h_l1726_c2_e6cc : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1726_c2_e6cc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1726_c2_e6cc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1726_c2_e6cc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1726_c2_e6cc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1726_c2_e6cc
result_is_stack_write_MUX_uxn_opcodes_h_l1726_c2_e6cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1726_c2_e6cc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1726_c2_e6cc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1726_c2_e6cc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1726_c2_e6cc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1726_c2_e6cc
result_is_sp_shift_MUX_uxn_opcodes_h_l1726_c2_e6cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1726_c2_e6cc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1726_c2_e6cc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1726_c2_e6cc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1726_c2_e6cc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1726_c2_e6cc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1726_c2_e6cc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1726_c2_e6cc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1726_c2_e6cc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1726_c2_e6cc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1726_c2_e6cc_return_output);

-- printf_uxn_opcodes_h_l1727_c3_3ab5_uxn_opcodes_h_l1727_c3_3ab5
printf_uxn_opcodes_h_l1727_c3_3ab5_uxn_opcodes_h_l1727_c3_3ab5 : entity work.printf_uxn_opcodes_h_l1727_c3_3ab5_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1727_c3_3ab5_uxn_opcodes_h_l1727_c3_3ab5_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1731_c11_5901
BIN_OP_EQ_uxn_opcodes_h_l1731_c11_5901 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1731_c11_5901_left,
BIN_OP_EQ_uxn_opcodes_h_l1731_c11_5901_right,
BIN_OP_EQ_uxn_opcodes_h_l1731_c11_5901_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1731_c7_20ab
tmp16_MUX_uxn_opcodes_h_l1731_c7_20ab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1731_c7_20ab_cond,
tmp16_MUX_uxn_opcodes_h_l1731_c7_20ab_iftrue,
tmp16_MUX_uxn_opcodes_h_l1731_c7_20ab_iffalse,
tmp16_MUX_uxn_opcodes_h_l1731_c7_20ab_return_output);

-- t8_MUX_uxn_opcodes_h_l1731_c7_20ab
t8_MUX_uxn_opcodes_h_l1731_c7_20ab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1731_c7_20ab_cond,
t8_MUX_uxn_opcodes_h_l1731_c7_20ab_iftrue,
t8_MUX_uxn_opcodes_h_l1731_c7_20ab_iffalse,
t8_MUX_uxn_opcodes_h_l1731_c7_20ab_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1731_c7_20ab
result_u8_value_MUX_uxn_opcodes_h_l1731_c7_20ab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1731_c7_20ab_cond,
result_u8_value_MUX_uxn_opcodes_h_l1731_c7_20ab_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1731_c7_20ab_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1731_c7_20ab_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1731_c7_20ab
result_u16_value_MUX_uxn_opcodes_h_l1731_c7_20ab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1731_c7_20ab_cond,
result_u16_value_MUX_uxn_opcodes_h_l1731_c7_20ab_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1731_c7_20ab_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1731_c7_20ab_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_20ab
result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_20ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_20ab_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_20ab_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_20ab_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_20ab_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_20ab
result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_20ab : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_20ab_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_20ab_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_20ab_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_20ab_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1731_c7_20ab
result_is_stack_write_MUX_uxn_opcodes_h_l1731_c7_20ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1731_c7_20ab_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1731_c7_20ab_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1731_c7_20ab_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1731_c7_20ab_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c7_20ab
result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c7_20ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c7_20ab_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c7_20ab_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c7_20ab_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c7_20ab_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_20ab
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_20ab : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_20ab_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_20ab_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_20ab_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_20ab_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1734_c11_eb46
BIN_OP_EQ_uxn_opcodes_h_l1734_c11_eb46 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1734_c11_eb46_left,
BIN_OP_EQ_uxn_opcodes_h_l1734_c11_eb46_right,
BIN_OP_EQ_uxn_opcodes_h_l1734_c11_eb46_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1734_c7_54e6
tmp16_MUX_uxn_opcodes_h_l1734_c7_54e6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1734_c7_54e6_cond,
tmp16_MUX_uxn_opcodes_h_l1734_c7_54e6_iftrue,
tmp16_MUX_uxn_opcodes_h_l1734_c7_54e6_iffalse,
tmp16_MUX_uxn_opcodes_h_l1734_c7_54e6_return_output);

-- t8_MUX_uxn_opcodes_h_l1734_c7_54e6
t8_MUX_uxn_opcodes_h_l1734_c7_54e6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1734_c7_54e6_cond,
t8_MUX_uxn_opcodes_h_l1734_c7_54e6_iftrue,
t8_MUX_uxn_opcodes_h_l1734_c7_54e6_iffalse,
t8_MUX_uxn_opcodes_h_l1734_c7_54e6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1734_c7_54e6
result_u8_value_MUX_uxn_opcodes_h_l1734_c7_54e6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1734_c7_54e6_cond,
result_u8_value_MUX_uxn_opcodes_h_l1734_c7_54e6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1734_c7_54e6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1734_c7_54e6_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1734_c7_54e6
result_u16_value_MUX_uxn_opcodes_h_l1734_c7_54e6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1734_c7_54e6_cond,
result_u16_value_MUX_uxn_opcodes_h_l1734_c7_54e6_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1734_c7_54e6_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1734_c7_54e6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_54e6
result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_54e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_54e6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_54e6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_54e6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_54e6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_54e6
result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_54e6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_54e6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_54e6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_54e6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_54e6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1734_c7_54e6
result_is_stack_write_MUX_uxn_opcodes_h_l1734_c7_54e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1734_c7_54e6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1734_c7_54e6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1734_c7_54e6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1734_c7_54e6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1734_c7_54e6
result_is_sp_shift_MUX_uxn_opcodes_h_l1734_c7_54e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1734_c7_54e6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1734_c7_54e6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1734_c7_54e6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1734_c7_54e6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_54e6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_54e6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_54e6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_54e6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_54e6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_54e6_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1737_c30_33f2
sp_relative_shift_uxn_opcodes_h_l1737_c30_33f2 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1737_c30_33f2_ins,
sp_relative_shift_uxn_opcodes_h_l1737_c30_33f2_x,
sp_relative_shift_uxn_opcodes_h_l1737_c30_33f2_y,
sp_relative_shift_uxn_opcodes_h_l1737_c30_33f2_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1738_c22_90e3
BIN_OP_PLUS_uxn_opcodes_h_l1738_c22_90e3 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1738_c22_90e3_left,
BIN_OP_PLUS_uxn_opcodes_h_l1738_c22_90e3_right,
BIN_OP_PLUS_uxn_opcodes_h_l1738_c22_90e3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1740_c11_d9f8
BIN_OP_EQ_uxn_opcodes_h_l1740_c11_d9f8 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1740_c11_d9f8_left,
BIN_OP_EQ_uxn_opcodes_h_l1740_c11_d9f8_right,
BIN_OP_EQ_uxn_opcodes_h_l1740_c11_d9f8_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1740_c7_251b
tmp16_MUX_uxn_opcodes_h_l1740_c7_251b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1740_c7_251b_cond,
tmp16_MUX_uxn_opcodes_h_l1740_c7_251b_iftrue,
tmp16_MUX_uxn_opcodes_h_l1740_c7_251b_iffalse,
tmp16_MUX_uxn_opcodes_h_l1740_c7_251b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1740_c7_251b
result_u8_value_MUX_uxn_opcodes_h_l1740_c7_251b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1740_c7_251b_cond,
result_u8_value_MUX_uxn_opcodes_h_l1740_c7_251b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1740_c7_251b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1740_c7_251b_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1740_c7_251b
result_u16_value_MUX_uxn_opcodes_h_l1740_c7_251b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1740_c7_251b_cond,
result_u16_value_MUX_uxn_opcodes_h_l1740_c7_251b_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1740_c7_251b_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1740_c7_251b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1740_c7_251b
result_is_opc_done_MUX_uxn_opcodes_h_l1740_c7_251b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1740_c7_251b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1740_c7_251b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1740_c7_251b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1740_c7_251b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1740_c7_251b
result_is_stack_write_MUX_uxn_opcodes_h_l1740_c7_251b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1740_c7_251b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1740_c7_251b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1740_c7_251b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1740_c7_251b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1740_c7_251b
result_is_sp_shift_MUX_uxn_opcodes_h_l1740_c7_251b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1740_c7_251b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1740_c7_251b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1740_c7_251b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1740_c7_251b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c7_251b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c7_251b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c7_251b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c7_251b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c7_251b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c7_251b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1744_c11_e74c
BIN_OP_EQ_uxn_opcodes_h_l1744_c11_e74c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1744_c11_e74c_left,
BIN_OP_EQ_uxn_opcodes_h_l1744_c11_e74c_right,
BIN_OP_EQ_uxn_opcodes_h_l1744_c11_e74c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1744_c7_f475
tmp16_MUX_uxn_opcodes_h_l1744_c7_f475 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1744_c7_f475_cond,
tmp16_MUX_uxn_opcodes_h_l1744_c7_f475_iftrue,
tmp16_MUX_uxn_opcodes_h_l1744_c7_f475_iffalse,
tmp16_MUX_uxn_opcodes_h_l1744_c7_f475_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1744_c7_f475
result_u8_value_MUX_uxn_opcodes_h_l1744_c7_f475 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1744_c7_f475_cond,
result_u8_value_MUX_uxn_opcodes_h_l1744_c7_f475_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1744_c7_f475_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1744_c7_f475_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1744_c7_f475
result_u16_value_MUX_uxn_opcodes_h_l1744_c7_f475 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1744_c7_f475_cond,
result_u16_value_MUX_uxn_opcodes_h_l1744_c7_f475_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1744_c7_f475_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1744_c7_f475_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_f475
result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_f475 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_f475_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_f475_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_f475_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_f475_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_f475
result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_f475 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_f475_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_f475_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_f475_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_f475_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_f475
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_f475 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_f475_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_f475_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_f475_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_f475_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1746_c3_33e0
CONST_SL_8_uxn_opcodes_h_l1746_c3_33e0 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1746_c3_33e0_x,
CONST_SL_8_uxn_opcodes_h_l1746_c3_33e0_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_2e86
BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_2e86 : entity work.BIN_OP_PLUS_int18_t_int2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_2e86_left,
BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_2e86_right,
BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_2e86_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1749_c11_69b8
BIN_OP_EQ_uxn_opcodes_h_l1749_c11_69b8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1749_c11_69b8_left,
BIN_OP_EQ_uxn_opcodes_h_l1749_c11_69b8_right,
BIN_OP_EQ_uxn_opcodes_h_l1749_c11_69b8_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1749_c7_2dd4
tmp16_MUX_uxn_opcodes_h_l1749_c7_2dd4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1749_c7_2dd4_cond,
tmp16_MUX_uxn_opcodes_h_l1749_c7_2dd4_iftrue,
tmp16_MUX_uxn_opcodes_h_l1749_c7_2dd4_iffalse,
tmp16_MUX_uxn_opcodes_h_l1749_c7_2dd4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1749_c7_2dd4
result_u8_value_MUX_uxn_opcodes_h_l1749_c7_2dd4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1749_c7_2dd4_cond,
result_u8_value_MUX_uxn_opcodes_h_l1749_c7_2dd4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1749_c7_2dd4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1749_c7_2dd4_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1749_c7_2dd4
result_u16_value_MUX_uxn_opcodes_h_l1749_c7_2dd4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1749_c7_2dd4_cond,
result_u16_value_MUX_uxn_opcodes_h_l1749_c7_2dd4_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1749_c7_2dd4_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1749_c7_2dd4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_2dd4
result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_2dd4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_2dd4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_2dd4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_2dd4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_2dd4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1749_c7_2dd4
result_is_stack_write_MUX_uxn_opcodes_h_l1749_c7_2dd4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1749_c7_2dd4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1749_c7_2dd4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1749_c7_2dd4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1749_c7_2dd4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1749_c7_2dd4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1749_c7_2dd4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1749_c7_2dd4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1749_c7_2dd4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1749_c7_2dd4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1749_c7_2dd4_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1750_c22_4405
BIN_OP_PLUS_uxn_opcodes_h_l1750_c22_4405 : entity work.BIN_OP_PLUS_int18_t_int2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1750_c22_4405_left,
BIN_OP_PLUS_uxn_opcodes_h_l1750_c22_4405_right,
BIN_OP_PLUS_uxn_opcodes_h_l1750_c22_4405_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1752_c11_8e63
BIN_OP_EQ_uxn_opcodes_h_l1752_c11_8e63 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1752_c11_8e63_left,
BIN_OP_EQ_uxn_opcodes_h_l1752_c11_8e63_right,
BIN_OP_EQ_uxn_opcodes_h_l1752_c11_8e63_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1752_c7_847b
tmp16_MUX_uxn_opcodes_h_l1752_c7_847b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1752_c7_847b_cond,
tmp16_MUX_uxn_opcodes_h_l1752_c7_847b_iftrue,
tmp16_MUX_uxn_opcodes_h_l1752_c7_847b_iffalse,
tmp16_MUX_uxn_opcodes_h_l1752_c7_847b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_847b
result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_847b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_847b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_847b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_847b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_847b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1752_c7_847b
result_u8_value_MUX_uxn_opcodes_h_l1752_c7_847b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1752_c7_847b_cond,
result_u8_value_MUX_uxn_opcodes_h_l1752_c7_847b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1752_c7_847b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1752_c7_847b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_847b
result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_847b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_847b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_847b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_847b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_847b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1752_c7_847b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1752_c7_847b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1752_c7_847b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1752_c7_847b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1752_c7_847b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1752_c7_847b_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1753_c3_6cdd
BIN_OP_OR_uxn_opcodes_h_l1753_c3_6cdd : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1753_c3_6cdd_left,
BIN_OP_OR_uxn_opcodes_h_l1753_c3_6cdd_right,
BIN_OP_OR_uxn_opcodes_h_l1753_c3_6cdd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1758_c11_b9d1
BIN_OP_EQ_uxn_opcodes_h_l1758_c11_b9d1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1758_c11_b9d1_left,
BIN_OP_EQ_uxn_opcodes_h_l1758_c11_b9d1_right,
BIN_OP_EQ_uxn_opcodes_h_l1758_c11_b9d1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_e6d8
result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_e6d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_e6d8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_e6d8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_e6d8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_e6d8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1758_c7_e6d8
result_u8_value_MUX_uxn_opcodes_h_l1758_c7_e6d8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1758_c7_e6d8_cond,
result_u8_value_MUX_uxn_opcodes_h_l1758_c7_e6d8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1758_c7_e6d8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1758_c7_e6d8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_e6d8
result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_e6d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_e6d8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_e6d8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_e6d8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_e6d8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_e6d8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_e6d8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_e6d8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_e6d8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_e6d8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_e6d8_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1760_c31_438f
CONST_SR_8_uxn_opcodes_h_l1760_c31_438f : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1760_c31_438f_x,
CONST_SR_8_uxn_opcodes_h_l1760_c31_438f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1762_c11_24be
BIN_OP_EQ_uxn_opcodes_h_l1762_c11_24be : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1762_c11_24be_left,
BIN_OP_EQ_uxn_opcodes_h_l1762_c11_24be_right,
BIN_OP_EQ_uxn_opcodes_h_l1762_c11_24be_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1762_c7_c487
result_is_stack_write_MUX_uxn_opcodes_h_l1762_c7_c487 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1762_c7_c487_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1762_c7_c487_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1762_c7_c487_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1762_c7_c487_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_c487
result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_c487 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_c487_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_c487_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_c487_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_c487_return_output);

-- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1750_l1747_l1742_DUPLICATE_d299
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1750_l1747_l1742_DUPLICATE_d299 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1750_l1747_l1742_DUPLICATE_d299_left,
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1750_l1747_l1742_DUPLICATE_d299_right,
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1750_l1747_l1742_DUPLICATE_d299_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 t8,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1726_c6_e3a2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1726_c1_7021_return_output,
 tmp16_MUX_uxn_opcodes_h_l1726_c2_e6cc_return_output,
 t8_MUX_uxn_opcodes_h_l1726_c2_e6cc_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1726_c2_e6cc_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1726_c2_e6cc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1726_c2_e6cc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1726_c2_e6cc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1726_c2_e6cc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1726_c2_e6cc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1726_c2_e6cc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1731_c11_5901_return_output,
 tmp16_MUX_uxn_opcodes_h_l1731_c7_20ab_return_output,
 t8_MUX_uxn_opcodes_h_l1731_c7_20ab_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1731_c7_20ab_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1731_c7_20ab_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_20ab_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_20ab_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1731_c7_20ab_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c7_20ab_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_20ab_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1734_c11_eb46_return_output,
 tmp16_MUX_uxn_opcodes_h_l1734_c7_54e6_return_output,
 t8_MUX_uxn_opcodes_h_l1734_c7_54e6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1734_c7_54e6_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1734_c7_54e6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_54e6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_54e6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1734_c7_54e6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1734_c7_54e6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_54e6_return_output,
 sp_relative_shift_uxn_opcodes_h_l1737_c30_33f2_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1738_c22_90e3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1740_c11_d9f8_return_output,
 tmp16_MUX_uxn_opcodes_h_l1740_c7_251b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1740_c7_251b_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1740_c7_251b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1740_c7_251b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1740_c7_251b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1740_c7_251b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c7_251b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1744_c11_e74c_return_output,
 tmp16_MUX_uxn_opcodes_h_l1744_c7_f475_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1744_c7_f475_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1744_c7_f475_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_f475_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_f475_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_f475_return_output,
 CONST_SL_8_uxn_opcodes_h_l1746_c3_33e0_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_2e86_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1749_c11_69b8_return_output,
 tmp16_MUX_uxn_opcodes_h_l1749_c7_2dd4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1749_c7_2dd4_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1749_c7_2dd4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_2dd4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1749_c7_2dd4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1749_c7_2dd4_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1750_c22_4405_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1752_c11_8e63_return_output,
 tmp16_MUX_uxn_opcodes_h_l1752_c7_847b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_847b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1752_c7_847b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_847b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1752_c7_847b_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1753_c3_6cdd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1758_c11_b9d1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_e6d8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1758_c7_e6d8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_e6d8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_e6d8_return_output,
 CONST_SR_8_uxn_opcodes_h_l1760_c31_438f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1762_c11_24be_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1762_c7_c487_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_c487_return_output,
 BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1750_l1747_l1742_DUPLICATE_d299_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1726_c6_e3a2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1726_c6_e3a2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1726_c6_e3a2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1726_c1_7021_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1726_c1_7021_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1726_c1_7021_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1726_c1_7021_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1726_c2_e6cc_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1726_c2_e6cc_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1731_c7_20ab_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1726_c2_e6cc_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1726_c2_e6cc_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1726_c2_e6cc_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1726_c2_e6cc_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1731_c7_20ab_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1726_c2_e6cc_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1726_c2_e6cc_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1726_c2_e6cc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1726_c2_e6cc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1731_c7_20ab_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1726_c2_e6cc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1726_c2_e6cc_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1726_c2_e6cc_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1726_c2_e6cc_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1731_c7_20ab_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1726_c2_e6cc_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1726_c2_e6cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1726_c2_e6cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1726_c2_e6cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_20ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1726_c2_e6cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1726_c2_e6cc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1726_c2_e6cc_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1726_c2_e6cc_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_20ab_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1726_c2_e6cc_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1726_c2_e6cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1726_c2_e6cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1726_c2_e6cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1731_c7_20ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1726_c2_e6cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1726_c2_e6cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1726_c2_e6cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1726_c2_e6cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c7_20ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1726_c2_e6cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1726_c2_e6cc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1726_c2_e6cc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1728_c3_1423 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1726_c2_e6cc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_20ab_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1726_c2_e6cc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1726_c2_e6cc_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1727_c3_3ab5_uxn_opcodes_h_l1727_c3_3ab5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_5901_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_5901_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_5901_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1731_c7_20ab_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1731_c7_20ab_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1734_c7_54e6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1731_c7_20ab_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1731_c7_20ab_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1731_c7_20ab_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1734_c7_54e6_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1731_c7_20ab_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1731_c7_20ab_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1731_c7_20ab_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c7_54e6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1731_c7_20ab_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1731_c7_20ab_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1731_c7_20ab_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c7_54e6_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1731_c7_20ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_20ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_20ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_54e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_20ab_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_20ab_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_20ab_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_54e6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_20ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1731_c7_20ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1731_c7_20ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1734_c7_54e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1731_c7_20ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c7_20ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c7_20ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1734_c7_54e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c7_20ab_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_20ab_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1732_c3_4f5f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_20ab_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_54e6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_20ab_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_eb46_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_eb46_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_eb46_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1734_c7_54e6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1734_c7_54e6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1740_c7_251b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1734_c7_54e6_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1734_c7_54e6_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1734_c7_54e6_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1734_c7_54e6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c7_54e6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c7_54e6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1740_c7_251b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c7_54e6_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c7_54e6_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1738_c3_2c29 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c7_54e6_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1740_c7_251b_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c7_54e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_54e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_54e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1740_c7_251b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_54e6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_54e6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_54e6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_54e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1734_c7_54e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1734_c7_54e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1740_c7_251b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1734_c7_54e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1734_c7_54e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1734_c7_54e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1740_c7_251b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1734_c7_54e6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_54e6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_54e6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c7_251b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_54e6_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1737_c30_33f2_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1737_c30_33f2_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1737_c30_33f2_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1737_c30_33f2_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1738_c22_90e3_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l1738_c27_8f29_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1738_c22_90e3_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1738_c22_90e3_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c11_d9f8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c11_d9f8_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c11_d9f8_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1740_c7_251b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1740_c7_251b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1744_c7_f475_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1740_c7_251b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1740_c7_251b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1740_c7_251b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1744_c7_f475_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1740_c7_251b_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1740_c7_251b_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1742_c3_cf5e : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1740_c7_251b_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1744_c7_f475_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1740_c7_251b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1740_c7_251b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1740_c7_251b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_f475_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1740_c7_251b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1740_c7_251b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1740_c7_251b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_f475_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1740_c7_251b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1740_c7_251b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1740_c7_251b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1740_c7_251b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c7_251b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c7_251b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_f475_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c7_251b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_e74c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_e74c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_e74c_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1744_c7_f475_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1744_c7_f475_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1749_c7_2dd4_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1744_c7_f475_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1744_c7_f475_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1744_c7_f475_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1749_c7_2dd4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1744_c7_f475_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1744_c7_f475_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1747_c3_2d6c : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1744_c7_f475_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1749_c7_2dd4_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1744_c7_f475_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_f475_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_f475_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_2dd4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_f475_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_f475_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_f475_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1749_c7_2dd4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_f475_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_f475_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_f475_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1749_c7_2dd4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_f475_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1746_c3_33e0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1746_c3_33e0_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_2e86_left : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_2e86_right : signed(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_2e86_return_output : signed(18 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1749_c11_69b8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1749_c11_69b8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1749_c11_69b8_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1749_c7_2dd4_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1749_c7_2dd4_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1752_c7_847b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1749_c7_2dd4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1749_c7_2dd4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1749_c7_2dd4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1752_c7_847b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1749_c7_2dd4_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1749_c7_2dd4_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1750_c3_44f3 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1749_c7_2dd4_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1749_c7_2dd4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_2dd4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_2dd4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_847b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_2dd4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1749_c7_2dd4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1749_c7_2dd4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_847b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1749_c7_2dd4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1749_c7_2dd4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1749_c7_2dd4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1752_c7_847b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1749_c7_2dd4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1750_c22_4405_left : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1750_c22_4405_right : signed(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1750_c22_4405_return_output : signed(18 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1752_c11_8e63_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1752_c11_8e63_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1752_c11_8e63_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1752_c7_847b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1752_c7_847b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1752_c7_847b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_847b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_847b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_e6d8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_847b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1752_c7_847b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1752_c7_847b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c7_e6d8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1752_c7_847b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_847b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_847b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_e6d8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_847b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1752_c7_847b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1755_c3_4382 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1752_c7_847b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_e6d8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1752_c7_847b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1753_c3_6cdd_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1753_c3_6cdd_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1753_c3_6cdd_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1756_c21_24f6_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_b9d1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_b9d1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_b9d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_e6d8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_e6d8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1762_c7_c487_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_e6d8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c7_e6d8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c7_e6d8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c7_e6d8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_e6d8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_e6d8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_c487_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_e6d8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_e6d8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1759_c3_ebd7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_e6d8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_e6d8_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1760_c31_438f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1760_c31_438f_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1760_c21_4662_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1762_c11_24be_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1762_c11_24be_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1762_c11_24be_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1762_c7_c487_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1762_c7_c487_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1762_c7_c487_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_c487_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_c487_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_c487_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1744_l1740_l1734_l1731_l1758_l1726_l1749_DUPLICATE_b0db_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1731_l1749_l1726_DUPLICATE_894a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1731_l1734_l1726_DUPLICATE_11ec_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1744_l1740_l1734_l1762_l1731_l1758_l1726_l1749_DUPLICATE_7ee2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1731_l1726_l1740_DUPLICATE_12b3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1744_l1740_l1734_l1762_l1731_l1758_l1752_l1749_DUPLICATE_059f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1744_l1740_l1734_l1758_l1749_DUPLICATE_d1a5_return_output : unsigned(3 downto 0);
 variable VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1742_l1747_l1750_DUPLICATE_76fb_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1750_l1747_l1742_DUPLICATE_d299_left : signed(16 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1750_l1747_l1742_DUPLICATE_d299_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1750_l1747_l1742_DUPLICATE_d299_return_output : signed(17 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1745_l1753_DUPLICATE_febe_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9969_uxn_opcodes_h_l1767_l1721_DUPLICATE_2c5a_return_output : opcode_result_t;
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
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1750_c22_4405_right := signed(std_logic_vector(resize(to_unsigned(1, 1), 2)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1762_c7_c487_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1732_c3_4f5f := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_20ab_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1732_c3_4f5f;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1726_c1_7021_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_847b_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1749_c11_69b8_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_b9d1_right := to_unsigned(7, 3);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_2e86_right := signed(std_logic_vector(resize(to_unsigned(1, 1), 2)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1740_c7_251b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1726_c6_e3a2_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_e74c_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_5901_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1755_c3_4382 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1752_c7_847b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1755_c3_4382;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1752_c11_8e63_right := to_unsigned(6, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_c487_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1762_c11_24be_right := to_unsigned(8, 4);
     VAR_sp_relative_shift_uxn_opcodes_h_l1737_c30_33f2_y := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_sp_relative_shift_uxn_opcodes_h_l1737_c30_33f2_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1759_c3_ebd7 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_e6d8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1759_c3_ebd7;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1726_c2_e6cc_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1728_c3_1423 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1726_c2_e6cc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1728_c3_1423;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_eb46_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c11_d9f8_right := to_unsigned(3, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1734_c7_54e6_iftrue := to_unsigned(1, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_pc := pc;
     VAR_previous_stack_read := previous_stack_read;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1726_c1_7021_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1737_c30_33f2_ins := VAR_ins;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1738_c22_90e3_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1750_l1747_l1742_DUPLICATE_d299_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1726_c6_e3a2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_5901_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_eb46_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c11_d9f8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_e74c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1749_c11_69b8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1752_c11_8e63_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_b9d1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1762_c11_24be_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l1734_c7_54e6_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1726_c2_e6cc_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1731_c7_20ab_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1734_c7_54e6_iffalse := t8;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1753_c3_6cdd_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1760_c31_438f_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1726_c2_e6cc_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1731_c7_20ab_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1734_c7_54e6_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1740_c7_251b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1749_c7_2dd4_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1752_c7_847b_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1731_c11_5901] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1731_c11_5901_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_5901_left;
     BIN_OP_EQ_uxn_opcodes_h_l1731_c11_5901_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_5901_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_5901_return_output := BIN_OP_EQ_uxn_opcodes_h_l1731_c11_5901_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1760_c31_438f] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1760_c31_438f_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1760_c31_438f_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1760_c31_438f_return_output := CONST_SR_8_uxn_opcodes_h_l1760_c31_438f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1726_c6_e3a2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1726_c6_e3a2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1726_c6_e3a2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1726_c6_e3a2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1726_c6_e3a2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1726_c6_e3a2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1726_c6_e3a2_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1745_l1753_DUPLICATE_febe LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1745_l1753_DUPLICATE_febe_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1744_l1740_l1734_l1762_l1731_l1758_l1752_l1749_DUPLICATE_059f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1744_l1740_l1734_l1762_l1731_l1758_l1752_l1749_DUPLICATE_059f_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1744_l1740_l1734_l1758_l1749_DUPLICATE_d1a5 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1744_l1740_l1734_l1758_l1749_DUPLICATE_d1a5_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1758_c11_b9d1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1758_c11_b9d1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_b9d1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1758_c11_b9d1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_b9d1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_b9d1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1758_c11_b9d1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1752_c11_8e63] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1752_c11_8e63_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1752_c11_8e63_left;
     BIN_OP_EQ_uxn_opcodes_h_l1752_c11_8e63_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1752_c11_8e63_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1752_c11_8e63_return_output := BIN_OP_EQ_uxn_opcodes_h_l1752_c11_8e63_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1762_c11_24be] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1762_c11_24be_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1762_c11_24be_left;
     BIN_OP_EQ_uxn_opcodes_h_l1762_c11_24be_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1762_c11_24be_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1762_c11_24be_return_output := BIN_OP_EQ_uxn_opcodes_h_l1762_c11_24be_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1744_l1740_l1734_l1731_l1758_l1726_l1749_DUPLICATE_b0db LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1744_l1740_l1734_l1731_l1758_l1726_l1749_DUPLICATE_b0db_return_output := result.u8_value;

     -- CAST_TO_int8_t[uxn_opcodes_h_l1738_c27_8f29] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l1738_c27_8f29_return_output := CAST_TO_int8_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1744_c11_e74c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1744_c11_e74c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_e74c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1744_c11_e74c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_e74c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_e74c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1744_c11_e74c_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1731_l1734_l1726_DUPLICATE_11ec LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1731_l1734_l1726_DUPLICATE_11ec_return_output := result.sp_relative_shift;

     -- CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1742_l1747_l1750_DUPLICATE_76fb LATENCY=0
     VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1742_l1747_l1750_DUPLICATE_76fb_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- BIN_OP_EQ[uxn_opcodes_h_l1740_c11_d9f8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1740_c11_d9f8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c11_d9f8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1740_c11_d9f8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c11_d9f8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c11_d9f8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1740_c11_d9f8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1749_c11_69b8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1749_c11_69b8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1749_c11_69b8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1749_c11_69b8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1749_c11_69b8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1749_c11_69b8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1749_c11_69b8_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1737_c30_33f2] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1737_c30_33f2_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1737_c30_33f2_ins;
     sp_relative_shift_uxn_opcodes_h_l1737_c30_33f2_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1737_c30_33f2_x;
     sp_relative_shift_uxn_opcodes_h_l1737_c30_33f2_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1737_c30_33f2_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1737_c30_33f2_return_output := sp_relative_shift_uxn_opcodes_h_l1737_c30_33f2_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1744_l1740_l1734_l1762_l1731_l1758_l1726_l1749_DUPLICATE_7ee2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1744_l1740_l1734_l1762_l1731_l1758_l1726_l1749_DUPLICATE_7ee2_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1731_l1726_l1740_DUPLICATE_12b3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1731_l1726_l1740_DUPLICATE_12b3_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1731_l1749_l1726_DUPLICATE_894a LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1731_l1749_l1726_DUPLICATE_894a_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1734_c11_eb46] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1734_c11_eb46_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_eb46_left;
     BIN_OP_EQ_uxn_opcodes_h_l1734_c11_eb46_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_eb46_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_eb46_return_output := BIN_OP_EQ_uxn_opcodes_h_l1734_c11_eb46_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1726_c1_7021_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1726_c6_e3a2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1726_c2_e6cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1726_c6_e3a2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1726_c2_e6cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1726_c6_e3a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1726_c2_e6cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1726_c6_e3a2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1726_c2_e6cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1726_c6_e3a2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1726_c2_e6cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1726_c6_e3a2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1726_c2_e6cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1726_c6_e3a2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1726_c2_e6cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1726_c6_e3a2_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1726_c2_e6cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1726_c6_e3a2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1726_c2_e6cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1726_c6_e3a2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_20ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_5901_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c7_20ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_5901_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1731_c7_20ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_5901_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_20ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_5901_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_20ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_5901_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1731_c7_20ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_5901_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1731_c7_20ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_5901_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1731_c7_20ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_5901_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1731_c7_20ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_5901_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_54e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_eb46_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1734_c7_54e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_eb46_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1734_c7_54e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_eb46_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_54e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_eb46_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_54e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_eb46_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c7_54e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_eb46_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c7_54e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_eb46_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1734_c7_54e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_eb46_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1734_c7_54e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_eb46_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1740_c7_251b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c11_d9f8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1740_c7_251b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c11_d9f8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1740_c7_251b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c11_d9f8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c7_251b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c11_d9f8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1740_c7_251b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c11_d9f8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1740_c7_251b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c11_d9f8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1740_c7_251b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c11_d9f8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_f475_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_e74c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_f475_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_e74c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_f475_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_e74c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1744_c7_f475_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_e74c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1744_c7_f475_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_e74c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1744_c7_f475_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_e74c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_2dd4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1749_c11_69b8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1749_c7_2dd4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1749_c11_69b8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1749_c7_2dd4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1749_c11_69b8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1749_c7_2dd4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1749_c11_69b8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1749_c7_2dd4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1749_c11_69b8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1749_c7_2dd4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1749_c11_69b8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_847b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1752_c11_8e63_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_847b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1752_c11_8e63_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1752_c7_847b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1752_c11_8e63_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1752_c7_847b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1752_c11_8e63_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1752_c7_847b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1752_c11_8e63_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_e6d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_b9d1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_e6d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_b9d1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_e6d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_b9d1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c7_e6d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_b9d1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_c487_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1762_c11_24be_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1762_c7_c487_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1762_c11_24be_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1738_c22_90e3_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l1738_c27_8f29_return_output;
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1750_l1747_l1742_DUPLICATE_d299_right := VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1742_l1747_l1750_DUPLICATE_76fb_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1753_c3_6cdd_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1745_l1753_DUPLICATE_febe_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1746_c3_33e0_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1745_l1753_DUPLICATE_febe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1726_c2_e6cc_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1731_l1734_l1726_DUPLICATE_11ec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_20ab_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1731_l1734_l1726_DUPLICATE_11ec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_54e6_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1731_l1734_l1726_DUPLICATE_11ec_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1726_c2_e6cc_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1731_l1749_l1726_DUPLICATE_894a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1731_c7_20ab_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1731_l1749_l1726_DUPLICATE_894a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1749_c7_2dd4_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1731_l1749_l1726_DUPLICATE_894a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_20ab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1744_l1740_l1734_l1762_l1731_l1758_l1752_l1749_DUPLICATE_059f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_54e6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1744_l1740_l1734_l1762_l1731_l1758_l1752_l1749_DUPLICATE_059f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1740_c7_251b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1744_l1740_l1734_l1762_l1731_l1758_l1752_l1749_DUPLICATE_059f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_f475_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1744_l1740_l1734_l1762_l1731_l1758_l1752_l1749_DUPLICATE_059f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_2dd4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1744_l1740_l1734_l1762_l1731_l1758_l1752_l1749_DUPLICATE_059f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_847b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1744_l1740_l1734_l1762_l1731_l1758_l1752_l1749_DUPLICATE_059f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_e6d8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1744_l1740_l1734_l1762_l1731_l1758_l1752_l1749_DUPLICATE_059f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_c487_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1744_l1740_l1734_l1762_l1731_l1758_l1752_l1749_DUPLICATE_059f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1726_c2_e6cc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1731_l1726_l1740_DUPLICATE_12b3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c7_20ab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1731_l1726_l1740_DUPLICATE_12b3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1740_c7_251b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1731_l1726_l1740_DUPLICATE_12b3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1726_c2_e6cc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1744_l1740_l1734_l1762_l1731_l1758_l1726_l1749_DUPLICATE_7ee2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1731_c7_20ab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1744_l1740_l1734_l1762_l1731_l1758_l1726_l1749_DUPLICATE_7ee2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1734_c7_54e6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1744_l1740_l1734_l1762_l1731_l1758_l1726_l1749_DUPLICATE_7ee2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1740_c7_251b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1744_l1740_l1734_l1762_l1731_l1758_l1726_l1749_DUPLICATE_7ee2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_f475_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1744_l1740_l1734_l1762_l1731_l1758_l1726_l1749_DUPLICATE_7ee2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1749_c7_2dd4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1744_l1740_l1734_l1762_l1731_l1758_l1726_l1749_DUPLICATE_7ee2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_e6d8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1744_l1740_l1734_l1762_l1731_l1758_l1726_l1749_DUPLICATE_7ee2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1762_c7_c487_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1744_l1740_l1734_l1762_l1731_l1758_l1726_l1749_DUPLICATE_7ee2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_54e6_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1744_l1740_l1734_l1758_l1749_DUPLICATE_d1a5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c7_251b_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1744_l1740_l1734_l1758_l1749_DUPLICATE_d1a5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_f475_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1744_l1740_l1734_l1758_l1749_DUPLICATE_d1a5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1749_c7_2dd4_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1744_l1740_l1734_l1758_l1749_DUPLICATE_d1a5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_e6d8_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1744_l1740_l1734_l1758_l1749_DUPLICATE_d1a5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1726_c2_e6cc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1744_l1740_l1734_l1731_l1758_l1726_l1749_DUPLICATE_b0db_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1731_c7_20ab_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1744_l1740_l1734_l1731_l1758_l1726_l1749_DUPLICATE_b0db_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c7_54e6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1744_l1740_l1734_l1731_l1758_l1726_l1749_DUPLICATE_b0db_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1740_c7_251b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1744_l1740_l1734_l1731_l1758_l1726_l1749_DUPLICATE_b0db_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1744_c7_f475_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1744_l1740_l1734_l1731_l1758_l1726_l1749_DUPLICATE_b0db_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1749_c7_2dd4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1744_l1740_l1734_l1731_l1758_l1726_l1749_DUPLICATE_b0db_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c7_e6d8_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1744_l1740_l1734_l1731_l1758_l1726_l1749_DUPLICATE_b0db_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_54e6_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1737_c30_33f2_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1740_c7_251b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1740_c7_251b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1740_c7_251b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1740_c7_251b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1740_c7_251b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1740_c7_251b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1740_c7_251b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1740_c7_251b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1740_c7_251b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1726_c1_7021] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1726_c1_7021_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1726_c1_7021_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1726_c1_7021_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1726_c1_7021_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1726_c1_7021_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1726_c1_7021_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1726_c1_7021_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1726_c1_7021_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1738_c22_90e3] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1738_c22_90e3_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1738_c22_90e3_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1738_c22_90e3_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1738_c22_90e3_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1738_c22_90e3_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1738_c22_90e3_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1760_c21_4662] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1760_c21_4662_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1760_c31_438f_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1762_c7_c487] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1762_c7_c487_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1762_c7_c487_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1762_c7_c487_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1762_c7_c487_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1762_c7_c487_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1762_c7_c487_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1762_c7_c487_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1762_c7_c487_return_output;

     -- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1750_l1747_l1742_DUPLICATE_d299 LATENCY=0
     -- Inputs
     BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1750_l1747_l1742_DUPLICATE_d299_left <= VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1750_l1747_l1742_DUPLICATE_d299_left;
     BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1750_l1747_l1742_DUPLICATE_d299_right <= VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1750_l1747_l1742_DUPLICATE_d299_right;
     -- Outputs
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1750_l1747_l1742_DUPLICATE_d299_return_output := BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1750_l1747_l1742_DUPLICATE_d299_return_output;

     -- t8_MUX[uxn_opcodes_h_l1734_c7_54e6] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1734_c7_54e6_cond <= VAR_t8_MUX_uxn_opcodes_h_l1734_c7_54e6_cond;
     t8_MUX_uxn_opcodes_h_l1734_c7_54e6_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1734_c7_54e6_iftrue;
     t8_MUX_uxn_opcodes_h_l1734_c7_54e6_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1734_c7_54e6_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1734_c7_54e6_return_output := t8_MUX_uxn_opcodes_h_l1734_c7_54e6_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1746_c3_33e0] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1746_c3_33e0_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1746_c3_33e0_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1746_c3_33e0_return_output := CONST_SL_8_uxn_opcodes_h_l1746_c3_33e0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1758_c7_e6d8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_e6d8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_e6d8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_e6d8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_e6d8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_e6d8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_e6d8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_e6d8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_e6d8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1734_c7_54e6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_54e6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_54e6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_54e6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_54e6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_54e6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_54e6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_54e6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_54e6_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1753_c3_6cdd] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1753_c3_6cdd_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1753_c3_6cdd_left;
     BIN_OP_OR_uxn_opcodes_h_l1753_c3_6cdd_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1753_c3_6cdd_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1753_c3_6cdd_return_output := BIN_OP_OR_uxn_opcodes_h_l1753_c3_6cdd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1762_c7_c487] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_c487_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_c487_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_c487_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_c487_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_c487_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_c487_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_c487_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_c487_return_output;

     -- Submodule level 2
     VAR_tmp16_MUX_uxn_opcodes_h_l1752_c7_847b_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1753_c3_6cdd_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l1738_c3_2c29 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1738_c22_90e3_return_output)),16);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_2e86_left := VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1750_l1747_l1742_DUPLICATE_d299_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1750_c22_4405_left := VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1750_l1747_l1742_DUPLICATE_d299_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l1742_c3_cf5e := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1750_l1747_l1742_DUPLICATE_d299_return_output)),16);
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c7_e6d8_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1760_c21_4662_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1744_c7_f475_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1746_c3_33e0_return_output;
     VAR_printf_uxn_opcodes_h_l1727_c3_3ab5_uxn_opcodes_h_l1727_c3_3ab5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1726_c1_7021_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_e6d8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_c487_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1734_c7_54e6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1740_c7_251b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_e6d8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1762_c7_c487_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_20ab_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_54e6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1752_c7_847b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_e6d8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1731_c7_20ab_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1734_c7_54e6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c7_54e6_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1738_c3_2c29;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1740_c7_251b_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1742_c3_cf5e;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1758_c7_e6d8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_e6d8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_e6d8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_e6d8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_e6d8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_e6d8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_e6d8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_e6d8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_e6d8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1758_c7_e6d8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_e6d8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_e6d8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_e6d8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_e6d8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_e6d8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_e6d8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_e6d8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_e6d8_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1750_c22_4405] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1750_c22_4405_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1750_c22_4405_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1750_c22_4405_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1750_c22_4405_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1750_c22_4405_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1750_c22_4405_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1758_c7_e6d8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1758_c7_e6d8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c7_e6d8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1758_c7_e6d8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c7_e6d8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1758_c7_e6d8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c7_e6d8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c7_e6d8_return_output := result_u8_value_MUX_uxn_opcodes_h_l1758_c7_e6d8_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1756_c21_24f6] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1756_c21_24f6_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l1753_c3_6cdd_return_output);

     -- BIN_OP_PLUS[uxn_opcodes_h_l1747_c22_2e86] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_2e86_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_2e86_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_2e86_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_2e86_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_2e86_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_2e86_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1752_c7_847b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1752_c7_847b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1752_c7_847b_cond;
     tmp16_MUX_uxn_opcodes_h_l1752_c7_847b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1752_c7_847b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1752_c7_847b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1752_c7_847b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1752_c7_847b_return_output := tmp16_MUX_uxn_opcodes_h_l1752_c7_847b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1752_c7_847b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1752_c7_847b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1752_c7_847b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1752_c7_847b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1752_c7_847b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1752_c7_847b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1752_c7_847b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1752_c7_847b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1752_c7_847b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1734_c7_54e6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1734_c7_54e6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1734_c7_54e6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1734_c7_54e6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1734_c7_54e6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1734_c7_54e6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1734_c7_54e6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1734_c7_54e6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1734_c7_54e6_return_output;

     -- printf_uxn_opcodes_h_l1727_c3_3ab5[uxn_opcodes_h_l1727_c3_3ab5] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1727_c3_3ab5_uxn_opcodes_h_l1727_c3_3ab5_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1727_c3_3ab5_uxn_opcodes_h_l1727_c3_3ab5_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- t8_MUX[uxn_opcodes_h_l1731_c7_20ab] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1731_c7_20ab_cond <= VAR_t8_MUX_uxn_opcodes_h_l1731_c7_20ab_cond;
     t8_MUX_uxn_opcodes_h_l1731_c7_20ab_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1731_c7_20ab_iftrue;
     t8_MUX_uxn_opcodes_h_l1731_c7_20ab_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1731_c7_20ab_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1731_c7_20ab_return_output := t8_MUX_uxn_opcodes_h_l1731_c7_20ab_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1731_c7_20ab] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_20ab_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_20ab_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_20ab_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_20ab_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_20ab_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_20ab_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_20ab_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_20ab_return_output;

     -- Submodule level 3
     VAR_result_u16_value_uxn_opcodes_h_l1747_c3_2d6c := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_2e86_return_output)),16);
     VAR_result_u16_value_uxn_opcodes_h_l1750_c3_44f3 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1750_c22_4405_return_output)),16);
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1752_c7_847b_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1756_c21_24f6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_847b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_e6d8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c7_20ab_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1734_c7_54e6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_847b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_e6d8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1726_c2_e6cc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_20ab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1749_c7_2dd4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1752_c7_847b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1752_c7_847b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c7_e6d8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1726_c2_e6cc_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1731_c7_20ab_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1749_c7_2dd4_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1752_c7_847b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1744_c7_f475_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1747_c3_2d6c;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1749_c7_2dd4_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1750_c3_44f3;
     -- t8_MUX[uxn_opcodes_h_l1726_c2_e6cc] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1726_c2_e6cc_cond <= VAR_t8_MUX_uxn_opcodes_h_l1726_c2_e6cc_cond;
     t8_MUX_uxn_opcodes_h_l1726_c2_e6cc_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1726_c2_e6cc_iftrue;
     t8_MUX_uxn_opcodes_h_l1726_c2_e6cc_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1726_c2_e6cc_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1726_c2_e6cc_return_output := t8_MUX_uxn_opcodes_h_l1726_c2_e6cc_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1749_c7_2dd4] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1749_c7_2dd4_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1749_c7_2dd4_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1749_c7_2dd4_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1749_c7_2dd4_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1749_c7_2dd4_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1749_c7_2dd4_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1749_c7_2dd4_return_output := result_u16_value_MUX_uxn_opcodes_h_l1749_c7_2dd4_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1749_c7_2dd4] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1749_c7_2dd4_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1749_c7_2dd4_cond;
     tmp16_MUX_uxn_opcodes_h_l1749_c7_2dd4_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1749_c7_2dd4_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1749_c7_2dd4_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1749_c7_2dd4_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1749_c7_2dd4_return_output := tmp16_MUX_uxn_opcodes_h_l1749_c7_2dd4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1731_c7_20ab] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c7_20ab_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c7_20ab_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c7_20ab_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c7_20ab_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c7_20ab_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c7_20ab_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c7_20ab_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c7_20ab_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1752_c7_847b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_847b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_847b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_847b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_847b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_847b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_847b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_847b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_847b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1726_c2_e6cc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1726_c2_e6cc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1726_c2_e6cc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1726_c2_e6cc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1726_c2_e6cc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1726_c2_e6cc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1726_c2_e6cc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1726_c2_e6cc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1726_c2_e6cc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1749_c7_2dd4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1749_c7_2dd4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1749_c7_2dd4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1749_c7_2dd4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1749_c7_2dd4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1749_c7_2dd4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1749_c7_2dd4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1749_c7_2dd4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1749_c7_2dd4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1752_c7_847b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_847b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_847b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_847b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_847b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_847b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_847b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_847b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_847b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1752_c7_847b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1752_c7_847b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1752_c7_847b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1752_c7_847b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1752_c7_847b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1752_c7_847b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1752_c7_847b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1752_c7_847b_return_output := result_u8_value_MUX_uxn_opcodes_h_l1752_c7_847b_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_2dd4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_847b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1726_c2_e6cc_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c7_20ab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1749_c7_2dd4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_847b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_f475_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1749_c7_2dd4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1744_c7_f475_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1749_c7_2dd4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1749_c7_2dd4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1752_c7_847b_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1726_c2_e6cc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1744_c7_f475_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1749_c7_2dd4_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1726_c2_e6cc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1726_c2_e6cc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1726_c2_e6cc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1726_c2_e6cc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1726_c2_e6cc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1726_c2_e6cc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1726_c2_e6cc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1726_c2_e6cc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1726_c2_e6cc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1749_c7_2dd4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_2dd4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_2dd4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_2dd4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_2dd4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_2dd4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_2dd4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_2dd4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_2dd4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1749_c7_2dd4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1749_c7_2dd4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1749_c7_2dd4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1749_c7_2dd4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1749_c7_2dd4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1749_c7_2dd4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1749_c7_2dd4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1749_c7_2dd4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1749_c7_2dd4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1744_c7_f475] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_f475_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_f475_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_f475_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_f475_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_f475_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_f475_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_f475_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_f475_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1749_c7_2dd4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1749_c7_2dd4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1749_c7_2dd4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1749_c7_2dd4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1749_c7_2dd4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1749_c7_2dd4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1749_c7_2dd4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1749_c7_2dd4_return_output := result_u8_value_MUX_uxn_opcodes_h_l1749_c7_2dd4_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1744_c7_f475] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1744_c7_f475_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1744_c7_f475_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1744_c7_f475_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1744_c7_f475_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1744_c7_f475_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1744_c7_f475_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1744_c7_f475_return_output := result_u16_value_MUX_uxn_opcodes_h_l1744_c7_f475_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1744_c7_f475] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1744_c7_f475_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1744_c7_f475_cond;
     tmp16_MUX_uxn_opcodes_h_l1744_c7_f475_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1744_c7_f475_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1744_c7_f475_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1744_c7_f475_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1744_c7_f475_return_output := tmp16_MUX_uxn_opcodes_h_l1744_c7_f475_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_f475_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_2dd4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_f475_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1749_c7_2dd4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c7_251b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_f475_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1740_c7_251b_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1744_c7_f475_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1744_c7_f475_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1749_c7_2dd4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1740_c7_251b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1744_c7_f475_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1744_c7_f475] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_f475_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_f475_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_f475_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_f475_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_f475_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_f475_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_f475_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_f475_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1744_c7_f475] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1744_c7_f475_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1744_c7_f475_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1744_c7_f475_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1744_c7_f475_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1744_c7_f475_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1744_c7_f475_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1744_c7_f475_return_output := result_u8_value_MUX_uxn_opcodes_h_l1744_c7_f475_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1740_c7_251b] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1740_c7_251b_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1740_c7_251b_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1740_c7_251b_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1740_c7_251b_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1740_c7_251b_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1740_c7_251b_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1740_c7_251b_return_output := result_u16_value_MUX_uxn_opcodes_h_l1740_c7_251b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1740_c7_251b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1740_c7_251b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1740_c7_251b_cond;
     tmp16_MUX_uxn_opcodes_h_l1740_c7_251b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1740_c7_251b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1740_c7_251b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1740_c7_251b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1740_c7_251b_return_output := tmp16_MUX_uxn_opcodes_h_l1740_c7_251b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1744_c7_f475] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_f475_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_f475_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_f475_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_f475_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_f475_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_f475_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_f475_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_f475_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1740_c7_251b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c7_251b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c7_251b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c7_251b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c7_251b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c7_251b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c7_251b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c7_251b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c7_251b_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1740_c7_251b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_f475_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1740_c7_251b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_f475_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_54e6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c7_251b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c7_54e6_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1740_c7_251b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1740_c7_251b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1744_c7_f475_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1734_c7_54e6_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1740_c7_251b_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1740_c7_251b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1740_c7_251b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1740_c7_251b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1740_c7_251b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1740_c7_251b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1740_c7_251b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1740_c7_251b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1740_c7_251b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1740_c7_251b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1734_c7_54e6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1734_c7_54e6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1734_c7_54e6_cond;
     tmp16_MUX_uxn_opcodes_h_l1734_c7_54e6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1734_c7_54e6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1734_c7_54e6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1734_c7_54e6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1734_c7_54e6_return_output := tmp16_MUX_uxn_opcodes_h_l1734_c7_54e6_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1734_c7_54e6] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1734_c7_54e6_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c7_54e6_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1734_c7_54e6_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c7_54e6_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1734_c7_54e6_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c7_54e6_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c7_54e6_return_output := result_u16_value_MUX_uxn_opcodes_h_l1734_c7_54e6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1740_c7_251b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1740_c7_251b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1740_c7_251b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1740_c7_251b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1740_c7_251b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1740_c7_251b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1740_c7_251b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1740_c7_251b_return_output := result_u8_value_MUX_uxn_opcodes_h_l1740_c7_251b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1740_c7_251b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1740_c7_251b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1740_c7_251b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1740_c7_251b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1740_c7_251b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1740_c7_251b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1740_c7_251b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1740_c7_251b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1740_c7_251b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1734_c7_54e6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_54e6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_54e6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_54e6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_54e6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_54e6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_54e6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_54e6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_54e6_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_54e6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1740_c7_251b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1734_c7_54e6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1740_c7_251b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_20ab_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_54e6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1731_c7_20ab_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c7_54e6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c7_54e6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1740_c7_251b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1731_c7_20ab_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1734_c7_54e6_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1734_c7_54e6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1734_c7_54e6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1734_c7_54e6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1734_c7_54e6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1734_c7_54e6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1734_c7_54e6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1734_c7_54e6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1734_c7_54e6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1734_c7_54e6_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1731_c7_20ab] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1731_c7_20ab_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1731_c7_20ab_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1731_c7_20ab_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1731_c7_20ab_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1731_c7_20ab_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1731_c7_20ab_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1731_c7_20ab_return_output := result_u16_value_MUX_uxn_opcodes_h_l1731_c7_20ab_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1731_c7_20ab] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_20ab_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_20ab_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_20ab_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_20ab_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_20ab_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_20ab_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_20ab_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_20ab_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1731_c7_20ab] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1731_c7_20ab_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1731_c7_20ab_cond;
     tmp16_MUX_uxn_opcodes_h_l1731_c7_20ab_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1731_c7_20ab_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1731_c7_20ab_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1731_c7_20ab_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1731_c7_20ab_return_output := tmp16_MUX_uxn_opcodes_h_l1731_c7_20ab_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1734_c7_54e6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1734_c7_54e6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c7_54e6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1734_c7_54e6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c7_54e6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1734_c7_54e6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c7_54e6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c7_54e6_return_output := result_u8_value_MUX_uxn_opcodes_h_l1734_c7_54e6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1734_c7_54e6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_54e6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_54e6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_54e6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_54e6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_54e6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_54e6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_54e6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_54e6_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_20ab_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_54e6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1731_c7_20ab_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1734_c7_54e6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1726_c2_e6cc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_20ab_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1726_c2_e6cc_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1731_c7_20ab_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1731_c7_20ab_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c7_54e6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1726_c2_e6cc_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1731_c7_20ab_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1726_c2_e6cc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1726_c2_e6cc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1726_c2_e6cc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1726_c2_e6cc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1726_c2_e6cc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1726_c2_e6cc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1726_c2_e6cc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1726_c2_e6cc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1726_c2_e6cc_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1726_c2_e6cc] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1726_c2_e6cc_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1726_c2_e6cc_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1726_c2_e6cc_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1726_c2_e6cc_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1726_c2_e6cc_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1726_c2_e6cc_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1726_c2_e6cc_return_output := result_u16_value_MUX_uxn_opcodes_h_l1726_c2_e6cc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1731_c7_20ab] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_20ab_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_20ab_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_20ab_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_20ab_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_20ab_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_20ab_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_20ab_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_20ab_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1726_c2_e6cc] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1726_c2_e6cc_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1726_c2_e6cc_cond;
     tmp16_MUX_uxn_opcodes_h_l1726_c2_e6cc_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1726_c2_e6cc_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1726_c2_e6cc_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1726_c2_e6cc_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1726_c2_e6cc_return_output := tmp16_MUX_uxn_opcodes_h_l1726_c2_e6cc_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1731_c7_20ab] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1731_c7_20ab_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1731_c7_20ab_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1731_c7_20ab_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1731_c7_20ab_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1731_c7_20ab_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1731_c7_20ab_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1731_c7_20ab_return_output := result_u8_value_MUX_uxn_opcodes_h_l1731_c7_20ab_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1731_c7_20ab] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1731_c7_20ab_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1731_c7_20ab_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1731_c7_20ab_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1731_c7_20ab_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1731_c7_20ab_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1731_c7_20ab_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1731_c7_20ab_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1731_c7_20ab_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1726_c2_e6cc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_20ab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1726_c2_e6cc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1731_c7_20ab_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1726_c2_e6cc_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1731_c7_20ab_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1726_c2_e6cc_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1726_c2_e6cc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1726_c2_e6cc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1726_c2_e6cc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1726_c2_e6cc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1726_c2_e6cc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1726_c2_e6cc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1726_c2_e6cc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1726_c2_e6cc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1726_c2_e6cc_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1726_c2_e6cc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1726_c2_e6cc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1726_c2_e6cc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1726_c2_e6cc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1726_c2_e6cc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1726_c2_e6cc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1726_c2_e6cc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1726_c2_e6cc_return_output := result_u8_value_MUX_uxn_opcodes_h_l1726_c2_e6cc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1726_c2_e6cc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1726_c2_e6cc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1726_c2_e6cc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1726_c2_e6cc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1726_c2_e6cc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1726_c2_e6cc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1726_c2_e6cc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1726_c2_e6cc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1726_c2_e6cc_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_9969_uxn_opcodes_h_l1767_l1721_DUPLICATE_2c5a LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9969_uxn_opcodes_h_l1767_l1721_DUPLICATE_2c5a_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_9969(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1726_c2_e6cc_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1726_c2_e6cc_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1726_c2_e6cc_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1726_c2_e6cc_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1726_c2_e6cc_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1726_c2_e6cc_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1726_c2_e6cc_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9969_uxn_opcodes_h_l1767_l1721_DUPLICATE_2c5a_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9969_uxn_opcodes_h_l1767_l1721_DUPLICATE_2c5a_return_output;
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
