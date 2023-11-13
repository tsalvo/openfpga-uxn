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
-- Submodules: 71
entity ldz2_0CLK_d662d237 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ldz2_0CLK_d662d237;
architecture arch of ldz2_0CLK_d662d237 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1405_c6_98bc]
signal BIN_OP_EQ_uxn_opcodes_h_l1405_c6_98bc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1405_c6_98bc_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1405_c6_98bc_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1405_c1_65ab]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_65ab_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_65ab_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_65ab_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_65ab_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1405_c2_f4a1]
signal t8_MUX_uxn_opcodes_h_l1405_c2_f4a1_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1405_c2_f4a1_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1405_c2_f4a1_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1405_c2_f4a1_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1405_c2_f4a1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_f4a1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_f4a1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_f4a1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_f4a1_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1405_c2_f4a1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_f4a1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_f4a1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_f4a1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_f4a1_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1405_c2_f4a1]
signal result_u16_value_MUX_uxn_opcodes_h_l1405_c2_f4a1_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1405_c2_f4a1_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1405_c2_f4a1_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1405_c2_f4a1_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1405_c2_f4a1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_f4a1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_f4a1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_f4a1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_f4a1_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1405_c2_f4a1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_f4a1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_f4a1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_f4a1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_f4a1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1405_c2_f4a1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_f4a1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_f4a1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_f4a1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_f4a1_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1405_c2_f4a1]
signal result_u8_value_MUX_uxn_opcodes_h_l1405_c2_f4a1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1405_c2_f4a1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1405_c2_f4a1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1405_c2_f4a1_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1405_c2_f4a1]
signal tmp16_MUX_uxn_opcodes_h_l1405_c2_f4a1_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1405_c2_f4a1_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1405_c2_f4a1_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1405_c2_f4a1_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1406_c3_7e5a[uxn_opcodes_h_l1406_c3_7e5a]
signal printf_uxn_opcodes_h_l1406_c3_7e5a_uxn_opcodes_h_l1406_c3_7e5a_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1410_c11_0abc]
signal BIN_OP_EQ_uxn_opcodes_h_l1410_c11_0abc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1410_c11_0abc_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1410_c11_0abc_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1410_c7_6431]
signal t8_MUX_uxn_opcodes_h_l1410_c7_6431_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1410_c7_6431_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1410_c7_6431_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1410_c7_6431_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1410_c7_6431]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_6431_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_6431_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_6431_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_6431_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1410_c7_6431]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_6431_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_6431_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_6431_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_6431_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1410_c7_6431]
signal result_u16_value_MUX_uxn_opcodes_h_l1410_c7_6431_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1410_c7_6431_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1410_c7_6431_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1410_c7_6431_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1410_c7_6431]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_6431_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_6431_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_6431_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_6431_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1410_c7_6431]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_6431_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_6431_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_6431_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_6431_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1410_c7_6431]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_6431_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_6431_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_6431_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_6431_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1410_c7_6431]
signal result_u8_value_MUX_uxn_opcodes_h_l1410_c7_6431_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1410_c7_6431_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1410_c7_6431_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1410_c7_6431_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1410_c7_6431]
signal tmp16_MUX_uxn_opcodes_h_l1410_c7_6431_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1410_c7_6431_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1410_c7_6431_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1410_c7_6431_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1413_c11_15cc]
signal BIN_OP_EQ_uxn_opcodes_h_l1413_c11_15cc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1413_c11_15cc_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1413_c11_15cc_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1413_c7_f448]
signal t8_MUX_uxn_opcodes_h_l1413_c7_f448_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1413_c7_f448_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1413_c7_f448_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1413_c7_f448_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1413_c7_f448]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_f448_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_f448_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_f448_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_f448_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1413_c7_f448]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_f448_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_f448_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_f448_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_f448_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1413_c7_f448]
signal result_u16_value_MUX_uxn_opcodes_h_l1413_c7_f448_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1413_c7_f448_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1413_c7_f448_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1413_c7_f448_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1413_c7_f448]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_f448_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_f448_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_f448_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_f448_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1413_c7_f448]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_f448_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_f448_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_f448_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_f448_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1413_c7_f448]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_f448_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_f448_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_f448_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_f448_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1413_c7_f448]
signal result_u8_value_MUX_uxn_opcodes_h_l1413_c7_f448_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1413_c7_f448_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1413_c7_f448_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1413_c7_f448_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1413_c7_f448]
signal tmp16_MUX_uxn_opcodes_h_l1413_c7_f448_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1413_c7_f448_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1413_c7_f448_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1413_c7_f448_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1416_c30_8120]
signal sp_relative_shift_uxn_opcodes_h_l1416_c30_8120_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1416_c30_8120_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1416_c30_8120_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1416_c30_8120_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1419_c11_130e]
signal BIN_OP_EQ_uxn_opcodes_h_l1419_c11_130e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1419_c11_130e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1419_c11_130e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1419_c7_529a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_529a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_529a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_529a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_529a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1419_c7_529a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_529a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_529a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_529a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_529a_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1419_c7_529a]
signal result_u16_value_MUX_uxn_opcodes_h_l1419_c7_529a_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1419_c7_529a_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1419_c7_529a_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1419_c7_529a_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1419_c7_529a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_529a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_529a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_529a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_529a_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1419_c7_529a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_529a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_529a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_529a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_529a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1419_c7_529a]
signal result_u8_value_MUX_uxn_opcodes_h_l1419_c7_529a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1419_c7_529a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1419_c7_529a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1419_c7_529a_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1419_c7_529a]
signal tmp16_MUX_uxn_opcodes_h_l1419_c7_529a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1419_c7_529a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1419_c7_529a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1419_c7_529a_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1421_c33_c14b]
signal BIN_OP_PLUS_uxn_opcodes_h_l1421_c33_c14b_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1421_c33_c14b_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1421_c33_c14b_return_output : unsigned(8 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1423_c11_5603]
signal BIN_OP_EQ_uxn_opcodes_h_l1423_c11_5603_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1423_c11_5603_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1423_c11_5603_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1423_c7_ce87]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_ce87_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_ce87_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_ce87_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_ce87_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1423_c7_ce87]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_ce87_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_ce87_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_ce87_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_ce87_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1423_c7_ce87]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_ce87_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_ce87_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_ce87_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_ce87_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1423_c7_ce87]
signal result_u8_value_MUX_uxn_opcodes_h_l1423_c7_ce87_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1423_c7_ce87_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1423_c7_ce87_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1423_c7_ce87_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1423_c7_ce87]
signal tmp16_MUX_uxn_opcodes_h_l1423_c7_ce87_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1423_c7_ce87_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1423_c7_ce87_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1423_c7_ce87_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1425_c3_b462]
signal CONST_SL_8_uxn_opcodes_h_l1425_c3_b462_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1425_c3_b462_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1427_c11_31dc]
signal BIN_OP_EQ_uxn_opcodes_h_l1427_c11_31dc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1427_c11_31dc_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1427_c11_31dc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1427_c7_b26f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_b26f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_b26f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_b26f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_b26f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1427_c7_b26f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_b26f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_b26f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_b26f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_b26f_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1427_c7_b26f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_b26f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_b26f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_b26f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_b26f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1427_c7_b26f]
signal result_u8_value_MUX_uxn_opcodes_h_l1427_c7_b26f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1427_c7_b26f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1427_c7_b26f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1427_c7_b26f_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1427_c7_b26f]
signal tmp16_MUX_uxn_opcodes_h_l1427_c7_b26f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1427_c7_b26f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1427_c7_b26f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1427_c7_b26f_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1428_c3_80f7]
signal BIN_OP_OR_uxn_opcodes_h_l1428_c3_80f7_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1428_c3_80f7_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1428_c3_80f7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1433_c11_4b8d]
signal BIN_OP_EQ_uxn_opcodes_h_l1433_c11_4b8d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1433_c11_4b8d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1433_c11_4b8d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1433_c7_fcb3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_fcb3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_fcb3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_fcb3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_fcb3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1433_c7_fcb3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_fcb3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_fcb3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_fcb3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_fcb3_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1433_c7_fcb3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_fcb3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_fcb3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_fcb3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_fcb3_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1433_c7_fcb3]
signal result_u8_value_MUX_uxn_opcodes_h_l1433_c7_fcb3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1433_c7_fcb3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1433_c7_fcb3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1433_c7_fcb3_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1435_c31_43c7]
signal CONST_SR_8_uxn_opcodes_h_l1435_c31_43c7_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1435_c31_43c7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1437_c11_f055]
signal BIN_OP_EQ_uxn_opcodes_h_l1437_c11_f055_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1437_c11_f055_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1437_c11_f055_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1437_c7_5f5c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_5f5c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_5f5c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_5f5c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_5f5c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1437_c7_5f5c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_5f5c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_5f5c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_5f5c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_5f5c_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_856e( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_opc_done := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.u16_value := ref_toks_3;
      base.stack_address_sp_offset := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.u8_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1405_c6_98bc
BIN_OP_EQ_uxn_opcodes_h_l1405_c6_98bc : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1405_c6_98bc_left,
BIN_OP_EQ_uxn_opcodes_h_l1405_c6_98bc_right,
BIN_OP_EQ_uxn_opcodes_h_l1405_c6_98bc_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_65ab
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_65ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_65ab_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_65ab_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_65ab_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_65ab_return_output);

