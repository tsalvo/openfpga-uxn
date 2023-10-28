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
entity ldz2_0CLK_1417ec42 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ldz2_0CLK_1417ec42;
architecture arch of ldz2_0CLK_1417ec42 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1560_c6_3e34]
signal BIN_OP_EQ_uxn_opcodes_h_l1560_c6_3e34_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1560_c6_3e34_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1560_c6_3e34_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1560_c1_a10b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_a10b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_a10b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_a10b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_a10b_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1560_c2_8eb6]
signal tmp16_MUX_uxn_opcodes_h_l1560_c2_8eb6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1560_c2_8eb6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1560_c2_8eb6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1560_c2_8eb6_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1560_c2_8eb6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_8eb6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_8eb6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_8eb6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_8eb6_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1560_c2_8eb6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_8eb6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_8eb6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_8eb6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_8eb6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1560_c2_8eb6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_8eb6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_8eb6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_8eb6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_8eb6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1560_c2_8eb6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_8eb6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_8eb6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_8eb6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_8eb6_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1560_c2_8eb6]
signal result_u16_value_MUX_uxn_opcodes_h_l1560_c2_8eb6_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1560_c2_8eb6_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1560_c2_8eb6_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1560_c2_8eb6_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1560_c2_8eb6]
signal result_u8_value_MUX_uxn_opcodes_h_l1560_c2_8eb6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1560_c2_8eb6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1560_c2_8eb6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1560_c2_8eb6_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1560_c2_8eb6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_8eb6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_8eb6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_8eb6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_8eb6_return_output : signed(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l1560_c2_8eb6]
signal t8_MUX_uxn_opcodes_h_l1560_c2_8eb6_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1560_c2_8eb6_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1560_c2_8eb6_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1560_c2_8eb6_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l1561_c3_47dc[uxn_opcodes_h_l1561_c3_47dc]
signal printf_uxn_opcodes_h_l1561_c3_47dc_uxn_opcodes_h_l1561_c3_47dc_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1565_c11_deed]
signal BIN_OP_EQ_uxn_opcodes_h_l1565_c11_deed_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1565_c11_deed_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1565_c11_deed_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1565_c7_216a]
signal tmp16_MUX_uxn_opcodes_h_l1565_c7_216a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1565_c7_216a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1565_c7_216a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1565_c7_216a_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1565_c7_216a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_216a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_216a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_216a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_216a_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1565_c7_216a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_216a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_216a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_216a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_216a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1565_c7_216a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_216a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_216a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_216a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_216a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1565_c7_216a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_216a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_216a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_216a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_216a_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1565_c7_216a]
signal result_u16_value_MUX_uxn_opcodes_h_l1565_c7_216a_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1565_c7_216a_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1565_c7_216a_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1565_c7_216a_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1565_c7_216a]
signal result_u8_value_MUX_uxn_opcodes_h_l1565_c7_216a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1565_c7_216a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1565_c7_216a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1565_c7_216a_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1565_c7_216a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_216a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_216a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_216a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_216a_return_output : signed(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l1565_c7_216a]
signal t8_MUX_uxn_opcodes_h_l1565_c7_216a_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1565_c7_216a_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1565_c7_216a_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1565_c7_216a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1568_c11_47f9]
signal BIN_OP_EQ_uxn_opcodes_h_l1568_c11_47f9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1568_c11_47f9_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1568_c11_47f9_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1568_c7_48cc]
signal tmp16_MUX_uxn_opcodes_h_l1568_c7_48cc_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1568_c7_48cc_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1568_c7_48cc_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1568_c7_48cc_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1568_c7_48cc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_48cc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_48cc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_48cc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_48cc_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1568_c7_48cc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_48cc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_48cc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_48cc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_48cc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1568_c7_48cc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_48cc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_48cc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_48cc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_48cc_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1568_c7_48cc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_48cc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_48cc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_48cc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_48cc_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1568_c7_48cc]
signal result_u16_value_MUX_uxn_opcodes_h_l1568_c7_48cc_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1568_c7_48cc_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1568_c7_48cc_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1568_c7_48cc_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1568_c7_48cc]
signal result_u8_value_MUX_uxn_opcodes_h_l1568_c7_48cc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1568_c7_48cc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1568_c7_48cc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1568_c7_48cc_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1568_c7_48cc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_48cc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_48cc_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_48cc_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_48cc_return_output : signed(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l1568_c7_48cc]
signal t8_MUX_uxn_opcodes_h_l1568_c7_48cc_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1568_c7_48cc_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1568_c7_48cc_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1568_c7_48cc_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1571_c30_0309]
signal sp_relative_shift_uxn_opcodes_h_l1571_c30_0309_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1571_c30_0309_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1571_c30_0309_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1571_c30_0309_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1574_c11_e899]
signal BIN_OP_EQ_uxn_opcodes_h_l1574_c11_e899_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1574_c11_e899_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1574_c11_e899_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1574_c7_ab91]
signal tmp16_MUX_uxn_opcodes_h_l1574_c7_ab91_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1574_c7_ab91_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1574_c7_ab91_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1574_c7_ab91_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1574_c7_ab91]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_ab91_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_ab91_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_ab91_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_ab91_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1574_c7_ab91]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_ab91_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_ab91_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_ab91_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_ab91_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1574_c7_ab91]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_ab91_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_ab91_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_ab91_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_ab91_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1574_c7_ab91]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_ab91_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_ab91_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_ab91_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_ab91_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1574_c7_ab91]
signal result_u16_value_MUX_uxn_opcodes_h_l1574_c7_ab91_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1574_c7_ab91_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1574_c7_ab91_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1574_c7_ab91_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1574_c7_ab91]
signal result_u8_value_MUX_uxn_opcodes_h_l1574_c7_ab91_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1574_c7_ab91_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1574_c7_ab91_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1574_c7_ab91_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1578_c11_067a]
signal BIN_OP_EQ_uxn_opcodes_h_l1578_c11_067a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1578_c11_067a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1578_c11_067a_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1578_c7_ffc4]
signal tmp16_MUX_uxn_opcodes_h_l1578_c7_ffc4_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1578_c7_ffc4_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1578_c7_ffc4_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1578_c7_ffc4_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1578_c7_ffc4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_ffc4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_ffc4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_ffc4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_ffc4_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1578_c7_ffc4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_ffc4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_ffc4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_ffc4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_ffc4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1578_c7_ffc4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_ffc4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_ffc4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_ffc4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_ffc4_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1578_c7_ffc4]
signal result_u16_value_MUX_uxn_opcodes_h_l1578_c7_ffc4_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1578_c7_ffc4_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1578_c7_ffc4_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1578_c7_ffc4_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1578_c7_ffc4]
signal result_u8_value_MUX_uxn_opcodes_h_l1578_c7_ffc4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1578_c7_ffc4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1578_c7_ffc4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1578_c7_ffc4_return_output : unsigned(7 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1580_c3_36e0]
signal CONST_SL_8_uxn_opcodes_h_l1580_c3_36e0_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1580_c3_36e0_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1581_c33_a0ed]
signal BIN_OP_PLUS_uxn_opcodes_h_l1581_c33_a0ed_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1581_c33_a0ed_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1581_c33_a0ed_return_output : unsigned(8 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1583_c11_fc10]
signal BIN_OP_EQ_uxn_opcodes_h_l1583_c11_fc10_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1583_c11_fc10_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1583_c11_fc10_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1583_c7_b22a]
signal tmp16_MUX_uxn_opcodes_h_l1583_c7_b22a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1583_c7_b22a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1583_c7_b22a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1583_c7_b22a_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1583_c7_b22a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1583_c7_b22a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1583_c7_b22a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1583_c7_b22a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1583_c7_b22a_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1583_c7_b22a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1583_c7_b22a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1583_c7_b22a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1583_c7_b22a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1583_c7_b22a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1583_c7_b22a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1583_c7_b22a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1583_c7_b22a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1583_c7_b22a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1583_c7_b22a_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1583_c7_b22a]
signal result_u16_value_MUX_uxn_opcodes_h_l1583_c7_b22a_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1583_c7_b22a_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1583_c7_b22a_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1583_c7_b22a_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1583_c7_b22a]
signal result_u8_value_MUX_uxn_opcodes_h_l1583_c7_b22a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1583_c7_b22a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1583_c7_b22a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1583_c7_b22a_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1584_c33_f4e5]
signal BIN_OP_PLUS_uxn_opcodes_h_l1584_c33_f4e5_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1584_c33_f4e5_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1584_c33_f4e5_return_output : unsigned(8 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1586_c11_fb1c]
signal BIN_OP_EQ_uxn_opcodes_h_l1586_c11_fb1c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1586_c11_fb1c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1586_c11_fb1c_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1586_c7_01ad]
signal tmp16_MUX_uxn_opcodes_h_l1586_c7_01ad_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1586_c7_01ad_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1586_c7_01ad_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1586_c7_01ad_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1586_c7_01ad]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_01ad_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_01ad_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_01ad_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_01ad_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1586_c7_01ad]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_01ad_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_01ad_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_01ad_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_01ad_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1586_c7_01ad]
signal result_u8_value_MUX_uxn_opcodes_h_l1586_c7_01ad_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1586_c7_01ad_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1586_c7_01ad_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1586_c7_01ad_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1586_c7_01ad]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_01ad_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_01ad_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_01ad_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_01ad_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1587_c3_0e6f]
signal BIN_OP_OR_uxn_opcodes_h_l1587_c3_0e6f_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1587_c3_0e6f_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1587_c3_0e6f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1592_c11_e955]
signal BIN_OP_EQ_uxn_opcodes_h_l1592_c11_e955_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1592_c11_e955_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1592_c11_e955_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1592_c7_774c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_774c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_774c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_774c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_774c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1592_c7_774c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1592_c7_774c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1592_c7_774c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1592_c7_774c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1592_c7_774c_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1592_c7_774c]
signal result_u8_value_MUX_uxn_opcodes_h_l1592_c7_774c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1592_c7_774c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1592_c7_774c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1592_c7_774c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1592_c7_774c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_774c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_774c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_774c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_774c_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1594_c31_c9d7]
signal CONST_SR_8_uxn_opcodes_h_l1594_c31_c9d7_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1594_c31_c9d7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1596_c11_5d3b]
signal BIN_OP_EQ_uxn_opcodes_h_l1596_c11_5d3b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1596_c11_5d3b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1596_c11_5d3b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1596_c7_8ca4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1596_c7_8ca4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1596_c7_8ca4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1596_c7_8ca4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1596_c7_8ca4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1596_c7_8ca4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1596_c7_8ca4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1596_c7_8ca4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1596_c7_8ca4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1596_c7_8ca4_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_284d( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.u16_value := ref_toks_5;
      base.u8_value := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1560_c6_3e34
BIN_OP_EQ_uxn_opcodes_h_l1560_c6_3e34 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1560_c6_3e34_left,
BIN_OP_EQ_uxn_opcodes_h_l1560_c6_3e34_right,
BIN_OP_EQ_uxn_opcodes_h_l1560_c6_3e34_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_a10b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_a10b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_a10b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_a10b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_a10b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_a10b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1560_c2_8eb6
tmp16_MUX_uxn_opcodes_h_l1560_c2_8eb6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1560_c2_8eb6_cond,
tmp16_MUX_uxn_opcodes_h_l1560_c2_8eb6_iftrue,
tmp16_MUX_uxn_opcodes_h_l1560_c2_8eb6_iffalse,
tmp16_MUX_uxn_opcodes_h_l1560_c2_8eb6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_8eb6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_8eb6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_8eb6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_8eb6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_8eb6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_8eb6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_8eb6
result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_8eb6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_8eb6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_8eb6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_8eb6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_8eb6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_8eb6
result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_8eb6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_8eb6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_8eb6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_8eb6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_8eb6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_8eb6
result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_8eb6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_8eb6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_8eb6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_8eb6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_8eb6_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1560_c2_8eb6
result_u16_value_MUX_uxn_opcodes_h_l1560_c2_8eb6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1560_c2_8eb6_cond,
result_u16_value_MUX_uxn_opcodes_h_l1560_c2_8eb6_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1560_c2_8eb6_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1560_c2_8eb6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1560_c2_8eb6
result_u8_value_MUX_uxn_opcodes_h_l1560_c2_8eb6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1560_c2_8eb6_cond,
result_u8_value_MUX_uxn_opcodes_h_l1560_c2_8eb6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1560_c2_8eb6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1560_c2_8eb6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_8eb6
result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_8eb6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_8eb6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_8eb6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_8eb6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_8eb6_return_output);

