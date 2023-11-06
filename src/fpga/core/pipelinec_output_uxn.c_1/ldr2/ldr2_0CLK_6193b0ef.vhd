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
-- Submodules: 73
entity ldr2_0CLK_6193b0ef is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ldr2_0CLK_6193b0ef;
architecture arch of ldr2_0CLK_6193b0ef is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1560_c6_347f]
signal BIN_OP_EQ_uxn_opcodes_h_l1560_c6_347f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1560_c6_347f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1560_c6_347f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1560_c1_ed86]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_ed86_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_ed86_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_ed86_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_ed86_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1560_c2_e4da]
signal t8_MUX_uxn_opcodes_h_l1560_c2_e4da_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1560_c2_e4da_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1560_c2_e4da_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1560_c2_e4da_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1560_c2_e4da]
signal result_u16_value_MUX_uxn_opcodes_h_l1560_c2_e4da_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1560_c2_e4da_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1560_c2_e4da_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1560_c2_e4da_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1560_c2_e4da]
signal result_u8_value_MUX_uxn_opcodes_h_l1560_c2_e4da_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1560_c2_e4da_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1560_c2_e4da_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1560_c2_e4da_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1560_c2_e4da]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_e4da_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_e4da_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_e4da_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_e4da_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1560_c2_e4da]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_e4da_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_e4da_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_e4da_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_e4da_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1560_c2_e4da]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_e4da_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_e4da_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_e4da_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_e4da_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1560_c2_e4da]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_e4da_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_e4da_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_e4da_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_e4da_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1560_c2_e4da]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_e4da_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_e4da_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_e4da_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_e4da_return_output : signed(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1560_c2_e4da]
signal tmp16_MUX_uxn_opcodes_h_l1560_c2_e4da_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1560_c2_e4da_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1560_c2_e4da_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1560_c2_e4da_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1561_c3_2fdd[uxn_opcodes_h_l1561_c3_2fdd]
signal printf_uxn_opcodes_h_l1561_c3_2fdd_uxn_opcodes_h_l1561_c3_2fdd_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1565_c11_6f1f]
signal BIN_OP_EQ_uxn_opcodes_h_l1565_c11_6f1f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1565_c11_6f1f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1565_c11_6f1f_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1565_c7_397f]
signal t8_MUX_uxn_opcodes_h_l1565_c7_397f_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1565_c7_397f_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1565_c7_397f_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1565_c7_397f_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1565_c7_397f]
signal result_u16_value_MUX_uxn_opcodes_h_l1565_c7_397f_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1565_c7_397f_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1565_c7_397f_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1565_c7_397f_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1565_c7_397f]
signal result_u8_value_MUX_uxn_opcodes_h_l1565_c7_397f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1565_c7_397f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1565_c7_397f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1565_c7_397f_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1565_c7_397f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_397f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_397f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_397f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_397f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1565_c7_397f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_397f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_397f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_397f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_397f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1565_c7_397f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_397f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_397f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_397f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_397f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1565_c7_397f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_397f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_397f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_397f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_397f_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1565_c7_397f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_397f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_397f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_397f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_397f_return_output : signed(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1565_c7_397f]
signal tmp16_MUX_uxn_opcodes_h_l1565_c7_397f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1565_c7_397f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1565_c7_397f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1565_c7_397f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1568_c11_8d49]
signal BIN_OP_EQ_uxn_opcodes_h_l1568_c11_8d49_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1568_c11_8d49_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1568_c11_8d49_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1568_c7_5b8a]
signal t8_MUX_uxn_opcodes_h_l1568_c7_5b8a_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1568_c7_5b8a_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1568_c7_5b8a_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1568_c7_5b8a_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1568_c7_5b8a]
signal result_u16_value_MUX_uxn_opcodes_h_l1568_c7_5b8a_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1568_c7_5b8a_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1568_c7_5b8a_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1568_c7_5b8a_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1568_c7_5b8a]
signal result_u8_value_MUX_uxn_opcodes_h_l1568_c7_5b8a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1568_c7_5b8a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1568_c7_5b8a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1568_c7_5b8a_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1568_c7_5b8a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_5b8a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_5b8a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_5b8a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_5b8a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1568_c7_5b8a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_5b8a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_5b8a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_5b8a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_5b8a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1568_c7_5b8a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_5b8a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_5b8a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_5b8a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_5b8a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1568_c7_5b8a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_5b8a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_5b8a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_5b8a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_5b8a_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1568_c7_5b8a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_5b8a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_5b8a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_5b8a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_5b8a_return_output : signed(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1568_c7_5b8a]
signal tmp16_MUX_uxn_opcodes_h_l1568_c7_5b8a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1568_c7_5b8a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1568_c7_5b8a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1568_c7_5b8a_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1571_c30_b582]
signal sp_relative_shift_uxn_opcodes_h_l1571_c30_b582_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1571_c30_b582_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1571_c30_b582_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1571_c30_b582_return_output : signed(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1572_c22_9080]
signal BIN_OP_PLUS_uxn_opcodes_h_l1572_c22_9080_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1572_c22_9080_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1572_c22_9080_return_output : signed(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1574_c11_b388]
signal BIN_OP_EQ_uxn_opcodes_h_l1574_c11_b388_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1574_c11_b388_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1574_c11_b388_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1574_c7_7b8f]
signal result_u16_value_MUX_uxn_opcodes_h_l1574_c7_7b8f_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1574_c7_7b8f_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1574_c7_7b8f_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1574_c7_7b8f_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1574_c7_7b8f]
signal result_u8_value_MUX_uxn_opcodes_h_l1574_c7_7b8f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1574_c7_7b8f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1574_c7_7b8f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1574_c7_7b8f_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1574_c7_7b8f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_7b8f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_7b8f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_7b8f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_7b8f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1574_c7_7b8f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_7b8f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_7b8f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_7b8f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_7b8f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1574_c7_7b8f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_7b8f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_7b8f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_7b8f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_7b8f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1574_c7_7b8f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_7b8f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_7b8f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_7b8f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_7b8f_return_output : unsigned(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1574_c7_7b8f]
signal tmp16_MUX_uxn_opcodes_h_l1574_c7_7b8f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1574_c7_7b8f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1574_c7_7b8f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1574_c7_7b8f_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1576_c22_f50b]
signal BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_f50b_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_f50b_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_f50b_return_output : signed(17 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1576_c22_a3af]
signal BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_a3af_left : signed(17 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_a3af_right : signed(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_a3af_return_output : signed(18 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1578_c11_83c5]
signal BIN_OP_EQ_uxn_opcodes_h_l1578_c11_83c5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1578_c11_83c5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1578_c11_83c5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1578_c7_20df]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_20df_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_20df_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_20df_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_20df_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1578_c7_20df]
signal result_u8_value_MUX_uxn_opcodes_h_l1578_c7_20df_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1578_c7_20df_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1578_c7_20df_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1578_c7_20df_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1578_c7_20df]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_20df_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_20df_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_20df_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_20df_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1578_c7_20df]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_20df_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_20df_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_20df_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_20df_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1578_c7_20df]
signal tmp16_MUX_uxn_opcodes_h_l1578_c7_20df_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1578_c7_20df_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1578_c7_20df_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1578_c7_20df_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1580_c3_e57f]
signal CONST_SL_8_uxn_opcodes_h_l1580_c3_e57f_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1580_c3_e57f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1582_c11_bebf]
signal BIN_OP_EQ_uxn_opcodes_h_l1582_c11_bebf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1582_c11_bebf_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1582_c11_bebf_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1582_c7_1a34]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_1a34_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_1a34_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_1a34_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_1a34_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1582_c7_1a34]
signal result_u8_value_MUX_uxn_opcodes_h_l1582_c7_1a34_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1582_c7_1a34_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1582_c7_1a34_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1582_c7_1a34_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1582_c7_1a34]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_1a34_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_1a34_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_1a34_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_1a34_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1582_c7_1a34]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_1a34_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_1a34_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_1a34_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_1a34_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1582_c7_1a34]
signal tmp16_MUX_uxn_opcodes_h_l1582_c7_1a34_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1582_c7_1a34_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1582_c7_1a34_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1582_c7_1a34_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1583_c3_0ead]
signal BIN_OP_OR_uxn_opcodes_h_l1583_c3_0ead_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1583_c3_0ead_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1583_c3_0ead_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1588_c11_1af5]
signal BIN_OP_EQ_uxn_opcodes_h_l1588_c11_1af5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1588_c11_1af5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1588_c11_1af5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1588_c7_4f05]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_4f05_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_4f05_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_4f05_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_4f05_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1588_c7_4f05]
signal result_u8_value_MUX_uxn_opcodes_h_l1588_c7_4f05_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1588_c7_4f05_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1588_c7_4f05_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1588_c7_4f05_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1588_c7_4f05]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_4f05_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_4f05_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_4f05_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_4f05_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1588_c7_4f05]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_4f05_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_4f05_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_4f05_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_4f05_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1590_c31_2eec]
signal CONST_SR_8_uxn_opcodes_h_l1590_c31_2eec_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1590_c31_2eec_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1592_c11_978e]
signal BIN_OP_EQ_uxn_opcodes_h_l1592_c11_978e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1592_c11_978e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1592_c11_978e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1592_c7_d8a8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_d8a8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_d8a8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_d8a8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_d8a8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1592_c7_d8a8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_d8a8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_d8a8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_d8a8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_d8a8_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_a310( ref_toks_0 : opcode_result_t;
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
      base.u16_value := ref_toks_1;
      base.u8_value := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1560_c6_347f
BIN_OP_EQ_uxn_opcodes_h_l1560_c6_347f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1560_c6_347f_left,
BIN_OP_EQ_uxn_opcodes_h_l1560_c6_347f_right,
BIN_OP_EQ_uxn_opcodes_h_l1560_c6_347f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_ed86
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_ed86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_ed86_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_ed86_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_ed86_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_ed86_return_output);