-- t8_MUX_uxn_opcodes_h_l1405_c2_f4a1
t8_MUX_uxn_opcodes_h_l1405_c2_f4a1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1405_c2_f4a1_cond,
t8_MUX_uxn_opcodes_h_l1405_c2_f4a1_iftrue,
t8_MUX_uxn_opcodes_h_l1405_c2_f4a1_iffalse,
t8_MUX_uxn_opcodes_h_l1405_c2_f4a1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_f4a1
result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_f4a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_f4a1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_f4a1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_f4a1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_f4a1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_f4a1
result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_f4a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_f4a1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_f4a1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_f4a1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_f4a1_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1405_c2_f4a1
result_u16_value_MUX_uxn_opcodes_h_l1405_c2_f4a1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1405_c2_f4a1_cond,
result_u16_value_MUX_uxn_opcodes_h_l1405_c2_f4a1_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1405_c2_f4a1_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1405_c2_f4a1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_f4a1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_f4a1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_f4a1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_f4a1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_f4a1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_f4a1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_f4a1
result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_f4a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_f4a1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_f4a1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_f4a1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_f4a1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_f4a1
result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_f4a1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_f4a1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_f4a1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_f4a1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_f4a1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1405_c2_f4a1
result_u8_value_MUX_uxn_opcodes_h_l1405_c2_f4a1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1405_c2_f4a1_cond,
result_u8_value_MUX_uxn_opcodes_h_l1405_c2_f4a1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1405_c2_f4a1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1405_c2_f4a1_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1405_c2_f4a1
tmp16_MUX_uxn_opcodes_h_l1405_c2_f4a1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1405_c2_f4a1_cond,
tmp16_MUX_uxn_opcodes_h_l1405_c2_f4a1_iftrue,
tmp16_MUX_uxn_opcodes_h_l1405_c2_f4a1_iffalse,
tmp16_MUX_uxn_opcodes_h_l1405_c2_f4a1_return_output);

-- printf_uxn_opcodes_h_l1406_c3_7e5a_uxn_opcodes_h_l1406_c3_7e5a
printf_uxn_opcodes_h_l1406_c3_7e5a_uxn_opcodes_h_l1406_c3_7e5a : entity work.printf_uxn_opcodes_h_l1406_c3_7e5a_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1406_c3_7e5a_uxn_opcodes_h_l1406_c3_7e5a_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1410_c11_0abc
BIN_OP_EQ_uxn_opcodes_h_l1410_c11_0abc : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1410_c11_0abc_left,
BIN_OP_EQ_uxn_opcodes_h_l1410_c11_0abc_right,
BIN_OP_EQ_uxn_opcodes_h_l1410_c11_0abc_return_output);

-- t8_MUX_uxn_opcodes_h_l1410_c7_6431
t8_MUX_uxn_opcodes_h_l1410_c7_6431 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1410_c7_6431_cond,
t8_MUX_uxn_opcodes_h_l1410_c7_6431_iftrue,
t8_MUX_uxn_opcodes_h_l1410_c7_6431_iffalse,
t8_MUX_uxn_opcodes_h_l1410_c7_6431_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_6431
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_6431 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_6431_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_6431_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_6431_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_6431_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_6431
result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_6431 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_6431_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_6431_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_6431_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_6431_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1410_c7_6431
result_u16_value_MUX_uxn_opcodes_h_l1410_c7_6431 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1410_c7_6431_cond,
result_u16_value_MUX_uxn_opcodes_h_l1410_c7_6431_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1410_c7_6431_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1410_c7_6431_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_6431
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_6431 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_6431_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_6431_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_6431_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_6431_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_6431
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_6431 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_6431_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_6431_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_6431_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_6431_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_6431
result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_6431 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_6431_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_6431_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_6431_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_6431_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1410_c7_6431
result_u8_value_MUX_uxn_opcodes_h_l1410_c7_6431 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1410_c7_6431_cond,
result_u8_value_MUX_uxn_opcodes_h_l1410_c7_6431_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1410_c7_6431_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1410_c7_6431_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1410_c7_6431
tmp16_MUX_uxn_opcodes_h_l1410_c7_6431 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1410_c7_6431_cond,
tmp16_MUX_uxn_opcodes_h_l1410_c7_6431_iftrue,
tmp16_MUX_uxn_opcodes_h_l1410_c7_6431_iffalse,
tmp16_MUX_uxn_opcodes_h_l1410_c7_6431_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1413_c11_15cc
BIN_OP_EQ_uxn_opcodes_h_l1413_c11_15cc : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1413_c11_15cc_left,
BIN_OP_EQ_uxn_opcodes_h_l1413_c11_15cc_right,
BIN_OP_EQ_uxn_opcodes_h_l1413_c11_15cc_return_output);