-- t8_MUX_uxn_opcodes_h_l1560_c2_8eb6
t8_MUX_uxn_opcodes_h_l1560_c2_8eb6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1560_c2_8eb6_cond,
t8_MUX_uxn_opcodes_h_l1560_c2_8eb6_iftrue,
t8_MUX_uxn_opcodes_h_l1560_c2_8eb6_iffalse,
t8_MUX_uxn_opcodes_h_l1560_c2_8eb6_return_output);

-- printf_uxn_opcodes_h_l1561_c3_47dc_uxn_opcodes_h_l1561_c3_47dc
printf_uxn_opcodes_h_l1561_c3_47dc_uxn_opcodes_h_l1561_c3_47dc : entity work.printf_uxn_opcodes_h_l1561_c3_47dc_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1561_c3_47dc_uxn_opcodes_h_l1561_c3_47dc_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1565_c11_deed
BIN_OP_EQ_uxn_opcodes_h_l1565_c11_deed : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1565_c11_deed_left,
BIN_OP_EQ_uxn_opcodes_h_l1565_c11_deed_right,
BIN_OP_EQ_uxn_opcodes_h_l1565_c11_deed_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1565_c7_216a
tmp16_MUX_uxn_opcodes_h_l1565_c7_216a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1565_c7_216a_cond,
tmp16_MUX_uxn_opcodes_h_l1565_c7_216a_iftrue,
tmp16_MUX_uxn_opcodes_h_l1565_c7_216a_iffalse,
tmp16_MUX_uxn_opcodes_h_l1565_c7_216a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_216a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_216a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_216a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_216a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_216a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_216a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_216a
result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_216a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_216a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_216a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_216a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_216a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_216a
result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_216a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_216a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_216a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_216a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_216a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_216a
result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_216a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_216a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_216a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_216a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_216a_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1565_c7_216a
result_u16_value_MUX_uxn_opcodes_h_l1565_c7_216a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1565_c7_216a_cond,
result_u16_value_MUX_uxn_opcodes_h_l1565_c7_216a_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1565_c7_216a_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1565_c7_216a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1565_c7_216a
result_u8_value_MUX_uxn_opcodes_h_l1565_c7_216a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1565_c7_216a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1565_c7_216a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1565_c7_216a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1565_c7_216a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_216a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_216a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_216a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_216a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_216a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_216a_return_output);

-- t8_MUX_uxn_opcodes_h_l1565_c7_216a
t8_MUX_uxn_opcodes_h_l1565_c7_216a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1565_c7_216a_cond,
t8_MUX_uxn_opcodes_h_l1565_c7_216a_iftrue,
t8_MUX_uxn_opcodes_h_l1565_c7_216a_iffalse,
t8_MUX_uxn_opcodes_h_l1565_c7_216a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1568_c11_47f9
BIN_OP_EQ_uxn_opcodes_h_l1568_c11_47f9 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1568_c11_47f9_left,
BIN_OP_EQ_uxn_opcodes_h_l1568_c11_47f9_right,
BIN_OP_EQ_uxn_opcodes_h_l1568_c11_47f9_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1568_c7_48cc
tmp16_MUX_uxn_opcodes_h_l1568_c7_48cc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1568_c7_48cc_cond,
tmp16_MUX_uxn_opcodes_h_l1568_c7_48cc_iftrue,
tmp16_MUX_uxn_opcodes_h_l1568_c7_48cc_iffalse,
tmp16_MUX_uxn_opcodes_h_l1568_c7_48cc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_48cc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_48cc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_48cc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_48cc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_48cc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_48cc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_48cc
result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_48cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_48cc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_48cc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_48cc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_48cc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_48cc
result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_48cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_48cc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_48cc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_48cc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_48cc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_48cc
result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_48cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_48cc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_48cc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_48cc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_48cc_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1568_c7_48cc
result_u16_value_MUX_uxn_opcodes_h_l1568_c7_48cc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1568_c7_48cc_cond,
result_u16_value_MUX_uxn_opcodes_h_l1568_c7_48cc_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1568_c7_48cc_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1568_c7_48cc_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1568_c7_48cc
result_u8_value_MUX_uxn_opcodes_h_l1568_c7_48cc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1568_c7_48cc_cond,
result_u8_value_MUX_uxn_opcodes_h_l1568_c7_48cc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1568_c7_48cc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1568_c7_48cc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_48cc
result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_48cc : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_48cc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_48cc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_48cc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_48cc_return_output);