-- t8_MUX_uxn_opcodes_h_l1560_c2_e4da
t8_MUX_uxn_opcodes_h_l1560_c2_e4da : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1560_c2_e4da_cond,
t8_MUX_uxn_opcodes_h_l1560_c2_e4da_iftrue,
t8_MUX_uxn_opcodes_h_l1560_c2_e4da_iffalse,
t8_MUX_uxn_opcodes_h_l1560_c2_e4da_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1560_c2_e4da
result_u16_value_MUX_uxn_opcodes_h_l1560_c2_e4da : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1560_c2_e4da_cond,
result_u16_value_MUX_uxn_opcodes_h_l1560_c2_e4da_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1560_c2_e4da_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1560_c2_e4da_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1560_c2_e4da
result_u8_value_MUX_uxn_opcodes_h_l1560_c2_e4da : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1560_c2_e4da_cond,
result_u8_value_MUX_uxn_opcodes_h_l1560_c2_e4da_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1560_c2_e4da_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1560_c2_e4da_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_e4da
result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_e4da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_e4da_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_e4da_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_e4da_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_e4da_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_e4da
result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_e4da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_e4da_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_e4da_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_e4da_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_e4da_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_e4da
result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_e4da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_e4da_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_e4da_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_e4da_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_e4da_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_e4da
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_e4da : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_e4da_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_e4da_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_e4da_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_e4da_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_e4da
result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_e4da : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_e4da_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_e4da_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_e4da_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_e4da_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1560_c2_e4da
tmp16_MUX_uxn_opcodes_h_l1560_c2_e4da : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1560_c2_e4da_cond,
tmp16_MUX_uxn_opcodes_h_l1560_c2_e4da_iftrue,
tmp16_MUX_uxn_opcodes_h_l1560_c2_e4da_iffalse,
tmp16_MUX_uxn_opcodes_h_l1560_c2_e4da_return_output);

-- printf_uxn_opcodes_h_l1561_c3_2fdd_uxn_opcodes_h_l1561_c3_2fdd
printf_uxn_opcodes_h_l1561_c3_2fdd_uxn_opcodes_h_l1561_c3_2fdd : entity work.printf_uxn_opcodes_h_l1561_c3_2fdd_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1561_c3_2fdd_uxn_opcodes_h_l1561_c3_2fdd_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1565_c11_6f1f
BIN_OP_EQ_uxn_opcodes_h_l1565_c11_6f1f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1565_c11_6f1f_left,
BIN_OP_EQ_uxn_opcodes_h_l1565_c11_6f1f_right,
BIN_OP_EQ_uxn_opcodes_h_l1565_c11_6f1f_return_output);

-- t8_MUX_uxn_opcodes_h_l1565_c7_397f
t8_MUX_uxn_opcodes_h_l1565_c7_397f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1565_c7_397f_cond,
t8_MUX_uxn_opcodes_h_l1565_c7_397f_iftrue,
t8_MUX_uxn_opcodes_h_l1565_c7_397f_iffalse,
t8_MUX_uxn_opcodes_h_l1565_c7_397f_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1565_c7_397f
result_u16_value_MUX_uxn_opcodes_h_l1565_c7_397f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1565_c7_397f_cond,
result_u16_value_MUX_uxn_opcodes_h_l1565_c7_397f_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1565_c7_397f_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1565_c7_397f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1565_c7_397f
result_u8_value_MUX_uxn_opcodes_h_l1565_c7_397f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1565_c7_397f_cond,
result_u8_value_MUX_uxn_opcodes_h_l1565_c7_397f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1565_c7_397f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1565_c7_397f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_397f
result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_397f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_397f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_397f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_397f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_397f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_397f
result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_397f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_397f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_397f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_397f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_397f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_397f
result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_397f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_397f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_397f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_397f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_397f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_397f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_397f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_397f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_397f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_397f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_397f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_397f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_397f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_397f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_397f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_397f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_397f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1565_c7_397f
tmp16_MUX_uxn_opcodes_h_l1565_c7_397f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1565_c7_397f_cond,
tmp16_MUX_uxn_opcodes_h_l1565_c7_397f_iftrue,
tmp16_MUX_uxn_opcodes_h_l1565_c7_397f_iffalse,
tmp16_MUX_uxn_opcodes_h_l1565_c7_397f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1568_c11_8d49
BIN_OP_EQ_uxn_opcodes_h_l1568_c11_8d49 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1568_c11_8d49_left,
BIN_OP_EQ_uxn_opcodes_h_l1568_c11_8d49_right,
BIN_OP_EQ_uxn_opcodes_h_l1568_c11_8d49_return_output);