-- t8_MUX_uxn_opcodes_h_l1413_c7_f448
t8_MUX_uxn_opcodes_h_l1413_c7_f448 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1413_c7_f448_cond,
t8_MUX_uxn_opcodes_h_l1413_c7_f448_iftrue,
t8_MUX_uxn_opcodes_h_l1413_c7_f448_iffalse,
t8_MUX_uxn_opcodes_h_l1413_c7_f448_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_f448
result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_f448 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_f448_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_f448_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_f448_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_f448_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_f448
result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_f448 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_f448_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_f448_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_f448_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_f448_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1413_c7_f448
result_u16_value_MUX_uxn_opcodes_h_l1413_c7_f448 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1413_c7_f448_cond,
result_u16_value_MUX_uxn_opcodes_h_l1413_c7_f448_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1413_c7_f448_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1413_c7_f448_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_f448
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_f448 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_f448_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_f448_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_f448_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_f448_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_f448
result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_f448 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_f448_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_f448_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_f448_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_f448_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_f448
result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_f448 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_f448_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_f448_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_f448_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_f448_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1413_c7_f448
result_u8_value_MUX_uxn_opcodes_h_l1413_c7_f448 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1413_c7_f448_cond,
result_u8_value_MUX_uxn_opcodes_h_l1413_c7_f448_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1413_c7_f448_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1413_c7_f448_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1413_c7_f448
tmp16_MUX_uxn_opcodes_h_l1413_c7_f448 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1413_c7_f448_cond,
tmp16_MUX_uxn_opcodes_h_l1413_c7_f448_iftrue,
tmp16_MUX_uxn_opcodes_h_l1413_c7_f448_iffalse,
tmp16_MUX_uxn_opcodes_h_l1413_c7_f448_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1416_c30_8120
sp_relative_shift_uxn_opcodes_h_l1416_c30_8120 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1416_c30_8120_ins,
sp_relative_shift_uxn_opcodes_h_l1416_c30_8120_x,
sp_relative_shift_uxn_opcodes_h_l1416_c30_8120_y,
sp_relative_shift_uxn_opcodes_h_l1416_c30_8120_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1419_c11_130e
BIN_OP_EQ_uxn_opcodes_h_l1419_c11_130e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1419_c11_130e_left,
BIN_OP_EQ_uxn_opcodes_h_l1419_c11_130e_right,
BIN_OP_EQ_uxn_opcodes_h_l1419_c11_130e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_529a
result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_529a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_529a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_529a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_529a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_529a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_529a
result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_529a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_529a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_529a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_529a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_529a_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1419_c7_529a
result_u16_value_MUX_uxn_opcodes_h_l1419_c7_529a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1419_c7_529a_cond,
result_u16_value_MUX_uxn_opcodes_h_l1419_c7_529a_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1419_c7_529a_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1419_c7_529a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_529a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_529a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_529a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_529a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_529a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_529a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_529a
result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_529a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_529a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_529a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_529a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_529a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1419_c7_529a
result_u8_value_MUX_uxn_opcodes_h_l1419_c7_529a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1419_c7_529a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1419_c7_529a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1419_c7_529a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1419_c7_529a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1419_c7_529a
tmp16_MUX_uxn_opcodes_h_l1419_c7_529a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1419_c7_529a_cond,
tmp16_MUX_uxn_opcodes_h_l1419_c7_529a_iftrue,
tmp16_MUX_uxn_opcodes_h_l1419_c7_529a_iffalse,
tmp16_MUX_uxn_opcodes_h_l1419_c7_529a_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1421_c33_c14b
BIN_OP_PLUS_uxn_opcodes_h_l1421_c33_c14b : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1421_c33_c14b_left,
BIN_OP_PLUS_uxn_opcodes_h_l1421_c33_c14b_right,
BIN_OP_PLUS_uxn_opcodes_h_l1421_c33_c14b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1423_c11_5603
BIN_OP_EQ_uxn_opcodes_h_l1423_c11_5603 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1423_c11_5603_left,
BIN_OP_EQ_uxn_opcodes_h_l1423_c11_5603_right,
BIN_OP_EQ_uxn_opcodes_h_l1423_c11_5603_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_ce87
result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_ce87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_ce87_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_ce87_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_ce87_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_ce87_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_ce87
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_ce87 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_ce87_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_ce87_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_ce87_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_ce87_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_ce87
result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_ce87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_ce87_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_ce87_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_ce87_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_ce87_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1423_c7_ce87
result_u8_value_MUX_uxn_opcodes_h_l1423_c7_ce87 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1423_c7_ce87_cond,
result_u8_value_MUX_uxn_opcodes_h_l1423_c7_ce87_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1423_c7_ce87_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1423_c7_ce87_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1423_c7_ce87
tmp16_MUX_uxn_opcodes_h_l1423_c7_ce87 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1423_c7_ce87_cond,
tmp16_MUX_uxn_opcodes_h_l1423_c7_ce87_iftrue,
tmp16_MUX_uxn_opcodes_h_l1423_c7_ce87_iffalse,
tmp16_MUX_uxn_opcodes_h_l1423_c7_ce87_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1425_c3_b462
CONST_SL_8_uxn_opcodes_h_l1425_c3_b462 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1425_c3_b462_x,
CONST_SL_8_uxn_opcodes_h_l1425_c3_b462_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1427_c11_31dc
BIN_OP_EQ_uxn_opcodes_h_l1427_c11_31dc : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1427_c11_31dc_left,
BIN_OP_EQ_uxn_opcodes_h_l1427_c11_31dc_right,
BIN_OP_EQ_uxn_opcodes_h_l1427_c11_31dc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_b26f
result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_b26f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_b26f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_b26f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_b26f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_b26f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_b26f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_b26f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_b26f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_b26f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_b26f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_b26f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_b26f
result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_b26f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_b26f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_b26f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_b26f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_b26f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1427_c7_b26f
result_u8_value_MUX_uxn_opcodes_h_l1427_c7_b26f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1427_c7_b26f_cond,
result_u8_value_MUX_uxn_opcodes_h_l1427_c7_b26f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1427_c7_b26f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1427_c7_b26f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1427_c7_b26f
tmp16_MUX_uxn_opcodes_h_l1427_c7_b26f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1427_c7_b26f_cond,
tmp16_MUX_uxn_opcodes_h_l1427_c7_b26f_iftrue,
tmp16_MUX_uxn_opcodes_h_l1427_c7_b26f_iffalse,
tmp16_MUX_uxn_opcodes_h_l1427_c7_b26f_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1428_c3_80f7
BIN_OP_OR_uxn_opcodes_h_l1428_c3_80f7 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1428_c3_80f7_left,
BIN_OP_OR_uxn_opcodes_h_l1428_c3_80f7_right,
BIN_OP_OR_uxn_opcodes_h_l1428_c3_80f7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1433_c11_4b8d
BIN_OP_EQ_uxn_opcodes_h_l1433_c11_4b8d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1433_c11_4b8d_left,
BIN_OP_EQ_uxn_opcodes_h_l1433_c11_4b8d_right,
BIN_OP_EQ_uxn_opcodes_h_l1433_c11_4b8d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_fcb3
result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_fcb3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_fcb3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_fcb3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_fcb3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_fcb3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_fcb3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_fcb3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_fcb3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_fcb3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_fcb3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_fcb3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_fcb3
result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_fcb3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_fcb3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_fcb3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_fcb3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_fcb3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1433_c7_fcb3
result_u8_value_MUX_uxn_opcodes_h_l1433_c7_fcb3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1433_c7_fcb3_cond,
result_u8_value_MUX_uxn_opcodes_h_l1433_c7_fcb3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1433_c7_fcb3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1433_c7_fcb3_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1435_c31_43c7
CONST_SR_8_uxn_opcodes_h_l1435_c31_43c7 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1435_c31_43c7_x,
CONST_SR_8_uxn_opcodes_h_l1435_c31_43c7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1437_c11_f055
BIN_OP_EQ_uxn_opcodes_h_l1437_c11_f055 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1437_c11_f055_left,
BIN_OP_EQ_uxn_opcodes_h_l1437_c11_f055_right,
BIN_OP_EQ_uxn_opcodes_h_l1437_c11_f055_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_5f5c
result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_5f5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_5f5c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_5f5c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_5f5c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_5f5c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_5f5c
result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_5f5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_5f5c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_5f5c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_5f5c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_5f5c_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1405_c6_98bc_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_65ab_return_output,
 t8_MUX_uxn_opcodes_h_l1405_c2_f4a1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_f4a1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_f4a1_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1405_c2_f4a1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_f4a1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_f4a1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_f4a1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1405_c2_f4a1_return_output,
 tmp16_MUX_uxn_opcodes_h_l1405_c2_f4a1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1410_c11_0abc_return_output,
 t8_MUX_uxn_opcodes_h_l1410_c7_6431_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_6431_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_6431_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1410_c7_6431_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_6431_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_6431_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_6431_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1410_c7_6431_return_output,
 tmp16_MUX_uxn_opcodes_h_l1410_c7_6431_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1413_c11_15cc_return_output,
 t8_MUX_uxn_opcodes_h_l1413_c7_f448_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_f448_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_f448_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1413_c7_f448_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_f448_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_f448_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_f448_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1413_c7_f448_return_output,
 tmp16_MUX_uxn_opcodes_h_l1413_c7_f448_return_output,
 sp_relative_shift_uxn_opcodes_h_l1416_c30_8120_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1419_c11_130e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_529a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_529a_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1419_c7_529a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_529a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_529a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1419_c7_529a_return_output,
 tmp16_MUX_uxn_opcodes_h_l1419_c7_529a_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1421_c33_c14b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1423_c11_5603_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_ce87_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_ce87_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_ce87_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1423_c7_ce87_return_output,
 tmp16_MUX_uxn_opcodes_h_l1423_c7_ce87_return_output,
 CONST_SL_8_uxn_opcodes_h_l1425_c3_b462_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1427_c11_31dc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_b26f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_b26f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_b26f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1427_c7_b26f_return_output,
 tmp16_MUX_uxn_opcodes_h_l1427_c7_b26f_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1428_c3_80f7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1433_c11_4b8d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_fcb3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_fcb3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_fcb3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1433_c7_fcb3_return_output,
 CONST_SR_8_uxn_opcodes_h_l1435_c31_43c7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1437_c11_f055_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_5f5c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_5f5c_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_98bc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_98bc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_98bc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_65ab_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_65ab_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_65ab_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_65ab_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1405_c2_f4a1_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1405_c2_f4a1_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1410_c7_6431_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1405_c2_f4a1_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1405_c2_f4a1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_f4a1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_f4a1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_6431_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_f4a1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_f4a1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_f4a1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_f4a1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_6431_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_f4a1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_f4a1_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1405_c2_f4a1_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1405_c2_f4a1_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_6431_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1405_c2_f4a1_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1405_c2_f4a1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_f4a1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1407_c3_50b7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_f4a1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_6431_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_f4a1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_f4a1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_f4a1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_f4a1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_6431_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_f4a1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_f4a1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_f4a1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_f4a1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_6431_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_f4a1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_f4a1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1405_c2_f4a1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1405_c2_f4a1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_6431_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1405_c2_f4a1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1405_c2_f4a1_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1405_c2_f4a1_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1405_c2_f4a1_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1410_c7_6431_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1405_c2_f4a1_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1405_c2_f4a1_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1406_c3_7e5a_uxn_opcodes_h_l1406_c3_7e5a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_0abc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_0abc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_0abc_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1410_c7_6431_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1410_c7_6431_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1413_c7_f448_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1410_c7_6431_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_6431_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_6431_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_f448_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_6431_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_6431_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_6431_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_f448_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_6431_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_6431_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_6431_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1413_c7_f448_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_6431_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_6431_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1411_c3_1a17 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_6431_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_f448_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_6431_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_6431_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_6431_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_f448_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_6431_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_6431_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_6431_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_f448_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_6431_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_6431_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_6431_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1413_c7_f448_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_6431_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1410_c7_6431_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1410_c7_6431_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1413_c7_f448_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1410_c7_6431_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_15cc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_15cc_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_15cc_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1413_c7_f448_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1413_c7_f448_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1413_c7_f448_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_f448_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_f448_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_529a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_f448_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_f448_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_f448_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_529a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_f448_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1413_c7_f448_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1413_c7_f448_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1419_c7_529a_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1413_c7_f448_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_f448_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_f448_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_529a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_f448_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_f448_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_f448_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_529a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_f448_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_f448_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_f448_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_f448_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1413_c7_f448_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1413_c7_f448_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_529a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1413_c7_f448_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1413_c7_f448_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1413_c7_f448_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1419_c7_529a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1413_c7_f448_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_8120_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_8120_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_8120_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_8120_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1417_c22_8831_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_130e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_130e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_130e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_529a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_529a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_ce87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_529a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_529a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_529a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_529a_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1419_c7_529a_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1419_c7_529a_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1419_c7_529a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_529a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_529a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_ce87_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_529a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_529a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_529a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_ce87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_529a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_529a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_529a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_ce87_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_529a_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1419_c7_529a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1419_c7_529a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1423_c7_ce87_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1419_c7_529a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1421_c33_c14b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1421_c33_c14b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1421_c33_c14b_return_output : unsigned(8 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1421_c22_e2c1_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_5603_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_5603_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_5603_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_ce87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_ce87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_b26f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_ce87_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_ce87_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_ce87_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_b26f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_ce87_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_ce87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_ce87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_b26f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_ce87_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_ce87_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_ce87_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1427_c7_b26f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_ce87_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1423_c7_ce87_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1423_c7_ce87_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1427_c7_b26f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1423_c7_ce87_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1425_c3_b462_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1425_c3_b462_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_31dc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_31dc_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_31dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_b26f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_b26f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_fcb3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_b26f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_b26f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1430_c3_d443 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_b26f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_fcb3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_b26f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_b26f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_b26f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_fcb3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_b26f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1427_c7_b26f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1427_c7_b26f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1433_c7_fcb3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1427_c7_b26f_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1427_c7_b26f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1427_c7_b26f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1427_c7_b26f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1428_c3_80f7_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1428_c3_80f7_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1428_c3_80f7_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1431_c21_ebb5_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c11_4b8d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c11_4b8d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c11_4b8d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_fcb3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_fcb3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_5f5c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_fcb3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_fcb3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1434_c3_faf5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_fcb3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_fcb3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_fcb3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_fcb3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_5f5c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_fcb3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1433_c7_fcb3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1433_c7_fcb3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1433_c7_fcb3_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1435_c31_43c7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1435_c31_43c7_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1435_c21_172e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_f055_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_f055_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_f055_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_5f5c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_5f5c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_5f5c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_5f5c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_5f5c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_5f5c_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1419_l1410_l1405_DUPLICATE_5b1a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1419_l1410_l1405_DUPLICATE_3af0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1433_l1423_l1419_l1413_l1410_l1437_l1405_DUPLICATE_2360_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1410_l1413_l1405_DUPLICATE_ac9d_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1433_l1423_l1419_l1413_l1410_l1405_DUPLICATE_ec75_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1433_l1427_l1423_l1419_l1413_l1410_l1437_DUPLICATE_1461_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1419_l1433_l1423_l1413_DUPLICATE_3c8a_return_output : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1428_l1424_DUPLICATE_c652_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_856e_uxn_opcodes_h_l1442_l1400_DUPLICATE_2c87_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_5603_right := to_unsigned(4, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_b26f_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_0abc_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_5f5c_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1411_c3_1a17 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_6431_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1411_c3_1a17;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_f448_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_130e_right := to_unsigned(3, 2);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1421_c33_c14b_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_f055_right := to_unsigned(7, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_8120_y := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c11_4b8d_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_98bc_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1434_c3_faf5 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_fcb3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1434_c3_faf5;
     VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_8120_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_31dc_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_f4a1_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_529a_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1430_c3_d443 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_b26f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1430_c3_d443;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_5f5c_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1407_c3_50b7 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_f4a1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1407_c3_50b7;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_15cc_right := to_unsigned(2, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_65ab_iffalse := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_65ab_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_8120_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_98bc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_0abc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_15cc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_130e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_5603_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_31dc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c11_4b8d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_f055_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l1413_c7_f448_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1421_c33_c14b_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1405_c2_f4a1_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1410_c7_6431_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1413_c7_f448_iffalse := t8;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1428_c3_80f7_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1435_c31_43c7_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1405_c2_f4a1_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1410_c7_6431_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1413_c7_f448_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1419_c7_529a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1427_c7_b26f_iffalse := tmp16;
     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1419_l1410_l1405_DUPLICATE_3af0 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1419_l1410_l1405_DUPLICATE_3af0_return_output := result.u16_value;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1433_l1423_l1419_l1413_l1410_l1405_DUPLICATE_ec75 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1433_l1423_l1419_l1413_l1410_l1405_DUPLICATE_ec75_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1437_c11_f055] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1437_c11_f055_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_f055_left;
     BIN_OP_EQ_uxn_opcodes_h_l1437_c11_f055_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_f055_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_f055_return_output := BIN_OP_EQ_uxn_opcodes_h_l1437_c11_f055_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1421_c33_c14b] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1421_c33_c14b_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1421_c33_c14b_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1421_c33_c14b_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1421_c33_c14b_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1421_c33_c14b_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1421_c33_c14b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1419_l1410_l1405_DUPLICATE_5b1a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1419_l1410_l1405_DUPLICATE_5b1a_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1413_c11_15cc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1413_c11_15cc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_15cc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1413_c11_15cc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_15cc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_15cc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1413_c11_15cc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1419_c11_130e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1419_c11_130e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_130e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1419_c11_130e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_130e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_130e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1419_c11_130e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1433_l1427_l1423_l1419_l1413_l1410_l1437_DUPLICATE_1461 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1433_l1427_l1423_l1419_l1413_l1410_l1437_DUPLICATE_1461_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1405_c6_98bc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1405_c6_98bc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_98bc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1405_c6_98bc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_98bc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_98bc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1405_c6_98bc_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1419_l1433_l1423_l1413_DUPLICATE_3c8a LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1419_l1433_l1423_l1413_DUPLICATE_3c8a_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1433_l1423_l1419_l1413_l1410_l1437_l1405_DUPLICATE_2360 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1433_l1423_l1419_l1413_l1410_l1437_l1405_DUPLICATE_2360_return_output := result.is_stack_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1428_l1424_DUPLICATE_c652 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1428_l1424_DUPLICATE_c652_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1417_c22_8831] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1417_c22_8831_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1423_c11_5603] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1423_c11_5603_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_5603_left;
     BIN_OP_EQ_uxn_opcodes_h_l1423_c11_5603_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_5603_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_5603_return_output := BIN_OP_EQ_uxn_opcodes_h_l1423_c11_5603_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1433_c11_4b8d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1433_c11_4b8d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c11_4b8d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1433_c11_4b8d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c11_4b8d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c11_4b8d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1433_c11_4b8d_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1410_l1413_l1405_DUPLICATE_ac9d LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1410_l1413_l1405_DUPLICATE_ac9d_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1427_c11_31dc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1427_c11_31dc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_31dc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1427_c11_31dc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_31dc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_31dc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1427_c11_31dc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1410_c11_0abc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1410_c11_0abc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_0abc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1410_c11_0abc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_0abc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_0abc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1410_c11_0abc_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1435_c31_43c7] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1435_c31_43c7_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1435_c31_43c7_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1435_c31_43c7_return_output := CONST_SR_8_uxn_opcodes_h_l1435_c31_43c7_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1416_c30_8120] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1416_c30_8120_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_8120_ins;
     sp_relative_shift_uxn_opcodes_h_l1416_c30_8120_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_8120_x;
     sp_relative_shift_uxn_opcodes_h_l1416_c30_8120_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_8120_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_8120_return_output := sp_relative_shift_uxn_opcodes_h_l1416_c30_8120_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_65ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_98bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_f4a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_98bc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_f4a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_98bc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_f4a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_98bc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_f4a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_98bc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_f4a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_98bc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1405_c2_f4a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_98bc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1405_c2_f4a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_98bc_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1405_c2_f4a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_98bc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1405_c2_f4a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_98bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_6431_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_0abc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_6431_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_0abc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_6431_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_0abc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_6431_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_0abc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_6431_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_0abc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_6431_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_0abc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_6431_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_0abc_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1410_c7_6431_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_0abc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1410_c7_6431_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_0abc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_f448_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_15cc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_f448_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_15cc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_f448_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_15cc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_f448_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_15cc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_f448_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_15cc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1413_c7_f448_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_15cc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1413_c7_f448_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_15cc_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1413_c7_f448_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_15cc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1413_c7_f448_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_15cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_529a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_130e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_529a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_130e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_529a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_130e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_529a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_130e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1419_c7_529a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_130e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_529a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_130e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1419_c7_529a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_130e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_ce87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_5603_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_ce87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_5603_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_ce87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_5603_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_ce87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_5603_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1423_c7_ce87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_5603_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_b26f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_31dc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_b26f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_31dc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_b26f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_31dc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1427_c7_b26f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_31dc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1427_c7_b26f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_31dc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_fcb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c11_4b8d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_fcb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c11_4b8d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_fcb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c11_4b8d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1433_c7_fcb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c11_4b8d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_5f5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_f055_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_5f5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_f055_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1413_c7_f448_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1417_c22_8831_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1428_c3_80f7_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1428_l1424_DUPLICATE_c652_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1425_c3_b462_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1428_l1424_DUPLICATE_c652_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_f4a1_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1410_l1413_l1405_DUPLICATE_ac9d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_6431_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1410_l1413_l1405_DUPLICATE_ac9d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_f448_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1410_l1413_l1405_DUPLICATE_ac9d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1405_c2_f4a1_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1419_l1410_l1405_DUPLICATE_3af0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_6431_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1419_l1410_l1405_DUPLICATE_3af0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1419_c7_529a_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1419_l1410_l1405_DUPLICATE_3af0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_6431_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1433_l1427_l1423_l1419_l1413_l1410_l1437_DUPLICATE_1461_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_f448_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1433_l1427_l1423_l1419_l1413_l1410_l1437_DUPLICATE_1461_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_529a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1433_l1427_l1423_l1419_l1413_l1410_l1437_DUPLICATE_1461_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_ce87_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1433_l1427_l1423_l1419_l1413_l1410_l1437_DUPLICATE_1461_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_b26f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1433_l1427_l1423_l1419_l1413_l1410_l1437_DUPLICATE_1461_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_fcb3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1433_l1427_l1423_l1419_l1413_l1410_l1437_DUPLICATE_1461_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_5f5c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1433_l1427_l1423_l1419_l1413_l1410_l1437_DUPLICATE_1461_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_f4a1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1419_l1410_l1405_DUPLICATE_5b1a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_6431_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1419_l1410_l1405_DUPLICATE_5b1a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_529a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1419_l1410_l1405_DUPLICATE_5b1a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_f4a1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1433_l1423_l1419_l1413_l1410_l1437_l1405_DUPLICATE_2360_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_6431_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1433_l1423_l1419_l1413_l1410_l1437_l1405_DUPLICATE_2360_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_f448_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1433_l1423_l1419_l1413_l1410_l1437_l1405_DUPLICATE_2360_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_529a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1433_l1423_l1419_l1413_l1410_l1437_l1405_DUPLICATE_2360_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_ce87_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1433_l1423_l1419_l1413_l1410_l1437_l1405_DUPLICATE_2360_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_fcb3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1433_l1423_l1419_l1413_l1410_l1437_l1405_DUPLICATE_2360_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_5f5c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1433_l1423_l1419_l1413_l1410_l1437_l1405_DUPLICATE_2360_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_f448_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1419_l1433_l1423_l1413_DUPLICATE_3c8a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_529a_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1419_l1433_l1423_l1413_DUPLICATE_3c8a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_ce87_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1419_l1433_l1423_l1413_DUPLICATE_3c8a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_fcb3_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1419_l1433_l1423_l1413_DUPLICATE_3c8a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1405_c2_f4a1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1433_l1423_l1419_l1413_l1410_l1405_DUPLICATE_ec75_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_6431_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1433_l1423_l1419_l1413_l1410_l1405_DUPLICATE_ec75_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1413_c7_f448_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1433_l1423_l1419_l1413_l1410_l1405_DUPLICATE_ec75_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_529a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1433_l1423_l1419_l1413_l1410_l1405_DUPLICATE_ec75_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_ce87_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1433_l1423_l1419_l1413_l1410_l1405_DUPLICATE_ec75_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1433_c7_fcb3_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1433_l1423_l1419_l1413_l1410_l1405_DUPLICATE_ec75_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_f448_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_8120_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1419_c7_529a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_529a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_529a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_529a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_529a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_529a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_529a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_529a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_529a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1413_c7_f448] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_f448_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_f448_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_f448_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_f448_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_f448_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_f448_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_f448_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_f448_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1405_c1_65ab] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_65ab_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_65ab_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_65ab_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_65ab_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_65ab_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_65ab_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_65ab_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_65ab_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1433_c7_fcb3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_fcb3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_fcb3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_fcb3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_fcb3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_fcb3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_fcb3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_fcb3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_fcb3_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1425_c3_b462] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1425_c3_b462_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1425_c3_b462_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1425_c3_b462_return_output := CONST_SL_8_uxn_opcodes_h_l1425_c3_b462_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1437_c7_5f5c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_5f5c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_5f5c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_5f5c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_5f5c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_5f5c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_5f5c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_5f5c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_5f5c_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1421_c22_e2c1] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1421_c22_e2c1_return_output := CAST_TO_uint16_t_uint9_t(
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1421_c33_c14b_return_output);

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1435_c21_172e] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1435_c21_172e_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1435_c31_43c7_return_output);

     -- t8_MUX[uxn_opcodes_h_l1413_c7_f448] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1413_c7_f448_cond <= VAR_t8_MUX_uxn_opcodes_h_l1413_c7_f448_cond;
     t8_MUX_uxn_opcodes_h_l1413_c7_f448_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1413_c7_f448_iftrue;
     t8_MUX_uxn_opcodes_h_l1413_c7_f448_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1413_c7_f448_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1413_c7_f448_return_output := t8_MUX_uxn_opcodes_h_l1413_c7_f448_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1437_c7_5f5c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_5f5c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_5f5c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_5f5c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_5f5c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_5f5c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_5f5c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_5f5c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_5f5c_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1428_c3_80f7] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1428_c3_80f7_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1428_c3_80f7_left;
     BIN_OP_OR_uxn_opcodes_h_l1428_c3_80f7_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1428_c3_80f7_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1428_c3_80f7_return_output := BIN_OP_OR_uxn_opcodes_h_l1428_c3_80f7_return_output;

     -- Submodule level 2
     VAR_tmp16_MUX_uxn_opcodes_h_l1427_c7_b26f_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1428_c3_80f7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1419_c7_529a_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1421_c22_e2c1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1433_c7_fcb3_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1435_c21_172e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1423_c7_ce87_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1425_c3_b462_return_output;
     VAR_printf_uxn_opcodes_h_l1406_c3_7e5a_uxn_opcodes_h_l1406_c3_7e5a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_65ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_fcb3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_5f5c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_f448_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_529a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_fcb3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_5f5c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_6431_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_f448_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_b26f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_fcb3_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1410_c7_6431_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1413_c7_f448_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1427_c7_b26f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1427_c7_b26f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1427_c7_b26f_cond;
     tmp16_MUX_uxn_opcodes_h_l1427_c7_b26f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1427_c7_b26f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1427_c7_b26f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1427_c7_b26f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1427_c7_b26f_return_output := tmp16_MUX_uxn_opcodes_h_l1427_c7_b26f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1413_c7_f448] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_f448_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_f448_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_f448_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_f448_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_f448_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_f448_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_f448_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_f448_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1427_c7_b26f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_b26f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_b26f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_b26f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_b26f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_b26f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_b26f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_b26f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_b26f_return_output;

     -- t8_MUX[uxn_opcodes_h_l1410_c7_6431] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1410_c7_6431_cond <= VAR_t8_MUX_uxn_opcodes_h_l1410_c7_6431_cond;
     t8_MUX_uxn_opcodes_h_l1410_c7_6431_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1410_c7_6431_iftrue;
     t8_MUX_uxn_opcodes_h_l1410_c7_6431_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1410_c7_6431_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1410_c7_6431_return_output := t8_MUX_uxn_opcodes_h_l1410_c7_6431_return_output;

     -- printf_uxn_opcodes_h_l1406_c3_7e5a[uxn_opcodes_h_l1406_c3_7e5a] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1406_c3_7e5a_uxn_opcodes_h_l1406_c3_7e5a_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1406_c3_7e5a_uxn_opcodes_h_l1406_c3_7e5a_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_u8_value_MUX[uxn_opcodes_h_l1433_c7_fcb3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1433_c7_fcb3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1433_c7_fcb3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1433_c7_fcb3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1433_c7_fcb3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1433_c7_fcb3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1433_c7_fcb3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1433_c7_fcb3_return_output := result_u8_value_MUX_uxn_opcodes_h_l1433_c7_fcb3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1433_c7_fcb3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_fcb3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_fcb3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_fcb3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_fcb3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_fcb3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_fcb3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_fcb3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_fcb3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1410_c7_6431] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_6431_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_6431_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_6431_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_6431_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_6431_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_6431_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_6431_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_6431_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1431_c21_ebb5] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1431_c21_ebb5_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l1428_c3_80f7_return_output);

     -- result_u16_value_MUX[uxn_opcodes_h_l1419_c7_529a] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1419_c7_529a_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1419_c7_529a_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1419_c7_529a_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1419_c7_529a_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1419_c7_529a_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1419_c7_529a_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1419_c7_529a_return_output := result_u16_value_MUX_uxn_opcodes_h_l1419_c7_529a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1433_c7_fcb3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_fcb3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_fcb3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_fcb3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_fcb3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_fcb3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_fcb3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_fcb3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_fcb3_return_output;

     -- Submodule level 3
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1427_c7_b26f_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1431_c21_ebb5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_b26f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_fcb3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_6431_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_f448_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_b26f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_fcb3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_f4a1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_6431_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_ce87_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_b26f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1413_c7_f448_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1419_c7_529a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1427_c7_b26f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1433_c7_fcb3_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1405_c2_f4a1_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1410_c7_6431_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1423_c7_ce87_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1427_c7_b26f_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1413_c7_f448] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1413_c7_f448_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1413_c7_f448_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1413_c7_f448_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1413_c7_f448_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1413_c7_f448_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1413_c7_f448_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1413_c7_f448_return_output := result_u16_value_MUX_uxn_opcodes_h_l1413_c7_f448_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1427_c7_b26f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1427_c7_b26f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1427_c7_b26f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1427_c7_b26f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1427_c7_b26f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1427_c7_b26f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1427_c7_b26f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1427_c7_b26f_return_output := result_u8_value_MUX_uxn_opcodes_h_l1427_c7_b26f_return_output;

     -- t8_MUX[uxn_opcodes_h_l1405_c2_f4a1] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1405_c2_f4a1_cond <= VAR_t8_MUX_uxn_opcodes_h_l1405_c2_f4a1_cond;
     t8_MUX_uxn_opcodes_h_l1405_c2_f4a1_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1405_c2_f4a1_iftrue;
     t8_MUX_uxn_opcodes_h_l1405_c2_f4a1_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1405_c2_f4a1_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1405_c2_f4a1_return_output := t8_MUX_uxn_opcodes_h_l1405_c2_f4a1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1423_c7_ce87] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_ce87_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_ce87_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_ce87_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_ce87_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_ce87_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_ce87_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_ce87_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_ce87_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1410_c7_6431] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_6431_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_6431_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_6431_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_6431_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_6431_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_6431_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_6431_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_6431_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1423_c7_ce87] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1423_c7_ce87_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1423_c7_ce87_cond;
     tmp16_MUX_uxn_opcodes_h_l1423_c7_ce87_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1423_c7_ce87_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1423_c7_ce87_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1423_c7_ce87_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1423_c7_ce87_return_output := tmp16_MUX_uxn_opcodes_h_l1423_c7_ce87_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1405_c2_f4a1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_f4a1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_f4a1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_f4a1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_f4a1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_f4a1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_f4a1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_f4a1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_f4a1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1427_c7_b26f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_b26f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_b26f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_b26f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_b26f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_b26f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_b26f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_b26f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_b26f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1427_c7_b26f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_b26f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_b26f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_b26f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_b26f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_b26f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_b26f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_b26f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_b26f_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_ce87_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_b26f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_f4a1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_6431_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_ce87_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_b26f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_529a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_ce87_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_6431_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1413_c7_f448_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_ce87_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1427_c7_b26f_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1405_c2_f4a1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1419_c7_529a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1423_c7_ce87_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1419_c7_529a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1419_c7_529a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1419_c7_529a_cond;
     tmp16_MUX_uxn_opcodes_h_l1419_c7_529a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1419_c7_529a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1419_c7_529a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1419_c7_529a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1419_c7_529a_return_output := tmp16_MUX_uxn_opcodes_h_l1419_c7_529a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1419_c7_529a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_529a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_529a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_529a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_529a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_529a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_529a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_529a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_529a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1423_c7_ce87] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_ce87_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_ce87_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_ce87_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_ce87_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_ce87_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_ce87_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_ce87_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_ce87_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1423_c7_ce87] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1423_c7_ce87_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_ce87_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1423_c7_ce87_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_ce87_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1423_c7_ce87_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_ce87_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_ce87_return_output := result_u8_value_MUX_uxn_opcodes_h_l1423_c7_ce87_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1410_c7_6431] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1410_c7_6431_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_6431_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1410_c7_6431_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_6431_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1410_c7_6431_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_6431_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_6431_return_output := result_u16_value_MUX_uxn_opcodes_h_l1410_c7_6431_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1423_c7_ce87] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_ce87_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_ce87_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_ce87_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_ce87_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_ce87_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_ce87_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_ce87_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_ce87_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1405_c2_f4a1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_f4a1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_f4a1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_f4a1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_f4a1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_f4a1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_f4a1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_f4a1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_f4a1_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_529a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_ce87_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_529a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_ce87_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_f448_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_529a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1405_c2_f4a1_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_6431_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_529a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_ce87_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1413_c7_f448_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1419_c7_529a_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1419_c7_529a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_529a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_529a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_529a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_529a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_529a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_529a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_529a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_529a_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1405_c2_f4a1] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1405_c2_f4a1_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1405_c2_f4a1_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1405_c2_f4a1_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1405_c2_f4a1_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1405_c2_f4a1_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1405_c2_f4a1_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1405_c2_f4a1_return_output := result_u16_value_MUX_uxn_opcodes_h_l1405_c2_f4a1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1419_c7_529a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_529a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_529a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_529a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_529a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_529a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_529a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_529a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_529a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1419_c7_529a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1419_c7_529a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_529a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1419_c7_529a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_529a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1419_c7_529a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_529a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_529a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1419_c7_529a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1413_c7_f448] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_f448_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_f448_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_f448_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_f448_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_f448_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_f448_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_f448_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_f448_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1413_c7_f448] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1413_c7_f448_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1413_c7_f448_cond;
     tmp16_MUX_uxn_opcodes_h_l1413_c7_f448_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1413_c7_f448_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1413_c7_f448_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1413_c7_f448_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1413_c7_f448_return_output := tmp16_MUX_uxn_opcodes_h_l1413_c7_f448_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_f448_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_529a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_f448_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_529a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_6431_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_f448_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1413_c7_f448_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_529a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1410_c7_6431_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1413_c7_f448_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1413_c7_f448] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_f448_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_f448_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_f448_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_f448_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_f448_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_f448_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_f448_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_f448_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1410_c7_6431] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1410_c7_6431_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1410_c7_6431_cond;
     tmp16_MUX_uxn_opcodes_h_l1410_c7_6431_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1410_c7_6431_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1410_c7_6431_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1410_c7_6431_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1410_c7_6431_return_output := tmp16_MUX_uxn_opcodes_h_l1410_c7_6431_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1410_c7_6431] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_6431_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_6431_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_6431_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_6431_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_6431_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_6431_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_6431_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_6431_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1413_c7_f448] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_f448_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_f448_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_f448_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_f448_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_f448_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_f448_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_f448_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_f448_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1413_c7_f448] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1413_c7_f448_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1413_c7_f448_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1413_c7_f448_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1413_c7_f448_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1413_c7_f448_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1413_c7_f448_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1413_c7_f448_return_output := result_u8_value_MUX_uxn_opcodes_h_l1413_c7_f448_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_6431_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_f448_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_6431_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_f448_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_f4a1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_6431_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_6431_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1413_c7_f448_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1405_c2_f4a1_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1410_c7_6431_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1410_c7_6431] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1410_c7_6431_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_6431_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1410_c7_6431_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_6431_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1410_c7_6431_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_6431_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_6431_return_output := result_u8_value_MUX_uxn_opcodes_h_l1410_c7_6431_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1410_c7_6431] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_6431_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_6431_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_6431_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_6431_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_6431_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_6431_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_6431_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_6431_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1405_c2_f4a1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_f4a1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_f4a1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_f4a1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_f4a1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_f4a1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_f4a1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_f4a1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_f4a1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1410_c7_6431] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_6431_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_6431_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_6431_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_6431_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_6431_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_6431_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_6431_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_6431_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1405_c2_f4a1] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1405_c2_f4a1_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1405_c2_f4a1_cond;
     tmp16_MUX_uxn_opcodes_h_l1405_c2_f4a1_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1405_c2_f4a1_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1405_c2_f4a1_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1405_c2_f4a1_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1405_c2_f4a1_return_output := tmp16_MUX_uxn_opcodes_h_l1405_c2_f4a1_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_f4a1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_6431_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_f4a1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_6431_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1405_c2_f4a1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_6431_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1405_c2_f4a1_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1405_c2_f4a1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1405_c2_f4a1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1405_c2_f4a1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1405_c2_f4a1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1405_c2_f4a1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1405_c2_f4a1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1405_c2_f4a1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1405_c2_f4a1_return_output := result_u8_value_MUX_uxn_opcodes_h_l1405_c2_f4a1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1405_c2_f4a1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_f4a1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_f4a1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_f4a1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_f4a1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_f4a1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_f4a1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_f4a1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_f4a1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1405_c2_f4a1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_f4a1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_f4a1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_f4a1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_f4a1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_f4a1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_f4a1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_f4a1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_f4a1_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_856e_uxn_opcodes_h_l1442_l1400_DUPLICATE_2c87 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_856e_uxn_opcodes_h_l1442_l1400_DUPLICATE_2c87_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_856e(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_f4a1_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_f4a1_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1405_c2_f4a1_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_f4a1_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_f4a1_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_f4a1_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1405_c2_f4a1_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_856e_uxn_opcodes_h_l1442_l1400_DUPLICATE_2c87_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_856e_uxn_opcodes_h_l1442_l1400_DUPLICATE_2c87_return_output;
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