-- t8_MUX_uxn_opcodes_h_l1568_c7_48cc
t8_MUX_uxn_opcodes_h_l1568_c7_48cc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1568_c7_48cc_cond,
t8_MUX_uxn_opcodes_h_l1568_c7_48cc_iftrue,
t8_MUX_uxn_opcodes_h_l1568_c7_48cc_iffalse,
t8_MUX_uxn_opcodes_h_l1568_c7_48cc_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1571_c30_0309
sp_relative_shift_uxn_opcodes_h_l1571_c30_0309 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1571_c30_0309_ins,
sp_relative_shift_uxn_opcodes_h_l1571_c30_0309_x,
sp_relative_shift_uxn_opcodes_h_l1571_c30_0309_y,
sp_relative_shift_uxn_opcodes_h_l1571_c30_0309_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1574_c11_e899
BIN_OP_EQ_uxn_opcodes_h_l1574_c11_e899 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1574_c11_e899_left,
BIN_OP_EQ_uxn_opcodes_h_l1574_c11_e899_right,
BIN_OP_EQ_uxn_opcodes_h_l1574_c11_e899_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1574_c7_ab91
tmp16_MUX_uxn_opcodes_h_l1574_c7_ab91 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1574_c7_ab91_cond,
tmp16_MUX_uxn_opcodes_h_l1574_c7_ab91_iftrue,
tmp16_MUX_uxn_opcodes_h_l1574_c7_ab91_iffalse,
tmp16_MUX_uxn_opcodes_h_l1574_c7_ab91_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_ab91
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_ab91 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_ab91_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_ab91_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_ab91_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_ab91_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_ab91
result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_ab91 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_ab91_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_ab91_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_ab91_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_ab91_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_ab91
result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_ab91 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_ab91_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_ab91_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_ab91_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_ab91_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_ab91
result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_ab91 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_ab91_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_ab91_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_ab91_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_ab91_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1574_c7_ab91
result_u16_value_MUX_uxn_opcodes_h_l1574_c7_ab91 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1574_c7_ab91_cond,
result_u16_value_MUX_uxn_opcodes_h_l1574_c7_ab91_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1574_c7_ab91_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1574_c7_ab91_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1574_c7_ab91
result_u8_value_MUX_uxn_opcodes_h_l1574_c7_ab91 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1574_c7_ab91_cond,
result_u8_value_MUX_uxn_opcodes_h_l1574_c7_ab91_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1574_c7_ab91_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1574_c7_ab91_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1578_c11_067a
BIN_OP_EQ_uxn_opcodes_h_l1578_c11_067a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1578_c11_067a_left,
BIN_OP_EQ_uxn_opcodes_h_l1578_c11_067a_right,
BIN_OP_EQ_uxn_opcodes_h_l1578_c11_067a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1578_c7_ffc4
tmp16_MUX_uxn_opcodes_h_l1578_c7_ffc4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1578_c7_ffc4_cond,
tmp16_MUX_uxn_opcodes_h_l1578_c7_ffc4_iftrue,
tmp16_MUX_uxn_opcodes_h_l1578_c7_ffc4_iffalse,
tmp16_MUX_uxn_opcodes_h_l1578_c7_ffc4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_ffc4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_ffc4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_ffc4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_ffc4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_ffc4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_ffc4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_ffc4
result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_ffc4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_ffc4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_ffc4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_ffc4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_ffc4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_ffc4
result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_ffc4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_ffc4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_ffc4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_ffc4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_ffc4_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1578_c7_ffc4
result_u16_value_MUX_uxn_opcodes_h_l1578_c7_ffc4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1578_c7_ffc4_cond,
result_u16_value_MUX_uxn_opcodes_h_l1578_c7_ffc4_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1578_c7_ffc4_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1578_c7_ffc4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1578_c7_ffc4
result_u8_value_MUX_uxn_opcodes_h_l1578_c7_ffc4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1578_c7_ffc4_cond,
result_u8_value_MUX_uxn_opcodes_h_l1578_c7_ffc4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1578_c7_ffc4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1578_c7_ffc4_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1580_c3_36e0
CONST_SL_8_uxn_opcodes_h_l1580_c3_36e0 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1580_c3_36e0_x,
CONST_SL_8_uxn_opcodes_h_l1580_c3_36e0_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1581_c33_a0ed
BIN_OP_PLUS_uxn_opcodes_h_l1581_c33_a0ed : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1581_c33_a0ed_left,
BIN_OP_PLUS_uxn_opcodes_h_l1581_c33_a0ed_right,
BIN_OP_PLUS_uxn_opcodes_h_l1581_c33_a0ed_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1583_c11_fc10
BIN_OP_EQ_uxn_opcodes_h_l1583_c11_fc10 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1583_c11_fc10_left,
BIN_OP_EQ_uxn_opcodes_h_l1583_c11_fc10_right,
BIN_OP_EQ_uxn_opcodes_h_l1583_c11_fc10_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1583_c7_b22a
tmp16_MUX_uxn_opcodes_h_l1583_c7_b22a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1583_c7_b22a_cond,
tmp16_MUX_uxn_opcodes_h_l1583_c7_b22a_iftrue,
tmp16_MUX_uxn_opcodes_h_l1583_c7_b22a_iffalse,
tmp16_MUX_uxn_opcodes_h_l1583_c7_b22a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1583_c7_b22a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1583_c7_b22a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1583_c7_b22a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1583_c7_b22a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1583_c7_b22a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1583_c7_b22a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1583_c7_b22a
result_is_opc_done_MUX_uxn_opcodes_h_l1583_c7_b22a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1583_c7_b22a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1583_c7_b22a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1583_c7_b22a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1583_c7_b22a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1583_c7_b22a
result_is_stack_write_MUX_uxn_opcodes_h_l1583_c7_b22a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1583_c7_b22a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1583_c7_b22a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1583_c7_b22a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1583_c7_b22a_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1583_c7_b22a
result_u16_value_MUX_uxn_opcodes_h_l1583_c7_b22a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1583_c7_b22a_cond,
result_u16_value_MUX_uxn_opcodes_h_l1583_c7_b22a_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1583_c7_b22a_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1583_c7_b22a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1583_c7_b22a
result_u8_value_MUX_uxn_opcodes_h_l1583_c7_b22a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1583_c7_b22a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1583_c7_b22a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1583_c7_b22a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1583_c7_b22a_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1584_c33_f4e5
BIN_OP_PLUS_uxn_opcodes_h_l1584_c33_f4e5 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1584_c33_f4e5_left,
BIN_OP_PLUS_uxn_opcodes_h_l1584_c33_f4e5_right,
BIN_OP_PLUS_uxn_opcodes_h_l1584_c33_f4e5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1586_c11_fb1c
BIN_OP_EQ_uxn_opcodes_h_l1586_c11_fb1c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1586_c11_fb1c_left,
BIN_OP_EQ_uxn_opcodes_h_l1586_c11_fb1c_right,
BIN_OP_EQ_uxn_opcodes_h_l1586_c11_fb1c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1586_c7_01ad
tmp16_MUX_uxn_opcodes_h_l1586_c7_01ad : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1586_c7_01ad_cond,
tmp16_MUX_uxn_opcodes_h_l1586_c7_01ad_iftrue,
tmp16_MUX_uxn_opcodes_h_l1586_c7_01ad_iffalse,
tmp16_MUX_uxn_opcodes_h_l1586_c7_01ad_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_01ad
result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_01ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_01ad_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_01ad_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_01ad_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_01ad_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_01ad
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_01ad : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_01ad_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_01ad_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_01ad_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_01ad_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1586_c7_01ad
result_u8_value_MUX_uxn_opcodes_h_l1586_c7_01ad : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1586_c7_01ad_cond,
result_u8_value_MUX_uxn_opcodes_h_l1586_c7_01ad_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1586_c7_01ad_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1586_c7_01ad_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_01ad
result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_01ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_01ad_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_01ad_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_01ad_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_01ad_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1587_c3_0e6f
BIN_OP_OR_uxn_opcodes_h_l1587_c3_0e6f : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1587_c3_0e6f_left,
BIN_OP_OR_uxn_opcodes_h_l1587_c3_0e6f_right,
BIN_OP_OR_uxn_opcodes_h_l1587_c3_0e6f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1592_c11_e955
BIN_OP_EQ_uxn_opcodes_h_l1592_c11_e955 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1592_c11_e955_left,
BIN_OP_EQ_uxn_opcodes_h_l1592_c11_e955_right,
BIN_OP_EQ_uxn_opcodes_h_l1592_c11_e955_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_774c
result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_774c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_774c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_774c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_774c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_774c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1592_c7_774c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1592_c7_774c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1592_c7_774c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1592_c7_774c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1592_c7_774c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1592_c7_774c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1592_c7_774c
result_u8_value_MUX_uxn_opcodes_h_l1592_c7_774c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1592_c7_774c_cond,
result_u8_value_MUX_uxn_opcodes_h_l1592_c7_774c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1592_c7_774c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1592_c7_774c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_774c
result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_774c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_774c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_774c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_774c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_774c_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1594_c31_c9d7
CONST_SR_8_uxn_opcodes_h_l1594_c31_c9d7 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1594_c31_c9d7_x,
CONST_SR_8_uxn_opcodes_h_l1594_c31_c9d7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1596_c11_5d3b
BIN_OP_EQ_uxn_opcodes_h_l1596_c11_5d3b : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1596_c11_5d3b_left,
BIN_OP_EQ_uxn_opcodes_h_l1596_c11_5d3b_right,
BIN_OP_EQ_uxn_opcodes_h_l1596_c11_5d3b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1596_c7_8ca4
result_is_stack_write_MUX_uxn_opcodes_h_l1596_c7_8ca4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1596_c7_8ca4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1596_c7_8ca4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1596_c7_8ca4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1596_c7_8ca4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1596_c7_8ca4
result_is_opc_done_MUX_uxn_opcodes_h_l1596_c7_8ca4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1596_c7_8ca4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1596_c7_8ca4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1596_c7_8ca4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1596_c7_8ca4_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1560_c6_3e34_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_a10b_return_output,
 tmp16_MUX_uxn_opcodes_h_l1560_c2_8eb6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_8eb6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_8eb6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_8eb6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_8eb6_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1560_c2_8eb6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1560_c2_8eb6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_8eb6_return_output,
 t8_MUX_uxn_opcodes_h_l1560_c2_8eb6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1565_c11_deed_return_output,
 tmp16_MUX_uxn_opcodes_h_l1565_c7_216a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_216a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_216a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_216a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_216a_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1565_c7_216a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1565_c7_216a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_216a_return_output,
 t8_MUX_uxn_opcodes_h_l1565_c7_216a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1568_c11_47f9_return_output,
 tmp16_MUX_uxn_opcodes_h_l1568_c7_48cc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_48cc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_48cc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_48cc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_48cc_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1568_c7_48cc_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1568_c7_48cc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_48cc_return_output,
 t8_MUX_uxn_opcodes_h_l1568_c7_48cc_return_output,
 sp_relative_shift_uxn_opcodes_h_l1571_c30_0309_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1574_c11_e899_return_output,
 tmp16_MUX_uxn_opcodes_h_l1574_c7_ab91_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_ab91_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_ab91_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_ab91_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_ab91_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1574_c7_ab91_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1574_c7_ab91_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1578_c11_067a_return_output,
 tmp16_MUX_uxn_opcodes_h_l1578_c7_ffc4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_ffc4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_ffc4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_ffc4_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1578_c7_ffc4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1578_c7_ffc4_return_output,
 CONST_SL_8_uxn_opcodes_h_l1580_c3_36e0_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1581_c33_a0ed_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1583_c11_fc10_return_output,
 tmp16_MUX_uxn_opcodes_h_l1583_c7_b22a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1583_c7_b22a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1583_c7_b22a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1583_c7_b22a_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1583_c7_b22a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1583_c7_b22a_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1584_c33_f4e5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1586_c11_fb1c_return_output,
 tmp16_MUX_uxn_opcodes_h_l1586_c7_01ad_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_01ad_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_01ad_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1586_c7_01ad_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_01ad_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1587_c3_0e6f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1592_c11_e955_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_774c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1592_c7_774c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1592_c7_774c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_774c_return_output,
 CONST_SR_8_uxn_opcodes_h_l1594_c31_c9d7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1596_c11_5d3b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1596_c7_8ca4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1596_c7_8ca4_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_3e34_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_3e34_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_3e34_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_a10b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_a10b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_a10b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_a10b_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1560_c2_8eb6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1560_c2_8eb6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1565_c7_216a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1560_c2_8eb6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1560_c2_8eb6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_8eb6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1562_c3_7e5b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_8eb6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_216a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_8eb6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_8eb6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_8eb6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_8eb6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_216a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_8eb6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_8eb6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_8eb6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_8eb6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_216a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_8eb6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_8eb6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_8eb6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_8eb6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_216a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_8eb6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_8eb6_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c2_8eb6_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c2_8eb6_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1565_c7_216a_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c2_8eb6_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c2_8eb6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c2_8eb6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c2_8eb6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1565_c7_216a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c2_8eb6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c2_8eb6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_8eb6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_8eb6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_216a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_8eb6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_8eb6_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1560_c2_8eb6_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1560_c2_8eb6_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1565_c7_216a_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1560_c2_8eb6_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1560_c2_8eb6_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1561_c3_47dc_uxn_opcodes_h_l1561_c3_47dc_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_deed_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_deed_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_deed_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1565_c7_216a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1565_c7_216a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1568_c7_48cc_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1565_c7_216a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_216a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1566_c3_575f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_216a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_48cc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_216a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_216a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_216a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_48cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_216a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_216a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_216a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_48cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_216a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_216a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_216a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_48cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_216a_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1565_c7_216a_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1565_c7_216a_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1568_c7_48cc_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1565_c7_216a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1565_c7_216a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1565_c7_216a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1568_c7_48cc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1565_c7_216a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_216a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_216a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_48cc_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_216a_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1565_c7_216a_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1565_c7_216a_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1568_c7_48cc_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1565_c7_216a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_47f9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_47f9_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_47f9_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1568_c7_48cc_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1568_c7_48cc_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1574_c7_ab91_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1568_c7_48cc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_48cc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_48cc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_ab91_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_48cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_48cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_48cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_ab91_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_48cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_48cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_48cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_ab91_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_48cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_48cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_48cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_ab91_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_48cc_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1568_c7_48cc_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1568_c7_48cc_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_ab91_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1568_c7_48cc_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1568_c7_48cc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1568_c7_48cc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_ab91_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1568_c7_48cc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_48cc_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_48cc_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_48cc_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1568_c7_48cc_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1568_c7_48cc_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1568_c7_48cc_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1571_c30_0309_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1571_c30_0309_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1571_c30_0309_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1571_c30_0309_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1572_c22_b8d7_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_e899_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_e899_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_e899_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1574_c7_ab91_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1574_c7_ab91_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1578_c7_ffc4_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1574_c7_ab91_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_ab91_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_ab91_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_ffc4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_ab91_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_ab91_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_ab91_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_ab91_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_ab91_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_ab91_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_ffc4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_ab91_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_ab91_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_ab91_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_ffc4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_ab91_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_ab91_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_ab91_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1578_c7_ffc4_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_ab91_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_ab91_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_ab91_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_ffc4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_ab91_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1576_c22_443a_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_067a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_067a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_067a_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1578_c7_ffc4_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1578_c7_ffc4_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1583_c7_b22a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1578_c7_ffc4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_ffc4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_ffc4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1583_c7_b22a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_ffc4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_ffc4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_ffc4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1583_c7_b22a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_ffc4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_ffc4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_ffc4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1583_c7_b22a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_ffc4_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1578_c7_ffc4_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1578_c7_ffc4_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1583_c7_b22a_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1578_c7_ffc4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_ffc4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_ffc4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1583_c7_b22a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_ffc4_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1580_c3_36e0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1580_c3_36e0_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1581_c33_a0ed_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1581_c33_a0ed_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1581_c33_a0ed_return_output : unsigned(8 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1581_c22_33fc_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1583_c11_fc10_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1583_c11_fc10_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1583_c11_fc10_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1583_c7_b22a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1583_c7_b22a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1586_c7_01ad_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1583_c7_b22a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1583_c7_b22a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1583_c7_b22a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_01ad_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1583_c7_b22a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1583_c7_b22a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1583_c7_b22a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_01ad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1583_c7_b22a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1583_c7_b22a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1583_c7_b22a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_01ad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1583_c7_b22a_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1583_c7_b22a_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1583_c7_b22a_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1583_c7_b22a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1583_c7_b22a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1583_c7_b22a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1586_c7_01ad_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1583_c7_b22a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1584_c33_f4e5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1584_c33_f4e5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1584_c33_f4e5_return_output : unsigned(8 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1584_c22_8e9d_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_fb1c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_fb1c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_fb1c_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1586_c7_01ad_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1586_c7_01ad_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1586_c7_01ad_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_01ad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_01ad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_774c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_01ad_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_01ad_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1589_c3_0723 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_01ad_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1592_c7_774c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_01ad_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1586_c7_01ad_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1586_c7_01ad_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1592_c7_774c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1586_c7_01ad_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_01ad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_01ad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_774c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_01ad_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1587_c3_0e6f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1587_c3_0e6f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1587_c3_0e6f_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1590_c21_4914_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1592_c11_e955_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1592_c11_e955_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1592_c11_e955_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_774c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_774c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1596_c7_8ca4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_774c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1592_c7_774c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1593_c3_4294 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1592_c7_774c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1592_c7_774c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1592_c7_774c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1592_c7_774c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1592_c7_774c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_774c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_774c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1596_c7_8ca4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_774c_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1594_c31_c9d7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1594_c31_c9d7_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1594_c21_7635_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1596_c11_5d3b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1596_c11_5d3b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1596_c11_5d3b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1596_c7_8ca4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1596_c7_8ca4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1596_c7_8ca4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1596_c7_8ca4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1596_c7_8ca4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1596_c7_8ca4_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1560_l1574_l1565_DUPLICATE_d3a9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1560_l1583_l1578_l1574_l1568_l1596_l1565_l1592_DUPLICATE_fb15_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1583_l1560_l1565_DUPLICATE_3536_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1560_l1583_l1578_l1574_l1568_l1565_l1592_DUPLICATE_4ab6_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1560_l1565_l1568_DUPLICATE_5f91_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1586_l1583_l1578_l1574_l1568_l1596_l1565_l1592_DUPLICATE_2bea_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1583_l1578_l1574_l1568_l1592_DUPLICATE_9884_return_output : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1579_l1587_DUPLICATE_7a76_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_284d_uxn_opcodes_h_l1601_l1555_DUPLICATE_4a15_return_output : opcode_result_t;
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
     VAR_sp_relative_shift_uxn_opcodes_h_l1571_c30_0309_y := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1566_c3_575f := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_216a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1566_c3_575f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_e899_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_01ad_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1583_c11_fc10_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1596_c11_5d3b_right := to_unsigned(8, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_ab91_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1596_c7_8ca4_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_48cc_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1593_c3_4294 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1592_c7_774c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1593_c3_4294;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_3e34_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1592_c11_e955_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_fb1c_right := to_unsigned(6, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_8eb6_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1571_c30_0309_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1562_c3_7e5b := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_8eb6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1562_c3_7e5b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_067a_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_deed_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1584_c33_f4e5_right := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_a10b_iffalse := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1596_c7_8ca4_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1581_c33_a0ed_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1589_c3_0723 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_01ad_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1589_c3_0723;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_47f9_right := to_unsigned(2, 2);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_a10b_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1571_c30_0309_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_3e34_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_deed_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_47f9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_e899_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_067a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1583_c11_fc10_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_fb1c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1592_c11_e955_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1596_c11_5d3b_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l1568_c7_48cc_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1581_c33_a0ed_left := t8;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1584_c33_f4e5_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1560_c2_8eb6_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1565_c7_216a_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1568_c7_48cc_iffalse := t8;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1587_c3_0e6f_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1594_c31_c9d7_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1560_c2_8eb6_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1565_c7_216a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1568_c7_48cc_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1574_c7_ab91_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1583_c7_b22a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1586_c7_01ad_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1568_c11_47f9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1568_c11_47f9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_47f9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1568_c11_47f9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_47f9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_47f9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1568_c11_47f9_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1594_c31_c9d7] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1594_c31_c9d7_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1594_c31_c9d7_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1594_c31_c9d7_return_output := CONST_SR_8_uxn_opcodes_h_l1594_c31_c9d7_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1579_l1587_DUPLICATE_7a76 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1579_l1587_DUPLICATE_7a76_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1560_l1583_l1578_l1574_l1568_l1596_l1565_l1592_DUPLICATE_fb15 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1560_l1583_l1578_l1574_l1568_l1596_l1565_l1592_DUPLICATE_fb15_return_output := result.is_stack_write;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1584_c33_f4e5] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1584_c33_f4e5_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1584_c33_f4e5_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1584_c33_f4e5_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1584_c33_f4e5_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1584_c33_f4e5_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1584_c33_f4e5_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1576_c22_443a] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1576_c22_443a_return_output := CAST_TO_uint16_t_uint8_t(
     t8);

     -- BIN_OP_EQ[uxn_opcodes_h_l1583_c11_fc10] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1583_c11_fc10_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1583_c11_fc10_left;
     BIN_OP_EQ_uxn_opcodes_h_l1583_c11_fc10_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1583_c11_fc10_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1583_c11_fc10_return_output := BIN_OP_EQ_uxn_opcodes_h_l1583_c11_fc10_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1581_c33_a0ed] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1581_c33_a0ed_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1581_c33_a0ed_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1581_c33_a0ed_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1581_c33_a0ed_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1581_c33_a0ed_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1581_c33_a0ed_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1583_l1578_l1574_l1568_l1592_DUPLICATE_9884 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1583_l1578_l1574_l1568_l1592_DUPLICATE_9884_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1560_l1574_l1565_DUPLICATE_d3a9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1560_l1574_l1565_DUPLICATE_d3a9_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1586_c11_fb1c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1586_c11_fb1c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_fb1c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1586_c11_fb1c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_fb1c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_fb1c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1586_c11_fb1c_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1571_c30_0309] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1571_c30_0309_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1571_c30_0309_ins;
     sp_relative_shift_uxn_opcodes_h_l1571_c30_0309_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1571_c30_0309_x;
     sp_relative_shift_uxn_opcodes_h_l1571_c30_0309_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1571_c30_0309_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1571_c30_0309_return_output := sp_relative_shift_uxn_opcodes_h_l1571_c30_0309_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1560_l1583_l1578_l1574_l1568_l1565_l1592_DUPLICATE_4ab6 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1560_l1583_l1578_l1574_l1568_l1565_l1592_DUPLICATE_4ab6_return_output := result.u8_value;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1583_l1560_l1565_DUPLICATE_3536 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1583_l1560_l1565_DUPLICATE_3536_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1574_c11_e899] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1574_c11_e899_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_e899_left;
     BIN_OP_EQ_uxn_opcodes_h_l1574_c11_e899_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_e899_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_e899_return_output := BIN_OP_EQ_uxn_opcodes_h_l1574_c11_e899_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1596_c11_5d3b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1596_c11_5d3b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1596_c11_5d3b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1596_c11_5d3b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1596_c11_5d3b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1596_c11_5d3b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1596_c11_5d3b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1565_c11_deed] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1565_c11_deed_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_deed_left;
     BIN_OP_EQ_uxn_opcodes_h_l1565_c11_deed_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_deed_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_deed_return_output := BIN_OP_EQ_uxn_opcodes_h_l1565_c11_deed_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1578_c11_067a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1578_c11_067a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_067a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1578_c11_067a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_067a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_067a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1578_c11_067a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1560_c6_3e34] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1560_c6_3e34_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_3e34_left;
     BIN_OP_EQ_uxn_opcodes_h_l1560_c6_3e34_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_3e34_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_3e34_return_output := BIN_OP_EQ_uxn_opcodes_h_l1560_c6_3e34_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1592_c11_e955] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1592_c11_e955_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1592_c11_e955_left;
     BIN_OP_EQ_uxn_opcodes_h_l1592_c11_e955_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1592_c11_e955_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1592_c11_e955_return_output := BIN_OP_EQ_uxn_opcodes_h_l1592_c11_e955_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1560_l1565_l1568_DUPLICATE_5f91 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1560_l1565_l1568_DUPLICATE_5f91_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1586_l1583_l1578_l1574_l1568_l1596_l1565_l1592_DUPLICATE_2bea LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1586_l1583_l1578_l1574_l1568_l1596_l1565_l1592_DUPLICATE_2bea_return_output := result.is_opc_done;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1572_c22_b8d7] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1572_c22_b8d7_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_a10b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_3e34_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_8eb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_3e34_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_8eb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_3e34_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_8eb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_3e34_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_8eb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_3e34_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_8eb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_3e34_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c2_8eb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_3e34_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c2_8eb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_3e34_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1560_c2_8eb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_3e34_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1560_c2_8eb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_3e34_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_216a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_deed_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_216a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_deed_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_216a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_deed_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_216a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_deed_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_216a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_deed_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1565_c7_216a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_deed_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1565_c7_216a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_deed_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1565_c7_216a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_deed_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1565_c7_216a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_deed_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_48cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_47f9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_48cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_47f9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_48cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_47f9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_48cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_47f9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_48cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_47f9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1568_c7_48cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_47f9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1568_c7_48cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_47f9_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1568_c7_48cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_47f9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1568_c7_48cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_47f9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_ab91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_e899_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_ab91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_e899_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_ab91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_e899_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_ab91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_e899_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_ab91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_e899_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_ab91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_e899_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1574_c7_ab91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_e899_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_ffc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_067a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_ffc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_067a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_ffc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_067a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1578_c7_ffc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_067a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_ffc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_067a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1578_c7_ffc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_067a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1583_c7_b22a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1583_c11_fc10_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1583_c7_b22a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1583_c11_fc10_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1583_c7_b22a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1583_c11_fc10_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1583_c7_b22a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1583_c11_fc10_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1583_c7_b22a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1583_c11_fc10_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1583_c7_b22a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1583_c11_fc10_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_01ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_fb1c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_01ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_fb1c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_01ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_fb1c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1586_c7_01ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_fb1c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1586_c7_01ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_fb1c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_774c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1592_c11_e955_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_774c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1592_c11_e955_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1592_c7_774c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1592_c11_e955_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1592_c7_774c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1592_c11_e955_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1596_c7_8ca4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1596_c11_5d3b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1596_c7_8ca4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1596_c11_5d3b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1568_c7_48cc_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1572_c22_b8d7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_ab91_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1576_c22_443a_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1587_c3_0e6f_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1579_l1587_DUPLICATE_7a76_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1580_c3_36e0_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1579_l1587_DUPLICATE_7a76_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_8eb6_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1560_l1565_l1568_DUPLICATE_5f91_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_216a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1560_l1565_l1568_DUPLICATE_5f91_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_48cc_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1560_l1565_l1568_DUPLICATE_5f91_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c2_8eb6_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1583_l1560_l1565_DUPLICATE_3536_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1565_c7_216a_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1583_l1560_l1565_DUPLICATE_3536_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1583_c7_b22a_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1583_l1560_l1565_DUPLICATE_3536_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_216a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1586_l1583_l1578_l1574_l1568_l1596_l1565_l1592_DUPLICATE_2bea_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_48cc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1586_l1583_l1578_l1574_l1568_l1596_l1565_l1592_DUPLICATE_2bea_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_ab91_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1586_l1583_l1578_l1574_l1568_l1596_l1565_l1592_DUPLICATE_2bea_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_ffc4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1586_l1583_l1578_l1574_l1568_l1596_l1565_l1592_DUPLICATE_2bea_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1583_c7_b22a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1586_l1583_l1578_l1574_l1568_l1596_l1565_l1592_DUPLICATE_2bea_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_01ad_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1586_l1583_l1578_l1574_l1568_l1596_l1565_l1592_DUPLICATE_2bea_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_774c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1586_l1583_l1578_l1574_l1568_l1596_l1565_l1592_DUPLICATE_2bea_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1596_c7_8ca4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1586_l1583_l1578_l1574_l1568_l1596_l1565_l1592_DUPLICATE_2bea_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_8eb6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1560_l1574_l1565_DUPLICATE_d3a9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_216a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1560_l1574_l1565_DUPLICATE_d3a9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_ab91_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1560_l1574_l1565_DUPLICATE_d3a9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_8eb6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1560_l1583_l1578_l1574_l1568_l1596_l1565_l1592_DUPLICATE_fb15_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_216a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1560_l1583_l1578_l1574_l1568_l1596_l1565_l1592_DUPLICATE_fb15_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_48cc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1560_l1583_l1578_l1574_l1568_l1596_l1565_l1592_DUPLICATE_fb15_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_ab91_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1560_l1583_l1578_l1574_l1568_l1596_l1565_l1592_DUPLICATE_fb15_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_ffc4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1560_l1583_l1578_l1574_l1568_l1596_l1565_l1592_DUPLICATE_fb15_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1583_c7_b22a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1560_l1583_l1578_l1574_l1568_l1596_l1565_l1592_DUPLICATE_fb15_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_774c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1560_l1583_l1578_l1574_l1568_l1596_l1565_l1592_DUPLICATE_fb15_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1596_c7_8ca4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1560_l1583_l1578_l1574_l1568_l1596_l1565_l1592_DUPLICATE_fb15_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_48cc_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1583_l1578_l1574_l1568_l1592_DUPLICATE_9884_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_ab91_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1583_l1578_l1574_l1568_l1592_DUPLICATE_9884_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_ffc4_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1583_l1578_l1574_l1568_l1592_DUPLICATE_9884_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1583_c7_b22a_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1583_l1578_l1574_l1568_l1592_DUPLICATE_9884_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1592_c7_774c_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1583_l1578_l1574_l1568_l1592_DUPLICATE_9884_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c2_8eb6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1560_l1583_l1578_l1574_l1568_l1565_l1592_DUPLICATE_4ab6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1565_c7_216a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1560_l1583_l1578_l1574_l1568_l1565_l1592_DUPLICATE_4ab6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1568_c7_48cc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1560_l1583_l1578_l1574_l1568_l1565_l1592_DUPLICATE_4ab6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_ab91_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1560_l1583_l1578_l1574_l1568_l1565_l1592_DUPLICATE_4ab6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_ffc4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1560_l1583_l1578_l1574_l1568_l1565_l1592_DUPLICATE_4ab6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1583_c7_b22a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1560_l1583_l1578_l1574_l1568_l1565_l1592_DUPLICATE_4ab6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1592_c7_774c_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1560_l1583_l1578_l1574_l1568_l1565_l1592_DUPLICATE_4ab6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_48cc_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1571_c30_0309_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1574_c7_ab91] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_ab91_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_ab91_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_ab91_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_ab91_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_ab91_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_ab91_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_ab91_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_ab91_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1592_c7_774c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1592_c7_774c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1592_c7_774c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1592_c7_774c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1592_c7_774c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1592_c7_774c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1592_c7_774c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1592_c7_774c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1592_c7_774c_return_output;

     -- t8_MUX[uxn_opcodes_h_l1568_c7_48cc] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1568_c7_48cc_cond <= VAR_t8_MUX_uxn_opcodes_h_l1568_c7_48cc_cond;
     t8_MUX_uxn_opcodes_h_l1568_c7_48cc_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1568_c7_48cc_iftrue;
     t8_MUX_uxn_opcodes_h_l1568_c7_48cc_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1568_c7_48cc_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1568_c7_48cc_return_output := t8_MUX_uxn_opcodes_h_l1568_c7_48cc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1568_c7_48cc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_48cc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_48cc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_48cc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_48cc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_48cc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_48cc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_48cc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_48cc_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1594_c21_7635] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1594_c21_7635_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1594_c31_c9d7_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1596_c7_8ca4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1596_c7_8ca4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1596_c7_8ca4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1596_c7_8ca4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1596_c7_8ca4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1596_c7_8ca4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1596_c7_8ca4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1596_c7_8ca4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1596_c7_8ca4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1596_c7_8ca4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1596_c7_8ca4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1596_c7_8ca4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1596_c7_8ca4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1596_c7_8ca4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1596_c7_8ca4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1596_c7_8ca4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1596_c7_8ca4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1596_c7_8ca4_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1560_c1_a10b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_a10b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_a10b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_a10b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_a10b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_a10b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_a10b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_a10b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_a10b_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1580_c3_36e0] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1580_c3_36e0_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1580_c3_36e0_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1580_c3_36e0_return_output := CONST_SL_8_uxn_opcodes_h_l1580_c3_36e0_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1587_c3_0e6f] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1587_c3_0e6f_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1587_c3_0e6f_left;
     BIN_OP_OR_uxn_opcodes_h_l1587_c3_0e6f_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1587_c3_0e6f_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1587_c3_0e6f_return_output := BIN_OP_OR_uxn_opcodes_h_l1587_c3_0e6f_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1581_c22_33fc] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1581_c22_33fc_return_output := CAST_TO_uint16_t_uint9_t(
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1581_c33_a0ed_return_output);

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1584_c22_8e9d] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1584_c22_8e9d_return_output := CAST_TO_uint16_t_uint9_t(
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1584_c33_f4e5_return_output);

     -- Submodule level 2
     VAR_tmp16_MUX_uxn_opcodes_h_l1586_c7_01ad_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1587_c3_0e6f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1578_c7_ffc4_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1581_c22_33fc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1583_c7_b22a_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1584_c22_8e9d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1592_c7_774c_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1594_c21_7635_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1578_c7_ffc4_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1580_c3_36e0_return_output;
     VAR_printf_uxn_opcodes_h_l1561_c3_47dc_uxn_opcodes_h_l1561_c3_47dc_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_a10b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_774c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1596_c7_8ca4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_48cc_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_ab91_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_774c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1596_c7_8ca4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_216a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_48cc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_01ad_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1592_c7_774c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1565_c7_216a_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1568_c7_48cc_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1592_c7_774c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1592_c7_774c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1592_c7_774c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1592_c7_774c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1592_c7_774c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1592_c7_774c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1592_c7_774c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1592_c7_774c_return_output := result_u8_value_MUX_uxn_opcodes_h_l1592_c7_774c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1565_c7_216a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_216a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_216a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_216a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_216a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_216a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_216a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_216a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_216a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1586_c7_01ad] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1586_c7_01ad_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1586_c7_01ad_cond;
     tmp16_MUX_uxn_opcodes_h_l1586_c7_01ad_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1586_c7_01ad_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1586_c7_01ad_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1586_c7_01ad_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1586_c7_01ad_return_output := tmp16_MUX_uxn_opcodes_h_l1586_c7_01ad_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1592_c7_774c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_774c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_774c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_774c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_774c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_774c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_774c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_774c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_774c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1586_c7_01ad] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_01ad_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_01ad_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_01ad_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_01ad_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_01ad_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_01ad_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_01ad_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_01ad_return_output;

     -- printf_uxn_opcodes_h_l1561_c3_47dc[uxn_opcodes_h_l1561_c3_47dc] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1561_c3_47dc_uxn_opcodes_h_l1561_c3_47dc_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1561_c3_47dc_uxn_opcodes_h_l1561_c3_47dc_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1568_c7_48cc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_48cc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_48cc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_48cc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_48cc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_48cc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_48cc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_48cc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_48cc_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1583_c7_b22a] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1583_c7_b22a_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1583_c7_b22a_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1583_c7_b22a_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1583_c7_b22a_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1583_c7_b22a_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1583_c7_b22a_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1583_c7_b22a_return_output := result_u16_value_MUX_uxn_opcodes_h_l1583_c7_b22a_return_output;

     -- t8_MUX[uxn_opcodes_h_l1565_c7_216a] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1565_c7_216a_cond <= VAR_t8_MUX_uxn_opcodes_h_l1565_c7_216a_cond;
     t8_MUX_uxn_opcodes_h_l1565_c7_216a_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1565_c7_216a_iftrue;
     t8_MUX_uxn_opcodes_h_l1565_c7_216a_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1565_c7_216a_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1565_c7_216a_return_output := t8_MUX_uxn_opcodes_h_l1565_c7_216a_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1590_c21_4914] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1590_c21_4914_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l1587_c3_0e6f_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1592_c7_774c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_774c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_774c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_774c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_774c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_774c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_774c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_774c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_774c_return_output;

     -- Submodule level 3
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1586_c7_01ad_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1590_c21_4914_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_01ad_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_774c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_216a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_48cc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_01ad_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_774c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_8eb6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_216a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1583_c7_b22a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_01ad_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1578_c7_ffc4_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1583_c7_b22a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1586_c7_01ad_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1592_c7_774c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1560_c2_8eb6_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1565_c7_216a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1583_c7_b22a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1586_c7_01ad_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1578_c7_ffc4] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1578_c7_ffc4_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1578_c7_ffc4_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1578_c7_ffc4_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1578_c7_ffc4_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1578_c7_ffc4_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1578_c7_ffc4_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1578_c7_ffc4_return_output := result_u16_value_MUX_uxn_opcodes_h_l1578_c7_ffc4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1560_c2_8eb6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_8eb6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_8eb6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_8eb6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_8eb6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_8eb6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_8eb6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_8eb6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_8eb6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1586_c7_01ad] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1586_c7_01ad_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1586_c7_01ad_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1586_c7_01ad_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1586_c7_01ad_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1586_c7_01ad_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1586_c7_01ad_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1586_c7_01ad_return_output := result_u8_value_MUX_uxn_opcodes_h_l1586_c7_01ad_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1583_c7_b22a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1583_c7_b22a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1583_c7_b22a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1583_c7_b22a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1583_c7_b22a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1583_c7_b22a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1583_c7_b22a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1583_c7_b22a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1583_c7_b22a_return_output;

     -- t8_MUX[uxn_opcodes_h_l1560_c2_8eb6] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1560_c2_8eb6_cond <= VAR_t8_MUX_uxn_opcodes_h_l1560_c2_8eb6_cond;
     t8_MUX_uxn_opcodes_h_l1560_c2_8eb6_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1560_c2_8eb6_iftrue;
     t8_MUX_uxn_opcodes_h_l1560_c2_8eb6_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1560_c2_8eb6_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1560_c2_8eb6_return_output := t8_MUX_uxn_opcodes_h_l1560_c2_8eb6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1586_c7_01ad] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_01ad_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_01ad_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_01ad_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_01ad_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_01ad_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_01ad_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_01ad_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_01ad_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1583_c7_b22a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1583_c7_b22a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1583_c7_b22a_cond;
     tmp16_MUX_uxn_opcodes_h_l1583_c7_b22a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1583_c7_b22a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1583_c7_b22a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1583_c7_b22a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1583_c7_b22a_return_output := tmp16_MUX_uxn_opcodes_h_l1583_c7_b22a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1565_c7_216a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_216a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_216a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_216a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_216a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_216a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_216a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_216a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_216a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1586_c7_01ad] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_01ad_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_01ad_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_01ad_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_01ad_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_01ad_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_01ad_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_01ad_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_01ad_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1583_c7_b22a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_01ad_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_8eb6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_216a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1583_c7_b22a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_01ad_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_ffc4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1583_c7_b22a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_ab91_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1578_c7_ffc4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1583_c7_b22a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1586_c7_01ad_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1560_c2_8eb6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1578_c7_ffc4_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1583_c7_b22a_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1574_c7_ab91] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1574_c7_ab91_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_ab91_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1574_c7_ab91_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_ab91_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1574_c7_ab91_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_ab91_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_ab91_return_output := result_u16_value_MUX_uxn_opcodes_h_l1574_c7_ab91_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1578_c7_ffc4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_ffc4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_ffc4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_ffc4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_ffc4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_ffc4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_ffc4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_ffc4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_ffc4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1583_c7_b22a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1583_c7_b22a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1583_c7_b22a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1583_c7_b22a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1583_c7_b22a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1583_c7_b22a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1583_c7_b22a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1583_c7_b22a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1583_c7_b22a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1578_c7_ffc4] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1578_c7_ffc4_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1578_c7_ffc4_cond;
     tmp16_MUX_uxn_opcodes_h_l1578_c7_ffc4_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1578_c7_ffc4_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1578_c7_ffc4_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1578_c7_ffc4_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1578_c7_ffc4_return_output := tmp16_MUX_uxn_opcodes_h_l1578_c7_ffc4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1560_c2_8eb6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_8eb6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_8eb6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_8eb6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_8eb6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_8eb6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_8eb6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_8eb6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_8eb6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1583_c7_b22a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1583_c7_b22a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1583_c7_b22a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1583_c7_b22a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1583_c7_b22a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1583_c7_b22a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1583_c7_b22a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1583_c7_b22a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1583_c7_b22a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1583_c7_b22a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1583_c7_b22a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1583_c7_b22a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1583_c7_b22a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1583_c7_b22a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1583_c7_b22a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1583_c7_b22a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1583_c7_b22a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1583_c7_b22a_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_ffc4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1583_c7_b22a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_ffc4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1583_c7_b22a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_ab91_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_ffc4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1568_c7_48cc_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_ab91_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_ffc4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1583_c7_b22a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1574_c7_ab91_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1578_c7_ffc4_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1574_c7_ab91] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_ab91_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_ab91_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_ab91_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_ab91_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_ab91_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_ab91_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_ab91_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_ab91_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1578_c7_ffc4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_ffc4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_ffc4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_ffc4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_ffc4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_ffc4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_ffc4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_ffc4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_ffc4_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1568_c7_48cc] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1568_c7_48cc_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1568_c7_48cc_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1568_c7_48cc_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1568_c7_48cc_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1568_c7_48cc_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1568_c7_48cc_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1568_c7_48cc_return_output := result_u16_value_MUX_uxn_opcodes_h_l1568_c7_48cc_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1574_c7_ab91] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1574_c7_ab91_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1574_c7_ab91_cond;
     tmp16_MUX_uxn_opcodes_h_l1574_c7_ab91_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1574_c7_ab91_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1574_c7_ab91_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1574_c7_ab91_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1574_c7_ab91_return_output := tmp16_MUX_uxn_opcodes_h_l1574_c7_ab91_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1578_c7_ffc4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_ffc4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_ffc4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_ffc4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_ffc4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_ffc4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_ffc4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_ffc4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_ffc4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1578_c7_ffc4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1578_c7_ffc4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_ffc4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1578_c7_ffc4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_ffc4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1578_c7_ffc4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_ffc4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_ffc4_return_output := result_u8_value_MUX_uxn_opcodes_h_l1578_c7_ffc4_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_ab91_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_ffc4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_ab91_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_ffc4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_48cc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_ab91_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1565_c7_216a_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1568_c7_48cc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_ab91_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_ffc4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1568_c7_48cc_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1574_c7_ab91_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1568_c7_48cc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_48cc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_48cc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_48cc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_48cc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_48cc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_48cc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_48cc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_48cc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1574_c7_ab91] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_ab91_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_ab91_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_ab91_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_ab91_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_ab91_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_ab91_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_ab91_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_ab91_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1574_c7_ab91] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_ab91_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_ab91_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_ab91_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_ab91_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_ab91_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_ab91_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_ab91_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_ab91_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1574_c7_ab91] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1574_c7_ab91_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_ab91_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1574_c7_ab91_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_ab91_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1574_c7_ab91_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_ab91_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_ab91_return_output := result_u8_value_MUX_uxn_opcodes_h_l1574_c7_ab91_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1565_c7_216a] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1565_c7_216a_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1565_c7_216a_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1565_c7_216a_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1565_c7_216a_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1565_c7_216a_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1565_c7_216a_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1565_c7_216a_return_output := result_u16_value_MUX_uxn_opcodes_h_l1565_c7_216a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1568_c7_48cc] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1568_c7_48cc_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1568_c7_48cc_cond;
     tmp16_MUX_uxn_opcodes_h_l1568_c7_48cc_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1568_c7_48cc_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1568_c7_48cc_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1568_c7_48cc_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1568_c7_48cc_return_output := tmp16_MUX_uxn_opcodes_h_l1568_c7_48cc_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_48cc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_ab91_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_48cc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_ab91_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_216a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_48cc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c2_8eb6_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1565_c7_216a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1568_c7_48cc_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_ab91_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1565_c7_216a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1568_c7_48cc_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1568_c7_48cc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_48cc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_48cc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_48cc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_48cc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_48cc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_48cc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_48cc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_48cc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1568_c7_48cc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_48cc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_48cc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_48cc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_48cc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_48cc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_48cc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_48cc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_48cc_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1568_c7_48cc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1568_c7_48cc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1568_c7_48cc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1568_c7_48cc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1568_c7_48cc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1568_c7_48cc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1568_c7_48cc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1568_c7_48cc_return_output := result_u8_value_MUX_uxn_opcodes_h_l1568_c7_48cc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1565_c7_216a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_216a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_216a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_216a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_216a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_216a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_216a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_216a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_216a_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1560_c2_8eb6] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1560_c2_8eb6_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c2_8eb6_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1560_c2_8eb6_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c2_8eb6_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1560_c2_8eb6_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c2_8eb6_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c2_8eb6_return_output := result_u16_value_MUX_uxn_opcodes_h_l1560_c2_8eb6_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1565_c7_216a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1565_c7_216a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1565_c7_216a_cond;
     tmp16_MUX_uxn_opcodes_h_l1565_c7_216a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1565_c7_216a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1565_c7_216a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1565_c7_216a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1565_c7_216a_return_output := tmp16_MUX_uxn_opcodes_h_l1565_c7_216a_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_216a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_48cc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_216a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_48cc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_8eb6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_216a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1565_c7_216a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1568_c7_48cc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1560_c2_8eb6_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1565_c7_216a_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1565_c7_216a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_216a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_216a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_216a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_216a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_216a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_216a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_216a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_216a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1565_c7_216a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1565_c7_216a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1565_c7_216a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1565_c7_216a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1565_c7_216a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1565_c7_216a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1565_c7_216a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1565_c7_216a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1565_c7_216a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1560_c2_8eb6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_8eb6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_8eb6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_8eb6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_8eb6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_8eb6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_8eb6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_8eb6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_8eb6_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1560_c2_8eb6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1560_c2_8eb6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1560_c2_8eb6_cond;
     tmp16_MUX_uxn_opcodes_h_l1560_c2_8eb6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1560_c2_8eb6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1560_c2_8eb6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1560_c2_8eb6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1560_c2_8eb6_return_output := tmp16_MUX_uxn_opcodes_h_l1560_c2_8eb6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1565_c7_216a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_216a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_216a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_216a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_216a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_216a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_216a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_216a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_216a_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_8eb6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_216a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_8eb6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_216a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c2_8eb6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1565_c7_216a_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1560_c2_8eb6_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1560_c2_8eb6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1560_c2_8eb6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c2_8eb6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1560_c2_8eb6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c2_8eb6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1560_c2_8eb6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c2_8eb6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c2_8eb6_return_output := result_u8_value_MUX_uxn_opcodes_h_l1560_c2_8eb6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1560_c2_8eb6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_8eb6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_8eb6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_8eb6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_8eb6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_8eb6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_8eb6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_8eb6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_8eb6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1560_c2_8eb6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_8eb6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_8eb6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_8eb6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_8eb6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_8eb6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_8eb6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_8eb6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_8eb6_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_284d_uxn_opcodes_h_l1601_l1555_DUPLICATE_4a15 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_284d_uxn_opcodes_h_l1601_l1555_DUPLICATE_4a15_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_284d(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_8eb6_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_8eb6_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_8eb6_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_8eb6_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c2_8eb6_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c2_8eb6_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_8eb6_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_284d_uxn_opcodes_h_l1601_l1555_DUPLICATE_4a15_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_284d_uxn_opcodes_h_l1601_l1555_DUPLICATE_4a15_return_output;
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