-- t8_MUX_uxn_opcodes_h_l1568_c7_5b8a
t8_MUX_uxn_opcodes_h_l1568_c7_5b8a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1568_c7_5b8a_cond,
t8_MUX_uxn_opcodes_h_l1568_c7_5b8a_iftrue,
t8_MUX_uxn_opcodes_h_l1568_c7_5b8a_iffalse,
t8_MUX_uxn_opcodes_h_l1568_c7_5b8a_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1568_c7_5b8a
result_u16_value_MUX_uxn_opcodes_h_l1568_c7_5b8a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1568_c7_5b8a_cond,
result_u16_value_MUX_uxn_opcodes_h_l1568_c7_5b8a_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1568_c7_5b8a_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1568_c7_5b8a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1568_c7_5b8a
result_u8_value_MUX_uxn_opcodes_h_l1568_c7_5b8a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1568_c7_5b8a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1568_c7_5b8a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1568_c7_5b8a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1568_c7_5b8a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_5b8a
result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_5b8a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_5b8a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_5b8a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_5b8a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_5b8a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_5b8a
result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_5b8a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_5b8a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_5b8a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_5b8a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_5b8a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_5b8a
result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_5b8a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_5b8a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_5b8a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_5b8a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_5b8a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_5b8a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_5b8a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_5b8a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_5b8a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_5b8a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_5b8a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_5b8a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_5b8a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_5b8a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_5b8a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_5b8a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_5b8a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1568_c7_5b8a
tmp16_MUX_uxn_opcodes_h_l1568_c7_5b8a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1568_c7_5b8a_cond,
tmp16_MUX_uxn_opcodes_h_l1568_c7_5b8a_iftrue,
tmp16_MUX_uxn_opcodes_h_l1568_c7_5b8a_iffalse,
tmp16_MUX_uxn_opcodes_h_l1568_c7_5b8a_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1571_c30_b582
sp_relative_shift_uxn_opcodes_h_l1571_c30_b582 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1571_c30_b582_ins,
sp_relative_shift_uxn_opcodes_h_l1571_c30_b582_x,
sp_relative_shift_uxn_opcodes_h_l1571_c30_b582_y,
sp_relative_shift_uxn_opcodes_h_l1571_c30_b582_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1572_c22_9080
BIN_OP_PLUS_uxn_opcodes_h_l1572_c22_9080 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1572_c22_9080_left,
BIN_OP_PLUS_uxn_opcodes_h_l1572_c22_9080_right,
BIN_OP_PLUS_uxn_opcodes_h_l1572_c22_9080_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1574_c11_b388
BIN_OP_EQ_uxn_opcodes_h_l1574_c11_b388 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1574_c11_b388_left,
BIN_OP_EQ_uxn_opcodes_h_l1574_c11_b388_right,
BIN_OP_EQ_uxn_opcodes_h_l1574_c11_b388_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1574_c7_7b8f
result_u16_value_MUX_uxn_opcodes_h_l1574_c7_7b8f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1574_c7_7b8f_cond,
result_u16_value_MUX_uxn_opcodes_h_l1574_c7_7b8f_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1574_c7_7b8f_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1574_c7_7b8f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1574_c7_7b8f
result_u8_value_MUX_uxn_opcodes_h_l1574_c7_7b8f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1574_c7_7b8f_cond,
result_u8_value_MUX_uxn_opcodes_h_l1574_c7_7b8f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1574_c7_7b8f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1574_c7_7b8f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_7b8f
result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_7b8f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_7b8f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_7b8f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_7b8f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_7b8f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_7b8f
result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_7b8f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_7b8f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_7b8f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_7b8f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_7b8f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_7b8f
result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_7b8f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_7b8f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_7b8f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_7b8f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_7b8f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_7b8f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_7b8f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_7b8f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_7b8f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_7b8f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_7b8f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1574_c7_7b8f
tmp16_MUX_uxn_opcodes_h_l1574_c7_7b8f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1574_c7_7b8f_cond,
tmp16_MUX_uxn_opcodes_h_l1574_c7_7b8f_iftrue,
tmp16_MUX_uxn_opcodes_h_l1574_c7_7b8f_iffalse,
tmp16_MUX_uxn_opcodes_h_l1574_c7_7b8f_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_f50b
BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_f50b : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_f50b_left,
BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_f50b_right,
BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_f50b_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_a3af
BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_a3af : entity work.BIN_OP_PLUS_int18_t_int2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_a3af_left,
BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_a3af_right,
BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_a3af_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1578_c11_83c5
BIN_OP_EQ_uxn_opcodes_h_l1578_c11_83c5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1578_c11_83c5_left,
BIN_OP_EQ_uxn_opcodes_h_l1578_c11_83c5_right,
BIN_OP_EQ_uxn_opcodes_h_l1578_c11_83c5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_20df
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_20df : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_20df_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_20df_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_20df_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_20df_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1578_c7_20df
result_u8_value_MUX_uxn_opcodes_h_l1578_c7_20df : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1578_c7_20df_cond,
result_u8_value_MUX_uxn_opcodes_h_l1578_c7_20df_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1578_c7_20df_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1578_c7_20df_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_20df
result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_20df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_20df_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_20df_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_20df_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_20df_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_20df
result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_20df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_20df_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_20df_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_20df_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_20df_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1578_c7_20df
tmp16_MUX_uxn_opcodes_h_l1578_c7_20df : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1578_c7_20df_cond,
tmp16_MUX_uxn_opcodes_h_l1578_c7_20df_iftrue,
tmp16_MUX_uxn_opcodes_h_l1578_c7_20df_iffalse,
tmp16_MUX_uxn_opcodes_h_l1578_c7_20df_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1580_c3_e57f
CONST_SL_8_uxn_opcodes_h_l1580_c3_e57f : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1580_c3_e57f_x,
CONST_SL_8_uxn_opcodes_h_l1580_c3_e57f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1582_c11_bebf
BIN_OP_EQ_uxn_opcodes_h_l1582_c11_bebf : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1582_c11_bebf_left,
BIN_OP_EQ_uxn_opcodes_h_l1582_c11_bebf_right,
BIN_OP_EQ_uxn_opcodes_h_l1582_c11_bebf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_1a34
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_1a34 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_1a34_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_1a34_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_1a34_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_1a34_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1582_c7_1a34
result_u8_value_MUX_uxn_opcodes_h_l1582_c7_1a34 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1582_c7_1a34_cond,
result_u8_value_MUX_uxn_opcodes_h_l1582_c7_1a34_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1582_c7_1a34_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1582_c7_1a34_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_1a34
result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_1a34 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_1a34_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_1a34_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_1a34_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_1a34_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_1a34
result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_1a34 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_1a34_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_1a34_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_1a34_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_1a34_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1582_c7_1a34
tmp16_MUX_uxn_opcodes_h_l1582_c7_1a34 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1582_c7_1a34_cond,
tmp16_MUX_uxn_opcodes_h_l1582_c7_1a34_iftrue,
tmp16_MUX_uxn_opcodes_h_l1582_c7_1a34_iffalse,
tmp16_MUX_uxn_opcodes_h_l1582_c7_1a34_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1583_c3_0ead
BIN_OP_OR_uxn_opcodes_h_l1583_c3_0ead : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1583_c3_0ead_left,
BIN_OP_OR_uxn_opcodes_h_l1583_c3_0ead_right,
BIN_OP_OR_uxn_opcodes_h_l1583_c3_0ead_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1588_c11_1af5
BIN_OP_EQ_uxn_opcodes_h_l1588_c11_1af5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1588_c11_1af5_left,
BIN_OP_EQ_uxn_opcodes_h_l1588_c11_1af5_right,
BIN_OP_EQ_uxn_opcodes_h_l1588_c11_1af5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_4f05
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_4f05 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_4f05_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_4f05_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_4f05_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_4f05_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1588_c7_4f05
result_u8_value_MUX_uxn_opcodes_h_l1588_c7_4f05 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1588_c7_4f05_cond,
result_u8_value_MUX_uxn_opcodes_h_l1588_c7_4f05_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1588_c7_4f05_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1588_c7_4f05_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_4f05
result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_4f05 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_4f05_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_4f05_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_4f05_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_4f05_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_4f05
result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_4f05 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_4f05_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_4f05_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_4f05_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_4f05_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1590_c31_2eec
CONST_SR_8_uxn_opcodes_h_l1590_c31_2eec : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1590_c31_2eec_x,
CONST_SR_8_uxn_opcodes_h_l1590_c31_2eec_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1592_c11_978e
BIN_OP_EQ_uxn_opcodes_h_l1592_c11_978e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1592_c11_978e_left,
BIN_OP_EQ_uxn_opcodes_h_l1592_c11_978e_right,
BIN_OP_EQ_uxn_opcodes_h_l1592_c11_978e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_d8a8
result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_d8a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_d8a8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_d8a8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_d8a8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_d8a8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_d8a8
result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_d8a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_d8a8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_d8a8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_d8a8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_d8a8_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1560_c6_347f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_ed86_return_output,
 t8_MUX_uxn_opcodes_h_l1560_c2_e4da_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1560_c2_e4da_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1560_c2_e4da_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_e4da_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_e4da_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_e4da_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_e4da_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_e4da_return_output,
 tmp16_MUX_uxn_opcodes_h_l1560_c2_e4da_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1565_c11_6f1f_return_output,
 t8_MUX_uxn_opcodes_h_l1565_c7_397f_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1565_c7_397f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1565_c7_397f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_397f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_397f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_397f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_397f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_397f_return_output,
 tmp16_MUX_uxn_opcodes_h_l1565_c7_397f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1568_c11_8d49_return_output,
 t8_MUX_uxn_opcodes_h_l1568_c7_5b8a_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1568_c7_5b8a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1568_c7_5b8a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_5b8a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_5b8a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_5b8a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_5b8a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_5b8a_return_output,
 tmp16_MUX_uxn_opcodes_h_l1568_c7_5b8a_return_output,
 sp_relative_shift_uxn_opcodes_h_l1571_c30_b582_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1572_c22_9080_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1574_c11_b388_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1574_c7_7b8f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1574_c7_7b8f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_7b8f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_7b8f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_7b8f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_7b8f_return_output,
 tmp16_MUX_uxn_opcodes_h_l1574_c7_7b8f_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_f50b_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_a3af_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1578_c11_83c5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_20df_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1578_c7_20df_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_20df_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_20df_return_output,
 tmp16_MUX_uxn_opcodes_h_l1578_c7_20df_return_output,
 CONST_SL_8_uxn_opcodes_h_l1580_c3_e57f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1582_c11_bebf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_1a34_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1582_c7_1a34_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_1a34_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_1a34_return_output,
 tmp16_MUX_uxn_opcodes_h_l1582_c7_1a34_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1583_c3_0ead_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1588_c11_1af5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_4f05_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1588_c7_4f05_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_4f05_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_4f05_return_output,
 CONST_SR_8_uxn_opcodes_h_l1590_c31_2eec_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1592_c11_978e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_d8a8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_d8a8_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_347f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_347f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_347f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_ed86_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_ed86_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_ed86_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_ed86_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1560_c2_e4da_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1560_c2_e4da_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1565_c7_397f_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1560_c2_e4da_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1560_c2_e4da_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c2_e4da_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c2_e4da_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1565_c7_397f_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c2_e4da_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c2_e4da_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c2_e4da_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c2_e4da_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1565_c7_397f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c2_e4da_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c2_e4da_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_e4da_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_e4da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_397f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_e4da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_e4da_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_e4da_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_e4da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_397f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_e4da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_e4da_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_e4da_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_e4da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_397f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_e4da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_e4da_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_e4da_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1562_c3_a38a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_e4da_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_397f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_e4da_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_e4da_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_e4da_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_e4da_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_397f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_e4da_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_e4da_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1560_c2_e4da_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1560_c2_e4da_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1565_c7_397f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1560_c2_e4da_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1560_c2_e4da_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1561_c3_2fdd_uxn_opcodes_h_l1561_c3_2fdd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_6f1f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_6f1f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_6f1f_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1565_c7_397f_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1565_c7_397f_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1568_c7_5b8a_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1565_c7_397f_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1565_c7_397f_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1565_c7_397f_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1568_c7_5b8a_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1565_c7_397f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1565_c7_397f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1565_c7_397f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1568_c7_5b8a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1565_c7_397f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_397f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_397f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_5b8a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_397f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_397f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_397f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_5b8a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_397f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_397f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_397f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_5b8a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_397f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_397f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1566_c3_d38a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_397f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_5b8a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_397f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_397f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_397f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_5b8a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_397f_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1565_c7_397f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1565_c7_397f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1568_c7_5b8a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1565_c7_397f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_8d49_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_8d49_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_8d49_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1568_c7_5b8a_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1568_c7_5b8a_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1568_c7_5b8a_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1568_c7_5b8a_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1572_c3_a01c : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1568_c7_5b8a_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_7b8f_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1568_c7_5b8a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1568_c7_5b8a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1568_c7_5b8a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_7b8f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1568_c7_5b8a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_5b8a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_5b8a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_7b8f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_5b8a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_5b8a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_5b8a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_7b8f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_5b8a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_5b8a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_5b8a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_7b8f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_5b8a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_5b8a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_5b8a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_7b8f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_5b8a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_5b8a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_5b8a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_5b8a_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1568_c7_5b8a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1568_c7_5b8a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1574_c7_7b8f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1568_c7_5b8a_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1571_c30_b582_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1571_c30_b582_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1571_c30_b582_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1571_c30_b582_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1572_c22_9080_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l1572_c27_42cf_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1572_c22_9080_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1572_c22_9080_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_b388_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_b388_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_b388_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_7b8f_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1576_c3_358f : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_7b8f_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_7b8f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_7b8f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_7b8f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_20df_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_7b8f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_7b8f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_7b8f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_7b8f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_7b8f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_7b8f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_20df_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_7b8f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_7b8f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_7b8f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_20df_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_7b8f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_7b8f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_7b8f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_20df_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_7b8f_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1574_c7_7b8f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1574_c7_7b8f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1578_c7_20df_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1574_c7_7b8f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_f50b_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l1576_c27_b821_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_f50b_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_f50b_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_a3af_left : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_a3af_right : signed(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_a3af_return_output : signed(18 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_83c5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_83c5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_83c5_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_20df_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_20df_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_1a34_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_20df_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_20df_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_20df_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1582_c7_1a34_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_20df_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_20df_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_20df_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_1a34_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_20df_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_20df_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_20df_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_1a34_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_20df_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1578_c7_20df_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1578_c7_20df_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1582_c7_1a34_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1578_c7_20df_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1580_c3_e57f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1580_c3_e57f_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_bebf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_bebf_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_bebf_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_1a34_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1585_c3_b65b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_1a34_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_4f05_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_1a34_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1582_c7_1a34_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1582_c7_1a34_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1588_c7_4f05_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1582_c7_1a34_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_1a34_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_1a34_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_4f05_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_1a34_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_1a34_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_1a34_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_4f05_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_1a34_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1582_c7_1a34_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1582_c7_1a34_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1582_c7_1a34_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1583_c3_0ead_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1583_c3_0ead_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1583_c3_0ead_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1586_c21_d30b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1588_c11_1af5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1588_c11_1af5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1588_c11_1af5_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_4f05_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1589_c3_3f81 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_4f05_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_4f05_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1588_c7_4f05_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1588_c7_4f05_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1588_c7_4f05_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_4f05_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_4f05_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_d8a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_4f05_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_4f05_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_4f05_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_d8a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_4f05_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1590_c31_2eec_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1590_c31_2eec_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1590_c21_6f30_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1592_c11_978e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1592_c11_978e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1592_c11_978e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_d8a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_d8a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_d8a8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_d8a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_d8a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_d8a8_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1560_l1574_l1565_DUPLICATE_c51e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1568_l1565_l1560_l1588_l1578_l1574_DUPLICATE_23c1_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1560_l1574_l1565_DUPLICATE_95a2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1568_l1565_l1592_l1560_l1588_l1578_l1574_DUPLICATE_6ea8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1568_l1560_l1565_DUPLICATE_5966_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1568_l1565_l1592_l1588_l1582_l1578_l1574_DUPLICATE_0f8b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1578_l1568_l1574_l1588_DUPLICATE_9c9b_return_output : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1579_l1583_DUPLICATE_5aac_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a310_uxn_opcodes_h_l1597_l1555_DUPLICATE_fb85_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_6f1f_right := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_ed86_iffalse := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_d8a8_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1588_c11_1af5_right := to_unsigned(6, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l1571_c30_b582_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_83c5_right := to_unsigned(4, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_1a34_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_bebf_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1562_c3_a38a := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_e4da_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1562_c3_a38a;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_5b8a_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1592_c11_978e_right := to_unsigned(7, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_7b8f_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_e4da_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1571_c30_b582_y := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1566_c3_d38a := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_397f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1566_c3_d38a;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1589_c3_3f81 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_4f05_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1589_c3_3f81;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_8d49_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1585_c3_b65b := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_1a34_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1585_c3_b65b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_b388_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_347f_right := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_a3af_right := signed(std_logic_vector(resize(to_unsigned(1, 1), 2)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_d8a8_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_ed86_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1571_c30_b582_ins := VAR_ins;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1572_c22_9080_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_f50b_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_347f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_6f1f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_8d49_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_b388_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_83c5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_bebf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1588_c11_1af5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1592_c11_978e_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l1568_c7_5b8a_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1560_c2_e4da_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1565_c7_397f_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1568_c7_5b8a_iffalse := t8;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1583_c3_0ead_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1590_c31_2eec_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1560_c2_e4da_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1565_c7_397f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1568_c7_5b8a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1574_c7_7b8f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1582_c7_1a34_iffalse := tmp16;
     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1560_l1574_l1565_DUPLICATE_c51e LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1560_l1574_l1565_DUPLICATE_c51e_return_output := result.u16_value;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1579_l1583_DUPLICATE_5aac LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1579_l1583_DUPLICATE_5aac_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1588_c11_1af5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1588_c11_1af5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1588_c11_1af5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1588_c11_1af5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1588_c11_1af5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1588_c11_1af5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1588_c11_1af5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1582_c11_bebf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1582_c11_bebf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_bebf_left;
     BIN_OP_EQ_uxn_opcodes_h_l1582_c11_bebf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_bebf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_bebf_return_output := BIN_OP_EQ_uxn_opcodes_h_l1582_c11_bebf_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1568_l1565_l1592_l1560_l1588_l1578_l1574_DUPLICATE_6ea8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1568_l1565_l1592_l1560_l1588_l1578_l1574_DUPLICATE_6ea8_return_output := result.is_stack_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1568_l1560_l1565_DUPLICATE_5966 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1568_l1560_l1565_DUPLICATE_5966_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1568_l1565_l1592_l1588_l1582_l1578_l1574_DUPLICATE_0f8b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1568_l1565_l1592_l1588_l1582_l1578_l1574_DUPLICATE_0f8b_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1560_c6_347f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1560_c6_347f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_347f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1560_c6_347f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_347f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_347f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1560_c6_347f_return_output;

     -- CAST_TO_int8_t[uxn_opcodes_h_l1576_c27_b821] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l1576_c27_b821_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- BIN_OP_EQ[uxn_opcodes_h_l1568_c11_8d49] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1568_c11_8d49_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_8d49_left;
     BIN_OP_EQ_uxn_opcodes_h_l1568_c11_8d49_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_8d49_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_8d49_return_output := BIN_OP_EQ_uxn_opcodes_h_l1568_c11_8d49_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1571_c30_b582] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1571_c30_b582_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1571_c30_b582_ins;
     sp_relative_shift_uxn_opcodes_h_l1571_c30_b582_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1571_c30_b582_x;
     sp_relative_shift_uxn_opcodes_h_l1571_c30_b582_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1571_c30_b582_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1571_c30_b582_return_output := sp_relative_shift_uxn_opcodes_h_l1571_c30_b582_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1590_c31_2eec] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1590_c31_2eec_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1590_c31_2eec_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1590_c31_2eec_return_output := CONST_SR_8_uxn_opcodes_h_l1590_c31_2eec_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1560_l1574_l1565_DUPLICATE_95a2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1560_l1574_l1565_DUPLICATE_95a2_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1565_c11_6f1f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1565_c11_6f1f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_6f1f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1565_c11_6f1f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_6f1f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_6f1f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1565_c11_6f1f_return_output;

     -- CAST_TO_int8_t[uxn_opcodes_h_l1572_c27_42cf] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l1572_c27_42cf_return_output := CAST_TO_int8_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1574_c11_b388] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1574_c11_b388_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_b388_left;
     BIN_OP_EQ_uxn_opcodes_h_l1574_c11_b388_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_b388_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_b388_return_output := BIN_OP_EQ_uxn_opcodes_h_l1574_c11_b388_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1578_c11_83c5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1578_c11_83c5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_83c5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1578_c11_83c5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_83c5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_83c5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1578_c11_83c5_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1568_l1565_l1560_l1588_l1578_l1574_DUPLICATE_23c1 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1568_l1565_l1560_l1588_l1578_l1574_DUPLICATE_23c1_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1592_c11_978e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1592_c11_978e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1592_c11_978e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1592_c11_978e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1592_c11_978e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1592_c11_978e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1592_c11_978e_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1578_l1568_l1574_l1588_DUPLICATE_9c9b LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1578_l1568_l1574_l1588_DUPLICATE_9c9b_return_output := result.stack_address_sp_offset;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_ed86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_347f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_e4da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_347f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_e4da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_347f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_e4da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_347f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_e4da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_347f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_e4da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_347f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c2_e4da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_347f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c2_e4da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_347f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1560_c2_e4da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_347f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1560_c2_e4da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_347f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_397f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_6f1f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_397f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_6f1f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_397f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_6f1f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_397f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_6f1f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_397f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_6f1f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1565_c7_397f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_6f1f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1565_c7_397f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_6f1f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1565_c7_397f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_6f1f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1565_c7_397f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_6f1f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_5b8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_8d49_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_5b8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_8d49_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_5b8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_8d49_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_5b8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_8d49_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_5b8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_8d49_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1568_c7_5b8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_8d49_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1568_c7_5b8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_8d49_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1568_c7_5b8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_8d49_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1568_c7_5b8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_8d49_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_7b8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_b388_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_7b8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_b388_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_7b8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_b388_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_7b8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_b388_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_7b8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_b388_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_7b8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_b388_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1574_c7_7b8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_b388_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_20df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_83c5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_20df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_83c5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_20df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_83c5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_20df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_83c5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1578_c7_20df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_83c5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_1a34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_bebf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_1a34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_bebf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_1a34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_bebf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1582_c7_1a34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_bebf_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1582_c7_1a34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_bebf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_4f05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1588_c11_1af5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_4f05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1588_c11_1af5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_4f05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1588_c11_1af5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1588_c7_4f05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1588_c11_1af5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_d8a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1592_c11_978e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_d8a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1592_c11_978e_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1572_c22_9080_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l1572_c27_42cf_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_f50b_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l1576_c27_b821_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1583_c3_0ead_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1579_l1583_DUPLICATE_5aac_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1580_c3_e57f_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1579_l1583_DUPLICATE_5aac_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_e4da_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1568_l1560_l1565_DUPLICATE_5966_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_397f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1568_l1560_l1565_DUPLICATE_5966_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_5b8a_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1568_l1560_l1565_DUPLICATE_5966_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c2_e4da_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1560_l1574_l1565_DUPLICATE_c51e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1565_c7_397f_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1560_l1574_l1565_DUPLICATE_c51e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_7b8f_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1560_l1574_l1565_DUPLICATE_c51e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_397f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1568_l1565_l1592_l1588_l1582_l1578_l1574_DUPLICATE_0f8b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_5b8a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1568_l1565_l1592_l1588_l1582_l1578_l1574_DUPLICATE_0f8b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_7b8f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1568_l1565_l1592_l1588_l1582_l1578_l1574_DUPLICATE_0f8b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_20df_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1568_l1565_l1592_l1588_l1582_l1578_l1574_DUPLICATE_0f8b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_1a34_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1568_l1565_l1592_l1588_l1582_l1578_l1574_DUPLICATE_0f8b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_4f05_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1568_l1565_l1592_l1588_l1582_l1578_l1574_DUPLICATE_0f8b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_d8a8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1568_l1565_l1592_l1588_l1582_l1578_l1574_DUPLICATE_0f8b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_e4da_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1560_l1574_l1565_DUPLICATE_95a2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_397f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1560_l1574_l1565_DUPLICATE_95a2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_7b8f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1560_l1574_l1565_DUPLICATE_95a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_e4da_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1568_l1565_l1592_l1560_l1588_l1578_l1574_DUPLICATE_6ea8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_397f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1568_l1565_l1592_l1560_l1588_l1578_l1574_DUPLICATE_6ea8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_5b8a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1568_l1565_l1592_l1560_l1588_l1578_l1574_DUPLICATE_6ea8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_7b8f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1568_l1565_l1592_l1560_l1588_l1578_l1574_DUPLICATE_6ea8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_20df_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1568_l1565_l1592_l1560_l1588_l1578_l1574_DUPLICATE_6ea8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_4f05_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1568_l1565_l1592_l1560_l1588_l1578_l1574_DUPLICATE_6ea8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_d8a8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1568_l1565_l1592_l1560_l1588_l1578_l1574_DUPLICATE_6ea8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_5b8a_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1578_l1568_l1574_l1588_DUPLICATE_9c9b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_7b8f_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1578_l1568_l1574_l1588_DUPLICATE_9c9b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_20df_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1578_l1568_l1574_l1588_DUPLICATE_9c9b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_4f05_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1578_l1568_l1574_l1588_DUPLICATE_9c9b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c2_e4da_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1568_l1565_l1560_l1588_l1578_l1574_DUPLICATE_23c1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1565_c7_397f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1568_l1565_l1560_l1588_l1578_l1574_DUPLICATE_23c1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1568_c7_5b8a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1568_l1565_l1560_l1588_l1578_l1574_DUPLICATE_23c1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_7b8f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1568_l1565_l1560_l1588_l1578_l1574_DUPLICATE_23c1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_20df_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1568_l1565_l1560_l1588_l1578_l1574_DUPLICATE_23c1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1588_c7_4f05_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1568_l1565_l1560_l1588_l1578_l1574_DUPLICATE_23c1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_5b8a_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1571_c30_b582_return_output;
     -- CONST_SL_8[uxn_opcodes_h_l1580_c3_e57f] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1580_c3_e57f_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1580_c3_e57f_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1580_c3_e57f_return_output := CONST_SL_8_uxn_opcodes_h_l1580_c3_e57f_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1576_c22_f50b] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_f50b_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_f50b_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_f50b_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_f50b_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_f50b_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_f50b_return_output;

     -- t8_MUX[uxn_opcodes_h_l1568_c7_5b8a] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1568_c7_5b8a_cond <= VAR_t8_MUX_uxn_opcodes_h_l1568_c7_5b8a_cond;
     t8_MUX_uxn_opcodes_h_l1568_c7_5b8a_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1568_c7_5b8a_iftrue;
     t8_MUX_uxn_opcodes_h_l1568_c7_5b8a_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1568_c7_5b8a_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1568_c7_5b8a_return_output := t8_MUX_uxn_opcodes_h_l1568_c7_5b8a_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1583_c3_0ead] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1583_c3_0ead_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1583_c3_0ead_left;
     BIN_OP_OR_uxn_opcodes_h_l1583_c3_0ead_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1583_c3_0ead_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1583_c3_0ead_return_output := BIN_OP_OR_uxn_opcodes_h_l1583_c3_0ead_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1568_c7_5b8a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_5b8a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_5b8a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_5b8a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_5b8a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_5b8a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_5b8a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_5b8a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_5b8a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1592_c7_d8a8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_d8a8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_d8a8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_d8a8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_d8a8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_d8a8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_d8a8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_d8a8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_d8a8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1592_c7_d8a8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_d8a8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_d8a8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_d8a8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_d8a8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_d8a8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_d8a8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_d8a8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_d8a8_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1560_c1_ed86] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_ed86_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_ed86_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_ed86_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_ed86_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_ed86_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_ed86_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_ed86_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_ed86_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1590_c21_6f30] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1590_c21_6f30_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1590_c31_2eec_return_output);

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1574_c7_7b8f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_7b8f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_7b8f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_7b8f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_7b8f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_7b8f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_7b8f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_7b8f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_7b8f_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1572_c22_9080] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1572_c22_9080_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1572_c22_9080_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1572_c22_9080_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1572_c22_9080_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1572_c22_9080_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1572_c22_9080_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1588_c7_4f05] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_4f05_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_4f05_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_4f05_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_4f05_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_4f05_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_4f05_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_4f05_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_4f05_return_output;

     -- Submodule level 2
     VAR_tmp16_MUX_uxn_opcodes_h_l1582_c7_1a34_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1583_c3_0ead_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l1572_c3_a01c := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1572_c22_9080_return_output)),16);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_a3af_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_f50b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1588_c7_4f05_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1590_c21_6f30_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1578_c7_20df_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1580_c3_e57f_return_output;
     VAR_printf_uxn_opcodes_h_l1561_c3_2fdd_uxn_opcodes_h_l1561_c3_2fdd_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_ed86_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_4f05_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_d8a8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_5b8a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_7b8f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_4f05_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_d8a8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_397f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_5b8a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_1a34_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_4f05_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1565_c7_397f_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1568_c7_5b8a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1568_c7_5b8a_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1572_c3_a01c;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l1586_c21_d30b] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1586_c21_d30b_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l1583_c3_0ead_return_output);

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1565_c7_397f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_397f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_397f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_397f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_397f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_397f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_397f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_397f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_397f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1588_c7_4f05] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_4f05_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_4f05_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_4f05_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_4f05_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_4f05_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_4f05_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_4f05_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_4f05_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1568_c7_5b8a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_5b8a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_5b8a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_5b8a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_5b8a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_5b8a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_5b8a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_5b8a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_5b8a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1582_c7_1a34] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_1a34_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_1a34_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_1a34_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_1a34_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_1a34_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_1a34_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_1a34_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_1a34_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1588_c7_4f05] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_4f05_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_4f05_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_4f05_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_4f05_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_4f05_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_4f05_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_4f05_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_4f05_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1582_c7_1a34] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1582_c7_1a34_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1582_c7_1a34_cond;
     tmp16_MUX_uxn_opcodes_h_l1582_c7_1a34_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1582_c7_1a34_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1582_c7_1a34_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1582_c7_1a34_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1582_c7_1a34_return_output := tmp16_MUX_uxn_opcodes_h_l1582_c7_1a34_return_output;

     -- t8_MUX[uxn_opcodes_h_l1565_c7_397f] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1565_c7_397f_cond <= VAR_t8_MUX_uxn_opcodes_h_l1565_c7_397f_cond;
     t8_MUX_uxn_opcodes_h_l1565_c7_397f_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1565_c7_397f_iftrue;
     t8_MUX_uxn_opcodes_h_l1565_c7_397f_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1565_c7_397f_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1565_c7_397f_return_output := t8_MUX_uxn_opcodes_h_l1565_c7_397f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1588_c7_4f05] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1588_c7_4f05_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1588_c7_4f05_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1588_c7_4f05_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1588_c7_4f05_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1588_c7_4f05_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1588_c7_4f05_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1588_c7_4f05_return_output := result_u8_value_MUX_uxn_opcodes_h_l1588_c7_4f05_return_output;

     -- printf_uxn_opcodes_h_l1561_c3_2fdd[uxn_opcodes_h_l1561_c3_2fdd] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1561_c3_2fdd_uxn_opcodes_h_l1561_c3_2fdd_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1561_c3_2fdd_uxn_opcodes_h_l1561_c3_2fdd_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- BIN_OP_PLUS[uxn_opcodes_h_l1576_c22_a3af] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_a3af_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_a3af_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_a3af_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_a3af_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_a3af_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_a3af_return_output;

     -- Submodule level 3
     VAR_result_u16_value_uxn_opcodes_h_l1576_c3_358f := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_a3af_return_output)),16);
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1582_c7_1a34_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1586_c21_d30b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_1a34_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_4f05_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_397f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_5b8a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_1a34_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_4f05_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_e4da_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_397f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_20df_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_1a34_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1582_c7_1a34_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1588_c7_4f05_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1560_c2_e4da_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1565_c7_397f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1578_c7_20df_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1582_c7_1a34_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_7b8f_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1576_c3_358f;
     -- tmp16_MUX[uxn_opcodes_h_l1578_c7_20df] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1578_c7_20df_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1578_c7_20df_cond;
     tmp16_MUX_uxn_opcodes_h_l1578_c7_20df_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1578_c7_20df_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1578_c7_20df_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1578_c7_20df_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1578_c7_20df_return_output := tmp16_MUX_uxn_opcodes_h_l1578_c7_20df_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1574_c7_7b8f] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1574_c7_7b8f_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_7b8f_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1574_c7_7b8f_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_7b8f_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1574_c7_7b8f_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_7b8f_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_7b8f_return_output := result_u16_value_MUX_uxn_opcodes_h_l1574_c7_7b8f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1578_c7_20df] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_20df_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_20df_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_20df_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_20df_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_20df_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_20df_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_20df_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_20df_return_output;

     -- t8_MUX[uxn_opcodes_h_l1560_c2_e4da] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1560_c2_e4da_cond <= VAR_t8_MUX_uxn_opcodes_h_l1560_c2_e4da_cond;
     t8_MUX_uxn_opcodes_h_l1560_c2_e4da_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1560_c2_e4da_iftrue;
     t8_MUX_uxn_opcodes_h_l1560_c2_e4da_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1560_c2_e4da_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1560_c2_e4da_return_output := t8_MUX_uxn_opcodes_h_l1560_c2_e4da_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1560_c2_e4da] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_e4da_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_e4da_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_e4da_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_e4da_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_e4da_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_e4da_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_e4da_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_e4da_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1582_c7_1a34] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_1a34_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_1a34_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_1a34_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_1a34_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_1a34_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_1a34_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_1a34_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_1a34_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1582_c7_1a34] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_1a34_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_1a34_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_1a34_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_1a34_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_1a34_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_1a34_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_1a34_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_1a34_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1565_c7_397f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_397f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_397f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_397f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_397f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_397f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_397f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_397f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_397f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1582_c7_1a34] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1582_c7_1a34_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1582_c7_1a34_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1582_c7_1a34_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1582_c7_1a34_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1582_c7_1a34_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1582_c7_1a34_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1582_c7_1a34_return_output := result_u8_value_MUX_uxn_opcodes_h_l1582_c7_1a34_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_20df_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_1a34_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_e4da_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_397f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_20df_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_1a34_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_7b8f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_20df_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1568_c7_5b8a_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_7b8f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_20df_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1582_c7_1a34_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1560_c2_e4da_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1574_c7_7b8f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1578_c7_20df_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1574_c7_7b8f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_7b8f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_7b8f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_7b8f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_7b8f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_7b8f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_7b8f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_7b8f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_7b8f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1574_c7_7b8f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1574_c7_7b8f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1574_c7_7b8f_cond;
     tmp16_MUX_uxn_opcodes_h_l1574_c7_7b8f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1574_c7_7b8f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1574_c7_7b8f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1574_c7_7b8f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1574_c7_7b8f_return_output := tmp16_MUX_uxn_opcodes_h_l1574_c7_7b8f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1560_c2_e4da] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_e4da_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_e4da_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_e4da_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_e4da_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_e4da_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_e4da_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_e4da_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_e4da_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1578_c7_20df] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_20df_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_20df_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_20df_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_20df_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_20df_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_20df_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_20df_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_20df_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1578_c7_20df] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_20df_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_20df_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_20df_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_20df_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_20df_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_20df_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_20df_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_20df_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1578_c7_20df] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1578_c7_20df_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_20df_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1578_c7_20df_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_20df_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1578_c7_20df_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_20df_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_20df_return_output := result_u8_value_MUX_uxn_opcodes_h_l1578_c7_20df_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1568_c7_5b8a] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1568_c7_5b8a_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1568_c7_5b8a_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1568_c7_5b8a_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1568_c7_5b8a_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1568_c7_5b8a_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1568_c7_5b8a_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1568_c7_5b8a_return_output := result_u16_value_MUX_uxn_opcodes_h_l1568_c7_5b8a_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_7b8f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_20df_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_7b8f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_20df_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_5b8a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_7b8f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1565_c7_397f_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1568_c7_5b8a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_7b8f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_20df_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1568_c7_5b8a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1574_c7_7b8f_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1568_c7_5b8a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_5b8a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_5b8a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_5b8a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_5b8a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_5b8a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_5b8a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_5b8a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_5b8a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1574_c7_7b8f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1574_c7_7b8f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_7b8f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1574_c7_7b8f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_7b8f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1574_c7_7b8f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_7b8f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_7b8f_return_output := result_u8_value_MUX_uxn_opcodes_h_l1574_c7_7b8f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1574_c7_7b8f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_7b8f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_7b8f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_7b8f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_7b8f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_7b8f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_7b8f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_7b8f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_7b8f_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1565_c7_397f] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1565_c7_397f_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1565_c7_397f_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1565_c7_397f_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1565_c7_397f_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1565_c7_397f_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1565_c7_397f_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1565_c7_397f_return_output := result_u16_value_MUX_uxn_opcodes_h_l1565_c7_397f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1568_c7_5b8a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1568_c7_5b8a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1568_c7_5b8a_cond;
     tmp16_MUX_uxn_opcodes_h_l1568_c7_5b8a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1568_c7_5b8a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1568_c7_5b8a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1568_c7_5b8a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1568_c7_5b8a_return_output := tmp16_MUX_uxn_opcodes_h_l1568_c7_5b8a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1574_c7_7b8f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_7b8f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_7b8f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_7b8f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_7b8f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_7b8f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_7b8f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_7b8f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_7b8f_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_5b8a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_7b8f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_5b8a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_7b8f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_397f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_5b8a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c2_e4da_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1565_c7_397f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1568_c7_5b8a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_7b8f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1565_c7_397f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1568_c7_5b8a_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1568_c7_5b8a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_5b8a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_5b8a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_5b8a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_5b8a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_5b8a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_5b8a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_5b8a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_5b8a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1565_c7_397f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_397f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_397f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_397f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_397f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_397f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_397f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_397f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_397f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1568_c7_5b8a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1568_c7_5b8a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1568_c7_5b8a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1568_c7_5b8a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1568_c7_5b8a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1568_c7_5b8a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1568_c7_5b8a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1568_c7_5b8a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1568_c7_5b8a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1565_c7_397f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1565_c7_397f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1565_c7_397f_cond;
     tmp16_MUX_uxn_opcodes_h_l1565_c7_397f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1565_c7_397f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1565_c7_397f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1565_c7_397f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1565_c7_397f_return_output := tmp16_MUX_uxn_opcodes_h_l1565_c7_397f_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1560_c2_e4da] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1560_c2_e4da_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c2_e4da_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1560_c2_e4da_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c2_e4da_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1560_c2_e4da_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c2_e4da_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c2_e4da_return_output := result_u16_value_MUX_uxn_opcodes_h_l1560_c2_e4da_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1568_c7_5b8a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_5b8a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_5b8a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_5b8a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_5b8a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_5b8a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_5b8a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_5b8a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_5b8a_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_397f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_5b8a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_397f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_5b8a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_e4da_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_397f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1565_c7_397f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1568_c7_5b8a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1560_c2_e4da_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1565_c7_397f_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1560_c2_e4da] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1560_c2_e4da_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1560_c2_e4da_cond;
     tmp16_MUX_uxn_opcodes_h_l1560_c2_e4da_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1560_c2_e4da_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1560_c2_e4da_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1560_c2_e4da_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1560_c2_e4da_return_output := tmp16_MUX_uxn_opcodes_h_l1560_c2_e4da_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1565_c7_397f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_397f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_397f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_397f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_397f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_397f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_397f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_397f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_397f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1565_c7_397f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1565_c7_397f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1565_c7_397f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1565_c7_397f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1565_c7_397f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1565_c7_397f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1565_c7_397f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1565_c7_397f_return_output := result_u8_value_MUX_uxn_opcodes_h_l1565_c7_397f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1565_c7_397f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_397f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_397f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_397f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_397f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_397f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_397f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_397f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_397f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1560_c2_e4da] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_e4da_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_e4da_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_e4da_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_e4da_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_e4da_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_e4da_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_e4da_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_e4da_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_e4da_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_397f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_e4da_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_397f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c2_e4da_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1565_c7_397f_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1560_c2_e4da_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1560_c2_e4da] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_e4da_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_e4da_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_e4da_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_e4da_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_e4da_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_e4da_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_e4da_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_e4da_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1560_c2_e4da] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1560_c2_e4da_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c2_e4da_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1560_c2_e4da_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c2_e4da_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1560_c2_e4da_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c2_e4da_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c2_e4da_return_output := result_u8_value_MUX_uxn_opcodes_h_l1560_c2_e4da_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1560_c2_e4da] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_e4da_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_e4da_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_e4da_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_e4da_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_e4da_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_e4da_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_e4da_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_e4da_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_a310_uxn_opcodes_h_l1597_l1555_DUPLICATE_fb85 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a310_uxn_opcodes_h_l1597_l1555_DUPLICATE_fb85_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_a310(
     result,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c2_e4da_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c2_e4da_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_e4da_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_e4da_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_e4da_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_e4da_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_e4da_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a310_uxn_opcodes_h_l1597_l1555_DUPLICATE_fb85_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a310_uxn_opcodes_h_l1597_l1555_DUPLICATE_fb85_return_output;
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
